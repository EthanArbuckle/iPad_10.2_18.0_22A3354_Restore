@implementation CPSTemplateEnvironment

- (CPSTemplateEnvironment)initWithConnection:(id)a3 templateProvider:(id)a4
{
  CPSTemplateEnvironment *v4;
  NSString *v5;
  NSString *bundleIdentifier;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  CARObserverHashTable *environmentObservers;
  uint64_t v18;
  CARSessionStatus *sessionStatus;
  NSSet *v20;
  NSSet *allowedTemplateClasses;
  NSSet *v22;
  NSSet *v23;
  NSSet *v24;
  NSSet *v25;
  NSSet *v26;
  NSSet *v27;
  NSSet *v28;
  NSSet *v29;
  NSSet *v30;
  NSSet *v31;
  NSSet *v32;
  NSSet *v33;
  NSSet *v34;
  NSSet *v35;
  char v36;
  char v37;
  CPSTemplateEnvironment *v39;
  id v40;
  void *v41;
  NSString *v42;
  id v43;
  id v44;
  id v45;
  char hasPublicSafetyEntitlement;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  CPSTemplateEnvironment *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id location[2];
  CPSTemplateEnvironment *v63;

  v63 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v61 = 0;
  objc_storeStrong(&v61, a4);
  v4 = v63;
  v63 = 0;
  v57 = -[CPSTemplateEnvironment init](v4, "init");
  v63 = v57;
  objc_storeStrong((id *)&v63, v57);
  if (v57)
  {
    objc_storeWeak((id *)&v63->_connection, location[0]);
    objc_storeWeak((id *)&v63->_templateProvider, v61);
    v5 = (NSString *)(id)objc_msgSend(location[0], "cp_bundleIdentifier");
    bundleIdentifier = v63->_bundleIdentifier;
    v63->_bundleIdentifier = v5;

    v47 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-maps"));
    v7 = objc_msgSend(v47, "BOOLValue");
    v63->_hasNavigationEntitlement = v7 & 1;

    v48 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-audio"));
    v8 = objc_msgSend(v48, "BOOLValue");
    v63->_hasAudioEntitlement = v8 & 1;

    v49 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-communication"));
    v9 = objc_msgSend(v49, "BOOLValue");
    v63->_hasCommunicationEntitlement = v9 & 1;

    v50 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-charging"));
    v10 = objc_msgSend(v50, "BOOLValue");
    v63->_hasChargingEntitlement = v10 & 1;

    v51 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-parking"));
    v11 = objc_msgSend(v51, "BOOLValue");
    v63->_hasParkingEntitlement = v11 & 1;

    v52 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-quick-ordering"));
    v12 = objc_msgSend(v52, "BOOLValue");
    v63->_hasQuickOrderingEntitlement = v12 & 1;

    v53 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-public-safety"));
    v13 = objc_msgSend(v53, "BOOLValue");
    v63->_hasPublicSafetyEntitlement = v13 & 1;

    v54 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-fueling"));
    v14 = objc_msgSend(v54, "BOOLValue");
    v63->_hasFuelingEntitlement = v14 & 1;

    v55 = (id)objc_msgSend(location[0], "valueForEntitlement:", CFSTR("com.apple.developer.carplay-driving-task"));
    v15 = objc_msgSend(v55, "BOOLValue");
    v63->_hasDrivingTaskEntitlement = v15 & 1;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_2553F1160);
    environmentObservers = v63->_environmentObservers;
    v63->_environmentObservers = (CARObserverHashTable *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE15240]), "initWithOptions:", 5);
    sessionStatus = v63->_sessionStatus;
    v63->_sessionStatus = (CARSessionStatus *)v18;

    if (v63->_hasNavigationEntitlement)
    {
      v20 = (NSSet *)CPSNavigationTemplateClasses();
      allowedTemplateClasses = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v20;

    }
    else if (v63->_hasAudioEntitlement)
    {
      v22 = (NSSet *)CPSAudioTemplateClasses();
      v23 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v22;

    }
    else if (v63->_hasCommunicationEntitlement)
    {
      v24 = (NSSet *)CPSCommunicationTemplateClasses();
      v25 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v24;

    }
    else if (v63->_hasChargingEntitlement || v63->_hasParkingEntitlement)
    {
      v26 = (NSSet *)CPSChargingParkingTemplateClasses();
      v27 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v26;

    }
    else if (v63->_hasQuickOrderingEntitlement)
    {
      v28 = (NSSet *)CPSQuickOrderingTemplateClasses();
      v29 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v28;

    }
    else if (v63->_hasPublicSafetyEntitlement)
    {
      v30 = (NSSet *)CPSPublicSafetyTemplateClasses();
      v31 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v30;

    }
    else if (v63->_hasFuelingEntitlement)
    {
      v32 = (NSSet *)CPSFuelingTemplateClasses();
      v33 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v32;

    }
    else if (v63->_hasDrivingTaskEntitlement)
    {
      v34 = (NSSet *)CPSDrivingTaskTemplateClasses();
      v35 = v63->_allowedTemplateClasses;
      v63->_allowedTemplateClasses = v34;

    }
    hasPublicSafetyEntitlement = 1;
    if (!v63->_hasAudioEntitlement)
    {
      hasPublicSafetyEntitlement = 1;
      if (!v63->_hasCommunicationEntitlement)
        hasPublicSafetyEntitlement = v63->_hasPublicSafetyEntitlement;
    }
    v63->_canBecomeNowPlayingApp = hasPublicSafetyEntitlement & 1;
    v41 = (void *)MEMORY[0x24BDC1538];
    v42 = -[CPSTemplateEnvironment bundleIdentifier](v63, "bundleIdentifier");
    v60 = (id)objc_msgSend(v41, "applicationProxyForIdentifier:");

    v43 = (id)objc_msgSend(v60, "bundleType");
    v36 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BDC1518]);
    v63->_isUserApplication = v36 & 1;

    v44 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
    v59 = (id)objc_msgSend(v60, "objectsForInfoDictionaryKeys:");

    v58 = (id)objc_msgSend(v59, "dictionaryForKey:", CFSTR("UIApplicationSceneManifest"));
    v45 = (id)objc_msgSend(v58, "objectForKey:", CFSTR("CPSupportsInstrumentClusterNavigationScene"));
    v37 = objc_msgSend(v45, "BOOLValue");
    v63->_supportsInstrumentCluster = v37 & 1;

    if (-[CPSTemplateEnvironment canBecomeNowPlayingApp](v63, "canBecomeNowPlayingApp"))
    {
      v40 = (id)objc_msgSend(MEMORY[0x24BE153A8], "sharedManager");
      objc_msgSend(v40, "addNowPlayingObserver:", v63);

    }
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v60, 0);
  }
  v39 = v63;
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v63, 0);
  return v39;
}

