@implementation ATAssetLinkController

void __34__ATAssetLinkController_allAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allAssets
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
  v9 = __Block_byref_object_copy__700;
  v10 = __Block_byref_object_dispose__701;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__ATAssetLinkController_allAssets__block_invoke;
  v5[3] = &unk_1E928CCA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_723 != -1)
    dispatch_once(&sharedInstance_onceToken_723, &__block_literal_global_724);
  return (id)__sharedInstance;
}

- (ATAssetLinkController)init
{
  ATAssetLinkController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  uint64_t v9;
  NSHashTable *observers;
  uint64_t v11;
  NSMutableOrderedSet *assetLinks;
  uint64_t v13;
  NSMutableOrderedSet *assetQueue;
  uint64_t v15;
  NSMutableDictionary *activeTrackAssetsByAssetType;
  uint64_t v17;
  NSMutableDictionary *trackAssetsPendingInstallByAssetType;
  uint64_t v19;
  NSMutableDictionary *nonTrackAssetsPendingInstallByAssetType;
  uint64_t v21;
  NSMutableDictionary *progressBlocksForAssetsInFlight;
  uint64_t v23;
  NSMapTable *assetsToLinks;
  uint64_t v25;
  NSMapTable *assetsToFailedLinks;
  void *v27;
  NSObject *v28;
  unint64_t cachedThermalLevel;
  _BOOL4 currentNetworkIsCellularType;
  _BOOL4 isNetworkConstrained;
  uint64_t v32;
  MSVXPCTransaction *activeDownLoadsKeepAliveTransaction;
  objc_super v35;
  uint8_t buf[4];
  ATAssetLinkController *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)ATAssetLinkController;
  v2 = -[ATAssetLinkController init](&v35, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.amp.ATFoundation.ATAssetLinkController.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.amp.ATFoundation.ATAssetLinkController.callbackQueue", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    v11 = objc_opt_new();
    assetLinks = v2->_assetLinks;
    v2->_assetLinks = (NSMutableOrderedSet *)v11;

    v13 = objc_opt_new();
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (NSMutableOrderedSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    activeTrackAssetsByAssetType = v2->_activeTrackAssetsByAssetType;
    v2->_activeTrackAssetsByAssetType = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    trackAssetsPendingInstallByAssetType = v2->_trackAssetsPendingInstallByAssetType;
    v2->_trackAssetsPendingInstallByAssetType = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    nonTrackAssetsPendingInstallByAssetType = v2->_nonTrackAssetsPendingInstallByAssetType;
    v2->_nonTrackAssetsPendingInstallByAssetType = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    progressBlocksForAssetsInFlight = v2->_progressBlocksForAssetsInFlight;
    v2->_progressBlocksForAssetsInFlight = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    assetsToLinks = v2->_assetsToLinks;
    v2->_assetsToLinks = (NSMapTable *)v23;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    assetsToFailedLinks = v2->_assetsToFailedLinks;
    v2->_assetsToFailedLinks = (NSMapTable *)v25;

    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerObserver:", v2);
    v2->_cachedThermalLevel = objc_msgSend(v27, "currentThermalLevel");
    objc_msgSend(v27, "networkType");
    v2->_currentNetworkIsCellularType = ICEnvironmentNetworkTypeIsCellular();
    v2->_isNetworkConstrained = objc_msgSend(v27, "isNetworkConstrained");
    _ATLogCategoryFramework();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      cachedThermalLevel = v2->_cachedThermalLevel;
      currentNetworkIsCellularType = v2->_currentNetworkIsCellularType;
      isNetworkConstrained = v2->_isNetworkConstrained;
      *(_DWORD *)buf = 138544130;
      v37 = v2;
      v38 = 2048;
      v39 = cachedThermalLevel;
      v40 = 1024;
      v41 = currentNetworkIsCellularType;
      v42 = 1024;
      v43 = isNetworkConstrained;
      _os_log_impl(&dword_1D19F1000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ current thermal level=%llu, isCurrentNetworkCellularType=%d, _isNetworkConstrained=%d", buf, 0x22u);
    }

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D130]), "initWithName:", CFSTR("com.apple.amp.AirTraffic.ActiveDownloadsKeepAlive"));
    activeDownLoadsKeepAliveTransaction = v2->_activeDownLoadsKeepAliveTransaction;
    v2->_activeDownLoadsKeepAliveTransaction = (MSVXPCTransaction *)v32;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[MSVXPCTransaction isActive](self->_activeDownLoadsKeepAliveTransaction, "isActive"))
    -[MSVXPCTransaction endTransaction](self->_activeDownLoadsKeepAliveTransaction, "endTransaction");
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATAssetLinkController;
  -[ATAssetLinkController dealloc](&v4, sel_dealloc);
}

- (void)addAssetLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  ATAssetLinkController *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATAssetLinkController_addAssetLink___block_invoke;
  block[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeAssetLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  ATAssetLinkController *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ATAssetLinkController_removeAssetLink___block_invoke;
  block[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)allAssetLinks
{
  return (id)-[NSMutableOrderedSet set](self->_assetLinks, "set");
}

- (void)enqueueAssets:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *queue;
  id v17;
  __int128 v18;
  _QWORD block[4];
  id v20;
  ATAssetLinkController *v21;
  _BYTE *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE buf[24];
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCharging");

  _ATLogCategoryFramework();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing %lu assets:", buf, 0x16u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v24;
    *(_QWORD *)&v10 = 138543362;
    v18 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "setDeviceWasChargingWhenEnqueued:", v6, v18);
        _ATLogCategoryFramework();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_1D19F1000, v15, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v11);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v28 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ATAssetLinkController_enqueueAssets___block_invoke;
  block[3] = &unk_1E928CD60;
  v20 = v8;
  v21 = self;
  v22 = buf;
  v17 = v8;
  dispatch_async(queue, block);

  _Block_object_dispose(buf, 8);
}

- (void)enqueueAssets:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v15, "setProgressBlock:", v9);
        objc_msgSend(v15, "setCompletionBlock:", v10);
      }
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }
  -[ATAssetLinkController enqueueAssets:](self, "enqueueAssets:", v8);

}

- (void)enqueueAssetForStoreDownload:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ATAssetLinkController_enqueueAssetForStoreDownload_withCompletion___block_invoke;
  block[3] = &unk_1E928C578;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)prioritizeAsset:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ATAssetLinkController_prioritizeAsset___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)prioritizeAssetWithStoreForLibraryIdentifier:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  int64_t v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__700;
  v13[4] = __Block_byref_object_dispose__701;
  v14 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__ATAssetLinkController_prioritizeAssetWithStoreForLibraryIdentifier_withCompletion___block_invoke;
  v9[3] = &unk_1E928C5A0;
  v11 = v13;
  v12 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  _Block_object_dispose(v13, 8);
}

