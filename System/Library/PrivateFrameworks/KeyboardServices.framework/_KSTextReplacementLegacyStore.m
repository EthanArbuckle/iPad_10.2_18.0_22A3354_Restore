@implementation _KSTextReplacementLegacyStore

- (id)managedObjectModelURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("UserDictionary"), CFSTR("mom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", v4);

  objc_msgSend(v5, "setBool:forKey:", -[_KSTextReplacementLegacyStore shouldUpdateTheCache](self, "shouldUpdateTheCache"), CFSTR("KSLSShouldUpdateCache"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  if (self->_suspendedForAccountChange)
  {
    -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v7);

    self->_suspendedForAccountChange = 0;
  }
  softLinkBRDaemonConnectionInvalidate();

  v8.receiver = self;
  v8.super_class = (Class)_KSTextReplacementLegacyStore;
  -[_KSTextReplacementLegacyStore dealloc](&v8, sel_dealloc);
}

- (_KSTextReplacementLegacyStore)initWithBaseURL:(id)a3
{
  id v5;
  _KSTextReplacementLegacyStore *v6;
  _KSTextReplacementLegacyStore *v7;
  _KSTextReplacementLegacyStore *v8;
  uint64_t v9;
  NSString *cacheFilePath;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  _KSTextReplacementLegacyStore *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_KSTextReplacementLegacyStore;
  v6 = -[_KSTextReplacementLegacyStore init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49___KSTextReplacementLegacyStore_initWithBaseURL___block_invoke;
    block[3] = &unk_24E204790;
    v8 = v6;
    v19 = v8;
    if (initWithBaseURL__onceToken != -1)
      dispatch_once(&initWithBaseURL__onceToken, block);
    objc_storeStrong((id *)&v8->_workQueue, (id)initWithBaseURL__cdWorkQueueShared);
    objc_storeStrong((id *)&v8->_persistentStoreCoordinator, (id)initWithBaseURL__pscShared);
    objc_storeStrong((id *)&v8->_baseURL, a3);
    objc_msgSend((id)objc_opt_class(), "cachedStorePath");
    v9 = objc_claimAutoreleasedReturnValue();
    cacheFilePath = v8->_cacheFilePath;
    v8->_cacheFilePath = (NSString *)v9;

    -[_KSTextReplacementLegacyStore setMinimumUptimeDidExpire:](v8, "setMinimumUptimeDidExpire:", 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementLegacyStore setPersistentStoreDidLoadTime:](v8, "setPersistentStoreDidLoadTime:", v11);

    v12 = objc_alloc(MEMORY[0x24BDBCF50]);
    +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithSuiteName:", v13);

    v8->_shouldUpdateTheCache = objc_msgSend(v14, "BOOLForKey:", CFSTR("KSLSShouldUpdateCache"));
    v8->_shouldDisableCaching = objc_msgSend(v14, "BOOLForKey:", CFSTR("KSShouldDisableCaching"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel_cleanup, CFSTR("_KSTRShouldCleanupResources"), 0);

    if (!v8->_shouldDisableCaching)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel_iCloudAccountDidChange_, *MEMORY[0x24BDD1380], 0);

    }
  }

  return v7;
}

- (_KSTextReplacementLegacyStore)init
{
  void *v3;
  _KSTextReplacementLegacyStore *v4;

  objc_msgSend((id)objc_opt_class(), "basePersistentStoreURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_KSTextReplacementLegacyStore initWithBaseURL:](self, "initWithBaseURL:", v3);

  return v4;
}

- (double)minimumUptimeRemaining
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55___KSTextReplacementLegacyStore_minimumUptimeRemaining__block_invoke;
  v7[3] = &unk_24E2055B0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)cleanup
{
  NSObject *v3;
  _QWORD block[5];

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___KSTextReplacementLegacyStore_cleanup__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSManagedObjectContext)managedObjectContext
{
  NSObject *v3;
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *v7;
  void *v8;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  managedObjectContext = self->_managedObjectContext;
  if (!managedObjectContext)
  {
    v5 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    v6 = self->_managedObjectContext;
    self->_managedObjectContext = v5;

    -[NSManagedObjectContext _setDelegate:](self->_managedObjectContext, "_setDelegate:", self);
    v7 = self->_managedObjectContext;
    -[_KSTextReplacementLegacyStore persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v7, "setPersistentStoreCoordinator:", v8);

    -[NSManagedObjectContext setMergePolicy:](self->_managedObjectContext, "setMergePolicy:", *MEMORY[0x24BDBB478]);
    managedObjectContext = self->_managedObjectContext;
  }
  return managedObjectContext;
}

- (void)loadPersistentStoreIfNecessary
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[_KSTextReplacementLegacyStore loadPersistentStoreIfNecessary]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  couldn't load persistent store at url: %@, error: %@", (uint8_t *)&v3, 0x20u);
}

- (void)unloadPersistentStore
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementLegacyStore persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "removePersistentStore:error:", v4, &v7);
  v5 = v7;

  -[_KSTextReplacementLegacyStore setUbiquityStoreLoaded:](self, "setUbiquityStoreLoaded:", 0);
  if (v5)
  {
    KSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[_KSTextReplacementLegacyStore unloadPersistentStore]";
      _os_log_impl(&dword_21DFEB000, v6, OS_LOG_TYPE_INFO, "%s  ERROR: failed to unload PSC store", buf, 0xCu);
    }

  }
}

- (void)requestMinimumUptime
{
  NSObject *v3;
  NSObject *v4;
  OS_os_transaction *v5;
  OS_os_transaction *uptimeTransaction;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[_KSTextReplacementLegacyStore requestMinimumUptime]";
    _os_log_impl(&dword_21DFEB000, v3, OS_LOG_TYPE_INFO, "%s  persistentstore loaded, requesting minimum uptime", buf, 0xCu);
  }

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[_KSTextReplacementLegacyStore minimumUptimeDidExpire](self, "minimumUptimeDidExpire"))
  {
    v5 = (OS_os_transaction *)os_transaction_create();
    uptimeTransaction = self->_uptimeTransaction;
    self->_uptimeTransaction = v5;

    -[_KSTextReplacementLegacyStore setMinimumUptimeDidExpire:](self, "setMinimumUptimeDidExpire:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementLegacyStore setPersistentStoreDidLoadTime:](self, "setPersistentStoreDidLoadTime:", v7);

    v8 = dispatch_time(0, 180000000000);
    -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53___KSTextReplacementLegacyStore_requestMinimumUptime__block_invoke;
    block[3] = &unk_24E204790;
    block[4] = self;
    dispatch_after(v8, v9, block);

  }
}

