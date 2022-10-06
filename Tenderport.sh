#!/bin/bash
if [ ! $NODE_FOLDER ]; then
	read -p "TYPE NODE FOLDER(with point): " NODE_FOLDER
	echo 'export NODE_FOLDER='$NODE_FOLDER >> $HOME/.bash_profile
fi
if [ ! $V_PORT ]; then
	read -p "TYPE NODE's SUFFIX PORT: " V_PORT
	echo 'export V_PORT='$V_PORT >> $HOME/.bash_profile
fi
sed -i.bak -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:${V_PORT}658\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:${V_PORT}657\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:${V_PORT}060\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:${V_PORT}656\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":${V_PORT}660\"%" $HOME/$NODE_FOLDER/config/config.toml
sed -i.bak -e "s%^address = \"tcp://0.0.0.0:1317\"%address = \"tcp://0.0.0.0:${V_PORT}317\"%; s%^address = \":8080\"%address = \":${V_PORT}080\"%; s%^address = \"0.0.0.0:9090\"%address = \"0.0.0.0:${V_PORT}090\"%; s%^address = \"0.0.0.0:9091\"%address = \"0.0.0.0:${V_PORT}091\"%" $HOME/$NODE_FOLDER/config/app.toml
sed -i.bak -e "s%^node = \"tcp://localhost:26657\"%node = \"tcp://localhost:${V_PORT}657\"%" $HOME/$NODE_FOLDER/config/client.toml
