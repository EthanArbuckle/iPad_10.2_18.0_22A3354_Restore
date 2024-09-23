@implementation NMSMusicRecommendationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_8);
  return (id)sharedManager___sharedManager;
}

void __46__NMSMusicRecommendationManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = v0;

}

- (NMSMusicRecommendationManager)init
{
  NMSMusicRecommendationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NMSInitialCloudLibraryImportObserver *v10;
  NMSInitialCloudLibraryImportObserver *initialCloudLibraryImportObserver;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NMSMusicRecommendationManager;
  v2 = -[NMSMusicRecommendationManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendationManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleRecommendationStoreContentsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.reco-store"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleRecommendationSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.reco-selections"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleMediaLibraryDidChangeNotification_, *MEMORY[0x24BDDBCF0], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleMediaLibraryDynamicPropertiesDidChangeNotification_, *MEMORY[0x24BDDBD00], 0);
    v7 = *MEMORY[0x24BE6B110];
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleMusicLibraryContentsDidChangeNotification_, v7, v8);

    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handlePairedDeviceDidBecomeActiveNotification_, *MEMORY[0x24BE6B420], 0);
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginGeneratingLibraryChangeNotifications");

    v10 = objc_alloc_init(NMSInitialCloudLibraryImportObserver);
    initialCloudLibraryImportObserver = v2->_initialCloudLibraryImportObserver;
    v2->_initialCloudLibraryImportObserver = v10;

    -[NMSMusicRecommendationManager fetchRecommendationsWithQueue:completion:](v2, "fetchRecommendationsWithQueue:completion:", 0, 0);
  }
  return v2;
}

- (void)fetchRecommendationsWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NMSMusicRecommendationManager *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NMLogForCategory(5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x219A03B50](v7);
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] Will fetch recommendations for request: %@, queue: %@, completion: %@", buf, 0x20u);

  }
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke;
  v15[3] = &unk_24D647D40;
  v16 = v6;
  v17 = self;
  v18 = v8;
  v19 = v7;
  v12 = v7;
  v13 = v8;
  v14 = v6;
  dispatch_async(queue, v15);

}

void __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  NSObject *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 40))
  {
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] Will return existing recommendations for request: %@", buf, 0xCu);
    }

    if (*(_QWORD *)(a1 + 56))
    {
      v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "copy");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_68;
      block[3] = &unk_24D647C30;
      v34 = *(id *)(a1 + 48);
      v9 = *(id *)(a1 + 56);
      v35 = v8;
      v36 = v9;
      v10 = v8;
      dispatch_async(v4, block);

    }
  }
  else
  {
    v11 = *(_QWORD *)(v5 + 32) == 0;
    NMLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] Initial fetch started for request: %@", buf, 0xCu);
      }

      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v17 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_69;
      v29[3] = &unk_24D647D18;
      v30 = *(id *)(a1 + 48);
      objc_copyWeak(&v32, (id *)buf);
      v18 = v16;
      v31 = v18;
      objc_msgSend(v17, "_reloadRecommendationsFromDefaultsWithCompletion:", v29);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(void **)(v19 + 32);
      *(_QWORD *)(v19 + 32) = v18;
      v21 = v18;

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v13)
      {
        v14 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v38 = v14;
        _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] Will wait for initial fetch to complete for request: %@", buf, 0xCu);
      }

    }
    if (*(_QWORD *)(a1 + 56))
    {
      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(NSObject **)(v22 + 32);
      v24 = *(NSObject **)(v22 + 16);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_71;
      v25[3] = &unk_24D647D40;
      v25[4] = v22;
      v26 = v4;
      v27 = *(id *)(a1 + 48);
      v28 = *(id *)(a1 + 56);
      dispatch_group_notify(v23, v24, v25);

    }
  }

}