- (void)endMinimumUptime
{
  NSObject *v3;
  OS_os_transaction *uptimeTransaction;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[_KSTextReplacementLegacyStore minimumUptimeDidExpire](self, "minimumUptimeDidExpire"))
  {
    uptimeTransaction = self->_uptimeTransaction;
    self->_uptimeTransaction = 0;

    -[_KSTextReplacementLegacyStore setMinimumUptimeDidExpire:](self, "setMinimumUptimeDidExpire:", 1);
    KSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[_KSTextReplacementLegacyStore endMinimumUptime]";
      _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  Ending minimum uptime", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (NSPersistentStore)persistentStore
{
  void *v2;
  void *v3;
  void *v4;

  -[_KSTextReplacementLegacyStore persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStore *)v4;
}

- (void)importSampleShortcutsIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  KSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[_KSTextReplacementLegacyStore importSampleShortcutsIfNecessary]";
    _os_log_impl(&dword_21DFEB000, v4, OS_LOG_TYPE_INFO, "%s  importing sample shortcut", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  if (!-[_KSTextReplacementLegacyStore pendingSampleShortcutImport](self, "pendingSampleShortcutImport"))
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF50]);
    +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSuiteName:", v6);

    objc_msgSend(v7, "stringForKey:", CFSTR("kDidInsertSampleShortcutForPeer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementLegacyStore currentStoreIndentity](self, "currentStoreIndentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {
      KSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[_KSTextReplacementLegacyStore importSampleShortcutsIfNecessary]";
        _os_log_impl(&dword_21DFEB000, v10, OS_LOG_TYPE_INFO, "%s  already imported sample shortcut", buf, 0xCu);
      }
    }
    else
    {
      -[_KSTextReplacementLegacyStore setPendingSampleShortcutImport:](self, "setPendingSampleShortcutImport:", 1);
      +[_KSTextReplacementHelper sampleShortcut](_KSTextReplacementHelper, "sampleShortcut");
      v10 = objc_claimAutoreleasedReturnValue();
      v17 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __65___KSTextReplacementLegacyStore_importSampleShortcutsIfNecessary__block_invoke;
      v12[3] = &unk_24E205A60;
      objc_copyWeak(&v15, &location);
      v13 = v7;
      v14 = v9;
      -[_KSTextReplacementLegacyStore addEntries:removeEntries:withCompletionHandler:](self, "addEntries:removeEntries:withCompletionHandler:", v11, 0, v12);

      objc_destroyWeak(&v15);
    }

  }
  objc_destroyWeak(&location);
}

- (void)prepareForMigration
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  dispatch_semaphore_t v9;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v4 = dispatch_semaphore_create(0);
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52___KSTextReplacementLegacyStore_prepareForMigration__block_invoke;
  v8[3] = &unk_24E205838;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(v5, v8);

  v7 = dispatch_time(0, 180000000000);
  dispatch_semaphore_wait(v6, v7);

}

- (void)runMaintenanceIncludeLocalVariations:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[_KSTextReplacementLegacyStore runMaintenanceIncludeLocalVariations:]";
    _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  LS: running maintenance", (uint8_t *)&v8, 0xCu);
  }

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x2207A8B6C]();
  -[_KSTextReplacementLegacyStore performMaintenanceIfNecessary](self, "performMaintenanceIfNecessary");
  -[_KSTextReplacementLegacyStore mergeEntriesFromAllStoresIncludeLocalVariations:](self, "mergeEntriesFromAllStoresIncludeLocalVariations:", v3);
  -[_KSTextReplacementLegacyStore mergeEntriesForUbiquityIdentityChangeIfNecessary](self, "mergeEntriesForUbiquityIdentityChangeIfNecessary");
  objc_autoreleasePoolPop(v7);
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _KSTextReplacementLegacyStore *v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80___KSTextReplacementLegacyStore_addEntries_removeEntries_withCompletionHandler___block_invoke;
  v15[3] = &unk_24E205A88;
  objc_copyWeak(&v20, &location);
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  -[_KSTextReplacementLegacyStore requestSync:withCompletionBlock:](self, "requestSync:withCompletionBlock:", 5, a3);
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65___KSTextReplacementLegacyStore_requestSync_withCompletionBlock___block_invoke;
  block[3] = &unk_24E204C30;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)removeAllEntries
{
  NSObject *v3;
  _QWORD block[5];

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)removeEntriesWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  v5 = (void *)MEMORY[0x2207A8B6C]();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("timestamp"), 1, sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSTextReplacementLegacyStore entriesMatchingPredicate:sortDescriptors:](self, "entriesMatchingPredicate:sortDescriptors:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke;
  v14[3] = &unk_24E2047B8;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v11, "performBlockAndWait:", v14);

  objc_autoreleasePoolPop(v5);
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)_deleteTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "valueToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "valueToDelete");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueToDelete");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortcut");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("phrase == %@ AND shortcut == %@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_KSTextReplacementLegacyStore removeEntriesWithPredicate:](self, "removeEntriesWithPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)textReplacementEntries
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55___KSTextReplacementLegacyStore_textReplacementEntries__block_invoke;
  v6[3] = &unk_24E2055B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)objc_opt_class(), "textReplacementEntriesFromManagedObjects:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)textReplacementEntriesFromManagedObjects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _KSTextReplacementEntry *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "phrase", (_QWORD)v20);
        v11 = (_KSTextReplacementEntry *)objc_claimAutoreleasedReturnValue();
        if (-[_KSTextReplacementEntry length](v11, "length"))
        {
          objc_msgSend(v10, "shortcut");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (!v13)
            continue;
          v11 = objc_alloc_init(_KSTextReplacementEntry);
          objc_msgSend(v10, "phrase");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_KSTextReplacementEntry setPhrase:](v11, "setPhrase:", v14);

          objc_msgSend(v10, "shortcut");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_KSTextReplacementEntry setShortcut:](v11, "setShortcut:", v15);

          v16 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v10, "timestamp");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v17, "integerValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_KSTextReplacementEntry setTimestamp:](v11, "setTimestamp:", v18);

          objc_msgSend(v4, "addObject:", v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67___KSTextReplacementLegacyStore_queryTextReplacementsWithCallback___block_invoke;
  v7[3] = &unk_24E2056B8;
  v8 = v4;
  v6 = v4;
  -[_KSTextReplacementLegacyStore queryTextReplacementsWithPredicate:callback:](self, "queryTextReplacementsWithPredicate:callback:", v5, v7);

}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("timestamp"), 1, sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77___KSTextReplacementLegacyStore_queryTextReplacementsWithPredicate_callback___block_invoke;
  v14[3] = &unk_24E205348;
  v14[4] = self;
  v15 = v6;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v6;
  dispatch_async(v10, v14);

}

