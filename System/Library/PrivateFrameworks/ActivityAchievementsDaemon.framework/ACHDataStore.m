@implementation ACHDataStore

- (ACHDataStore)initWithHealthStore:(id)a3 assertionClient:(id)a4
{
  id v6;
  ACHDataStore *v7;
  ACHDataStore *v8;
  uint64_t v9;
  ACHAwardsKeyValueClient *keyValueClient;
  uint64_t v11;
  NSHashTable *propertyProviders;
  uint64_t v13;
  OS_dispatch_queue *internalQueue;
  uint64_t v15;
  NSHashTable *observers;
  uint64_t v17;
  OS_dispatch_queue *notificationQueue;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ACHDataStore;
  v7 = -[ACHDataStore init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_healthStore, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE017C0]), "initWithHealthStore:", v6);
    keyValueClient = v8->_keyValueClient;
    v8->_keyValueClient = (ACHAwardsKeyValueClient *)v9;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    propertyProviders = v8->_propertyProviders;
    v8->_propertyProviders = (NSHashTable *)v11;

    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v15;

    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v8->_notificationQueue;
    v8->_notificationQueue = (OS_dispatch_queue *)v17;

  }
  return v8;
}

- (ACHDataStore)initWithProfile:(id)a3
{
  id v4;
  ACHDataStore *v5;
  ACHDataStore *v6;
  uint64_t v7;
  NSHashTable *propertyProviders;
  uint64_t v9;
  HDKeyValueDomain *defaultsDomain;
  uint64_t v11;
  OS_dispatch_queue *internalQueue;
  uint64_t v13;
  NSHashTable *observers;
  uint64_t v15;
  OS_dispatch_queue *notificationQueue;
  void *v17;
  id WeakRetained;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ACHDataStore;
  v5 = -[ACHDataStore init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    propertyProviders = v6->_propertyProviders;
    v6->_propertyProviders = (NSHashTable *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE40AD0]), "initWithCategory:domainName:profile:", 0, CFSTR("com.apple.FitnessAchievements.DataStore"), v4);
    defaultsDomain = v6->_defaultsDomain;
    v6->_defaultsDomain = (HDKeyValueDomain *)v9;

    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v13;

    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__syncEntityDidReceiveValues_, CFSTR("ACHDataStoreSyncEntityDidReceiveValuesNotification"), 0);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerForDaemonReady:", v6);

  }
  return v6;
}

- (void)activate
{
  -[ACHDataStore _listenForNotifications](self, "_listenForNotifications");
  -[ACHDataStore _startUp](self, "_startUp");
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  if (notify_is_valid_token(self->_syncToken))
    notify_cancel(self->_syncToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHDataStore;
  -[ACHDataStore dealloc](&v3, sel_dealloc);
}

- (void)addPropertyProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ACHDataStore_addPropertyProvider___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__ACHDataStore_addPropertyProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  if (objc_msgSend(*(id *)(a1 + 32), "hasCompletedFirstPopulateFromDatabase"))
  {
    objc_msgSend(*(id *)(a1 + 32), "injectedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3;
    objc_msgSend(v4, "_queue_populateFromDatabaseForProviders:error:", v5, &v7);
    v6 = v7;

  }
}

- (void)_syncEntityDidReceiveValues:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ACHDataStore__syncEntityDidReceiveValues___block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __44__ACHDataStore__syncEntityDidReceiveValues___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ACHLogDatabase();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Sync entity received new dataStore values, re-populating values from data store", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase");
}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addProtectedDataObserver:", self);

  -[ACHDataStore _startUp](self, "_startUp");
}

- (void)_listenForNotifications
{
  const char *v3;
  NSObject *internalQueue;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD handler[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
  internalQueue = self->_internalQueue;
  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39__ACHDataStore__listenForNotifications__block_invoke;
  handler[3] = &unk_24D13A2C0;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v3, &self->_protectedDataToken, internalQueue, handler);
  v6 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01268], "UTF8String");
  v7 = self->_internalQueue;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39__ACHDataStore__listenForNotifications__block_invoke_2;
  v8[3] = &unk_24D13A2C0;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v6, &self->_syncToken, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__ACHDataStore__listenForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_protectedDataStateDidChange");

}

