@implementation ACHEarnedInstanceStore

- (ACHEarnedInstanceStore)initWithClient:(id)a3 assertionClient:(id)a4 earnedInstanceDuplicateUtility:(id)a5 device:(unsigned __int8)a6
{
  id v11;
  id v12;
  id v13;
  ACHEarnedInstanceStore *v14;
  ACHEarnedInstanceStore *v15;
  uint64_t v16;
  OS_dispatch_queue *earnedInstanceQueue;
  NSMutableArray *v18;
  NSMutableArray *allEarnedInstances;
  uint64_t v20;
  OS_dispatch_queue *observerQueue;
  uint64_t v22;
  NSHashTable *observers;
  NSCache *v24;
  NSCache *earnedInstancesForTemplateUniqueNameCache;
  NSCache *v26;
  NSCache *earnedInstancesForEarnedDateComponentsCache;
  const char *v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v34.receiver = self;
  v34.super_class = (Class)ACHEarnedInstanceStore;
  v14 = -[ACHEarnedInstanceStore init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isUsingNewAwardingSystem = 1;
    objc_storeStrong((id *)&v14->_client, a3);
    objc_storeStrong((id *)&v15->_assertionClient, a4);
    objc_storeStrong((id *)&v15->_duplicateUtility, a5);
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    earnedInstanceQueue = v15->_earnedInstanceQueue;
    v15->_earnedInstanceQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    allEarnedInstances = v15->_allEarnedInstances;
    v15->_allEarnedInstances = v18;

    HKCreateSerialDispatchQueue();
    v20 = objc_claimAutoreleasedReturnValue();
    observerQueue = v15->_observerQueue;
    v15->_observerQueue = (OS_dispatch_queue *)v20;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v22;

    v24 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    earnedInstancesForTemplateUniqueNameCache = v15->_earnedInstancesForTemplateUniqueNameCache;
    v15->_earnedInstancesForTemplateUniqueNameCache = v24;

    v26 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    earnedInstancesForEarnedDateComponentsCache = v15->_earnedInstancesForEarnedDateComponentsCache;
    v15->_earnedInstancesForEarnedDateComponentsCache = v26;

    v15->_device = a6;
    objc_initWeak(&location, v15);
    v28 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01260], "UTF8String");
    v29 = v15->_earnedInstanceQueue;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __95__ACHEarnedInstanceStore_initWithClient_assertionClient_earnedInstanceDuplicateUtility_device___block_invoke;
    v31[3] = &unk_24D13A2C0;
    objc_copyWeak(&v32, &location);
    notify_register_dispatch(v28, &v15->_syncedEarnedInstancesToken, v29, v31);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __95__ACHEarnedInstanceStore_initWithClient_assertionClient_earnedInstanceDuplicateUtility_device___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversOfSync");

}

- (ACHEarnedInstanceStore)initWithProfile:(id)a3 earnedInstanceEntityWrapper:(id)a4 earnedInstanceDuplicateUtility:(id)a5 device:(unsigned __int8)a6
{
  id v10;
  id v11;
  id v12;
  ACHEarnedInstanceStore *v13;
  ACHEarnedInstanceStore *v14;
  uint64_t v15;
  OS_dispatch_queue *earnedInstanceQueue;
  NSMutableArray *v17;
  NSMutableArray *allEarnedInstances;
  uint64_t v19;
  OS_dispatch_queue *observerQueue;
  uint64_t v21;
  NSHashTable *observers;
  void *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ACHEarnedInstanceStore;
  v13 = -[ACHEarnedInstanceStore init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v14->_entityWrapper, a4);
    objc_storeStrong((id *)&v14->_duplicateUtility, a5);
    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    earnedInstanceQueue = v14->_earnedInstanceQueue;
    v14->_earnedInstanceQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    allEarnedInstances = v14->_allEarnedInstances;
    v14->_allEarnedInstances = v17;

    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    observerQueue = v14->_observerQueue;
    v14->_observerQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v21;

    v14->_device = a6;
    -[ACHEarnedInstanceStore entityWrapper](v14, "entityWrapper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSyncedEarnedInstancesObserver:", v14);

  }
  return v14;
}

- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  ACHEarnedInstanceStore *v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke;
  v10[3] = &unk_24D13BE08;
  v11 = v6;
  v12 = self;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ACHLogSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Earned instance store received %{public}@ earned instances from sync observing", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v5 = a1 + 32;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(v5 + 24);
  v13 = 0;
  v9 = objc_msgSend(v6, "_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:", v7, v8, 0, 0, &v13);
  v10 = v13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 8) + 24) = v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 8) + 24))
  {
    ACHLogSync();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)v5, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Successfully added %{public}@ earned instances from sync observing", buf, 0xCu);

    }
  }
  else
  {
    ACHLogDatabase();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke_cold_1();
  }

}

- (id)_queue_earnedInstancesFilteredForDuplicates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BDD1758];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__ACHEarnedInstanceStore__queue_earnedInstancesFilteredForDuplicates___block_invoke;
  v8[3] = &unk_24D13BE30;
  v8[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __70__ACHEarnedInstanceStore__queue_earnedInstancesFilteredForDuplicates___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allEarnedInstances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

- (id)_queue_orphanedEarnedInstancesWithFetchedInstances:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__ACHEarnedInstanceStore__queue_orphanedEarnedInstancesWithFetchedInstances___block_invoke;
  v11[3] = &unk_24D13BE30;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __77__ACHEarnedInstanceStore__queue_orphanedEarnedInstancesWithFetchedInstances___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:(id)a3 removedEarnedInstances:(id)a4
{
  id v5;
  NSObject *earnedInstanceQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  earnedInstanceQueue = self->_earnedInstanceQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __115__ACHEarnedInstanceStore_earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances_removedEarnedInstances___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(earnedInstanceQueue, v8);

}

uint64_t __115__ACHEarnedInstanceStore_earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances_removedEarnedInstances___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_purgeCaches");
  ACHLogDatabase();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ earned instances from journal being applied to in memory store", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_queue_appendOrInsertEarnedInstanceToInMemoryStore:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Notifying observers of added earned instances from journal being applied", buf, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfAddedEarnedInstances:", *(_QWORD *)(a1 + 40));
}

- (id)_queue_earnedInstancesArray
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  return v6;
}

- (NSArray)earnedInstances
{
  if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    -[ACHEarnedInstanceStore _client_earnedInstances](self, "_client_earnedInstances");
  else
    -[ACHEarnedInstanceStore _daemon_earnedInstances](self, "_daemon_earnedInstances");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_client_earnedInstances
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD block[7];
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = 0;
  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__15;
  v16[3] = __Block_byref_object_dispose__15;
  v17 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ACHEarnedInstanceStore__client_earnedInstances__block_invoke;
  block[3] = &unk_24D13B698;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v15;
  dispatch_sync(v4, block);

  if (*(_QWORD *)(v16[0] + 40))
  {
    ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore _client_earnedInstances].cold.1((uint64_t)v16, v5, v6, v7, v8, v9, v10, v11);

  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __49__ACHEarnedInstanceStore__client_earnedInstances__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "fetchAllEarnedInstancesWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_daemon_earnedInstances
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

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__ACHEarnedInstanceStore__daemon_earnedInstances__block_invoke;
  v7[3] = &unk_24D13AC40;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__ACHEarnedInstanceStore__daemon_earnedInstances__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_earnedInstancesArray");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    -[ACHEarnedInstanceStore _client_earnedInstancesForTemplateUniqueName:error:](self, "_client_earnedInstancesForTemplateUniqueName:error:", v6, a4);
  else
    -[ACHEarnedInstanceStore _daemon_earnedInstancesForTemplateUniqueName:](self, "_daemon_earnedInstancesForTemplateUniqueName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_client_earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__ACHEarnedInstanceStore__client_earnedInstancesForTemplateUniqueName_error___block_invoke;
  v13[3] = &unk_24D13B6E8;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v15 = &v23;
  v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore _client_earnedInstancesForTemplateUniqueName:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __77__ACHEarnedInstanceStore__client_earnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "earnedInstancesForTemplateUniqueNameCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v6 + 40);
    objc_msgSend(v4, "fetchEarnedInstancesForTemplateUniqueName:error:", v5, &obj);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "earnedInstancesForTemplateUniqueNameCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

    }
  }

}

