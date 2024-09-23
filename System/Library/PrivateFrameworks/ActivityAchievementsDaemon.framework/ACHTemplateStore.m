@implementation ACHTemplateStore

- (ACHTemplateStore)initWithClient:(id)a3 assertionClient:(id)a4 device:(unsigned __int8)a5
{
  id v9;
  id v10;
  ACHTemplateStore *v11;
  ACHTemplateStore *v12;
  NSMutableSet *v13;
  NSMutableSet *templates;
  NSMutableDictionary *v15;
  NSMutableDictionary *templatesByUniqueName;
  NSMutableDictionary *v17;
  NSMutableDictionary *templatesByKey;
  NSMutableDictionary *v19;
  NSMutableDictionary *templatesBySource;
  NSDictionary *templatesReadyToAdd;
  uint64_t v22;
  NSHashTable *observers;
  uint64_t v24;
  OS_dispatch_queue *notificationQueue;
  uint64_t v26;
  OS_dispatch_queue *synchronizationQueue;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  _QWORD v34[4];
  id v35;
  _QWORD handler[4];
  id v37;
  id location;
  objc_super v39;

  v9 = a3;
  v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)ACHTemplateStore;
  v11 = -[ACHTemplateStore init](&v39, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_client, a3);
    objc_storeStrong((id *)&v12->_databaseAssertionClient, a4);
    v12->_device = a5;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    templates = v12->_templates;
    v12->_templates = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templatesByUniqueName = v12->_templatesByUniqueName;
    v12->_templatesByUniqueName = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templatesByKey = v12->_templatesByKey;
    v12->_templatesByKey = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templatesBySource = v12->_templatesBySource;
    v12->_templatesBySource = v19;

    templatesReadyToAdd = v12->_templatesReadyToAdd;
    v12->_templatesReadyToAdd = (NSDictionary *)MEMORY[0x24BDBD1B8];

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v22;

    HKCreateSerialDispatchQueue();
    v24 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v12->_notificationQueue;
    v12->_notificationQueue = (OS_dispatch_queue *)v24;

    HKCreateSerialDispatchQueue();
    v26 = objc_claimAutoreleasedReturnValue();
    synchronizationQueue = v12->_synchronizationQueue;
    v12->_synchronizationQueue = (OS_dispatch_queue *)v26;

    objc_initWeak(&location, v12);
    v28 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
    v29 = v12->_synchronizationQueue;
    v30 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke;
    handler[3] = &unk_24D13A2C0;
    objc_copyWeak(&v37, &location);
    notify_register_dispatch(v28, &v12->_protectedDataToken, v29, handler);
    v31 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01288], "UTF8String");
    v32 = v12->_synchronizationQueue;
    v34[0] = v30;
    v34[1] = 3221225472;
    v34[2] = __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke_192;
    v34[3] = &unk_24D13A2C0;
    objc_copyWeak(&v35, &location);
    notify_register_dispatch(v31, &v12->_syncedTemplatesToken, v32, v34);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");

  ACHLogTemplates();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template store detected received notification of a change in protected data availability: %d", (uint8_t *)v8, 8u);
  }

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "_queue_protectedDataAvailabilityChanged:", v4);

  if ((_DWORD)v4)
  {
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "_queue_client_loadAllTemplatesFromDatabaseIfNecessary");

  }
}

