@implementation GEOMapDataSubscriptionManager

+ (void)_setSharedManagerUseLocalPersistence:(BOOL)a3
{
  uint8_t v4[16];

  if (qword_1ECDBC7A8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _sSingleton == nil", v4, 2u);
  }
  _MergedGlobals_305 = a3;
}

+ (GEOMapDataSubscriptionManager)sharedManager
{
  if (qword_1ECDBC7B0 != -1)
    dispatch_once(&qword_1ECDBC7B0, &__block_literal_global_168);
  return (GEOMapDataSubscriptionManager *)(id)qword_1ECDBC7A8;
}

void __46__GEOMapDataSubscriptionManager_sharedManager__block_invoke()
{
  void *v0;
  GEOMapDataSubscriptionLocalPersistence *v1;
  void *v2;
  GEOMapDataSubscriptionLocalPersistence *v3;
  GEOMapDataSubscriptionLocalDownloadManager *v4;
  void *v5;
  GEOMapDataSubscriptionLocalDownloadManager *v6;
  GEOMapDataSubscriptionLocalSyncManager *v7;
  void *v8;
  GEOMapDataSubscriptionLocalSyncManager *v9;
  GEOMapDataSubscriptionManager *v10;
  void *v11;
  uint8_t v12[16];

  if (_MergedGlobals_305)
  {
    _GEOGetSharedTileDB();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (v0)
    {
      v1 = [GEOMapDataSubscriptionLocalPersistence alloc];
      +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[GEOMapDataSubscriptionLocalPersistence initWithTileDB:offlineDataConfiguration:](v1, "initWithTileDB:offlineDataConfiguration:", v0, v2);

      v4 = [GEOMapDataSubscriptionLocalDownloadManager alloc];
      +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOMapDataSubscriptionLocalDownloadManager initWithTileDB:dataConfiguration:](v4, "initWithTileDB:dataConfiguration:", v0, v5);

      v7 = [GEOMapDataSubscriptionLocalSyncManager alloc];
      +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GEOMapDataSubscriptionLocalSyncManager initWithPersistence:tileDB:dataConfiguration:](v7, "initWithPersistence:tileDB:dataConfiguration:", v3, v0, v8);

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: diskCache != nil", v12, 2u);
      }
      v9 = 0;
      v6 = 0;
      v3 = 0;
    }

  }
  else
  {
    v9 = 0;
    v6 = 0;
    v3 = 0;
  }
  v10 = -[GEOMapDataSubscriptionManager initWithPersistence:downloadManager:syncManager:]([GEOMapDataSubscriptionManager alloc], "initWithPersistence:downloadManager:syncManager:", v3, v6, v9);
  v11 = (void *)qword_1ECDBC7A8;
  qword_1ECDBC7A8 = (uint64_t)v10;

}

- (GEOMapDataSubscriptionManager)init
{
  return -[GEOMapDataSubscriptionManager initWithPersistence:downloadManager:syncManager:](self, "initWithPersistence:downloadManager:syncManager:", 0, 0, 0);
}

