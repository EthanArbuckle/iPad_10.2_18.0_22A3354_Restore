@implementation BCSWiFiConfigurationAction

- (BCSWiFiConfigurationAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6;
  id v7;
  BCSWiFiConfigurationAction *v8;
  BCSWiFiConfigurationAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v11.receiver = self;
  v11.super_class = (Class)BCSWiFiConfigurationAction;
  v8 = -[BCSAction initWithData:codePayload:](&v11, sel_initWithData_codePayload_, v6, v7);
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (id)localizedDefaultActionDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[BCSWiFiConfigurationAction _wiFiConfigurationData](self, "_wiFiConfigurationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    _BCSLocalizedString(CFSTR("Join “%@” Network"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24D788C60;
  }

  return v6;
}

- (id)debugDescriptionExtraInfoDictionary
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  int v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  -[BCSWiFiConfigurationAction _wiFiConfigurationData](self, "_wiFiConfigurationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssid");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "password");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isWEP");
  v6 = objc_msgSend(v2, "isHidden");
  v7 = &stru_24D788C60;
  if (v3)
    v8 = v3;
  else
    v8 = &stru_24D788C60;
  v15[0] = CFSTR("ssid");
  v15[1] = CFSTR("password");
  if (v4)
    v9 = v4;
  else
    v9 = &stru_24D788C60;
  v16[0] = v8;
  v16[1] = v9;
  v10 = CFSTR("false");
  v15[2] = CFSTR("isWEP");
  v15[3] = CFSTR("isHidden");
  if (v5)
    v11 = CFSTR("true");
  else
    v11 = CFSTR("false");
  if (v6)
    v10 = CFSTR("true");
  v16[2] = v11;
  v16[3] = v10;
  v15[4] = CFSTR("airplayPlayload");
  v12 = objc_msgSend(v2, "hasAirplayPayload");
  if (v12)
  {
    objc_msgSend(v2, "airplayBrokerID");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)

  return v13;
}

- (void)performDefaultAction
{
  -[BCSWiFiConfigurationAction performDefaultActionWithCompletionHandler:](self, "performDefaultActionWithCompletionHandler:", &__block_literal_global_13);
}

- (void)performDefaultActionWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  void (**v34)(id, void *);
  uint8_t buf[16];

  v4 = (void (**)(id, void *))a3;
  -[BCSWiFiConfigurationAction _wiFiConfigurationData](self, "_wiFiConfigurationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      -[BCSWiFiConfigurationAction performDefaultActionWithCompletionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSActionErrorDomain"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16);
    goto LABEL_20;
  }
  if (!-[BCSWiFiConfigurationAction _startAirplaySetupIfNeeded](self, "_startAirplaySetupIfNeeded"))
  {
    objc_msgSend(v5, "password");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "isWEP");
    v18 = objc_msgSend(v16, "length");
    v19 = objc_alloc((Class)getNEHotspotConfigurationClass());
    if (v18)
      v20 = objc_msgSend(v19, "initWithSSID:passphrase:isWEP:", v6, v16, v17);
    else
      v20 = objc_msgSend(v19, "initWithSSID:", v6);
    v21 = (void *)v20;
    if (objc_msgSend(v5, "isHidden"))
      objc_msgSend(v21, "setHidden:", 1);
    if (v21)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSWiFiConfigurationAction: applying wifi configuration", buf, 2u);
      }
      objc_msgSend(getNEHotspotConfigurationManagerClass(), "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke;
      v33[3] = &unk_24D787850;
      v34 = v4;
      objc_msgSend(v22, "applyConfiguration:completionHandler:", v21, v33);

      +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logBarcodeActivatedEventForAction:", self);

      v24 = v34;
    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v25)
        -[BCSWiFiConfigurationAction performDefaultActionWithCompletionHandler:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSActionErrorDomain"), 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v24);
    }

LABEL_20:
    goto LABEL_21;
  }
  +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logBarcodeActivatedEventForAction:", self);

  v4[2](v4, 0);
LABEL_21:

}

void __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "code") == 13 || objc_msgSend(v4, "code") == 7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_2(v4);
    if (objc_msgSend(v4, "code") == 3 || objc_msgSend(v4, "code") == 2)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 1;
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 2;
    }
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("BCSActionErrorDomain"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
}

