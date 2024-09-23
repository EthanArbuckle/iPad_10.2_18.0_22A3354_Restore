@implementation ADAdTrackingSchedulingManager

uint64_t __52__ADAdTrackingSchedulingManager_handleConfiguration__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Force config expiration notification received."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(*(id *)(a1 + 32), "forceExpiration");
  return objc_msgSend(*(id *)(a1 + 32), "refreshConfiguration:", 0);
}

- (void)forceExpiration
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expiring and Refreshing the configuration message now."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 0, CFSTR("ForceExpireConfiguration"));

  objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfigurationExpirationTime:", 0);

}

- (void)refreshConfiguration:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[ADAdTrackingSchedulingManager isAdEnabledLocality](self, "isAdEnabledLocality"))
  {
    objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "AD_toServerTime");

    objc_msgSend(v5, "configurations");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8 && (v9 = (void *)v8, v10 = objc_msgSend(v5, "configurationExpirationTime"), v9, v10 > (int)v7))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Checking if config data has been saved to promotedcontentd key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      if (-[ADAdTrackingSchedulingManager _shouldSaveConfig](self, "_shouldSaveConfig"))
        objc_msgSend(v5, "saveConfig");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration Data has not yet expired. (%d > %d)"), objc_msgSend(v5, "configurationExpirationTime"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      if (v4)
        v4[2](v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE02228], "workQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke;
      v15[3] = &unk_24D710AE0;
      v15[4] = self;
      v17 = v4;
      v16 = v5;
      objc_msgSend(v14, "addOperationWithBlock:", v15);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Not refreshing configuration because this is not an Ad-enabled locality"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (v4)
      v4[2](v4, 0);
  }

}

void __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  if (objc_msgSend(*(id *)(a1 + 32), "isConfigRequestInFlight"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration Message is already in flight."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsConfigRequestInFlight:", 1);
    v4 = objc_alloc_init(MEMORY[0x24BE021A0]);
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultConfigurationServerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke_2;
    v8[3] = &unk_24D710AB8;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v9, "handleRequest:serverURL:responseHandler:", v4, v6, v8);

  }
}

void __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsConfigRequestInFlight:", 0);
  if (!a4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE021A8]), "initWithData:", v13);
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "AD_jsonString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Received an ADConfigurationResponse: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(*(id *)(a1 + 40), "buildConfigurationDictionary:", v6);
    v10 = ADWriteDataToKeychain();
    objc_msgSend(*(id *)(a1 + 40), "saveConfig");
    objc_msgSend(*(id *)(a1 + 40), "saveProxyURL");
    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There was an error writing the Configuration Response to the keychain: %d"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("ADConfigurationDidChangeNotification"), *MEMORY[0x24BE02100]);
    }

  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);

}

- (void)setIsConfigRequestInFlight:(BOOL)a3
{
  self->_isConfigRequestInFlight = a3;
}

- (BOOL)isConfigRequestInFlight
{
  return self->_isConfigRequestInFlight;
}

- (BOOL)isAdEnabledLocality
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL4 v10;

  if (MGGetBoolAnswer()
    && (objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ForceNonAdLocale")),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: isAdEnabledLocality is forced OFF by internal default."), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    v6 = 0;
  }
  else
  {
    +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "retrieveLatestPersonalizedAdsConsentVersionFromAMSBag");

    v9 = objc_alloc(MEMORY[0x24BDBCF50]);
    v5 = (void *)objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x24BE02138]);
    objc_msgSend(v5, "setInteger:forKey:", v8, CFSTR("LatestPAVersion"));
    LOBYTE(v8) = -[ADAdTrackingSchedulingManager isSearchOrSegmentEnabled](self, "isSearchOrSegmentEnabled");
    v10 = -[ADAdTrackingSchedulingManager isNewsOrStocksEnabledLocality](self, "isNewsOrStocksEnabledLocality");
    objc_msgSend(v5, "setBool:forKey:", -[ADAdTrackingSchedulingManager isSearchAdsEnabled](self, "isSearchAdsEnabled") | v10, CFSTR("AdPlatformsPAAvailable"));
    v6 = v8 | v10;
  }

  return v6;
}

