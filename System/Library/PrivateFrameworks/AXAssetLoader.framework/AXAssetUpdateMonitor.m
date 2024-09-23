@implementation AXAssetUpdateMonitor

+ (id)assetMonitorWithPolicy:(id)a3
{
  id v3;
  AXAssetUpdateMonitor *v4;
  id v5;

  v3 = a3;
  v4 = [AXAssetUpdateMonitor alloc];
  v5 = -[AXAssetUpdateMonitor _initWithAssetPolicy:qosClass:targetQueue:](v4, "_initWithAssetPolicy:qosClass:targetQueue:", v3, 33, MEMORY[0x1E0C80D38]);

  return v5;
}

+ (id)assetMonitorWithPolicy:(id)a3 qosClass:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  AXAssetUpdateMonitor *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = [AXAssetUpdateMonitor alloc];
  v7 = -[AXAssetUpdateMonitor _initWithAssetPolicy:qosClass:targetQueue:](v6, "_initWithAssetPolicy:qosClass:targetQueue:", v5, v4, MEMORY[0x1E0C80D38]);

  return v7;
}

+ (id)assetMonitorWithPolicy:(id)a3 qosClass:(unsigned int)a4 targetQueue:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = -[AXAssetUpdateMonitor _initWithAssetPolicy:qosClass:targetQueue:]([AXAssetUpdateMonitor alloc], "_initWithAssetPolicy:qosClass:targetQueue:", v8, v5, v7);

  return v9;
}

- (id)_initWithAssetPolicy:(id)a3 qosClass:(unsigned int)a4 targetQueue:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  AXAssetUpdateMonitor *v10;
  uint64_t v11;
  NSHashTable *updateObservers;
  uint64_t v13;
  AXAssetController *assetController;
  OS_dispatch_queue *v15;
  NSObject *workerQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *v19;
  objc_super v21;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AXAssetUpdateMonitor;
  v10 = -[AXAssetUpdateMonitor init](&v21, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    updateObservers = v10->_updateObservers;
    v10->_updateObservers = (NSHashTable *)v11;

    +[AXAssetController assetControllerWithPolicy:qosClass:](AXAssetController, "assetControllerWithPolicy:qosClass:", v8, v6);
    v13 = objc_claimAutoreleasedReturnValue();
    assetController = v10->_assetController;
    v10->_assetController = (AXAssetController *)v13;

    -[AXAssetController addObserver:](v10->_assetController, "addObserver:", v10);
    if (v9)
    {
      v15 = (OS_dispatch_queue *)v9;
      workerQueue = v10->_workerQueue;
      v10->_workerQueue = v15;
    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)v6, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      workerQueue = objc_claimAutoreleasedReturnValue();

      v18 = dispatch_queue_create("AXAssetUpdateMonitor", workerQueue);
      v19 = v10->_workerQueue;
      v10->_workerQueue = (OS_dispatch_queue *)v18;

    }
    -[AXAssetUpdateMonitor logInfo:](v10, "logInfo:", CFSTR("setting up asset update monitor"));
  }

  return v10;
}

- (void)logInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogAssetLoader();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AXAssetUpdateMonitor assetPolicy](self, "assetPolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "[%@]: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXAssetUpdateMonitor assetPolicy](self, "assetPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXAssetUpdateMonitor<%p>, %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (AXAssetPolicy)assetPolicy
{
  return -[AXAssetController assetPolicy](self->_assetController, "assetPolicy");
}

- (BOOL)userInitiated
{
  return -[AXAssetController userInitiated](self->_assetController, "userInitiated");
}

- (void)setUserInitiated:(BOOL)a3
{
  -[AXAssetController setUserInitiated:](self->_assetController, "setUserInitiated:", a3);
}

- (BOOL)hasInProgressDownloads
{
  return -[AXAssetController hasInProgressDownloads](self->_assetController, "hasInProgressDownloads");
}

- (void)refreshAssetsAfterDelay:(double)a3
{
  NSObject *workerQueue;
  _QWORD v4[6];

  workerQueue = self->_workerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AXAssetUpdateMonitor_refreshAssetsAfterDelay___block_invoke;
  v4[3] = &unk_1E95D3A58;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workerQueue, v4);
}

uint64_t __48__AXAssetUpdateMonitor_refreshAssetsAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workerQueue_refreshAssetsAfterDelay:canRefreshCatalog:", 1, *(double *)(a1 + 40));
}

- (void)stop
{
  NSObject *workerQueue;
  _QWORD block[5];

  -[AXAssetUpdateMonitor logInfo:](self, "logInfo:", CFSTR("stopping refresh timer"));
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__AXAssetUpdateMonitor_stop__block_invoke;
  block[3] = &unk_1E95D3A80;
  block[4] = self;
  dispatch_async(workerQueue, block);
}

uint64_t __28__AXAssetUpdateMonitor_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel");
}

- (void)addUpdateObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__AXAssetUpdateMonitor_addUpdateObserver___block_invoke;
    v7[3] = &unk_1E95D3AA8;
    v7[4] = self;
    v6 = v4;
    v8 = v6;
    v9 = &v10;
    -[AXAssetUpdateMonitor _performWithinLock:](self, "_performWithinLock:", v7);
    -[AXAssetController addObserver:](self->_assetController, "addObserver:", v6);
    if (v11[5])
      objc_msgSend(v6, "assetUpdateMonitor:installedAssetsDidChange:", self);

    _Block_object_dispose(&v10, 8);
  }

}

void __42__AXAssetUpdateMonitor_addUpdateObserver___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "addObject:", a1[5]);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
}