void __39__ACHDataStore__listenForNotifications__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  ACHLogDatabase();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Sync entity received new dataStore values, re-populating values from data store", v9, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "keyValueClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "protectedDataAvailable");

  v7 = objc_loadWeakRetained(v3);
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "_queue_populateAllPropertiesFromDatabase");
  else
    objc_msgSend(v7, "setNeedsPopulationWhenProtectedDataAvailable:", 1);

}

- (void)_startUp
{
  NSObject *v3;
  _QWORD block[5];

  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__ACHDataStore__startUp__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__ACHDataStore__startUp__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase");
  if ((result & 1) == 0)
  {
    ACHLogDatabase();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Error populating initial values. Will repopulate when protected data is available.", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setNeedsPopulationWhenProtectedDataAvailable:", 1);
  }
  return result;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[ACHDataStore internalQueue](self, "internalQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ACHDataStore_database_protectedDataDidBecomeAvailable___block_invoke;
  v7[3] = &unk_24D13ABF0;
  v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);

}

void __57__ACHDataStore_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "needsPopulationWhenProtectedDataAvailable"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setNeedsPopulationWhenProtectedDataAvailable:", 0);
    }
    else
    {
      ACHLogDatabase();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Error fetching after protected data became available", v3, 2u);
      }

    }
  }
}

- (void)_protectedDataStateDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ACHDataStore__protectedDataStateDidChange__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v3, block);

}

void __44__ACHDataStore__protectedDataStateDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "keyValueClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "protectedDataAvailable");

  if (v3 && objc_msgSend(*(id *)(a1 + 32), "needsPopulationWhenProtectedDataAvailable"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setNeedsPopulationWhenProtectedDataAvailable:", 0);
    }
    else
    {
      ACHLogDatabase();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Error fetching after protected data became available", v5, 2u);
      }

    }
  }
}

- (NSString)databaseIdentifier
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__21;
  v12 = __Block_byref_object_dispose__21;
  v13 = 0;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__ACHDataStore_databaseIdentifier__block_invoke;
  v7[3] = &unk_24D13ACE0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __34__ACHDataStore_databaseIdentifier__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v2 = *(id **)(a1 + 32);
  if (v2[3])
  {
    if (objc_msgSend(v2[3], "length"))
      goto LABEL_13;
    v2 = *(id **)(a1 + 32);
  }
  objc_msgSend(v2, "injectedError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultsDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_databaseIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v4, "stringForKey:error:", v5, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;

  if (v7)
  {
    ACHLogDatabase();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __34__ACHDataStore_databaseIdentifier__block_invoke_cold_2();
  }
  else if (v6 && objc_msgSend(v6, "length"))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8 = *(NSObject **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v10;
  }
  else
  {
    ACHLogDatabase();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __34__ACHDataStore_databaseIdentifier__block_invoke_cold_1(v8, v11, v12, v13, v14, v15, v16, v17);
  }

LABEL_13:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setDatabaseIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ACHDataStore internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ACHDataStore_setDatabaseIdentifier___block_invoke;
  block[3] = &unk_24D13A360;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __38__ACHDataStore_setDatabaseIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "injectedError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  objc_msgSend(v3, "_queue_setDatabaseIdentifier:error:", v4, &v7);
  v5 = v7;

  if (v5)
  {
    ACHLogDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __38__ACHDataStore_setDatabaseIdentifier___block_invoke_cold_1();

  }
}

