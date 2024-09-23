@implementation GEOMapDataSubscriptionOfflineDownloader

+ (NSString)loggingDescription
{
  return (NSString *)CFSTR("offline data");
}

- (GEOMapDataSubscriptionOfflineDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 manifestManager:(id)a5 requestOptions:(unint64_t)a6 auditToken:(id)a7 keySelectors:(id)a8 requiredLayers:(id)a9 delegate:(id)a10 delegateQueue:(id)a11 log:(id)a12 logPrefix:(id)a13
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  GEOMapDataSubscriptionOfflineDownloader *v23;
  GEOMapDataSubscriptionOfflineDownloader *v24;
  GEOResourceManifestManager *v25;
  GEOResourceManifestManager *manifestManager;
  uint64_t v27;
  NSArray *requiredLayers;
  dispatch_group_t v29;
  OS_dispatch_group *preparationGroup;
  uint64_t v31;
  NSString *logPrefix;
  uint64_t v33;
  GEOMapDataSubscriptionOfflineDataKeySelector *v34;
  GEOMapDataSubscriptionOfflineDataKeySelector *offlineKeySelector;
  NSArray *keySelectors;
  id v37;
  uint64_t v38;
  NSProgress *progress;
  uint64_t v40;
  OS_dispatch_queue *workQueue;
  uint64_t UInteger;
  GEOMapDataSubscriptionOfflineDownloader *v43;
  id v45;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v49 = a4;
  v18 = a5;
  v45 = a7;
  v50 = a7;
  v19 = a8;
  v53 = a9;
  v20 = a10;
  v48 = a11;
  v52 = a12;
  v21 = v18;
  v22 = a13;
  v54.receiver = self;
  v54.super_class = (Class)GEOMapDataSubscriptionOfflineDownloader;
  v23 = -[GEOMapDataSubscriptionOfflineDownloader init](&v54, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_subscription, a3);
    objc_storeStrong((id *)&v24->_diskCache, a4);
    if (v21)
    {
      v25 = v21;
    }
    else
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v25 = (GEOResourceManifestManager *)objc_claimAutoreleasedReturnValue();
    }
    manifestManager = v24->_manifestManager;
    v24->_manifestManager = v25;

    v24->_requestOptions = a6;
    objc_storeStrong((id *)&v24->_auditToken, v45);
    v27 = objc_msgSend(v53, "copy");
    requiredLayers = v24->_requiredLayers;
    v24->_requiredLayers = (NSArray *)v27;

    v29 = dispatch_group_create();
    preparationGroup = v24->_preparationGroup;
    v24->_preparationGroup = (OS_dispatch_group *)v29;

    v24->_prepared.lock._os_unfair_lock_opaque = 0;
    v24->_prepared.didRun = 0;
    objc_msgSend(v22, "stringByAppendingString:", CFSTR(" [Offline]"));
    v31 = objc_claimAutoreleasedReturnValue();
    logPrefix = v24->_logPrefix;
    v24->_logPrefix = (NSString *)v31;

    if (v19)
    {
      v33 = objc_msgSend(v19, "copy");
    }
    else
    {
      v34 = -[GEOMapDataSubscriptionOfflineDataKeySelector initWithSubscription:requestOptions:auditToken:requiredLayers:log:logPrefix:]([GEOMapDataSubscriptionOfflineDataKeySelector alloc], "initWithSubscription:requestOptions:auditToken:requiredLayers:log:logPrefix:", v51, a6, v50, v53, v52, v24->_logPrefix);
      offlineKeySelector = v24->_offlineKeySelector;
      v24->_offlineKeySelector = v34;

      v55[0] = v24->_offlineKeySelector;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    keySelectors = v24->_keySelectors;
    v24->_keySelectors = (NSArray *)v33;

    v37 = v20;
    objc_storeWeak((id *)&v24->_delegate, v20);
    objc_storeStrong((id *)&v24->_delegateQueue, a11);
    objc_storeStrong((id *)&v24->_log, a12);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v38 = objc_claimAutoreleasedReturnValue();
    progress = v24->_progress;
    v24->_progress = (NSProgress *)v38;

    geo_dispatch_queue_create_with_qos();
    v40 = objc_claimAutoreleasedReturnValue();
    workQueue = v24->_workQueue;
    v24->_workQueue = (OS_dispatch_queue *)v40;

    v24->_finished.lock._os_unfair_lock_opaque = 0;
    v24->_finished.didRun = 0;
    UInteger = 1;
    v24->_paused = 1;
    if ((unint64_t)GEOConfigGetUInteger(GeoOfflineConfig_BatchParallelDownloads, (uint64_t)off_1EDF4EB88) >= 2)
      UInteger = GEOConfigGetUInteger(GeoOfflineConfig_BatchParallelDownloads, (uint64_t)off_1EDF4EB88);
    v24->_numberOfParallelRequests = UInteger;
    v43 = v24;
    v20 = v37;
  }

  return v24;
}

