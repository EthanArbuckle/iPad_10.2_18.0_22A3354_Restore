@implementation BBLocalDataProviderStore

+ (id)localDataProviderStoreWithDelegate:(id)a3 dataProviderQueue:(id)a4
{
  id v5;
  id v6;
  BBLocalDataProviderStore *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BBLocalDataProviderStore initWithDelegate:dataProviderQueue:]([BBLocalDataProviderStore alloc], "initWithDelegate:dataProviderQueue:", v6, v5);

  return v7;
}

- (BBLocalDataProviderStore)initWithDelegate:(id)a3 dataProviderQueue:(id)a4
{
  id v7;
  id v8;
  BBLocalDataProviderStore *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v13;
  NSMutableDictionary *dataProvidersBySectionID;
  NSMutableDictionary *v15;
  NSMutableDictionary *dataProvidersByUniversalSectionID;
  NSMutableArray *v17;
  NSMutableArray *localFactories;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BBLocalDataProviderStore;
  v9 = -[BBLocalDataProviderStore init](&v20, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderStore", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_serverQueue, a4);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProvidersBySectionID = v9->_dataProvidersBySectionID;
    v9->_dataProvidersBySectionID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProvidersByUniversalSectionID = v9->_dataProvidersByUniversalSectionID;
    v9->_dataProvidersByUniversalSectionID = v15;

    objc_storeStrong((id *)&v9->_delegate, a3);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    localFactories = v9->_localFactories;
    v9->_localFactories = v17;

  }
  return v9;
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  unint64_t v18;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C5686F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("    "));
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%@: %p>"), v5, v9, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BBLocalDataProviderStore_debugDescriptionWithChildren___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v12 = v10;
  v17 = v12;
  v18 = a3;
  dispatch_sync(queue, block);
  v13 = v17;
  v14 = v12;

  return v14;
}

void __57__BBLocalDataProviderStore_debugDescriptionWithChildren___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 32);
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
        objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)a1[5];
        objc_msgSend(v7, "debugDescriptionWithChildren:", a1[6] + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("\n%@"), v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[BBLocalDataProviderStore debugDescriptionWithChildren:](self, "debugDescriptionWithChildren:", 0);
}

- (void)loadAllDataProvidersAndPerformMigration:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v23 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  BBLibraryDirectoriesForFolderNamed(CFSTR("BulletinBoardPlugins"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v21 = v3;
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v3);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v25;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v25 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
              v12 = (void *)MEMORY[0x212B94804]();
              objc_msgSend(v11, "pathExtension");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("bundle"));

              if (!v14)
              {
                v15 = (void *)MEMORY[0x24BDD1488];
                objc_msgSend(v4, "stringByAppendingPathComponent:", v11);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "bundleWithPath:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17 && BBHasRequiredCapabilitiesForBundle(v17))
                  -[BBLocalDataProviderStore _loadDataProviderPluginBundle:performMigration:](self, "_loadDataProviderPluginBundle:performMigration:", v17, v23);

              }
              objc_autoreleasePoolPop(v12);
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v8);
        }

        v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v20);
  }

}