- (BOOL)clearAllPropertiesWithError:(id *)a3 databaseContext:(id)a4
{
  id v6;
  NSObject *v7;
  dispatch_group_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  uint8_t v17[16];
  _QWORD block[5];
  id v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a4;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWritingProtectedData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v8 = dispatch_group_create();
  -[ACHDataStore internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke;
  block[3] = &unk_24D13C4D0;
  block[4] = self;
  v21 = &v28;
  v10 = v6;
  v19 = v10;
  v23 = a3;
  v11 = v8;
  v20 = v11;
  v22 = &v24;
  dispatch_sync(v9, block);

  v12 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v11, v12) >= 1)
  {
    ACHLogDatabase();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "OHNO: Max wait time reached in dispatch group for clearing properties for all providers.", v17, 2u);
    }

  }
  if (!*((_BYTE *)v25 + 24))
  {
    ACHLogDatabase();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "Failure in resetting in-memory values for one or more property providers.", v17, 2u);
    }

  }
  v15 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  _QWORD block[6];
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v8, "dataStorePropertyKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyForWritingProtectedData");
  v14 = *(_QWORD *)(a1 + 72);
  v15 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_2;
  v34[3] = &unk_24D13C458;
  v16 = v2;
  v17 = *(_QWORD *)(a1 + 32);
  v35 = v16;
  v36 = v17;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v12, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, v14, v34, 0);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v26 = v16;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          dispatch_get_global_queue(21, 0);
          v24 = objc_claimAutoreleasedReturnValue();
          block[0] = v15;
          block[1] = 3221225472;
          block[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_3;
          block[3] = &unk_24D13C4A8;
          v25 = *(_QWORD *)(a1 + 32);
          block[4] = v23;
          block[5] = v25;
          v29 = *(_QWORD *)(a1 + 64);
          v28 = *(id *)(a1 + 48);
          dispatch_async(v24, block);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v20);
    }

    v16 = v26;
  }

}

uint64_t __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "profile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = +[ACHDataStoreSyncEntity removeDataStoreValuesForKeys:domain:profile:error:](ACHDataStoreSyncEntity, "removeDataStoreValuesForKeys:domain:profile:error:", v10, v9, v11, a3);

        if (!(_DWORD)v9)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

void __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_4;
  v5[3] = &unk_24D13C480;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "dataStoreDidClearAllProperties:completion:", v2, v5);

}

void __60__ACHDataStore_clearAllPropertiesWithError_databaseContext___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)clearAllInMemoryPropertiesWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[ACHDataStore internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__21;
  v20 = __Block_byref_object_dispose__21;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke;
  block[3] = &unk_24D13B6C0;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v12;
  dispatch_sync(v6, block);

  v7 = (id)v17[5];
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v20[16];
  _QWORD block[6];
  NSObject *v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2810000000;
  v29[3] = &unk_21410B3BF;
  v30 = 0;
  v2 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        dispatch_get_global_queue(17, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_2;
        block[3] = &unk_24D13C520;
        v9 = *(_QWORD *)(a1 + 32);
        block[4] = v7;
        block[5] = v9;
        v23 = v29;
        v24 = *(_OWORD *)(a1 + 40);
        v22 = v2;
        dispatch_async(v8, block);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v4);
  }

  v10 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v2, v10) >= 1)
  {
    ACHLogDatabase();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    ACHLogDatabase();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Failure in resetting in-memory values for one or more property providers.", v20, 2u);
    }

  }
  _Block_object_dispose(v29, 8);
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;

  v5[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 64);
  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3;
  v5[3] = &unk_24D13C4F8;
  v5[4] = v1;
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "dataStoreDidClearAllProperties:completion:", v2, v5);

}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  if ((a2 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Error clearing in memory store for property provider: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    ACHLogDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3_cold_1();

    v8 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), 10, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v13 + 24))
    v14 = a2;
  else
    v14 = 0;
  *(_BYTE *)(v13 + 24) = v14;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)commitAllPropertiesToDatabaseWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWritingProtectedData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[ACHDataStore internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke;
  block[3] = &unk_24D13B530;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

void __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "dataStoreProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v11);

        ACHLegacyKeyValueRepresentationFromProperties();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v3, "addEntriesFromDictionary:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyForWritingProtectedData");
  v32 = 0;
  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_2;
  v28[3] = &unk_24D13B558;
  v17 = v2;
  v18 = *(_QWORD *)(a1 + 32);
  v29 = v17;
  v30 = v18;
  v19 = v3;
  v31 = v19;
  v20 = objc_msgSend(v14, "performTransactionWithContext:error:block:inaccessibilityHandler:", v15, &v32, v28, 0);
  v21 = v32;

  v22 = *(void **)(a1 + 48);
  if (v22)
  {
    dispatch_get_global_queue(21, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_3;
    block[3] = &unk_24D13BBD0;
    v26 = v22;
    v27 = v20;
    v25 = v21;
    dispatch_async(v23, block);

  }
}