void __58__ACHTemplateStore_initWithClient_assertionClient_device___block_invoke_192(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_client_updateTemplatesFromDatabase");

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  if (notify_is_valid_token(self->_syncedTemplatesToken))
    notify_cancel(self->_syncedTemplatesToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHTemplateStore;
  -[ACHTemplateStore dealloc](&v3, sel_dealloc);
}

- (ACHTemplateStore)initWithProfile:(id)a3 entityWrapper:(id)a4 device:(unsigned __int8)a5
{
  id v8;
  id v9;
  ACHTemplateStore *v10;
  ACHTemplateStore *v11;
  NSMutableSet *v12;
  NSMutableSet *templates;
  NSMutableDictionary *v14;
  NSMutableDictionary *templatesByUniqueName;
  NSMutableDictionary *v16;
  NSMutableDictionary *templatesByKey;
  NSDictionary *templatesReadyToAdd;
  uint64_t v19;
  NSHashTable *observers;
  uint64_t v21;
  OS_dispatch_queue *notificationQueue;
  uint64_t v23;
  OS_dispatch_queue *synchronizationQueue;
  id WeakRetained;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ACHTemplateStore;
  v10 = -[ACHTemplateStore init](&v28, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_profile, v8);
    objc_storeStrong((id *)&v11->_entityWrapper, a4);
    -[ACHTemplateEntityWrapper setSyncedTemplatesObserver:](v11->_entityWrapper, "setSyncedTemplatesObserver:", v11);
    v11->_device = a5;
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    templates = v11->_templates;
    v11->_templates = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templatesByUniqueName = v11->_templatesByUniqueName;
    v11->_templatesByUniqueName = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templatesByKey = v11->_templatesByKey;
    v11->_templatesByKey = v16;

    templatesReadyToAdd = v11->_templatesReadyToAdd;
    v11->_templatesReadyToAdd = (NSDictionary *)MEMORY[0x24BDBD1B8];

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v19 = objc_claimAutoreleasedReturnValue();
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v19;

    HKCreateSerialDispatchQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v11->_notificationQueue;
    v11->_notificationQueue = (OS_dispatch_queue *)v21;

    HKCreateSerialDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    synchronizationQueue = v11->_synchronizationQueue;
    v11->_synchronizationQueue = (OS_dispatch_queue *)v23;

    WeakRetained = objc_loadWeakRetained((id *)&v11->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerForDaemonReady:", v11);

  }
  return v11;
}

- (void)daemonReady:(id)a3
{
  void *v4;
  id v5;

  -[ACHTemplateStore profile](self, "profile", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProtectedDataObserver:", self);

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  char v9;

  v4 = a4;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (v4)
  {
    -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __61__ACHTemplateStore_database_protectedDataDidBecomeAvailable___block_invoke;
    v8[3] = &unk_24D13ABF0;
    v8[4] = self;
    v9 = 1;
    dispatch_sync(v7, v8);

  }
}

uint64_t __61__ACHTemplateStore_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_protectedDataAvailabilityChanged:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_protectedDataAvailabilityChanged:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[ACHTemplateStore needsUpdateWhenProtectedDataAvailable](self, "needsUpdateWhenProtectedDataAvailable", a3))
    -[ACHTemplateStore _queue_client_updateTemplatesFromDatabase](self, "_queue_client_updateTemplatesFromDatabase");
  -[ACHTemplateStore templatesReadyToAdd](self, "templatesReadyToAdd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[ACHTemplateStore setTemplatesReadyToAdd:](self, "setTemplatesReadyToAdd:", MEMORY[0x24BDBD1B8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138543362;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "longLongValue");
        v18 = 0;
        -[ACHTemplateStore _queue_addTemplates:provenance:databaseContext:triggerSync:error:](self, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v13, v14, 0, 1, &v18);
        v15 = v18;
        if (v15)
        {
          ACHLogTemplates();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = v15;
            _os_log_error_impl(&dword_21407B000, v16, OS_LOG_TYPE_ERROR, "Error adding templates: %{public}@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

}

- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke;
  block[3] = &unk_24D13AC18;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v6 = 0;
  objc_msgSend(v2, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v1, v3, 0, 0, &v6);
  v4 = v6;
  if (v4)
  {
    ACHLogTemplates();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke_cold_1();

  }
}

- (NSArray)allTemplates
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

  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__ACHTemplateStore_allTemplates__block_invoke;
  v7[3] = &unk_24D13AC40;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __32__ACHTemplateStore_allTemplates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "templates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ACHSortedTemplates();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)templateForUniqueName:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ACHTemplateStore_templateForUniqueName___block_invoke;
  block[3] = &unk_24D13AC68;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __42__ACHTemplateStore_templateForUniqueName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "templatesByUniqueName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_templatesWithUniqueNames:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v13;
  ACHTemplateStore *v14;
  id v15;

  v4 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ACHTemplateStore__templatesWithUniqueNames___block_invoke;
  block[3] = &unk_24D13A700;
  v13 = v4;
  v14 = self;
  v15 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_sync(v7, block);

  v10 = (void *)objc_msgSend(v8, "copy");
  return v10;
}

void __46__ACHTemplateStore__templatesWithUniqueNames___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(a1[5], "templatesByUniqueName", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(a1[6], "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)templateForTemplateKey:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ACHTemplateStore_templateForTemplateKey___block_invoke;
  block[3] = &unk_24D13AC90;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  dispatch_sync(v6, block);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __43__ACHTemplateStore_templateForTemplateKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "templatesByKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)templatesForSource:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ACHTemplateStore_templatesForSource___block_invoke;
  block[3] = &unk_24D13AC68;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __39__ACHTemplateStore_templatesForSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "templatesBySource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)availableTemplatesForDateComponents:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  ACHTemplateStore *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__ACHTemplateStore_availableTemplatesForDateComponents_countryCode___block_invoke;
  v13[3] = &unk_24D13ACB8;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __68__ACHTemplateStore_availableTemplatesForDateComponents_countryCode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "templates");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ACHSortedTemplates();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(v2, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)loadAllTemplatesFromDatabaseIfNecessary
{
  void *v3;

  -[ACHTemplateStore client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[ACHTemplateStore _client_loadAllTemplatesFromDatabaseIfNecessary](self, "_client_loadAllTemplatesFromDatabaseIfNecessary");
  else
    return -[ACHTemplateStore _daemon_loadAllTemplatesFromDatabaseIfNecessary](self, "_daemon_loadAllTemplatesFromDatabaseIfNecessary");
}

- (BOOL)_client_loadAllTemplatesFromDatabaseIfNecessary
{
  ACHTemplateStore *v2;
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
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__ACHTemplateStore__client_loadAllTemplatesFromDatabaseIfNecessary__block_invoke;
  v5[3] = &unk_24D13AC40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __67__ACHTemplateStore__client_loadAllTemplatesFromDatabaseIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_client_loadAllTemplatesFromDatabaseIfNecessary");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_client_loadAllTemplatesFromDatabaseIfNecessary
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[ACHTemplateStore initialFetchComplete](self, "initialFetchComplete"))
  {
    ACHLogDatabase();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Template Store has already completed initial fetch", buf, 2u);
    }
    v4 = 1;
  }
  else
  {
    -[ACHTemplateStore client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "fetchAllTemplatesWithError:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v11;

    if (objc_msgSend(v6, "count"))
      -[ACHTemplateStore _addTemplatesToLocalCollections:](self, "_addTemplatesToLocalCollections:", v6);
    v4 = v3 == 0;
    ACHLogDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v13 = (uint64_t)v3;
        _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching templates: %@", buf, 0xCu);
      }

    }
    else
    {
      if (v8)
      {
        v9 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134217984;
        v13 = v9;
        _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Initial fetch returned %lu templates, notifying observers of new templates and initial fetch complete", buf, 0xCu);
      }

      -[ACHTemplateStore setInitialFetchComplete:](self, "setInitialFetchComplete:", 1);
      -[ACHTemplateStore _notifyObserversOfInitialFetchCompletion](self, "_notifyObserversOfInitialFetchCompletion");
    }

  }
  return v4;
}