- (void)cancelAssets:(id)a3 withCompletion:(id)a4
{
  -[ATAssetLinkController cancelAssets:withError:completion:](self, "cancelAssets:withError:completion:", a3, 0, a4);
}

- (void)cancelAssets:(id)a3 withError:(id)a4 completion:(id)a5
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
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__ATAssetLinkController_cancelAssets_withError_completion___block_invoke;
  v15[3] = &unk_1E928C5C8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)cancelAllAssetsMatchingPredicate:(id)a3 excludeActiveDownloads:(BOOL)a4 withError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke;
  block[3] = &unk_1E928C5F0;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

- (BOOL)assetIsEnqueued:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ATAssetLinkController_assetIsEnqueued___block_invoke;
  block[3] = &unk_1E928CD60;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)filteredAssetsToDownloadForAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  ATAssetLinkController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__700;
  v17 = __Block_byref_object_dispose__701;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATAssetLinkController_filteredAssetsToDownloadForAssets___block_invoke;
  block[3] = &unk_1E928CD60;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)setPendingAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ATAssetLinkController_setPendingAssets___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATAssetLinkController_addObserver___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATAssetLinkController_removeObserver___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)installCompleteForAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATAssetLinkController *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__700;
  v14[4] = __Block_byref_object_dispose__701;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__700;
  v12[4] = __Block_byref_object_dispose__701;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATAssetLinkController_installCompleteForAssets___block_invoke;
  v7[3] = &unk_1E928C618;
  v8 = v4;
  v9 = self;
  v10 = v14;
  v11 = v12;
  v6 = v4;
  dispatch_async(queue, v7);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);

}

- (void)assetLink:(id)a3 didOpenWithPendingAssets:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ATAssetLinkController *v14;
  id v15;
  uint8_t buf[4];
  ATAssetLinkController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset link %{public}@ did open with pending assets %{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ATAssetLinkController_assetLink_didOpenWithPendingAssets___block_invoke;
  block[3] = &unk_1E928CD38;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)assetLink:(id)a3 didCloseWithOutstandingAssets:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ATAssetLinkController *v14;
  id v15;
  uint8_t buf[4];
  ATAssetLinkController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset link %{public}@ did close with outstanding assets %{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ATAssetLinkController_assetLink_didCloseWithOutstandingAssets___block_invoke;
  block[3] = &unk_1E928CD38;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

- (void)assetLink:(id)a3 didFinishAsset:(id)a4 error:(id)a5 retryable:(BOOL)a6
{
  -[ATAssetLinkController assetLink:didFinishAsset:error:retryable:cancelPendingAssetsInBatch:](self, "assetLink:didFinishAsset:error:retryable:cancelPendingAssetsInBatch:", a3, a4, a5, a6, 0);
}

- (void)assetLink:(id)a3 didFinishAsset:(id)a4 error:(id)a5 retryable:(BOOL)a6 cancelPendingAssetsInBatch:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__ATAssetLinkController_assetLink_didFinishAsset_error_retryable_cancelPendingAssetsInBatch___block_invoke;
  block[3] = &unk_1E928C640;
  block[4] = self;
  v19 = v12;
  v22 = a7;
  v20 = v13;
  v21 = v11;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  dispatch_async(queue, block);

}

- (void)assetLink:(id)a3 didPauseAsseDownload:(id)a4 error:(id)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ATAssetLinkController_assetLink_didPauseAsseDownload_error___block_invoke;
  block[3] = &unk_1E928CC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)assetLink:(id)a3 didUpdateAsset:(id)a4 progress:(double)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  ATAssetLinkController *v12;
  double v13;

  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke;
  block[3] = &unk_1E928C690;
  v13 = a5;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)assetLinkDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ATAssetLinkController_assetLinkDidChange___block_invoke;
  block[3] = &unk_1E928CC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)assetLink:(id)a3 didUpdateDownloadPauseReasonForAssets:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ATAssetLinkController_assetLink_didUpdateDownloadPauseReasonForAssets___block_invoke;
  v8[3] = &unk_1E928CDD8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATAssetLinkController *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ATAssetLinkController_environmentMonitorDidChangeThermalLevel___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATAssetLinkController *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ATAssetLinkController_environmentMonitorDidChangeNetworkType___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATAssetLinkController *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ATAssetLinkController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *callbackQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v8 = a4;
  v9 = a5;
  v10 = (void *)-[NSHashTable copy](self->_observers, "copy");
  callbackQueue = self->_callbackQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__ATAssetLinkController__performSelectorOnObservers_object_object___block_invoke;
  v15[3] = &unk_1E928C6B8;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v19 = a3;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(callbackQueue, v15);

}

