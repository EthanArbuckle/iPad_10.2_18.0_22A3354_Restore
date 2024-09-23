@implementation EMUbiquitouslyPersistedDictionary

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EMUbiquitouslyPersistedDictionary_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_40 != -1)
    dispatch_once(&log_onceToken_40, block);
  return (OS_os_log *)(id)log_log_40;
}

void __40__EMUbiquitouslyPersistedDictionary_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_40;
  log_log_40 = (uint64_t)v1;

}

+ (id)sharedDictionaryWithIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  if (sharedDictionaryWithIdentifier__onceToken != -1)
    dispatch_once(&sharedDictionaryWithIdentifier__onceToken, &__block_literal_global_55);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  v4 = sharedDictionaryWithIdentifier__sharedDictionaryQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__EMUbiquitouslyPersistedDictionary_sharedDictionaryWithIdentifier___block_invoke_31;
  v8[3] = &unk_1E70F3660;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __68__EMUbiquitouslyPersistedDictionary_sharedDictionaryWithIdentifier___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.EMUbiquitouslyPersistedDictionary.singletons", 0);
  v1 = (void *)sharedDictionaryWithIdentifier__sharedDictionaryQueue;
  sharedDictionaryWithIdentifier__sharedDictionaryQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)sharedDictionaryWithIdentifier__sharedDictionaries;
  sharedDictionaryWithIdentifier__sharedDictionaries = (uint64_t)v2;

}

void __68__EMUbiquitouslyPersistedDictionary_sharedDictionaryWithIdentifier___block_invoke_31(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  EMUbiquitouslyPersistedDictionary *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)sharedDictionaryWithIdentifier__sharedDictionaries, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[EMUbiquitouslyPersistedDictionary initWithIdentifier:encrypted:delegate:]([EMUbiquitouslyPersistedDictionary alloc], "initWithIdentifier:encrypted:delegate:", *(_QWORD *)(a1 + 32), 0, 0);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)sharedDictionaryWithIdentifier__sharedDictionaries, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (EMUbiquitouslyPersistedDictionary)initWithIdentifier:(id)a3
{
  return -[EMUbiquitouslyPersistedDictionary initWithIdentifier:encrypted:delegate:](self, "initWithIdentifier:encrypted:delegate:", a3, 0, 0);
}

- (EMUbiquitouslyPersistedDictionary)initWithPlistPath:(id)a3 identifier:(id)a4
{
  return -[EMUbiquitouslyPersistedDictionary initWithPlistPath:identifier:encrypted:delegate:](self, "initWithPlistPath:identifier:encrypted:delegate:", a3, a4, 0, 0);
}

- (EMUbiquitouslyPersistedDictionary)initWithIdentifier:(id)a3 encrypted:(BOOL)a4 delegate:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EMUbiquitouslyPersistedDictionary *v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  +[EMPersistenceLayoutManager mailDataDirectory](EMPersistenceLayoutManager, "mailDataDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@.plist"), v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[EMUbiquitouslyPersistedDictionary initWithPlistPath:identifier:encrypted:delegate:](self, "initWithPlistPath:identifier:encrypted:delegate:", v16, v8, v6, v9);
  return v17;
}