- (BOOL)hasAnyTemplateEntitlement
{
  BOOL v3;

  v3 = 1;
  if (!-[CPSTemplateEnvironment hasNavigationEntitlement](self, "hasNavigationEntitlement"))
  {
    v3 = 1;
    if (!-[CPSTemplateEnvironment hasAudioEntitlement](self, "hasAudioEntitlement"))
    {
      v3 = 1;
      if (!-[CPSTemplateEnvironment hasCommunicationEntitlement](self, "hasCommunicationEntitlement"))
      {
        v3 = 1;
        if (!-[CPSTemplateEnvironment hasChargingEntitlement](self, "hasChargingEntitlement"))
        {
          v3 = 1;
          if (!-[CPSTemplateEnvironment hasParkingEntitlement](self, "hasParkingEntitlement"))
          {
            v3 = 1;
            if (!-[CPSTemplateEnvironment hasQuickOrderingEntitlement](self, "hasQuickOrderingEntitlement"))
            {
              v3 = 1;
              if (!-[CPSTemplateEnvironment hasPublicSafetyEntitlement](self, "hasPublicSafetyEntitlement"))
              {
                v3 = 1;
                if (!-[CPSTemplateEnvironment hasFuelingEntitlement](self, "hasFuelingEntitlement"))
                  return -[CPSTemplateEnvironment hasDrivingTaskEntitlement](self, "hasDrivingTaskEntitlement");
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (unint64_t)maximumTabs
{
  if (-[CPSTemplateEnvironment hasAudioEntitlement](self, "hasAudioEntitlement"))
    return 4;
  else
    return 5;
}

- (unint64_t)maximumClientHierarchyDepth
{
  if (-[CPSTemplateEnvironment hasQuickOrderingEntitlement](self, "hasQuickOrderingEntitlement")
    || -[CPSTemplateEnvironment hasDrivingTaskEntitlement](self, "hasDrivingTaskEntitlement"))
  {
    return 2;
  }
  if (-[CPSTemplateEnvironment hasFuelingEntitlement](self, "hasFuelingEntitlement"))
    return 3;
  return 5;
}

- (void)addTemplateEnvironmentDelegate:(id)a3
{
  NSObject *queue;
  CARObserverHashTable *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id location[2];
  CPSTemplateEnvironment *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSTemplateEnvironment environmentObservers](v12, "environmentObservers");
  -[CARObserverHashTable addObserver:](v4, "addObserver:", location[0]);

  if (-[CPSTemplateEnvironment isNowPlayingApp](v12, "isNowPlayingApp"))
  {
    queue = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __57__CPSTemplateEnvironment_addTemplateEnvironmentDelegate___block_invoke;
    v9 = &unk_24E26F1B8;
    v10 = location[0];
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __57__CPSTemplateEnvironment_addTemplateEnvironmentDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applicationDidBecomeNowPlayingApp:", 1, a1, a1);
}

- (BOOL)rightHandDrive
{
  id v3;
  id v4;
  CARSessionStatus *v5;
  char v6;

  v5 = -[CPSTemplateEnvironment sessionStatus](self, "sessionStatus");
  v4 = (id)-[CARSessionStatus currentSession](v5, "currentSession");
  v3 = (id)objc_msgSend(v4, "configuration");
  v6 = objc_msgSend(v3, "rightHandDrive");

  return v6 & 1;
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  char v4;
  NSString *v6;
  id v7;
  CARObserverHashTable *v8;
  id v9;
  id location[2];
  CPSTemplateEnvironment *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = (id)objc_msgSend(v9, "bundleIdentifier");
  v6 = -[CPSTemplateEnvironment bundleIdentifier](v11, "bundleIdentifier");
  v4 = objc_msgSend(v7, "isEqualToString:");
  v11->_isNowPlayingApp = v4 & 1;

  v8 = -[CPSTemplateEnvironment environmentObservers](v11, "environmentObservers");
  -[CARObserverHashTable applicationDidBecomeNowPlayingApp:](v8, "applicationDidBecomeNowPlayingApp:", -[CPSTemplateEnvironment isNowPlayingApp](v11, "isNowPlayingApp"));

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)applicationSupportsIntentWithIdentifier:(id)a3 error:(id *)a4
{
  id v4;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  id v14;
  NSString *v15;
  os_log_t v16;
  os_log_type_t v17;
  os_log_t oslog;
  os_log_type_t v19;
  id v20;
  int v21;
  os_log_type_t v22;
  id v23;
  id v24;
  id *v25;
  id location[2];
  CPSTemplateEnvironment *v27;
  char v28;
  uint64_t v29;
  id v30;
  uint8_t v31[32];
  uint8_t v32[32];
  uint8_t v33[32];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = a4;
  v14 = objc_alloc(MEMORY[0x24BDC1540]);
  v15 = -[CPSTemplateEnvironment bundleIdentifier](v27, "bundleIdentifier");
  v24 = (id)objc_msgSend(v14, "initWithBundleIdentifier:allowPlaceholder:error:");

  if (v24)
  {
    if (-[CPSTemplateEnvironment _applicationRecord:supportsIntentWithIdentifierInExtensions:error:](v27, "_applicationRecord:supportsIntentWithIdentifierInExtensions:error:", v24, location[0], v25))
    {
      v20 = CarPlaySupportGeneralLogging();
      v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[CPSTemplateEnvironment bundleIdentifier](v27, "bundleIdentifier");
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v33, (uint64_t)v11, (uint64_t)location[0]);
        _os_log_impl(&dword_21E389000, (os_log_t)v20, v19, "Application %{public}@ supports intent %{public}@ in extensions", v33, 0x16u);

      }
      objc_storeStrong(&v20, 0);
      v28 = 1;
      v21 = 1;
    }
    else if (-[CPSTemplateEnvironment _applicationRecord:supportsIntentWithIdentifier:error:](v27, "_applicationRecord:supportsIntentWithIdentifier:error:", v24, location[0], v25))
    {
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[CPSTemplateEnvironment bundleIdentifier](v27, "bundleIdentifier");
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v32, (uint64_t)v10, (uint64_t)location[0]);
        _os_log_impl(&dword_21E389000, oslog, v17, "Application %{public}@ supports intent %{public}@ in app", v32, 0x16u);

      }
      objc_storeStrong((id *)&oslog, 0);
      v28 = 1;
      v21 = 1;
    }
    else
    {
      v16 = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[CPSTemplateEnvironment bundleIdentifier](v27, "bundleIdentifier");
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v31, (uint64_t)v9, (uint64_t)location[0]);
        _os_log_impl(&dword_21E389000, v16, OS_LOG_TYPE_DEFAULT, "Application %{public}@ does not support intent %{public}@", v31, 0x16u);

      }
      objc_storeStrong((id *)&v16, 0);
      if (v25)
      {
        v6 = (void *)MEMORY[0x24BDD1540];
        v29 = *MEMORY[0x24BDD0FC8];
        v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Application does not support required intent: %@"), location[0]);
        v30 = v8;
        v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v4 = (id)objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("CPSErrorDomain"), -1);
        *v25 = v4;

      }
      v28 = 0;
      v21 = 1;
    }
  }
  else
  {
    v23 = CarPlaySupportGeneralLogging();
    v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[CPSTemplateEnvironment bundleIdentifier](v27, "bundleIdentifier");
      __os_log_helper_16_2_1_8_66((uint64_t)v34, (uint64_t)v12);
      _os_log_impl(&dword_21E389000, (os_log_t)v23, v22, "Failed to lookup app record for %{public}@", v34, 0xCu);

    }
    objc_storeStrong(&v23, 0);
    v28 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

- (BOOL)_applicationRecord:(id)a3 supportsIntentWithIdentifierInExtensions:(id)a4 error:(id *)a5
{
  char v6;
  id v7;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *, _BYTE *);
  void *v14;
  id v15[2];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  char v21;
  id *v22;
  id v23;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x20000000;
  v20 = 32;
  v21 = 0;
  v16 = (id)objc_msgSend(location[0], "applicationExtensionRecords");
  if (objc_msgSend(v16, "count"))
  {
    v7 = v16;
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __92__CPSTemplateEnvironment__applicationRecord_supportsIntentWithIdentifierInExtensions_error___block_invoke;
    v14 = &unk_24E26F690;
    v15[0] = v23;
    v15[1] = &v17;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v10);
    objc_storeStrong(v15, 0);
  }
  v6 = *((_BYTE *)v18 + 24);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

void __92__CPSTemplateEnvironment__applicationRecord_supportsIntentWithIdentifierInExtensions_error___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  char v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = (id)objc_msgSend(location[0], "supportedIntents");
  v6 = objc_msgSend(v5, "containsObject:", a1[4]);

  if ((v6 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a3 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_applicationRecord:(id)a3 supportsIntentWithIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  char v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = (id)objc_msgSend(location[0], "supportedIntents");
  v8 = objc_msgSend(v7, "containsObject:", v9);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (CPTemplateProviding)templateProvider
{
  return (CPTemplateProviding *)objc_loadWeakRetained((id *)&self->_templateProvider);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)canBecomeNowPlayingApp
{
  return self->_canBecomeNowPlayingApp;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (BOOL)hasNavigationEntitlement
{
  return self->_hasNavigationEntitlement;
}

- (BOOL)hasAudioEntitlement
{
  return self->_hasAudioEntitlement;
}

- (BOOL)hasCommunicationEntitlement
{
  return self->_hasCommunicationEntitlement;
}

- (BOOL)hasChargingEntitlement
{
  return self->_hasChargingEntitlement;
}

- (BOOL)hasParkingEntitlement
{
  return self->_hasParkingEntitlement;
}

- (BOOL)hasQuickOrderingEntitlement
{
  return self->_hasQuickOrderingEntitlement;
}

- (BOOL)hasPublicSafetyEntitlement
{
  return self->_hasPublicSafetyEntitlement;
}

- (BOOL)hasFuelingEntitlement
{
  return self->_hasFuelingEntitlement;
}

- (BOOL)hasDrivingTaskEntitlement
{
  return self->_hasDrivingTaskEntitlement;
}

- (BOOL)supportsInstrumentCluster
{
  return self->_supportsInstrumentCluster;
}

- (NSSet)allowedTemplateClasses
{
  return self->_allowedTemplateClasses;
}

- (BOOL)isUserApplication
{
  return self->_isUserApplication;
}

- (CARObserverHashTable)environmentObservers
{
  return self->_environmentObservers;
}

- (void)setEnvironmentObservers:(id)a3
{
  objc_storeStrong((id *)&self->_environmentObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentObservers, 0);
  objc_storeStrong((id *)&self->_allowedTemplateClasses, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_destroyWeak((id *)&self->_templateProvider);
  objc_destroyWeak((id *)&self->_connection);
}

@end
