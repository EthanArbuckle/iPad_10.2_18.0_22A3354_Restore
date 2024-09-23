@implementation GEOProactiveTileDownloader

+ (unint64_t)maximumDownloadBatchSize
{
  return GEOConfigGetUInteger(GeoServicesConfig_CellSaverBatchSize, (uint64_t)off_1EDF4D4B8);
}

+ (BOOL)_canUseBGST
{
  return 1;
}

+ (BOOL)shouldDownloadTileType:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _getValue(GeoServicesConfig_CellSaverTileTypeEnabled, (uint64_t)off_1EDF4DB68, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v7 = 1;
    if ((a3 > 0x3D || ((1 << a3) & 0x3C60800040500802) == 0)
      && ((a3 - 66) > 0x1C || ((1 << (a3 - 66)) & 0x1000F387) == 0))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (GEOProactiveTileDownloader)init
{
  GEOProactiveTileDownloader *result;

  result = (GEOProactiveTileDownloader *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOProactiveTileDownloader)initWithDelegate:(id)a3 delegateQueue:(id)a4 diskCache:(id)a5 tileRequesterClasses:(id)a6 backgroundTask:(id)a7
{
  return -[GEOProactiveTileDownloader initWithDelegate:delegateQueue:diskCache:tileRequesterClasses:manifestManager:requestCounter:downloaders:policyEnabledOverrides:backgroundTask:](self, "initWithDelegate:delegateQueue:diskCache:tileRequesterClasses:manifestManager:requestCounter:downloaders:policyEnabledOverrides:backgroundTask:", a3, a4, a5, a6, 0, 0, 0, 0, a7);
}

- (GEOProactiveTileDownloader)initWithDelegate:(id)a3 delegateQueue:(id)a4 diskCache:(id)a5 tileRequesterClasses:(id)a6 manifestManager:(id)a7 requestCounter:(id)a8 downloaders:(id)a9 policyEnabledOverrides:(id)a10 backgroundTask:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  GEOProactiveTileDownloader *v22;
  void *v23;
  uint64_t v24;
  NSString *uniqueIdentifier;
  uint64_t v26;
  OS_dispatch_queue *isolationQueue;
  uint64_t v28;
  geo_isolater *activityIsolation;
  uint64_t v30;
  NSMapTable *tileRequesterClasses;
  GEOResourceManifestManager *v32;
  GEOResourceManifestManager *manifestManager;
  GEORequestCounter *v34;
  GEORequestCounter *requestCounter;
  uint64_t v36;
  NSDictionary *testPolicyEnabledOverrides;
  GEOProactiveTileDownloader *v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;

  v17 = a3;
  v44 = a4;
  v43 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v42 = a9;
  v21 = a10;
  v41 = a11;
  v48.receiver = self;
  v48.super_class = (Class)GEOProactiveTileDownloader;
  v22 = -[GEOProactiveTileDownloader init](&v48, sel_init);
  if (v22)
  {
    v40 = v21;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v24;

    geo_dispatch_queue_create_with_workloop_qos();
    v26 = objc_claimAutoreleasedReturnValue();
    isolationQueue = v22->_isolationQueue;
    v22->_isolationQueue = (OS_dispatch_queue *)v26;

    v28 = geo_isolater_create();
    activityIsolation = v22->_activityIsolation;
    v22->_activityIsolation = (geo_isolater *)v28;

    objc_storeWeak((id *)&v22->_delegate, v17);
    objc_storeStrong((id *)&v22->_delegateQueue, a4);
    objc_storeStrong((id *)&v22->_diskCache, a5);
    v30 = objc_msgSend(v18, "copy");
    tileRequesterClasses = v22->_tileRequesterClasses;
    v22->_tileRequesterClasses = (NSMapTable *)v30;

    if (v19)
    {
      v32 = (GEOResourceManifestManager *)v19;
    }
    else
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v32 = (GEOResourceManifestManager *)objc_claimAutoreleasedReturnValue();
    }
    manifestManager = v22->_manifestManager;
    v22->_manifestManager = v32;

    v21 = v40;
    if (v20)
    {
      v34 = (GEORequestCounter *)v20;
    }
    else
    {
      +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
      v34 = (GEORequestCounter *)objc_claimAutoreleasedReturnValue();
    }
    requestCounter = v22->_requestCounter;
    v22->_requestCounter = v34;

    objc_storeStrong((id *)&v22->_testDownloaders, a9);
    v36 = objc_msgSend(v40, "copy");
    testPolicyEnabledOverrides = v22->_testPolicyEnabledOverrides;
    v22->_testPolicyEnabledOverrides = (NSDictionary *)v36;

    v22->_didStart.lock._os_unfair_lock_opaque = 0;
    v22->_didStart.didRun = 0;
    v22->_didFinish.lock._os_unfair_lock_opaque = 0;
    v22->_didFinish.didRun = 0;
    v22->_didSubmitBGST.lock._os_unfair_lock_opaque = 0;
    v22->_didSubmitBGST.didRun = 0;
    objc_storeStrong((id *)&v22->_taskToComplete, a11);
    if (v22->_taskToComplete)
    {
      objc_initWeak(&location, v22);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __173__GEOProactiveTileDownloader_initWithDelegate_delegateQueue_diskCache_tileRequesterClasses_manifestManager_requestCounter_downloaders_policyEnabledOverrides_backgroundTask___block_invoke;
      v45[3] = &unk_1E1BFF8B0;
      objc_copyWeak(&v46, &location);
      -[BGSystemTask setExpirationHandler:](v22->_taskToComplete, "setExpirationHandler:", v45);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
    v38 = v22;
  }

  return v22;
}

void __173__GEOProactiveTileDownloader_initWithDelegate_delegateQueue_diskCache_tileRequesterClasses_manifestManager_requestCounter_downloaders_policyEnabledOverrides_backgroundTask___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchExpirationHandlerToIsolationQueue");

}