- (NSProgress)progress
{
  return self->_progress;
}

void __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  if (v14)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(_QWORD *)(v8 + 40);
    v9 = (id *)(v8 + 40);
    if (!v10)
      objc_storeStrong(v9, a4);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a2;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (a3 == -1)
  {
    v13 = -1;
    goto LABEL_8;
  }
  v12 = *(_QWORD *)(v11 + 24);
  if (v12 != -1)
  {
    v13 = v12 + a3;
LABEL_8:
    *(_QWORD *)(v11 + 24) = v13;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = a1[4];
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == -1)
    {
      *(_QWORD *)(v2 + 136) = 0;
      v5 = a1[8];
    }
    else
    {
      *(_QWORD *)(v2 + 136) = 1;
      objc_msgSend(*(id *)(a1[4] + 128), "setKind:", *MEMORY[0x1E0CB30F8]);
      objc_msgSend(*(id *)(a1[4] + 128), "setFileOperationKind:", *MEMORY[0x1E0CB30B8]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[4] + 128), "setFileTotalCount:", v3);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[4] + 128), "setByteTotalCount:", v4);

      objc_msgSend(*(id *)(a1[4] + 128), "setFileCompletedCount:", &unk_1E1E80AD0);
      objc_msgSend(*(id *)(a1[4] + 128), "setByteCompletedCount:", &unk_1E1E80AD0);
      v5 = a1[7];
    }
    objc_msgSend(*(id *)(a1[4] + 128), "setTotalUnitCount:", *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24));
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v3 + 48), "layerVersions");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA70];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_2;
  v8[3] = &unk_1E1C028E0;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(WeakRetained, "offlineDownloader:willUseDataVersions:completionHandler:", v3, v6, v8);

}

void __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 80);
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(v3 + 88);
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ Latest data versions are acceptable", buf, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(v3 + 88);
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Latest data versions are not acceptable", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_12;
  v11[3] = &unk_1E1BFF970;
  v12 = v6;
  v13 = v8;
  v10 = v6;
  dispatch_async(v9, v11);

}

uint64_t __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  __int128 buf;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v11 = __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke_2;
    v12 = &unk_1E1C00A28;
    v3 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v4 = v13;
    v14 = v3;
    v5 = v10;
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 64));

      if (WeakRetained)
      {
        v7 = *(NSObject **)(v4 + 80);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = *(_QWORD *)(v4 + 88);
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "%{public}@ Asking delegate if download should continue with latest data versions", (uint8_t *)&buf, 0xCu);
        }
        v9 = *(NSObject **)(v4 + 72);
        *(_QWORD *)&buf = v2;
        *((_QWORD *)&buf + 1) = 3221225472;
        v16 = __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke;
        v17 = &unk_1E1BFFBF0;
        v18 = v4;
        v19 = v5;
        dispatch_async(v9, &buf);

      }
      else
      {
        ((void (*)(_QWORD *, _QWORD))v11)(v5, 0);
      }
    }

  }
}

uint64_t __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
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
  v7[2] = __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke;
  v7[3] = &unk_1E1BFF6F8;
  v7[4] = self;
  GEOOnce((uint64_t)&self->_prepared, v7);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_3;
  v6[3] = &unk_1E1BFF6F8;
  v6[4] = self;
  dispatch_group_notify(preparationGroup, workQueue, v6);
}