- (BOOL)isSearchOrSegmentEnabled
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;

  +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "retrieveIsSponsoredAdsEnabledValueFromAMSBag");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This country is Toro enabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = 1;
  }
  else
  {
    +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag");

    v7 = CFSTR("not Toro enabled");
    if (v5)
      v7 = CFSTR("being onboarded for Toro");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This country is %@"), v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _ADLog();

  return v5;
}

- (BOOL)isSearchAdsEnabled
{
  void *v2;
  char v3;

  +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "retrieveIsSponsoredAdsEnabledValueFromAMSBag");

  return v3;
}

- (BOOL)isNewsOrStocksEnabledLocality
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  const __CFString *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  -[ADAdTrackingSchedulingManager retrieveNewsRecord:](self, "retrieveNewsRecord:", &v37);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v37;
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("MCRestrictions.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    LOBYTE(v15) = 0;
    v6 = CFSTR("is not");
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("is not");
  if (!v5)
    goto LABEL_16;
  v7 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCWhitelistedLocales")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {

LABEL_16:
    LOBYTE(v15) = 0;
    goto LABEL_21;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCWhitelistedLocales"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v15)
  {
    v30 = v2;
    v16 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v14);
        if ((objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)) & 1) != 0)
        {
          LODWORD(v15) = 1;
          goto LABEL_18;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v15)
        continue;
      break;
    }
LABEL_18:
    v2 = v30;
  }

  if ((_DWORD)v15)
    v6 = CFSTR("is");
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This country %@ News enabled"), v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("StocksEnabled"));

  v32 = 0;
  objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.stocks"), 0, &v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v32;
  v23 = v22;
  if (!v20)
  {
LABEL_26:
    v25 = 0;
    v24 = CFSTR("is not");
    goto LABEL_27;
  }
  if (!v21 || v22)
  {
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBool:forKey:", 0, CFSTR("StocksEnabled"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stocks was set to enabled but cannot be found due to %@. Disabling..."), v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    goto LABEL_26;
  }
  v24 = CFSTR("is");
  v25 = 1;
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This country %@ Stocks enabled"), v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return v15 | v25;
}

- (id)retrieveNewsRecord:(id *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.news"), 0, a3);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance_0;
}

void __47__ADAdTrackingSchedulingManager_sharedInstance__block_invoke()
{
  ADAdTrackingSchedulingManager *v0;
  void *v1;

  v0 = objc_alloc_init(ADAdTrackingSchedulingManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (ADAdTrackingSchedulingManager)init
{
  ADAdTrackingSchedulingManager *v2;
  ADAdTrackingSchedulingManager *v3;
  dispatch_source_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  ADAdTrackingSchedulingManager *v14;
  ADLoggingProfileMonitor *v15;
  ADLoggingProfileMonitor *loggingProfileMonitor;
  void *v17;
  void *v18;
  ADAdTrackingSchedulingManager *v19;
  uint64_t v20;
  NSObject *accountChangedNotifyToken;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *storeFrontNotifyToken;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  ADAdTrackingSchedulingManager *v32;
  _QWORD handler[4];
  ADAdTrackingSchedulingManager *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)ADAdTrackingSchedulingManager;
  v2 = -[ADAdTrackingSchedulingManager init](&v35, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isConfigRequestInFlight = 0;
    v4 = dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, 0);
    v5 = (void *)sigterm_source;
    sigterm_source = (uint64_t)v4;

    dispatch_source_set_event_handler((dispatch_source_t)sigterm_source, &__block_literal_global_8);
    dispatch_resume((dispatch_object_t)sigterm_source);
    v6 = +[ADAppTrackingService sharedInstance](ADAppTrackingService, "sharedInstance");
    v7 = +[ADIDManagerService sharedInstance](ADIDManagerService, "sharedInstance");
    v8 = +[ADDeviceKnowledgeManager sharedInstance](ADDeviceKnowledgeManager, "sharedInstance");
    -[ADAdTrackingSchedulingManager registerForLockStateNotification](v3, "registerForLockStateNotification");
    v9 = (id)objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
    v10 = dispatch_queue_create("com.apple.queue.adplatforms.adTracking", 0);
    v11 = (void *)_adTrackingQueue;
    _adTrackingQueue = (uint64_t)v10;

    v12 = _adTrackingQueue;
    v13 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __37__ADAdTrackingSchedulingManager_init__block_invoke_2;
    handler[3] = &unk_24D710A50;
    v14 = v3;
    v34 = v14;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v12, handler);
    v15 = objc_alloc_init(ADLoggingProfileMonitor);
    loggingProfileMonitor = v14->_loggingProfileMonitor;
    v14->_loggingProfileMonitor = v15;

    -[ADAdTrackingSchedulingManager migratePersonalizedAdsFromLAT](v14, "migratePersonalizedAdsFromLAT");
    -[ADAdTrackingSchedulingManager migratePersonalizedAdsOnboarding](v14, "migratePersonalizedAdsOnboarding");
    -[ADAdTrackingSchedulingManager handleConfiguration](v14, "handleConfiguration");
    -[ADAdTrackingSchedulingManager pushEnable](v14, "pushEnable");
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v13;
    v29 = 3221225472;
    v30 = __37__ADAdTrackingSchedulingManager_init__block_invoke_3;
    v31 = &unk_24D710298;
    v19 = v14;
    v32 = v19;
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.ap.adprivacyd.iTunesActiveAccountDidChangeNotification"), 0, v18, &v28);
    v20 = objc_claimAutoreleasedReturnValue();
    accountChangedNotifyToken = v19->_accountChangedNotifyToken;
    v19->_accountChangedNotifyToken = v20;

    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance", v28, v29, v30, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reloadStorefront:", 0);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification"), 0, v24, &__block_literal_global_63);
    v25 = objc_claimAutoreleasedReturnValue();
    storeFrontNotifyToken = v19->_storeFrontNotifyToken;
    v19->_storeFrontNotifyToken = v25;

  }
  return v3;
}