- (void)_cancelAssets:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  NSMutableOrderedSet *assetQueue;
  void *v29;
  NSObject *v30;
  NSMutableOrderedSet *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *callbackQueue;
  id v46;
  id v47;
  void *v48;
  _QWORD block[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  ATAssetLinkController *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  NSMutableOrderedSet *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ATLogCategoryFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v63 = self;
    v64 = 2048;
    v65 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1D19F1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling %lu assets", buf, 0x16u);
  }

  if (objc_msgSend(v8, "count"))
  {
    v46 = v10;
    v48 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v47 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v58 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          v20 = -[NSMutableOrderedSet containsObject:](self->_assetQueue, "containsObject:", v19);
          -[NSMapTable objectForKey:](self->_assetsToLinks, "objectForKey:", v19);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if ((v20 & 1) != 0 || v21)
          {
            if (v21)
            {
              objc_msgSend(v13, "objectForKey:", v21);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                v25 = v24;
                objc_msgSend(v24, "addObject:", v19);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setObject:forKey:", v25, v22);
              }

            }
            objc_msgSend(v12, "addObject:", v19);
          }
          else
          {
            _ATLogCategoryFramework();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v63 = self;
              v64 = 2114;
              v65 = v19;
              _os_log_impl(&dword_1D19F1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ is not enqueued and will not be cancelled", buf, 0x16u);
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
      }
      while (v16);
    }

    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke;
    v55[3] = &unk_1E928C6E0;
    v26 = v48;
    v56 = v26;
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8230E64](v55);
    assetQueue = self->_assetQueue;
    objc_msgSend(v12, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObjectsInArray:](assetQueue, "removeObjectsInArray:", v29);

    _ATLogCategoryFramework_Oversize();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_assetQueue;
      *(_DWORD *)buf = 138544386;
      v63 = self;
      v64 = 2114;
      v65 = (uint64_t)v14;
      v66 = 2114;
      v67 = v26;
      v68 = 2114;
      v69 = v12;
      v70 = 2114;
      v71 = v31;
      _os_log_impl(&dword_1D19F1000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Request to cancel %{public}@ with error %{public}@ - will cancel %{public}@, pending assets %{public}@", buf, 0x34u);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v32 = v12;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v52 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
          -[NSMapTable removeObjectForKey:](self->_assetsToFailedLinks, "removeObjectForKey:", v37);
          -[NSMapTable removeObjectForKey:](self->_assetsToLinks, "removeObjectForKey:", v37);
          ((void (**)(_QWORD, uint64_t, id))v27)[2](v27, v37, v26);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATAssetLinkController _finishAsset:withError:](self, "_finishAsset:withError:", v37, v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v34);
    }

    objc_msgSend(v13, "keyEnumerator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "nextObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = (void *)v40;
      do
      {
        objc_msgSend(v13, "objectForKey:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _ATLogCategoryFramework_Oversize();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v63 = self;
          v64 = 2114;
          v65 = (uint64_t)v42;
          v66 = 2114;
          v67 = v41;
          _os_log_impl(&dword_1D19F1000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %{public}@ on link %{public}@", buf, 0x20u);
        }

        objc_msgSend(v41, "cancelAssets:", v42);
        objc_msgSend(v39, "nextObject");
        v44 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)v44;
      }
      while (v44);
    }
    -[ATAssetLinkController _assetsDidChange](self, "_assetsDidChange");

    v8 = v47;
    v9 = v48;
    v10 = v46;
  }
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke_49;
    block[3] = &unk_1E928C8F0;
    v50 = v10;
    dispatch_async(callbackQueue, block);

  }
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void (**v20)(_QWORD, _QWORD);
  NSMutableDictionary *nonTrackAssetsPendingInstallByAssetType;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  ATAssetLinkController *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!ATIsPendingDownloadError(v7))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v6, "queueStartTime");
    objc_msgSend(v6, "setQueueDuration:", v14 - v15);
    objc_msgSend(v6, "transferStartTime");
    if (v16 != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v18 = v17;
      objc_msgSend(v6, "transferStartTime");
      objc_msgSend(v6, "setTransferDuration:", v18 - v19);
    }
    -[NSMapTable removeObjectForKey:](self->_assetsToFailedLinks, "removeObjectForKey:", v6);
    objc_msgSend(v6, "assetType");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "assetParts") & 1) != 0)
    {
      -[NSMutableDictionary objectForKey:](self->_trackAssetsPendingInstallByAssetType, "objectForKey:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v23 = v24;
        objc_msgSend(v24, "addObject:", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_trackAssetsPendingInstallByAssetType, "setObject:forKey:", v23, v20);
      }
      -[NSMutableDictionary objectForKey:](self->_activeTrackAssetsByAssetType, "objectForKey:", v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeObject:", v6);

    }
    else
    {
      nonTrackAssetsPendingInstallByAssetType = self->_nonTrackAssetsPendingInstallByAssetType;
      objc_msgSend(v6, "assetType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](nonTrackAssetsPendingInstallByAssetType, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v23, "addObject:", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_nonTrackAssetsPendingInstallByAssetType;
        objc_msgSend(v6, "assetType");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v23, v31);

      }
    }

    -[NSMutableDictionary removeObjectForKey:](self->_progressBlocksForAssetsInFlight, "removeObjectForKey:", v6);
    objc_msgSend(v6, "setError:", v7);
    objc_msgSend(v6, "setAssetState:", 2);
    objc_msgSend(v6, "completionBlock");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v6, "completionBlock");
      v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v34)[2](v34, v6);

    }
    -[ATAssetLinkController _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_assetLinkController_didFinishAsset_, self, v6);
    +[ATStatusMonitor sharedMonitor](ATStatusMonitor, "sharedMonitor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "updateAssets:", v36);

    if (v7)
    {
      objc_msgSend(v7, "domain");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "isEqualToString:", CFSTR("ATError")))
        objc_msgSend(v7, "code");

    }
    ATReportEventIncrementingScalarKey();
    goto LABEL_30;
  }
  objc_msgSend(v6, "setAssetState:", 1);
  objc_msgSend(v6, "progressBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_progressBlocksForAssetsInFlight, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "progressBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v10, "addObject:", v12);

    }
    else
    {
      v25 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v6, "progressBlock");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "copy");
      objc_msgSend(v25, "arrayWithObject:", v27);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKey:](self->_progressBlocksForAssetsInFlight, "setObject:forKey:", v10, v6);
    }
    _ATLogCategoryFramework();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v40 = self;
      v41 = 2114;
      v42 = v6;
      _os_log_impl(&dword_1D19F1000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Added progress callback for pending asset %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "setError:", v7);
  objc_msgSend(v6, "completionBlock");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v6, "completionBlock");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v20)[2](v20, v6);
LABEL_30:

  }
}

- (void)_addFailedLink:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_assetsToFailedLinks, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_assetsToFailedLinks, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (BOOL)_canEnqueueAsset:(id)a3 onLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "canEnqueueAsset:", v6) && objc_msgSend(v7, "isOpen"))
  {
    -[NSMapTable objectForKey:](self->_assetsToFailedLinks, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = !v8 || (objc_msgSend(v8, "containsObject:", v7) & 1) == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_canEnqueueAsset:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_assetLinks;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (-[ATAssetLinkController _canEnqueueAsset:onLink:](self, "_canEnqueueAsset:onLink:", v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_handleEnqueue:(id)a3 onLink:(id)a4 withPriority:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  ATAssetLinkController *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  ATAssetLinkController *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  ATAssetLinkController *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v5 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "enqueueAssets:force:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "count"))
    {
      _ATLogCategoryFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v11, "count");
        v14 = objc_msgSend(v11, "count");
        v15 = CFSTR("assets");
        *(_DWORD *)buf = 138544130;
        v43 = 1024;
        v42 = self;
        if (v14 == 1)
          v15 = CFSTR("asset");
        v44 = v13;
        v45 = 2114;
        v46 = v15;
        v47 = 2114;
        v48 = v9;
        _os_log_impl(&dword_1D19F1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued %d %{public}@ on %{public}@:", buf, 0x26u);
      }
      v28 = self;
      v30 = v8;

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v29 = v11;
      v16 = v11;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v16);
            v21 = *(ATAssetLinkController **)(*((_QWORD *)&v35 + 1) + 8 * i);
            _ATLogCategoryFramework();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v42 = v21;
              _os_log_impl(&dword_1D19F1000, v22, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            -[ATAssetLinkController setTransferStartTime:](v21, "setTransferStartTime:");
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v18);
      }

      -[NSMutableOrderedSet removeObjectsInArray:](v28->_assetQueue, "removeObjectsInArray:", v16);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v23 = v16;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v32 != v26)
              objc_enumerationMutation(v23);
            if (v5)
              objc_msgSend(v9, "prioritizeAsset:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v25);
      }

      v8 = v30;
      v11 = v29;
    }

  }
}