- (void)_takePowerAssertionIfNecessary
{
  NSObject *v3;
  GEOPowerAssertion *v4;
  GEOPowerAssertion *v5;
  GEOPowerAssertion *powerAssertion;
  uint8_t v7[16];

  if (GEOConfigGetBOOL(GeoServicesConfig_CellSaverShouldTakePowerAssertion, (uint64_t)off_1EDF4D4C8))
  {
    GEOGetProactiveTileDownloadLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Taking power assertion", v7, 2u);
    }

    v4 = [GEOPowerAssertion alloc];
    v5 = -[GEOPowerAssertion initWithType:identifier:timeout:](v4, "initWithType:identifier:timeout:", 1, CFSTR("com.apple.geod.OpportunisticTileDownload"), GEOConfigGetDouble(GeoServicesConfig_CellSaverPowerAssertionTimeout, (uint64_t)off_1EDF4D4D8));
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v5;

  }
}

- (void)_clearPowerAssertion
{
  NSObject *v3;
  GEOPowerAssertion *powerAssertion;
  uint8_t v5[16];

  if (self->_powerAssertion)
  {
    GEOGetProactiveTileDownloadLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Clearing power assertion", v5, 2u);
    }

    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = 0;

  }
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__GEOProactiveTileDownloader_start__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didStart, v2);
}

void __35__GEOProactiveTileDownloader_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__GEOProactiveTileDownloader_start__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __35__GEOProactiveTileDownloader_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__GEOProactiveTileDownloader_cancel__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didFinish, v2);
}

void __36__GEOProactiveTileDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__GEOProactiveTileDownloader_cancel__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __36__GEOProactiveTileDownloader_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_clearPowerAssertion");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cancel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__GEOProactiveTileDownloader_cancel__block_invoke_3;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __36__GEOProactiveTileDownloader_cancel__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "proactiveTileDownloaderDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)_submitBGST
{
  _QWORD v3[5];

  if (BackgroundSystemTasksLibraryCore())
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __41__GEOProactiveTileDownloader__submitBGST__block_invoke;
    v3[3] = &unk_1E1BFF6F8;
    v3[4] = self;
    GEOOnce((uint64_t)&self->_didSubmitBGST, v3);
  }
}

void __41__GEOProactiveTileDownloader__submitBGST__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t UInteger;
  char v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  const char *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "taskRequestForIdentifier:", CFSTR("com.apple.geod.OpportunisticTileDownloader"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()), "initWithIdentifier:", CFSTR("com.apple.geod.OpportunisticTileDownloader"));
  objc_msgSend(v2, "setPriority:", 1);
  objc_msgSend(v2, "setRequiresExternalPower:", 1);
  objc_msgSend(v2, "setRequiresUserInactivity:", 1);
  objc_msgSend(v2, "setExpectedDuration:", 300.0);
  if (GEOConfigGetBOOL(GeoServicesConfig_ProactiveDataLoadingDiskIntensive, (uint64_t)off_1EDF4D4F8))
    objc_msgSend(v2, "setResourceIntensive:", 1);
  objc_msgSend(v2, "setRequiresProtectionClass:", 3);
  objc_msgSend(v2, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v2, "setRequiresInexpensiveNetworkConnectivity:", 1);
  if ((unint64_t)GEOConfigGetUInteger(GeoServicesConfig_ProactiveDataLoadingMinBatteryLevel, (uint64_t)off_1EDF4D508) > 0x63)
  {
    UInteger = 100;
    goto LABEL_7;
  }
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_ProactiveDataLoadingMinBatteryLevel, (uint64_t)off_1EDF4D508);
  if (UInteger)