- (id)entriesFromCache:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDBCE50];
  -[_KSTextReplacementLegacyStore cacheFilePath](self, "cacheFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_KSTextReplacementHelper errorWithCode:description:](_KSTextReplacementHelper, "errorWithCode:description:", 13, CFSTR("Couldn't decode cache"));
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)scheduleCacheUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  _KSTextReplacementLegacyStore *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[_KSTextReplacementLegacyStore didScheduleCacheUpdate](self, "didScheduleCacheUpdate"))
  {
    KSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[_KSTextReplacementLegacyStore scheduleCacheUpdate:]";
      _os_log_impl(&dword_21DFEB000, v6, OS_LOG_TYPE_INFO, "%s  Scheduling cache update", buf, 0xCu);
    }

    v7 = dispatch_time(0, 500000000);
    -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __53___KSTextReplacementLegacyStore_scheduleCacheUpdate___block_invoke;
    v12 = &unk_24E205838;
    v13 = self;
    v14 = v4;
    dispatch_after(v7, v8, &v9);

    -[_KSTextReplacementLegacyStore setDidScheduleCacheUpdate:](self, "setDidScheduleCacheUpdate:", 1, v9, v10, v11, v12, v13);
  }

}

- (BOOL)writeEntriesToCache:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  BOOL v11;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v5)
  {
    v6 = v5;
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[_KSTextReplacementLegacyStore writeEntriesToCache:]";
      v17 = 2112;
      v18 = v8;
      v9 = "%s  ERROR: Couldn't create data from TR entries: %@";
LABEL_7:
      _os_log_impl(&dword_21DFEB000, v7, OS_LOG_TYPE_INFO, v9, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[_KSTextReplacementLegacyStore cacheFilePath](self, "cacheFilePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = 1;
  objc_msgSend(v4, "writeToFile:options:error:", v10, 1, &v13);
  v6 = v13;

  if (v6)
  {
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[_KSTextReplacementLegacyStore writeEntriesToCache:]";
      v17 = 2112;
      v18 = v8;
      v9 = "%s  could not save TR cache: %@";
      goto LABEL_7;
    }
LABEL_8:

    v11 = 0;
  }

  return v11;
}

- (void)iCloudAccountDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___KSTextReplacementLegacyStore_iCloudAccountDidChange___block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)entityDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_KSTextReplacementLegacyStore persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)insertEntryWithValue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54___KSTextReplacementLegacyStore_insertEntryWithValue___block_invoke;
  v9[3] = &unk_24E205838;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

- (BOOL)save
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37___KSTextReplacementLegacyStore_save__block_invoke;
    v7[3] = &unk_24E205770;
    v5 = v4;
    v8 = v5;
    v9 = &v10;
    objc_msgSend(v5, "performBlockAndWait:", v7);
    LOBYTE(v3) = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  return (char)v3;
}

- (id)entriesMatchingPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74___KSTextReplacementLegacyStore_entriesMatchingPredicate_sortDescriptors___block_invoke;
  v15[3] = &unk_24E205AB0;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v19 = &v20;
  v12 = v9;
  v18 = v12;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)entriesMatchingPredicate:(id)a3
{
  return -[_KSTextReplacementLegacyStore entriesMatchingPredicate:sortDescriptors:](self, "entriesMatchingPredicate:sortDescriptors:", a3, 0);
}

- (id)entriesUsingSortDescriptors:(id)a3
{
  return -[_KSTextReplacementLegacyStore entriesMatchingPredicate:sortDescriptors:](self, "entriesMatchingPredicate:sortDescriptors:", 0, a3);
}

- (void)persistentStoreDidImportUbiquitousContentChanges:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke;
  v7[3] = &unk_24E205838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)mergeShortcutsFromContext:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD *v47;
  uint64_t *v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  id location;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x2207A8B6C]();
  objc_initWeak(&location, self);
  NSLog(CFSTR("Merging shortcuts from sourceContext"));
  objc_msgSend(v4, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBB678];
  objc_msgSend(v10, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "propertiesByName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("shortcut"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "propertiesByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("phrase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v59[0] = v15;
  v59[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPropertiesToFetch:", v18);

  v58[0] = v15;
  v58[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPropertiesToGroupBy:", v19);

  objc_msgSend(v13, "setResultType:", 2);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__4;
  v55 = __Block_byref_object_dispose__4;
  v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__4;
  v49[4] = __Block_byref_object_dispose__4;
  v20 = MEMORY[0x24BDAC760];
  v50 = 0;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke;
  v44[3] = &unk_24E205AD8;
  v47 = v49;
  v21 = v4;
  v45 = v21;
  v22 = v13;
  v46 = v22;
  v48 = &v51;
  objc_msgSend(v21, "performBlockAndWait:", v44);
  if (v52[5])
  {
    NSLog(CFSTR("Error fetching shortcuts from sourceContext"));
    v23 = (id)v52[5];
  }
  else
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
    v34[0] = v20;
    v34[1] = 3221225472;
    v34[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_2;
    v34[3] = &unk_24E205B28;
    v37 = v49;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v35 = v24;
    objc_copyWeak(&v39, &location);
    v36 = v21;
    v38 = &v40;
    objc_msgSend(v36, "performBlockAndWait:", v34);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_4;
    v27[3] = &unk_24E205B50;
    v29 = v32;
    v30 = &v40;
    v25 = v24;
    v28 = v25;
    v31 = &v51;
    objc_msgSend(v25, "performBlockAndWait:", v27);
    NSLog(CFSTR("Completed merge (inserted %ld shortcuts)"), v41[3]);
    v23 = (id)v52[5];

    _Block_object_dispose(v32, 8);
    objc_destroyWeak(&v39);

    _Block_object_dispose(&v40, 8);
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v6);

  return v23;
}

- (BOOL)_shouldMergeShortcut:(id)a3 phrase:(id)a4 intoContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDBB678];
  v11 = a5;
  -[_KSTextReplacementLegacyStore entityDescription](self, "entityDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("shortcut == %@ && phrase == %@"), v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);
  objc_msgSend(v14, "setFetchLimit:", 1);
  objc_msgSend(v14, "setResultType:", 1);
  v22 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v14, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v22;
  v18 = v17;
  if (v17)
    NSLog(CFSTR("Error while fetching shortcut - %@"), v17);
  v19 = objc_msgSend(v16, "count") == 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Should merge shortcut: \"%@\" -> \"%@\"? %@"), v8, v9, v20);

  LOBYTE(v20) = objc_msgSend(v16, "count") == 0;
  return (char)v20;
}