- (void)_reloadRecommendationsFromDefaultsWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NMSMusicRecommendationsRequest *v10;
  OS_dispatch_queue *v11;
  id v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15;
  id v16;
  uint8_t buf[8];
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v5 = self->_queue;
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject cachedRecommendationsData](v8, "cachedRecommendationsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] Not using cached store recommendations since we no longer have an active account.", buf, 2u);
    }
    v9 = 0;
  }

  v10 = objc_alloc_init(NMSMusicRecommendationsRequest);
  -[NMSMusicRecommendationsRequest setUseCachedDataOnly:](v10, "setUseCachedDataOnly:", 1);
  -[NMSMusicRecommendationsRequest setCachedData:](v10, "setCachedData:", v9);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke;
  v13[3] = &unk_24D647DB8;
  v11 = v5;
  v14 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v4;
  v15 = v12;
  -[NMSMusicRecommendationsRequest performWithResponseHandler:](v10, "performWithResponseHandler:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endGeneratingLibraryChangeNotifications");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)NMSMusicRecommendationManager;
  -[NMSMusicRecommendationManager dealloc](&v6, sel_dealloc);
}

- (void)setWantsContentsUpdate:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__NMSMusicRecommendationManager_setWantsContentsUpdate___block_invoke;
  v4[3] = &unk_24D6478D8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __56__NMSMusicRecommendationManager_setWantsContentsUpdate___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  const __CFString *v3;
  _BYTE *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(*(_QWORD *)(result + 32) + 56) != *(unsigned __int8 *)(result + 40))
  {
    v1 = result;
    NMLogForCategory(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(v1 + 40))
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] set wantsContentsUpdate: %@", (uint8_t *)&v5, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 56) = *(_BYTE *)(v1 + 40);
    objc_msgSend(*(id *)(v1 + 32), "_removeLegacyRecommendationsDefaultsIfNecessary");
    v4 = *(_BYTE **)(v1 + 32);
    if (v4[56])
      objc_msgSend(v4, "_registerForPairingFinishedNotification");
    else
      objc_msgSend(v4, "_unregisterForPairingFinishedNotification");
    return objc_msgSend(*(id *)(v1 + 32), "_reloadRecommendationContentsIfNecessary");
  }
  return result;
}

- (void)_registerForPairingFinishedNotification
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePairingFinishedNotification_, *MEMORY[0x24BE6B440], 0);

  v4 = (id)objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
}

- (void)_unregisterForPairingFinishedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE6B440], 0);

}

uint64_t __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Calling completion handler with existing recommendations for request: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Initial fetch complete for request: %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 40) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_71(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_2;
  block[3] = &unk_24D647C30;
  v3 = *(NSObject **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v8 = v2;
  v9 = v4;
  v5 = v2;
  dispatch_async(v3, block);

}

uint64_t __74__NMSMusicRecommendationManager_fetchRecommendationsWithQueue_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Calling completion handler with newly fetched recommendations for request: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)hasSelectedRecommendationWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "musicRecommendationDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;

  return v7;
}

- (void)persistRecommendationsSelections:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] Persisting recommendation selections for: %@", buf, 0xCu);
  }

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "musicRecommendationDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isSelected", (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setMusicRecommendationDict:", v16);

}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_INFO, "[Recommendation] _handleSubscriptionStatusDidChangeNotification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[NMSSubscriptionManager sharedManager](NMSSubscriptionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapability:", 1);

  if ((v3 & 1) == 0)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[NMSSubscriptionManager sharedManager](NMSSubscriptionManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v9 = objc_msgSend(v5, "subscriptionCapabilities");
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] Subscription capabilities changed to %lu. Removing recommendations defaults.", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_removePreviousRecommendationDefaults");
    objc_msgSend(*(id *)(a1 + 32), "_removePreviousCachedRecommendationsResponses");
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke_75;
    v7[3] = &unk_24D647D68;
    v7[4] = v6;
    objc_msgSend(v6, "_reloadRecommendationsFromDefaultsWithCompletion:", v7);
  }
}