LABEL_7:
    objc_msgSend(v2, "setRequiresMinimumBatteryLevel:", UInteger);
  objc_msgSend(v2, "setNetworkDownloadSize:", 20971520);
  if (v1)
  {
    v11 = 0;
    v4 = objc_msgSend(v0, "updateTaskRequest:error:", v2, &v11);
    v5 = v11;
  }
  else
  {
    v10 = 0;
    v4 = objc_msgSend(v0, "submitTaskRequest:error:", v2, &v10);
    v5 = v10;
  }
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    GEOGetProactiveTileDownloadLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "update";
      if (!v1)
        v8 = "submit";
      v9 = CFSTR("Unknown");
      if (v6)
        v9 = v6;
      *(_DWORD *)buf = 136315394;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Failed to %s nonrepeating task with error: %@", buf, 0x16u);
    }

  }
}

- (void)_dispatchExpirationHandlerToIsolationQueue
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GEOProactiveTileDownloader__dispatchExpirationHandlerToIsolationQueue__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

void __72__GEOProactiveTileDownloader__dispatchExpirationHandlerToIsolationQueue__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOGetProactiveTileDownloadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "BGST received expiration notice. Pausing until criteria are met again.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_clearPowerAssertion");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "pause");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v9 = 0;
  v4 = objc_msgSend(v3, "setTaskExpiredWithRetryAfter:error:", &v9, 0.0);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    GEOGetProactiveTileDownloadLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Failed to set retry with error %@.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setTaskCompleted");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 144);
    *(_QWORD *)(v7 + 144) = 0;

  }
}

- (void)taskFired:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *isolationQueue;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id location[2];

  v5 = a3;
  if (self->_taskToComplete && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _taskToComplete == nil", (uint8_t *)location, 2u);
  }
  objc_storeStrong((id *)&self->_taskToComplete, a3);
  objc_initWeak(location, self);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__GEOProactiveTileDownloader_taskFired___block_invoke;
  v9[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v10, location);
  -[BGSystemTask setExpirationHandler:](self->_taskToComplete, "setExpirationHandler:", v9);
  isolationQueue = self->_isolationQueue;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __40__GEOProactiveTileDownloader_taskFired___block_invoke_2;
  v8[3] = &unk_1E1BFF6F8;
  v8[4] = self;
  dispatch_async_and_wait(isolationQueue, v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(location);

}

void __40__GEOProactiveTileDownloader_taskFired___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchExpirationHandlerToIsolationQueue");

}

uint64_t __40__GEOProactiveTileDownloader_taskFired___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_taskFired");
}

- (void)_taskFired
{
  NSObject *v3;
  GEOOpportunisticDataSource *currentDownloader;
  uint8_t v5[16];

  GEOGetProactiveTileDownloadLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "XPC activity's criteria have been met. Starting/resuming downloads", v5, 2u);
  }

  -[GEOProactiveTileDownloader _takePowerAssertionIfNecessary](self, "_takePowerAssertionIfNecessary");
  currentDownloader = self->_currentDownloader;
  if (currentDownloader)
    -[GEOOpportunisticDataSource resume](currentDownloader, "resume");
  else
    -[GEOProactiveTileDownloader _startNextDownloader](self, "_startNextDownloader");
}

- (void)_start
{
  NSMutableArray *v3;
  NSMutableArray *remainingPolicies;
  BOOL *policyEnabled;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSDictionary *testPolicyEnabledOverrides;
  void *v14;
  void *v15;
  NSDictionary *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  unint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_msgSend(&unk_1E1E854C8, "mutableCopy");
  remainingPolicies = self->_remainingPolicies;
  self->_remainingPolicies = v3;

  *(_WORD *)self->_policyEnabled = 0;
  policyEnabled = self->_policyEnabled;
  self->_policyEnabled[2] = 0;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = self->_remainingPolicies;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v10), "unsignedIntegerValue");
        if (v11 >= 3)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: policy < GEOProactiveTileDownloadPolicyCount", buf, 2u);
          }
        }
        else
        {
          v12 = v11;
          testPolicyEnabledOverrides = self->_testPolicyEnabledOverrides;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](testPolicyEnabledOverrides, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = self->_testPolicyEnabledOverrides;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            policyEnabled[v12] = objc_msgSend(v18, "BOOLValue");

          }
          else
          {
            policyEnabled[v12] = GEOProactiveTileDownloadPolicyIsEnabled(v12);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      v8 = v19;
    }
    while (v19);
  }

  GEOGetProactiveTileDownloadLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = self->_remainingPolicies;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          v28 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v32);
          if (policyEnabled[v28])
          {
            GEOProactiveTileDownloadPolicyAsString(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v25);
    }

    objc_msgSend(v22, "componentsJoinedByString:", CFSTR(" + "));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetProactiveTileDownloadLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v30;
      _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_DEBUG, "Will download tiles with the following policies: %{public}@", buf, 0xCu);
    }

  }
  if (+[GEOProactiveTileDownloader _canUseBGST](GEOProactiveTileDownloader, "_canUseBGST", (_QWORD)v32)
    && !self->_taskToComplete)
  {
    -[GEOProactiveTileDownloader _submitBGST](self, "_submitBGST");
  }
  else
  {
    -[GEOProactiveTileDownloader _startNextDownloader](self, "_startNextDownloader");
  }
}