void __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD *v19;
  _QWORD block[5];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[5];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_2;
  v17[3] = &unk_1E1C00E10;
  v17[4] = v3;
  v4 = v17;
  if (v3)
  {
    v18[0] = v2;
    v18[1] = 3221225472;
    v18[2] = __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke;
    v18[3] = &unk_1E1C00A28;
    v18[4] = v3;
    v14 = v4;
    v19 = v4;
    v5 = v18;
    v6 = dispatch_group_create();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__7;
    v36[4] = __Block_byref_object_dispose__7;
    v37 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = *(id *)(v3 + 40);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    v15 = v5;
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
          dispatch_group_enter(v6);
          v11 = *(_QWORD *)(v3 + 96);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke;
          v25[3] = &unk_1E1C02890;
          v27 = v36;
          v28 = v35;
          v29 = v34;
          v26 = v6;
          objc_msgSend(v10, "determineTotalCountWithCallbackQueue:callback:", v11, v25);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v7);
    }

    v12 = *(NSObject **)(v3 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke_2;
    block[3] = &unk_1E1C028B8;
    v22 = v36;
    v23 = v34;
    block[4] = v3;
    v24 = v35;
    v13 = v15;
    v21 = v13;
    dispatch_group_notify(v6, v12, block);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v36, 8);

    v4 = v14;
  }

}

void __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), a2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 120);
  if (v5)
  {
    -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v4, v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  dispatch_group_leave(*(dispatch_group_t *)(v4 + 112));

}

- (void)_finishWithError:(uint64_t)a1
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    v3 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

    -[GEOMapDataSubscriptionOfflineDownloader _cancelInProgressRequests](a1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke;
    v5[3] = &unk_1E1C00738;
    v6 = v4;
    v7 = a1;
    GEOOnce(a1 + 144, v5);

  }
}

void __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 152) && !*(_QWORD *)(v1 + 120))
  {
    *(_BYTE *)(v1 + 152) = 0;
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count");
    v4 = *(_QWORD *)(a1 + 32);
    if (v3)
      -[GEOMapDataSubscriptionOfflineDownloader _startRequests:](v4, *(void **)(v4 + 160));
    else
      -[GEOMapDataSubscriptionOfflineDownloader _requestNextBatch](v4);
  }
}

- (void)_startRequests:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    v4 = *(NSObject **)(a1 + 80);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 88);
      v6 = v4;
      *(_DWORD *)buf = 138543618;
      v31 = v5;
      v32 = 2048;
      v33 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ Starting %llu requests", buf, 0x16u);

    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__GEOMapDataSubscriptionOfflineDownloader__startRequests___block_invoke;
    v28[3] = &unk_1E1C02908;
    v28[4] = a1;
    objc_msgSend(v3, "_geo_compactMap:", v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = *(void **)(a1 + 168);
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 168);
        *(_QWORD *)(a1 + 168) = v9;

        v8 = *(void **)(a1 + 168);
      }
      objc_msgSend(v8, "addObjectsFromArray:", v7);
      v11 = *(void **)(a1 + 160);
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 160);
        *(_QWORD *)(a1 + 160) = v12;

        v11 = *(void **)(a1 + 160);
      }
      objc_msgSend(v11, "addObjectsFromArray:", v3);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = v7;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v19, "setDelegate:", a1, (_QWORD)v24);
            objc_msgSend(v19, "start");
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v16);
      }

    }
    else
    {
      v20 = *(NSObject **)(a1 + 80);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = *(_QWORD *)(a1 + 88);
        v22 = v20;
        v23 = objc_msgSend(v3, "count");
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2048;
        v33 = v23;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ %llu requests resulted in zero requesters", buf, 0x16u);

      }
      -[GEOMapDataSubscriptionOfflineDownloader _requestNextBatch](a1);
    }

  }
}

