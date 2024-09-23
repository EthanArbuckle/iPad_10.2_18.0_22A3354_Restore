@implementation WirelessModemController

- (WirelessModemController)init
{
  WirelessModemController *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  int AppBooleanValue;
  BOOL v20;
  char v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *serialQueue;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)WirelessModemController;
  v2 = -[WirelessModemController init](&v26, sel_init);
  if (v2)
  {
    v2->_wifiClient = (__WiFiManagerClient *)WiFiManagerClientCreate();
    v2->_wifiIsWAPI = MGGetBoolAnswer();
    v2->_placardFeatureEnabled = _os_feature_enabled_impl();
    v3 = NSClassFromString(CFSTR("BTSPairController"));
    v2->_btPairControllerClass = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PreferenceBundles/BluetoothSettings.bundle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "load");

      v2->_btPairControllerClass = NSClassFromString(CFSTR("BTSPairController"));
    }
    v2->_btPairSetupClass = NSClassFromString(CFSTR("BTSPairSetup"));
    v2->_btSSPRequestClass = NSClassFromString(CFSTR("BTSSPPairingRequest"));
    v2->_btAlertClass = NSClassFromString(CFSTR("BTAlert"));
    v2->_btClassicDeviceClass = NSClassFromString(CFSTR("BTSDeviceClassic"));
    if (v2->_wifiClient)
    {
      v2->_wifiTetheringSupported = WiFiManagerClientIsTetheringSupported() != 0;
      v2->_personalHotspotModificationDisabled = WiFiManagerClientIsPersonalHotspotModificationDisabled() != 0;
      WiFiManagerClientCopyProperty();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v2->_showBandPreferenceUI = objc_msgSend(v5, "BOOLValue");
        WMSLogComponent();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[WirelessModemController init].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

      }
      if (!v2->_showBandPreferenceUI)
        v2->_showBandPreferenceUI = 1;

    }
    if (v2->_wifiTetheringSupported)
    {
      v15 = (void *)WiFiManagerClientCopyDevices();
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v2->_wifiDevice = (__WiFiDeviceClient *)objc_claimAutoreleasedReturnValue();
        CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop();
        v16 = objc_initWeak(&location, v2);
        WiFiDeviceClientRegisterPowerCallback();

        objc_destroyWeak(&location);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    CFPreferencesSynchronize(v18, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    LOBYTE(location) = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ShowBTPowerPrompt"), v18, (Boolean *)&location);
    if ((_BYTE)location)
      v20 = AppBooleanValue == 0;
    else
      v20 = 0;
    v21 = !v20;
    v2->_showBTPowerPrompt = v21;

  }
  v22 = dispatch_queue_create("com.apple.wirelessmodemsettings.phsettings-serial", 0);
  serialQueue = v2->_serialQueue;
  v2->_serialQueue = (OS_dispatch_queue *)v22;

  -[WirelessModemController setTitle:](v2, "setTitle:", &stru_24FDBBCF8);
  return v2;
}

- (void)applicationWillResign:(id)a3
{
  -[WirelessModemController terminateSearching:](self, "terminateSearching:", 0);
}

- (void)terminateSearching:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_wifiTetheringSupported)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__WirelessModemController_terminateSearching___block_invoke;
    v8[3] = &unk_24FDBB6A0;
    v8[4] = self;
    v9 = a3;
    dispatch_async(v5, v8);

  }
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDiscoverable:", 0);

  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConnectable:", 0);

  -[WirelessModemController cleanupPairing](self, "cleanupPairing");
}

uint64_t __46__WirelessModemController_terminateSearching___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setMISDiscoveryStateEnabled:effectiveImmediately:", 0, *(unsigned __int8 *)(a1 + 40));
}

- (void)viewDidLoad
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WirelessModemController;
  -[WirelessModemController viewDidLoad](&v3, sel_viewDidLoad);
  WMSUIEventDictionary(CFSTR("view-ph"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v2);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WirelessModemController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[WirelessModemController _unregisterAllNotificationObservers](self, "_unregisterAllNotificationObservers");
    -[WirelessModemController terminateSearching:](self, "terminateSearching:", 0);
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  -[WirelessModemController allowWirelessConnections:](self, "allowWirelessConnections:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WirelessModemController;
  -[WirelessModemController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[WirelessModemController _registerAllNotificationObservers](self, "_registerAllNotificationObservers");
  -[WirelessModemController allowWirelessConnections:](self, "allowWirelessConnections:", 1);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PersonalHotspot"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("Personal Hotspot"), 0, v6, v8);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[WirelessModemController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.personal-hotspot"), v9, MEMORY[0x24BDBD1A8], v4);

  }
}

- (void)dealloc
{
  __WiFiDeviceClient *wifiDevice;
  __WiFiManagerClient *wifiClient;
  objc_super v5;

  -[WirelessModemController _unregisterAllNotificationObservers](self, "_unregisterAllNotificationObservers");
  -[WirelessModemController allowWirelessConnections:](self, "allowWirelessConnections:", 0);
  if (self->_wifiTetheringSupported)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
  }
  -[UIAlertController dismissViewControllerAnimated:completion:](self->_powerAlert, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(self->_btSSPAlert, "dismiss");
  objc_msgSend(self->_btAlert, "dismiss");
  wifiDevice = self->_wifiDevice;
  if (wifiDevice)
    CFRelease(wifiDevice);
  wifiClient = self->_wifiClient;
  if (wifiClient)
    CFRelease(wifiClient);
  v5.receiver = self;
  v5.super_class = (Class)WirelessModemController;
  -[WirelessModemController dealloc](&v5, sel_dealloc);
}