- (void)removeUpdateObserver:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  AXAssetUpdateMonitor *v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __45__AXAssetUpdateMonitor_removeUpdateObserver___block_invoke;
  v9 = &unk_1E95D3AD0;
  v10 = self;
  v11 = v4;
  v5 = v4;
  -[AXAssetUpdateMonitor _performWithinLock:](self, "_performWithinLock:", &v6);
  -[AXAssetController removeObserver:](self->_assetController, "removeObserver:", v5, v6, v7, v8, v9, v10);

}

uint64_t __45__AXAssetUpdateMonitor_removeUpdateObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_updateCachedInstalledAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__AXAssetUpdateMonitor__updateCachedInstalledAssets___block_invoke;
  v14[3] = &unk_1E95D3AA8;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  v16 = &v17;
  -[AXAssetUpdateMonitor _performWithinLock:](self, "_performWithinLock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v18[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetUpdateMonitor:installedAssetsDidChange:", self, v5, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

void __53__AXAssetUpdateMonitor__updateCachedInstalledAssets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_performWithinLock:(id)a3
{
  os_unfair_lock_s *p_assetsLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_assetsLock = &self->_assetsLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_assetsLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_assetsLock);
  }
}

- (void)_workerQueue_refreshAssetsAfterDelay:(double)a3 canRefreshCatalog:(BOOL)a4
{
  AXDispatchTimer *refreshDispatchTimer;
  AXDispatchTimer *v8;
  AXDispatchTimer *v9;
  void *v10;
  AXDispatchTimer *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  refreshDispatchTimer = self->_refreshDispatchTimer;
  if (!refreshDispatchTimer)
  {
    v8 = (AXDispatchTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", 0);
    v9 = self->_refreshDispatchTimer;
    self->_refreshDispatchTimer = v8;

    refreshDispatchTimer = self->_refreshDispatchTimer;
  }
  -[AXDispatchTimer cancel](refreshDispatchTimer, "cancel");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("refreshing assets after delay: %.1f seconds"), *(_QWORD *)&a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetUpdateMonitor logInfo:](self, "logInfo:", v10);

  objc_initWeak(&location, self);
  v11 = self->_refreshDispatchTimer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__AXAssetUpdateMonitor__workerQueue_refreshAssetsAfterDelay_canRefreshCatalog___block_invoke;
  v12[3] = &unk_1E95D3AF8;
  objc_copyWeak(&v13, &location);
  v14 = a4;
  -[AXDispatchTimer afterDelay:processBlock:](v11, "afterDelay:processBlock:", v12, a3);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __79__AXAssetUpdateMonitor__workerQueue_refreshAssetsAfterDelay_canRefreshCatalog___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "assetController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, *(unsigned __int8 *)(a1 + 40), 0, 0);

}

- (id)_purgeUnneededAssetsFromInstalledAssets:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("installed assets: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetUpdateMonitor logInfo:](self, "logInfo:", v6);

  -[AXAssetUpdateMonitor assetPolicy](self, "assetPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsToPurgeFromInstalledAssets:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectsInArray:", v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("keeping assets: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetUpdateMonitor logInfo:](self, "logInfo:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("purging assets: %@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetUpdateMonitor logInfo:](self, "logInfo:", v11);

  if (objc_msgSend(v8, "count"))
    -[AXAssetController purgeAssets:completion:](self->_assetController, "purgeAssets:completion:", v8, 0);

  return v9;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AXAssetController *assetController;
  _QWORD v24[4];
  id v25[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5)
  {
    objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAssetUpdateMonitor _purgeUnneededAssetsFromInstalledAssets:](self, "_purgeUnneededAssetsFromInstalledAssets:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXAssetUpdateMonitor _updateCachedInstalledAssets:](self, "_updateCachedInstalledAssets:", v14);
    -[AXAssetUpdateMonitor assetPolicy](self, "assetPolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetsToDownloadFromRefreshedAssets:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assets to download: %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAssetUpdateMonitor logInfo:](self, "logInfo:", v17);

    v18 = objc_msgSend(v16, "count");
    -[AXAssetController assetPolicy](self->_assetController, "assetPolicy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      objc_msgSend(v19, "downloadRetryInterval");
      v22 = v21;

      objc_initWeak(&location, self);
      assetController = self->_assetController;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __86__AXAssetUpdateMonitor_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2;
      v24[3] = &unk_1E95D3B20;
      objc_copyWeak(v25, &location);
      v25[1] = v22;
      -[AXAssetController downloadAssets:successStartBlock:](assetController, "downloadAssets:successStartBlock:", v16, v24);
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v19, "updateInterval");
      -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:");

    }
  }
  else
  {
    -[AXAssetController assetPolicy](self->_assetController, "assetPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "refreshRetryInterval");
    -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:");
  }

}

uint64_t __86__AXAssetUpdateMonitor_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled");
}

void __86__AXAssetUpdateMonitor_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "refreshAssetsAfterDelay:", *(double *)(a1 + 40));

  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  id v15;

  v9 = a5;
  v15 = a3;
  v12 = a4;
  v13 = a6;
  if (!a7)
  {
    if (v9)
    {
      -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:", 0.0);
    }
    else
    {
      -[AXAssetController assetPolicy](self->_assetController, "assetPolicy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refreshRetryInterval");
      -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:");

    }
  }

}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_refreshDispatchTimer, 0);
  objc_storeStrong((id *)&self->_cachedInstalledAssets, 0);
  objc_storeStrong((id *)&self->_updateObservers, 0);
}

@end