- (EMUbiquitouslyPersistedDictionary)initWithPlistPath:(id)a3 identifier:(id)a4 encrypted:(BOOL)a5 delegate:(id)a6
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  EMUbiquitouslyPersistedDictionary *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSUbiquitousKeyValueStore *kvStore;
  dispatch_queue_t v20;
  OS_dispatch_queue *mutationQueue;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  EFScheduler *delegateScheduler;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *storedObjects;
  NSMutableDictionary *v33;
  void *v34;
  objc_super v36;

  v7 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)EMUbiquitouslyPersistedDictionary;
  v15 = -[EMUbiquitouslyPersistedDictionary init](&v36, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "initWithStoreIdentifier:type:", v15->_identifier, v7);
    kvStore = v15->_kvStore;
    v15->_kvStore = (NSUbiquitousKeyValueStore *)v18;

    objc_storeStrong((id *)&v15->_plistPath, a3);
    objc_storeWeak((id *)&v15->_delegate, v14);
    v20 = dispatch_queue_create(-[NSString UTF8String](v15->_identifier, "UTF8String"), 0);
    mutationQueue = v15->_mutationQueue;
    v15->_mutationQueue = (OS_dispatch_queue *)v20;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v15->_plistPath);
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("version"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", &unk_1E711F560);

      if ((v25 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("EMUbiquitouslyPersistedDictionary.m"), 104, CFSTR("Unsupported version"));

      }
    }
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EMUbiquitouslyPersistedDictionary.delegateScheduler"), 17);
    v27 = objc_claimAutoreleasedReturnValue();
    delegateScheduler = v15->_delegateScheduler;
    v15->_delegateScheduler = (EFScheduler *)v27;

    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("data"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("data"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "mutableCopy");
      storedObjects = v15->_storedObjects;
      v15->_storedObjects = (NSMutableDictionary *)v31;

    }
    else
    {
      v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v30 = v15->_storedObjects;
      v15->_storedObjects = v33;
    }

    -[EMUbiquitouslyPersistedDictionary _mergeKVStoreChangedKeys:](v15, "_mergeKVStoreChangedKeys:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v15, sel__storeChangedExternally_, *MEMORY[0x1E0CB3368], v15->_kvStore);

  }
  return v15;
}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  -[EMUbiquitouslyPersistedDictionary mutationQueue](self, "mutationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__EMUbiquitouslyPersistedDictionary_count__block_invoke;
  v6[3] = &unk_1E70F3660;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __42__EMUbiquitouslyPersistedDictionary_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)objectForKey:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMUbiquitouslyPersistedDictionary.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[key isKindOfClass:[NSString class]]"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = 0;
  -[EMUbiquitouslyPersistedDictionary mutationQueue](self, "mutationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EMUbiquitouslyPersistedDictionary_objectForKey___block_invoke;
  block[3] = &unk_1E70F6330;
  v12 = v5;
  v13 = &v14;
  block[4] = self;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __50__EMUbiquitouslyPersistedDictionary_objectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("value"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)objectForKeyedSubscript:(id)a3
{
  -[EMUbiquitouslyPersistedDictionary objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v19;
  EMUbiquitouslyPersistedDictionary *v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMUbiquitouslyPersistedDictionary.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(id)key isKindOfClass:[NSString class]]"));

  }
  v9 = v8;
  if (!objc_msgSend(v9, "length")
    || (v10 = objc_msgSend(v9, "length"),
        -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "maximumKeyLength"),
        v11,
        v10 > v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMUbiquitouslyPersistedDictionary.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyString.length > 0 && keyString.length <= self.kvStore.maximumKeyLength"));

  }
  -[EMUbiquitouslyPersistedDictionary mutationQueue](self, "mutationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EMUbiquitouslyPersistedDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_1E70F3768;
  v19 = v7;
  v20 = self;
  v15 = v9;
  v21 = v15;
  v22 = v15;
  v16 = v7;
  dispatch_async(v14, block);

}

void __54__EMUbiquitouslyPersistedDictionary_setObject_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_dateWithTruncatedSeconds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  v6 = *(_QWORD *)(a1 + 32);
  v11[0] = CFSTR("value");
  v11[1] = CFSTR("updatedAt");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "storedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "kvStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "_synchronize");
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    -[EMUbiquitouslyPersistedDictionary setObject:forKey:](self, "setObject:forKey:", v7, v6);
  else
    -[EMUbiquitouslyPersistedDictionary removeObjectForKey:](self, "removeObjectForKey:", v6);

}

- (void)removeObjectForKey:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMUbiquitouslyPersistedDictionary.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(id)key isKindOfClass:[NSString class]]"));

  }
  v6 = v5;
  if (!objc_msgSend(v6, "length")
    || (v7 = objc_msgSend(v6, "length"),
        -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "maximumKeyLength"),
        v8,
        v7 > v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMUbiquitouslyPersistedDictionary.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyString.length > 0 && keyString.length <= self.kvStore.maximumKeyLength"));

  }
  -[EMUbiquitouslyPersistedDictionary mutationQueue](self, "mutationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EMUbiquitouslyPersistedDictionary_removeObjectForKey___block_invoke;
  block[3] = &unk_1E70F2158;
  block[4] = self;
  v15 = v6;
  v16 = v6;
  v12 = v6;
  dispatch_async(v11, block);

}