- (void)_assetsDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSMutableOrderedSet *obj;
  uint64_t v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  ATAssetLinkController *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v28 = (void *)-[NSMutableOrderedSet copy](self->_assetQueue, "copy");
  if (-[NSMutableOrderedSet count](self->_assetQueue, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = self->_assetLinks;
    v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v39;
      v27 = *(_QWORD *)v39;
      do
      {
        v7 = 0;
        v29 = v5;
        do
        {
          if (*(_QWORD *)v39 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
          if (objc_msgSend(v8, "linkIsReady"))
          {
            v31 = v7;
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v10 = v28;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
            if (!v11)
              goto LABEL_32;
            v12 = v11;
            v13 = *(_QWORD *)v35;
            v32 = v9;
            while (1)
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v35 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
                if (-[ATAssetLinkController _canEnqueueAsset:onLink:](self, "_canEnqueueAsset:onLink:", v15, v8))
                {
                  -[NSMapTable objectForKey:](self->_assetsToLinks, "objectForKey:", v15);
                  v16 = objc_claimAutoreleasedReturnValue();
                  v17 = (void *)v16;
                  if (v16)
                    v18 = v16 == (_QWORD)v8;
                  else
                    v18 = 1;
                  if (v18)
                  {
                    -[NSMapTable setObject:forKey:](self->_assetsToLinks, "setObject:forKey:", v8, v15);
                    v19 = objc_msgSend(v15, "isPrioritized");
                    v20 = v9;
                    if ((v19 & 1) == 0)
                    {
                      if (self->_cachedThermalLevel >= -[ATAssetLinkController _getMaxThermalPressureThreshold](self, "_getMaxThermalPressureThreshold"))
                      {
                        v22 = v3;
                        _ATLogCategoryFramework();
                        v23 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138543618;
                          v43 = self;
                          v44 = 2114;
                          v45 = v15;
                          _os_log_impl(&dword_1D19F1000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ Not enqueuing %{public}@ due to thermal pressure.", buf, 0x16u);
                        }

                        v3 = v22;
                        v9 = v32;
                        if ((objc_msgSend(v15, "downloadPauseReason") & 1) != 0)
                          goto LABEL_21;
                        objc_msgSend(v15, "setDownloadPauseReason:", objc_msgSend(v15, "downloadPauseReason") | 1);
                        v20 = v3;
                      }
                      else
                      {
                        v21 = objc_msgSend(v15, "downloadPauseReason");
                        v20 = v33;
                        if ((v21 & 1) != 0)
                        {
                          objc_msgSend(v15, "setDownloadPauseReason:", objc_msgSend(v15, "downloadPauseReason") & 0xFFFFFFFFFFFFFFFELL);
                          objc_msgSend(v3, "addObject:", v15);
                          v20 = v33;
                        }
                      }
                    }
                    objc_msgSend(v20, "addObject:", v15);
                  }
LABEL_21:

                }
                ++v14;
              }
              while (v12 != v14);
              v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              v12 = v24;
              if (!v24)
              {
LABEL_32:

                -[ATAssetLinkController _handleEnqueue:onLink:withPriority:](self, "_handleEnqueue:onLink:withPriority:", v9, v8, 1);
                -[ATAssetLinkController _handleEnqueue:onLink:withPriority:](self, "_handleEnqueue:onLink:withPriority:", v33, v8, 0);

                v6 = v27;
                v5 = v29;
                v7 = v31;
                break;
              }
            }
          }
          ++v7;
        }
        while (v7 != v5);
        v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v3, "count"))
    {
      _ATLogCategoryFramework_Oversize();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = self;
        v44 = 2114;
        v45 = v3;
        _os_log_impl(&dword_1D19F1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Download paused reason changed for %{public}@", buf, 0x16u);
      }

      -[ATAssetLinkController _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_assetLinkController_didChangeDownloadStateForAssets_, self, v3);
    }
  }
  else
  {
    _ATLogCategoryFramework();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D19F1000, v26, OS_LOG_TYPE_DEFAULT, "No active downloads - posting ATAssetLinkControllerDidFinishAllAssets notification.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("ATAssetLinkControllerDidFinishAllAssets"), self);
  }

}

- (unint64_t)_getMaxThermalPressureThreshold
{
  void *v2;
  void *v3;
  double v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isWatch"))
  {
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentBatteryLevel");
    if (v4 <= 0.8)
      v5 = 20;
    else
      v5 = 30;

  }
  else
  {
    v5 = 30;
  }

  return v5;
}

- (void)_prioritizeAsset:(id)a3 onLinkClass:(Class)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  ATAssetLinkController *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMapTable objectForKey:](self->_assetsToLinks, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && !-[NSMutableOrderedSet containsObject:](self->_assetQueue, "containsObject:", v6))
    goto LABEL_28;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_assetLinks;
  v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v9)
  {
    v10 = v9;
    v20 = v7;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          _ATLogCategoryFramework();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            -[objc_class description](a4, "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v26 = self;
            v27 = 2114;
            v28 = v6;
            v29 = 2114;
            v30 = v13;
            v31 = 2114;
            v32 = v15;
            _os_log_impl(&dword_1D19F1000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Not prioritizing %{public}@ on %{public}@ - required link type:%{public}@", buf, 0x2Au);

          }
        }
        else if (-[ATAssetLinkController _canEnqueueAsset:onLink:](self, "_canEnqueueAsset:onLink:", v6, v13))
        {
          v33 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "enqueueAssets:force:", v16, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 && objc_msgSend(v17, "count"))
          {
            _ATLogCategoryFramework();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v26 = self;
              v27 = 2114;
              v28 = v13;
              v29 = 2114;
              v30 = v6;
              _os_log_impl(&dword_1D19F1000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued asset due to prioritization on %{public}@: %{public}@", buf, 0x20u);
            }

            v7 = v13;
            -[NSMutableOrderedSet removeObject:](self->_assetQueue, "removeObject:", v6);
            -[NSMapTable setObject:forKey:](self->_assetsToLinks, "setObject:forKey:", v7, v6);
          }
          else
          {
            _ATLogCategoryFramework();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v26 = self;
              v27 = 2114;
              v28 = v13;
              _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ couldn't enqueue prioritized asset on %{public}@ - move to top of the queue", buf, 0x16u);
            }

            -[NSMutableOrderedSet removeObject:](self->_assetQueue, "removeObject:", v6);
            -[NSMutableOrderedSet insertObject:atIndex:](self->_assetQueue, "insertObject:atIndex:", v6, 0);
            v7 = v20;
          }

          goto LABEL_27;
        }
      }
      v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
      if (v10)
        continue;
      break;
    }
    v7 = v20;
  }