uint64_t __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1[4], "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1[4], "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = +[ACHDataStoreSyncEntity setDataStoreValuesWithDictionary:domain:profile:error:](ACHDataStoreSyncEntity, "setDataStoreValuesWithDictionary:domain:profile:error:", v11, v10, v12, a3);

        if (!(_DWORD)v10)
        {

          return 0;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (objc_msgSend(a1[6], "count")
    && (v13 = a1[6],
        objc_msgSend(a1[5], "profile"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = +[ACHBackCompatLegacyAchievementKeyValueSyncEntity setLegacyDataStoreValuesWithDictionary:profile:error:](ACHBackCompatLegacyAchievementKeyValueSyncEntity, "setLegacyDataStoreValuesWithDictionary:profile:error:", v13, v14, a3), v14, !v15))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

uint64_t __68__ACHDataStore_commitAllPropertiesToDatabaseWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)commitAllPropertiesWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[ACHDataStore internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__21;
  v20 = __Block_byref_object_dispose__21;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ACHDataStore_commitAllPropertiesWithError___block_invoke;
  block[3] = &unk_24D13B6C0;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v12;
  dispatch_sync(v6, block);

  v7 = (id)v17[5];
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __45__ACHDataStore_commitAllPropertiesWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assertionClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v6, "acquireDatabaseAssertionWithIdentifier:error:", &stru_24D13EA68, &v42);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v42;

    if (v8)
    {
      ACHLogDatabase();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_2();

      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = v8;
      v12 = *(id *)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v18, "dataStoreProperties");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "uniqueName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

            ACHLegacyKeyValueRepresentationFromProperties();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend(v5, "addEntriesFromDictionary:", v21);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v15);
      }

      objc_msgSend(*(id *)(a1 + 32), "keyValueClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v23 = objc_msgSend(v22, "setValuesWithDomainDictionary:error:", v4, &v37);
      v12 = v37;

      objc_msgSend(*(id *)(a1 + 32), "keyValueClient");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v25 = objc_msgSend(v24, "setLegacyValuesWithDictionary:error:", v5, &v36);
      v26 = v36;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23 & v25;
      if (v12)
        v27 = v12;
      else
        v27 = v26;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v27);
      objc_msgSend(*(id *)(a1 + 32), "assertionClient");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v28, "invalidateAssertionWithToken:error:", v7, &v35);
      v11 = v35;

      if (v11)
      {
        ACHLogDatabase();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1();

        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v33 = *(void **)(v30 + 40);
        v31 = (id *)(v30 + 40);
        v32 = v33;
        if (v33)
          v34 = v32;
        else
          v34 = v11;
        objc_storeStrong(v31, v34);
      }

    }
  }
}

- (BOOL)commitPropertiesForProvider:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__21;
  v26 = __Block_byref_object_dispose__21;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__ACHDataStore_commitPropertiesForProvider_withError___block_invoke;
  v14[3] = &unk_24D13AE30;
  v14[4] = self;
  v16 = &v22;
  v9 = v6;
  v15 = v9;
  v17 = &v18;
  dispatch_sync(v8, v14);

  v10 = (id)v23[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __54__ACHDataStore_commitPropertiesForProvider_withError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "propertyProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "assertionClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v4, "acquireDatabaseAssertionWithIdentifier:error:", CFSTR("com.apple.activityawardsd.ACHDataStoreCommit"), &v32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v32;

    if (v6)
    {
      ACHLogDatabase();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_2();

      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = v6;
      v10 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "dataStoreProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ACHLegacyKeyValueRepresentationFromProperties();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ACHLogDatabase();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v13;
        v37 = 2112;
        v38 = v10;
        _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Commiting properties [%@]: %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "keyValueClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uniqueName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v15;
      v34 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v16 = objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v17 = objc_msgSend(v14, "setValuesWithDomainDictionary:error:", v16, &v31);
      v18 = v31;

      objc_msgSend(*(id *)(a1 + 32), "keyValueClient");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      LOBYTE(v16) = objc_msgSend(v19, "setLegacyValuesWithDictionary:error:", v11, &v30);
      v20 = v30;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v17 & v16;
      if (v18)
        v21 = v18;
      else
        v21 = v20;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v21);
      objc_msgSend(*(id *)(a1 + 32), "assertionClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(v22, "invalidateAssertionWithToken:error:", v5, &v29);
      v9 = v29;

      if (v9)
      {
        ACHLogDatabase();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1();

        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v27 = *(void **)(v24 + 40);
        v25 = (id *)(v24 + 40);
        v26 = v27;
        if (v27)
          v28 = v26;
        else
          v28 = v9;
        objc_storeStrong(v25, v28);
      }

    }
  }
}