- (void)_finish
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__GEOProactiveTileDownloader__finish__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didFinish, v2);
}

void __37__GEOProactiveTileDownloader__finish__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_clearPowerAssertion");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__GEOProactiveTileDownloader__finish__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __37__GEOProactiveTileDownloader__finish__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  GEOGetProactiveTileDownloadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Done.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "proactiveTileDownloaderDidFinish:", *(_QWORD *)(a1 + 32));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__GEOProactiveTileDownloader__finish__block_invoke_26;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v4;
  dispatch_async(v5, block);
}

void __37__GEOProactiveTileDownloader__finish__block_invoke_26(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setTaskCompleted");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

}

- (void)_startNextDownloader
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  GEOOpportunisticDataSource *currentDownloader;
  id v14;
  _QWORD v15[4];
  NSMapTable *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_remainingPolicies, "count"))
    goto LABEL_5;
  while (1)
  {
    -[NSMutableArray firstObject](self->_remainingPolicies, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
    -[NSMutableArray removeObjectAtIndex:](self->_remainingPolicies, "removeObjectAtIndex:", 0);
    if (v4 <= 2 && self->_policyEnabled[v4])
      break;

    if (!-[NSMutableArray count](self->_remainingPolicies, "count"))
      goto LABEL_5;
  }
  if (v3)
  {
    v6 = self->_tileRequesterClasses;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__GEOProactiveTileDownloader__startNextDownloader__block_invoke;
    v15[3] = &unk_1E1C070A0;
    v7 = v6;
    v16 = v7;
    v8 = (void *)MEMORY[0x18D765024](v15);
    v9 = objc_msgSend(v3, "unsignedIntegerValue");
    -[NSDictionary objectForKeyedSubscript:](self->_testDownloaders, "objectForKeyedSubscript:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (_GEOCreateOpportunisticDataSource(v9, self->_uniqueIdentifier, self->_manifestManager, self->_diskCache, self->_requestCounter, v8), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v10, "setDelegateQueue:", self->_isolationQueue);
      GEOGetProactiveTileDownloadLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        GEOProactiveTileDownloadPolicyAsString(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Starting download for policy: %{public}@ (%{public}@)", buf, 0x16u);

      }
      currentDownloader = self->_currentDownloader;
      self->_currentPolicy = v9;
      self->_currentDownloader = (GEOOpportunisticDataSource *)v10;
      v14 = v10;

      -[GEOOpportunisticDataSource resume](self->_currentDownloader, "resume");
    }
    else
    {
      -[GEOProactiveTileDownloader _startNextDownloader](self, "_startNextDownloader");
    }

  }
  else
  {
LABEL_5:
    GEOGetProactiveTileDownloadLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "No remaining download policies. Finished.", buf, 2u);
    }

    -[GEOProactiveTileDownloader _finish](self, "_finish");
  }
}

objc_class *__50__GEOProactiveTileDownloader__startNextDownloader__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_msgSend(v12, "objectForKey:", v13);

  if (v14)
    v14 = (objc_class *)objc_msgSend([v14 alloc], "initWithTileRequest:delegateQueue:delegate:", v9, v10, v11);

  return v14;
}

- (void)dataSourceDidFinish:(id)a3
{
  NSObject *v4;
  void *v5;
  GEOOpportunisticDataSource *currentDownloader;
  GEOOpportunisticDataSource *v7;
  int v8;
  void *v9;
  __int16 v10;
  GEOOpportunisticDataSource *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_currentDownloader == a3)
  {
    GEOGetProactiveTileDownloadLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      GEOProactiveTileDownloadPolicyAsString(self->_currentPolicy);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      currentDownloader = self->_currentDownloader;
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = currentDownloader;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Finished downloads for policy: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);

    }
    v7 = self->_currentDownloader;
    self->_currentDownloader = 0;

    -[GEOProactiveTileDownloader _startNextDownloader](self, "_startNextDownloader");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIsolation, 0);
  objc_storeStrong((id *)&self->_testPolicyEnabledOverrides, 0);
  objc_storeStrong((id *)&self->_taskToComplete, 0);
  objc_storeStrong((id *)&self->_tileRequesterClasses, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_remainingPolicies, 0);
  objc_storeStrong((id *)&self->_testDownloaders, 0);
  objc_storeStrong((id *)&self->_requestCounter, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