- (void)_loadDataProviderPluginBundle:(id)a3 performMigration:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSString *v15;
  Class v16;
  Class v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26 = 0;
  v6 = objc_msgSend(v5, "loadAndReturnError:", &v26);
  v7 = v26;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("BBDataProviderClasses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v9, "count"))
        {
          v20 = v9;
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(NSString **)(*((_QWORD *)&v22 + 1) + 8 * i);
                v16 = NSClassFromString(v15);
                if (v16
                  && (v17 = v16,
                      -[objc_class conformsToProtocol:](v16, "conformsToProtocol:", &unk_2549A9EC8)))
                {
                  -[BBLocalDataProviderStore _addDataProviderClass:performMigration:](self, "_addDataProviderClass:performMigration:", v17, v4);
                }
                else
                {
                  NSLog(CFSTR("No conforming class %@ in %@"), v15, v5);
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
            }
            while (v12);
          }

          v9 = v20;
          goto LABEL_24;
        }
      }
    }
    v18 = (void *)objc_msgSend(v5, "principalClass");
    if (v18)
    {
      v19 = v18;
      if (objc_msgSend(v18, "conformsToProtocol:", &unk_2549A9EC8))
      {
        -[BBLocalDataProviderStore _addDataProviderClass:performMigration:](self, "_addDataProviderClass:performMigration:", v19, v4);
LABEL_24:

        goto LABEL_25;
      }
      if (objc_msgSend(v19, "conformsToProtocol:", &unk_2549A9F28))
      {
        -[BBLocalDataProviderStore _addLocalDataProviderFactoryOfClass:](self, "_addLocalDataProviderFactoryOfClass:", v19);
        goto LABEL_24;
      }
    }
    NSLog(CFSTR("No conforming principal class found in %@"), v5);
    goto LABEL_24;
  }
  NSLog(CFSTR("Unable to load plugin bundle %@: %@"), v5, v7);
LABEL_25:

}

- (void)_queue_addDataProvider:(id)a3 performMigration:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  BBDataProviderStoreDelegate *delegate;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  BBLocalDataProviderStore *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_dataProvidersBySectionID, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
    {
      v9 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v17 = self;
        v18 = 2114;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v6;
        _os_log_error_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_ERROR, "%{public}@ was asked to add a second data provider for section %{public}@. Please file a SpringBoard bug.\n\tOld: %@\n\tNew: %@", buf, 0x2Au);
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataProvidersBySectionID, "setObject:forKeyedSubscript:", v6, v7);
    objc_msgSend(v6, "universalSectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary objectForKey:](self->_dataProvidersByUniversalSectionID, "objectForKey:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v11, "addObject:", v6);
      -[NSMutableDictionary setObject:forKey:](self->_dataProvidersByUniversalSectionID, "setObject:forKey:", v11, v10);

    }
    NSLog(CFSTR("ADDING LOCAL %@, %@"), v7, v6);
    delegate = self->_delegate;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__BBLocalDataProviderStore__queue_addDataProvider_performMigration___block_invoke;
    v14[3] = &unk_24C562E28;
    v15 = v6;
    -[BBDataProviderStoreDelegate dataProviderStore:didAddDataProvider:performMigration:completion:](delegate, "dataProviderStore:didAddDataProvider:performMigration:completion:", self, v15, v4, v14);

  }
  else
  {
    v13 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      -[BBLocalDataProviderStore _queue_addDataProvider:performMigration:].cold.1(v13);
  }

}

uint64_t __68__BBLocalDataProviderStore__queue_addDataProvider_performMigration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataProviderDidLoad");
}

- (void)_addDataProviderClass:(Class)a3 performMigration:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__BBLocalDataProviderStore__addDataProviderClass_performMigration___block_invoke;
  block[3] = &unk_24C5647B8;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

void __67__BBLocalDataProviderStore__addDataProviderClass_performMigration___block_invoke(uint64_t a1)
{
  id v2;

  +[BBLocalDataProvider dataProviderWithPrincipalClass:serverQueue:initializationCompletion:](BBLocalDataProvider, "dataProviderWithPrincipalClass:serverQueue:initializationCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_addDataProvider:performMigration:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (id)dataProviderForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__BBLocalDataProviderStore_dataProviderForSectionID___block_invoke;
  block[3] = &unk_24C5631B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__BBLocalDataProviderStore_dataProviderForSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dataProvidersForUniversalSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BBLocalDataProviderStore_dataProvidersForUniversalSectionID___block_invoke;
  block[3] = &unk_24C5631B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__BBLocalDataProviderStore_dataProvidersForUniversalSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_queue_removeDataProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_dataProvidersBySectionID, "removeObjectForKey:", v5);
    objc_msgSend(v4, "universalSectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](self->_dataProvidersByUniversalSectionID, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v4);
      if (!objc_msgSend(v7, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_dataProvidersByUniversalSectionID, "removeObjectForKey:", v6);

    }
    -[BBDataProviderStoreDelegate dataProviderStore:didRemoveDataProvider:](self->_delegate, "dataProviderStore:didRemoveDataProvider:", self, v4);

  }
  else
  {
    v8 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      -[BBLocalDataProviderStore _queue_removeDataProvider:].cold.1(v8);
  }

}