- (BOOL)_mergeShortcut:(id)a3 phrase:(id)a4 fromContext:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  id v22;
  void *v23;
  BOOL v24;
  _KSTextReplacementLegacyStore *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *context;
  void *v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSLog(CFSTR("Merge shortcut: \"%@\" -> \"%@\"), v8, v9);
  context = (void *)MEMORY[0x2207A8B6C]();
  objc_msgSend(v10, "persistentStoreCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBB678];
  v35 = v14;
  objc_msgSend(v14, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v9;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("shortcut == %@ && phrase == %@"), v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("timestamp"), 0, sel_compare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPredicate:", v18);
  objc_msgSend(v17, "setSortDescriptors:", v20);
  objc_msgSend(v17, "setFetchLimit:", 1);
  v38 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v17, &v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v38;
  v23 = v22;
  if (v22)
  {
    NSLog(CFSTR("Error fetching shortcut - %@"), v22);
    v24 = 0;
  }
  else
  {
    v25 = self;
    objc_msgSend(v21, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26 != 0;
    if (v26)
    {
      v32 = objc_alloc(MEMORY[0x24BDBB698]);
      -[_KSTextReplacementLegacyStore entityDescription](v25, "entityDescription");
      v34 = v8;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_KSTextReplacementLegacyStore managedObjectContext](v25, "managedObjectContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v32, "initWithEntity:insertIntoManagedObjectContext:", v27, v28);
      v33 = v10;
      v30 = (void *)v29;

      v8 = v34;
      objc_msgSend(v30, "_copyAttributeValuesFromObject:", v26);

      v10 = v33;
    }

  }
  objc_autoreleasePoolPop(context);
  if (!v24)
    NSLog(CFSTR("Unable to migrate shortcut"));

  return v24;
}

- (BOOL)migrateEntriesFromStoreAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    NSLog(CFSTR("Attempting shortcut merge (%@)"), v6);
    v12 = objc_alloc(MEMORY[0x24BDBB6B0]);
    -[_KSTextReplacementLegacyStore managedObjectModelURL](self, "managedObjectModelURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithContentsOfURL:", v13);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v14);
    v16 = *MEMORY[0x24BDBB580];
    v17 = *MEMORY[0x24BDBB550];
    v27 = *MEMORY[0x24BDBB550];
    v28[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addPersistentStoreWithType:configuration:URL:options:error:", v16, 0, v6, v18, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *a4;
    if (v19)
    {
      if (objc_msgSend(v20, "code") != 257)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(v20, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Could not open store at %@: %@"), v6, v21);

      if (objc_msgSend(*a4, "code") != 257)
      {
        LOBYTE(v11) = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    NSLog(CFSTR("Looks like we tried to open a destroyed container with read-only permission at: %@"), v6);
    NSLog(CFSTR("Trying again with write permission..."));
    v25 = v17;
    v26 = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addPersistentStoreWithType:configuration:URL:options:error:", v16, 0, v6, v22, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(*a4, "localizedDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Still could not open store at %@: %@"), v6, v23);
      goto LABEL_11;
    }
LABEL_8:
    LOBYTE(v11) = 1;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    objc_msgSend(v23, "setPersistentStoreCoordinator:", v15);
    -[_KSTextReplacementLegacyStore mergeShortcutsFromContext:](self, "mergeShortcutsFromContext:", v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Shortcut merge %@ (%@)"), CFSTR("success"), v6);
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v11) = 0;
LABEL_13:

  return (char)v11;
}

- (void)retirePersistentStoreAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    KSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[_KSTextReplacementLegacyStore retirePersistentStoreAtURL:]";
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_21DFEB000, v8, OS_LOG_TYPE_INFO, "%s  Retiring store at %@", buf, 0x16u);
    }

    v9 = objc_alloc(MEMORY[0x24BDBB6B0]);
    -[_KSTextReplacementLegacyStore managedObjectModelURL](self, "managedObjectModelURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithContentsOfURL:", v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v11);
    v25 = *MEMORY[0x24BDD0CF0];
    v26[0] = *MEMORY[0x24BDD0CE0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDBB580];
    v18 = 0;
    v15 = objc_msgSend(v12, "destroyPersistentStoreAtURL:withType:options:error:", v4, v14, v13, &v18);
    v16 = v18;
    if ((v15 & 1) == 0)
    {
      KSCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[_KSTextReplacementLegacyStore retirePersistentStoreAtURL:]";
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_21DFEB000, v17, OS_LOG_TYPE_INFO, "%s  Could not retire store at %@: %@", buf, 0x20u);
      }

    }
  }

}