- (BOOL)_daemon_loadAllTemplatesFromDatabaseIfNecessary
{
  ACHTemplateStore *v2;
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
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke;
  v5[3] = &unk_24D13ACE0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "initialFetchComplete") & 1) != 0)
  {
    ACHLogDatabase();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Template Store has already completed initial fetch", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v3, "allTemplatesWithError:", &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;

    ACHLogDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 || !v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke_cold_1();

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(v4, "count");
        *(_DWORD *)buf = 134217984;
        v11 = v8;
        _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Initial fetch returned %lu templates, notifying observers of new templates and initial fetch complete", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setInitialFetchComplete:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_addTemplatesToLocalCollections:", v4);
      objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfInitialFetchCompletion");
    }

  }
}

- (void)_queue_client_updateTemplatesFromDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error fetching templates: %@\nWill run again when protected data becomes available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)_queue_templatesFilteredForDuplicates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BDD1758];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__ACHTemplateStore__queue_templatesFilteredForDuplicates___block_invoke;
  v8[3] = &unk_24D13AD08;
  v8[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __58__ACHTemplateStore__queue_templatesFilteredForDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "templatesByUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "version");
    v8 = v7 < objc_msgSend(v3, "version");
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_queue_orphanedTemplatesWithFetchedTemplates:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  -[ACHTemplateStore templates](self, "templates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD1758];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__ACHTemplateStore__queue_orphanedTemplatesWithFetchedTemplates___block_invoke;
  v20[3] = &unk_24D13AD08;
  v21 = v5;
  v16 = v5;
  objc_msgSend(v15, "predicateWithBlock:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

BOOL __65__ACHTemplateStore__queue_orphanedTemplatesWithFetchedTemplates___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == 0;
}

- (void)addTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ACHTemplateStore_addTemplates___block_invoke;
  block[3] = &unk_24D13A360;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __33__ACHTemplateStore_addTemplates___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  objc_msgSend(v2, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v1, 0, 0, 1, &v5);
  v3 = v5;
  if (v3)
  {
    ACHLogTemplates();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke_cold_1();

  }
}

- (BOOL)addTemplates:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ACHTemplateStore_addTemplates_databaseContext_error___block_invoke;
  block[3] = &unk_24D13AD30;
  v20 = &v28;
  block[4] = self;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v21 = &v22;
  dispatch_sync(v10, block);

  v13 = (id)v23[5];
  v14 = v13;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  v15 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __55__ACHTemplateStore_addTemplates_databaseContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "_queue_addTemplates:provenance:databaseContext:triggerSync:error:", v3, 0, v4, 1, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)_queue_addTemplates:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 triggerSync:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  ACHTemplateStore *v32;
  void *v33;
  _QWORD v34[2];

  v8 = a6;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[ACHTemplateStore _queue_templatesFilteredForDuplicates:](self, "_queue_templatesFilteredForDuplicates:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "hk_filter:", &__block_literal_global_5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_203;
    v30[3] = &unk_24D13AD98;
    v18 = v17;
    v31 = v18;
    v32 = self;
    objc_msgSend(v16, "hk_map:", v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplateStore client](self, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (-[ACHTemplateStore _queue_client_addTemplatesToDatabase:error:](self, "_queue_client_addTemplatesToDatabase:error:", v19, a7))
      {
LABEL_4:
        -[ACHTemplateStore _addTemplatesToLocalCollections:](self, "_addTemplatesToLocalCollections:", v19);
        -[ACHTemplateStore _notifyObserversOfNewTemplates:](self, "_notifyObserversOfNewTemplates:", v19);
        if (v8)
        {
          -[ACHTemplateStore client](self, "client");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            -[ACHTemplateStore client](self, "client");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "triggerSyncWithCompletion:", &__block_literal_global_208);
          }
          else
          {
            -[ACHTemplateStore profile](self, "profile");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "nanoSyncManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("ActivityAchievements Templates added"), 0);

          }
        }
        v23 = 1;
        goto LABEL_13;
      }
    }
    else if (-[ACHTemplateStore _queue_daemon_addTemplatesToDatabase:provenance:databaseContext:error:](self, "_queue_daemon_addTemplatesToDatabase:provenance:databaseContext:error:", v19, a4, v12, a7))
    {
      goto LABEL_4;
    }
    -[ACHTemplateStore templatesReadyToAdd](self, "templatesReadyToAdd");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v25;
    v34[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hk_dictionaryByAddingEntriesFromDictionary:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplateStore setTemplatesReadyToAdd:](self, "setTemplatesReadyToAdd:", v27);

    v23 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v23 = 1;
