@implementation DNDSAppInfoCache

- (DNDSAppInfoCache)initWithKeybag:(id)a3
{
  id v5;
  DNDSAppInfoCache *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableSet *inflightBundleIdentifiers;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURLSession *urlSession;
  NSURLSession *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  DNDSAppInfoCache *v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DNDSAppInfoCache;
  v6 = -[DNDSAppInfoCache init](&v23, sel_init);
  if (v6)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.server.AppInfoCache"));
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    inflightBundleIdentifiers = v6->_inflightBundleIdentifiers;
    v6->_inflightBundleIdentifiers = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setURLCache:", v12);

    objc_msgSend(v11, "setRequestCachePolicy:", 2);
    objc_msgSend(v11, "setHTTPShouldUsePipelining:", 1);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setName:", CFSTR("com.apple.donotdisturb.iconcache"));
    objc_msgSend(v13, "setUnderlyingQueue:", v6->_queue);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v11, 0, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    urlSession = v6->_urlSession;
    v6->_urlSession = (NSURLSession *)v14;

    v16 = v6->_urlSession;
    objc_msgSend(v13, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSession setSessionDescription:](v16, "setSessionDescription:", v17);

    objc_storeStrong((id *)&v6->_keybag, a3);
    -[DNDSKeybagStateProviding addObserver:](v6->_keybag, "addObserver:", v6);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:", v6);

    v19 = v6->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__DNDSAppInfoCache_initWithKeybag___block_invoke;
    block[3] = &unk_1E86A5970;
    v22 = v6;
    dispatch_async(v19, block);

  }
  return v6;
}

uint64_t __35__DNDSAppInfoCache_initWithKeybag___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_read");
}

- (void)monitorApplicationIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  DNDSAppInfoCache *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__DNDSAppInfoCache_monitorApplicationIdentifiers___block_invoke;
  v7[3] = &unk_1E86A59E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __50__DNDSAppInfoCache_monitorApplicationIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
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
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "bundleID", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_monitorBundleIdentifiers:", v2);
}

- (id)appInfoForBundleIdentifier:(id)a3
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
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke;
  block[3] = &unk_1E86A6C48;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)a1[4];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    objc_msgSend(v5, "_sanitizeAppInfo:");
  else
    objc_msgSend(v5, "_fallbackAppInfoForBundleIdentifier:", a1[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = a1[4];
  v10 = *(NSObject **)(v9 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke_2;
  block[3] = &unk_1E86A5970;
  block[4] = v9;
  dispatch_async(v10, block);
}

uint64_t __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)appInfoForBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  DNDSAppInfoCache *v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke;
  block[3] = &unk_1E86A58D0;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  dispatch_sync(queue, block);
  v9 = v15;
  v10 = v7;

  return v10;
}

void __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        if (v8)
        {
          objc_msgSend(v9, "_sanitizeAppInfo:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v9, "_fallbackAppInfoForBundleIdentifier:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(v11 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke_2;
  block[3] = &unk_1E86A5970;
  block[4] = v11;
  dispatch_async(v12, block);
}

uint64_t __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DNDSAppInfoCache_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__DNDSAppInfoCache_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 32), "_queue_read");
  v2 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", v3);
    v2 = v3;
  }

}

- (void)applicationsDidInstall:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "App was installed", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DNDSAppInfoCache_applicationsDidInstall___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__DNDSAppInfoCache_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)applicationsDidUninstall:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "App was removed", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DNDSAppInfoCache_applicationsDidUninstall___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__DNDSAppInfoCache_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)_cacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  BSCurrentUserDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("Library");
  v7[2] = CFSTR("DoNotDisturb");
  v7[3] = CFSTR("DB");
  v7[4] = CFSTR("IconCache");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_write
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to serialize metadata store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_read
{
  NSMutableDictionary *v3;
  NSMutableDictionary *appInfoByBundleIdentifier;
  void *v5;
  DNDSBackingStoreDictionaryContext *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    appInfoByBundleIdentifier = self->_appInfoByBundleIdentifier;
    self->_appInfoByBundleIdentifier = v3;

    -[DNDSAppInfoCache _cacheURL](self, "_cacheURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("AppInfoMetadata.plist"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("appInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 3, 0, 0, 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_msgSend(MEMORY[0x1E0D1D588], "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v6);
          objc_msgSend(v12, "applicationIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appInfoByBundleIdentifier, "setObject:forKeyedSubscript:", v12, v14);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("monitoredBundleIdentifiers"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = v16;
    else
      v18 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v15, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSAppInfoCache _queue_monitorBundleIdentifiers:](self, "_queue_monitorBundleIdentifiers:", v19);
  }
  else
  {
    v20 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Will not read cache as keybag is locked", buf, 2u);
    }
  }
}

