@implementation FSModuleHost

- (FSModuleHost)init
{
  FSModuleHost *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *callbackQueue;
  NSArray *moduleOrder;
  NSArray *enabledModules;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FSModuleHost;
  v2 = -[FSModuleHost init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("FPDExtensionManager callback queue", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    moduleOrder = v2->_moduleOrder;
    v2->_moduleOrder = 0;

    enabledModules = v2->_enabledModules;
    v2->_enabledModules = 0;

  }
  return v2;
}

- (void)setExtensionsLocked:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSDictionary *v7;
  NSArray *v8;
  NSArray *modules;
  NSDictionary *modulesByIdentifier;
  NSDictionary *v11;
  _QWORD v12[4];
  NSDictionary *v13;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__FSModuleHost_setExtensionsLocked___block_invoke;
  v12[3] = &unk_250C325E0;
  v7 = v6;
  v13 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  v8 = (NSArray *)objc_msgSend(v5, "copy");

  modules = self->_modules;
  self->_modules = v8;

  modulesByIdentifier = self->_modulesByIdentifier;
  self->_modulesByIdentifier = v7;
  v11 = v7;

  -[NSCondition signal](self->_queryLock, "signal");
}

void __36__FSModuleHost_setExtensionsLocked___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

+ (id)installedExtensionPropertiesSync
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  +[FSModuleHost installedExtensionsSync](FSModuleHost, "installedExtensionsSync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke;
    v9[3] = &unk_250C32608;
    v5 = v4;
    v10 = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
    v6 = v10;
    v7 = v5;

  }
  else
  {
    v7 = (id)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

void __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FSShortName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_fskit"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FSSupportsBlockResources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v5 == 0;
  else
    v11 = 1;
  if (!v11 && objc_msgSend(v9, "BOOLValue"))
  {
    objc_msgSend(v5, "setValue:forKey:", v8, *MEMORY[0x24BDBD298]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("FSIsFSModule"));

    objc_msgSend(v5, "setValue:forKey:", &unk_250C3F428, CFSTR("FSImplementation"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FSMediaTypes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FSPersonalities"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13 && v14)
    {
      objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("FSMediaTypes"));
      objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("FSPersonalities"));
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      fskit_std_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_impl(&dword_23B2A6000, v16, OS_LOG_TYPE_DEFAULT, "Found FSModule: %@", buf, 0xCu);
      }
    }
    else
    {
      fskit_std_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke_cold_1();
    }

  }
}

- (NSArray)modules
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)modulesByIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (NSCondition)queryLock
{
  return (NSCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueryLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (_EXQueryController)queryController
{
  return (_EXQueryController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQueryController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)queryReceivedFirstDelegateCall
{
  return self->_queryReceivedFirstDelegateCall;
}

- (void)setQueryReceivedFirstDelegateCall:(BOOL)a3
{
  self->_queryReceivedFirstDelegateCall = a3;
}

- (id)modulesLoaded
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setModulesLoaded:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (id)modulesUnloaded
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setModulesUnloaded:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modulesUnloaded, 0);
  objc_storeStrong(&self->_modulesLoaded, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_queryLock, 0);
  objc_storeStrong((id *)&self->_modulesByIdentifier, 0);
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_enabledModules, 0);
  objc_storeStrong((id *)&self->_moduleOrder, 0);
  objc_storeStrong((id *)&self->_moduleUUIDs, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (FSModuleHost)initWithProbeList:(BOOL)a3
{
  _BOOL4 v3;
  FSModuleHost *v4;
  FSModuleHost *v5;
  uint64_t v6;
  NSArray *moduleOrder;
  uint64_t v8;
  NSArray *enabledModules;

  v3 = a3;
  v4 = -[FSModuleHost init](self, "init");
  v5 = v4;
  if (v4 && v3)
  {
    -[FSModuleHost loadProbeOrderList](v4, "loadProbeOrderList");
    v6 = objc_claimAutoreleasedReturnValue();
    moduleOrder = v5->_moduleOrder;
    v5->_moduleOrder = (NSArray *)v6;

    -[FSModuleHost loadEnabledList](v5, "loadEnabledList");
    v8 = objc_claimAutoreleasedReturnValue();
    enabledModules = v5->_enabledModules;
    v5->_enabledModules = (NSArray *)v8;

  }
  return v5;
}

+ (id)defaultHost
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__FSModuleHost_Project__defaultHost__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultHost_onceToken != -1)
    dispatch_once(&defaultHost_onceToken, block);
  return (id)defaultHost_defaultHost;
}