LABEL_14:

  return v23;
}

uint64_t __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "minimumEngineVersion") < 0xE)
  {
    v4 = objc_msgSend(v2, "_isValid");
  }
  else
  {
    ACHLogTemplates();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_cold_1(v2, v3);

    v4 = 0;
  }

  return v4;
}

id __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_203(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v3, "setCreatedDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setCreatorDevice:", objc_msgSend(*(id *)(a1 + 40), "device"));
  return v3;
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  ACHLogSync();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_2(a2, v5, v6);

  if (v4)
  {
    ACHLogSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_1();

  }
}

- (BOOL)_queue_client_addTemplatesToDatabase:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  _QWORD v37[3];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[ACHTemplateStore databaseAssertionClient](self, "databaseAssertionClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v7, "acquireDatabaseAssertionWithIdentifier:error:", CFSTR("ACHTemplateStore"), &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;

  if (!v8)
  {
    ACHLogTemplates();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37[0] = v9;
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "BEWARE: Unable to acquire a database assertion. The following operation may fail. %@", buf, 0xCu);
    }

  }
  v28 = v9;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
        -[ACHTemplateStore templatesByUniqueName](self, "templatesByUniqueName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uniqueName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v11, "addObject:", v20);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v14);
  }

  -[ACHTemplateStore client](self, "client");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "addTemplates:removingTemplates:error:", v12, v11, a4);

  if (v8)
  {
    -[ACHTemplateStore databaseAssertionClient](self, "databaseAssertionClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v24 = objc_msgSend(v23, "invalidateAssertionWithToken:error:", v8, &v30);
    v25 = v30;

    ACHLogTemplates();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v37[0]) = v24;
      WORD2(v37[0]) = 2112;
      *(_QWORD *)((char *)v37 + 6) = v25;
      _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Invalidated assertion with success %d; error: %@",
        buf,
        0x12u);
    }

  }
  else
  {
    v25 = v28;
  }

  return v22;
}