- (id)_daemon_earnedInstancesForTemplateUniqueName:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke;
  block[3] = &unk_24D13AC40;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(v6, block);

  v8 = (void *)v16[5];
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke_2;
  v12[3] = &unk_24D13BAE0;
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "hk_filter:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_earnedInstancesArray");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __71__ACHEarnedInstanceStore__daemon_earnedInstancesForTemplateUniqueName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "templateUniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)earnedInstancesForEarnedDateComponents:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  ACHEarnedInstanceStore *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__15;
  v28 = __Block_byref_object_dispose__15;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__ACHEarnedInstanceStore_earnedInstancesForEarnedDateComponents_error___block_invoke;
  v13[3] = &unk_24D13B6E8;
  v9 = v6;
  v14 = v9;
  v15 = self;
  v16 = &v24;
  v17 = &v18;
  dispatch_sync(v8, v13);

  if (v19[5])
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore earnedInstancesForEarnedDateComponents:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);
  }
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __71__ACHEarnedInstanceStore_earnedInstancesForEarnedDateComponents_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;

  ACHYearMonthDayStringFromDateComponents();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "earnedInstancesForEarnedDateComponentsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v5, "fetchEarnedInstancesForEarnedDateComponents:error:", v6, &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "earnedInstancesForEarnedDateComponentsCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);

    }
  }

}

- (id)mostRecentEarnedInstanceForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__ACHEarnedInstanceStore_mostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke;
  v13[3] = &unk_24D13B4B8;
  v15 = &v23;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore mostRecentEarnedInstanceForTemplateUniqueName:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __78__ACHEarnedInstanceStore_mostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "fetchMostRecentEarnedInstanceForTemplateUniqueName:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)mostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__ACHEarnedInstanceStore_mostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v13[3] = &unk_24D13B4B8;
  v15 = &v23;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore mostRecentEarnedInstancesForTemplateUniqueNames:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __80__ACHEarnedInstanceStore_mostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "fetchMostRecentEarnedInstancesForTemplateUniqueNames:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v13[3] = &unk_24D13B4B8;
  v15 = &v23;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore countOfEarnedInstancesForTemplateUniqueName:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }
  v11 = v24[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __76__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "countOfEarnedInstancesForTemplateUniqueName:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "unsignedIntegerValue");

}

- (id)countOfEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v13[3] = &unk_24D13B4B8;
  v15 = &v23;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  dispatch_sync(v8, v13);

  if (v18[5])
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore countOfEarnedInstancesForTemplateUniqueNames:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __77__ACHEarnedInstanceStore_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "countOfEarnedInstancesForTemplateUniqueNames:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 inDateComponentInterval:(id)a4 withCalendar:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  -[ACHEarnedInstanceStore earnedInstancesForTemplateUniqueName:error:](self, "earnedInstancesForTemplateUniqueName:error:", a3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v10, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v20 = v19;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "earnedDateComponents", (_QWORD)v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateFromComponents:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceReferenceDate");
        v30 = v29;

        v31 = v30 <= v20 && v30 >= v16;
        v24 += v31;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)addEarnedInstances:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v16;
  ACHEarnedInstanceStore *v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ACHEarnedInstanceStore_addEarnedInstances_databaseContext_error___block_invoke;
  block[3] = &unk_24D13BE58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = &v21;
  v20 = a5;
  v12 = v9;
  v13 = v8;
  dispatch_sync(v11, block);

  LOBYTE(self) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return (char)self;
}

void __67__ACHEarnedInstanceStore_addEarnedInstances_databaseContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setCreatedDate:", v2, (_QWORD)v9);
        objc_msgSend(v8, "setCreatorDevice:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 64));
}

- (BOOL)addEarnedInstances:(id)a3 error:(id *)a4
{
  return -[ACHEarnedInstanceStore addEarnedInstances:databaseContext:error:](self, "addEarnedInstances:databaseContext:error:", a3, 0, a4);
}

