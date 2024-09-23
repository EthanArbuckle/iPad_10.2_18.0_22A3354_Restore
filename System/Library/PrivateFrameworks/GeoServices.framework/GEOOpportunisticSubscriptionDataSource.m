@implementation GEOOpportunisticSubscriptionDataSource

+ (unint64_t)policy
{
  return 0;
}

- (GEOOpportunisticSubscriptionDataSource)initWithSessionIdentifier:(id)a3 diskCache:(id)a4 subscriptionManager:(id)a5 manifestManager:(id)a6 requestCounter:(id)a7 requestCounterPolicy:(unsigned __int8)a8 tileRequesterCreationBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  GEOOpportunisticSubscriptionDataSource *v20;
  uint64_t v21;
  NSString *sessionIdentifier;
  GEOMapDataSubscriptionManager *v23;
  GEOMapDataSubscriptionManager *subscriptionManager;
  GEOResourceManifestManager *v25;
  GEOResourceManifestManager *manifestManager;
  uint64_t v27;
  id tileRequesterCreationBlock;
  uint64_t v29;
  OS_dispatch_queue *workQueue;
  dispatch_group_t v31;
  OS_dispatch_group *preparationGroup;
  GEOOpportunisticSubscriptionDataSource *v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)GEOOpportunisticSubscriptionDataSource;
  v20 = -[GEOOpportunisticSubscriptionDataSource init](&v35, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    sessionIdentifier = v20->_sessionIdentifier;
    v20->_sessionIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_diskCache, a4);
    if (v16)
    {
      v23 = (GEOMapDataSubscriptionManager *)v16;
    }
    else
    {
      +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
      v23 = (GEOMapDataSubscriptionManager *)objc_claimAutoreleasedReturnValue();
    }
    subscriptionManager = v20->_subscriptionManager;
    v20->_subscriptionManager = v23;

    if (v17)
    {
      v25 = (GEOResourceManifestManager *)v17;
    }
    else
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v25 = (GEOResourceManifestManager *)objc_claimAutoreleasedReturnValue();
    }
    manifestManager = v20->_manifestManager;
    v20->_manifestManager = v25;

    objc_storeStrong((id *)&v20->_requestCounter, a7);
    v27 = objc_msgSend(v19, "copy");
    tileRequesterCreationBlock = v20->_tileRequesterCreationBlock;
    v20->_tileRequesterCreationBlock = (id)v27;

    v20->_currentSubscriptionIndex = 0x7FFFFFFFFFFFFFFFLL;
    geo_dispatch_queue_create_with_workloop_qos();
    v29 = objc_claimAutoreleasedReturnValue();
    workQueue = v20->_workQueue;
    v20->_workQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_group_create();
    preparationGroup = v20->_preparationGroup;
    v20->_preparationGroup = (OS_dispatch_group *)v31;

    v20->_started.lock._os_unfair_lock_opaque = 0;
    v20->_started.didRun = 0;
    v20->_finished.lock._os_unfair_lock_opaque = 0;
    v20->_finished.didRun = 0;
    v20->_paused = 1;
    v33 = v20;
  }

  return v20;
}

- (void)resume
{
  uint64_t v3;
  NSObject *preparationGroup;
  NSObject *workQueue;
  _QWORD v6[5];
  id v7;
  id location;
  _QWORD v9[5];

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke;
  v9[3] = &unk_1E1BFF6F8;
  v9[4] = self;
  GEOOnce((uint64_t)&self->_started, v9);
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  preparationGroup = self->_preparationGroup;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2_6;
  v6[3] = &unk_1E1C01158;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  dispatch_group_notify(preparationGroup, workQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 152));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v4 = *(_QWORD *)(v2 + 144);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2;
  v6[3] = &unk_1E1C02930;
  v6[4] = v2;
  return objc_msgSend(v3, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", v4, v6);
}

void __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOGetProactiveTileDownloadLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "[Subscription] Failed to fetch subscriptions: %{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_138);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 120);
  *(_QWORD *)(v9 + 120) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 152));
}

unint64_t __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "policy") == 1
    && GEOConfigGetBOOL(GeoOfflineConfig_DownloadShouldFetchRegionalResources, (uint64_t)off_1EDF4EBC8)
    && GEOConfigGetBOOL(GeoOfflineConfig_OpportunisticFetchOfflineRegionalResources, (uint64_t)off_1EDF4EBD8))
  {
    v3 = ((unint64_t)objc_msgSend(v2, "dataTypes") >> 10) & 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "policy") == 0;
  }

  return v3;
}