- (GEOMapDataSubscriptionManager)initWithPersistence:(id)a3 downloadManager:(id)a4 syncManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapDataSubscriptionManager *v11;
  uint64_t v12;
  geo_isolater *isolation;
  GEOMapDataSubscriptionRemotePersistence *v14;
  GEOMapDataSubscriptionPersistence *persistence;
  GEOMapDataSubscriptionRemoteDownloadManager *v16;
  GEOMapDataSubscriptionDownloadManager *downloadManager;
  GEOMapDataSubscriptionRemoteSyncManager *v18;
  GEOMapDataSubscriptionSyncManager *syncManager;
  uint64_t v20;
  OS_dispatch_queue *stateObservationQueue;
  GEOObserverHashTable *v22;
  GEOObserverHashTable *stateObservers;
  GEOMapDataSubscriptionManager *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GEOMapDataSubscriptionManager;
  v11 = -[GEOMapDataSubscriptionManager init](&v26, sel_init);
  if (v11)
  {
    v12 = geo_isolater_create();
    isolation = v11->_isolation;
    v11->_isolation = (geo_isolater *)v12;

    if (v8)
      v14 = (GEOMapDataSubscriptionRemotePersistence *)v8;
    else
      v14 = objc_alloc_init(GEOMapDataSubscriptionRemotePersistence);
    persistence = v11->_persistence;
    v11->_persistence = (GEOMapDataSubscriptionPersistence *)v14;

    -[GEOMapDataSubscriptionPersistence setDelegate:](v11->_persistence, "setDelegate:", v11);
    if (v9)
      v16 = (GEOMapDataSubscriptionRemoteDownloadManager *)v9;
    else
      v16 = objc_alloc_init(GEOMapDataSubscriptionRemoteDownloadManager);
    downloadManager = v11->_downloadManager;
    v11->_downloadManager = (GEOMapDataSubscriptionDownloadManager *)v16;

    -[GEOMapDataSubscriptionDownloadManager setDelegate:](v11->_downloadManager, "setDelegate:", v11);
    if (v10)
      v18 = (GEOMapDataSubscriptionRemoteSyncManager *)v10;
    else
      v18 = objc_alloc_init(GEOMapDataSubscriptionRemoteSyncManager);
    syncManager = v11->_syncManager;
    v11->_syncManager = (GEOMapDataSubscriptionSyncManager *)v18;

    -[GEOMapDataSubscriptionSyncManager setDelegate:](v11->_syncManager, "setDelegate:", v11);
    geo_dispatch_queue_create_with_qos();
    v20 = objc_claimAutoreleasedReturnValue();
    stateObservationQueue = v11->_stateObservationQueue;
    v11->_stateObservationQueue = (OS_dispatch_queue *)v20;

    v22 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EE046C68, v11->_stateObservationQueue);
    stateObservers = v11->_stateObservers;
    v11->_stateObservers = v22;

    v24 = v11;
  }

  return v11;
}

- (void)fetchAllSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionPersistence fetchSubscriptionsWithIdentifiers:callbackQueue:completionHandler:](self->_persistence, "fetchSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", 0, a3, a4);
}

- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionPersistence fetchSubscriptionsWithIdentifiers:callbackQueue:completionHandler:](self->_persistence, "fetchSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)fetchAllExpiredSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionPersistence fetchExpiredSubscriptionsWithIdentifiers:callbackQueue:completionHandler:](self->_persistence, "fetchExpiredSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", 0, a3, a4);
}

- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionPersistence fetchExpiredSubscriptionsWithIdentifiers:callbackQueue:completionHandler:](self->_persistence, "fetchExpiredSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)addSubscriptionWithIdentifier:(id)a3 dataTypes:(unint64_t)a4 policy:(int64_t)a5 region:(id)a6 expirationDate:(id)a7 callbackQueue:(id)a8 completionHandler:(id)a9
{
  -[GEOMapDataSubscriptionManager addSubscriptionWithIdentifier:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:](self, "addSubscriptionWithIdentifier:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (void)addSubscriptionWithIdentifier:(id)a3 dataTypes:(unint64_t)a4 policy:(int64_t)a5 region:(id)a6 displayName:(id)a7 expirationDate:(id)a8 callbackQueue:(id)a9 completionHandler:(id)a10
{
  id v17;
  GEOMapDataSubscriptionPersistence *persistence;
  id v19;
  _QWORD v20[4];
  id v21;

  v17 = a10;
  persistence = self->_persistence;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __146__GEOMapDataSubscriptionManager_addSubscriptionWithIdentifier_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke;
  v20[3] = &unk_1E1C13D70;
  v21 = v17;
  v19 = v17;
  -[GEOMapDataSubscriptionPersistence addSubscriptionWithIdentifier:auditToken:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:](persistence, "addSubscriptionWithIdentifier:auditToken:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", a3, 0, a4, a5, a6, a7, a8, a9, v20);

}

uint64_t __146__GEOMapDataSubscriptionManager_addSubscriptionWithIdentifier_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (void)_addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11
{
  -[GEOMapDataSubscriptionPersistence addSubscriptionWithIdentifier:auditToken:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:](self->_persistence, "addSubscriptionWithIdentifier:auditToken:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", a3, a4, a5, a6, a7, a8);
}

- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionPersistence removeSubscriptionWithIdentifier:callbackQueue:completionHandler:](self->_persistence, "removeSubscriptionWithIdentifier:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)fetchStateForSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionDownloadManager fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:](self->_downloadManager, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)_registerExternallyManagedDownloader:(id)a3
{
  id v4;
  uint8_t v5[16];

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEOMapDataSubscriptionDownloadManager registerExternallyManagedDownloader:](self->_downloadManager, "registerExternallyManagedDownloader:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(registerExternallyManagedDownloader:)]", v5, 2u);
  }

}

- (void)_externallyManagedDownloaderDidFinish:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint8_t v8[16];

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEOMapDataSubscriptionDownloadManager externallyManagedDownloaderDidFinish:withError:](self->_downloadManager, "externallyManagedDownloaderDidFinish:withError:", v6, v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(externallyManagedDownloaderDidFinish:withError:)]", v8, 2u);
  }

}

- (void)startDownloadForSubscriptionIdentifier:(id)a3 mode:(unint64_t)a4
{
  GEOMapDataSubscriptionDownloadManager *downloadManager;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  downloadManager = self->_downloadManager;
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionDownloadManager startDownloadForSubscriptionIdentifiers:mode:auditToken:](downloadManager, "startDownloadForSubscriptionIdentifiers:mode:auditToken:", v8, a4, 0, v9, v10);

}

- (void)startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
  -[GEOMapDataSubscriptionDownloadManager startDownloadForSubscriptionIdentifiers:mode:auditToken:](self->_downloadManager, "startDownloadForSubscriptionIdentifiers:mode:auditToken:", a3, a4, 0);
}

- (void)_startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  -[GEOMapDataSubscriptionDownloadManager startDownloadForSubscriptionIdentifiers:mode:auditToken:](self->_downloadManager, "startDownloadForSubscriptionIdentifiers:mode:auditToken:", a3, a4, a5);
}

- (void)cancelDownloadForSubscriptionIdentifier:(id)a3
{
  GEOMapDataSubscriptionDownloadManager *downloadManager;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  downloadManager = self->_downloadManager;
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionDownloadManager cancelDownloadForSubscriptionIdentifiers:](downloadManager, "cancelDownloadForSubscriptionIdentifiers:", v6, v7, v8);

}

- (void)cancelDownloadForSubscriptionIdentifiers:(id)a3
{
  -[GEOMapDataSubscriptionDownloadManager cancelDownloadForSubscriptionIdentifiers:](self->_downloadManager, "cancelDownloadForSubscriptionIdentifiers:", a3);
}

- (void)forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4
{
  -[GEOMapDataSubscriptionDownloadManager forceUpdateForUserInitiatedSubscriptionsForDataType:mode:auditToken:](self->_downloadManager, "forceUpdateForUserInitiatedSubscriptionsForDataType:mode:auditToken:", a3, a4, 0);
}

- (void)_forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  -[GEOMapDataSubscriptionDownloadManager forceUpdateForUserInitiatedSubscriptionsForDataType:mode:auditToken:](self->_downloadManager, "forceUpdateForUserInitiatedSubscriptionsForDataType:mode:auditToken:", a3, a4, a5);
}