- (void)_fetchAppStoreInfoForBundleIdentifiers:(id)a3 timeoutInterval:(double)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSURLSession *urlSession;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id location;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) != 0)
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("https://itunes.apple.com/lookup"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(v10, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "queryItemWithName:value:", CFSTR("bundleId"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "countryCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "queryItemWithName:value:", CFSTR("country"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("entity"), CFSTR("software,iPadSoftware,macSoftware"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queryItemWithName:value:", CFSTR("limit"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v37[0] = v16;
      v37[1] = v20;
      v37[2] = v21;
      v37[3] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setQueryItems:", v25);

      objc_initWeak(&location, self);
      v26 = (void *)MEMORY[0x1E0CB39E0];
      objc_msgSend(v12, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 <= 0.0)
        objc_msgSend(v26, "requestWithURL:", v27);
      else
        objc_msgSend(v26, "requestWithURL:cachePolicy:timeoutInterval:", v27, 2, a4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      urlSession = self->_urlSession;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __99__DNDSAppInfoCache__fetchAppStoreInfoForBundleIdentifiers_timeoutInterval_limit_completionHandler___block_invoke;
      v32[3] = &unk_1E86A74A8;
      objc_copyWeak(&v35, &location);
      v33 = v10;
      v34 = v11;
      -[NSURLSession dataTaskWithRequest:completionHandler:](urlSession, "dataTaskWithRequest:completionHandler:", v29, v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "resume");

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v28 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1CB895000, v28, OS_LOG_TYPE_DEFAULT, "Will not fetch app info as keybag is locked", (uint8_t *)&location, 2u);
    }
  }

}

void __99__DNDSAppInfoCache__fetchAppStoreInfoForBundleIdentifiers_timeoutInterval_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_parseAppStoreResponseForBundleIdentifiers:response:data:error:", *(_QWORD *)(a1 + 32), v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchIconsForAppInfo:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *queue;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15);
        dispatch_group_enter(v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke;
        v25[3] = &unk_1E86A74D0;
        v26 = v9;
        v27 = v16;
        v28 = v10;
        -[DNDSAppInfoCache _fetchIconForAppInfo:timeoutInterval:completionHandler:](self, "_fetchIconForAppInfo:timeoutInterval:completionHandler:", v17, v25, a4);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke_2;
  block[3] = &unk_1E86A74F8;
  v23 = v9;
  v24 = v21;
  v19 = v9;
  v20 = v21;
  dispatch_group_notify(v10, queue, block);

}

void __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_fetchIconForAppInfo:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  NSURLSession *urlSession;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  DNDSAppInfoCache *v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v10, "storeIconURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB39E0];
    objc_msgSend(v8, "storeIconURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 <= 0.0)
      objc_msgSend(v12, "requestWithURL:", v13);
    else
      objc_msgSend(v12, "requestWithURL:cachePolicy:timeoutInterval:", v13, 2, a4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    urlSession = self->_urlSession;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke;
    v23[3] = &unk_1E86A7520;
    v24 = v8;
    v25 = self;
    v26 = v10;
    v27 = v9;
    v17 = v9;
    v15 = v10;
    -[NSURLSession downloadTaskWithRequest:completionHandler:](urlSession, "downloadTaskWithRequest:completionHandler:", v16, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

  }
  else
  {
    queue = self->_queue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke_61;
    v20[3] = &unk_1E86A74F8;
    v21 = v10;
    v22 = v9;
    v15 = v9;
    v16 = v10;
    dispatch_async(queue, v20);

    v17 = v22;
  }

}

void __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
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
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "storeIconURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "platform"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@.%@"), v11, v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_cacheURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v18;
    v38[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPathComponents:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v31);
    v22 = v31;

    if (v22)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSAppInfoCache _queue_write].cold.2();
      v23 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeItemAtURL:error:", v20, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v25, "copyItemAtURL:toURL:error:", v6, v20, &v30);
      v23 = v30;

      if (v23)
      {
        v26 = (void *)DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        {
          v27 = *(void **)(a1 + 32);
          v28 = v26;
          objc_msgSend(v27, "applicationIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v33 = v29;
          v34 = 2113;
          v35 = v20;
          v36 = 2114;
          v37 = v23;
          _os_log_error_impl(&dword_1CB895000, v28, OS_LOG_TYPE_ERROR, "Could not copy icon for %{private}@ to %{private}@: %{public}@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "setCachedIconURL:", v20);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_parseAppStoreResponseForBundleIdentifiers:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v11 || v12)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      -[DNDSAppInfoCache _parseAppStoreResponseForBundleIdentifiers:response:data:error:].cold.1();
    v42 = 0;
  }
  else
  {
    v49 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v49);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v49;
    v16 = v15;
    if (v14)
    {
      v37 = v15;
      v39 = v11;
      v40 = v10;
      v41 = v9;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v38 = v14;
      objc_msgSend(v14, "bs_safeArrayForKey:", CFSTR("results"));
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (!v17)
        goto LABEL_30;
      v18 = v17;
      v19 = CFSTR("bundleId");
      v44 = *(_QWORD *)v46;
      while (1)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v44)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v21, "bs_safeStringForKey:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bs_safeStringForKey:", CFSTR("trackName"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bs_safeStringForKey:", CFSTR("artworkUrl100"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bs_safeStringForKey:", CFSTR("kind"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v22, "length"))
          {
            v27 = DNDSLogGeneral;
            if (!os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
              goto LABEL_28;
            *(_DWORD *)buf = 138543362;
            v51 = v21;
            v28 = v27;
            v29 = "Unable to parse store response, bundle identifier is missing: %{public}@";
LABEL_18:
            _os_log_error_impl(&dword_1CB895000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
            goto LABEL_28;
          }
          if (!objc_msgSend(v23, "length"))
          {
            v30 = DNDSLogGeneral;
            if (!os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
              goto LABEL_28;
            *(_DWORD *)buf = 138543362;
            v51 = v21;
            v28 = v30;
            v29 = "Unable to parse store response, display name is missing: %{public}@";
            goto LABEL_18;
          }
          if ((objc_msgSend(v25, "isEqualToString:", CFSTR("software")) & 1) != 0
            || (objc_msgSend(v25, "isEqualToString:", CFSTR("ipad-software")) & 1) != 0)
          {
            v26 = 1;
          }
          else if (objc_msgSend(v25, "isEqualToString:", CFSTR("mac-software")))
          {
            v26 = 2;
          }
          else
          {
            v26 = 0;
          }
          v31 = v19;
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v22, v26);
          v33 = objc_alloc_init(MEMORY[0x1E0D1D6B8]);
          objc_msgSend(v33, "setSource:", 2);
          objc_msgSend(v33, "setDisplayName:", v23);
          objc_msgSend(v33, "setApplicationIdentifier:", v32);
          if (objc_msgSend(v24, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setStoreIconURL:", v34);

          }
          else
          {
            objc_msgSend(v33, "setStoreIconURL:", 0);
          }
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v33, v22);
          v35 = DNDSLogGeneral;
          if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            v51 = v22;
            v52 = 2113;
            v53 = v33;
            _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_DEFAULT, "Got app %{private}@ details from the store: %{private}@", buf, 0x16u);
          }

          v19 = v31;
LABEL_28:

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (!v18)
        {
LABEL_30:

          v10 = v40;
          v9 = v41;
          v13 = 0;
          v11 = v39;
          v16 = v37;
          v14 = v38;
          goto LABEL_37;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      -[DNDSAppInfoCache _parseAppStoreResponseForBundleIdentifiers:response:data:error:].cold.1();
    v42 = 0;
LABEL_37:

  }
  return v42;
}

- (void)_queue_removeCachedDataForAppInfo:(id)a3
{
  id v4;
  NSMutableDictionary *appInfoByBundleIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  appInfoByBundleIdentifier = self->_appInfoByBundleIdentifier;
  objc_msgSend(v4, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](appInfoByBundleIdentifier, "setObject:forKeyedSubscript:", 0, v7);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedIconURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v9, &v14);
  v10 = v14;

  v11 = (void *)DNDSLogGeneral;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      -[DNDSAppInfoCache _queue_removeCachedDataForAppInfo:].cold.1(v11, v4, (uint64_t)v10);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v4, "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v16 = v13;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Cleaned up %{private}@", buf, 0xCu);

  }
}

