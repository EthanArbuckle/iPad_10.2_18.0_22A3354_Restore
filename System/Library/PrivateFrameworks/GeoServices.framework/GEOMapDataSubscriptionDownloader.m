@implementation GEOMapDataSubscriptionDownloader

- (GEOMapDataSubscriptionDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 requiredOfflineLayers:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 reason:(unsigned __int8)a8 requestOptions:(unint64_t)a9 auditToken:(id)a10 manifestManager:(id)a11 log:(id)a12 logPrefix:(id)a13 tileRequesterCreationBlock:(id)a14 tileDownloader:(id)a15 offlineDownloader:(id)a16 updateType:(int64_t)a17
{
  return -[GEOMapDataSubscriptionDownloader initWithSubscription:diskCache:requiredOfflineLayers:delegate:delegateQueue:reason:requestOptions:auditToken:manifestManager:log:logPrefix:tileRequesterCreationBlock:tileDownloader:offlineDownloader:updateType:dataTypeMask:](self, "initWithSubscription:diskCache:requiredOfflineLayers:delegate:delegateQueue:reason:requestOptions:auditToken:manifestManager:log:logPrefix:tileRequesterCreationBlock:tileDownloader:offlineDownloader:updateType:dataTypeMask:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, -1);
}

- (GEOMapDataSubscriptionDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 requiredOfflineLayers:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 reason:(unsigned __int8)a8 requestOptions:(unint64_t)a9 auditToken:(id)a10 manifestManager:(id)a11 log:(id)a12 logPrefix:(id)a13 tileRequesterCreationBlock:(id)a14 tileDownloader:(id)a15 offlineDownloader:(id)a16 updateType:(int64_t)a17 dataTypeMask:(unint64_t)a18
{
  id v22;
  GEOMapDataSubscriptionDownloader *v23;
  uint64_t v24;
  OS_dispatch_queue *workQueue;
  uint64_t v26;
  NSString *logPrefix;
  uint64_t v28;
  NSMutableArray *v29;
  void *v30;
  __int16 v31;
  GEOMapDataSubscriptionTileDownloader **p_tileDownloader;
  GEOMapDataSubscriptionTileDownloader *v33;
  GEOMapDataSubscriptionTileDownloader *tileDownloader;
  void *v35;
  GEOMapDataSubscriptionResourcesDownloader *v36;
  void *v37;
  GEOMapDataSubscriptionOfflineDownloader *v38;
  void *v39;
  GEOMapDataSubscriptionShiftFunctionDownloader *v40;
  uint64_t v41;
  NSProgress *progress;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  unint64_t v47;
  NSMutableArray *remainingDownloaders;
  GEOMapDataSubscriptionDownloader *v49;
  unsigned int v51;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id obj;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[6];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  objc_super v74;
  _BYTE v75[128];
  uint64_t v76;

  v51 = a8;
  v76 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v56 = a4;
  v54 = a5;
  obj = a6;
  v62 = a7;
  v59 = a10;
  v60 = a11;
  v63 = a12;
  v22 = a13;
  v55 = a14;
  v58 = a15;
  v57 = a16;
  v74.receiver = self;
  v74.super_class = (Class)GEOMapDataSubscriptionDownloader;
  v23 = -[GEOMapDataSubscriptionDownloader init](&v74, sel_init);
  if (v23)
  {
    v24 = geo_dispatch_queue_create_with_target();
    workQueue = v23->_workQueue;
    v23->_workQueue = (OS_dispatch_queue *)v24;

    objc_storeWeak((id *)&v23->_delegate, obj);
    objc_storeStrong((id *)&v23->_delegateQueue, a7);
    objc_storeStrong((id *)&v23->_subscription, a3);
    objc_storeStrong((id *)&v23->_auditToken, a10);
    objc_storeStrong((id *)&v23->_diskCache, a4);
    objc_storeStrong((id *)&v23->_manifestManager, a11);
    v23->_updateType = a17;
    objc_storeStrong((id *)&v23->_log, a12);
    v26 = objc_msgSend(v22, "copy");
    logPrefix = v23->_logPrefix;
    v23->_logPrefix = (NSString *)v26;

    v28 = objc_msgSend(v64, "dataTypes");
    if ((v28 & 0x400) != 0
      && GEOConfigGetBOOL(GeoOfflineConfig_DownloadShouldFetchRegionalResources, (uint64_t)off_1EDF4EBC8))
    {
      v28 |= 0x800uLL;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28 & a18;
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __259__GEOMapDataSubscriptionDownloader_initWithSubscription_diskCache_requiredOfflineLayers_delegate_delegateQueue_reason_requestOptions_auditToken_manifestManager_log_logPrefix_tileRequesterCreationBlock_tileDownloader_offlineDownloader_updateType_dataTypeMask___block_invoke;
    v69[3] = &unk_1E1C06038;
    v69[4] = &v70;
    v69[5] = v28 & a18;
    _GEOEnumerateMapDataSubscriptionTileDataTypes(v69);
    if (*((_BYTE *)v71 + 24))
    {
      if (v58)
      {
        p_tileDownloader = &v23->_tileDownloader;
        objc_storeStrong((id *)&v23->_tileDownloader, a15);
        -[GEOMapDataSubscriptionTileDownloader setDelegate:](v23->_tileDownloader, "setDelegate:", v23);
        -[GEOMapDataSubscriptionTileDownloader setDelegateQueue:](v23->_tileDownloader, "setDelegateQueue:", v23->_workQueue);
      }
      else
      {
        v33 = -[GEOMapDataSubscriptionTileDownloader initWithSubscription:diskCache:reason:requestOptions:auditToken:manifestManager:delegate:delegateQueue:log:logPrefix:tileRequesterCreationBlock:]([GEOMapDataSubscriptionTileDownloader alloc], "initWithSubscription:diskCache:reason:requestOptions:auditToken:manifestManager:delegate:delegateQueue:log:logPrefix:tileRequesterCreationBlock:", v64, v56, v51, a9, v59, v60, v23, v23->_workQueue, v63, v22, v55);
        p_tileDownloader = &v23->_tileDownloader;
        tileDownloader = v23->_tileDownloader;
        v23->_tileDownloader = v33;

      }
      -[NSMutableArray addObject:](v29, "addObject:", *p_tileDownloader);
      -[GEOMapDataSubscriptionTileDownloader progress](v23->_tileDownloader, "progress");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
        objc_msgSend(v30, "addObject:", v35);

    }
    if ((v31 & 0x800) != 0)
    {
      v36 = -[GEOMapDataSubscriptionResourcesDownloader initWithSubscription:manifestManager:requestOptions:auditToken:delegate:delegateQueue:log:logPrefix:]([GEOMapDataSubscriptionResourcesDownloader alloc], "initWithSubscription:manifestManager:requestOptions:auditToken:delegate:delegateQueue:log:logPrefix:", v64, v60, a9, v59, v23, v23->_workQueue, v63, v22);
      -[NSMutableArray addObject:](v29, "addObject:", v36);
      if ((objc_msgSend(v64, "dataTypes") & 0x800) != 0)
      {
        -[GEOMapDataSubscriptionResourcesDownloader progress](v36, "progress");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v30, "addObject:", v37);

      }
    }
    if ((v31 & 0x400) != 0)
    {
      v38 = (GEOMapDataSubscriptionOfflineDownloader *)v57;
      if (!v38)
        v38 = -[GEOMapDataSubscriptionOfflineDownloader initWithSubscription:diskCache:manifestManager:requestOptions:auditToken:keySelectors:requiredLayers:delegate:delegateQueue:log:logPrefix:]([GEOMapDataSubscriptionOfflineDownloader alloc], "initWithSubscription:diskCache:manifestManager:requestOptions:auditToken:keySelectors:requiredLayers:delegate:delegateQueue:log:logPrefix:", v64, v56, v60, a9, v59, 0, v54, v23, v23->_workQueue, v63, v22);
      -[NSMutableArray addObject:](v29, "addObject:", v38);
      -[GEOMapDataSubscriptionOfflineDownloader progress](v38, "progress");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        objc_msgSend(v30, "addObject:", v39);
      v40 = -[GEOMapDataSubscriptionShiftFunctionDownloader initWithSubscription:shifter:cache:delegate:delegateQueue:log:logPrefix:]([GEOMapDataSubscriptionShiftFunctionDownloader alloc], "initWithSubscription:shifter:cache:delegate:delegateQueue:log:logPrefix:", v64, 0, v23->_diskCache, v23, v23->_workQueue, v63, v22);
      -[NSMutableArray addObject:](v29, "addObject:", v40);

    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_progressAggregatingChildrenWithTotalUnitCount:", objc_msgSend(v30, "count"));
    v41 = objc_claimAutoreleasedReturnValue();
    progress = v23->_progress;
    v23->_progress = (NSProgress *)v41;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v43 = v30;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v66 != v45)
            objc_enumerationMutation(v43);
          -[NSProgress addChild:withPendingUnitCount:](v23->_progress, "addChild:withPendingUnitCount:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i), 1);
        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v44);
    }

    -[NSProgress setUserInfoObject:forKey:](v23->_progress, "setUserInfoObject:forKey:", &unk_1E1E80DA0, *MEMORY[0x1E0CB3100]);
    v47 = v23->_updateType - 1;
    if (v47 < 3)
      -[NSProgress setUserInfoObject:forKey:](v23->_progress, "setUserInfoObject:forKey:", *off_1E1C06058[v47], CFSTR("GEOMapDataSubscriptionDownloadReasonKey"));
    remainingDownloaders = v23->_remainingDownloaders;
    v23->_remainingDownloaders = v29;

    v23->_finished.lock._os_unfair_lock_opaque = 0;
    v23->_finished.didRun = 0;
    v23->_paused = 1;
    v49 = v23;
    _Block_object_dispose(&v70, 8);

  }
  return v23;
}

uint64_t __259__GEOMapDataSubscriptionDownloader_initWithSubscription_diskCache_requiredOfflineLayers_delegate_delegateQueue_reason_requestOptions_auditToken_manifestManager_log_logPrefix_tileRequesterCreationBlock_tileDownloader_offlineDownloader_updateType_dataTypeMask___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if ((*(_QWORD *)(result + 40) & a2) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)resume
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GEOMapDataSubscriptionDownloader_resume__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __42__GEOMapDataSubscriptionDownloader_resume__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  GEOPowerAssertion *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 144))
  {
    v2 = result;
    *(_BYTE *)(v1 + 144) = 0;
    v3 = [GEOPowerAssertion alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.geod.SubscriptionDownload.%p"), *(_QWORD *)(v2 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[GEOPowerAssertion initWithType:identifier:timeout:](v3, "initWithType:identifier:timeout:", 0, v4, GEOConfigGetDouble(GeoServicesConfig_SubscriptionDownloadPowerAssertionTimeout, (uint64_t)off_1EDF4E178));
    v6 = *(_QWORD *)(v2 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v16 = *(_QWORD *)(v2 + 32);
    _GEOCreateTransaction();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(v2 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

    v11 = *(id **)(v2 + 32);
    if (!v11[14])
    {
      v12 = objc_msgSend(v11[15], "count", v16);
      v11 = *(id **)(v2 + 32);
      if (v12)
      {
        objc_msgSend(v11[15], "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(v2 + 32);
        v15 = *(void **)(v14 + 112);
        *(_QWORD *)(v14 + 112) = v13;

        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 120), "removeObjectAtIndex:", 0);
        v11 = *(id **)(v2 + 32);
      }
    }
    if (v11[14])
      return objc_msgSend(v11[14], "resume");
    else
      return objc_msgSend(v11, "_finishWithError:", 0);
  }
  return result;
}

- (void)pause
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEOMapDataSubscriptionDownloader_pause__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __41__GEOMapDataSubscriptionDownloader_pause__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "pause");
}