- (BOOL)_queue_daemon_addTemplatesToDatabase:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  _QWORD v31[4];
  id v32;
  ACHTemplateStore *v33;
  id v34;
  int64_t v35;
  _QWORD v36[4];
  id v37;
  ACHTemplateStore *v38;
  id v39;
  id v40;
  int64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v16);
        -[ACHTemplateStore templatesByUniqueName](self, "templatesByUniqueName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uniqueName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v11, "addObject:", v20);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v14);
  }

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWritingProtectedData");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[ACHTemplateStore profile](self, "profile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v9, "copyForWritingProtectedData");
  v24 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke;
  v36[3] = &unk_24D13ADE0;
  v37 = v11;
  v38 = self;
  v40 = v9;
  v41 = a4;
  v39 = v12;
  v31[0] = v24;
  v31[1] = 3221225472;
  v31[2] = __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_218;
  v31[3] = &unk_24D13AE08;
  v32 = v37;
  v33 = self;
  v34 = v39;
  v35 = a4;
  v25 = v39;
  v26 = v37;
  v27 = v9;
  LOBYTE(v24) = objc_msgSend(v22, "performTransactionWithContext:error:block:inaccessibilityHandler:", v23, a6, v36, v31);

  return v24;
}

uint64_t __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && (objc_msgSend(*(id *)(a1 + 40), "entityWrapper"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "removeTemplates:error:", *(_QWORD *)(a1 + 32), a3),
        v5,
        !v6))
  {
    ACHLogTemplates();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_cold_1(a3, v10, v11, v12, v13, v14, v15, v16);

    return 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "entityWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "insertTemplates:provenance:databaseContext:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), a3);

    return v8;
  }
}

uint64_t __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    ACHLogTemplates();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_218_cold_1(v5);

    return 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "entityWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "insertTemplates:provenance:databaseContext:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, a3);

    return v8;
  }
}

- (void)_addTemplatesToLocalCollections:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        -[ACHTemplateStore templatesByUniqueName](self, "templatesByUniqueName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v11, "minimumEngineVersion");
        v16 = v15;
        if (v14)
        {
          v17 = objc_msgSend(v11, "version");
          v18 = objc_msgSend(v14, "version");
          if (v16 > 0xD || v17 <= v18)
            goto LABEL_18;
          -[ACHTemplateStore templates](self, "templates");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObject:", v14);

          objc_msgSend(v6, "addObject:", v14);
        }
        else if (v15 >= 0xE)
        {
          goto LABEL_18;
        }
        -[ACHTemplateStore templates](self, "templates");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v11);

        -[ACHTemplateStore templatesByUniqueName](self, "templatesByUniqueName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v11, v23);

        -[ACHTemplateStore templatesByKey](self, "templatesByKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "key"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v11, v25);

        objc_msgSend(v11, "sourceName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = v6;
          -[ACHTemplateStore templatesBySource](self, "templatesBySource");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sourceName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v29);
          v30 = (id)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            -[ACHTemplateStore templatesBySource](self, "templatesBySource");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sourceName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

          }
          objc_msgSend(v30, "addObject:", v11);

          v6 = v27;
        }