void __36__FSModuleHost_Project__defaultHost__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultHost_defaultHost;
  defaultHost_defaultHost = (uint64_t)v1;

}

+ (id)defaultInstanceUUID
{
  return +[FSEntityIdentifier defaultInstanceUUID](FSEntityIdentifier, "defaultInstanceUUID");
}

+ (id)installedExtensionsSync
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    objc_msgSend(v2, "forceSynchronousProviderUpdate");
  else
    objc_msgSend(v2, "loadModulesFromEKit");
  objc_msgSend(v2, "modulesByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setupSyncronously
{
  objc_msgSend((id)objc_opt_class(), "installedExtensionsSync");

}

- (void)loadModulesFromEKit
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC79E8], "extensionPointIdentifierQuery:", CFSTR("com.apple.fskit.fsmodule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    fskit_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_23B2A6000, v5, OS_LOG_TYPE_DEFAULT, "Found Extensions %@", (uint8_t *)&v7, 0xCu);
    }

    -[NSObject fs_map:](v4, "fs_map:", &__block_literal_global_8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleHost setExtensions:](self, "setExtensions:", v6);

  }
  else
  {
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FSModuleHost(Project) loadModulesFromEKit].cold.1();
  }

}

FSModuleInstance *__44__FSModuleHost_Project__loadModulesFromEKit__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FSModuleInstance instanceWithExtensionIdentity:](FSModuleInstance, "instanceWithExtensionIdentity:", a2);
}

- (void)loadModulesAndMonitor
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD v8[6];
  uint8_t buf[16];

  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23B2A6000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "InitialEnumeration", "Initial enumeration of filesystem modules", buf, 2u);
  }

  if (_os_feature_enabled_impl())
    -[FSModuleHost loadModulesFromLSAndMonitor](self, "loadModulesFromLSAndMonitor");
  else
    -[FSModuleHost loadModulesFromEKit](self, "loadModulesFromEKit");
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__FSModuleHost_Project__loadModulesAndMonitor__block_invoke;
  v8[3] = &unk_250C323B0;
  v8[4] = self;
  v8[5] = v4;
  dispatch_async(callbackQueue, v8);
}

void __46__FSModuleHost_Project__loadModulesAndMonitor__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "afterFirstDiscovery");
  fskit_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_23B2A6000, v3, OS_SIGNPOST_INTERVAL_END, v4, "InitialEnumeration", (const char *)&unk_23B2E5EA2, v5, 2u);
  }

}

- (void)observerDidObserveDatabaseChange:(id)a3
{
  NSObject *v4;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "Got LS database change", buf, 2u);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__FSModuleHost_Project__observerDidObserveDatabaseChange___block_invoke;
  block[3] = &unk_250C32490;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __58__FSModuleHost_Project__observerDidObserveDatabaseChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceSynchronousProviderUpdate");
}

- (void)loadModulesFromLSAndMonitor
{
  NSObject *v3;
  LSObserver *v4;
  LSObserver *observer;
  objc_class *v6;
  void *v7;
  uint8_t v8[16];

  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23B2A6000, v3, OS_LOG_TYPE_DEFAULT, "Loading modules from LS", v8, 2u);
  }

  if (!self->_observer)
  {
    v4 = (LSObserver *)objc_alloc_init(MEMORY[0x24BDC1580]);
    observer = self->_observer;
    self->_observer = v4;

    -[LSObserver setDelegate:](self->_observer, "setDelegate:", self);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSObserver setName:](self->_observer, "setName:", v7);

    -[LSObserver startObserving](self->_observer, "startObserving");
    -[FSModuleHost forceSynchronousProviderUpdate](self, "forceSynchronousProviderUpdate");
  }
}

- (id)extensionTypes
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("com.apple.fskit.fsmodule");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_23B2A6000, v3, OS_LOG_TYPE_DEFAULT, "Returning extension types %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (id)extensionPointRecords
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__FSModuleHost_Project__extensionPointRecords__block_invoke;
  block[3] = &unk_250C32490;
  block[4] = self;
  if (extensionPointRecords_onceToken != -1)
    dispatch_once(&extensionPointRecords_onceToken, block);
  fskit_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = extensionPointRecords_ret;
    _os_log_impl(&dword_23B2A6000, v2, OS_LOG_TYPE_DEFAULT, "returning ep records %@", buf, 0xCu);
  }

  return (id)extensionPointRecords_ret;
}