- (void)_finishWithError:(id)a3
{
  id v4;
  GEOPowerAssertion *powerAssertion;
  NSObject *transaction;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  GEOOnce((uint64_t)&self->_finished, v8);
  powerAssertion = self->_powerAssertion;
  self->_powerAssertion = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

}

void __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "totalUnitCount"));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke_2;
  v5[3] = &unk_1E1C00738;
  v5[4] = v2;
  v6 = v3;
  dispatch_async(v4, v5);

}

void __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionDownloader:didFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "totalUnitCount"));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_3;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v6;
  dispatch_async(v7, block);
}

void __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionDownloader:didFinishWithError:", v2, v3);

}

- (unint64_t)numberOfTilesConsidered
{
  return -[GEOMapDataSubscriptionTileDownloader numberOfTilesConsidered](self->_tileDownloader, "numberOfTilesConsidered");
}

- (unint64_t)numberOfTilesAttempted
{
  return -[GEOMapDataSubscriptionTileDownloader numberOfTilesAttempted](self->_tileDownloader, "numberOfTilesAttempted");
}

- (unint64_t)successfulTiles
{
  return -[GEOMapDataSubscriptionTileDownloader successfulTiles](self->_tileDownloader, "successfulTiles");
}

- (unint64_t)failedTiles
{
  return -[GEOMapDataSubscriptionTileDownloader failedTiles](self->_tileDownloader, "failedTiles");
}