void __37__ADAdTrackingSchedulingManager_init__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exiting due to SIGTERM"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  exit(0);
}

void __37__ADAdTrackingSchedulingManager_init__block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  id v14;

  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]);
  if (string)
  {
    v4 = string;
    if (!strcmp("com.apple.ap.adprivacyd.iTunesActiveAccountDidChangeNotification", string))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received Account Changed Notification"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(*(id *)(a1 + 32), "handleAccountChange");
      return;
    }
    if (!strcmp("com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification", v4))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received Storefront Changed Notification"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadStorefront:", 0);
    }
    else
    {
      if (!MGGetBoolAnswer())
        return;
      if (!strcmp((const char *)objc_msgSend(CFSTR("com.apple.ap.adprivacyd.reconcile"), "UTF8String"), v4))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adprivacyd handling internal notification %@"), CFSTR("com.apple.ap.adprivacyd.reconcile"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scheduleReconciliation:", 0.0);
      }
      else if (!strcmp((const char *)objc_msgSend(CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"), "UTF8String"), v4))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adprivacyd handling internal notification %@"), CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        +[ADDeviceKnowledgeManager sharedInstance](ADDeviceKnowledgeManager, "sharedInstance");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scheduleDeviceDataProcessing:", 0.0);
      }
      else if (!strcmp("com.apple.mobile.keybagd.first_unlock", v4))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keybag First Unlock"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(MEMORY[0x24BE7A770], "sharedInstance");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "startListening");
      }
      else
      {
        if (!strcmp("com.apple.ap.adprivacyd.launch", v4))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adprivacyd launched in response to %s"), "com.apple.ap.adprivacyd.launch");
LABEL_23:
          v14 = (id)objc_claimAutoreleasedReturnValue();
          _ADLog();
          goto LABEL_24;
        }
        if (strcmp("com.apple.ap.adprivacyd.canceltasks", v4))
        {
          if (!strcmp("CPInstalledProfileDidChangeNotification", v4))
          {
            v11 = (void *)MEMORY[0x24BDD17C8];
            v12 = CFSTR("AdPrivacyD launched by CPInstalledProfileDidChangeNotification");
          }
          else
          {
            if (strcmp("com.apple.ManagedConfiguration.profileListChanged", v4))
              return;
            v11 = (void *)MEMORY[0x24BDD17C8];
            v12 = CFSTR("AdPrivacyD launched by com.apple.ManagedConfiguration.profileListChanged");
          }
          objc_msgSend(v11, "stringWithFormat:", v12, v13);
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adprivacyd handling internal notification %s"), "com.apple.ap.adprivacyd.canceltasks");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cancelBackgroundTask:", CFSTR("com.apple.ap.adprivacyd.reconcile"));
      }
    }