void __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 177) && *((_BYTE *)WeakRetained + 176))
  {
    *((_BYTE *)WeakRetained + 176) = 0;
    GEOGetProactiveTileDownloadLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
      v10 = 134349056;
      v11 = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "[Subscription] Resuming download of %{public}llu subscriptions", (uint8_t *)&v10, 0xCu);
    }

    v6 = *(_QWORD **)(a1 + 32);
    if (v6[17])
    {
      GEOGetProactiveTileDownloadLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "subscription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138477827;
        v11 = (uint64_t)v9;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "[Subscription] Resuming download of %{private}@", (uint8_t *)&v10, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "resume");
    }
    else
    {
      objc_msgSend(v6, "_startNextSubscriptionIfPossible");
    }
  }

}

- (void)pause
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__GEOOpportunisticSubscriptionDataSource_pause__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __47__GEOOpportunisticSubscriptionDataSource_pause__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "pause");
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 144);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 177) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = 0;

    objc_msgSend(v4, "subscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "policy");

    if (!v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_externallyManagedDownloaderDidFinish:withError:", v4, v10);

    }
    objc_msgSend(v4, "cancel");

    v1 = *(_QWORD *)(a1 + 32);
  }
  v11 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_3;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v11, block);
}

void __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "dataSourceDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)_startNextSubscriptionIfPossible
{
  unint64_t currentSubscriptionIndex;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSUInteger v20;
  GEOMapDataSubscriptionDownloader *currentDownloader;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  OS_dispatch_queue *workQueue;
  GEOResourceManifestManager *manifestManager;
  void *v33;
  void *v34;
  GEOMapDataSubscriptionDownloader *v35;
  GEOMapDataSubscriptionDownloader *v36;
  GEOMapDataSubscriptionDownloader *v37;
  GEOTileDB *diskCache;
  unsigned __int8 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  currentSubscriptionIndex = self->_currentSubscriptionIndex;
  if (currentSubscriptionIndex == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = currentSubscriptionIndex + 1;
  self->_currentSubscriptionIndex = v4;
  while (1)
  {
    v5 = self->_currentSubscriptionIndex;
    v6 = -[NSArray count](self->_subscriptionsToLoad, "count");
    if (v5 >= v6)
      break;
    -[NSArray objectAtIndexedSubscript:](self->_subscriptionsToLoad, "objectAtIndexedSubscript:", self->_currentSubscriptionIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_originatingBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v39 = 0;
      +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_originatingBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isBackgroundAppRefreshEnabledForBundleIdentifier:isDisabledGlobally:", v11, &v39);

      if ((v12 & 1) == 0)
      {
        v14 = v39;
        GEOGetProactiveTileDownloadLog();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
        if (v14)
        {
          if (v16)
          {
            objc_msgSend(v7, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v41 = (uint64_t)v17;
            _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "[Subscription] Skipping subscription '%{private}@' because background app refresh is disabled", buf, 0xCu);
            goto LABEL_14;
          }
        }
        else if (v16)
        {
          objc_msgSend(v7, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_originatingBundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v41 = (uint64_t)v17;
          v42 = 2114;
          v43 = v18;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "[Subscription] Skipping subscription '%{private}@' because background app refresh is disabled for bundle %{public}@", buf, 0x16u);

LABEL_14:
        }

        v13 = 0;
        ++self->_currentSubscriptionIndex;
        goto LABEL_16;
      }
    }
    v13 = v7;
LABEL_16:

    if (v13)
      goto LABEL_19;
  }
  v13 = 0;
LABEL_19:
  v19 = self->_currentSubscriptionIndex;
  v20 = -[NSArray count](self->_subscriptionsToLoad, "count");
  if (v5 >= v6 || v19 >= v20)
  {
    currentDownloader = self->_currentDownloader;
    self->_currentDownloader = 0;

    -[GEOOpportunisticSubscriptionDataSource _finish](self, "_finish");
  }
  else
  {
    v23 = v13;
    v24 = objc_msgSend(v23, "policy");
    if (v24)
    {
      if (v24 == 1)
      {
        if ((objc_msgSend(v23, "dataTypes") & 0x400) != 0)
        {
          v25 = 2048;
          goto LABEL_33;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: 0 != (subscription.dataTypes & GEOMapDataSubscriptionDataTypeOffline)", buf, 2u);
        }
      }
      v25 = 0;
    }
    else
    {
      v25 = -1;
    }
LABEL_33:

    GEOGetProactiveTileDownloadLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v23, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_originatingBundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218499;
      v41 = v25;
      v42 = 2113;
      v43 = v27;
      v44 = 2114;
      v45 = v28;
      _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_INFO, "[Subscription] Starting download (mask=%llu) of subscription '%{private}@' on behalf of bundle %{public}@", buf, 0x20u);

    }
    v37 = [GEOMapDataSubscriptionDownloader alloc];
    diskCache = self->_diskCache;
    +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "requiredLayers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    workQueue = self->_workQueue;
    manifestManager = self->_manifestManager;
    GEOGetProactiveTileDownloadLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Subscription] [%llu]"), self->_currentSubscriptionIndex);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[GEOMapDataSubscriptionDownloader initWithSubscription:diskCache:requiredOfflineLayers:delegate:delegateQueue:reason:requestOptions:auditToken:manifestManager:log:logPrefix:tileRequesterCreationBlock:tileDownloader:offlineDownloader:updateType:dataTypeMask:](v37, "initWithSubscription:diskCache:requiredOfflineLayers:delegate:delegateQueue:reason:requestOptions:auditToken:manifestManager:log:logPrefix:tileRequesterCreationBlock:tileDownloader:offlineDownloader:updateType:dataTypeMask:", v23, diskCache, v30, self, workQueue, 2, 112, 0, manifestManager, v33, v34, self->_tileRequesterCreationBlock, 0, 0, 1, v25);
    v36 = self->_currentDownloader;
    self->_currentDownloader = v35;

    if (!objc_msgSend(v23, "policy"))
      -[GEOMapDataSubscriptionManager _registerExternallyManagedDownloader:](self->_subscriptionManager, "_registerExternallyManagedDownloader:", self->_currentDownloader);
    -[GEOMapDataSubscriptionDownloader resume](self->_currentDownloader, "resume");
  }

}