uint64_t __56__EMUbiquitouslyPersistedDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "kvStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "_synchronize");
}

- (void)removeAllObjects
{
  NSObject *v3;
  _QWORD block[5];

  -[EMUbiquitouslyPersistedDictionary mutationQueue](self, "mutationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__EMUbiquitouslyPersistedDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_1E70F1FA0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __53__EMUbiquitouslyPersistedDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "plistPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_resetKVStore");
}

- (void)_writeToPlist
{
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("version");
  v5[1] = CFSTR("data");
  v6[0] = &unk_1E711F560;
  -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "writeToFile:atomically:", self->_plistPath, 1);
}

- (void)_ensureStoredObjectsAreInKVStore
{
  void *v3;
  _QWORD v4[5];

  -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__EMUbiquitouslyPersistedDictionary__ensureStoredObjectsAreInKVStore__block_invoke;
  v4[3] = &unk_1E70F6358;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __69__EMUbiquitouslyPersistedDictionary__ensureStoredObjectsAreInKVStore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "kvStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "kvStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v5, v9);

  }
}

- (void)_synchronize
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "KV Store synchronize failed", v1, 2u);
}

- (void)_purgeOldestEntries
{
  void *v3;
  void *v4;
  unint64_t i;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "mutableCopy");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__EMUbiquitouslyPersistedDictionary__purgeOldestEntries__block_invoke;
  v13[3] = &unk_1E70F6380;
  v13[4] = self;
  objc_msgSend(v12, "sortUsingComparator:", v13);
  for (i = 0; ; ++i)
  {
    v6 = objc_msgSend(v12, "count", v12);
    v7 = v6 >= 0xA ? 10 : v6;
    if (i >= v7)
      break;
    -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
  -[EMUbiquitouslyPersistedDictionary _synchronize](self, "_synchronize");

}

uint64_t __56__EMUbiquitouslyPersistedDictionary__purgeOldestEntries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("updatedAt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("updatedAt"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "compare:", v12);
  return v13;
}

- (void)_resetKVStore
{
  NSObject *v3;
  NSString *identifier;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[EMUbiquitouslyPersistedDictionary log](EMUbiquitouslyPersistedDictionary, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412290;
    v20 = identifier;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "resetting kv store for %@", buf, 0xCu);
  }

  -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronize");

}

- (void)_mergeKVStoreChangedKeys:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (objc_msgSend(v4, "count"))
  {
    -[EMUbiquitouslyPersistedDictionary delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EF25FFB0);

    if (!v6)
      goto LABEL_4;
    -[EMUbiquitouslyPersistedDictionary delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeChangesForRemotelyChangedKeys:localStore:cloudStore:", v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_4:
      -[EMUbiquitouslyPersistedDictionary _mergeChangesForRemotelyChangedKeys:](self, "_mergeChangesForRemotelyChangedKeys:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "changedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deletedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
    {
      *((_BYTE *)v20 + 24) = 1;
      -[EMUbiquitouslyPersistedDictionary notifyDelegateOfChangedItems:deletedItems:](self, "notifyDelegateOfChangedItems:deletedItems:", v11, v12);
    }
    if (objc_msgSend(v10, "requiresSynchronizing"))
      -[EMUbiquitouslyPersistedDictionary _synchronize](self, "_synchronize");

  }
  else
  {
    -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__EMUbiquitouslyPersistedDictionary__mergeKVStoreChangedKeys___block_invoke;
    v18[3] = &unk_1E70F63A8;
    v18[4] = self;
    v18[5] = &v19;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  if (*((_BYTE *)v20 + 24))
  {
    +[EMUbiquitouslyPersistedDictionary log](EMUbiquitouslyPersistedDictionary, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "after merging changes: %@", buf, 0xCu);

    }
    -[EMUbiquitouslyPersistedDictionary _writeToPlist](self, "_writeToPlist");
  }
  else
  {
    +[EMUbiquitouslyPersistedDictionary log](EMUbiquitouslyPersistedDictionary, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEFAULT, "no changes, all in sync already", buf, 2u);
    }

  }
  _Block_object_dispose(&v19, 8);

}