- (void)_misStateChangedHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WirelessModemController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__WirelessModemController__misStateChangedHandler___block_invoke;
  v6[3] = &unk_24FDBB4D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __51__WirelessModemController__misStateChangedHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  id *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("State"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  v5 = *(id **)(a1 + 40);
  if (v4 > 0x3FD)
  {
    objc_msgSend(v5, "_updateTetheringText:", 0);
    objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1416));
  }
  else
  {
    objc_msgSend(v5[175], "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1544), "dismiss");
    objc_msgSend(*(id *)(a1 + 40), "cleanupPairing");
    objc_msgSend(*(id *)(a1 + 40), "rootController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (void)allowWirelessConnections:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!a3
    || (-[WirelessModemController view](self, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_isInAWindow"),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscoverable:", v3);

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConnectable:", v3);

    if (self->_wifiTetheringSupported)
      -[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:](self, "_setMISDiscoveryStateEnabled:effectiveImmediately:", v3, v3);
  }
}

- (void)_managedConfigurationChangedHandler:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WirelessModemController__managedConfigurationChangedHandler___block_invoke;
  block[3] = &unk_24FDBB6C8;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

uint64_t __63__WirelessModemController__managedConfigurationChangedHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePersonalHotspotModificationDisableState");
}

- (void)_updatePersonalHotspotModificationDisableState
{
  OUTLINED_FUNCTION_2(&dword_22FE37000, a2, a3, "%s: Personal Hotspot Modification is %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setPersonalHotspotModificationDisableState:(BOOL)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PSSpecifier *tetheringSwitchSpec;
  uint64_t v13;

  if (self->_personalHotspotModificationDisabled == a3)
  {
    WMSLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[WirelessModemController setPersonalHotspotModificationDisableState:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    self->_personalHotspotModificationDisabled = a3;
    tetheringSwitchSpec = self->_tetheringSwitchSpec;
    if (a3)
      v13 = MEMORY[0x24BDBD1C0];
    else
      v13 = MEMORY[0x24BDBD1C8];
    -[PSSpecifier setProperty:forKey:](tetheringSwitchSpec, "setProperty:forKey:", v13, *MEMORY[0x24BE75A18]);
    -[WirelessModemController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_tetheringSwitchSpec, 0);
  }
}

- (void)_registerAllNotificationObservers
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

  if (!self->_didRegisteredNotificationObservers)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillResign_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__misStateChangedHandler_, CFSTR("MISManagerStateChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__btPowerChangedHandler_, *MEMORY[0x24BE0F928], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__btPowerChangedHandler_, *MEMORY[0x24BE0F9C8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__btAuthenticationRequestHandler_, *MEMORY[0x24BE0F998], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__btDevicePairedHandler_, *MEMORY[0x24BE0F9A0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__btDevicePairedHandler_, *MEMORY[0x24BE0F9A8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__btAuthenticationRequestHandler_, *MEMORY[0x24BE0F9B8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__btAuthenticationRequestHandler_, *MEMORY[0x24BE0F9C0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__btAuthenticationRequestHandler_, *MEMORY[0x24BE0F9B0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__managedConfigurationChangedHandler_, *MEMORY[0x24BE63740], 0);

    self->_didRegisteredNotificationObservers = 1;
  }
}

- (void)_unregisterAllNotificationObservers
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_wifiDevice)
    WiFiDeviceClientRegisterPowerCallback();
  self->_didRegisteredNotificationObservers = 0;
}

- (void)_setMISDiscoveryStateEnabled:(BOOL)a3 effectiveImmediately:(BOOL)a4
{
  -[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:](self, "_setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:", a3, a4, 0);
}

- (void)_setMISDiscoveryStateEnabled:(BOOL)a3 effectiveImmediately:(BOOL)a4 forceBand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v14[2] = *MEMORY[0x24BDAC8D0];
  WMSLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:].cold.1(v7, v6, v8);

  v13[0] = CFSTR("SOFTAP_ENABLE");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("SOFTAP_IMMEDIATE_DISABLE");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SOFTAP_FORCE_2_4G_CHANNEL"));

    v11 = v12;
  }
  WiFiManagerClientSetMISDiscoveryStateExt();

}

- (void)_wiFiPowerChangedHandler
{
  NSObject *serialQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke;
  block[3] = &unk_24FDBB718;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_sync(serialQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD block[4];
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke_2;
  block[3] = &unk_24FDBB6F0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1393))
  {
    *(_BYTE *)(v2 + 1393) = 0;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392))
    {
      +[MISManager sharedManager](MISManager, "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setState:", 1023);

    }
  }
  if (WiFiDeviceClientGetPower())
    objc_msgSend(*(id *)(a1 + 32), "_setMISDiscoveryStateEnabled:effectiveImmediately:", 1, 0);
  objc_destroyWeak(&v5);
}

void __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTetheringText:", 0);

}

- (BOOL)_wiFiPower
{
  __WiFiDeviceClient *wifiDevice;

  if (self->_wifiTetheringSupported)
  {
    wifiDevice = self->_wifiDevice;
    if (wifiDevice)
      LOBYTE(wifiDevice) = WiFiDeviceClientGetPower() != 0;
  }
  else
  {
    LOBYTE(wifiDevice) = 0;
  }
  return (char)wifiDevice;
}

- (void)_setWiFiPassword:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (self->_wifiClient)
  {
    v6 = v4;
    v5 = v4;
    WiFiManagerClientSetMisPassword();
    v4 = v6;
  }

}

- (id)_wiFiPassword
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (!self->_wifiClient)
    goto LABEL_5;
  v3 = (void *)WiFiManagerClientCopyMisPassword();
  if (!objc_msgSend(v3, "length"))
  {
    +[WiFiPasswordController generateDefaultPassword](WiFiPasswordController, "generateDefaultPassword");
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[WirelessModemController _setWiFiPassword:](self, "_setWiFiPassword:", v4);
      WMSUIEventDictionary(CFSTR("generated-ph-password"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      WMSubmitUIEventMetric(v5);

      v3 = (void *)v4;
      return v3;
    }
LABEL_5:
    v3 = 0;
  }
  return v3;
}

- (void)setBandPreference:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  __CFString *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  WiFiManagerClientSetProperty();
  WMSLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[WirelessModemController setBandPreference:specifier:].cold.1(v6, v7);

  -[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:](self, "_setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:", 1, 1, v6);
  v8 = objc_msgSend(v5, "BOOLValue");

  if (v8)
    v9 = CFSTR("true");
  else
    v9 = CFSTR("false");
  WMSUIEventDictionary(CFSTR("toggle-ph-compatibility"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v10);

}