uint64_t __80__NMSMusicRecommendationManager__handleSubscriptionStatusDidChangeNotification___block_invoke_75(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (void)_handleActiveAccountDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Active account is changed. Removing recommendations defaults of previous account.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_removePreviousRecommendationDefaults");
  objc_msgSend(*(id *)(a1 + 32), "_removePreviousCachedRecommendationsResponses");
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke_76;
  v5[3] = &unk_24D647D68;
  v5[4] = v3;
  return objc_msgSend(v3, "_reloadRecommendationsFromDefaultsWithCompletion:", v5);
}

uint64_t __75__NMSMusicRecommendationManager__handleActiveAccountDidChangeNotification___block_invoke_76(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (void)_handlePairingFinishedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NMSMusicRecommendationManager__handlePairingFinishedNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __68__NMSMusicRecommendationManager__handlePairingFinishedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Pairing finished. Reloading recommendations.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_reloadRecommendationContentsIfNecessary");
}

- (void)_handleRecommendationStoreContentsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMusicRecommendationManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    NMLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendation store contents did change. Reloading recommendations.", buf, 2u);
    }

    v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke_77;
    v7[3] = &unk_24D647D68;
    v7[4] = v6;
    objc_msgSend(v6, "_reloadRecommendationsFromDefaultsWithCompletion:", v7);
  }
}

uint64_t __89__NMSMusicRecommendationManager__handleRecommendationStoreContentsDidChangeNotification___block_invoke_77(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (void)_handleRecommendationSelectionsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMusicRecommendationManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__NMSMusicRecommendationManager__handleRecommendationSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __86__NMSMusicRecommendationManager__handleRecommendationSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t result;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendation selections did change.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  result = objc_msgSend(*(id *)(a1 + 40), "_updateRecommendationsSelections");
  if ((v5 & 1) != 0 || (_DWORD)result)
  {
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastUserPinningChangeDateForBundleID:", CFSTR("com.apple.NanoMusic"));

    NMLogForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "Music: Set last user pinning change date, due to change in recommendation selections.", v9, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_notifyMusicRecommendationsDidUpdateNotification");
  }
  return result;
}

- (void)_handleMediaLibraryEntitiesAddedOrRemovedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media Library entities added or removed. Reloading recommendations.", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke_78;
  v5[3] = &unk_24D647D68;
  v5[4] = v3;
  return objc_msgSend(v3, "_reloadRecommendationsFromDefaultsWithCompletion:", v5);
}

uint64_t __87__NMSMusicRecommendationManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke_78(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (void)_handleMediaLibraryDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media Library did change. Reloading recommendations.", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke_79;
  v5[3] = &unk_24D647D68;
  v5[4] = v3;
  return objc_msgSend(v3, "_reloadRecommendationsFromDefaultsWithCompletion:", v5);
}

uint64_t __74__NMSMusicRecommendationManager__handleMediaLibraryDidChangeNotification___block_invoke_79(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (void)_handleMediaLibraryDynamicPropertiesDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media Library dynamic properties did change. Reloading recommendations.", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke_80;
  v5[3] = &unk_24D647D68;
  v5[4] = v3;
  return objc_msgSend(v3, "_reloadRecommendationsFromDefaultsWithCompletion:", v5);
}

uint64_t __91__NMSMusicRecommendationManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke_80(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (void)_handleMusicLibraryContentsDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationManager__handleMusicLibraryContentsDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __82__NMSMusicRecommendationManager__handleMusicLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Media library updated. Reloading recommendations.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_reloadRecommendationContentsIfNecessary");
}

- (void)_handlePairedDeviceDidBecomeActiveNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] Paired device became active. Reloading recommendations.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_reloadRecommendationContentsIfNecessary");
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke_81;
  v5[3] = &unk_24D647D68;
  v5[4] = v3;
  return objc_msgSend(v3, "_reloadRecommendationsFromDefaultsWithCompletion:", v5);
}

uint64_t __80__NMSMusicRecommendationManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke_81(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyMusicRecommendationsDidUpdateNotification");
  return result;
}

- (id)_recommendations
{
  return self->_recommendations;
}