- (id)storeURLForMergeAfterUbiquityIdentityChangeFromToken:(id)a3 toToken:(id)a4 withLastKnownToken:(id)a5 shouldDeleteFirst:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10 && v11)
  {
    if (v12 && (objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
    {
      NSLog(CFSTR("Ubiquity container became available, but different from last known container. Discarding local shortcuts."));
      v14 = 0;
      goto LABEL_12;
    }
    NSLog(CFSTR("Ubiquity container became available. Merging local shortcuts into Ubiquity container."));
    goto LABEL_11;
  }
  v14 = 0;
  if (v10 && !v11)
  {
    if (a6)
      *a6 = 1;
    NSLog(CFSTR("Ubiquity container became unavailable. Cloning shortcuts from Ubiquity container into local store."));
LABEL_11:
    v15 = (void *)MEMORY[0x24BDBB738];
    -[_KSTextReplacementLegacyStore baseURL](self, "baseURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ubiquityStoreURLForStoreURL:ubiquityIdentityToken:ubiquityName:", v16, v10, CFSTR("UserDictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v14;
}

- (BOOL)mergeEntriesForUbiquityIdentityChangeFromURL:(id)a3 firstDelete:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
    -[_KSTextReplacementLegacyStore removeAllEntries](self, "removeAllEntries");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {
    KSCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[_KSTextReplacementLegacyStore mergeEntriesForUbiquityIdentityChangeFromURL:firstDelete:]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_21DFEB000, v13, OS_LOG_TYPE_INFO, "%s  file to merge does not exist: %@", buf, 0x16u);
    }

    v11 = 0;
    goto LABEL_9;
  }
  v19 = 0;
  v10 = -[_KSTextReplacementLegacyStore migrateEntriesFromStoreAtURL:error:](self, "migrateEntriesFromStoreAtURL:error:", v6, &v19);
  v11 = v19;
  if (!v10)
  {
LABEL_9:
    NSLog(CFSTR("Failed merge after Ubiquity account change."));
    -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __90___KSTextReplacementLegacyStore_mergeEntriesForUbiquityIdentityChangeFromURL_firstDelete___block_invoke;
    v17[3] = &unk_24E204790;
    v18 = v14;
    v15 = v14;
    objc_msgSend(v15, "performBlockAndWait:", v17);

    v12 = 0;
    goto LABEL_10;
  }
  NSLog(CFSTR("Merge successful."));
  v12 = 1;
LABEL_10:

  return v12;
}

- (id)currentStoreIndentity
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", CFSTR("CoreDataUbiquitySupport"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v4, "count") <= (unint64_t)(v5 + 1))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "indexOfObject:", CFSTR("UserDictionary"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v4, "count") <= (unint64_t)(v7 + 1))
    {
      v8 = &stru_24E206F98;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndex:");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)mergeEntriesFromAllStoresIncludeLocalVariations:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  BOOL v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", CFSTR("CoreDataUbiquitySupport"));
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v10 = v9, v11 = v9 + 1, objc_msgSend(v8, "count") <= (unint64_t)(v9 + 1)))
  {
    v17 = 1;
    goto LABEL_37;
  }
  objc_msgSend(v8, "subarrayWithRange:", 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)CFPreferencesCopyAppValue(CFSTR("UserDictionaryLocalPeerIdentityCurrent"), CFSTR("com.apple.Preferences"));
  v15 = objc_msgSend(v13, "isEqualToString:", v14);
  if (!a3 && v15)
  {
    v16 = 1;
    goto LABEL_36;
  }
  v41 = v15;
  v36 = v14;
  v37 = v13;
  v38 = v12;
  v39 = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_KSUtilities findAllDbsInDirectory:](_KSUtilities, "findAllDbsInDirectory:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (!v21)
  {
    v16 = 1;
    goto LABEL_30;
  }
  v22 = v21;
  v23 = *(_QWORD *)v44;
  v40 = (void *)*MEMORY[0x24BDBB568];
  v16 = 1;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v44 != v23)
        objc_enumerationMutation(v20);
      v25 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v7, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", v25);

      if ((v27 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v29 = -[_KSTextReplacementLegacyStore migrateEntriesFromStoreAtURL:error:](self, "migrateEntriesFromStoreAtURL:error:", v28, &v42);
        v30 = v42;

        KSCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v48 = "-[_KSTextReplacementLegacyStore mergeEntriesFromAllStoresIncludeLocalVariations:]";
          v49 = 2112;
          v50 = v25;
          v51 = 2112;
          v52 = v30;
          _os_log_impl(&dword_21DFEB000, v31, OS_LOG_TYPE_INFO, "%s  merged entries from db: %@, error: %@", buf, 0x20u);
        }

        if (v29 || objc_msgSend(v30, "code") == 134080)
        {
LABEL_19:
          if ((v41 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v25);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[_KSTextReplacementLegacyStore retirePersistentStoreAtURL:](self, "retirePersistentStoreAtURL:", v32);
            goto LABEL_21;
          }
        }
        else
        {
          objc_msgSend(v30, "domain");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32 == v40)
          {

            goto LABEL_19;
          }
LABEL_21:

        }
        if (v30)
          v16 = 0;
        else
          v16 = v29;

        continue;
      }
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  }
  while (v22);
LABEL_30:

  v13 = v37;
  if ((v41 & 1) == 0)
  {
    if ((v16 & 1) != 0)
      v33 = v37;
    else
      v33 = 0;
    -[_KSTextReplacementLegacyStore didMergeEntriesForOtherLocalPeers:](self, "didMergeEntriesForOtherLocalPeers:", v33);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

  v12 = v38;
  v8 = v39;
  v14 = v36;
LABEL_36:

  v17 = v16 & 1;
LABEL_37:

  return v17;
}