- (id)bandPreference
{
  void *v2;
  void *v3;

  v2 = (void *)WiFiManagerClientCopyProperty();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v2, "intValue") == 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_btPowerChangedHandler:(id)a3
{
  NSObject *serialQueue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WirelessModemController__btPowerChangedHandler___block_invoke;
  block[3] = &unk_24FDBB740;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_sync(serialQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__WirelessModemController__btPowerChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WirelessModemController__btPowerChangedHandler___block_invoke_2;
  block[3] = &unk_24FDBB6C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1392))
  {
    *(_BYTE *)(v2 + 1392) = 0;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1393))
    {
      +[MISManager sharedManager](MISManager, "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setState:", 1023);

    }
  }
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "powered");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "allowWirelessConnections:", 1);
  else
    objc_msgSend(WeakRetained, "cleanupPairing");

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1424);
  *(_QWORD *)(v8 + 1424) = 0;

}

uint64_t __50__WirelessModemController__btPowerChangedHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTetheringText:", 0);
}

- (void)_btAuthenticationRequestHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id btAlert;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  PSSpecifier *v28;
  PSSpecifier *currentDeviceSpecifier;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_btPairControllerClass && self->_btPairSetupClass && self->_btSSPRequestClass)
  {
    -[WirelessModemController rootController](self, "rootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0 || self->_btSSPAlert)
    {

      goto LABEL_7;
    }
    btAlert = self->_btAlert;

    if (btAlert)
    {
LABEL_7:
      WMSLogComponent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WirelessModemController _btAuthenticationRequestHandler:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
LABEL_9:

      goto LABEL_10;
    }
    if (!self->_waitingOnBTPower && !self->_currentDeviceSpecifier)
    {
      objc_msgSend(v5, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x24BE0F9C0];
      if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE0F9C0]))
      {

      }
      else
      {
        objc_msgSend(v5, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE0F9B0]);

        if (!v19)
        {
          objc_msgSend(v5, "object");
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      objc_msgSend(v5, "object");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("device"));
      v8 = objc_claimAutoreleasedReturnValue();

LABEL_19:
      WMSLogComponent();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject name](v8, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v61 = v57;
        v62 = 2112;
        v63 = v58;
        v64 = 2112;
        v65 = v59;
        _os_log_error_impl(&dword_22FE37000, v21, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", buf, 0x20u);

      }
      if (-[NSObject majorClass](v8, "majorClass") == 256
        && (objc_msgSend(v5, "userInfo"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v22, "valueForKey:", CFSTR("delayedPairingForNR")),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            v22,
            !v23))
      {
        WMSLogComponent();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[WirelessModemController _btAuthenticationRequestHandler:].cold.2(v42, v43, v44, v45, v46, v47, v48, v49);

        v50 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v5, "userInfo");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "dictionaryWithDictionary:", v51);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "setObject:forKeyedSubscript:", &stru_24FDBBCF8, CFSTR("delayedPairingForNR"));
        v52 = (void *)MEMORY[0x24BDD16C8];
        objc_msgSend(v5, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "object");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "notificationWithName:object:userInfo:", v34, v53, v30);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[WirelessModemController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__btAuthenticationRequestHandler_, v54, 1.0);

      }
      else
      {
        -[NSObject name](v8, "name");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        v26 = &stru_24FDBBCF8;
        if (v24)
          v26 = (__CFString *)v24;
        v27 = v26;

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, 0, 1, 0);
        v28 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        currentDeviceSpecifier = self->_currentDeviceSpecifier;
        self->_currentDeviceSpecifier = v28;

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(self->_btPairSetupClass);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE759F8]);

        NSStringFromClass(self->_btPairControllerClass);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE75C60]);

        objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("PSLinkCell"), *MEMORY[0x24BE75D08]);
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BE75D50]);

        -[NSObject address](v8, "address");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE75AC0]);

        -[PSSpecifier setProperties:](self->_currentDeviceSpecifier, "setProperties:", v30);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class deviceWithDevice:](self->_btClassicDeviceClass, "deviceWithDevice:", v8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("bt-device"));

        objc_msgSend(v34, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("reverse-pairing"));
        -[PSSpecifier setUserInfo:](self->_currentDeviceSpecifier, "setUserInfo:", v34);
        objc_msgSend(v5, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BE0F998]);

        if (v37)
        {
          -[WirelessModemController _btPinRequestHandler:](self, "_btPinRequestHandler:", v5);
        }
        else
        {
          objc_msgSend(v5, "name");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x24BE0F9B8]);

          if (v39)
          {
            -[WirelessModemController _btSSPConfirmationHandler:](self, "_btSSPConfirmationHandler:", v5);
          }
          else
          {
            objc_msgSend(v5, "name");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", v17);

            if (v41)
            {
              -[WirelessModemController _btSSPNumericComparisonHandler:](self, "_btSSPNumericComparisonHandler:", v5);
            }
            else
            {
              objc_msgSend(v5, "name");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "isEqualToString:", *MEMORY[0x24BE0F9B0]);

              if (v56)
                -[WirelessModemController _btSSPPasskeyDisplayHandler:](self, "_btSSPPasskeyDisplayHandler:", v5);
            }
          }
        }
      }

      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)_btPinRequestHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;

  v5 = a3;
  WMSLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[WirelessModemController _btPinRequestHandler:].cold.1(a2, v5, v6);

  v7 = objc_alloc_init(self->_btPairSetupClass);
  -[WirelessModemController setShowingSetupController:](self, "setShowingSetupController:", 1);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE757A0]));
  objc_msgSend(v7, "setRootController:", WeakRetained);

  objc_msgSend(v7, "setParentController:", self);
  objc_msgSend(v7, "setSpecifier:", self->_currentDeviceSpecifier);
  objc_storeWeak((id *)((char *)self->_currentDeviceSpecifier + (int)*MEMORY[0x24BE75768]), self);
  -[WirelessModemController showController:](self, "showController:", v7);

}

- (void)_btSSPConfirmationHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id btSSPAlert;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WMSLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_error_impl(&dword_22FE37000, v7, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v13, 0x20u);

  }
  v8 = (void *)objc_msgSend(objc_alloc(self->_btSSPRequestClass), "initWithDevice:andSpecifier:", v6, self->_currentDeviceSpecifier);
  btSSPAlert = self->_btSSPAlert;
  self->_btSSPAlert = v8;

  objc_msgSend(self->_btSSPAlert, "setPairingStyle:andPasskey:", 0, 0);
  objc_msgSend(self->_btSSPAlert, "setDelegate:", self);
  objc_msgSend(self->_btSSPAlert, "show");

}

