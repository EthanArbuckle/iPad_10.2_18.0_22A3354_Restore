@implementation APUIAirPlaySetupConfiguration

- (id)urlString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScheme:", CFSTR("airplay"));
  objc_msgSend(v3, "setHost:", CFSTR("setup"));
  -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1838];
    -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryItemWithName:value:", CFSTR("wid"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passphrase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD1838];
    -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "passphrase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryItemWithName:value:", CFSTR("wp"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "captivePortalBypassToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD1838];
    -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "captivePortalBypassToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queryItemWithName:value:", CFSTR("ca"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

  }
  -[APUIAirPlaySetupConfiguration broker](self, "broker");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "authToken");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD1838];
    -[APUIAirPlaySetupConfiguration broker](self, "broker");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "authToken");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "queryItemWithName:value:", CFSTR("bt"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

  }
  -[APUIAirPlaySetupConfiguration receiver](self, "receiver");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "authString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = (void *)MEMORY[0x24BDD1838];
    -[APUIAirPlaySetupConfiguration receiver](self, "receiver");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "authString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "queryItemWithName:value:", CFSTR("rp"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

  }
  -[APUIAirPlaySetupConfiguration receiver](self, "receiver");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "routeToReceiverAfterSetup");

  if (v36)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("rr"), CFSTR("1"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v37);

  }
  objc_msgSend(v3, "setQueryItems:", v4);
  objc_msgSend(v3, "string");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[APUIAirPlaySetupConfiguration wifi](self, "wifi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIAirPlaySetupConfiguration broker](self, "broker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIAirPlaySetupConfiguration receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SetupConfig<WiFi=%@|Broker=%@|Receiver=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (APUIAirPlaySetupConfigurationWiFi)wifi
{
  return self->_wifi;
}

- (void)setWifi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (APUIAirPlaySetupConfigurationDiscoveryBroker)broker
{
  return self->_broker;
}

- (void)setBroker:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (APUIAirPlaySetupConfigurationReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_broker, 0);
  objc_storeStrong((id *)&self->_wifi, 0);
}

@end