- (void)_requestNextBatch
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 buf;
  uint64_t (*v12)(_QWORD *, uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    if (!*(_BYTE *)(a1 + 154))
    {
      v2 = *(_QWORD *)(a1 + 176);
      if (v2 >= objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        if (!objc_msgSend(*(id *)(a1 + 160), "count"))
        {
          v8 = *(NSObject **)(a1 + 80);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v9 = *(_QWORD *)(a1 + 88);
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "%{public}@ No remaining keys to fetch", (uint8_t *)&buf, 0xCu);
          }
          -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](a1, 0);
        }
      }
      else
      {
        v3 = MEMORY[0x1E0C809B0];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __60__GEOMapDataSubscriptionOfflineDownloader__requestNextBatch__block_invoke;
        v10[3] = &unk_1E1C02930;
        v10[4] = a1;
        v4 = v10;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
        *(_BYTE *)(a1 + 154) = 1;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = v3;
        *((_QWORD *)&buf + 1) = 3221225472;
        v12 = __63__GEOMapDataSubscriptionOfflineDownloader__determineNextBatch___block_invoke;
        v13 = &unk_1E1C02958;
        v14 = a1;
        v6 = v4;
        v15 = v5;
        v16 = v6;
        v7 = v5;
        -[GEOMapDataSubscriptionOfflineDownloader _addMoreRequestsToListIfNeeded:completionHandler:](a1, v7, &buf);

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
  block[2] = __48__GEOMapDataSubscriptionOfflineDownloader_pause__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __48__GEOMapDataSubscriptionOfflineDownloader_pause__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 152))
  {
    *(_BYTE *)(v1 + 152) = 1;
    -[GEOMapDataSubscriptionOfflineDownloader _cancelInProgressRequests](*(_QWORD *)(a1 + 32));
  }
}

- (void)_cancelInProgressRequests
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    v2 = (void *)objc_msgSend(*(id *)(a1 + 168), "copy");
    if (objc_msgSend(v2, "count"))
    {
      v3 = *(NSObject **)(a1 + 80);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(a1 + 88);
        v5 = v3;
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2048;
        v20 = objc_msgSend(v2, "count");
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "%{public}@ Canceling %llu requests", buf, 0x16u);

      }
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = 0;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = v2;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "cancel", (_QWORD)v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GEOMapDataSubscriptionOfflineDownloader_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __49__GEOMapDataSubscriptionOfflineDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v1, v2);

}

void __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v3 = *(_QWORD **)(a1 + 40);
    v4 = (void *)v3[6];
    if (v4)
    {
      v5 = v3[10];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = v3[11];
        v7 = v5;
        objc_msgSend(v4, "layerVersions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v6;
        v31 = 2048;
        v32 = objc_msgSend(v8, "count");
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "%{public}@ Marking subscription as fully-loaded for %llu layers", buf, 0x16u);

        v4 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v4, "layerVersions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "layerVersions");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = *(_QWORD *)(a1 + 40);
            v18 = *(void **)(v17 + 16);
            objc_msgSend(*(id *)(v17 + 8), "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSubscriptionWithIdentifier:isFullyLoaded:forDataType:dataSubtype:version:", v19, 1, 1024, objc_msgSend(v14, "unsignedIntValue"), objc_msgSend(v16, "unsignedLongLongValue"));

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }

      v2 = *(void **)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(NSObject **)(v20 + 72);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke_15;
  v22[3] = &unk_1E1C00738;
  v22[4] = v20;
  v23 = v2;
  dispatch_async(v21, v22);

}

void __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke_15(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "downloader:didFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

GEOOfflineDataRequester *__58__GEOMapDataSubscriptionOfflineDownloader__startRequests___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  id v3;
  GEOOfflineDataRequester *v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = -[GEOOfflineDataRequester initWithRequest:requestOptions:auditToken:log:logPrefix:]([GEOOfflineDataRequester alloc], "initWithRequest:requestOptions:auditToken:log:logPrefix:", v3, v2[23], v2[4], v2[10], v2[11]);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __60__GEOMapDataSubscriptionOfflineDownloader__requestNextBatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 96));
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v6;
  }
  else
  {
    v9 = objc_msgSend(v5, "count");
    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      -[GEOMapDataSubscriptionOfflineDownloader _startRequests:](v10, v5);
      goto LABEL_7;
    }
    if (objc_msgSend(*(id *)(v10 + 160), "count"))
      goto LABEL_7;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 80);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(v11 + 88);
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "%{public}@ No more keys to request. Finished.", (uint8_t *)&v14, 0xCu);
      v11 = *(_QWORD *)(a1 + 32);
    }
    v7 = v11;
    v8 = 0;
  }
  -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v7, v8);