- (void)_btSSPNumericComparisonHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id btSSPAlert;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WMSLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_error_impl(&dword_22FE37000, v9, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v15, 0x20u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(self->_btSSPRequestClass), "initWithDevice:andSpecifier:", v7, self->_currentDeviceSpecifier);
  btSSPAlert = self->_btSSPAlert;
  self->_btSSPAlert = v10;

  objc_msgSend(self->_btSSPAlert, "setPairingStyle:andPasskey:", 1, v8);
  objc_msgSend(self->_btSSPAlert, "setDelegate:", self);
  objc_msgSend(self->_btSSPAlert, "show");

}

- (void)_btSSPPasskeyDisplayHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id btSSPAlert;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WMSLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_error_impl(&dword_22FE37000, v9, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v15, 0x20u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(self->_btSSPRequestClass), "initWithDevice:andSpecifier:", v7, self->_currentDeviceSpecifier);
  btSSPAlert = self->_btSSPAlert;
  self->_btSSPAlert = v10;

  objc_msgSend(self->_btSSPAlert, "setPairingStyle:andPasskey:", 2, v8);
  objc_msgSend(self->_btSSPAlert, "setDelegate:", self);
  objc_msgSend(self->_btSSPAlert, "show");

}

- (void)_btDevicePairedHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id btAlert;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id btSSPAlert;
  void *v20;
  void *v21;
  char isKindOfClass;
  PSSpecifier *currentDeviceSpecifier;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("PIN-ended"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("PIN-ended"));

    objc_msgSend(v24, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE0F9A0]);

    if (v12)
    {
      if (!self->_btAlert)
      {
        v13 = (void *)objc_msgSend(objc_alloc(self->_btAlertClass), "initWithDevice:", v4);
        btAlert = self->_btAlert;
        self->_btAlert = v13;

        objc_msgSend(self->_btAlert, "setDelegate:", self);
        if (v9)
          goto LABEL_5;
        btSSPAlert = self->_btSSPAlert;
        if (btSSPAlert
          && objc_msgSend(btSSPAlert, "pairingStyle") != 2
          && objc_msgSend(self->_btSSPAlert, "pairingStyle") != 3)
        {
          goto LABEL_13;
        }
        -[WirelessModemController rootController](self, "rootController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "visibleViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_5:
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("entered")))
          {
            objc_msgSend(v24, "userInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE0F980]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
            -[WirelessModemController cleanupPairing](self, "cleanupPairing");
            objc_msgSend(self->_btAlert, "showAlertWithResult:", v18);

            goto LABEL_16;
          }
          v15 = (void *)MEMORY[0x24BDD16E0];
          v16 = 156;
        }
        else
        {
LABEL_13:
          v15 = (void *)MEMORY[0x24BDD16E0];
          v16 = 1;
        }
        objc_msgSend(v15, "numberWithUnsignedInt:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {
      -[WirelessModemController cleanupPairing](self, "cleanupPairing");
    }
LABEL_16:
    currentDeviceSpecifier = self->_currentDeviceSpecifier;
    self->_currentDeviceSpecifier = 0;

  }
}

- (void)alertSheetDismissed:(id)a3
{
  id btAlert;

  btAlert = self->_btAlert;
  self->_btAlert = 0;

}

- (void)cleanupPairing
{
  id btSSPAlert;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(self->_btSSPAlert, "dismiss");
  btSSPAlert = self->_btSSPAlert;
  self->_btSSPAlert = 0;

  -[WirelessModemController rootController](self, "rootController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WirelessModemController rootController](self, "rootController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performSelector:", sel_dismiss);

  }
}