- (void)_reloadRecommendationContentsIfNecessary
{
  NMSInitialCloudLibraryImportObserver *initialCloudLibraryImportObserver;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsContentsUpdate)
  {
    if (objc_msgSend((id)objc_opt_class(), "_shouldComputeLibraryRecommendations"))
    {
      initialCloudLibraryImportObserver = self->_initialCloudLibraryImportObserver;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke;
      v4[3] = &unk_24D646F30;
      v4[4] = self;
      -[NMSInitialCloudLibraryImportObserver performBlockWhenLibraryIsReady:](initialCloudLibraryImportObserver, "performBlockWhenLibraryIsReady:", v4);
    }
  }
}

void __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  dispatch_block_t v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = v1;
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v2, v3);

}

uint64_t __73__NMSMusicRecommendationManager__reloadRecommendationContentsIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadLibraryRecommendations");
}

void __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke_2;
  block[3] = &unk_24D647D90;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __82__NMSMusicRecommendationManager__reloadRecommendationsFromDefaultsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "recommendations");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(WeakRetained, "_updateWithRecommendations:", v3);

  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);

}

- (void)_notifyMusicRecommendationsDidUpdateNotification
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[Recommendation] Notifying clients about updated recommendations.", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("NMSMusicRecommendationsDidUpdateNotification"), self);

}

- (void)_reloadLibraryRecommendations
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[NMSMusicRecommendationManager _isLibraryRecommendationExpired](self, "_isLibraryRecommendationExpired");
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] evaluating library music recommendations.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMusicRecommendationManager _sortedContainersBasedOnRecency](self, "_sortedContainersBasedOnRecency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "type");
          if (v14 == 1)
          {
            objc_msgSend(v13, "persistentID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v7;
          }
          else
          {
            if (v14)
              continue;
            objc_msgSend(v13, "persistentID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v6;
          }
          objc_msgSend(v16, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }
    v17 = objc_msgSend(v6, "count");
    if (v17 + objc_msgSend(v7, "count"))
    {
      +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject beginBatchUpdates](v18, "beginBatchUpdates");
      v21 = (void *)objc_msgSend(v6, "copy");
      -[NSObject setLibraryRecommendationPlaylists:](v18, "setLibraryRecommendationPlaylists:", v21);

      v22 = (void *)objc_msgSend(v7, "copy");
      -[NSObject setLibraryRecommendationAlbums:](v18, "setLibraryRecommendationAlbums:", v22);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMSMusicRecommendationManager _expirationDateForUpdateDate:withOffsetDays:](self, "_expirationDateForUpdateDate:withOffsetDays:", v23, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLibraryRecommendationExpirationDate:](v18, "setLibraryRecommendationExpirationDate:", v24);

      -[NSObject endBatchUpdates](v18, "endBatchUpdates");
      -[NMSMusicRecommendationManager _scheduleNextLibraryRecommendationReloadIfNecessary](self, "_scheduleNextLibraryRecommendationReloadIfNecessary");
    }
    else
    {
      NMLogForCategory(5);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] Library music recommendations are empty, skipping persisting.", buf, 2u);
      }
    }

  }
  else
  {
    if (v5)
    {
      +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "libraryRecommendationExpirationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] NOT evaluating library music recommendations; expiration date is: %{public}@.",
        buf,
        0xCu);

    }
    -[NMSMusicRecommendationManager _scheduleNextLibraryRecommendationReloadIfNecessary](self, "_scheduleNextLibraryRecommendationReloadIfNecessary");
  }
}