- (void)didMergeEntriesForOtherLocalPeers:(id)a3
{
  id v3;

  v3 = a3;
  NSLog(CFSTR("Saving observed local peer identity to %@"), CFSTR("com.apple.Preferences"));
  CFPreferencesSetAppValue(CFSTR("UserDictionaryLocalPeerIdentityCurrent"), v3, CFSTR("com.apple.Preferences"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.Preferences"));
}

- (BOOL)mergeEntriesForUbiquityIdentityChangeIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  unsigned __int8 v11;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("UserDictionaryUbiquityIdentityTokenLastKnown"), CFSTR("com.apple.Preferences"));
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("UserDictionaryUbiquityIdentityTokenCurrent"), CFSTR("com.apple.Preferences"));
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ubiquityIdentityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  -[_KSTextReplacementLegacyStore storeURLForMergeAfterUbiquityIdentityChangeFromToken:toToken:withLastKnownToken:shouldDeleteFirst:](self, "storeURLForMergeAfterUbiquityIdentityChangeFromToken:toToken:withLastKnownToken:shouldDeleteFirst:", v5, v7, v4, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[_KSTextReplacementLegacyStore mergeEntriesForUbiquityIdentityChangeFromURL:firstDelete:](self, "mergeEntriesForUbiquityIdentityChangeFromURL:firstDelete:", v8, v11);
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  if (v7 != v5 && (objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
    -[_KSTextReplacementLegacyStore didMergeEntriesForNewUbiquityIdentity:](self, "didMergeEntriesForNewUbiquityIdentity:", v7);
LABEL_8:

  return v9;
}

- (void)didMergeEntriesForNewUbiquityIdentity:(id)a3
{
  id value;

  value = a3;
  NSLog(CFSTR("Saving observed Ubiquity identity tokens to %@"), CFSTR("com.apple.Preferences"));
  CFPreferencesSetAppValue(CFSTR("UserDictionaryUbiquityIdentityTokenCurrent"), value, CFSTR("com.apple.Preferences"));
  if (value)
    CFPreferencesSetAppValue(CFSTR("UserDictionaryUbiquityIdentityTokenLastKnown"), value, CFSTR("com.apple.Preferences"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.Preferences"));

}

- (void)performMaintenanceIfNecessary
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_KSTextReplacementLegacyStore save](self, "save");
  if (-[_KSTextReplacementLegacyStore needsMaintenance](self, "needsMaintenance"))
  {
    -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke;
    v11[3] = &unk_24E204790;
    v6 = v4;
    v12 = v6;
    objc_msgSend(v6, "performBlockAndWait:", v11);
    -[_KSTextReplacementLegacyStore managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementLegacyStore detectAndCleanDuplicatesWithContext:](self, "detectAndCleanDuplicatesWithContext:", v7);

    -[_KSTextReplacementLegacyStore didMaintenance](self, "didMaintenance");
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke_2;
    v9[3] = &unk_24E204790;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v8, "performBlockAndWait:", v9);

  }
}

- (BOOL)needsMaintenance
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_KSTextReplacementLegacyStore loadMaintenancePreferencesIfNecessary](self, "loadMaintenancePreferencesIfNecessary");
  if (-[_KSTextReplacementLegacyStore forceMaintenance](self, "forceMaintenance"))
    return 1;
  -[_KSTextReplacementLegacyStore lastMaintenanceDate](self, "lastMaintenanceDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 1;
  v5 = (void *)v4;
  -[_KSTextReplacementLegacyStore lastMaintenanceDate](self, "lastMaintenanceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;

  if (v8 < 0.0)
    v8 = -v8;

  return v8 > 1209600.0
      || -[_KSTextReplacementLegacyStore importedSinceMaintenance](self, "importedSinceMaintenance") > 20;
}

- (void)loadMaintenancePreferencesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_KSTextReplacementLegacyStore lastMaintenanceDate](self, "lastMaintenanceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v6 = (id)CFPreferencesCopyAppValue(CFSTR("UserDictionaryLastMaintenanceDate"), CFSTR("com.apple.Preferences"));
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_KSTextReplacementLegacyStore setLastMaintenanceDate:](self, "setLastMaintenanceDate:", v6);
    }
    -[_KSTextReplacementLegacyStore lastMaintenanceDate](self, "lastMaintenanceDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_KSTextReplacementLegacyStore setLastMaintenanceDate:](self, "setLastMaintenanceDate:", v5);

    }
    -[_KSTextReplacementLegacyStore setImportedSinceMaintenance:](self, "setImportedSinceMaintenance:", CFPreferencesGetAppIntegerValue(CFSTR("UserDictionaryImportedSinceMaintenance"), CFSTR("com.apple.Preferences"), 0));

  }
}

- (void)didMaintenance
{
  NSObject *v3;
  void *v4;
  id value;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_KSTextReplacementLegacyStore setForceMaintenance:](self, "setForceMaintenance:", 0);
  value = objc_alloc_init(MEMORY[0x24BDBCE60]);
  -[_KSTextReplacementLegacyStore setLastMaintenanceDate:](self, "setLastMaintenanceDate:", value);
  CFPreferencesSetAppValue(CFSTR("UserDictionaryLastMaintenanceDate"), value, CFSTR("com.apple.Preferences"));
  -[_KSTextReplacementLegacyStore setImportedSinceMaintenance:](self, "setImportedSinceMaintenance:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[_KSTextReplacementLegacyStore importedSinceMaintenance](self, "importedSinceMaintenance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("UserDictionaryImportedSinceMaintenance"), v4, CFSTR("com.apple.Preferences"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.Preferences"));
}

- (BOOL)detectAndCleanDuplicatesWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id location;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD v40[4];
  _QWORD v41[2];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  NSLog(CFSTR("Detect and clean shortcut duplicates."));
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__4;
  v34[4] = __Block_byref_object_dispose__4;
  v35 = 0;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDBB678];
  -[_KSTextReplacementLegacyStore entityDescription](self, "entityDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIncludesPendingChanges:", 0);
  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", CFSTR("count:(shortcut)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v11, "setName:", CFSTR("count"));
  objc_msgSend(v11, "setExpression:", v10);
  objc_msgSend(v11, "setExpressionResultType:", 300);
  -[_KSTextReplacementLegacyStore entityDescription](self, "entityDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertiesByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("shortcut"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSTextReplacementLegacyStore entityDescription](self, "entityDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertiesByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("phrase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = v14;
  v42[1] = v17;
  v42[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v18);

  v41[0] = v14;
  v41[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToGroupBy:", v19);

  objc_msgSend(v9, "setResultType:", 2);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__4;
  v31[4] = __Block_byref_object_dispose__4;
  v32 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __69___KSTextReplacementLegacyStore_detectAndCleanDuplicatesWithContext___block_invoke;
  v23[3] = &unk_24E205B78;
  v26 = v31;
  v20 = v4;
  v24 = v20;
  v21 = v9;
  v25 = v21;
  v27 = v34;
  v28 = &v36;
  objc_copyWeak(&v30, &location);
  v29 = v40;
  objc_msgSend(v20, "performBlockAndWait:", v23);
  LOBYTE(v9) = *((_BYTE *)v37 + 24) != 0;
  objc_destroyWeak(&v30);

  _Block_object_dispose(v31, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);

  return (char)v9;
}

- (void)_deleteDuplicatesOfShortcut:(id)a3 phrase:(id)a4 count:(int64_t)a5 withContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  _KSTextReplacementLegacyStore *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  void *v34;
  _KSTextReplacementLegacyStore *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = v10;
  v13 = v11;
  v14 = a6;
  v38 = v13;
  NSLog(CFSTR("Found duplicate shortcut: \"%@\" -> \"%@\" (count=%ld)"), v12, v13, a5);
  v15 = 0;
  v16 = a5;
  v17 = self;
  v36 = self;
  v37 = v12;
  do
  {
    v18 = (void *)MEMORY[0x2207A8B6C]();
    objc_msgSend(v14, "setMergePolicy:", *MEMORY[0x24BDBB478]);
    v19 = (void *)MEMORY[0x24BDBB678];
    -[_KSTextReplacementLegacyStore entityDescription](v17, "entityDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchRequestWithEntityName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("shortcut == %@ && phrase == %@"), v12, v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("timestamp"), 0, sel_compare_);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setPredicate:", v23);
    objc_msgSend(v22, "setSortDescriptors:", v25);
    objc_msgSend(v22, "setFetchBatchSize:", 1000);
    objc_msgSend(v22, "setFetchLimit:", 10000);
    objc_msgSend(v22, "setResultType:", 1);
    v40 = 0;
    objc_msgSend(v14, "executeFetchRequest:error:", v22, &v40);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v40;
    if (v27)
    {
      v28 = v27;
      NSLog(CFSTR("Error while fetching duplicates - %@"), v27);
    }
    else
    {
      if ((unint64_t)objc_msgSend(v26, "count") >= 2)
      {
        v29 = 1;
        do
        {
          objc_msgSend(v26, "objectAtIndex:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectWithID:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deleteObject:", v31);

          ++v29;
        }
        while (v29 < objc_msgSend(v26, "count"));
      }
      v39 = 0;
      v32 = objc_msgSend(v14, "save:", &v39);
      v33 = v39;
      v28 = v33;
      if ((v32 & 1) != 0 || !v33)
      {
        objc_msgSend(v14, "reset");
      }
      else
      {
        NSLog(CFSTR("Error while deleting duplicates - %@"), v33);
        objc_msgSend(v28, "userInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Error userInfo - %@"), v34);

      }
      v17 = v36;
      v12 = v37;
    }

    objc_autoreleasePoolPop(v18);
  }
  while (v15++ != v16 / 0x2710);

}