- (id)internetTethering:(id)a3
{
  void *v3;
  int v5;

  v5 = 0;
  +[MISManager sharedManager](MISManager, "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getState:andReason:", &v5, 0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 == 1023);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setInternetTethering:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  BOOL v14;
  char v15;
  char v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 wifiIsWAPI;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  UIAlertController *v36;
  UIAlertController *powerAlert;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  UIAlertController *v53;
  UIAlertController *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UIAlertController *v65;
  UIAlertController *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id *v87;
  void *v88;
  uint64_t v89;
  _BOOL4 v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  void *v102;
  UIAlertController *v103;
  UIAlertController *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id *v133;
  id *v134;
  id v135;
  void *v136;
  void *v137;
  _QWORD v138[5];
  id v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[5];
  id v143;
  _QWORD v144[5];
  id v145;
  _QWORD v146[5];
  id v147;
  _QWORD v148[5];
  id v149;
  _QWORD v150[5];
  id v151;
  _QWORD v152[4];
  id v153;
  id location;
  int v155[3];

  v6 = a3;
  v7 = a4;
  v155[0] = 1022;
  v8 = objc_msgSend(v6, "BOOLValue");
  if (v8)
    v9 = 1023;
  else
    v9 = 1022;
  +[MISManager sharedManager](MISManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getState:andReason:", v155, 0);

  if (v155[0] == (_DWORD)v9)
    goto LABEL_60;
  if (v155[0] == 1022)
    v11 = v8;
  else
    v11 = 0;
  if (v11 == 1)
  {
    if ((objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "enabled"),
          v12,
          v14 = -[WirelessModemController _wiFiPower](self, "_wiFiPower"),
          v15 = v14,
          (v13 & 1) == 0)
      && self->_showBTPowerPrompt
      || self->_wifiTetheringSupported && (!self->_wifiDevice ? (v16 = 1) : (v16 = v14), (v16 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v20, *MEMORY[0x24BE75998]);

      -[WirelessModemController reloadSpecifier:](self, "reloadSpecifier:", v7);
      v135 = v7;
      if ((v13 & 1) != 0)
      {
        v129 = (void *)MEMORY[0x24BEBD3B0];
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_WF_OFF_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v22 = objc_claimAutoreleasedReturnValue();
        v124 = (void *)v22;
        wifiIsWAPI = self->_wifiIsWAPI;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v24;
        if (wifiIsWAPI)
          v25 = CFSTR("WIFI_CH");
        else
          v25 = CFSTR("WIFI");
        objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v22, v123);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_WF_OFF_MESSAGE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_wifiIsWAPI;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v30)
          v33 = CFSTR("WIFI_CH");
        else
          v33 = CFSTR("WIFI");
        objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", v29, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "alertControllerWithTitle:message:preferredStyle:", v26, v35, 1);
        v36 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
        powerAlert = self->_powerAlert;
        self->_powerAlert = v36;

        objc_initWeak(&location, self->_powerAlert);
        v38 = (void *)MEMORY[0x24BEBD3A8];
        v39 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_WF_OFF_CANCEL_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_wifiIsWAPI)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("WIFI_CH"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("WIFI"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        }
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", v41, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v140[0] = MEMORY[0x24BDAC760];
        v140[1] = 3221225472;
        v140[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_7;
        v140[3] = &unk_24FDBB768;
        objc_copyWeak(&v141, &location);
        objc_msgSend(v38, "actionWithTitle:style:handler:", v78, 1, v140);
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = (void *)MEMORY[0x24BEBD3A8];
        v80 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_WF_OFF_OK_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_wifiIsWAPI)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("WIFI_CH"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("WIFI"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        }
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "stringWithFormat:", v82, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v138[0] = MEMORY[0x24BDAC760];
        v138[1] = 3221225472;
        v138[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_8;
        v138[3] = &unk_24FDBB790;
        v138[4] = self;
        objc_copyWeak(&v139, &location);
        objc_msgSend(v79, "actionWithTitle:style:handler:", v85, 0, v138);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIAlertController addAction:](self->_powerAlert, "addAction:", v127);
        -[UIAlertController addAction:](self->_powerAlert, "addAction:", v86);

        objc_destroyWeak(&v139);
        v87 = &v141;
LABEL_58:
        objc_destroyWeak(v87);
        objc_destroyWeak(&location);
        v7 = v135;
        goto LABEL_59;
      }
      if (self->_wifiTetheringSupported)
      {
        if (self->_wifiDevice)
          v43 = v15;
        else
          v43 = 1;
        v137 = (void *)MEMORY[0x24BEBD3B0];
        if ((v43 & 1) == 0)
        {
          v88 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v134 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BOTH_OFF_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          v89 = objc_claimAutoreleasedReturnValue();
          v128 = (void *)v89;
          v90 = self->_wifiIsWAPI;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = v91;
          if (v90)
            v92 = CFSTR("WIFI_CH");
          else
            v92 = CFSTR("WIFI");
          objc_msgSend(v91, "localizedStringForKey:value:table:", v92, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "stringWithFormat:", v89, v125);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BOTH_OFF_MESSAGE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = self->_wifiIsWAPI;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v98;
          if (v97)
            v100 = CFSTR("WIFI_CH");
          else
            v100 = CFSTR("WIFI");
          objc_msgSend(v98, "localizedStringForKey:value:table:", v100, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "stringWithFormat:", v96, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "alertControllerWithTitle:message:preferredStyle:", v93, v102, 1);
          v103 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
          v104 = self->_powerAlert;
          self->_powerAlert = v103;

          objc_initWeak(&location, self->_powerAlert);
          v105 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BOTH_OFF_CANCEL_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v152[0] = MEMORY[0x24BDAC760];
          v152[1] = 3221225472;
          v152[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke;
          v152[3] = &unk_24FDBB768;
          objc_copyWeak(&v153, &location);
          objc_msgSend(v105, "actionWithTitle:style:handler:", v107, 1, v152);
          v132 = (void *)objc_claimAutoreleasedReturnValue();

          v108 = (void *)MEMORY[0x24BEBD3A8];
          v109 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BOTH_OFF_OK_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_wifiIsWAPI)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "localizedStringForKey:value:table:", CFSTR("WIFI_CH"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "localizedStringForKey:value:table:", CFSTR("WIFI"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
          }
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stringWithFormat:", v111, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v150[0] = MEMORY[0x24BDAC760];
          v150[1] = 3221225472;
          v150[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_2;
          v150[3] = &unk_24FDBB790;
          v150[4] = self;
          objc_copyWeak(&v151, &location);
          objc_msgSend(v108, "actionWithTitle:style:handler:", v121, 0, v150);
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIAlertController addAction:](self->_powerAlert, "addAction:", v132);
          -[UIAlertController addAction:](self->_powerAlert, "addAction:", v122);

          objc_destroyWeak(&v151);
          v87 = &v153;
          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v133 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_OFF_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_OFF_MESSAGE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = self->_wifiIsWAPI;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v47)
          v50 = CFSTR("WIFI_CH");
        else
          v50 = CFSTR("WIFI");
        objc_msgSend(v48, "localizedStringForKey:value:table:", v50, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", v46, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "alertControllerWithTitle:message:preferredStyle:", v130, v52, 1);
        v53 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
        v54 = self->_powerAlert;
        self->_powerAlert = v53;

        objc_initWeak(&location, self->_powerAlert);
        v55 = (void *)MEMORY[0x24BEBD3A8];
        v56 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_OFF_CANCEL_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_wifiIsWAPI)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("WIFI_CH"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("WIFI"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        }
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringWithFormat:", v58, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v144[0] = MEMORY[0x24BDAC760];
        v144[1] = 3221225472;
        v144[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_5;
        v144[3] = &unk_24FDBB790;
        v144[4] = self;
        v71 = &v145;
        objc_copyWeak(&v145, &location);
        objc_msgSend(v55, "actionWithTitle:style:handler:", v114, 1, v144);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        v116 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_OFF_OK_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v142[0] = MEMORY[0x24BDAC760];
        v142[1] = 3221225472;
        v142[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_6;
        v142[3] = &unk_24FDBB790;
        v142[4] = self;
        objc_copyWeak(&v143, &location);
        objc_msgSend(v116, "actionWithTitle:style:handler:", v118, 0, v142);
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIAlertController addAction:](self->_powerAlert, "addAction:", v115);
        -[UIAlertController addAction:](self->_powerAlert, "addAction:", v119);

        objc_destroyWeak(&v143);
      }
      else
      {
        v60 = (void *)MEMORY[0x24BEBD3B0];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_ONLY_OFF_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_ONLY_OFF_MESSAGE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "alertControllerWithTitle:message:preferredStyle:", v62, v64, 1);
        v65 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
        v66 = self->_powerAlert;
        self->_powerAlert = v65;

        objc_initWeak(&location, self->_powerAlert);
        v67 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_ONLY_OFF_CANCEL_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = MEMORY[0x24BDAC760];
        v148[0] = MEMORY[0x24BDAC760];
        v148[1] = 3221225472;
        v148[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_3;
        v148[3] = &unk_24FDBB790;
        v148[4] = self;
        v71 = &v149;
        objc_copyWeak(&v149, &location);
        objc_msgSend(v67, "actionWithTitle:style:handler:", v69, 1, v148);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BT_ONLY_OFF_OK_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v146[0] = v70;
        v146[1] = 3221225472;
        v146[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_4;
        v146[3] = &unk_24FDBB790;
        v146[4] = self;
        objc_copyWeak(&v147, &location);
        objc_msgSend(v73, "actionWithTitle:style:handler:", v75, 0, v146);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIAlertController addAction:](self->_powerAlert, "addAction:", v72);
        -[UIAlertController addAction:](self->_powerAlert, "addAction:", v76);

        objc_destroyWeak(&v147);
      }
      objc_destroyWeak(v71);
      objc_destroyWeak(&location);
      v7 = v135;
LABEL_59:
      -[WirelessModemController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_powerAlert, 1, 0);
      goto LABEL_60;
    }
  }
  -[WirelessModemController updateInstructionsSection:](self, "updateInstructionsSection:", v9);
  +[MISManager sharedManager](MISManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setState:", v9);

  if (objc_msgSend(v6, "BOOLValue"))
    v18 = CFSTR("true");
  else
    v18 = CFSTR("false");
  WMSUIEventDictionary(CFSTR("toggle-ph-discovery"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v19);

LABEL_60:
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[MISManager sharedManager](MISManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 1023);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1393) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 1;
  WiFiManagerClientSetPower();
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPowered:", 1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  __CFString *applicationID;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1396) = 0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  applicationID = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(CFSTR("ShowBTPowerPrompt"), (CFPropertyListRef)*MEMORY[0x24BDBD268], applicationID);
  CFPreferencesSynchronize(applicationID, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  +[MISManager sharedManager](MISManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", 1023);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 1;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPowered:", 1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  __CFString *applicationID;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1396) = 0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  applicationID = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(CFSTR("ShowBTPowerPrompt"), (CFPropertyListRef)*MEMORY[0x24BDBD268], applicationID);
  CFPreferencesSynchronize(applicationID, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  +[MISManager sharedManager](MISManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", 1023);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_6(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 1;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPowered:", 1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_7(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[MISManager sharedManager](MISManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 1023);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1393) = 1;
  WiFiManagerClientSetPower();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)updateInstructionsSection:(int)a3
{
  uint64_t v3;

  if (a3 == 1022)
  {
    -[WirelessModemController removeSpecifier:](self, "removeSpecifier:", self->_setupViewSpec);
  }
  else if (a3 == 1023)
  {
    v3 = 1;
    if (self->_familyHotspotEnabled)
      v3 = 2;
    -[WirelessModemController insertSpecifier:atEndOfGroup:animated:](self, "insertSpecifier:atEndOfGroup:animated:", self->_setupViewSpec, v3 + self->_showBandPreferenceUI, 1);
  }
}

- (void)_updateTetheringText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  _BOOL4 v10;
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
  int v23;
  void *v24;
  PSSpecifier *stateFooterSpec;
  void *v26;
  uint64_t v27;

  v3 = a3;
  v27 = 0;
  +[MISManager sharedManager](MISManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getState:andReason:", (char *)&v27 + 4, &v27);

  v6 = *MEMORY[0x24BE75A18];
  if (self->_personalHotspotModificationDisabled)
    v7 = MEMORY[0x24BDBD1C0];
  else
    v7 = MEMORY[0x24BDBD1C8];
  -[PSSpecifier setProperty:forKey:](self->_tetheringSwitchSpec, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);
  if (!self->_waitingOnWifiPower && !self->_waitingOnBTPower)
    -[PSSpecifier setProperty:forKey:](self->_tetheringSwitchSpec, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
  if (HIDWORD(v27) == 1023)
  {
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "enabled");

    v10 = -[WirelessModemController _wiFiPower](self, "_wiFiPower");
    if ((v9 & 1) != 0 || v10)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TETHERING_TEXT_DEFAULT"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WMSGetCurrentDeviceName();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uppercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("TETHERING_TEXT_USB"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v16, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TETHERING_TEXT_DEFAULT"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WMSGetCurrentDeviceName();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (HIDWORD(v27) != 1022
      || (_DWORD)v27 == 4
      && (+[MISManager sharedManager](MISManager, "sharedManager"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "didUserPreventData"),
          v22,
          v23))
    {
      -[PSSpecifier setProperty:forKey:](self->_tetheringSwitchSpec, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v6);
    }
  }
  stateFooterSpec = self->_stateFooterSpec;
  if (v3)
  {
    -[PSSpecifier setProperty:forKey:](stateFooterSpec, "setProperty:forKey:", v17, CFSTR("TextFooterInitialText"));
  }
  else
  {
    -[PSSpecifier propertyForKey:](stateFooterSpec, "propertyForKey:", *MEMORY[0x24BE75AB0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v17);

    -[WirelessModemController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_stateFooterSpec, 0);
  }

}

- (id)shareOption
{
  unsigned int ShareMyPersonalHotspotMode;

  ShareMyPersonalHotspotMode = WiFiManagerClientGetShareMyPersonalHotspotMode();
  if (ShareMyPersonalHotspotMode > 2)
    return &unk_24FDBEFE0;
  else
    return (id)qword_24FDBB7B0[ShareMyPersonalHotspotMode];
}

- (void)setShareOption:(id)a3
{
  id v3;
  const __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", &unk_24FDBEFE0) & 1) != 0)
  {
    v4 = CFSTR("Never");
  }
  else if ((objc_msgSend(v3, "isEqual:", &unk_24FDBEFF8) & 1) != 0)
  {
    v4 = CFSTR("Automatic");
  }
  else
  {
    if ((objc_msgSend(v3, "isEqual:", &unk_24FDBEFC8) & 1) == 0)
    {
      WMSLogComponent();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[WirelessModemController setShareOption:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

    }
    v4 = CFSTR("Ask for Approval");
  }
  WiFiManagerClientSetShareMyPersonalHotspotMode();
  WMSLogComponent();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[WirelessModemController setShareOption:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);

}

- (id)shareSpecifier
{
  id v3;
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
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FAMILY_HOTSPOT_OFF"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FAMILY_HOTSPOT_ASK"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FAMILY_HOTSPOT_AUTOMATIC"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithArray:", v10);

  v12 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FAMILY_HOTSPOT"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setShareOption_, sel_shareOption, objc_opt_class(), 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setValues:titles:", &unk_24FDBF050, v11);
  return v15;
}

- (id)familyShareSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 wifiIsWAPI;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FAMILY_SHARING_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  wifiIsWAPI = self->_wifiIsWAPI;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (wifiIsWAPI)
    v10 = CFSTR("WIFI_CH");
  else
    v10 = CFSTR("WIFI");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, objc_opt_class(), 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dataUsageString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)WiFiManagerClientCopyProperty();
  if (v2)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = v2;
    obj = v2;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v3 = 0;
    v4 = 0;
    v5 = 0;
    if (v24)
    {
      v23 = *(_QWORD *)v36;
      v22 = *MEMORY[0x24BE67EC8];
      v30 = *MEMORY[0x24BE67ED8];
      v29 = *MEMORY[0x24BE67EB8];
      v28 = *MEMORY[0x24BE67E98];
      v27 = *MEMORY[0x24BE67EB0];
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(obj);
          v25 = v6;
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v6), "objectForKey:", v22);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v26 = v7;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v32;
            do
            {
              v11 = 0;
              v12 = v3;
              v13 = v4;
              do
              {
                if (*(_QWORD *)v32 != v10)
                  objc_enumerationMutation(v26);
                v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
                objc_msgSend(v14, "objectForKey:", v30);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "objectForKey:", v29);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "objectForKey:", v28);
                v3 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v14, "objectForKey:", v27);
                v4 = (void *)objc_claimAutoreleasedReturnValue();

                v17 = objc_msgSend(v16, "unsignedIntegerValue");
                v5 += v17 + objc_msgSend(v15, "unsignedIntegerValue");

                ++v11;
                v12 = v3;
                v13 = v4;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v9);
          }

          v6 = v25 + 1;
        }
        while (v25 + 1 != v24);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v24);
    }

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v5, 0);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = &stru_24FDBBCF8;
    }
    v2 = v20;
  }
  else
  {
    v18 = &stru_24FDBBCF8;
  }

  return v18;
}