void __46__FSModuleHost_Project__extensionPointRecords__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "extensionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v11 = objc_alloc(MEMORY[0x24BDC1578]);
        v18 = v9;
        v12 = (void *)objc_msgSend(v11, "initWithIdentifier:platform:error:", v10, 2, &v18);
        v6 = v18;

        fskit_std_log();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "debugDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v24 = v15;
            _os_log_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_DEFAULT, "Adding LS record %@", buf, 0xCu);

          }
          objc_msgSend(v2, "addObject:", v12);
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v24 = v10;
            v25 = 1024;
            v26 = 2;
            v27 = 2112;
            v28 = v6;
            _os_log_error_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_ERROR, "Extension record %@ for platform %d missing: %@", buf, 0x1Cu);
          }

        }
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v16 = objc_msgSend(v2, "copy");
  v17 = (void *)extensionPointRecords_ret;
  extensionPointRecords_ret = v16;

}

- (void)forceSynchronousProviderUpdate
{
  FSModuleHost *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *moduleUUIDs;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FSModuleHost extensionPointRecords](v2, "extensionPointRecords", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x24BDC1528], "enumeratorWithExtensionPointRecord:options:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "fs_map:", &__block_literal_global_138);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  moduleUUIDs = v2->_moduleUUIDs;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(moduleUUIDs) = -[NSSet isEqualToSet:](moduleUUIDs, "isEqualToSet:", v12);

  if ((moduleUUIDs & 1) == 0)
    -[FSModuleHost _updateProviderListForMatchingExtensionRecords:](v2, "_updateProviderListForMatchingExtensionRecords:", v3);

  objc_sync_exit(v2);
}

uint64_t __55__FSModuleHost_Project__forceSynchronousProviderUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (unsigned)isValidModuleIdentifier:(id)a3 WithError:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unsigned __int8 v10;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    fskit_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = CFSTR("/:");
      _os_log_impl(&dword_23B2A6000, v9, OS_LOG_TYPE_DEFAULT, "Provider identifier '%@' may not contain any of the characters '%@'", buf, 0x16u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "fskit_errorWithPOSIXCode:description:", 22, CFSTR("Provider identifier '%@' may not contain any of the characters '%@'"), v5, CFSTR("/:"));
      goto LABEL_12;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_15;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR(".")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("..")))
  {
    v10 = 1;
    goto LABEL_15;
  }
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
  }

  if (!a4)
    goto LABEL_13;
LABEL_12:
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

- (void)_updateProviderListForMatchingExtensionRecords:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__FSModuleHost_Project___updateProviderListForMatchingExtensionRecords___block_invoke;
  v5[3] = &unk_250C326B0;
  v5[4] = self;
  objc_msgSend(a3, "fs_map:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FSModuleHost _updateProviderListForFilteredFSModileInstances:](self, "_updateProviderListForFilteredFSModileInstances:", v4);

}

FSModuleInstance *__72__FSModuleHost_Project___updateProviderListForMatchingExtensionRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  FSModuleInstance *v6;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "isValidModuleIdentifier:WithError:", v4, 0))
    v6 = -[FSModuleInstance initWithExtensionRecord:enabled:]([FSModuleInstance alloc], "initWithExtensionRecord:enabled:", v3, v5);
  else
    v6 = 0;

  return v6;
}