+ (id)legacyImportFilePaths
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[_KSUtilities keyboardDirectory](_KSUtilities, "keyboardDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("ja"), CFSTR("zh-Pinyin"), CFSTR("zh-Zhuyin"), CFSTR("latin"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(CFSTR("SerializedUserWords-"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "stringByAppendingPathComponent:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

          if (v12)
            objc_msgSend(v14, "addObject:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)legacyImportWordKeyPairsFromFiles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfFile:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)importLegacyEntries
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t i;
  _KSTIUserDictionaryEntryValue *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend((id)objc_opt_class(), "legacyImportFilePaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "legacyImportWordKeyPairsFromFiles:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if ((v6 & 1) == 0)
    {
      -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        if (v6)
        {
          for (i = 0; i < v6; i += 2)
          {
            v9 = objc_alloc_init(_KSTIUserDictionaryEntryValue);
            objc_msgSend(v5, "objectAtIndex:", i);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[_KSTIUserDictionaryEntryValue setPhrase:](v9, "setPhrase:", v10);

            objc_msgSend(v5, "objectAtIndex:", i + 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[_KSTIUserDictionaryEntryValue setShortcut:](v9, "setShortcut:", v11);

            -[_KSTextReplacementLegacyStore insertEntryWithValue:](self, "insertEntryWithValue:", v9);
          }
        }
        if (-[_KSTextReplacementLegacyStore save](self, "save"))
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v23 = v4;
          v13 = v4;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v12, "fileExistsAtPath:", v18))
                {
                  v24 = 0;
                  v19 = objc_msgSend(v12, "removeItemAtPath:error:", v18, &v24);
                  v20 = v24;
                  v21 = v20;
                  if ((v19 & 1) == 0)
                    NSLog(CFSTR("%s: %@"), "-[_KSTextReplacementLegacyStore importLegacyEntries]", v20);
                }
                else
                {
                  v21 = 0;
                }

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            }
            while (v15);
          }

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

          v4 = v23;
        }
      }
    }

  }
}

+ (id)legacyStorePath
{
  void *v2;
  void *v3;

  +[_KSUtilities keyboardDirectory](_KSUtilities, "keyboardDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("UserDictionary.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)migrateTellurideData
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t i;
  void *v17;
  _KSTIUserDictionaryEntryValue *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  id v27;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[_KSUtilities userDictionaryWordKeyPairsFilePathLegacy](_KSUtilities, "userDictionaryWordKeyPairsFilePathLegacy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfFile:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      NSLog(CFSTR("Couldn't read legacy data at %@"), v4);
LABEL_21:

      goto LABEL_22;
    }
    NSLog(CFSTR("Performing migration from word-key pairs file at %@"), v4);
    objc_msgSend((id)objc_opt_class(), "legacyStorePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v11 = objc_msgSend(v10, "removeItemAtPath:error:", v8, &v27);
      v12 = v27;

      if ((v11 & 1) == 0)
      {
        NSLog(CFSTR("Couldn't remove legacy store at %@: %@"), v8, v12);
LABEL_20:

        goto LABEL_21;
      }
      v13 = v12;
    }
    else
    {

      v13 = 0;
    }
    v14 = objc_msgSend(v7, "count");
    if (!v14 || (v15 = v14, (v14 & 1) != 0))
    {
LABEL_14:
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v13;
      v24 = objc_msgSend(v23, "removeItemAtPath:error:", v4, &v26);
      v12 = v26;

      if ((v24 & 1) == 0)
        NSLog(CFSTR("Couldn't remove legacy word-key pairs file at %@: %@"), v4, v12);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

    }
    else
    {
      for (i = 0; i < v15; i += 2)
      {
        -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v12 = v13;
          goto LABEL_20;
        }
        v18 = objc_alloc_init(_KSTIUserDictionaryEntryValue);
        objc_msgSend(v7, "objectAtIndex:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_KSTIUserDictionaryEntryValue setPhrase:](v18, "setPhrase:", v19);

        objc_msgSend(v7, "objectAtIndex:", i + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_KSTIUserDictionaryEntryValue setShortcut:](v18, "setShortcut:", v20);

        -[_KSTextReplacementLegacyStore insertEntryWithValue:](self, "insertEntryWithValue:", v18);
        -[_KSTIUserDictionaryEntryValue shortcut](v18, "shortcut");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_KSTIUserDictionaryEntryValue phrase](v18, "phrase");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Added shortcut %@ for phrase %@"), v21, v22);

      }
      if (-[_KSTextReplacementLegacyStore save](self, "save"))
        goto LABEL_14;
      NSLog(CFSTR("Couldn't save words imported from legacy store: %@"), v13);
      v12 = v13;
    }
    goto LABEL_20;
  }
LABEL_22:

}