- (id)usageSpecifier
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)WiFiManagerClientCopyProperty();
  if (v3
    && (-[WirelessModemController dataUsageString](self, "dataUsageString"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", &stru_24FDBBCF8),
        v4,
        (v5 & 1) == 0))
  {
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_USAGE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel_dataUsageString, objc_opt_class(), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)placardSpec
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24FDBBCF8, self, 0, 0, 0, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("WirelessModemSettings.PersonalHotspotPlacardCell")), *MEMORY[0x24BE75948]);
  objc_msgSend(v2, "setIdentifier:", CFSTR("PHS_PLACARD"));
  return v2;
}

- (id)tetheringSwitchSpec
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 wifiIsWAPI;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALLOW_OTHERS"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  wifiIsWAPI = self->_wifiIsWAPI;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (wifiIsWAPI)
    v9 = CFSTR("WIFI_CH");
  else
    v9 = CFSTR("WIFI");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setInternetTethering_specifier_, sel_internetTethering_, 0, 6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)passwordSpec
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 wifiIsWAPI;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WIFI_PASSWORD"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  wifiIsWAPI = self->_wifiIsWAPI;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (wifiIsWAPI)
    v10 = CFSTR("WIFI_CH");
  else
    v10 = CFSTR("WIFI");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel_wifiPassword_, objc_opt_class(), 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)setupViewSpec
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", CFSTR("TetheringSetupView"), *MEMORY[0x24BE75AA0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiTetheringSupported);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, CFSTR("SupportsWifi"));

  return v3;
}