- (BOOL)_startAirplaySetupIfNeeded
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  -[BCSWiFiConfigurationAction _wiFiConfigurationData](self, "_wiFiConfigurationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasAirplayPayload") && _bcs_airplayInWifiEnabled())
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v3 = (void *)getAPUIAirPlaySetupConfigurationWiFiClass_softClass;
    v32 = getAPUIAirPlaySetupConfigurationWiFiClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationWiFiClass_softClass)
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke;
      v27 = &unk_24D787158;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke((uint64_t)&v24);
      v3 = (void *)v30[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v29, 8);
    v5 = objc_alloc_init(v4);
    objc_msgSend(v2, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSSID:", v6);

    objc_msgSend(v2, "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPassphrase:", v7);

    objc_msgSend(v2, "captivePortalToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCaptivePortalBypassToken:", v8);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v9 = (void *)getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass;
    v32 = getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass)
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke;
      v27 = &unk_24D787158;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke((uint64_t)&v24);
      v9 = (void *)v30[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v29, 8);
    v11 = objc_alloc_init(v10);
    objc_msgSend(v2, "airplayBrokerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAuthToken:", v12);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v13 = (void *)getAPUIAirPlaySetupConfigurationReceiverClass_softClass;
    v32 = getAPUIAirPlaySetupConfigurationReceiverClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationReceiverClass_softClass)
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke;
      v27 = &unk_24D787158;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke((uint64_t)&v24);
      v13 = (void *)v30[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v29, 8);
    v15 = objc_alloc_init(v14);
    objc_msgSend(v2, "airplayBrokerPin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAuthString:", v16);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v17 = (void *)getAPUIAirPlaySetupConfigurationClass_softClass;
    v32 = getAPUIAirPlaySetupConfigurationClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationClass_softClass)
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationClass_block_invoke;
      v27 = &unk_24D787158;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationClass_block_invoke((uint64_t)&v24);
      v17 = (void *)v30[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v29, 8);
    v19 = objc_alloc_init(v18);
    objc_msgSend(v19, "setWifi:", v5);
    objc_msgSend(v19, "setBroker:", v11);
    objc_msgSend(v19, "setReceiver:", v15);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v20 = (void *)getAPUIAirPlaySetupFlowLauncherClass_softClass;
    v32 = getAPUIAirPlaySetupFlowLauncherClass_softClass;
    if (!getAPUIAirPlaySetupFlowLauncherClass_softClass)
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupFlowLauncherClass_block_invoke;
      v27 = &unk_24D787158;
      v28 = &v29;
      __getAPUIAirPlaySetupFlowLauncherClass_block_invoke((uint64_t)&v24);
      v20 = (void *)v30[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v29, 8);
    v22 = objc_msgSend(v21, "launchAirPlayAutomaticSetupFlowWithConfiguration:", v19);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)actionPickerItems
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  BCSWiFiConfigurationActionPickerItem *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  _BCSLocalizedString(CFSTR("Join Network"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSWiFiConfigurationAction _wiFiConfigurationData](self, "_wiFiConfigurationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAirplayPayload");

  if (v5)
  {
    _BCSLocalizedString(CFSTR("Connect TV"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v7 = -[BCSActionPickerItem initWithLabel:action:]([BCSWiFiConfigurationActionPickerItem alloc], "initWithLabel:action:", v3, self);
  -[BCSWiFiConfigurationAction actionIcon](self, "actionIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSWiFiConfigurationActionPickerItem setIcon:](v7, "setIcon:", v8);

  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isWiFiAction
{
  return 1;
}

- (id)actionIcon
{
  return (id)objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("wifi"));
}

- (void)performDefaultActionWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationAction: Action is either not actionable or -determineActionabilityWithCompletionHandler has not been called", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)performDefaultActionWithCompletionHandler:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationAction: Error creating NEHotspotConfiguration", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BCSWiFiConfigurationAction: Successfully applied WiFi configuration", v0, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_2(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSWiFiConfigurationAction: Error applying WiFi configuration: %{public}@", (uint8_t *)&v2, 0xCu);

}

@end