- (unint64_t)bytesDownloaded
{
  return -[GEOMapDataSubscriptionTileDownloader bytesDownloaded](self->_tileDownloader, "bytesDownloaded");
}

- (void)downloader:(id)a3 didFinishWithError:(id)a4
{
  GEOMapDataSubscriptionDataDownloader *v6;
  id v7;
  GEOMapDataSubscriptionDownloader *v8;
  id v9;
  NSObject *log;
  NSString *logPrefix;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOMapDataSubscriptionDataDownloader *v16;
  GEOMapDataSubscriptionDataDownloader *v17;
  GEOMapDataSubscriptionDataDownloader *currentDownloader;
  int v19;
  NSString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (GEOMapDataSubscriptionDataDownloader *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7)
  {
    v8 = self;
    v9 = v7;
LABEL_3:
    -[GEOMapDataSubscriptionDownloader _finishWithError:](v8, "_finishWithError:", v9);
    goto LABEL_9;
  }
  if (self->_currentDownloader == v6)
  {
    if (!-[NSMutableArray count](self->_remainingDownloaders, "count"))
    {
      currentDownloader = self->_currentDownloader;
      self->_currentDownloader = 0;

      v8 = self;
      v9 = 0;
      goto LABEL_3;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      logPrefix = self->_logPrefix;
      v12 = log;
      objc_msgSend((id)objc_opt_class(), "loggingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray firstObject](self->_remainingDownloaders, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "loggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = logPrefix;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "%{public}@ Finished downloading %{public}@. Starting download of %{public}@.", (uint8_t *)&v19, 0x20u);

    }
    -[NSMutableArray firstObject](self->_remainingDownloaders, "firstObject");
    v16 = (GEOMapDataSubscriptionDataDownloader *)objc_claimAutoreleasedReturnValue();
    v17 = self->_currentDownloader;
    self->_currentDownloader = v16;

    -[NSMutableArray removeObjectAtIndex:](self->_remainingDownloaders, "removeObjectAtIndex:", 0);
    -[GEOMapDataSubscriptionDataDownloader resume](self->_currentDownloader, "resume");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v19) = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloader == _currentDownloader", (uint8_t *)&v19, 2u);
  }
LABEL_9:

}

- (void)offlineDownloader:(id)a3 willUseDataVersions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  char v10;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__GEOMapDataSubscriptionDownloader_offlineDownloader_willUseDataVersions_completionHandler___block_invoke;
    block[3] = &unk_1E1BFFC90;
    block[4] = self;
    v13 = v7;
    v14 = v8;
    dispatch_async(delegateQueue, block);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

void __92__GEOMapDataSubscriptionDownloader_offlineDownloader_willUseDataVersions_completionHandler___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "subscriptionDownloader:willUseOfflineDataVersions:completionHandler:", a1[4], a1[5], a1[6]);

}

- (GEOMapDataSubscriptionDownloaderDelegate)delegate
{
  return (GEOMapDataSubscriptionDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingDownloaders, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_tileDownloader, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