- (void)_runAutomaticOfflineDataUpdateBackgroundTask:(id)a3
{
  id v4;
  uint8_t v5[16];

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEOMapDataSubscriptionDownloadManager runAutomaticOfflineDataUpdateBackgroundTask:](self->_downloadManager, "runAutomaticOfflineDataUpdateBackgroundTask:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(runAutomaticOfflineDataUpdateBackgroundTask:)]", v5, 2u);
  }

}

- (void)_runRetryOfflineDownloadBackgroundTask:(id)a3
{
  id v4;
  uint8_t v5[16];

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEOMapDataSubscriptionDownloadManager runRetryOfflineDownloadBackgroundTask:](self->_downloadManager, "runRetryOfflineDownloadBackgroundTask:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_downloadManager respondsToSelector:@selector(runRetryOfflineDownloadBackgroundTask:)]", v5, 2u);
  }

}

- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionDownloadManager fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:completionHandler:](self->_downloadManager, "fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:completionHandler:", a3, a4);
}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 dataTypes:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6
{
  return (id)-[GEOMapDataSubscriptionDownloadManager determineEstimatedSizeForSubscriptionWithRegion:dataTypes:queue:completionHandler:](self->_downloadManager, "determineEstimatedSizeForSubscriptionWithRegion:dataTypes:queue:completionHandler:", a3, a4, a5, a6);
}

- (void)_fetchSubscriptionsForSyncToWatch:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "pairingID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionManager _fetchSubscriptionsForSyncToWatchWithIdentifier:callbackQueue:completionHandler:](self, "_fetchSubscriptionsForSyncToWatchWithIdentifier:callbackQueue:completionHandler:", v10, v9, v8);

}

- (void)_fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionSyncManager fetchSubscriptionsForSyncToWatchWithIdentifier:callbackQueue:completionHandler:](self->_syncManager, "fetchSubscriptionsForSyncToWatchWithIdentifier:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)_fetchFullyDownloadedSubscriptionsOfType:(unint64_t)a3 includeOutOfDate:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  GEOMapDataSubscriptionManager *v16;
  id v17;
  unint64_t v18;
  BOOL v19;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E1C13DE8;
  v17 = v11;
  v18 = a3;
  v15 = v10;
  v16 = self;
  v19 = a4;
  v12 = v11;
  v13 = v10;
  -[GEOMapDataSubscriptionManager fetchAllSubscriptionsWithCallbackQueue:completionHandler:](self, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", v13, v14);

}

void __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id obj;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  NSObject *v30;
  _QWORD *v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = a3;
  v19 = v5;
  if (v5)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_3;
    v41[3] = &__block_descriptor_40_e32_B16__0__GEOMapDataSubscription_8l;
    v41[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "_geo_filtered:", v41, v5, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v6 = dispatch_group_create();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__79;
      v37[4] = __Block_byref_object_dispose__79;
      v38 = 0;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v21;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v34 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            dispatch_group_enter(v6);
            v12 = *(void **)(a1 + 40);
            objc_msgSend(v11, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(a1 + 32);
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_82;
            v27[3] = &unk_1E1C13D98;
            v31 = v37;
            v28 = v7;
            v29 = v11;
            v32 = *(_BYTE *)(a1 + 64);
            v30 = v6;
            objc_msgSend(v12, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v13, v14, v27);

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v8);
      }

      v15 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2_84;
      block[3] = &unk_1E1C13DC0;
      v25 = *(id *)(a1 + 48);
      v26 = v37;
      v24 = v7;
      v16 = v7;
      dispatch_group_notify(v6, v15, block);

      _Block_object_dispose(v37, 8);
    }
    else
    {
      v18 = *(NSObject **)(a1 + 32);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_4;
      v39[3] = &unk_1E1C01F48;
      v40 = *(id *)(a1 + 48);
      dispatch_async(v18, v39);
      v6 = v40;
    }

  }
  else
  {
    v17 = *(NSObject **)(a1 + 32);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2;
    v42[3] = &unk_1E1BFF970;
    v44 = *(id *)(a1 + 48);
    v43 = v20;
    dispatch_async(v17, v42);

  }
}