- (void)_queue_appendOrInsertEarnedInstanceToInMemoryStore:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  if (!-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
  {
    -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8
        && (-[NSObject earnedDateComponents](v8, "earnedDateComponents"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "earnedDateComponents"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = ACHCompareYearMonthDayDateComponents(),
            v10,
            v9,
            v11 == 1))
      {
        *(_QWORD *)buf = 0;
        v26 = buf;
        v27 = 0x2020000000;
        v28 = 0;
        -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __77__ACHEarnedInstanceStore__queue_appendOrInsertEarnedInstanceToInMemoryStore___block_invoke;
        v22[3] = &unk_24D13BE80;
        v13 = v4;
        v23 = v13;
        v24 = buf;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);

        v14 = *((_QWORD *)v26 + 3);
        -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count") - 1;

        if (v14 >= v16)
        {
          ACHLogDatabase();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Unable to find index for earned instance insertion!", v21, 2u);
          }

          -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v13);

          -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_16);
        }
        else
        {
          -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "insertObject:atIndex:", v13, *((_QWORD *)v26 + 3));
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v4);

      }
    }
    else
    {
      ACHLogDatabase();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "!!!!! Trying to append earned instance to in-memory store but it's nil!", buf, 2u);
      }
    }

  }
}

void __77__ACHEarnedInstanceStore__queue_appendOrInsertEarnedInstanceToInMemoryStore___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a2, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "earnedDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = ACHCompareYearMonthDayDateComponents();

  if (v9 == 1)
  {
    v10 = a3 - 1;
    if (!a3)
      v10 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
    *a4 = 1;
  }
}

uint64_t __77__ACHEarnedInstanceStore__queue_appendOrInsertEarnedInstanceToInMemoryStore___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "earnedDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = ACHCompareYearMonthDayDateComponents();
  return v7;
}

- (void)_queue_removeEarnedInstanceFromInMemoryStore:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
  {
    -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

  }
}

- (void)_queue_purgeCaches
{
  NSObject *v3;
  void *v4;
  id v5;

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
  {
    -[ACHEarnedInstanceStore earnedInstancesForTemplateUniqueNameCache](self, "earnedInstancesForTemplateUniqueNameCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    -[ACHEarnedInstanceStore earnedInstancesForEarnedDateComponentsCache](self, "earnedInstancesForEarnedDateComponentsCache");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
}

- (BOOL)_queue_addEarnedInstances:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 triggerSync:(BOOL)a6 error:(id *)a7
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  ACHEarnedInstanceStore *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  NSObject *v42;
  void *v43;
  void *v44;
  _BOOL4 v46;
  void *v47;
  uint64_t v48;
  id v50;
  id obj;
  void *v52;
  uint64_t v53;
  void *context;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v46 = a6;
  v72 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v50 = a5;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[ACHEarnedInstanceStore _queue_purgeCaches](self, "_queue_purgeCaches");
  v12 = v10;
  objc_msgSend(v10, "hk_map:", &__block_literal_global_204);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
  {
    -[ACHEarnedInstanceStore assertionClient](self, "assertionClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    objc_msgSend(v14, "acquireDatabaseAssertionWithIdentifier:error:", CFSTR("AddEarnedInstances"), &v67);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v67;

    if (v16)
    {
      ACHLogDatabase();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ACHEarnedInstanceStore _queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:].cold.2();

    }
  }
  else
  {
    v15 = 0;
  }
  v47 = (void *)v15;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v13;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v53)
  {
    v18 = *(_QWORD *)v64;
    v19 = 1;
    v52 = (void *)MEMORY[0x24BDBD1A8];
    v20 = a4;
    v48 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v64 != v18)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        context = (void *)MEMORY[0x2199C8FE0]();
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_207;
        v62[3] = &unk_24D13BAE0;
        v62[4] = v22;
        objc_msgSend(v12, "hk_filter:", v62);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
        {
          v60 = 0;
          v24 = (id *)&v60;
          -[ACHEarnedInstanceStore _queue_client_addEarnedInstancesWithSingleTemplate:provenance:error:](self, "_queue_client_addEarnedInstancesWithSingleTemplate:provenance:error:", v23, v20, &v60);
        }
        else
        {
          v61 = 0;
          v24 = (id *)&v61;
          -[ACHEarnedInstanceStore _queue_daemon_addEarnedInstancesWithSingleTemplate:provenance:databaseContext:error:](self, "_queue_daemon_addEarnedInstancesWithSingleTemplate:provenance:databaseContext:error:", v23, v20, v50, &v61);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *v24;
        if (v26)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v52, "arrayByAddingObjectsFromArray:", v25);
          v27 = self;
          v28 = v19;
          v29 = v12;
          v30 = objc_claimAutoreleasedReturnValue();

          v52 = (void *)v30;
          v12 = v29;
          v19 = v28;
          self = v27;
          v18 = v48;
          v20 = a4;
        }

        objc_autoreleasePoolPop(context);
        if ((v19 & 1) == 0)
        {
          v31 = v26;
          if (v26)
          {
            if (a7)
              *a7 = objc_retainAutorelease(v31);
            else
              _HKLogDroppedError();
          }

        }
      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v53);
  }
  else
  {
    LOBYTE(v19) = 1;
    v52 = (void *)MEMORY[0x24BDBD1A8];
  }

  if (v47)
  {
    -[ACHEarnedInstanceStore assertionClient](self, "assertionClient");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v32, "invalidateAssertionWithToken:error:", v47, &v59);
    v33 = v59;

    if (v33)
    {
      ACHLogDatabase();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[ACHEarnedInstanceStore _queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:].cold.1();

    }
  }
  if ((v19 & 1) != 0)
  {
    ACHLogDatabase();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v36;
      _os_log_impl(&dword_21407B000, v35, OS_LOG_TYPE_DEFAULT, "Successfully added %{public}@ earned instances to database, adding them to in-memory store.", buf, 0xCu);

    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v37 = v52;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v56 != v40)
            objc_enumerationMutation(v37);
          -[ACHEarnedInstanceStore _queue_appendOrInsertEarnedInstanceToInMemoryStore:](self, "_queue_appendOrInsertEarnedInstanceToInMemoryStore:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v39);
    }

    ACHLogDatabase();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEFAULT, "Notifying observers of added earned instances.", buf, 2u);
    }

    -[ACHEarnedInstanceStore _notifyObserversOfAddedEarnedInstances:](self, "_notifyObserversOfAddedEarnedInstances:", v37);
    if (v46 && objc_msgSend(v37, "count"))
    {
      if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
      {
        -[ACHEarnedInstanceStore client](self, "client");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "triggerSyncWithCompletion:", &__block_literal_global_210);
      }
      else
      {
        -[ACHEarnedInstanceStore profile](self, "profile");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "nanoSyncManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("ActivityAchievements Earned Instances added"), 0);

      }
    }
  }

  return v19 & 1;
}