- (id)stateFooterSpec
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", CFSTR("TetheringSwitchFooterView"), *MEMORY[0x24BE75AA0]);

  return v2;
}

- (id)bandPreferenceSpec
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  -[WirelessModemController _bandPreferenceSpecLabel](self, "_bandPreferenceSpecLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setBandPreference_specifier_, sel_bandPreference, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_bandPreferenceSpecLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MAXIMIZE_COMPATIBILITY"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_bandPreferenceSpecFooterLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MAXIMIZE_COMPATIBILITY_FOOTER"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 wifiIsWAPI;
  void *v12;
  void *v13;
  const __CFString *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PSSpecifier *placardSpec;
  PSSpecifier *v30;
  void *v31;
  void *v32;
  PSSpecifier *tetheringGroupSpec;
  PSSpecifier *tetheringSwitchSpec;
  PSSpecifier *passwordSpec;
  PSSpecifier *stateFooterSpec;
  PSSpecifier *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  PSSpecifier *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  BOOL v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  PSSpecifier *bandPreferenceSpec;
  PSSpecifier *v54;
  void *v55;
  void *v56;
  void *v57;
  PSSpecifier *setupViewSpec;
  PSSpecifier *v59;
  void *v60;
  int v61;
  void *v62;
  id v63;
  void *v65;
  void *v66;
  PSSpecifier *v67;
  id v68;
  PSSpecifier *v69;
  PSSpecifier *v70;
  PSSpecifier *v71;
  uint64_t v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[4];
  _QWORD v76[4];

  v76[2] = *MEMORY[0x24BDAC8D0];
  v72 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  if (v3)
    return v3;
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = v5 & 0xFFFFFFFFFFFFFFFBLL;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 == 1)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INSTANT_HOTSPOT_IPAD"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    wifiIsWAPI = self->_wifiIsWAPI;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (wifiIsWAPI)
      v14 = CFSTR("WIFI_CH");
    else
      v14 = CFSTR("WIFI");
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INSTANT_HOTSPOT_IPHONE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_wifiIsWAPI;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v15)
      v14 = CFSTR("WIFI_CH");
    else
      v14 = CFSTR("WIFI");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v68;
  if (!self->_placardFeatureEnabled)
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);
    objc_msgSend(v68, "addObject:", v19);

  }
  v20 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences();
  v21 = v20;
  if (v20 && objc_msgSend(v20, "count"))
  {
    self->_familyHotspotEnabled = 1;
    WMSLogComponent();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[WirelessModemController specifiers].cold.1((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28);

  }
  else
  {
    self->_familyHotspotEnabled = 0;
  }
  if (!self->_placardFeatureEnabled)
  {
    v30 = 0;
    goto LABEL_23;
  }
  placardSpec = self->_placardSpec;
  if (placardSpec)
  {
    v30 = placardSpec;
  }
  else
  {
    -[WirelessModemController placardSpec](self, "placardSpec");
    v30 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_placardSpec, v30);
    if (!v30)
      goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v31;
  v76[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObjectsFromArray:", v32);

LABEL_23:
  tetheringGroupSpec = self->_tetheringGroupSpec;
  if (tetheringGroupSpec)
  {
    v71 = tetheringGroupSpec;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v71 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_tetheringGroupSpec, v71);
  }
  tetheringSwitchSpec = self->_tetheringSwitchSpec;
  if (tetheringSwitchSpec)
  {
    v70 = tetheringSwitchSpec;
  }
  else
  {
    -[WirelessModemController tetheringSwitchSpec](self, "tetheringSwitchSpec");
    v70 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_tetheringSwitchSpec, v70);
  }
  passwordSpec = self->_passwordSpec;
  if (passwordSpec)
  {
    v69 = passwordSpec;
  }
  else
  {
    -[WirelessModemController passwordSpec](self, "passwordSpec");
    v69 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_passwordSpec, v69);
  }
  stateFooterSpec = self->_stateFooterSpec;
  if (stateFooterSpec)
  {
    v37 = stateFooterSpec;
  }
  else
  {
    -[WirelessModemController stateFooterSpec](self, "stateFooterSpec");
    v37 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_stateFooterSpec, v37);
  }
  v75[0] = v71;
  v75[1] = v70;
  v75[2] = v69;
  v75[3] = v37;
  v67 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObjectsFromArray:", v38);

  if (self->_familyHotspotEnabled)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
    v39 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)MEMORY[0x24BDD17C8];
    v66 = (void *)v39;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("FAMILY_SHARING"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v30;
    v43 = v17;
    v44 = self->_wifiIsWAPI;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    v47 = !v44;
    v17 = v43;
    v30 = v42;
    if (v47)
      v48 = CFSTR("WIFI");
    else
      v48 = CFSTR("WIFI_CH");
    objc_msgSend(v45, "localizedStringForKey:value:table:", v48, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringWithFormat:", v41, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setProperty:forKey:", v50, *MEMORY[0x24BE75A68]);

    v18 = v68;
    -[WirelessModemController familyShareSpecifier](self, "familyShareSpecifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v66;
    v74[1] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObjectsFromArray:", v52);

  }
  if (self->_showBandPreferenceUI)
  {
    bandPreferenceSpec = self->_bandPreferenceSpec;
    if (bandPreferenceSpec)
    {
      v54 = bandPreferenceSpec;
LABEL_45:
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[WirelessModemController _bandPreferenceSpecFooterLabel](self, "_bandPreferenceSpecFooterLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setProperty:forKey:", v56, *MEMORY[0x24BE75A68]);

      v73[0] = v55;
      v73[1] = v54;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v57);

      goto LABEL_46;
    }
    -[WirelessModemController bandPreferenceSpec](self, "bandPreferenceSpec");
    v54 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_bandPreferenceSpec, v54);
    if (v54)
      goto LABEL_45;
  }
  else
  {
    v54 = 0;
  }