- (void)_queue_removeUnusedAppInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_appInfoByBundleIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "minusSet:", self->_relevantBundleIdentifiers);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appInfoByBundleIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSAppInfoCache _queue_removeCachedDataForAppInfo:](self, "_queue_removeCachedDataForAppInfo:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_queue_monitorBundleIdentifiers:(id)a3
{
  NSSet *v5;
  NSObject *v6;
  NSSet *monitoredBundleIdentifiers;
  int v8;
  void *v9;
  NSSet *v10;
  NSObject *v11;
  int v12;
  NSSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (NSSet *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Monitoring bundle identifiers: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  monitoredBundleIdentifiers = self->_monitoredBundleIdentifiers;
  if (monitoredBundleIdentifiers == v5)
  {
    v8 = 0;
  }
  else
  {
    v8 = 1;
    if (v5 && monitoredBundleIdentifiers)
      v8 = -[NSSet isEqual:](monitoredBundleIdentifiers, "isEqual:", v5) ^ 1;
  }
  objc_storeStrong((id *)&self->_monitoredBundleIdentifiers, a3);
  -[DNDSAppInfoCache _installedBundleIdentifiers](self, "_installedBundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSSet *)-[NSSet mutableCopy](v5, "mutableCopy");
  -[NSSet minusSet:](v10, "minusSet:", v9);
  objc_storeStrong((id *)&self->_relevantBundleIdentifiers, v10);
  v11 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Relevant bundle identifiers: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  -[DNDSAppInfoCache _queue_removeUnusedAppInfo](self, "_queue_removeUnusedAppInfo");
  if (-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot"))
  {
    if (v8)
      -[DNDSAppInfoCache _queue_write](self, "_queue_write");
    -[DNDSAppInfoCache _queue_fetchMissingAppInfo](self, "_queue_fetchMissingAppInfo");
  }

}

- (id)_queue_bundleIdentifiersWithMissingInfo
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_relevantBundleIdentifiers;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appInfoByBundleIdentifier, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!v10
          || (objc_msgSend(v10, "cachedIconURL"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v12,
              !v12))
        {
          objc_msgSend(v3, "addObject:", v9);
        }

      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_queue_fetchMissingAppInfo
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[DNDSAppInfoCache _queue_bundleIdentifiersWithMissingInfo](self, "_queue_bundleIdentifiersWithMissingInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke;
  v5[3] = &unk_1E86A7570;
  v5[4] = self;
  objc_msgSend(v3, "enumerateBatchesOfSize:handler:", 50, v5);

}

void __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unionSet:", v3);
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_2;
  v6[3] = &unk_1E86A7548;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_fetchAppStoreInfoForBundleIdentifiers:timeoutInterval:limit:completionHandler:", v5, 50, v6, 10.0);

}

void __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_3;
  v4[3] = &unk_1E86A7548;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_fetchIconsForAppInfo:timeoutInterval:completionHandler:", a2, v4, 10.0);

}

void __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  int v10;
  void *v11;
  id *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "minusSet:", *(_QWORD *)(a1 + 40));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", v9, (_QWORD)v13);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(id **)(a1 + 32);
        if (v10)
          objc_msgSend(v12[4], "setObject:forKeyedSubscript:", v11, v9);
        else
          objc_msgSend(v12, "_queue_removeCachedDataForAppInfo:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_write");
}