- (BOOL)_queue_populateAllPropertiesFromDatabase
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[8];
  id v14;

  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACHDataStore injectedError](self, "injectedError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHDataStore propertyProviders](self, "propertyProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  v7 = -[ACHDataStore _queue_populateFromDatabaseForProviders:error:](self, "_queue_populateFromDatabaseForProviders:error:", v6, &v14);
  v8 = v14;

  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Data store population complete, notifying observers", buf, 2u);
    }

    -[ACHDataStore notificationQueue](self, "notificationQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__ACHDataStore__queue_populateAllPropertiesFromDatabase__block_invoke;
    block[3] = &unk_24D13A338;
    block[4] = self;
    dispatch_async(v10, block);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ACHDataStore _queue_populateAllPropertiesFromDatabase].cold.1();
  }

  return v7;
}

void __56__ACHDataStore__queue_populateAllPropertiesFromDatabase__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "dataStoreDidPopulate:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_queue_dictionaryRepresentationOfAllProviderProperties
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ACHDataStore propertyProviders](self, "propertyProviders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = (void *)MEMORY[0x24BDBD1B8];
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "dataStoreProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v12, "addEntriesFromDictionary:", v11);
        v8 = (void *)objc_msgSend(v12, "copy");

        ++v9;
        v10 = v8;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v8;
}

- (id)_queue_allPropertyProviderKeys
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ACHDataStore propertyProviders](self, "propertyProviders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "dataStorePropertyKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v8;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (BOOL)_queue_setDatabaseIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;

  v7 = a3;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ACHDataStore defaultsDomain](self, "defaultsDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_databaseIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "setString:forKey:error:", v7, v10, a4);

  if (v11)
    objc_storeStrong((id *)&self->_databaseIdentifier, a3);

  return v11;
}

- (BOOL)_queue_populateFromDatabaseForProviders:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v6 = a3;
  -[ACHDataStore healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[ACHDataStore _queue_healthStore_populateFromDatabaseForProviders:error:](self, "_queue_healthStore_populateFromDatabaseForProviders:error:", v6, a4);
  else
    v8 = -[ACHDataStore _queue_daemon_populateFromDatabaseForProviders:error:](self, "_queue_daemon_populateFromDatabaseForProviders:error:", v6, a4);
  v9 = v8;

  return v9;
}

- (BOOL)_queue_healthStore_populateFromDatabaseForProviders:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void (**v29)(_QWORD);
  id *v31;
  void *v32;
  id v33;
  NSObject *obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ACHDataStore keyValueClient](self, "keyValueClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "protectedDataAvailable");

  if (v9)
  {
    -[ACHDataStore assertionClient](self, "assertionClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v10, "acquireDatabaseAssertionWithIdentifier:error:", CFSTR("Populate"), &v41);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v41;

    if (v12)
    {
      ACHLogXPC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ACHDataStore _queue_healthStore_populateFromDatabaseForProviders:error:].cold.2();
      LOBYTE(v9) = 0;
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v14 = v6;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v15)
      {
        v16 = v15;
        v31 = a4;
        v32 = v11;
        v33 = v6;
        obj = v14;
        v17 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v38 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            -[ACHDataStore keyValueClient](self, "keyValueClient", v31);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "dataStorePropertyKeys");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "uniqueName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0;
            objc_msgSend(v20, "valuesForKeys:domain:error:", v21, v22, &v36);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v36;

            if (v24)
            {

              v25 = v24;
              v14 = v25;
              if (v31)
              {
                v14 = objc_retainAutorelease(v25);
                v9 = 0;
                *v31 = v14;
              }
              else
              {
                _HKLogDroppedError();
                v9 = 0;
              }
              v13 = v14;
              goto LABEL_20;
            }
            objc_msgSend(v19, "setDataStoreProperties:", v23);

          }
          v14 = obj;
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          if (v16)
            continue;
          break;
        }
        v13 = 0;
        v9 = 1;
