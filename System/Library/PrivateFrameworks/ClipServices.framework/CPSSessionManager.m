@implementation CPSSessionManager

+ (CPSSessionManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_1);
  return (CPSSessionManager *)(id)sharedManager_manager;
}

void __34__CPSSessionManager_sharedManager__block_invoke()
{
  CPSSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(CPSSessionManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (CPSSessionManager)init
{
  CPSSessionManager *v2;
  uint64_t v3;
  NSMutableDictionary *sessions;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  CPSBusinessItemFetcher *v8;
  CPSBusinessItemFetching *businessItemFetcher;
  CPSAppInfoFetcher *v10;
  CPSAppInfoFetching *appInfoFetcher;
  CPSInstallationController *v12;
  CPSInstallationController *clipInstaller;
  void *v14;
  CPSSessionManager *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPSSessionManager;
  v2 = -[CPSSessionManager init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.ClipServices.clipserviced.CPSSessionManager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(CPSBusinessItemFetcher);
    businessItemFetcher = v2->_businessItemFetcher;
    v2->_businessItemFetcher = (CPSBusinessItemFetching *)v8;

    v10 = objc_alloc_init(CPSAppInfoFetcher);
    appInfoFetcher = v2->_appInfoFetcher;
    v2->_appInfoFetcher = (CPSAppInfoFetching *)v10;

    v12 = -[CPSInstallationController initWithAppInfoFetcher:]([CPSInstallationController alloc], "initWithAppInfoFetcher:", v2->_appInfoFetcher);
    clipInstaller = v2->_clipInstaller;
    v2->_clipInstaller = v12;

    -[CPSSessionManager _setUpMemoryPressureHandler](v2, "_setUpMemoryPressureHandler");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x24BDBCA70], 0);

    v15 = v2;
  }

  return v2;
}

- (void)_setUpMemoryPressureHandler
{
  OS_dispatch_source *v3;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 2uLL, 0);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  objc_initWeak(&location, self);
  v5 = self->_memoryPressureSource;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke;
  v6[3] = &unk_24C3B9950;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  uintptr_t data;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    data = dispatch_source_get_data(*((dispatch_source_t *)WeakRetained + 3));
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_DEFAULT, "Received memory warning", buf, 2u);
    }
    v5 = v2[2];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke_9;
    v6[3] = &unk_24C3B9928;
    v6[4] = v2;
    v6[5] = data;
    dispatch_async(v5, v6);
  }

}

uint64_t __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMemoryPressure:", *(_QWORD *)(a1 + 40));
}

- (void)_handleMemoryPressure:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *sessions;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_DEFAULT, "Handling memory pressure (warning) by purging cached sessions.", buf, 2u);
  }
  -[NSMutableDictionary allValues](self->_sessions, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPurgeable"))
        {
          sessions = self->_sessions;
          objc_msgSend(v10, "url");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](sessions, "removeObjectForKey:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

}

- (void)handleManagedConfigurationChanged
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CPSSessionManager_handleManagedConfigurationChanged__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __54__CPSSessionManager_handleManagedConfigurationChanged__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "metadata");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invocationPolicy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isIneligibleDueToContentRestriction");

        if (v9)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "metadata");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setExpirationDate:", v10);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (NSArray)allSessions
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__CPSSessionManager_allSessions__block_invoke;
  v5[3] = &unk_24C3B9978;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __32__CPSSessionManager_allSessions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sessionWithURL:(id)a3 createIfNoExist:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__CPSSessionManager_sessionWithURL_createIfNoExist___block_invoke;
  v11[3] = &unk_24C3B99A0;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __52__CPSSessionManager_sessionWithURL_createIfNoExist___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CPSSession *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v5 = -[CPSSession initWithURL:usingQueue:]([CPSSession alloc], "initWithURL:usingQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setBusinessItemFetcher:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAppInfoFetcher:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)clearSessionWithURL:(id)a3
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
  v7[2] = __41__CPSSessionManager_clearSessionWithURL___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __41__CPSSessionManager_clearSessionWithURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = v2;
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138412547;
    v10 = v6;
    v11 = 2113;
    v12 = v7;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "Clearing session: %@ for URL: %{private}@", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)getSessionWithURL:(id)a3 completion:(id)a4
{
  -[CPSSessionManager getSessionWithURL:configuration:completion:](self, "getSessionWithURL:configuration:completion:", a3, 0, a4);
}