- (id)_installedBundleIdentifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)_sanitizeAppInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppInfoCache _fallbackAppInfoForBundleIdentifier:](self, "_fallbackAppInfoForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v7, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayName:", v9);

    v10 = (id)objc_msgSend(v8, "copy");
  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (id)_fallbackAppInfoForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_fallbackAppInfoByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_fallbackAppInfoByBundleIdentifier
{
  if (_fallbackAppInfoByBundleIdentifier_fallbackAppInfoByBundleIdentifierOnceToken != -1)
    dispatch_once(&_fallbackAppInfoByBundleIdentifier_fallbackAppInfoByBundleIdentifierOnceToken, &__block_literal_global_19);
  return (id)_fallbackAppInfoByBundleIdentifier___fallbackAppInfoByBundleIdentifier;
}

void __54__DNDSAppInfoCache__fallbackAppInfoByBundleIdentifier__block_invoke()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
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
  _QWORD v65[21];
  _QWORD v66[23];

  v66[21] = *MEMORY[0x1E0C80C00];
  v65[0] = CFSTR("com.apple.NanoStopwatch");
  v0 = objc_alloc(MEMORY[0x1E0D1D588]);
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoStopwatch"), 3);
  v63 = (void *)objc_msgSend(v0, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v64, CFSTR("APP_NAME_STOPWATCH"), 0, 0);
  v66[0] = v63;
  v65[1] = CFSTR("com.apple.NanoMenstrualCycles");
  v1 = objc_alloc(MEMORY[0x1E0D1D588]);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoMenstrualCycles"), 3);
  v61 = (void *)objc_msgSend(v1, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v62, CFSTR("APP_NAME_CYCLE_TRACKING"), 0, 0);
  v66[1] = v61;
  v65[2] = CFSTR("com.apple.watchmemojieditor");
  v2 = objc_alloc(MEMORY[0x1E0D1D588]);
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.watchmemojieditor"), 3);
  v59 = (void *)objc_msgSend(v2, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v60, CFSTR("APP_NAME_MEMOJI"), 0, 0);
  v66[2] = v59;
  v65[3] = CFSTR("com.apple.NanoHeartRhythm");
  v3 = objc_alloc(MEMORY[0x1E0D1D588]);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoHeartRhythm"), 3);
  v57 = (void *)objc_msgSend(v3, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v58, CFSTR("APP_NAME_ECG"), 0, 0);
  v66[3] = v57;
  v65[4] = CFSTR("com.apple.private.NanoTimer");
  v4 = objc_alloc(MEMORY[0x1E0D1D588]);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.private.NanoTimer"), 3);
  v55 = (void *)objc_msgSend(v4, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v56, CFSTR("APP_NAME_TIMER"), 0, 0);
  v66[4] = v55;
  v65[5] = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
  v5 = objc_alloc(MEMORY[0x1E0D1D588]);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoOxygenSaturation.watchkitapp"), 3);
  v53 = (void *)objc_msgSend(v5, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v54, CFSTR("APP_NAME_BLOOD_OXYGEN"), 0, 0);
  v66[5] = v53;
  v65[6] = CFSTR("com.apple.NanoAlarm");
  v6 = objc_alloc(MEMORY[0x1E0D1D588]);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoAlarm"), 3);
  v51 = (void *)objc_msgSend(v6, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v52, CFSTR("APP_NAME_ALARMS"), 0, 0);
  v66[6] = v51;
  v65[7] = CFSTR("com.apple.NanoTips");
  v7 = objc_alloc(MEMORY[0x1E0D1D588]);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoTips"), 3);
  v49 = (void *)objc_msgSend(v7, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v50, CFSTR("APP_NAME_TIPS"), 0, 0);
  v66[7] = v49;
  v65[8] = CFSTR("com.apple.NanoSleep.watchkitapp");
  v8 = objc_alloc(MEMORY[0x1E0D1D588]);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoSleep.watchkitapp"), 3);
  v47 = (void *)objc_msgSend(v8, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v48, CFSTR("APP_NAME_SLEEP"), 0, 0);
  v66[8] = v47;
  v65[9] = CFSTR("com.apple.Mind");
  v9 = objc_alloc(MEMORY[0x1E0D1D588]);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.Mind"), 3);
  v45 = (void *)objc_msgSend(v9, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v46, CFSTR("APP_NAME_MINDFULNESS"), 0, 0);
  v66[9] = v45;
  v65[10] = CFSTR("com.apple.NanoNowPlaying");
  v10 = objc_alloc(MEMORY[0x1E0D1D588]);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoNowPlaying"), 3);
  v43 = (void *)objc_msgSend(v10, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v44, CFSTR("APP_NAME_NOW_PLAYING"), 0, 0);
  v66[10] = v43;
  v65[11] = CFSTR("com.apple.Noise");
  v11 = objc_alloc(MEMORY[0x1E0D1D588]);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.Noise"), 3);
  v41 = (void *)objc_msgSend(v11, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v42, CFSTR("APP_NAME_NOISE"), 0, 0);
  v66[11] = v41;
  v65[12] = CFSTR("com.apple.NanoRemote");
  v12 = objc_alloc(MEMORY[0x1E0D1D588]);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.NanoRemote"), 3);
  v39 = (void *)objc_msgSend(v12, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v40, CFSTR("APP_NAME_REMOTE"), 0, 0);
  v66[12] = v39;
  v65[13] = CFSTR("com.apple.HeartRate");
  v13 = objc_alloc(MEMORY[0x1E0D1D588]);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.HeartRate"), 3);
  v37 = (void *)objc_msgSend(v13, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v38, CFSTR("APP_NAME_HEART_RATE"), 0, 0);
  v66[13] = v37;
  v65[14] = CFSTR("com.apple.MobileStore");
  v14 = objc_alloc(MEMORY[0x1E0D1D588]);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.MobileStore"), 1);
  v35 = (void *)objc_msgSend(v14, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v36, CFSTR("APP_NAME_ITUNES_STORE"), 0, 0);
  v66[14] = v35;
  v65[15] = CFSTR("com.apple.Health");
  v15 = objc_alloc(MEMORY[0x1E0D1D588]);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.Health"), 1);
  v33 = (void *)objc_msgSend(v15, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v34, CFSTR("APP_NAME_HEALTH"), 0, 0);
  v66[15] = v33;
  v65[16] = CFSTR("com.apple.Bridge");
  v16 = objc_alloc(MEMORY[0x1E0D1D588]);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.Bridge"), 1);
  v17 = (void *)objc_msgSend(v16, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v32, CFSTR("APP_NAME_WATCH"), 0, 0);
  v66[16] = v17;
  v65[17] = CFSTR("com.apple.Passbook");
  v18 = objc_alloc(MEMORY[0x1E0D1D588]);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.Passbook"), 1);
  v20 = (void *)objc_msgSend(v18, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v19, CFSTR("APP_NAME_WALLET"), 0, 0);
  v66[17] = v20;
  v65[18] = CFSTR("com.apple.camera");
  v21 = objc_alloc(MEMORY[0x1E0D1D588]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.camera"), 1);
  v23 = (void *)objc_msgSend(v21, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v22, CFSTR("APP_NAME_CAMERA"), 0, 0);
  v66[18] = v23;
  v65[19] = CFSTR("com.apple.store.Jolly");
  v24 = objc_alloc(MEMORY[0x1E0D1D588]);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.store.Jolly"), 1);
  v26 = (void *)objc_msgSend(v24, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v25, CFSTR("APP_NAME_APPLE_STORE"), 0, 0);
  v66[19] = v26;
  v65[20] = CFSTR("com.apple.mobilephone");
  v27 = objc_alloc(MEMORY[0x1E0D1D588]);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.mobilephone"), 1);
  v29 = (void *)objc_msgSend(v27, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", 0, v28, CFSTR("APP_NAME_PHONE"), 0, 0);
  v66[20] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 21);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)_fallbackAppInfoByBundleIdentifier___fallbackAppInfoByBundleIdentifier;
  _fallbackAppInfoByBundleIdentifier___fallbackAppInfoByBundleIdentifier = v30;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_appInfoByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_relevantBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIdentifiers, 0);
}

- (void)_parseAppStoreResponseForBundleIdentifiers:response:data:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_1CB895000, v0, (uint64_t)v0, "App lookup of %{private}@ from store failed: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_removeCachedDataForAppInfo:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "cachedIconURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = v6;
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v5, v7, "Failed to removed cached icon at %{private}@: %{public}@", (uint8_t *)&v8);

}

@end