LABEL_20:
        v11 = v32;
        v6 = v33;
      }
      else
      {
        v13 = 0;
        v9 = 1;
      }

      -[ACHDataStore assertionClient](self, "assertionClient");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v26, "invalidateAssertionWithToken:error:", v11, &v35);
      v12 = v35;

      if (v12)
      {
        ACHLogDatabase();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1();

      }
      if (v9)
      {
        -[ACHDataStore setHasCompletedFirstPopulateFromDatabase:](self, "setHasCompletedFirstPopulateFromDatabase:", 1);
        -[ACHDataStore populationCompleteBlock](self, "populationCompleteBlock");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[ACHDataStore populationCompleteBlock](self, "populationCompleteBlock");
          v29 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
          -[ACHDataStore setPopulationCompleteBlock:](self, "setPopulationCompleteBlock:", 0);
          v29[2](v29);

        }
      }
    }

  }
  return v9;
}

- (BOOL)_queue_daemon_populateFromDatabaseForProviders:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD);
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  ACHDataStore *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__21;
  v23[4] = __Block_byref_object_dispose__21;
  v24 = (id)MEMORY[0x24BDBD1A8];
  v8 = (void *)MEMORY[0x24BE40B88];
  -[ACHDataStore profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke;
  v19[3] = &unk_24D13B7C0;
  v12 = v6;
  v20 = v12;
  v21 = self;
  v22 = v23;
  v13 = objc_msgSend(v8, "performReadTransactionWithHealthDatabase:error:block:", v10, a4, v19);

  if (v13)
  {
    dispatch_get_global_queue(21, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_2;
    v18[3] = &unk_24D13C548;
    v18[4] = v23;
    dispatch_async(v14, v18);

    -[ACHDataStore setHasCompletedFirstPopulateFromDatabase:](self, "setHasCompletedFirstPopulateFromDatabase:", 1);
    -[ACHDataStore populationCompleteBlock](self, "populationCompleteBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[ACHDataStore populationCompleteBlock](self, "populationCompleteBlock");
      v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[ACHDataStore setPopulationCompleteBlock:](self, "setPopulationCompleteBlock:", 0);
      v16[2](v16);

    }
  }

  _Block_object_dispose(v23, 8);
  return v13;
}

uint64_t __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v34 = a2;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v36 = a1;
  v5 = *(id *)(a1 + 32);
  v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v31)
  {
    v6 = *(_QWORD *)v45;
    v7 = (void *)MEMORY[0x24BDBD1B8];
    v33 = v5;
    v30 = *(_QWORD *)v45;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(v5);
        v32 = v8;
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v37 = v9;
        objc_msgSend(v9, "dataStorePropertyKeys", v30);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v41;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v41 != v12)
                objc_enumerationMutation(obj);
              v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v37, "uniqueName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v36 + 40), "profile");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              +[ACHDataStoreSyncEntity dataStoreValueForKey:domain:profile:error:](ACHDataStoreSyncEntity, "dataStoreValueForKey:domain:profile:error:", v14, v15, v16, a3);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                v48 = v14;
                v49 = v17;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
                v18 = (id)objc_claimAutoreleasedReturnValue();
                v19 = (void *)objc_msgSend(v7, "mutableCopy");
                objc_msgSend(v19, "addEntriesFromDictionary:", v18);

                v20 = objc_msgSend(v19, "copy");
                v7 = (void *)v20;
              }
              if (*a3)
              {
                ACHLogDatabase();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_cold_1();

                v27 = 0;
                v5 = v33;
                goto LABEL_23;
              }

            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            if (v11)
              continue;
            break;
          }
        }

        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(v36 + 48) + 8) + 40);
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_223;
        v38[3] = &unk_24D13A360;
        v38[4] = v37;
        v39 = v7;
        v22 = v7;
        v23 = (void *)MEMORY[0x2199C9184](v38);
        objc_msgSend(v21, "arrayByAddingObject:", v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(*(_QWORD *)(v36 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

        v8 = v32 + 1;
        v5 = v33;
        v6 = v30;
        v7 = (void *)MEMORY[0x24BDBD1B8];
      }
      while (v32 + 1 != v31);
      v27 = 1;
      v31 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v31);
  }
  else
  {
    v27 = 1;
  }