uint64_t __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

BOOL __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(_QWORD *)(a1 + 32) & objc_msgSend(a2, "dataTypes")) != 0;
}

uint64_t __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = objc_msgSend(v7, "loadState");
    if (v6 != 1)
    {
      if (v6 != 2)
        goto LABEL_8;
      goto LABEL_7;
    }
    if (*(_BYTE *)(a1 + 64))
LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __123__GEOMapDataSubscriptionManager__fetchFullyDownloadedSubscriptionsOfType_includeOutOfDate_callbackQueue_completionHandler___block_invoke_2_84(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[5];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v3 = 0;
  else
    v3 = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionPersistence calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:completionHandler:](self->_persistence, "calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:completionHandler:", a3, a4);
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  -[GEOMapDataSubscriptionSyncManager setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:](self->_syncManager, "setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:", a3, a4, a5, a6);
}

- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionSyncManager fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:](self->_syncManager, "fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:", a3, a4);
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifier:(id)a3 mode:(unint64_t)a4
{
  GEOMapDataSubscriptionSyncManager *syncManager;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  syncManager = self->_syncManager;
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionSyncManager startDownloadForPairedDeviceSubscriptionIdentifiers:mode:](syncManager, "startDownloadForPairedDeviceSubscriptionIdentifiers:mode:", v8, a4, v9, v10);

}

- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
  -[GEOMapDataSubscriptionSyncManager startDownloadForPairedDeviceSubscriptionIdentifiers:mode:](self->_syncManager, "startDownloadForPairedDeviceSubscriptionIdentifiers:mode:", a3, a4);
}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifier:(id)a3
{
  GEOMapDataSubscriptionSyncManager *syncManager;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  syncManager = self->_syncManager;
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionSyncManager cancelDownloadForPairedDeviceSubscriptionIdentifiers:](syncManager, "cancelDownloadForPairedDeviceSubscriptionIdentifiers:", v6, v7, v8);

}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3
{
  -[GEOMapDataSubscriptionSyncManager cancelDownloadForPairedDeviceSubscriptionIdentifiers:](self->_syncManager, "cancelDownloadForPairedDeviceSubscriptionIdentifiers:", a3);
}

- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionSyncManager fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:completionHandler:](self->_syncManager, "fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:completionHandler:", a3, a4);
}

- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionSyncManager fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:completionHandler:](self->_syncManager, "fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:completionHandler:", a3, a4);
}

- (void)_addStateObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_stateObservers, "registerObserver:", a3);
}

- (void)_removeStateObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_stateObservers, "unregisterObserver:", a3);
}

- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionSyncManager fetchStateForPairedDeviceSubscriptionWithIdentifier:callbackQueue:completionHandler:](self->_syncManager, "fetchStateForPairedDeviceSubscriptionWithIdentifier:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)_addStateObserver:(id)a3 forPairedDeviceSubscriptionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v8 = v7;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  geo_isolate_sync_data();
  if (*((_BYTE *)v14 + 24))
    -[GEOMapDataSubscriptionSyncManager beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:](self->_syncManager, "beginMonitoringStateForPairedDeviceSubscriptionWithIdentifier:", v8, v10, 3221225472, __93__GEOMapDataSubscriptionManager__addStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke, &unk_1E1C043D8, self, v8, v9, &v13);

  _Block_object_dispose(&v13, 8);
}

void __93__GEOMapDataSubscriptionManager__addStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  GEOObserverHashTable *v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v2 == 0;
  if (!v2)
  {
    if (!*(_QWORD *)(a1[4] + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = a1[4];
      v5 = *(void **)(v4 + 56);
      *(_QWORD *)(v4 + 56) = v3;

    }
    v6 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EE046C68, *(_QWORD *)(a1[4] + 16));
    objc_msgSend(*(id *)(a1[4] + 56), "setObject:forKeyedSubscript:", v6, a1[5]);
    v2 = v6;
  }
  v7 = v2;
  objc_msgSend(v2, "registerObserver:", a1[6]);

}