- (id)_sortedContainersBasedOnRecency
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _QWORD v75[2];
  uint64_t v76;
  _QWORD v77[4];
  _QWORD v78[7];

  v78[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE6B180];
  v5 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE6B0B0], MEMORY[0x24BDBD1C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v6;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE6B0A0], MEMORY[0x24BDBD1C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v7;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE6B0E0], v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v8;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE6B0D8], v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v9;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE6B0A8], v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingPredicates:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v12;
  objc_msgSend(MEMORY[0x24BE6B1A0], "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v3, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE6B098];
  v77[0] = *MEMORY[0x24BE6B0C8];
  v77[1] = v14;
  v15 = *MEMORY[0x24BE6B0D0];
  v77[2] = *MEMORY[0x24BE6B090];
  v77[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke;
  v70[3] = &unk_24D647DE0;
  v18 = v3;
  v71 = v18;
  v19 = v55;
  v72 = v19;
  v56 = v13;
  objc_msgSend(v13, "enumeratePersistentIDsAndProperties:usingBlock:", v16, v70);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE6B150], &unk_24D655BC0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B1F8], "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = *MEMORY[0x24BE6B128];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v17;
  v68[1] = 3221225472;
  v68[2] = __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_96;
  v68[3] = &unk_24D647E08;
  v23 = v20;
  v69 = v23;
  v53 = v21;
  objc_msgSend(v21, "enumeratePersistentIDsAndProperties:usingBlock:", v22, v68);

  objc_msgSend(MEMORY[0x24BE6B1A8], "predicateWithProperty:values:", *MEMORY[0x24BE6B080], v23);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B178], "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BE6B068];
  v75[0] = *MEMORY[0x24BE6B070];
  v75[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v17;
  v66[1] = 3221225472;
  v66[2] = __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_2;
  v66[3] = &unk_24D647E08;
  v27 = v50;
  v67 = v27;
  v51 = v24;
  objc_msgSend(v24, "enumeratePersistentIDsAndProperties:usingBlock:", v26, v66);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v28 = v19;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v63 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        -[NMSMusicRecommendationManager _fetchAddedDateForContainer:](self, "_fetchAddedDateForContainer:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAddedDate:", v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v30);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v35 = v27;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        -[NMSMusicRecommendationManager _fetchAddedDateForContainer:](self, "_fetchAddedDateForContainer:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setAddedDate:", v41);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    }
    while (v37);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v28);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObjectsFromArray:", v35);
  objc_msgSend(v42, "sortUsingComparator:", &__block_literal_global_100);
  v43 = objc_msgSend(v42, "count");
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "minimumNumberOfRecentMusicModelObjects");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "unsignedIntegerValue");

  if (v43 >= v46)
    v47 = v46;
  else
    v47 = v43;
  objc_msgSend(v42, "subarrayWithRange:", 0, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

void __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  int v8;
  NMSContainer *v9;
  void *v10;
  NMSContainer *v11;

  if (!a3[3]
    || (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B1A0]), "initWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32)), objc_msgSend(MEMORY[0x24BE6B1F8], "containerQueryWithContainer:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "hasEntities"), v7, v6, v8))
  {
    v9 = [NMSContainer alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NMSContainer initWithPersistentID:name:type:](v9, "initWithPersistentID:name:type:", v10, *a3, 0);

    -[NMSContainer setPlayedDate:](v11, "setPlayedDate:", a3[1]);
    -[NMSContainer setAddedDate:](v11, "setAddedDate:", a3[2]);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  }
}

uint64_t __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_96(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *a3);
}

void __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  NMSContainer *v6;
  void *v7;
  NMSContainer *v8;

  v6 = [NMSContainer alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NMSContainer initWithPersistentID:name:type:](v6, "initWithPersistentID:name:type:", v7, *a3, 1);

  -[NMSContainer setPlayedDate:](v8, "setPlayedDate:", a3[1]);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

uint64_t __64__NMSMusicRecommendationManager__sortedContainersBasedOnRecency__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "addedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v5, "playedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v8 >= v11)
    v12 = v8;
  else
    v12 = v11;
  objc_msgSend(v4, "addedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v4, "playedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v15 >= v18)
    v19 = v15;
  else
    v19 = v18;
  if (v12 < v19)
    return 1;
  else
    return -1;
}