LABEL_18:

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
    -[ACHTemplateStore _notifyObserversOfRemovedTemplates:](self, "_notifyObserversOfRemovedTemplates:", v6);

}

- (BOOL)removeTemplates:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
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
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__ACHTemplateStore_removeTemplates_error___block_invoke;
  v13[3] = &unk_24D13AE30;
  v13[4] = self;
  v15 = &v23;
  v8 = v6;
  v14 = v8;
  v16 = &v17;
  dispatch_sync(v7, v13);

  if (*((_BYTE *)v24 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = (id)v18[5];
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = *((_BYTE *)v24 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

void __42__ACHTemplateStore_removeTemplates_error___block_invoke(uint64_t a1)
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
    v10 = objc_msgSend(v3, "_queue_client_removeTemplatesFromDatabase:error:", v4, &v12);
  }
  else
  {
    v13 = v6;
    v9 = (id *)&v13;
    v10 = objc_msgSend(v3, "_queue_daemon_removeTemplatesFromDatabase:error:", v4, &v13);
  }
  v11 = v10;
  objc_storeStrong(v7, *v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "_removeTemplatesFromLocalCollections:", *(_QWORD *)(a1 + 40));
}

- (BOOL)removeTemplatesForSource:(id)a3 error:(id *)a4
{
  void *v6;

  -[ACHTemplateStore templatesForSource:](self, "templatesForSource:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[ACHTemplateStore removeTemplates:error:](self, "removeTemplates:error:", v6, a4);

  return (char)a4;
}

- (BOOL)removeTemplatesWithUniqueNames:(id)a3 error:(id *)a4
{
  void *v6;

  -[ACHTemplateStore _templatesWithUniqueNames:](self, "_templatesWithUniqueNames:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[ACHTemplateStore removeTemplates:error:](self, "removeTemplates:error:", v6, a4);

  return (char)a4;
}

- (BOOL)removeAllTemplates:(id *)a3
{
  void *v5;

  -[ACHTemplateStore allTemplates](self, "allTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[ACHTemplateStore removeTemplates:error:](self, "removeTemplates:error:", v5, a3);

  return (char)a3;
}

- (BOOL)_queue_client_removeTemplatesFromDatabase:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ACHTemplateStore client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "removeTemplates:error:", v6, a4);

  return (char)a4;
}

- (BOOL)_queue_daemon_removeTemplatesFromDatabase:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;

  v6 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ACHTemplateStore entityWrapper](self, "entityWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "removeTemplates:error:", v6, a4);

  if ((v9 & 1) == 0)
  {
    ACHLogDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHTemplateStore _queue_daemon_removeTemplatesFromDatabase:error:].cold.1();

  }
  return v9;
}