- (void)_removeStateObserver:(id)a3 forPairedDeviceSubscriptionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v8 = v7;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  geo_isolate_sync_data();
  if (*((_BYTE *)v14 + 24))
    -[GEOMapDataSubscriptionSyncManager endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:](self->_syncManager, "endMonitoringStateForPairedDeviceSubscriptionWithIdentifier:", v8, v10, 3221225472, __96__GEOMapDataSubscriptionManager__removeStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke, &unk_1E1C09428, self, v8, v9, &v13);

  _Block_object_dispose(&v13, 8);
}

void __96__GEOMapDataSubscriptionManager__removeStateObserver_forPairedDeviceSubscriptionWithIdentifier___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterObserver:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "hasObservers") ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[5]);

}

- (void)_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionSyncManager fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:completionHandler:](self->_syncManager, "fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:completionHandler:", a3, a4);
}

- (void)_handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionSyncManager handleSerializedPairedDeviceStateUpdate:callbackQueue:completionHandler:](self->_syncManager, "handleSerializedPairedDeviceStateUpdate:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)_handlePairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEOMapDataSubscriptionSyncManager handlePairedDeviceStateUpdate:callbackQueue:completionHandler:](self->_syncManager, "handlePairedDeviceStateUpdate:callbackQueue:completionHandler:", v8, v10, v9);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__GEOMapDataSubscriptionManager__handlePairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v12 = v9;
    dispatch_async(v10, block);

    v10 = v12;
  }

}

void __96__GEOMapDataSubscriptionManager__handlePairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOMapDataSubscriptionSyncManager setSerializedPairedDeviceSubscriptionsSummary:callbackQueue:completionHandler:](self->_syncManager, "setSerializedPairedDeviceSubscriptionsSummary:callbackQueue:completionHandler:", a3, a4, a5);
}

- (void)_setPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEOMapDataSubscriptionSyncManager setPairedDeviceSubscriptionsSummary:callbackQueue:completionHandler:](self->_syncManager, "setPairedDeviceSubscriptionsSummary:callbackQueue:completionHandler:", v8, v10, v9);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__GEOMapDataSubscriptionManager__setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v12 = v9;
    dispatch_async(v10, block);

    v10 = v12;
  }

}

void __102__GEOMapDataSubscriptionManager__setPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_setSubscriptionShouldSyncToPairedDeviceWithRequest:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest initWithData:]([GEOPairedDeviceConfigureSubscriptionShouldSyncRequest alloc], "initWithData:", v10);

  if (-[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest hasIdentifier](v11, "hasIdentifier"))
  {
    -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest identifier](v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest shouldSyncToPairedDevice](v11, "shouldSyncToPairedDevice");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke_2;
    v17[3] = &unk_1E1C03638;
    v14 = &v18;
    v18 = v9;
    v15 = v9;
    -[GEOMapDataSubscriptionManager setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:](self, "setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:", v12, v13, v8, v17);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v14 = &v20;
    v20 = v9;
    v16 = v9;
    dispatch_async(v8, block);
  }

}

void __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __117__GEOMapDataSubscriptionManager__setSubscriptionShouldSyncToPairedDeviceWithRequest_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  GEOPairedDeviceConfigureSubscriptionShouldSyncReply *v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = objc_alloc_init(GEOPairedDeviceConfigureSubscriptionShouldSyncReply);
    v3 = *(_QWORD *)(a1 + 32);
    -[GEOPairedDeviceConfigureSubscriptionShouldSyncReply data](v5, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  -[GEOMapDataSubscriptionSyncManager fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:completionHandler:](self->_syncManager, "fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:completionHandler:", a3, a4);
}