LABEL_7:

}

uint64_t __63__GEOMapDataSubscriptionOfflineDownloader__determineNextBatch___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)(a1[4] + 154) = 0;
  v3 = a1[6];
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[5]);
}

- (void)_addMoreRequestsToListIfNeeded:(void *)a3 completionHandler:
{
  id v5;
  void (**v6)(id, _QWORD);
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, _QWORD);

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    v7 = objc_msgSend(v5, "count");
    if ((unint64_t)(objc_msgSend(*(id *)(a1 + 160), "count") + v7) >= *(_QWORD *)(a1 + 192)
      || (v8 = *(_QWORD *)(a1 + 176), v8 >= objc_msgSend(*(id *)(a1 + 40), "count")))
    {
      v6[2](v6, 0);
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 192);
      v10 = objc_msgSend(v5, "count");
      v11 = v9 - v10 - objc_msgSend(*(id *)(a1 + 160), "count");
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 176));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 96);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke;
      v14[3] = &unk_1E1C029A8;
      v14[4] = a1;
      v16 = v6;
      v15 = v5;
      objc_msgSend(v12, "determineNextRequestsWithMaximumCount:callbackQueue:callback:", v11, v13, v14);

    }
  }

}

void __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _QWORD *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id obj;
  uint64_t v30;
  _QWORD block[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 80);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(v7 + 88);
      *(_DWORD *)buf = 138543618;
      v45 = v9;
      v46 = 2114;
      v47 = v6;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Key selection returned error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (objc_msgSend(v5, "count"))
  {
    v10 = dispatch_group_create();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v28 = v5;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v11)
    {
      v12 = v11;
      v30 = *(_QWORD *)v40;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v13);
          dispatch_group_enter(v10);
          v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          if (v14)
          {
            v16 = *(id *)(v14 + 8);
            v17 = *(_QWORD *)(v14 + 32);
          }
          else
          {
            v16 = 0;
            v17 = 0;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 40);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_20;
          v34[3] = &unk_1E1C02980;
          v35 = v19;
          v36 = v14;
          v37 = *(_QWORD *)(a1 + 32);
          v38 = v10;
          objc_msgSend(v15, "determineIfOfflineDataBatchExistsForKey:version:associatingWithSubscriptionIdentifier:callbackQueue:callback:", v16, v17, v18, v20, v34);

          ++v13;
        }
        while (v12 != v13);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        v12 = v21;
      }
      while (v21);
    }

    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v24 = *(NSObject **)(v22 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_2;
    block[3] = &unk_1E1BFFC90;
    block[4] = v22;
    v32 = v23;
    v33 = *(id *)(a1 + 48);
    dispatch_group_notify(v10, v24, block);

    v6 = 0;
    v5 = v28;
  }
  else
  {
    v25 = *(_QWORD **)(a1 + 32);
    v26 = v25[10];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = v25[11];
      *(_DWORD *)buf = 138543362;
      v45 = v27;
      _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ Key selector yielded additional zero keys. Moving to next selector (if any)", buf, 0xCu);
      v25 = *(_QWORD **)(a1 + 32);
    }
    ++v25[22];
    -[GEOMapDataSubscriptionOfflineDownloader _addMoreRequestsToListIfNeeded:completionHandler:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_20(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a4;
  if ((a2 & 1) != 0)
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(v8 + 136);
    if (v9 == 1)
    {
      v10 = objc_msgSend(*(id *)(v8 + 128), "completedUnitCount");
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        v11 = *(_QWORD *)(v11 + 24);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "setCompletedUnitCount:", v11 + v10);
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "byteCompletedCount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
        v15 = *(_QWORD *)(v15 + 24);
      objc_msgSend(v12, "numberWithUnsignedInteger:", v15 + v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "setByteCompletedCount:", v16);

      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "fileCompletedCount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "setFileCompletedCount:", v19);

    }
    else if (!v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "setCompletedUnitCount:", objc_msgSend(*(id *)(v8 + 128), "completedUnitCount") + 1);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_2(_QWORD *a1)
{
  return -[GEOMapDataSubscriptionOfflineDownloader _addMoreRequestsToListIfNeeded:completionHandler:](a1[4], a1[5], a1[6]);
}

- (void)offlineRequester:(id)a3 didFinishWithData:(id)a4 withETag:(id)a5 containingDataKeys:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *log;
  NSString *logPrefix;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  GEOTileDB *diskCache;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *workQueue;
  id v31;
  id v32;
  void *v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v11 = a5;
  v12 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    logPrefix = self->_logPrefix;
    v15 = log;
    objc_msgSend(v10, "request");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = *(void **)(v16 + 8);
    else
      v18 = 0;
    v19 = v18;
    *(_DWORD *)buf = 138543875;
    v39 = logPrefix;
    v40 = 2113;
    v41 = v19;
    v42 = 2050;
    v43 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ Loaded batch key %{private}@ containing %{public}llu data keys", buf, 0x20u);

  }
  v33 = v12;
  diskCache = self->_diskCache;
  objc_msgSend(v10, "request");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = v11;
  if (v21)
    v24 = *(void **)(v21 + 8);
  else
    v24 = 0;
  v25 = v24;
  objc_msgSend(v10, "request");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = *(_QWORD *)(v26 + 32);
  else
    v28 = 0;
  -[GEOMapDataSubscription identifier](self->_subscription, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileDB addData:forOfflineDataBatchKey:version:etag:containedKeys:forSubscriptionIdentifier:](diskCache, "addData:forOfflineDataBatchKey:version:etag:containedKeys:forSubscriptionIdentifier:", v34, v25, v28, v23, v33, v29);

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFinishWithData_withETag_containingDataKeys___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v36 = v10;
  v37 = v34;
  v31 = v34;
  v32 = v10;
  dispatch_async(workQueue, block);

}

