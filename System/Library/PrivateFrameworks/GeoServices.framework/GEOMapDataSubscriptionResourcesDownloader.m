@implementation GEOMapDataSubscriptionResourcesDownloader

+ (NSString)loggingDescription
{
  return (NSString *)CFSTR("resources");
}

- (GEOMapDataSubscriptionResourcesDownloader)initWithSubscription:(id)a3 manifestManager:(id)a4 requestOptions:(unint64_t)a5 auditToken:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 log:(id)a9 logPrefix:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  GEOMapDataSubscriptionResourcesDownloader *v21;
  GEOMapDataSubscriptionResourcesDownloader *v22;
  GEOResourceManifestManager *v23;
  GEOResourceManifestManager *manifestManager;
  dispatch_group_t v25;
  OS_dispatch_group *preparationGroup;
  uint64_t v27;
  NSString *logPrefix;
  uint64_t v29;
  NSProgress *progress;
  uint64_t v31;
  OS_dispatch_queue *workQueue;
  GEOMapDataSubscriptionResourcesDownloader *v33;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v16 = a4;
  v35 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v37.receiver = self;
  v37.super_class = (Class)GEOMapDataSubscriptionResourcesDownloader;
  v21 = -[GEOMapDataSubscriptionResourcesDownloader init](&v37, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_subscription, a3);
    if (v16)
    {
      v23 = (GEOResourceManifestManager *)v16;
    }
    else
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager", v35, v36);
      v23 = (GEOResourceManifestManager *)objc_claimAutoreleasedReturnValue();
    }
    manifestManager = v22->_manifestManager;
    v22->_manifestManager = v23;

    objc_storeStrong((id *)&v22->_auditToken, a6);
    v25 = dispatch_group_create();
    preparationGroup = v22->_preparationGroup;
    v22->_preparationGroup = (OS_dispatch_group *)v25;

    v22->_prepared.lock._os_unfair_lock_opaque = 0;
    v22->_prepared.didRun = 0;
    objc_storeWeak((id *)&v22->_delegate, v17);
    objc_storeStrong((id *)&v22->_delegateQueue, a8);
    objc_storeStrong((id *)&v22->_log, a9);
    objc_msgSend(v20, "stringByAppendingString:", CFSTR(" [Resources]"));
    v27 = objc_claimAutoreleasedReturnValue();
    logPrefix = v22->_logPrefix;
    v22->_logPrefix = (NSString *)v27;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v29 = objc_claimAutoreleasedReturnValue();
    progress = v22->_progress;
    v22->_progress = (NSProgress *)v29;

    geo_dispatch_queue_create_with_qos();
    v31 = objc_claimAutoreleasedReturnValue();
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v31;

    v22->_finished.lock._os_unfair_lock_opaque = 0;
    v22->_finished.didRun = 0;
    v22->_paused = 1;
    v33 = v22;
  }

  return v22;
}

- (NSProgress)progress
{
  return self->_progress;
}

void __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activeTileGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "activeScalesCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "activeScalesCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "activeScaleAtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < objc_msgSend(v2, "activeScalesCount"));
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "activeScenariosCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "activeScenariosCount"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "activeScenarioAtIndex:", v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v2, "activeScenariosCount"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_2;
  v29[3] = &unk_1E1C13F28;
  v30 = v3;
  v31 = v6;
  v23 = v11;
  v24 = 3221225472;
  v25 = __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_3;
  v26 = &unk_1E1C13F28;
  v12 = v30;
  v27 = v12;
  v13 = v31;
  v28 = v13;
  objc_msgSend(v2, "regionalResourcesForMapRegions:resourceFilter:attributionFilter:", v10, v29, &v23);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 120);
  *(_QWORD *)(v15 + 120) = v14;

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(NSObject **)(v17 + 48);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = *(_QWORD *)(v17 + 56);
    v20 = *(void **)(v17 + 120);
    v21 = v18;
    v22 = objc_msgSend(v20, "count", v23, v24, v25, v26, v27);
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2048;
    v35 = v22;
    _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, "%{public}@ Will ensure %llu regional resources are cached", buf, 0x16u);

    v17 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setTotalUnitCount:", objc_msgSend(*(id *)(v17 + 120), "count", v23, v24, v25, v26));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_geo_isRelevantForScales:scenarios:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_geo_isRelevantForScales:scenarios:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)resume
{
  uint64_t v3;
  NSObject *preparationGroup;
  NSObject *workQueue;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke;
  v7[3] = &unk_1E1BFF6F8;
  v7[4] = self;
  GEOOnce((uint64_t)&self->_prepared, v7);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_3;
  v6[3] = &unk_1E1BFF6F8;
  v6[4] = self;
  dispatch_group_notify(preparationGroup, workQueue, v6);
}

void __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];
  _QWORD *v9;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_2;
  v7[3] = &unk_1E1C00E10;
  v7[4] = v3;
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    v6 = *(NSObject **)(v3 + 64);
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke;
    block[3] = &unk_1E1BFFBF0;
    block[4] = v3;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

void __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  if (v5)
  {
    -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](v4, v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  dispatch_group_leave(*(dispatch_group_t *)(v4 + 80));

}

- (void)_finishWithError:(uint64_t)a1
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
    v3 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = 0;

    objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 96), "totalUnitCount"));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke;
    v5[3] = &unk_1E1C00738;
    v5[4] = a1;
    v6 = v4;
    GEOOnce(a1 + 104, v5);

  }
}

void __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 112))
  {
    if (!*(_QWORD *)(v1 + 88))
    {
      *(_BYTE *)(v1 + 112) = 0;
      v2 = *(_QWORD *)(a1 + 32);
      if (v2)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 64));
        if (objc_msgSend(*(id *)(v2 + 120), "count"))
        {
          +[GEOResourceRequester sharedRequester](GEOResourceRequester, "sharedRequester");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = *(_QWORD *)(v2 + 120);
          v5 = *(void **)(v2 + 24);
          v6 = v5;
          if (!v5)
          {
            +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v7 = *(_QWORD *)(v2 + 64);
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __68__GEOMapDataSubscriptionResourcesDownloader__startRemainingRequests__block_invoke;
          v8[3] = &unk_1E1C02930;
          v8[4] = v2;
          objc_msgSend(v3, "fetchResources:force:manifestConfiguration:auditToken:queue:handler:", v4, 0, 0, v6, v7, v8);
          if (!v5)

        }
        else
        {
          -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](v2, 0);
        }
      }
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
  block[2] = __50__GEOMapDataSubscriptionResourcesDownloader_pause__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __50__GEOMapDataSubscriptionResourcesDownloader_pause__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 112))
    *(_BYTE *)(v1 + 112) = 1;
  return result;
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GEOMapDataSubscriptionResourcesDownloader_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __51__GEOMapDataSubscriptionResourcesDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](v1, v2);

}

void __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke_2;
  v4[3] = &unk_1E1C00738;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "downloader:didFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __68__GEOMapDataSubscriptionResourcesDownloader__startRemainingRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](*(_QWORD *)(a1 + 32), a3);
}

- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate
{
  return (GEOMapDataSubscriptionDataDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesToFetch, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_preparationError, 0);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