- (void)removeDataProvider:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__BBLocalDataProviderStore_removeDataProvider___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __47__BBLocalDataProviderStore_removeDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProvider:", *(_QWORD *)(a1 + 40));
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProviderStore.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BBLocalDataProviderStore_performBlockOnDataProviders___block_invoke;
  block[3] = &unk_24C563518;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

void __56__BBLocalDataProviderStore_performBlockOnDataProviders___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v2;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)_addLocalDataProviderFactoryOfClass:(Class)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__BBLocalDataProviderStore__addLocalDataProviderFactoryOfClass___block_invoke;
  v4[3] = &unk_24C5647E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __64__BBLocalDataProviderStore__addLocalDataProviderFactoryOfClass___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(*(Class *)(a1 + 40));
  objc_msgSend(v2, "setFactoryStore:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v2);

}

- (void)addDataProvider:(id)a3 performMigration:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  BBLocalDataProviderStore *v11;
  BOOL v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__BBLocalDataProviderStore_addDataProvider_performMigration___block_invoke;
  block[3] = &unk_24C5632F8;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __61__BBLocalDataProviderStore_addDataProvider_performMigration___block_invoke(uint64_t a1)
{
  id v2;

  +[BBLocalDataProvider dataProviderWithDataProvider:serverQueue:](BBLocalDataProvider, "dataProviderWithDataProvider:serverQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_addDataProvider:performMigration:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)removeDataProviderWithSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__BBLocalDataProviderStore_removeDataProviderWithSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __60__BBLocalDataProviderStore_removeDataProviderWithSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProvider:", v2);

}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5
{
  -[BBLocalDataProviderStore addParentSectionInfo:displayName:icon:universalSectionID:](self, "addParentSectionInfo:displayName:icon:universalSectionID:", a3, a4, a5, 0);
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 universalSectionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v13, "setDisplayName:", v12);

  objc_msgSend(v13, "setIcon:", v11);
  +[BBParentSectionDataProviderFactory factoryFromSectionInfo:](BBParentSectionDataProviderFactory, "factoryFromSectionInfo:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUniversalSectionIdentifier:", v10);

  v15 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v18;
    v22 = 2114;
    v23 = v19;
    _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ adding parent section factory for section %{public}@", (uint8_t *)&v20, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BBDataProviderStoreDelegate dataProviderStore:didAddParentSectionFactory:](self->_delegate, "dataProviderStore:didAddParentSectionFactory:", self, v14);

}

- (NSMutableDictionary)dataProvidersBySectionID
{
  return self->_dataProvidersBySectionID;
}

- (void)setDataProvidersBySectionID:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, a3);
}

- (NSMutableDictionary)dataProvidersByUniversalSectionID
{
  return self->_dataProvidersByUniversalSectionID;
}

- (void)setDataProvidersByUniversalSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvidersByUniversalSectionID, a3);
}

- (NSMutableArray)localFactories
{
  return self->_localFactories;
}

- (void)setLocalFactories:(id)a3
{
  objc_storeStrong((id *)&self->_localFactories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFactories, 0);
  objc_storeStrong((id *)&self->_dataProvidersByUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)_queue_addDataProvider:(void *)a1 performMigration:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_1(v3);
  OUTLINED_FUNCTION_1_0(&dword_20CCB9000, v5, v6, "%{public}@: Data provider %{public}@ specified no sectionID. Ignoring.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_removeDataProvider:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_1(v3);
  OUTLINED_FUNCTION_1_0(&dword_20CCB9000, v5, v6, "%{public}@ Asked to remove a data provider (%{public}@) without a sectionID. Ignoring.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