- (id)_fetchAddedDateForContainer:(id)a3
{
  id v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = (id *)MEMORY[0x24BE6B130];
  if (v4)
    v5 = (id *)MEMORY[0x24BE6B128];
  v6 = *v5;
  v7 = (void *)MEMORY[0x24BE6B198];
  objc_msgSend(v3, "persistentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProperty:value:comparison:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE6B1F8];
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v11, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  objc_msgSend(v3, "addedDate");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_24D655BD8;
  if (v13)
    v15 = (void *)v13;
  v25 = v15;

  v26[0] = *MEMORY[0x24BE6B138];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__NMSMusicRecommendationManager__fetchAddedDateForContainer___block_invoke;
  v19[3] = &unk_24D647E70;
  v19[4] = &v20;
  objc_msgSend(v12, "enumeratePersistentIDsAndProperties:usingBlock:", v16, v19);

  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __61__NMSMusicRecommendationManager__fetchAddedDateForContainer___block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "doubleValue");
  v6 = v5;
  objc_msgSend(*a3, "doubleValue");
  if (v6 < v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a3);
}

+ (BOOL)_shouldComputeLibraryRecommendations
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaired");

  return v3;
}

- (void)_finishLoadingContentsWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  objc_msgSend(v4, "recommendations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NMSMusicRecommendationManager _updateWithRecommendations:](self, "_updateWithRecommendations:", v6);

  -[NMSMusicRecommendationManager _persistUpdatedRecommendationsWithResponse:](self, "_persistUpdatedRecommendationsWithResponse:", v4);
  if (v7)
    -[NMSMusicRecommendationManager _notifyMusicRecommendationsDidUpdateNotification](self, "_notifyMusicRecommendationsDidUpdateNotification");
}

- (BOOL)_updateWithRecommendations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSArray *v16;
  NSArray *recommendations;
  NSObject *v18;
  NSArray *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  NSArray *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "musicRecommendationDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "identifier", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v12, "setSelected:", objc_msgSend(v14, "BOOLValue"));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  v15 = -[NSArray isEqualToArray:](self->_recommendations, "isEqualToArray:", v7);
  if (!v15)
  {
    v16 = (NSArray *)objc_msgSend(v7, "copy");
    recommendations = self->_recommendations;
    self->_recommendations = v16;

    NMLogForCategory(5);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_recommendations;
      *(_DWORD *)buf = 138412290;
      v26 = v19;
      _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendations contents updated: %@", buf, 0xCu);
    }

    -[NMSMusicRecommendationManager persistRecommendationsSelections:](self, "persistRecommendationsSelections:", self->_recommendations);
  }

  return !v15;
}

- (BOOL)_updateRecommendationsSelections
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *recommendations;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  NSArray *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "musicRecommendationDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_recommendations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  v7 = v6 != 0;
  if (v6)
  {
    v8 = v6;
    v18 = v6 != 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v15 = objc_msgSend(v14, "BOOLValue");
        else
          v15 = 1;
        v9 |= v15 ^ objc_msgSend(v12, "isSelected");
        objc_msgSend(v12, "setSelected:", v15);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);

    if ((v9 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_17;
    }
    NMLogForCategory(5);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      recommendations = self->_recommendations;
      *(_DWORD *)buf = 138412290;
      v24 = recommendations;
      _os_log_impl(&dword_216E27000, &v5->super, OS_LOG_TYPE_DEFAULT, "[Recommendation] Recommendations selections updated: %@", buf, 0xCu);
    }
    v7 = v18;
  }

LABEL_17:
  return v7;
}

- (void)_persistUpdatedRecommendationsWithResponse:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_recommendations;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isSelected", (_QWORD)v20));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "cachedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "length") >= 0x55731)
  {
    NMLogForCategory(5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NMSMusicRecommendationManager _persistUpdatedRecommendationsWithResponse:].cold.1(v14, v15);

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults", (_QWORD)v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginBatchUpdates");
  v18 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v17, "setMusicRecommendationDict:", v18);

  objc_msgSend(v17, "setCachedRecommendationsData:", v14);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCatalogRecommendationsLastUpdateDate:", v19);

  objc_msgSend(v17, "endBatchUpdates");
}