void __106__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFinishWithData_withETag_containingDataKeys___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 48), "length");
  if (v1)
  {
    v4 = v3;
    v5 = *(NSObject **)(v1 + 96);
    v6 = v2;
    dispatch_assert_queue_V2(v5);
    objc_msgSend(*(id *)(v1 + 168), "removeObject:", v6);
    v7 = *(void **)(v1 + 160);
    objc_msgSend(v6, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObject:", v8);
    v9 = *(_QWORD *)(v1 + 136);
    if (v9 == 1)
    {
      objc_msgSend(*(id *)(v1 + 128), "setCompletedUnitCount:", objc_msgSend(*(id *)(v1 + 128), "completedUnitCount") + v4);
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(v1 + 128), "byteCompletedCount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue") + v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 128), "setByteCompletedCount:", v12);

      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(v1 + 128), "fileCompletedCount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 128), "setFileCompletedCount:", v15);

    }
    else if (!v9)
    {
      objc_msgSend(*(id *)(v1 + 128), "setCompletedUnitCount:", objc_msgSend(*(id *)(v1 + 128), "completedUnitCount") + 1);
    }
    v16 = *(NSObject **)(v1 + 80);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)(v1 + 88);
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ Requester finished. Starting additional batch(es) (if possible)", (uint8_t *)&v18, 0xCu);
    }
    -[GEOMapDataSubscriptionOfflineDownloader _requestNextBatch](v1);
  }
}

- (void)offlineRequester:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFailWithError___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __77__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 96));
    v5 = *(NSObject **)(v1 + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(v1 + 88);
      v7 = v5;
      objc_msgSend(v3, "request");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = *(void **)(v8 + 8);
      else
        v10 = 0;
      v11 = v10;
      v14 = 138543875;
      v15 = v6;
      v16 = 2113;
      v17 = v11;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error downloading key %{private}@: %{public}@. Failing...", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(*(id *)(v1 + 168), "removeObject:", v3);
    v12 = *(void **)(v1 + 160);
    objc_msgSend(v3, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

    -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v1, v4);
  }

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
  objc_storeStrong((id *)&self->_inProgressRequesters, 0);
  objc_storeStrong((id *)&self->_remainingCurrentBatchRequests, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_preparationError, 0);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requiredLayers, 0);
  objc_storeStrong((id *)&self->_offlineKeySelector, 0);
  objc_storeStrong((id *)&self->_keySelectors, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