LABEL_46:
  setupViewSpec = self->_setupViewSpec;
  if (setupViewSpec)
  {
    v59 = setupViewSpec;
  }
  else
  {
    -[WirelessModemController setupViewSpec](self, "setupViewSpec");
    v59 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_setupViewSpec, v59);
  }
  -[WirelessModemController internetTethering:](self, "internetTethering:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "BOOLValue");

  if (v61)
    objc_msgSend(v18, "addObject:", v59);
  -[WirelessModemController _updateTetheringText:](self, "_updateTetheringText:", 1);
  v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v72) = (Class)v18;
  v63 = v18;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  return v3;
}

- (void)showAlert:(id)a3
{
  -[WirelessModemController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)showPairingAlert:(id)a3
{
  -[WirelessModemController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)dismissPairingAlert:(id)a3
{
  -[WirelessModemController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bandPreferenceSpec, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_btAlert, 0);
  objc_storeStrong(&self->_btSSPAlert, 0);
  objc_storeStrong((id *)&self->_placardSpec, 0);
  objc_storeStrong((id *)&self->_setupViewSpec, 0);
  objc_storeStrong((id *)&self->_stateFooterSpec, 0);
  objc_storeStrong((id *)&self->_passwordSpec, 0);
  objc_storeStrong((id *)&self->_currentDeviceSpecifier, 0);
  objc_storeStrong((id *)&self->_tetheringSwitchSpec, 0);
  objc_storeStrong((id *)&self->_tetheringGroupSpec, 0);
  objc_storeStrong((id *)&self->_powerAlert, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, a1, a3, "show band preference UI enabled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)setPersonalHotspotModificationDisableState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a1, a3, "%s: No change in state", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_setMISDiscoveryStateEnabled:(char)a1 effectiveImmediately:(char)a2 forceBand:(os_log_t)log .cold.1(char a1, char a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:]";
  v5 = 1024;
  v6 = a1 & 1;
  v7 = 1024;
  v8 = a2 & 1;
  _os_log_error_impl(&dword_22FE37000, log, OS_LOG_TYPE_ERROR, "%s: enabled: %d immediately: %d", (uint8_t *)&v3, 0x18u);
  OUTLINED_FUNCTION_1();
}

- (void)setBandPreference:(int)a1 specifier:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[WirelessModemController setBandPreference:specifier:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_22FE37000, a2, OS_LOG_TYPE_ERROR, "%s: setting new preference: %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_btAuthenticationRequestHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22FE37000, a2, a3, "Ignoring authentication request as there's something pending user interaction: _sspAlert(%@), _alert(%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_btAuthenticationRequestHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, a1, a3, "Delaying incoming pairing attempt from computer to try to retrieve the name...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_btPinRequestHandler:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_22FE37000, a3, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v9, 0x20u);

}

- (void)setShareOption:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a2, a3, "Setting share Option to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setShareOption:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, a1, a3, "Unexpected mode, resetting to default option", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)specifiers
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a2, a3, "Family Hotspot preferences: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