- (void)_setNeedsPairedDeviceStateSynchronization
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GEOMapDataSubscriptionSyncManager setNeedsPairedDeviceStateSynchronization](self->_syncManager, "setNeedsPairedDeviceStateSynchronization");
}

- (void)downloadManager:(id)a3 didUpdateState:(id)a4 forIdentifier:(id)a5
{
  -[GEOObserverHashTable subscriptionManager:didUpdateState:forIdentifier:](self->_stateObservers, "subscriptionManager:didUpdateState:forIdentifier:", self, a4, a5);
}

- (void)downloadManager:(id)a3 fetchShouldSyncToActivePairedDeviceForIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  GEOMapDataSubscriptionSyncManager *syncManager;
  void *v14;
  id *v15;
  NSObject *v16;
  NSObject *global_queue;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD block[4];
  id v24;

  v7 = a4;
  v8 = a5;
  if ((GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158) & 1) == 0)
  {
    qos_class_self();
    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v24 = v8;
    dispatch_async(global_queue, block);

    v10 = v24;
    goto LABEL_9;
  }
  if (!NanoRegistryLibraryCore())
  {
    v10 = 0;
LABEL_7:
    qos_class_self();
    v16 = geo_get_global_queue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_3;
    v18[3] = &unk_1E1C01F48;
    v15 = &v19;
    v19 = v8;
    dispatch_async(v16, v18);
    goto LABEL_8;
  }
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getActivePairedDeviceExcludingAltAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"));
  v12 = objc_msgSend(v10, "supportsCapability:", v11);

  if (!v12)
    goto LABEL_7;
  syncManager = self->_syncManager;
  qos_class_self();
  v14 = (void *)geo_get_global_queue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_2;
  v20[3] = &unk_1E1C06CC8;
  v15 = &v22;
  v22 = v8;
  v21 = v7;
  -[GEOMapDataSubscriptionSyncManager fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:](syncManager, "fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:", v14, v20);

  v16 = v21;
LABEL_8:

LABEL_9:
}

uint64_t __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32)));
}

uint64_t __116__GEOMapDataSubscriptionManager_downloadManager_fetchShouldSyncToActivePairedDeviceForIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscriptionPersistence:(id)a3 didAddSubscription:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GEOMapDataSubscriptionDownloadManager didAddSubscription:](self->_downloadManager, "didAddSubscription:", v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GEOMapDataSubscriptionSyncManager didAddSubscription:](self->_syncManager, "didAddSubscription:", v5);

}

- (void)subscriptionPersistence:(id)a3 didUpdateSubscriptionWithIdentifier:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GEOMapDataSubscriptionSyncManager didUpdateSubscriptionWithIdentifier:](self->_syncManager, "didUpdateSubscriptionWithIdentifier:", v5);

}

- (void)subscriptionPersistence:(id)a3 didRemoveSubscriptionWithIdentifier:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GEOMapDataSubscriptionDownloadManager didRemoveSubscriptionWithIdentifier:](self->_downloadManager, "didRemoveSubscriptionWithIdentifier:", v5);
  -[GEOMapDataSubscriptionPersistence pruneShiftEntries](self->_persistence, "pruneShiftEntries");

}

- (void)syncManager:(id)a3 didUpdatePairedDeviceState:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v8 = a3;
  v9 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__79;
  v15 = __Block_byref_object_dispose__79;
  v16 = 0;
  v10 = a5;
  geo_isolate_sync_data();
  objc_msgSend((id)v12[5], "subscriptionManager:didUpdatePairedDeviceState:forIdentifier:", self, v9, v10);

  _Block_object_dispose(&v11, 8);
}

void __86__GEOMapDataSubscriptionManager_syncManager_didUpdatePairedDeviceState_forIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)syncManager:(id)a3 fetchStateForSubscriptionWithIdentifier:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  -[GEOMapDataSubscriptionManager fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:](self, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceStateObservers, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_stateObservationQueue, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