- (void)_finish
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  GEOGetProactiveTileDownloadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v3 + 96);
    v4 = *(_QWORD *)(v3 + 104);
    *(_DWORD *)buf = 134218240;
    v11 = v5;
    v12 = 2048;
    v13 = v4;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "[Subscription] Finished. Successfully downloaded %llu tiles, failed to download %llu tiles", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v6 + 56), "finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:", *(_QWORD *)(v6 + 24), *(unsigned __int8 *)(v6 + 64), *(unsigned int *)(v6 + 80), *(unsigned int *)(v6 + 88), *(unsigned int *)(v6 + 96), *(unsigned int *)(v6 + 104), *(_QWORD *)(v6 + 112));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke_13;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v7;
  dispatch_async(v8, block);
}

void __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke_13(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "dataSourceDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)subscriptionDownloader:(id)a3 didFinishWithError:(id)a4
{
  GEOMapDataSubscriptionDownloader *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[16];

  v6 = (GEOMapDataSubscriptionDownloader *)a3;
  v7 = a4;
  if (self->_currentDownloader == v6)
  {
    -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "policy");

    if (!v9)
      -[GEOMapDataSubscriptionManager _externallyManagedDownloaderDidFinish:withError:](self->_subscriptionManager, "_externallyManagedDownloaderDidFinish:withError:", v6, v7);
    self->_numberOfTilesOriginallyConsidered += -[GEOMapDataSubscriptionDownloader numberOfTilesConsidered](v6, "numberOfTilesConsidered");
    self->_numberOfTilesAttempted += -[GEOMapDataSubscriptionDownloader numberOfTilesAttempted](v6, "numberOfTilesAttempted");
    self->_successfulTiles += -[GEOMapDataSubscriptionDownloader successfulTiles](v6, "successfulTiles");
    self->_failedTiles += -[GEOMapDataSubscriptionDownloader failedTiles](v6, "failedTiles");
    self->_bytesDownloaded += -[GEOMapDataSubscriptionDownloader bytesDownloaded](v6, "bytesDownloaded");
    if (!v7)
      notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
    if (!self->_canceled)
      -[GEOOpportunisticSubscriptionDataSource _startNextSubscriptionIfPossible](self, "_startNextSubscriptionIfPossible");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloader == _currentDownloader", v10, 2u);
  }

}

- (GEOOpportunisticDataSourceDelegate)delegate
{
  return (GEOOpportunisticDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_subscriptionsToLoad, 0);
  objc_storeStrong(&self->_tileRequesterCreationBlock, 0);
  objc_storeStrong((id *)&self->_requestCounter, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