LABEL_24:

  }
}

uint64_t __37__ADAdTrackingSchedulingManager_init__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received a Notification from Account Plugin that the Current Account Changed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return objc_msgSend(*(id *)(a1 + 32), "handleAccountChange");
}

void __37__ADAdTrackingSchedulingManager_init__block_invoke_4()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received a notification that the storefront changed. Reloading the Bag."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadStorefront:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_storeFrontNotifyToken);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_accountChangedNotifyToken);

  v5.receiver = self;
  v5.super_class = (Class)ADAdTrackingSchedulingManager;
  -[ADAdTrackingSchedulingManager dealloc](&v5, sel_dealloc);
}

- (void)migratePersonalizedAdsOnboarding
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x219A08150]();
  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x24BE02150]);
  v5 = objc_alloc(MEMORY[0x24BDBCF50]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x24BE02138]);
  objc_msgSend(v6, "objectForKey:", CFSTR("acknowledgedPersonalizedAdsVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("acknowledgedPersonalizedAdsVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Personalized Ads onboarding acknowledgement is being migrated"), objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v4, "integerForKey:", CFSTR("acknowledgedPersonalizedAdsVersion")), CFSTR("acknowledgedPersonalizedAdsVersion"));
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)migratePersonalizedAdsFromLAT
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = (void *)MEMORY[0x219A08150]();
  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("personalizedAdsMigrated"));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Personalized Ads has not been migrated. Deriving the value from LAT"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE639A0]);

    if (v7 != 1)
    {
      v8 = objc_alloc(MEMORY[0x24BDBCF50]);
      v9 = (void *)objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x24BE02138]);
      objc_msgSend(v9, "setBool:forKey:", 1, CFSTR("personalizedAdsDefaulted"));

    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBoolValue:forSetting:", 0, *MEMORY[0x24BE637C0]);

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBool:forKey:", 1, CFSTR("personalizedAdsMigrated"));

    v12 = ADWriteDataToKeychain();
    if ((_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error deleting PA from keychain: %d"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
  }
  objc_autoreleasePoolPop(v2);
}

- (int64_t)latestPersonalizedConsentVersion
{
  void *v2;
  int64_t v3;

  +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "retrieveLatestPersonalizedAdsConsentVersionFromAMSBag");

  return v3;
}

- (BOOL)_shouldSaveConfig
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Checking if config data has been saved to promotedcontentd key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  ADCopyDataFromKeychain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == 0;

  return (char)v2;
}

- (void)handleConfiguration
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ForceExpireConfiguration"));

  if (v4)
    -[ADAdTrackingSchedulingManager forceExpiration](self, "forceExpiration");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE02100];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__ADAdTrackingSchedulingManager_handleConfiguration__block_invoke;
  v9[3] = &unk_24D710298;
  v9[4] = self;
  v8 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("ForceExpireConfiguration"), v6, v7, v9);

}

- (id)currentBundleID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executablePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (APSConnection)pushConnection
{
  APSConnection *pushConnection;
  id v4;
  uint64_t v5;
  void *v6;
  APSConnection *v7;
  APSConnection *v8;
  void *v9;

  pushConnection = self->_pushConnection;
  if (!pushConnection)
  {
    v4 = objc_alloc(MEMORY[0x24BE08738]);
    v5 = *MEMORY[0x24BE08720];
    dispatch_get_global_queue(0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (APSConnection *)objc_msgSend(v4, "initWithEnvironmentName:namedDelegatePort:queue:", v5, CFSTR("com.apple.AdSheetPhone.push"), v6);
    v8 = self->_pushConnection;
    self->_pushConnection = v7;

    -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
    pushConnection = self->_pushConnection;
    if (!pushConnection)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID Couldn't create push connection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      pushConnection = self->_pushConnection;
    }
  }
  return pushConnection;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID Received public token \"%@\" on connection %@"), a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection %@"), a4, a5, a6, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("DPID APS Push received: %@ %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  +[ADClientDPIDManager sharedInstance](ADClientDPIDManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__ADAdTrackingSchedulingManager_connection_didReceiveIncomingMessage___block_invoke;
  v11[3] = &unk_24D710B08;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "handlePushNotification:completionHandler:", v10, v11);

}