void __62__EMUbiquitouslyPersistedDictionary__mergeKVStoreChangedKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "storedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "storedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, v12);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)_mergeChangesForRemotelyChangedKeys:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  EMUbiquitouslyPersistedDictionaryMergeResult *v16;
  id v18;
  id v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v18;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[EMUbiquitouslyPersistedDictionary kvStore](self, "kvStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          if (v11)
          {
            objc_msgSend(v19, "addObject:", v7);
            -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
            v15 = objc_claimAutoreleasedReturnValue();
            -[NSObject removeObjectForKey:](v15, "removeObjectForKey:", v7);
          }
          else
          {
            +[EMUbiquitouslyPersistedDictionary log](EMUbiquitouslyPersistedDictionary, "log");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = obj;
              _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "no changes detected, changed keys=%@", buf, 0xCu);
            }
          }
          goto LABEL_14;
        }
        if (!v11
          || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value")),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value")),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v12, "isEqual:", v13),
              v13,
              v12,
              (v14 & 1) == 0))
        {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, v7);
          -[EMUbiquitouslyPersistedDictionary storedObjects](self, "storedObjects");
          v15 = objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v9, v7);
LABEL_14:

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v20, "count") || objc_msgSend(v19, "count"))
    v16 = -[EMUbiquitouslyPersistedDictionaryMergeResult initWithChangedItems:deletedItems:requiresSynchronizing:]([EMUbiquitouslyPersistedDictionaryMergeResult alloc], "initWithChangedItems:deletedItems:requiresSynchronizing:", v20, v19, 0);
  else
    v16 = 0;

  return v16;
}

- (void)_storeChangedExternally:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  EMUbiquitouslyPersistedDictionary *v10;
  SEL v11;

  v5 = a3;
  -[EMUbiquitouslyPersistedDictionary mutationQueue](self, "mutationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke;
  block[3] = &unk_1E70F2998;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "kvStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("EMUbiquitouslyPersistedDictionary.m"), 333, CFSTR("This is not the store we were looking for!"));

  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3358]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3360]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMUbiquitouslyPersistedDictionary log](EMUbiquitouslyPersistedDictionary, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown change reason (%lu)"), v6);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E70F63E8[v6];
    }
    *(_DWORD *)buf = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "received external KVS change event: %@, changed keys=%@", buf, 0x16u);

  }
  if (v6 < 2)
    goto LABEL_11;
  if (v6 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_purgeOldestEntries");
    goto LABEL_16;
  }
  if (v6 == 3)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "_mergeKVStoreChangedKeys:", v7);
  }
  else
  {
    +[EMUbiquitouslyPersistedDictionary log](EMUbiquitouslyPersistedDictionary, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      _NSU9ChangeReasonString(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke_cold_1(v11, buf, v10);
    }

  }
LABEL_16:

}

- (void)notifyDelegateOfChangedItems:(id)a3 deletedItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ef_mapValues:", &__block_literal_global_119);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMUbiquitouslyPersistedDictionary delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[EMUbiquitouslyPersistedDictionary delegateScheduler](self, "delegateScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__EMUbiquitouslyPersistedDictionary_notifyDelegateOfChangedItems_deletedItems___block_invoke_2;
    v11[3] = &unk_1E70F2158;
    v12 = v9;
    v13 = v8;
    v14 = v7;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

id __79__EMUbiquitouslyPersistedDictionary_notifyDelegateOfChangedItems_deletedItems___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("value"));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __79__EMUbiquitouslyPersistedDictionary_notifyDelegateOfChangedItems_deletedItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "persistedDictionaryDidChangeRemotelyWithChangedItems:deletedItems:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableDictionary)storedObjects
{
  return self->_storedObjects;
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

- (OS_dispatch_queue)mutationQueue
{
  return self->_mutationQueue;
}

- (EMUbiquitouslyPersistedDictionaryDelegate)delegate
{
  return (EMUbiquitouslyPersistedDictionaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (EFScheduler)delegateScheduler
{
  return self->_delegateScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mutationQueue, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_storedObjects, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

void __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "unhandled change reason: %@", buf, 0xCu);

}

@end