uint64_t __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "templateUniqueName");
}

uint64_t __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_207(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "templateUniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_208(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  ACHLogSync();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_208_cold_2(a2, v5);

  if (v4)
  {
    ACHLogSync();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_208_cold_1();

  }
}

- (id)_queue_client_addEarnedInstancesWithSingleTemplate:(id)a3 provenance:(int64_t)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v7 = a3;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "templateUniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHEarnedInstanceStore client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v11, "fetchEarnedInstancesForTemplateUniqueName:error:", v10, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;

  if (v13)
  {
    ACHLogDatabase();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore _queue_client_addEarnedInstancesWithSingleTemplate:provenance:error:].cold.1();

    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstanceStore duplicateUtility](self, "duplicateUtility");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v16;
    objc_msgSend(v16, "setByAddingObjectsFromSet:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "earnedInstancesWithoutDuplicates:", v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACHEarnedInstanceStore duplicateUtility](self, "duplicateUtility");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "earnedInstancesLimitedByEarnLimit:", v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "intersectSet:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_minus:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstanceStore client](self, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allObjects");
    v23 = v7;
    v24 = v10;
    v25 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = a5;
    v29 = (void *)v27;
    objc_msgSend(v22, "addEarnedInstances:removingEarnedInstances:error:", v26, v27, v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v25;
    v10 = v24;
    v7 = v23;

  }
  return v15;
}