LABEL_27:

  if (v7)
  {
LABEL_28:
    objc_msgSend(v7, "prioritizeAsset:", v6);

  }
}

- (void)dispatchBlockOnControllerQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (BOOL)_shouldReleaseKeepAliveTransaction
{
  int v3;
  NSObject *v4;
  int v6;
  ATAssetLinkController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableOrderedSet count](self->_assetQueue, "count") || -[NSMapTable count](self->_assetsToLinks, "count"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[MSVXPCTransaction isActive](self->_activeDownLoadsKeepAliveTransaction, "isActive");
    if (v3)
    {
      _ATLogCategoryFramework();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138543362;
        v7 = self;
        _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Done with all downloads - release keep alive transaction.", (uint8_t *)&v6, 0xCu);
      }

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_assetIsEnqueued:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSMutableDictionary *trackAssetsPendingInstallByAssetType;
  uint64_t v9;
  id v10;
  NSMutableDictionary *nonTrackAssetsPendingInstallByAssetType;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_assetQueue, "containsObject:", v4) & 1) != 0
    || (-[NSMapTable objectForKey:](self->_assetsToLinks, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = 1;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    trackAssetsPendingInstallByAssetType = self->_trackAssetsPendingInstallByAssetType;
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__ATAssetLinkController__assetIsEnqueued___block_invoke;
    v15[3] = &unk_1E928C708;
    v10 = v4;
    v16 = v10;
    v17 = &v18;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trackAssetsPendingInstallByAssetType, "enumerateKeysAndObjectsUsingBlock:", v15);
    if (*((_BYTE *)v19 + 24))
    {
      v6 = 1;
    }
    else
    {
      nonTrackAssetsPendingInstallByAssetType = self->_nonTrackAssetsPendingInstallByAssetType;
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __42__ATAssetLinkController__assetIsEnqueued___block_invoke_2;
      v12[3] = &unk_1E928C708;
      v13 = v10;
      v14 = &v18;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nonTrackAssetsPendingInstallByAssetType, "enumerateKeysAndObjectsUsingBlock:", v12);

      v6 = *((_BYTE *)v19 + 24) != 0;
    }

    _Block_object_dispose(&v18, 8);
  }

  return v6;
}

- (void)_updateCountsForFinishedTrackAssetTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSMutableDictionary *activeTrackAssetsByAssetType;
  NSMutableDictionary *trackAssetsPendingInstallByAssetType;
  NSObject *v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[4];
  ATAssetLinkController *v37;
  _BYTE buf[24];
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v25 = v4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_trackAssetsPendingInstallByAssetType, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          -[NSMutableDictionary objectForKey:](self->_activeTrackAssetsByAssetType, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (!(v12 | v14))
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v7);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          _ATLogCategoryFramework();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v19;
            _os_log_impl(&dword_1D19F1000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing all track assets of assetType %{public}@.", buf, 0x16u);
          }

          -[ATAssetLinkController _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_assetLinkController_didProcessAllTrackAssetsWithAssetType_, self, v19);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v16);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v39 = 0;
    v21 = MEMORY[0x1E0C809B0];
    activeTrackAssetsByAssetType = self->_activeTrackAssetsByAssetType;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke;
    v27[3] = &unk_1E928C730;
    v27[4] = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeTrackAssetsByAssetType, "enumerateKeysAndObjectsUsingBlock:", v27);
    trackAssetsPendingInstallByAssetType = self->_trackAssetsPendingInstallByAssetType;
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke_2;
    v26[3] = &unk_1E928C730;
    v26[4] = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trackAssetsPendingInstallByAssetType, "enumerateKeysAndObjectsUsingBlock:", v26);
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
    {
      _ATLogCategoryFramework();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 138543362;
        v37 = self;
        _os_log_impl(&dword_1D19F1000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing all track assets.", v36, 0xCu);
      }

      -[ATAssetLinkController _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_assetLinkControllerDidProcessAllTrackAssets_, self, 0);
    }
    _Block_object_dispose(buf, 8);

    v4 = v25;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDownLoadsKeepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressBlocksForAssetsInFlight, 0);
  objc_storeStrong((id *)&self->_nonTrackAssetsPendingInstallByAssetType, 0);
  objc_storeStrong((id *)&self->_trackAssetsPendingInstallByAssetType, 0);
  objc_storeStrong((id *)&self->_activeTrackAssetsByAssetType, 0);
  objc_storeStrong((id *)&self->_assetsToFailedLinks, 0);
  objc_storeStrong((id *)&self->_assetsToLinks, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
  objc_storeStrong((id *)&self->_assetLinks, 0);
}

uint64_t __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __42__ATAssetLinkController__assetIsEnqueued___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __42__ATAssetLinkController__assetIsEnqueued___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v3, "setAssetType:", CFSTR("Unknown"));
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v3, "error");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  return v8;
}

uint64_t __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__ATAssetLinkController__performSelectorOnObservers_object_object___block_invoke(uint64_t a1)
{
  id v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
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
          objc_msgSend(v7, "performSelector:withObject:withObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __72__ATAssetLinkController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isNetworkConstrained");
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 104) != (_DWORD)result)
  {
    v3 = result;
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(unsigned __int8 *)(v5 + 104);
      v7 = 138543874;
      v8 = v5;
      v9 = 1024;
      v10 = v6;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Network constraint changed old=%d, new=%d - resuming downloads", (uint8_t *)&v7, 0x18u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 104) = v3;
    return objc_msgSend(*(id *)(a1 + 40), "_assetsDidChange");
  }
  return result;
}

uint64_t __64__ATAssetLinkController_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "networkType");
  result = ICEnvironmentNetworkTypeIsCellular();
  v4 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v4 + 105) != (_DWORD)result)
  {
    *(_BYTE *)(v4 + 105) = result;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 105))
    {
      _ATLogCategoryFramework();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = 138543618;
        v8 = v6;
        v9 = 1024;
        v10 = v2;
        _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Network type=%d is not a cellular network - resuming downloads", (uint8_t *)&v7, 0x12u);
      }

      return objc_msgSend(*(id *)(a1 + 40), "_assetsDidChange");
    }
  }
  return result;
}

