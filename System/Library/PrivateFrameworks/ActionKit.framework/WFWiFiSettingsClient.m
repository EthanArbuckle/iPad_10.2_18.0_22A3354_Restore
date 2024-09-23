@implementation WFWiFiSettingsClient

- (WFWiFiSettingsClient)initWithInterface:(id)a3
{
  id v6;
  WFWiFiSettingsClient *v7;
  WFWiFiSettingsClient *v8;
  WFWiFiSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWiFiSettingsClient.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interface"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFWiFiSettingsClient;
  v7 = -[WFWiFiSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interface, a3);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CWFInterface invalidate](self->_interface, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WFWiFiSettingsClient;
  -[WFWiFiSettingsClient dealloc](&v3, sel_dealloc);
}

- (id)networkName
{
  void *v2;
  void *v3;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)BSSID
{
  void *v2;
  void *v3;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BSSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)txRate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedLinkQualityMetric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "txRate");
  v5 = v4;

  if (v5 == 0.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)rxRate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedLinkQualityMetric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rxRate");
  v5 = v4;

  if (v5 == 0.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)RSSI
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "RSSI");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)noise
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "noise");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)hardwareMACAddress
{
  void *v2;
  void *v3;

  -[WFWiFiSettingsClient interface](self, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwareMACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)channel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFWiFiSettingsClient interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "channel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wifiStandard
{
  void *v3;
  int v4;
  id result;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[WFWiFiSettingsClient interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "PHYMode");

  if (v4 > 31)
  {
    if (v4 > 255)
    {
      switch(v4)
      {
        case 256:
          return CFSTR("802.11ax");
        case 512:
          return CFSTR("802.11be - Wi-Fi 7");
        case 1024:
          return CFSTR("802.11ax - Wi-Fi 6E");
      }
    }
    else
    {
      switch(v4)
      {
        case 32:
          return CFSTR("802.11a Turbo");
        case 64:
          return CFSTR("802.11g Turbo");
        case 128:
          return CFSTR("802.11ac");
      }
    }
LABEL_15:
    getWFBundledIntentsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WFWiFiSettingsClient interface](self, "interface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[WFWiFiSettingsClient wifiStandard]";
      v10 = 1024;
      v11 = objc_msgSend(v7, "PHYMode");
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_ERROR, "%s Unkown Wi-Fi PHYMode: %d", (uint8_t *)&v8, 0x12u);

    }
    return 0;
  }
  else
  {
    result = 0;
    switch(v4)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("Auto");
        break;
      case 2:
        result = CFSTR("802.11a");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        result = CFSTR("802.11b");
        break;
      case 8:
        result = CFSTR("802.11g");
        break;
      default:
        if (v4 != 16)
          goto LABEL_15;
        result = CFSTR("802.11n");
        break;
    }
  }
  return result;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[WFWiFiSettingsClient interface](self, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "powerOn");

  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFWiFiSettingsClient getStateWithCompletionHandler:]";
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Retrieved Wi-Fi state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, id);
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, id))a4;
  -[WFWiFiSettingsClient interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "powerOn");

  if (v8 == v4)
  {
    v11 = 0;
  }
  else
  {
    getWFBundledIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFWiFiSettingsClient setState:completionHandler:]";
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_INFO, "%s Set Wi-Fi state to %d", buf, 0x12u);
    }

    -[WFWiFiSettingsClient interface](self, "interface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v10, "setPower:error:", v4, &v12);
    v11 = v12;

  }
  v6[2](v6, v11);

}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getCWFInterfaceClass_softClass;
  v13 = getCWFInterfaceClass_softClass;
  if (!getCWFInterfaceClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getCWFInterfaceClass_block_invoke;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __getCWFInterfaceClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithServiceType:", 2);
  objc_msgSend(v7, "resume");
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInterface:", v7);
  v4[2](v4, v8, 0);

}

@end