- (id)_queue_daemon_addEarnedInstancesWithSingleTemplate:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  id v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;

  v9 = a5;
  v10 = a3;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v10, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "templateUniqueName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDBCF20];
  -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __110__ACHEarnedInstanceStore__queue_daemon_addEarnedInstancesWithSingleTemplate_provenance_databaseContext_error___block_invoke;
  v40[3] = &unk_24D13BAE0;
  v16 = v13;
  v41 = v16;
  objc_msgSend(v15, "hk_filter:", v40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHEarnedInstanceStore duplicateUtility](self, "duplicateUtility");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setByAddingObjectsFromSet:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "earnedInstancesWithoutDuplicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHEarnedInstanceStore duplicateUtility](self, "duplicateUtility");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "earnedInstancesLimitedByEarnLimit:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "intersectSet:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "hk_minus:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstanceStore entityWrapper](self, "entityWrapper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v26, "insertEarnedInstances:provenance:databaseContext:error:", v24, a4, v9, &v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v39;
  if (v28)
  {
    if (a6)
    {
      v29 = 0;
      *a6 = objc_retainAutorelease(v28);
    }
    else
    {
      _HKLogDroppedError();
      v29 = 0;
    }
  }
  else if (objc_msgSend(v25, "count"))
  {
    v36 = v16;
    objc_msgSend(v25, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v31 = -[ACHEarnedInstanceStore _queue_daemon_removeEarnedInstances:error:](self, "_queue_daemon_removeEarnedInstances:error:", v30, &v38);
    v32 = v38;

    if (v31)
    {
      v29 = v27;
    }
    else
    {
      v33 = v32;
      v34 = v33;
      if (v33)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v33);
        else
          _HKLogDroppedError();
      }

      v29 = 0;
    }

    v16 = v36;
  }
  else
  {
    v29 = v27;
  }

  return v29;
}

uint64_t __110__ACHEarnedInstanceStore__queue_daemon_addEarnedInstancesWithSingleTemplate_provenance_databaseContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "templateUniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__ACHEarnedInstanceStore_removeEarnedInstances_error___block_invoke;
  v15[3] = &unk_24D13AE30;
  v15[4] = self;
  v17 = &v19;
  v9 = v6;
  v16 = v9;
  v18 = &v23;
  dispatch_sync(v8, v15);

  v10 = (void *)v24[5];
  if (v10)
  {
    v11 = v10;
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();

  }
  v13 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __54__ACHEarnedInstanceStore_removeEarnedInstances_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id *v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "_queue_purgeCaches");
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(_QWORD *)(v5 + 40);
  v7 = (id *)(v5 + 40);
  v6 = v8;
  if (v2)
  {
    v12 = v6;
    v9 = (id *)&v12;
    v10 = objc_msgSend(v3, "_queue_client_removeEarnedInstances:error:", v4, &v12);
  }
  else
  {
    v13 = v6;
    v9 = (id *)&v13;
    v10 = objc_msgSend(v3, "_queue_daemon_removeEarnedInstances:error:", v4, &v13);
  }
  v11 = v10;
  objc_storeStrong(v7, *v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
}

- (BOOL)_queue_client_removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ACHEarnedInstanceStore client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "removeEarnedInstances:error:", v6, a4);

  if (v9)
  {
    -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsInArray:", v6);

    -[ACHEarnedInstanceStore _notifyObserversOfRemovedEarnedInstances:](self, "_notifyObserversOfRemovedEarnedInstances:", v6);
  }
  else
  {
    ACHLogDatabase();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore _queue_client_removeEarnedInstances:error:].cold.1(a4, (uint64_t)v6, v11);

  }
  return v9;
}

- (BOOL)_queue_daemon_removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v15;

  v6 = a3;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ACHEarnedInstanceStore entityWrapper](self, "entityWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "removeEarnedInstances:error:", v6, &v15);
  v10 = v15;

  if (v9)
  {
    -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsInArray:", v6);

    -[ACHEarnedInstanceStore _notifyObserversOfRemovedEarnedInstances:](self, "_notifyObserversOfRemovedEarnedInstances:", v6);
  }
  else
  {
    ACHLogDatabase();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore _queue_daemon_removeEarnedInstances:error:].cold.1();

    v13 = v10;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

  }
  return v9;
}

- (BOOL)removeAllEarnedInstancesWithError:(id *)a3
{
  if (-[ACHEarnedInstanceStore isUsingNewAwardingSystem](self, "isUsingNewAwardingSystem"))
    return -[ACHEarnedInstanceStore _client_removeAllEarnedInstancesWithError:](self, "_client_removeAllEarnedInstancesWithError:", a3);
  else
    return -[ACHEarnedInstanceStore _daemon_removeAllEarnedInstancesWithError:](self, "_daemon_removeAllEarnedInstancesWithError:", a3);
}

- (BOOL)_client_removeAllEarnedInstancesWithError:(id *)a3
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
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ACHEarnedInstanceStore__client_removeAllEarnedInstancesWithError___block_invoke;
  block[3] = &unk_24D13B6C0;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(v6, block);

  v7 = (id)v13[5];
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __68__ACHEarnedInstanceStore__client_removeAllEarnedInstancesWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_queue_purgeCaches");
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "removeAllEarnedInstancesWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (BOOL)_daemon_removeAllEarnedInstancesWithError:(id *)a3
{
  void *v5;

  -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[ACHEarnedInstanceStore removeEarnedInstances:error:](self, "removeEarnedInstances:error:", v5, a3);

  return (char)a3;
}