- (void)_updateProviderListForFilteredFSModileInstances:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *moduleUUIDs;
  NSObject *v14;
  NSObject *v15;
  NSDictionary *modulesByIdentifier;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSDictionary *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  FSModuleHost *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  NSArray *moduleOrder;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _BOOL4 v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  NSArray *enabledModules;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  NSDictionary *v69;
  id v70;
  void *v71;
  void *v72;
  id obj;
  FSModuleHost *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  NSDictionary *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x23B861B50]();
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_opt_new();
  -[NSDictionary allValues](self->_modulesByIdentifier, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v8, "mutableCopy");

  v9 = (void *)objc_msgSend(v4, "mutableCopy");
  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v9, "fs_map:", &__block_literal_global_154);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  moduleUUIDs = self->_moduleUUIDs;
  self->_moduleUUIDs = v12;

  objc_msgSend(v4, "fs_map:", &__block_literal_global_155);
  v69 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v95 = v69;
    _os_log_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_DEFAULT, "New module list %@", buf, 0xCu);
  }
  v72 = (void *)v7;

  fskit_std_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    modulesByIdentifier = self->_modulesByIdentifier;
    *(_DWORD *)buf = 138412290;
    v95 = modulesByIdentifier;
    _os_log_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEFAULT, "Old modules %@", buf, 0xCu);
  }
  v74 = self;

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v9;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v88 != v19)
          objc_enumerationMutation(obj);
        v21 = *(NSDictionary **)(*((_QWORD *)&v87 + 1) + 8 * i);
        -[NSDictionary bundleIdentifier](v21, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[NSDictionary objectForKeyedSubscript:](v74->_modulesByIdentifier, "objectForKeyedSubscript:", v22);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23 && -[NSObject isEqual:](v23, "isEqual:", v21))
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v22);
            objc_msgSend(v71, "removeObject:", v24);
          }
          else
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v22);
            objc_msgSend(v72, "addObject:", v22);
          }
        }
        else
        {
          fskit_std_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v21;
            _os_log_impl(&dword_23B2A6000, v24, OS_LOG_TYPE_DEFAULT, "%@: module has no bundle identifier", buf, 0xCu);
          }
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    }
    while (v18);
  }

  v25 = v74;
  -[FSModuleHost setExtensionsByIdentifierLocked:](v74, "setExtensionsByIdentifierLocked:", v6);
  v26 = MEMORY[0x24BDAC760];
  v27 = 0x24BDBC000uLL;
  if (v74->_moduleOrder)
  {
    v28 = v72;
    if (objc_msgSend(v72, "count") || objc_msgSend(v71, "count"))
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v74->_moduleOrder);
      v85[0] = v26;
      v85[1] = 3221225472;
      v85[2] = __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_158;
      v85[3] = &unk_250C325E0;
      v30 = v29;
      v86 = v30;
      objc_msgSend(v71, "enumerateObjectsUsingBlock:", v85);
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v72);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v74->_moduleOrder);
      objc_msgSend(v31, "minusSet:", v32);

      v33 = objc_msgSend(v31, "count");
      v34 = v33 != 0;
      if (v33)
      {
        v65 = v5;
        v67 = v4;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v70 = v31;
        v35 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v82;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              v39 = v31;
              if (*(_QWORD *)v82 != v37)
                objc_enumerationMutation(v70);
              v40 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
              objc_msgSend(v6, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "identity");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "isSystem");

              if (v43)
                objc_msgSend(v30, "addObject:", v40);
              else
                objc_msgSend(v30, "insertObject:atIndex:", v40, 0);
              v31 = v39;
            }
            v36 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
          }
          while (v36);
        }

        v5 = v65;
        v4 = v67;
        v25 = v74;
        v28 = v72;
        v34 = 1;
        v27 = 0x24BDBC000;
      }
      v44 = objc_msgSend(v30, "copy");
      moduleOrder = v25->_moduleOrder;
      v25->_moduleOrder = (NSArray *)v44;

      v26 = MEMORY[0x24BDAC760];
    }
    else
    {
      v34 = 0;
    }
  }
  else
  {
    v34 = 0;
    v28 = v72;
  }
  if (v25->_enabledModules && (objc_msgSend(v28, "count") || objc_msgSend(v71, "count")))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v25->_enabledModules);
    v79[0] = v26;
    v79[1] = 3221225472;
    v79[2] = __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_2_160;
    v79[3] = &unk_250C325E0;
    v47 = v46;
    v80 = v47;
    objc_msgSend(v71, "enumerateObjectsUsingBlock:", v79);
    v48 = (void *)objc_msgSend(objc_alloc(*(Class *)(v27 + 3824)), "initWithArray:", v28);
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v25->_enabledModules);
    objc_msgSend(v48, "minusSet:", v49);

    v50 = objc_msgSend(v48, "count");
    v51 = v50 != 0;
    if (v50)
    {
      v64 = v34;
      v66 = v5;
      v68 = v4;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v63 = v48;
      v52 = v48;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v76;
        do
        {
          for (k = 0; k != v54; ++k)
          {
            if (*(_QWORD *)v76 != v55)
              objc_enumerationMutation(v52);
            v57 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
            objc_msgSend(v6, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "identity");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "isEnabled");

            if (v60)
              objc_msgSend(v47, "addObject:", v57);
          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
        }
        while (v54);
      }

      v5 = v66;
      v4 = v68;
      v25 = v74;
      v28 = v72;
      v34 = v64;
      v51 = 1;
      v48 = v63;
    }
    v61 = objc_msgSend(v47, "copy");
    enabledModules = v25->_enabledModules;
    v25->_enabledModules = (NSArray *)v61;

  }
  else
  {
    v51 = 0;
  }
  if (v25->_modulesUnloaded && objc_msgSend(v71, "count"))
    (*((void (**)(void))v25->_modulesUnloaded + 2))();
  if (v25->_modulesLoaded && ((objc_msgSend(v28, "count") == 0) & ~v34) == 0)
    (*((void (**)(void))v25->_modulesLoaded + 2))();
  if (v34)
    -[FSModuleHost saveProbeOrderList](v25, "saveProbeOrderList");
  if (v51)
    -[FSModuleHost saveEnabledList](v25, "saveEnabledList");

  objc_autoreleasePoolPop(v5);
}