- (void)getSessionWithURL:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__CPSSessionManager_getSessionWithURL_configuration_completion___block_invoke;
  v15[3] = &unk_24C3B9748;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __64__CPSSessionManager_getSessionWithURL_configuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CPSSession *v8;
  void *v9;
  CPSClipMetadata *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpired");

  if (v4)
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412547;
      v35 = v2;
      v36 = 2117;
      v37 = v6;
      _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "Metadata associated with cached session: %@ for url: %{sensitive}@ is expired. Clearing and refetching metadata.", buf, 0x16u);
    }
    objc_msgSend(v2, "clearMetadataAndRefetch");
  }
  v7 = *(void **)(a1 + 48);
  if (!v7)
    goto LABEL_24;
  if (v2 && (objc_msgSend(v7, "usedByPPT") & 1) == 0)
  {
    objc_msgSend(v2, "configuration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      if ((objc_msgSend(*(id *)(a1 + 48), "useLocalContent") & 1) != 0)
      {

LABEL_23:
        v28 = objc_msgSend(*(id *)(a1 + 48), "isForSwitcherOverlay");
        objc_msgSend(v2, "configuration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setIsForSwitcherOverlay:", v28);

LABEL_24:
        v30 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v2, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clipBundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v30 + 16))(v30, v2, v18);
        goto LABEL_25;
      }
      objc_msgSend(v2, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sourceBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "sourceBundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqualToString:", v22))
      {
        objc_msgSend(v2, "configuration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "referrerBundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "referrerBundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isEqualToString:", v25))
        {
          objc_msgSend(v2, "configuration");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "launchReason");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "launchReason");
          v32 = v23;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v26, "isEqualToString:", v27);

          if ((v33 & 1) != 0)
            goto LABEL_23;
          goto LABEL_22;
        }

      }
    }
LABEL_22:
    objc_msgSend(v2, "setConfiguration:", *(_QWORD *)(a1 + 48));
    goto LABEL_23;
  }
  v8 = -[CPSSession initWithURL:usingQueue:configuration:]([CPSSession alloc], "initWithURL:usingQueue:configuration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48));

  +[CPSDeveloperOverride overrideForURL:](CPSDeveloperOverride, "overrideForURL:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[CPSClipMetadata initWithDeveloperOverride:invocationURL:]([CPSClipMetadata alloc], "initWithDeveloperOverride:invocationURL:", v9, *(_QWORD *)(a1 + 40));
    -[CPSSession setPreloadedMetadata:](v8, "setPreloadedMetadata:", v10);

    v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[CPSSession logID](v8, "logID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clipBundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v35 = v13;
      v36 = 2113;
      v37 = v14;
      _os_log_impl(&dword_20AD44000, v12, OS_LOG_TYPE_DEFAULT, "Use an overriden app clip experince for session: %@, bundleID: %{private}@", buf, 0x16u);

    }
  }
  else
  {
    -[CPSSession setBusinessItemFetcher:](v8, "setBusinessItemFetcher:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    -[CPSSession setAppInfoFetcher:](v8, "setAppInfoFetcher:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  }
  -[CPSSession setConfiguration:](v8, "setConfiguration:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));
  v17 = *(_QWORD *)(a1 + 56);
  -[CPSSession metadata](v8, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clipBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, CPSSession *, void *))(v17 + 16))(v17, v8, v19);

  v2 = v8;
LABEL_25:

}

- (void)_localeChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CPSSessionManager__localeChanged___block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CPSSessionManager__localeChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        objc_msgSend(v7, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clipBundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "evictCachedMetadataForClipBundleID:", v10);

        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        objc_msgSend(v7, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (CPSInstallationController)clipInstaller
{
  return self->_clipInstaller;
}

- (CPSLegacyAppInstalling)legacyInstaller
{
  return self->_legacyInstaller;
}

- (void)setLegacyInstaller:(id)a3
{
  objc_storeStrong((id *)&self->_legacyInstaller, a3);
}

- (CPSAppInfoFetching)appInfoFetcher
{
  return self->_appInfoFetcher;
}

- (CPSBusinessItemFetching)businessItemFetcher
{
  return self->_businessItemFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessItemFetcher, 0);
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
  objc_storeStrong((id *)&self->_legacyInstaller, 0);
  objc_storeStrong((id *)&self->_clipInstaller, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
