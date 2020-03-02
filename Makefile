include .env

grafana:
	mkdir -p $@
	chown 104:104 -R $@
influxdb:
	mkdir -p $@

up: grafana influxdb
	docker-compose up --build --remove-orphans -d

logs:
	docker-compose logs -f --tail=100
.PHONY: logs
down:
	docker-compose down --remove-orphans

destroy:
	docker-compose down -v --remove-orphans