- (void)_removeLegacyRecommendationsDefaultsIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)_removePreviousRecommendationDefaults
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NMSMutableMediaSyncInfo *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsContentsUpdate)
  {
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = self->_recommendations;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", NMSRecommendationRecentMusicIdentifier);

          if (v11)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isSelected"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    objc_msgSend(v16, "beginBatchUpdates");
    v14 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v16, "setMusicRecommendationDict:", v14);

    objc_msgSend(v16, "setCachedRecommendationsData:", 0);
    objc_msgSend(v16, "setCatalogRecommendationsLastUpdateDate:", 0);
    objc_msgSend(v16, "setLibraryRecommendationExpirationDate:", 0);
    objc_msgSend(v16, "endBatchUpdates");
    v15 = -[NMSMutableMediaSyncInfo initWithTarget:]([NMSMutableMediaSyncInfo alloc], "initWithTarget:", 3);
    -[NMSMutableMediaSyncInfo synchronize](v15, "synchronize");

  }
}

- (void)_removePreviousCachedRecommendationsResponses
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_216E27000, log, OS_LOG_TYPE_ERROR, "[Recommendation] Failed to remove data from disk at url: %@ due to read error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_scheduleNextLibraryRecommendationReloadIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *libraryRecommendationExpirationTimer;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsContentsUpdate)
  {
    -[NMSMusicRecommendationManager _invalidateLibraryRecommendationExpirationTimer](self, "_invalidateLibraryRecommendationExpirationTimer");
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "libraryRecommendationExpirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 <= 0.0)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Reload) Skipped scheduling library reload with expiration date: %@", buf, 0xCu);
      }

    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        v19 = 2048;
        v20 = v7;
        _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Reload) Scheduling library expiration timer with date: %@ (in %f seconds)", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
      libraryRecommendationExpirationTimer = self->_libraryRecommendationExpirationTimer;
      self->_libraryRecommendationExpirationTimer = v10;

      v12 = self->_libraryRecommendationExpirationTimer;
      v13 = dispatch_walltime(0, (uint64_t)(v7 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
      v14 = self->_libraryRecommendationExpirationTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __84__NMSMusicRecommendationManager__scheduleNextLibraryRecommendationReloadIfNecessary__block_invoke;
      handler[3] = &unk_24D646E68;
      objc_copyWeak(&v16, (id *)buf);
      dispatch_source_set_event_handler(v14, handler);
      dispatch_resume((dispatch_object_t)self->_libraryRecommendationExpirationTimer);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __84__NMSMusicRecommendationManager__scheduleNextLibraryRecommendationReloadIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Reload) Expiration timer fired.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_invalidateLibraryRecommendationExpirationTimer");
    objc_msgSend(v4, "_reloadRecommendationContentsIfNecessary");
  }

}

- (void)_invalidateLibraryRecommendationExpirationTimer
{
  NSObject *libraryRecommendationExpirationTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  libraryRecommendationExpirationTimer = self->_libraryRecommendationExpirationTimer;
  if (libraryRecommendationExpirationTimer)
  {
    dispatch_source_cancel(libraryRecommendationExpirationTimer);
    v4 = self->_libraryRecommendationExpirationTimer;
    self->_libraryRecommendationExpirationTimer = 0;

  }
}

- (BOOL)_isLibraryRecommendationExpired
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryRecommendationExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4) == -1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_expirationDateForUpdateDate:(id)a3 withOffsetDays:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setDay:", a4);
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v8, v6, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)wantsContentsUpdate
{
  return self->_wantsContentsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCloudLibraryImportObserver, 0);
  objc_storeStrong((id *)&self->_initialRecommendationsFetchGroup, 0);
  objc_storeStrong((id *)&self->_libraryRecommendationExpirationTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
}

- (void)_persistUpdatedRecommendationsWithResponse:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x24BDB4398], "ic_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_activeStoreAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_storefront");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v3;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_216E27000, a2, OS_LOG_TYPE_FAULT, "[Recommendation] Response exceeds expected size - response data length: %lu, storefront: %@", (uint8_t *)&v7, 0x16u);

}

@end