- (BOOL)loadAllEarnedInstancesFromDatabaseIfNecessary
{
  ACHEarnedInstanceStore *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ACHEarnedInstanceStore earnedInstanceQueue](v2, "earnedInstanceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__ACHEarnedInstanceStore_loadAllEarnedInstancesFromDatabaseIfNecessary__block_invoke;
  v6[3] = &unk_24D13ACE0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __71__ACHEarnedInstanceStore_loadAllEarnedInstancesFromDatabaseIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  char v3;
  void *v4;
  uint8_t v5[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "initialEarnedInstanceFetchComplete") & 1) != 0)
  {
    ACHLogDatabase();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Earn Instances store has already completed initial fetch", v5, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isUsingNewAwardingSystem");
    v4 = *(void **)(a1 + 32);
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v4, "setInitialEarnedInstanceFetchComplete:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_notifyInitialFetchComplete");
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary");
    }
  }
}

- (BOOL)_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ACHEarnedInstanceStore earnedInstanceQueue](self, "earnedInstanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACHEarnedInstanceStore entityWrapper](self, "entityWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "allEarnedInstancesWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;

  if (v6)
  {
    ACHLogDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceStore _queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary].cold.1();

  }
  else
  {
    if (v5)
      v8 = (id)objc_msgSend(v5, "mutableCopy");
    else
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = v8;
    -[ACHEarnedInstanceStore setAllEarnedInstances:](self, "setAllEarnedInstances:", v8);

    -[ACHEarnedInstanceStore setInitialEarnedInstanceFetchComplete:](self, "setInitialEarnedInstanceFetchComplete:", 1);
    +[ACHEarnedInstanceEntity setJournalEntryAppliedObserver:](ACHEarnedInstanceEntity, "setJournalEntryAppliedObserver:", self);
    ACHLogDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHEarnedInstanceStore allEarnedInstances](self, "allEarnedInstances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v16 = v12;
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Initial fetch of earned instances completed, %lu instances; notifying observers",
        buf,
        0xCu);

    }
    -[ACHEarnedInstanceStore _notifyInitialFetchComplete](self, "_notifyInitialFetchComplete");
  }

  return v6 == 0;
}

- (void)_notifyInitialFetchComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__ACHEarnedInstanceStore__notifyInitialFetchComplete__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v3, block);

}

void __53__ACHEarnedInstanceStore__notifyInitialFetchComplete__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "earnedInstanceStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfAddedEarnedInstances:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__ACHEarnedInstanceStore__notifyObserversOfAddedEarnedInstances___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__ACHEarnedInstanceStore__notifyObserversOfAddedEarnedInstances___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "earnedInstanceStore:didAddNewEarnedInstances:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfSync
{
  NSObject *v3;
  _QWORD block[5];

  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ACHEarnedInstanceStore__notifyObserversOfSync__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__ACHEarnedInstanceStore__notifyObserversOfSync__block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "earnedInstanceStoreDidReceiveSyncNotification:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfRemovedEarnedInstances:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__ACHEarnedInstanceStore__notifyObserversOfRemovedEarnedInstances___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__ACHEarnedInstanceStore__notifyObserversOfRemovedEarnedInstances___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "earnedInstanceStore:didRemoveEarnedInstances:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ACHEarnedInstanceStore_addObserver___block_invoke;
  block[3] = &unk_24D13A360;
  block[4] = self;
  v7 = v4;
  v9 = v7;
  dispatch_sync(v6, block);

  if (-[ACHEarnedInstanceStore initialEarnedInstanceFetchComplete](self, "initialEarnedInstanceFetchComplete")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "earnedInstanceStoreDidFinishInitialFetch:", self);
  }

}

void __38__ACHEarnedInstanceStore_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ACHEarnedInstanceStore observerQueue](self, "observerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ACHEarnedInstanceStore_removeObserver___block_invoke;
  block[3] = &unk_24D13A360;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __41__ACHEarnedInstanceStore_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isUsingNewAwardingSystem
{
  return self->_isUsingNewAwardingSystem;
}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
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

- (ACHEarnedInstanceEntityWrapper)entityWrapper
{
  return self->_entityWrapper;
}

- (void)setEntityWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_entityWrapper, a3);
}