unint64_t __65__ATAssetLinkController_environmentMonitorDidChangeThermalLevel___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t result;
  uint64_t v4;
  unint64_t v5;
  NSObject *v8;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  result = objc_msgSend(*(id *)(a1 + 40), "_getMaxThermalPressureThreshold");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 96);
  if (v5 >= result && v2 < result)
  {
    _ATLogCategoryFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v10 = *(_QWORD *)(a1 + 40);
    v13 = 138543362;
    v14 = v10;
    v11 = "%{public}@ Thermal levels changed - resuming downloads";
    goto LABEL_15;
  }
  if (v5 >= result || v2 < result)
  {
    *(_QWORD *)(v4 + 96) = v2;
    return result;
  }
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138543362;
    v14 = v12;
    v11 = "%{public}@ Thermal levels changed - updating download paused reason for thermal reasons";
LABEL_15:
    _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
  }
LABEL_16:

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = v2;
  return objc_msgSend(*(id *)(a1 + 40), "_assetsDidChange");
}

uint64_t __73__ATAssetLinkController_assetLink_didUpdateDownloadPauseReasonForAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSelectorOnObservers:object:object:", sel_assetLinkController_didChangeDownloadStateForAssets_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__ATAssetLinkController_assetLinkDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_assetsDidChange");
}

void __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(double *)(a1 + 48);
  *(float *)&v2 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setDownloadProgress:", v2);
  objc_msgSend(*(id *)(a1 + 32), "progressBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "downloadProgress");
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_2;
  v11[3] = &unk_1E928C668;
  v10 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 40), "_performSelectorOnObservers:object:object:", sel_assetLinkController_didUpdateAsset_, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  +[ATStatusMonitor sharedMonitor](ATStatusMonitor, "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAssets:", v9);

}

void __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_3;
  v7[3] = &unk_1E928C940;
  v9 = v3;
  v8 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

id __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "downloadProgress");
  return (id)(*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __62__ATAssetLinkController_assetLink_didPauseAsseDownload_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_assetsDidChange");
}

void __93__ATAssetLinkController_assetLink_didFinishAsset_error_retryable_cancelPendingAssetsInBatch___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unsigned int v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _ATLogCategoryFramework_Oversize();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(unsigned __int8 *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      v64 = v4;
      v65 = 2114;
      v66 = v5;
      v67 = 2114;
      v68 = v6;
      v69 = 1024;
      LODWORD(v70) = v7;
      _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed %{public}@ with error: %{public}@, cancelPendingDownloadsInBatch=%{BOOL}u", buf, 0x26u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_addFailedLink:forAsset:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
      if (!*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(*(id *)(a1 + 40), "dataclass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Media")) & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "domain");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("ATError")))
            v10 = objc_msgSend(*(id *)(a1 + 48), "code") == 2;
          else
            v10 = 0;

          if (*(_QWORD *)(a1 + 48)
            && !v10
            && objc_msgSend(*(id *)(a1 + 32), "_canEnqueueAsset:", *(_QWORD *)(a1 + 40)))
          {
            _ATLogCategoryFramework();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = *(_QWORD *)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "shortDescription");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v64 = v32;
              v65 = 2114;
              v66 = (uint64_t)v33;
              _os_log_impl(&dword_1D19F1000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Failing over to a different link for asset %{public}@", buf, 0x16u);

            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
LABEL_13:
            if (!*(_BYTE *)(a1 + 64))
              goto LABEL_52;
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "assetType");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "dataclass");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "storeInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "endpointType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "integerValue");

            if (v15 && v16)
            {
              if (objc_msgSend(*(id *)(a1 + 40), "isRestore"))
              {
                objc_msgSend(*(id *)(a1 + 40), "storeInfo");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "appleID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  v57 = (void *)MEMORY[0x1E0CB3880];
                  v56 = objc_msgSend(*(id *)(a1 + 40), "assetParts");
                  v22 = objc_msgSend(*(id *)(a1 + 40), "isRestore");
                  objc_msgSend(*(id *)(a1 + 40), "storeInfo");
                  v23 = objc_claimAutoreleasedReturnValue();
                  -[NSObject appleID](v23, "appleID");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "predicateWithFormat:", CFSTR("variantOptions.AssetParts=%d and assetType=%@ and dataclass=%@ and isRestore=%d and storeInfo.appleID=%@ and storeInfo.endpointType=%@"), v56, v15, v16, v22, v24, v25);
                  v26 = objc_claimAutoreleasedReturnValue();

                }
                else if (v19 > 1)
                {
                  v36 = (void *)MEMORY[0x1E0CB3880];
                  v37 = objc_msgSend(*(id *)(a1 + 40), "assetParts");
                  v38 = objc_msgSend(*(id *)(a1 + 40), "isRestore");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
                  v23 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "predicateWithFormat:", CFSTR("variantOptions.AssetParts=%d and assetType=%@ and dataclass=%@ and isRestore=%d and storeInfo.endpointType=%@"), v37, v15, v16, v38, v23);
                  v26 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  _ATLogCategoryFramework();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    v34 = *(_QWORD *)(a1 + 32);
                    v35 = *(_QWORD *)(a1 + 40);
                    *(_DWORD *)buf = 138543618;
                    v64 = v34;
                    v65 = 2114;
                    v66 = v35;
                    _os_log_impl(&dword_1D19F1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ is missing appleID - will not cancel pending restore purchases", buf, 0x16u);
                  }
                  v26 = 0;
                }

              }
              else
              {
                v29 = (void *)MEMORY[0x1E0CB3880];
                v30 = objc_msgSend(*(id *)(a1 + 40), "assetParts");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "predicateWithFormat:", CFSTR("variantOptions.AssetParts=%d and assetType=%@ and dataclass=%@ and storeInfo.endpointType=%@"), v30, v15, v16, v21);
                v26 = objc_claimAutoreleasedReturnValue();
              }

              if (!v26)
                goto LABEL_51;
              v58 = v16;
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "array");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "filteredArrayUsingPredicate:", v26);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              v41 = v40;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v60;
                do
                {
                  for (i = 0; i != v43; ++i)
                  {
                    if (*(_QWORD *)v60 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
                    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v47 == *(void **)(a1 + 56))
                      objc_msgSend(v14, "addObject:", v46);

                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
                }
                while (v43);
              }

              if (objc_msgSend(v14, "count"))
              {
                _ATLogCategoryFramework();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = *(_QWORD *)(a1 + 32);
                  v50 = objc_msgSend(v14, "count");
                  v51 = *(_QWORD *)(a1 + 56);
                  v52 = objc_msgSend(v41, "count");
                  *(_DWORD *)buf = 138413058;
                  v64 = v49;
                  v65 = 2048;
                  v66 = v50;
                  v67 = 2114;
                  v68 = v51;
                  v69 = 2048;
                  v70 = v52;
                  _os_log_impl(&dword_1D19F1000, v48, OS_LOG_TYPE_DEFAULT, "%@ Cancel %ld pending downloads on link=%{public}@, assetsMatchingCancelPredicate count=%ld", buf, 0x2Au);
                }

                v53 = *(void **)(a1 + 32);
                objc_msgSend(v14, "allObjects");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "_cancelAssets:withError:completion:", v54, v55, 0);

              }
              v16 = v58;
            }
            else
            {
              _ATLogCategoryFramework();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = *(_QWORD *)(a1 + 32);
                v28 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 138412546;
                v64 = v27;
                v65 = 2114;
                v66 = v28;
                _os_log_impl(&dword_1D19F1000, v26, OS_LOG_TYPE_DEFAULT, "%@ Ignoring cancelPendingDownloadsInBatch flag. Assset=%{public}@ has invalid assetType/dataClass", buf, 0x16u);
              }
            }