LABEL_23:

  return v27;
}

uint64_t __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_223(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDataStoreProperties:", *(_QWORD *)(a1 + 40));
}

void __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D74B58))
  {
    -[ACHDataStore notificationQueue](self, "notificationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __28__ACHDataStore_addObserver___block_invoke;
    v7[3] = &unk_24D13A360;
    v7[4] = self;
    v8 = v4;
    dispatch_sync(v5, v7);

  }
  else
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHDataStore addObserver:].cold.1();

  }
}

uint64_t __28__ACHDataStore_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 32), "hasCompletedFirstPopulateFromDatabase");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "dataStoreDidPopulate:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ACHDataStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ACHDataStore_removeObserver___block_invoke;
  block[3] = &unk_24D13A360;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __31__ACHDataStore_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_forceDatabasePopulate
{
  ACHDataStore *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ACHDataStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__ACHDataStore__forceDatabasePopulate__block_invoke;
  v5[3] = &unk_24D13AC40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__ACHDataStore__forceDatabasePopulate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_populateAllPropertiesFromDatabase");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (ACHAwardsKeyValueClient)keyValueClient
{
  return self->_keyValueClient;
}

- (void)setKeyValueClient:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueClient, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (ACHDatabaseAssertionClient)assertionClient
{
  return self->_assertionClient;
}

- (void)setAssertionClient:(id)a3
{
  objc_storeStrong((id *)&self->_assertionClient, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDKeyValueDomain)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (BOOL)needsPopulationWhenProtectedDataAvailable
{
  return self->_needsPopulationWhenProtectedDataAvailable;
}

- (void)setNeedsPopulationWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsPopulationWhenProtectedDataAvailable = a3;
}

- (BOOL)hasCompletedFirstPopulateFromDatabase
{
  return self->_hasCompletedFirstPopulateFromDatabase;
}

- (void)setHasCompletedFirstPopulateFromDatabase:(BOOL)a3
{
  self->_hasCompletedFirstPopulateFromDatabase = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSError)injectedError
{
  return self->_injectedError;
}

- (void)setInjectedError:(id)a3
{
  objc_storeStrong((id *)&self->_injectedError, a3);
}

- (id)populationCompleteBlock
{
  return self->_populationCompleteBlock;
}

- (void)setPopulationCompleteBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSHashTable)propertyProviders
{
  return self->_propertyProviders;
}

- (void)setPropertyProviders:(id)a3
{
  objc_storeStrong((id *)&self->_propertyProviders, a3);
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (int)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(int)a3
{
  self->_syncToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProviders, 0);
  objc_storeStrong(&self->_populationCompleteBlock, 0);
  objc_storeStrong((id *)&self->_injectedError, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_keyValueClient, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
}

void __34__ACHDataStore_databaseIdentifier__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_21407B000, a1, a3, "Error: No database identifier", a5, a6, a7, a8, 0);
}

void __34__ACHDataStore_databaseIdentifier__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error fetching database identifier from local defaults store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__ACHDataStore_setDatabaseIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error setting database identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_21407B000, a1, a3, "OHNO: Max wait time reached in dispatch group for clearing in memory properties for all providers.", a5, a6, a7, a8, 0);
}

void __52__ACHDataStore_clearAllInMemoryPropertiesWithError___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error invalidating assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__ACHDataStore_commitAllPropertiesWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error getting assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_populateAllPropertiesFromDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error populating data store properties: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_healthStore_populateFromDatabaseForProviders:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error acquiring assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__ACHDataStore__queue_daemon_populateFromDatabaseForProviders_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_21407B000, v1, OS_LOG_TYPE_ERROR, "Error pulling value from database for key %@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)addObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Data store did not add observer %@ since it doesn't conform to the observer protocol.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