- (void)_removeTemplatesFromLocalCollections:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
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
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHTemplateStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[ACHTemplateStore templatesByUniqueName](self, "templatesByUniqueName", (_QWORD)v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[ACHTemplateStore templates](self, "templates");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObject:", v15);

          -[ACHTemplateStore templatesByUniqueName](self, "templatesByUniqueName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v18);

          -[ACHTemplateStore templatesByKey](self, "templatesByKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "key"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", v20);

          -[ACHTemplateStore templatesBySource](self, "templatesBySource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sourceName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "removeObject:", v15);
          objc_msgSend(v10, "arrayByAddingObject:", v15);
          v24 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v24;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  if (objc_msgSend(v10, "count"))
    -[ACHTemplateStore _notifyObserversOfRemovedTemplates:](self, "_notifyObserversOfRemovedTemplates:", v10);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateStore *v9;

  v4 = a3;
  -[ACHTemplateStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__ACHTemplateStore_addObserver___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __32__ACHTemplateStore_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v2 = a1 + 32;
  if (objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D71908))
  {
    objc_msgSend(*(id *)(a1 + 40), "observers");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v3, "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __32__ACHTemplateStore_addObserver___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  result = objc_msgSend(*(id *)(a1 + 40), "initialFetchComplete");
  if ((_DWORD)result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "templateStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHTemplateStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__ACHTemplateStore_removeObserver___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__ACHTemplateStore_removeObserver___block_invoke(uint64_t a1)
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

- (void)_notifyObserversOfInitialFetchCompletion
{
  NSObject *v3;
  _QWORD block[5];

  -[ACHTemplateStore notificationQueue](self, "notificationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ACHTemplateStore__notifyObserversOfInitialFetchCompletion__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__ACHTemplateStore__notifyObserversOfInitialFetchCompletion__block_invoke(uint64_t a1)
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
          objc_msgSend(v7, "templateStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfNewTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHTemplateStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__ACHTemplateStore__notifyObserversOfNewTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__ACHTemplateStore__notifyObserversOfNewTemplates___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "templateStore:didAddNewTemplates:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfRemovedTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHTemplateStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__ACHTemplateStore__notifyObserversOfRemovedTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__ACHTemplateStore__notifyObserversOfRemovedTemplates___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "templateStore:didRemoveTemplates:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (ACHDatabaseAssertionClient)databaseAssertionClient
{
  return self->_databaseAssertionClient;
}

- (void)setDatabaseAssertionClient:(id)a3
{
  objc_storeStrong((id *)&self->_databaseAssertionClient, a3);
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (int)syncedTemplatesToken
{
  return self->_syncedTemplatesToken;
}

- (void)setSyncedTemplatesToken:(int)a3
{
  self->_syncedTemplatesToken = a3;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHTemplateEntityWrapper)entityWrapper
{
  return self->_entityWrapper;
}

- (void)setEntityWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_entityWrapper, a3);
}

- (unsigned)device
{
  return self->_device;
}

- (void)setDevice:(unsigned __int8)a3
{
  self->_device = a3;
}

- (NSMutableSet)templates
{
  return self->_templates;
}

- (void)setTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_templates, a3);
}

- (NSMutableDictionary)templatesByUniqueName
{
  return self->_templatesByUniqueName;
}

- (void)setTemplatesByUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templatesByUniqueName, a3);
}

- (NSMutableDictionary)templatesByKey
{
  return self->_templatesByKey;
}

- (void)setTemplatesByKey:(id)a3
{
  objc_storeStrong((id *)&self->_templatesByKey, a3);
}

- (NSMutableDictionary)templatesBySource
{
  return self->_templatesBySource;
}

- (void)setTemplatesBySource:(id)a3
{
  objc_storeStrong((id *)&self->_templatesBySource, a3);
}

- (NSDictionary)templatesReadyToAdd
{
  return self->_templatesReadyToAdd;
}

- (void)setTemplatesReadyToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_templatesReadyToAdd, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void)setSynchronizationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizationQueue, a3);
}

- (BOOL)initialFetchComplete
{
  return self->_initialFetchComplete;
}

- (void)setInitialFetchComplete:(BOOL)a3
{
  self->_initialFetchComplete = a3;
}

- (BOOL)needsUpdateWhenProtectedDataAvailable
{
  return self->_needsUpdateWhenProtectedDataAvailable;
}

- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsUpdateWhenProtectedDataAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_templatesReadyToAdd, 0);
  objc_storeStrong((id *)&self->_templatesBySource, 0);
  objc_storeStrong((id *)&self->_templatesByKey, 0);
  objc_storeStrong((id *)&self->_templatesByUniqueName, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_entityWrapper, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseAssertionClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __71__ACHTemplateStore_templateEntityDidReceiveSyncedTemplates_provenance___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error adding templates: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__ACHTemplateStore__daemon_loadAllTemplatesFromDatabaseIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error fetching templates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21407B000, a2, v4, "Template minimum engine version higher than we support, not adding: %@", v5);

}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error triggering sync for templates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__ACHTemplateStore__queue_addTemplates_provenance_databaseContext_triggerSync_error___block_invoke_2_cold_2(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3_0(&dword_21407B000, a2, a3, "Triggered sync for templates, success: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error removing old template versions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_218_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "Protected data unavailable trying to replace templates", v1, 2u);
}

- (void)_queue_daemon_removeTemplatesFromDatabase:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_21407B000, v1, OS_LOG_TYPE_ERROR, "Error removing templates %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __32__ACHTemplateStore_addObserver___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Template store did not add observer %@ since it doesn't conform to the observer protocol.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