LABEL_51:
LABEL_52:
            objc_msgSend(*(id *)(a1 + 32), "_assetsDidChange");
            if (objc_msgSend(*(id *)(a1 + 32), "_shouldReleaseKeepAliveTransaction"))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "endTransaction");
            return;
          }
        }
        else
        {

        }
      }
    }
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_finishAsset:withError:", v12, v13);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    goto LABEL_13;
  }
}

void __65__ATAssetLinkController_assetLink_didCloseWithOutstandingAssets___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "setDelegate:", 0);
  objc_msgSend(*((id *)a1[5] + 1), "removeObject:", a1[4]);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = a1[6];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(*((id *)a1[5] + 3), "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(*((id *)a1[5] + 3), "removeObjectForKey:", v7);
          objc_msgSend(*((id *)a1[5] + 2), "addObject:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v4);
  }

  v9 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = *((id *)a1[5] + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        if ((objc_msgSend(a1[5], "_canEnqueueAsset:", v15) & 1) == 0)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v12);
  }

  _ATLogCategoryFramework();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = a1[5];
    *(_DWORD *)buf = 138543618;
    v40 = v17;
    v41 = 2114;
    v42 = v9;
    _os_log_impl(&dword_1D19F1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failing %{public}@ assets we no longer have a link for", buf, 0x16u);
  }

  objc_msgSend(*((id *)a1[5] + 2), "removeObjectsInArray:", v9);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k);
        v24 = a1[5];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 8, 0, (_QWORD)v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_finishAsset:withError:", v23, v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  objc_msgSend(a1[5], "_assetsDidChange");
}

uint64_t __60__ATAssetLinkController_assetLink_didOpenWithPendingAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_assetsDidChange");
}

uint64_t __50__ATAssetLinkController_installCompleteForAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "assetParts");
        v9 = *(_QWORD *)(a1 + 40);
        if ((v8 & 1) != 0)
        {
          v13 = *(void **)(v9 + 48);
          objc_msgSend(v7, "assetType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v12, "containsObject:", v7))
            goto LABEL_12;
          objc_msgSend(v12, "removeObject:", v7);
          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v7, "assetType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
        else
        {
          v10 = *(void **)(v9 + 56);
          objc_msgSend(v7, "assetType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v12, "containsObject:", v7))
            goto LABEL_12;
          objc_msgSend(v12, "removeObject:", v7);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
LABEL_12:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v4);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(a1 + 40), "_performSelectorOnObservers:object:object:", sel_assetLinkController_didProcessFinishedAsset_, *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_updateCountsForFinishedTrackAssetTypes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __40__ATAssetLinkController_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__ATAssetLinkController_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__ATAssetLinkController_setPendingAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSelectorOnObservers:object:object:", sel_assetLinkController_didChangeDownloadStateForAssets_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __59__ATAssetLinkController_filteredAssetsToDownloadForAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "_assetIsEnqueued:", v7, (_QWORD)v8) & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __41__ATAssetLinkController_assetIsEnqueued___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_assetIsEnqueued:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework_Oversize();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    v20 = v3;
    v21 = 2114;
    v22 = v4;
    v23 = 1024;
    v24 = v5;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling assets matching predicate %{public}@. excludeActiveDownloads=%{BOOL}u", buf, 0x1Cu);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
  v12 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_30;
  v16[3] = &unk_1E928CE78;
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v17 = v6;
  v18 = v14;
  v16[4] = *(_QWORD *)(a1 + 32);
  v15 = v6;
  objc_msgSend(v12, "_cancelAssets:withError:completion:", v15, v13, v16);

}

void __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_30(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_2;
    v4[3] = &unk_1E928C940;
    v5 = v2;
    v6 = *(id *)(a1 + 48);
    dispatch_async(v3, v4);

  }
}

void __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "assetType", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v2, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = v10;
            objc_msgSend(v10, "addObject:", v8);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKey:", v11, v9);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __59__ATAssetLinkController_cancelAssets_withError_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAssets:withError:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __85__ATAssetLinkController_prioritizeAssetWithStoreForLibraryIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
      objc_msgSend(v7, "identifier", (_QWORD)v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "longLongValue");
      v10 = *(_QWORD *)(a1 + 56);

      if (v9 == v10)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v7;

    if (!v11)
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 32), "_prioritizeAsset:onLinkClass:", v11, getATStoreMediaAssetLinkClass());
    if ((objc_msgSend(v11, "isPrioritized") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    _ATLogCategoryFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2048;
      v26 = v15;
      _os_log_impl(&dword_1D19F1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ asset with libraryIdentifier:%lld is not enqueued and cannot be prioritized", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 23, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = 0;
LABEL_16:
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v12;

  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __41__ATAssetLinkController_prioritizeAsset___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "member:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_2:
    -[NSObject setIsPrioritized:](v3, "setIsPrioritized:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_prioritizeAsset:onLinkClass:", v3, 0);
    goto LABEL_3;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (!v4)
  {
LABEL_15:

    goto LABEL_19;
  }
  v5 = v4;
  v6 = *(_QWORD *)v32;
LABEL_6:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v32 != v6)
      objc_enumerationMutation(obj);
    v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
    objc_msgSend(v8, "dataclass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dataclass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) == 0)
    {

      goto LABEL_13;
    }
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
      break;
LABEL_13:
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v5)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  v3 = v8;
  _ATLogCategoryFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v16;
    v37 = 2114;
    v38 = v17;
    _os_log_impl(&dword_1D19F1000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Found unenqueued asset %{public}@", buf, 0x16u);
  }

  if (v3)
    goto LABEL_2;
LABEL_19:
  v18 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "dataclass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateWithFormat:", CFSTR("dataclass=%@ and identifier=%@"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "keyEnumerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v24, "count"))
  {

    goto LABEL_25;
  }
  objc_msgSend(v24, "objectAtIndex:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  _ATLogCategoryFramework();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v26;
    v37 = 2114;
    v38 = v27;
    _os_log_impl(&dword_1D19F1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Found asset %{public}@ enqueued on a link", buf, 0x16u);
  }

  if (v3)
    goto LABEL_2;
LABEL_25:
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v28;
    v37 = 2114;
    v38 = v29;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ asset %{public}@ is not enqueued and cannot be prioritized", buf, 0x16u);
  }
LABEL_3:

}

void __69__ATAssetLinkController_enqueueAssetForStoreDownload_withCompletion___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = *(id *)(a1[4] + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v40;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "longLongValue");
      v10 = a1[6];

      if (v9 == v10)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v7;

    if (!v11)
      goto LABEL_20;
    getATStoreMediaAssetLinkClass();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = *(id *)(a1[4] + 8);
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
LABEL_13:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
          if (v14)
            goto LABEL_13;
          goto LABEL_23;
        }
      }
      v22 = objc_msgSend(v17, "linkIsReady", (_QWORD)v35);
      v23 = objc_msgSend(v17, "canEnqueueAsset:", v11);
      if (v22)
        v24 = v23 == 0;
      else
        v24 = 1;
      if (!v24)
      {
        v51 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v17, "enqueueAssets:force:", v29, 1);

        _ATLogCategoryFramework();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v33 = a1[4];
          v34 = a1[6];
          *(_DWORD *)buf = 138543618;
          v44 = v33;
          v45 = 2048;
          v46 = v34;
          _os_log_impl(&dword_1D19F1000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ asset with libraryIdentifier:%lld enqueued on the store link", buf, 0x16u);
        }

        v20 = 0;
        goto LABEL_24;
      }
      v25 = v23;
      _ATLogCategoryFramework();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = a1[4];
        v28 = a1[6];
        *(_DWORD *)buf = 138544130;
        v44 = v27;
        v45 = 2048;
        v46 = v28;
        v47 = 1024;
        v48 = v22;
        v49 = 1024;
        v50 = v25;
        _os_log_impl(&dword_1D19F1000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot enqueue asset with libraryIdentifier:%lld on the store link - ready:%d, canEnqueue:%d", buf, 0x22u);
      }

    }
  }
  else
  {
LABEL_9:

LABEL_20:
    _ATLogCategoryFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = a1[4];
      v19 = a1[6];
      *(_DWORD *)buf = 138543618;
      v44 = v18;
      v45 = 2048;
      v46 = v19;
      _os_log_impl(&dword_1D19F1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ asset with libraryIdentifier:%lld is not enqueued for download with ATC", buf, 0x16u);
    }
    v11 = 0;
  }