- (ACHEarnedInstanceDuplicateUtility)duplicateUtility
{
  return self->_duplicateUtility;
}

- (void)setDuplicateUtility:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateUtility, a3);
}

- (OS_dispatch_queue)earnedInstanceQueue
{
  return self->_earnedInstanceQueue;
}

- (void)setEarnedInstanceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceQueue, a3);
}

- (NSMutableArray)allEarnedInstances
{
  return self->_allEarnedInstances;
}

- (void)setAllEarnedInstances:(id)a3
{
  objc_storeStrong((id *)&self->_allEarnedInstances, a3);
}

- (BOOL)initialEarnedInstanceFetchComplete
{
  return self->_initialEarnedInstanceFetchComplete;
}

- (void)setInitialEarnedInstanceFetchComplete:(BOOL)a3
{
  self->_initialEarnedInstanceFetchComplete = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (unsigned)device
{
  return self->_device;
}

- (void)setDevice:(unsigned __int8)a3
{
  self->_device = a3;
}

- (int)syncedEarnedInstancesToken
{
  return self->_syncedEarnedInstancesToken;
}

- (void)setSyncedEarnedInstancesToken:(int)a3
{
  self->_syncedEarnedInstancesToken = a3;
}

- (BOOL)needsUpdateWhenProtectedDataAvailable
{
  return self->_needsUpdateWhenProtectedDataAvailable;
}

- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsUpdateWhenProtectedDataAvailable = a3;
}

- (NSCache)earnedInstancesForTemplateUniqueNameCache
{
  return self->_earnedInstancesForTemplateUniqueNameCache;
}

- (void)setEarnedInstancesForTemplateUniqueNameCache:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstancesForTemplateUniqueNameCache, a3);
}

- (NSCache)earnedInstancesForEarnedDateComponentsCache
{
  return self->_earnedInstancesForEarnedDateComponentsCache;
}

- (void)setEarnedInstancesForEarnedDateComponentsCache:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstancesForEarnedDateComponentsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earnedInstancesForEarnedDateComponentsCache, 0);
  objc_storeStrong((id *)&self->_earnedInstancesForTemplateUniqueNameCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_allEarnedInstances, 0);
  objc_storeStrong((id *)&self->_earnedInstanceQueue, 0);
  objc_storeStrong((id *)&self->_duplicateUtility, 0);
  objc_storeStrong((id *)&self->_entityWrapper, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __89__ACHEarnedInstanceStore_earnedInstanceEntityDidReceiveSyncedEarnedInstances_provenance___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Failed to insert earned instances from sync with error: %{public}@, earned instances: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_client_earnedInstances
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error fetching earned instances: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_client_earnedInstancesForTemplateUniqueName:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error fetching earned instances for unique name %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)earnedInstancesForEarnedDateComponents:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error fetching earned instances for earned date components %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)mostRecentEarnedInstanceForTemplateUniqueName:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error fetching most recent earned instance for unique name %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)mostRecentEarnedInstancesForTemplateUniqueNames:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error fetching most recent earned instances for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)countOfEarnedInstancesForTemplateUniqueName:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error counting earned instances for unique name %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)countOfEarnedInstancesForTemplateUniqueNames:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error counting earned instances for unique names %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Unable to invalidate assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_addEarnedInstances:provenance:databaseContext:triggerSync:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Unable to acquire DB assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_208_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error triggering sync for earned instances: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceStore__queue_addEarnedInstances_provenance_databaseContext_triggerSync_error___block_invoke_208_cold_2(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "Triggered sync for earned instances, success: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_client_addEarnedInstancesWithSingleTemplate:provenance:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error looking up existing earned instances for (%@): %@");
  OUTLINED_FUNCTION_1();
}

- (void)_queue_client_removeEarnedInstances:(NSObject *)a3 error:.cold.1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_21407B000, a2, a3, "Failed to remove earned instances with error %{public}@, earned instances: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_daemon_removeEarnedInstances:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Failed to remove earned instances with error %{public}@, earned instances: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_queue_daemon_loadAllEarnedInstancesFromDatabaseIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Initial fetch of earned instances failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