uint64_t __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

id __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Mod %p ID '%@' UUID %@"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_158(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

void __73__FSModuleHost_Project___updateProviderListForFilteredFSModileInstances___block_invoke_2_160(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

+ (id)defaultProbeOrderList
{
  return &unk_250C3F440;
}

- (id)loadProbeOrderList
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v10;

  +[FSSettings defaultSettings](FSSettings, "defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "probeOrderArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfURL:error:", v3, &v10);
  v5 = v10;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultProbeOrderList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      {
        v7 = objc_msgSend(v5, "code");

        if (v7 == 260)
          goto LABEL_12;
      }
      else
      {

      }
      fskit_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FSModuleHost(Project) loadProbeOrderList].cold.2();
    }
    else
    {
      fskit_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FSModuleHost(Project) loadProbeOrderList].cold.1();
    }

  }
LABEL_12:

  return v4;
}

- (void)saveProbeOrderList
{
  void *v3;
  void *v4;
  NSArray *moduleOrder;
  id v6;
  NSObject *v7;
  id v8;

  +[FSSettings defaultSettings](FSSettings, "defaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "probeOrderArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  moduleOrder = self->_moduleOrder;
  v8 = 0;
  -[NSArray writeToURL:error:](moduleOrder, "writeToURL:error:", v4, &v8);
  v6 = v8;
  if (v6)
  {
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FSModuleHost(Project) saveProbeOrderList].cold.1();

  }
}

- (id)loadEnabledList
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v10;

  +[FSSettings defaultSettings](FSSettings, "defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledModulesArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfURL:error:", v3, &v10);
  v5 = v10;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultProbeOrderList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      {
        v7 = objc_msgSend(v5, "code");

        if (v7 == 260)
          goto LABEL_12;
      }
      else
      {

      }
      fskit_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FSModuleHost(Project) loadEnabledList].cold.2();
    }
    else
    {
      fskit_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FSModuleHost(Project) loadEnabledList].cold.1();
    }

  }
LABEL_12:

  return v4;
}

- (void)saveEnabledList
{
  void *v3;
  void *v4;
  NSArray *enabledModules;
  id v6;
  NSObject *v7;
  id v8;

  +[FSSettings defaultSettings](FSSettings, "defaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledModulesArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  enabledModules = self->_enabledModules;
  v8 = 0;
  -[NSArray writeToURL:error:](enabledModules, "writeToURL:error:", v4, &v8);
  v6 = v8;
  if (v6)
  {
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FSModuleHost(Project) saveEnabledList].cold.1();

  }
}

- (void)setExtensions:(id)a3
{
  NSCondition *queryLock;
  id v5;

  queryLock = self->_queryLock;
  v5 = a3;
  -[NSCondition lock](queryLock, "lock");
  -[FSModuleHost setExtensionsLocked:](self, "setExtensionsLocked:", v5);

  -[NSCondition unlock](self->_queryLock, "unlock");
}

- (void)setExtensionsByIdentifierLocked:(id)a3
{
  NSDictionary *v4;
  NSDictionary *modulesByIdentifier;
  NSArray *v6;
  NSArray *modules;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  modulesByIdentifier = self->_modulesByIdentifier;
  self->_modulesByIdentifier = v4;

  -[NSDictionary allValues](self->_modulesByIdentifier, "allValues");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  modules = self->_modules;
  self->_modules = v6;

}