LABEL_23:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v21 = a1[5];
  if (v21)
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v20);

}

uint64_t __39__ATAssetLinkController_enqueueAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v32;
    *(_QWORD *)&v4 = 138543362;
    v30 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D8230CE4]();
        if (objc_msgSend(*(id *)(a1 + 40), "_assetIsEnqueued:", v8))
        {
          if ((objc_msgSend(v8, "isRestore") & 1) == 0)
          {
            _ATLogCategoryFramework();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v30;
              v36 = v8;
              _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ is already enqueued and is not marked for restore - ignoring for now", buf, 0xCu);
            }

            v11 = *(void **)(a1 + 40);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 32, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_finishAsset:withError:", v8, v12);

            goto LABEL_30;
          }
        }
        else
        {
          ATReportEventIncrementingScalarKey();
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          objc_msgSend(v8, "setQueueStartTime:");
        }
        objc_msgSend(v8, "assetType", v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v8, "setAssetType:", CFSTR("Unknown"));
        if (objc_msgSend(*(id *)(a1 + 40), "_canEnqueueAsset:", v8))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v8);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          if ((objc_msgSend(v8, "assetParts") & 1) != 0)
          {
            v14 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
            objc_msgSend(v8, "assetType");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v16, "addObject:", v8);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
              objc_msgSend(v8, "assetType");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKey:", v16, v26);

            }
          }
          objc_msgSend(*(id *)(a1 + 40), "_performSelectorOnObservers:object:object:", sel_assetLinkController_didEnqueueAsset_, *(_QWORD *)(a1 + 40), v8);
        }
        else
        {
          if (objc_msgSend(v8, "isRestore") && objc_msgSend(v8, "isDownload"))
          {
            _ATLogCategoryFramework();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v36 = v18;
              v37 = 2114;
              v38 = v8;
              _os_log_impl(&dword_1D19F1000, v17, OS_LOG_TYPE_ERROR, "%{public}@ No asset links to handle %{public}@ - treating asset restore as unrecoverable", buf, 0x16u);
            }

            v19 = *(void **)(a1 + 40);
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = 26;
          }
          else
          {
            _ATLogCategoryFramework();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v36 = v23;
              v37 = 2114;
              v38 = v8;
              _os_log_impl(&dword_1D19F1000, v22, OS_LOG_TYPE_ERROR, "%{public}@ No asset links to handle %{public}@ - treating as connection failure", buf, 0x16u);
            }

            v19 = *(void **)(a1 + 40);
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = 8;
          }
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v21, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_finishAsset:withError:", v8, v24);

        }
LABEL_30:
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v5);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "isActive") & 1) == 0)
  {
    _ATLogCategoryFramework();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_impl(&dword_1D19F1000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning transaction to keep atc alive for active downloads", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "beginTransaction");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_assetsDidChange", v30);
}

uint64_t __41__ATAssetLinkController_removeAssetLink___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __38__ATAssetLinkController_addAssetLink___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sortUsingComparator:", &__block_literal_global_15);
}

uint64_t __38__ATAssetLinkController_addAssetLink___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "priority");
  v6 = objc_msgSend(v4, "priority");

  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

void __39__ATAssetLinkController_sharedInstance__block_invoke()
{
  ATAssetLinkController *v0;
  void *v1;

  v0 = objc_alloc_init(ATAssetLinkController);
  v1 = (void *)__sharedInstance;
  __sharedInstance = (uint64_t)v0;

}

@end