- (void)migrateSundanceData
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_KSTextReplacementLegacyStore legacyStorePath](_KSTextReplacementLegacyStore, "legacyStorePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    +[_KSTextReplacementLegacyStore legacyStorePath](_KSTextReplacementLegacyStore, "legacyStorePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementLegacyStore persistentStore](self, "persistentStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      NSLog(CFSTR("Performing migration from legacy store at %@"), v7);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v10 = -[_KSTextReplacementLegacyStore migrateEntriesFromStoreAtURL:error:](self, "migrateEntriesFromStoreAtURL:error:", v9, &v16);
      v11 = v16;

      if (v10)
      {
        NSLog(CFSTR("Removing legacy store at %@"), v7);

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v13 = objc_msgSend(v12, "removeItemAtPath:error:", v7, &v15);
        v11 = v15;

        if ((v13 & 1) == 0)
          NSLog(CFSTR("Couldn't remove legacy store at %@: %@"), v7, v11);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

      }
    }

  }
}

- (void)runLegacyMigration
{
  -[_KSTextReplacementLegacyStore importLegacyEntries](self, "importLegacyEntries");
  -[_KSTextReplacementLegacyStore migrateTellurideData](self, "migrateTellurideData");
  -[_KSTextReplacementLegacyStore migrateSundanceData](self, "migrateSundanceData");
}

+ (id)basePersistentStoreURL
{
  if (basePersistentStoreURL_onceToken != -1)
    dispatch_once(&basePersistentStoreURL_onceToken, &__block_literal_global_7);
  return (id)basePersistentStoreURL_baseURL;
}

+ (id)cachedStorePath
{
  void *v2;
  void *v3;

  +[_KSUtilities keyboardDirectory](_KSUtilities, "keyboardDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("textReplacements.cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)persistentStoreCoordinatorStoresWillChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _KSTextReplacementLegacyStore *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  KSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresWillChange:]";
    _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  >>> persistentStoreCoordinatorStoresWillChange", buf, 0xCu);
  }

  -[_KSTextReplacementLegacyStore workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  v7 = self;
  objc_sync_enter(v7);
  if (-[_KSTextReplacementLegacyStore suspendedForAccountChange](v7, "suspendedForAccountChange"))
  {
    objc_sync_exit(v7);

  }
  else
  {
    -[_KSTextReplacementLegacyStore setSuspendedForAccountChange:](v7, "setSuspendedForAccountChange:", 1);
    objc_sync_exit(v7);

    -[_KSTextReplacementLegacyStore workQueue](v7, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke;
    block[3] = &unk_24E204790;
    block[4] = v7;
    dispatch_sync(v8, block);

  }
}

- (void)persistentStoreCoordinatorStoresDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _KSTextReplacementLegacyStore *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  KSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]";
    _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  >>> persistentStoreCoordinatorStoresDidChange", buf, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  if (-[_KSTextReplacementLegacyStore suspendedForAccountChange](v6, "suspendedForAccountChange"))
  {
    -[_KSTextReplacementLegacyStore setSuspendedForAccountChange:](v6, "setSuspendedForAccountChange:", 0);
    objc_sync_exit(v6);

    -[_KSTextReplacementLegacyStore workQueue](v6, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v7);

    -[_KSTextReplacementLegacyStore workQueue](v6, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresDidChange___block_invoke;
    block[3] = &unk_24E204790;
    block[4] = v6;
    dispatch_async(v8, block);

    KSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]";
      _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, "%s  Resuming user dictionary after account change.", buf, 0xCu);
    }

    -[_KSTextReplacementLegacyStore workQueue](v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v10);

  }
  else
  {
    objc_sync_exit(v6);

  }
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  NSLog(CFSTR("Inaccessible fault encountered"), a2, a3, a4, a5, a6);
  return 2;
}

- (NSString)cacheFilePath
{
  return self->_cacheFilePath;
}

- (void)setCacheFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (void)setPersistentStore:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStore, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)suspendedForAccountChange
{
  return self->_suspendedForAccountChange;
}

- (void)setSuspendedForAccountChange:(BOOL)a3
{
  self->_suspendedForAccountChange = a3;
}

- (BOOL)forceMaintenance
{
  return self->_forceMaintenance;
}

- (void)setForceMaintenance:(BOOL)a3
{
  self->_forceMaintenance = a3;
}

- (NSDate)lastMaintenanceDate
{
  return self->_lastMaintenanceDate;
}

- (void)setLastMaintenanceDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMaintenanceDate, a3);
}

- (int64_t)importedSinceMaintenance
{
  return self->_importedSinceMaintenance;
}

- (void)setImportedSinceMaintenance:(int64_t)a3
{
  self->_importedSinceMaintenance = a3;
}

- (BOOL)pendingSampleShortcutImport
{
  return self->_pendingSampleShortcutImport;
}

- (void)setPendingSampleShortcutImport:(BOOL)a3
{
  self->_pendingSampleShortcutImport = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (BOOL)minimumUptimeDidExpire
{
  return self->_minimumUptimeDidExpire;
}

- (void)setMinimumUptimeDidExpire:(BOOL)a3
{
  self->_minimumUptimeDidExpire = a3;
}

- (NSDate)persistentStoreDidLoadTime
{
  return self->_persistentStoreDidLoadTime;
}

- (void)setPersistentStoreDidLoadTime:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreDidLoadTime, a3);
}

- (BOOL)didScheduleCacheUpdate
{
  return self->_didScheduleCacheUpdate;
}

- (void)setDidScheduleCacheUpdate:(BOOL)a3
{
  self->_didScheduleCacheUpdate = a3;
}

- (BOOL)shouldUpdateTheCache
{
  return self->_shouldUpdateTheCache;
}

- (void)setShouldUpdateTheCache:(BOOL)a3
{
  self->_shouldUpdateTheCache = a3;
}

- (BOOL)ubiquityStoreLoaded
{
  return self->_ubiquityStoreLoaded;
}

- (void)setUbiquityStoreLoaded:(BOOL)a3
{
  self->_ubiquityStoreLoaded = a3;
}

- (NSDate)ubiquityStoreLoadStartTime
{
  return self->_ubiquityStoreLoadStartTime;
}

- (void)setUbiquityStoreLoadStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityStoreLoadStartTime, a3);
}

- (BOOL)shouldDisableCaching
{
  return self->_shouldDisableCaching;
}

- (void)setShouldDisableCaching:(BOOL)a3
{
  self->_shouldDisableCaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityStoreLoadStartTime, 0);
  objc_storeStrong((id *)&self->_persistentStoreDidLoadTime, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_lastMaintenanceDate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_cacheFilePath, 0);
  objc_storeStrong((id *)&self->_uptimeTransaction, 0);
}

@end