- (id)configurationForDefaultInstanceOf:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDC79D8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithExtensionIdentity:", v4);

  return v5;
}

- (id)configurationForDefaultInstanceOfBundle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[FSModuleHost moduleForBundleID:](self, "moduleForBundleID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDC79C0]);
    objc_msgSend(v3, "record");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithApplicationExtensionRecord:", v5);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79D8]), "initWithExtensionIdentity:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)configurationForInstance:(id)a3 ofBundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[FSModuleHost moduleForBundleID:](self, "moduleForBundleID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDC79C0]);
    objc_msgSend(v7, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithApplicationExtensionRecord:", v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79D8]), "initWithExtensionIdentity:instanceIdentifier:", v10, v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)currentExtensions
{
  void *v3;
  NSArray *modules;
  NSArray *v5;
  BOOL v6;
  NSCondition *queryLock;
  NSArray *v8;
  NSArray *v9;
  NSObject *v10;
  int v12;
  NSArray *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCondition lock](self->_queryLock, "lock");
  modules = self->_modules;
  v5 = modules;
  if (!modules)
  {
    do
    {
      v6 = -[NSCondition waitUntilDate:](self->_queryLock, "waitUntilDate:", v3);
      modules = self->_modules;
    }
    while (!modules && v6);
    if (modules)
      v5 = self->_modules;
    else
      v5 = (NSArray *)MEMORY[0x24BDBD1A8];
  }
  queryLock = self->_queryLock;
  v8 = modules;
  -[NSCondition unlock](queryLock, "unlock");
  v9 = v5;

  fskit_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_23B2A6000, v10, OS_LOG_TYPE_DEFAULT, "Returning module array %@", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (id)moduleForBundleID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSDictionary *modulesByIdentifier;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCondition lock](self->_queryLock, "lock");
  if (!self->_modules)
  {
    do
      v6 = -[NSCondition waitUntilDate:](self->_queryLock, "waitUntilDate:", v5);
    while (!self->_modules && v6);
  }
  modulesByIdentifier = self->_modulesByIdentifier;
  if (modulesByIdentifier)
  {
    -[NSDictionary objectForKeyedSubscript:](modulesByIdentifier, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[NSCondition unlock](self->_queryLock, "unlock");

  return v8;
}

- (NSDictionary)currentExtensionsByIdentifier
{
  void *v3;
  BOOL v4;
  NSDictionary *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCondition lock](self->_queryLock, "lock");
  if (!self->_modules)
  {
    do
      v4 = -[NSCondition waitUntilDate:](self->_queryLock, "waitUntilDate:", v3);
    while (!self->_modules && v4);
  }
  v5 = self->_modulesByIdentifier;
  -[NSCondition unlock](self->_queryLock, "unlock");
  if (v5)
  {
    v6 = (void *)-[NSDictionary copy](v5, "copy");

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }

  return (NSDictionary *)v6;
}

- (void)addBundleToEnableModules:(id)a3
{
  id v4;
  NSArray *enabledModules;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  id v12;

  v4 = a3;
  enabledModules = self->_enabledModules;
  v12 = v4;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enabledModules) = -[NSArray containsObject:](enabledModules, "containsObject:", v6);

  if ((enabledModules & 1) == 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_enabledModules);
    objc_msgSend(v12, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = (NSArray *)objc_msgSend(v7, "copy");
    v10 = self->_enabledModules;
    self->_enabledModules = v9;

    objc_msgSend(v12, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

    -[FSModuleHost saveEnabledList](self, "saveEnabledList");
  }

}

- (void)removeBundleFromEnabledModules:(id)a3
{
  id v4;
  NSArray *enabledModules;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  id v12;

  v4 = a3;
  enabledModules = self->_enabledModules;
  v12 = v4;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(enabledModules) = -[NSArray containsObject:](enabledModules, "containsObject:", v6);

  if ((_DWORD)enabledModules)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_enabledModules);
    objc_msgSend(v12, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

    v9 = (NSArray *)objc_msgSend(v7, "copy");
    v10 = self->_enabledModules;
    self->_enabledModules = v9;

    objc_msgSend(v12, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    -[FSModuleHost saveEnabledList](self, "saveEnabledList");
  }

}

void __48__FSModuleHost_installedExtensionPropertiesSync__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_23B2A6000, v0, v1, "FSModule missing information", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

@end