void __70__ADAdTrackingSchedulingManager_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handled push notification returned an eror: %@ payload: %@"), a2, v2);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handled push notification successfully. payload: %@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)pushEnable
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", *MEMORY[0x24BE02148]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADAdTrackingSchedulingManager pushConnection](self, "pushConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabledTopics:", v4);

}

- (void)pushDisable
{
  id v2;

  -[ADAdTrackingSchedulingManager pushConnection](self, "pushConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabledTopics:", 0);

}

- (void)handleAccountChange
{
  void *v2;
  dispatch_time_t v3;
  NSObject *v4;
  ADAdTrackingSchedulingManager *obj;
  _QWORD block[5];

  obj = self;
  objc_sync_enter(obj);
  if (handleAccountChange__handleAccountChangeDispatched == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] handleAccountChange: iTunes account change notification has already been dispatched to ADIDManager. Short-circuiting."), objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_sync_exit(obj);
  }
  else
  {
    handleAccountChange__handleAccountChangeDispatched = 1;
    objc_sync_exit(obj);

    v3 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke;
    block[3] = &unk_24D710270;
    block[4] = obj;
    dispatch_after(v3, v4, block);

  }
}

void __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.adprivacyd [%@ handleAccountChange]"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  takeXPCTransaction();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke_2;
  v6[3] = &unk_24D710B08;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "handleAccountChange:", v6);

  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  handleAccountChange__handleAccountChangeDispatched = 0;
  objc_sync_exit(v5);

}

void __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v8 = v2;
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = objc_msgSend(v2, "code");
    objc_msgSend(v8, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Error %ld while handling account change: %@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("com.apple.adplatforms.UserAccountChangeCompletedNotification"), *MEMORY[0x24BE02138]);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully handled account change."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

  releaseXPCTransaction();
}

- (void)registerForLockStateNotification
{
  void *v2;
  id v3;

  if (notify_register_dispatch((const char *)*MEMORY[0x24BEB0ED0], &_screenLockNotifyToken, MEMORY[0x24BDAC9B8], &__block_literal_global_189))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to register for springboard lock state events."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    _screenLockNotifyToken = -1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Registered for springboard lock state events."));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

void __65__ADAdTrackingSchedulingManager_registerForLockStateNotification__block_invoke(int a1, int token)
{
  uint64_t state;
  void *v3;
  uint64_t state64;

  state64 = 0;
  state = notify_get_state(token, &state64);
  if ((_DWORD)state)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get state for _screenLockNotifyToken. Error code %d"), state);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
LABEL_3:

    return;
  }
  if (!state64)
  {
    notify_cancel(_screenLockNotifyToken);
    _screenLockNotifyToken = -1;
    objc_msgSend(MEMORY[0x24BE7A770], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startListening");
    goto LABEL_3;
  }
}

- (NSObject)storeFrontNotifyToken
{
  return self->_storeFrontNotifyToken;
}

- (void)setStoreFrontNotifyToken:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontNotifyToken, a3);
}

- (NSObject)accountChangedNotifyToken
{
  return self->_accountChangedNotifyToken;
}

- (void)setAccountChangedNotifyToken:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangedNotifyToken, a3);
}

- (void)setPushConnection:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnection, a3);
}

- (ADLoggingProfileMonitor)loggingProfileMonitor
{
  return self->_loggingProfileMonitor;
}

- (void)setLoggingProfileMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_loggingProfileMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingProfileMonitor, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_accountChangedNotifyToken, 0);
  objc_storeStrong((id *)&self->_storeFrontNotifyToken, 0);
}

@end
