@implementation GEOMapDataSubscriptionLocalDownloadManager

+ (Class)_backgroundTaskSchedulerClass
{
  void *v2;

  v2 = (void *)BackgroundSystemTasksLibraryCore();
  if (v2)
  {
    getBGSystemTaskSchedulerClass();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v2;
}

- (GEOMapDataSubscriptionLocalDownloadManager)initWithTileDB:(id)a3 dataConfiguration:(id)a4
{
  id v7;
  id v8;
  GEOMapDataSubscriptionLocalDownloadManager *v9;
  GEOMapDataSubscriptionLocalDownloadManager *v10;
  uint64_t v11;
  GEOResourceManifestManager *manifestManager;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  uint64_t v15;
  geo_isolater *isolation;
  void *v17;
  OS_dispatch_queue *v18;
  GEOMapDataSubscriptionLocalDownloadManager *v19;
  GEOMapDataSubscriptionLocalDownloadManager *v20;
  _QWORD v22[4];
  GEOMapDataSubscriptionLocalDownloadManager *v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)GEOMapDataSubscriptionLocalDownloadManager;
  v9 = -[GEOMapDataSubscriptionLocalDownloadManager init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tileDB, a3);
    objc_storeStrong((id *)&v10->_dataConfiguration, a4);
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v11 = objc_claimAutoreleasedReturnValue();
    manifestManager = v10->_manifestManager;
    v10->_manifestManager = (GEOResourceManifestManager *)v11;

    geo_dispatch_queue_create_with_workloop_qos();
    v13 = objc_claimAutoreleasedReturnValue();
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    v15 = geo_isolater_create();
    isolation = v10->_isolation;
    v10->_isolation = (geo_isolater *)v15;

    GEORegisterPListStateCaptureLegacy();
    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10->_workQueue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__GEOMapDataSubscriptionLocalDownloadManager_initWithTileDB_dataConfiguration___block_invoke;
    v22[3] = &unk_1E1BFF6F8;
    v19 = v10;
    v23 = v19;
    objc_msgSend(v17, "runAfterFirstUnlock:block:", v18, v22);

    v20 = v19;
  }

  return v10;
}

void __79__GEOMapDataSubscriptionLocalDownloadManager_initWithTileDB_dataConfiguration___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id location;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "registerObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2[4], "isUpdateAvailable");
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      objc_initWeak(&location, v2);
      v8 = v4;
      v9 = 3221225472;
      v10 = __90__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineUpdateTaskScheduledIfNecessary__block_invoke;
      v11 = &unk_1E1C03E38;
      objc_copyWeak(&v13, &location);
      v12 = v2;
      -[GEOMapDataSubscriptionLocalDownloadManager _determineIfShouldScheduleAutomaticUpdate:]((uint64_t)v2, &v8);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    v5 = *(_QWORD **)(a1 + 32);
    if (v5)
    {
      objc_initWeak(&location, v5);
      v6 = (void *)v5[8];
      v7 = v5[1];
      v8 = v4;
      v9 = 3221225472;
      v10 = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke;
      v11 = &unk_1E1C02268;
      objc_copyWeak(&v13, &location);
      v12 = (id *)v5;
      objc_msgSend(v6, "fetchAllSubscriptionsWithQueue:callback:", v7, &v8);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)dealloc
{
  NSMutableDictionary *subscriptionStates;
  objc_super v4;
  _QWORD v5[5];

  -[GEOOfflineDataConfiguration unregisterObserver:](self->_dataConfiguration, "unregisterObserver:", self);
  GEOUnregisterStateCaptureLegacy();
  subscriptionStates = self->_subscriptionStates;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__GEOMapDataSubscriptionLocalDownloadManager_dealloc__block_invoke;
  v5[3] = &unk_1E1C03DE8;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscriptionStates, "enumerateKeysAndObjectsUsingBlock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)GEOMapDataSubscriptionLocalDownloadManager;
  -[GEOMapDataSubscriptionLocalDownloadManager dealloc](&v4, sel_dealloc);
}

void __53__GEOMapDataSubscriptionLocalDownloadManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(&unk_1E1E85450, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(&unk_1E1E85450);
        objc_msgSend(v4, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), _KVOContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(&unk_1E1E85450, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  id v3;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  v3 = v5;

  return v3;
}

void __73__GEOMapDataSubscriptionLocalDownloadManager_captureStatePlistWithHints___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, CFSTR("subscriptionStates"));
}

- (void)_determineAutomaticOfflineUpdateDelay:(uint64_t)a1
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id *v11;
  NSObject *v12;
  _QWORD v13[4];
  _QWORD v14[2];
  char v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  if ((GEOConfigGetBOOL(GeoOfflineConfig_AutomaticUpdatesEnabled, (uint64_t)off_1EDF4EA18) & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isUpdateRequired");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastUpdatedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    v9 = *(void **)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke_2;
    v13[3] = &unk_1E1C03E10;
    v11 = (id *)v14;
    v14[0] = v3;
    v14[1] = v8;
    v15 = v4;
    objc_msgSend(v9, "calculateSizeOfAllOfflineDataWithCallbackQueue:callback:", v10, v13);
  }
  else
  {
    v12 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke;
    block[3] = &unk_1E1C01F48;
    v11 = &v17;
    v17 = v3;
    dispatch_async(v12, block);
  }

}

uint64_t __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(-1.0);
}

uint64_t __84__GEOMapDataSubscriptionLocalDownloadManager__determineAutomaticOfflineUpdateDelay___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  NSObject *v4;
  __n128 v5;
  double updated;
  double v8;
  NSObject *v9;
  uint64_t v10;
  __n128 v11;
  NSObject *v12;
  __n128 v13;
  int v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Failed to calculate downloaded offline data size", (uint8_t *)&v14, 2u);
    }

    v5.n128_u64[0] = -1.0;
    return (*(uint64_t (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(v5);
  }
  else
  {
    updated = GEOAutomaticUpdateFrequencyForOfflineDataSize(a2);
    if (updated >= 0.0)
    {
      v8 = updated;
      GEOGetSubscriptionsDownloadManagerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v14 = 134218240;
        v15 = v8;
        v16 = 2048;
        v17 = v10;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "Autoupdate frequency is %.0f. Time since last update is %.0f", (uint8_t *)&v14, 0x16u);
      }

      if (*(_BYTE *)(a1 + 48))
      {
        GEOGetSubscriptionsDownloadManagerLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Active layers do not match required layers. Automatic update should be scheduled more-aggressively", (uint8_t *)&v14, 2u);
        }

        v13.n128_u64[0] = 0;
        return (*(uint64_t (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(v13);
      }
      else
      {
        v11.n128_f64[0] = fmax(v8 - fmax(*(double *)(a1 + 40), 0.0), 0.0);
        return (*(uint64_t (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(v11);
      }
    }
    else
    {
      return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(-1.0);
    }
  }
}

void __90__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineUpdateTaskScheduledIfNecessary__block_invoke(uint64_t a1, int a2, double a3)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  double Double;
  uint64_t Uint64;
  double v11;
  uint64_t v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskRequestForIdentifier:", CFSTR("com.apple.geod.UpdateOfflineData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        GEOGetSubscriptionsDownloadManagerLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Offline update background task is already scheduled", buf, 2u);
        }

      }
      else if (objc_msgSend(WeakRetained[4], "isUpdateAvailable"))
      {
        GEOGetSubscriptionsDownloadManagerLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Offline autoupdate should be scheduled, but no background task exists. Scheduling new background task", v13, 2u);
        }

        Double = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1EDF4E968);
        Uint64 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78);
        if (Double >= ((double)(unint64_t)Uint64 + (double)(unint64_t)Uint64) / 3.0)
        {
          v12 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78);
          v11 = ((double)(unint64_t)v12 + (double)(unint64_t)v12) / 3.0;
        }
        else
        {
          v11 = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1EDF4E968);
        }
        -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:]((uint64_t)WeakRetained, vcvtmd_u64_f64(v11), a3);
      }

    }
  }
}

- (void)_scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:(double)a3 maxRandomizedDelay:
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_QWORD *)(a1 + 72))
  {
    if (BackgroundSystemTasksLibraryCore())
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskRequestForIdentifier:", CFSTR("com.apple.geod.UpdateOfflineData"));
      v6 = objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = (id)objc_msgSend(objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()), "initWithIdentifier:", CFSTR("com.apple.geod.UpdateOfflineData"));
        objc_msgSend(v7, "setPriority:", 1);
        objc_msgSend(v7, "setRequiresExternalPower:", 1);
        objc_msgSend(v7, "setRequiresSignificantUserInactivity:", 1);
        objc_msgSend(v7, "setExpectedDuration:", 300.0);
        objc_msgSend(v7, "setResourceIntensive:", 1);
        objc_msgSend(v7, "setRequiresProtectionClass:", 3);
        objc_msgSend(v7, "setRequiresNetworkConnectivity:", 1);
        objc_msgSend(v7, "setRequiresInexpensiveNetworkConnectivity:", 1);
        objc_msgSend(v7, "setRequiresMinimumBatteryLevel:", GEOConfigGetUInteger(GeoOfflineConfig_AutoUpdateMinimumBatteryLevel, (uint64_t)off_1EDF4EC68));
        objc_msgSend(v7, "setNetworkDownloadSize:", 524288000);
        _configureBackgroundTaskDisallowingCellular(v7);
        objc_msgSend(v7, "setScheduleAfter:", fmax(a3, 1.0));
        if (a2)
          objc_msgSend(v7, "setRandomInitialDelay:", (double)a2);

        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        v9 = objc_msgSend(v8, "submitTaskRequest:error:", v7, &v12);
        v10 = v12;

        if ((v9 & 1) == 0)
        {
          GEOGetSubscriptionsDownloadManagerLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v14 = v10;
            _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Error scheduling automatic update background task: %{public}@", buf, 0xCu);
          }

        }
        v6 = 0;
      }
    }
    else
    {
      GEOGetSubscriptionsDownloadManagerLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Did not schedule automatic update background task because BackgroundSystemTasks is not supported", buf, 2u);
      }
    }

  }
}

- (void)_determineIfShouldScheduleAutomaticUpdate:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke;
    v5[3] = &unk_1E1C044E0;
    v5[4] = a1;
    v6 = v3;
    -[GEOMapDataSubscriptionLocalDownloadManager _determineAutomaticOfflineUpdateDelay:](a1, v5);

  }
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  void *v27;
  _QWORD block[7];
  _QWORD v29[4];
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint8_t *v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  char v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v21 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v20 = a1;
    objc_msgSend(v22, "_geo_filtered:", &__block_literal_global_33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(*((id *)WeakRetained + 4), "activeVersions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
        objc_msgSend(*((id *)WeakRetained + 4), "requiredLayers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v27, "allKeys");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v6 = v24;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v47;
            while (2)
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v47 != v8)
                  objc_enumerationMutation(v6);
                if ((objc_msgSend(v25, "containsObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9)) & 1) == 0)
                {
                  GEOGetSubscriptionsDownloadManagerLog();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "Required layers do not match active layers. Data update is required, so will not consider scheduling individual retries", buf, 2u);
                  }

                  goto LABEL_24;
                }
                ++v9;
              }
              while (v7 != v9);
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
              if (v7)
                continue;
              break;
            }
          }

          *(_QWORD *)buf = 0;
          v43 = buf;
          v44 = 0x2020000000;
          v45 = 0;
          v40[0] = 0;
          v40[1] = v40;
          v40[2] = 0x2020000000;
          v41 = 0;
          v10 = dispatch_group_create();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          obj = v23;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v37;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v37 != v12)
                  objc_enumerationMutation(obj);
                v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
                dispatch_group_enter(v10);
                v15 = (void *)*((_QWORD *)WeakRetained + 8);
                objc_msgSend(v14, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = *((_QWORD *)WeakRetained + 1);
                v29[0] = MEMORY[0x1E0C809B0];
                v29[1] = 3221225472;
                v29[2] = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_71;
                v29[3] = &unk_1E1C03E88;
                v30 = v27;
                v31 = v14;
                v32 = WeakRetained;
                v34 = buf;
                v35 = v40;
                v33 = v10;
                objc_msgSend(v15, "fetchSubscriptionMetadataWithIdentifier:queue:callback:", v16, v17, v29);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
            }
            while (v11);
          }

          v18 = *((_QWORD *)WeakRetained + 1);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_74;
          block[3] = &unk_1E1C00788;
          block[4] = *(_QWORD *)(v20 + 32);
          block[5] = buf;
          block[6] = v40;
          dispatch_group_notify(v10, v18, block);

          _Block_object_dispose(v40, 8);
          _Block_object_dispose(buf, 8);
LABEL_24:

        }
      }

    }
  }

}

unint64_t __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "policy") == 1)
    v3 = ((unint64_t)objc_msgSend(v2, "dataTypes") >> 10) & 1;
  else
    v3 = 0;

  return v3;
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *, void *, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    v7 = *(void **)(a1 + 32);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_2_72;
    v18 = &unk_1E1C03E60;
    v8 = v5;
    v19 = v8;
    v20 = &v21;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v15);
    if (*((_BYTE *)v22 + 24))
      goto LABEL_12;
    v9 = objc_msgSend(v8, "downloadState", v15, v16, v17, v18);
    if (v9)
    {
      if (v9 != 2)
      {
        if (v9 == 3)
        {
          v10 = *(_QWORD *)(a1 + 72);
LABEL_11:
          *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 1;
        }
LABEL_12:

        _Block_object_dispose(&v21, 8);
        goto LABEL_13;
      }
    }
    else
    {
      GEOGetSubscriptionsDownloadManagerLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558275;
        v26 = 1752392040;
        v27 = 2113;
        v28 = v12;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Fixing download state for existing failed subscription: %{private, mask.hash}@", buf, 0x16u);

      }
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](v13, 2, v14);

    }
    v10 = *(_QWORD *)(a1 + 64);
    goto LABEL_11;
  }
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_2_72(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = a3;
  v8 = objc_msgSend(a2, "unsignedIntValue");
  v9 = objc_msgSend(v7, "unsignedLongLongValue");

  result = objc_msgSend(*(id *)(a1 + 32), "isFullyLoadedForDataType:dataSubtype:version:associatedDataCount:associatedDataSize:", 1024, v8, v9, 0, 0);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)_updateStateWithDownloadState:(void *)a3 forIdentifier:
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDownloadState:forSubscriptionWithIdentifier:", a2, v5);
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__11;
    v15 = __Block_byref_object_dispose__11;
    v16 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v6 = v5;
    v10 = a2;
    v9 = v6;
    geo_isolate_sync_data();
    if (v12[5])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, v12[5], v6, v8, 3221225472, __90__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloadState_forIdentifier___block_invoke, &unk_1E1C04038, a1, v6, &v11, v10);

    }
    _Block_object_dispose(&v11, 8);

  }
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__ensureOfflineRetryTaskScheduledIfNecessary__block_invoke_74(uint64_t *a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    -[GEOMapDataSubscriptionLocalDownloadManager _ensureOfflineRetryTaskScheduled:](a1[4], 0);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    -[GEOMapDataSubscriptionLocalDownloadManager _ensureOfflineRetryTaskScheduled:](a1[4], 1);
}

- (void)_ensureOfflineRetryTaskScheduled:(uint64_t)a1
{
  __CFString **v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t *v11;
  double Double;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = GEOMapDataSubscriptionOfflineDownloadInexpensiveBackgroundTaskIdentifier;
    if (!a2)
      v4 = GEOMapDataSubscriptionOfflineDownloadRetryBackgroundTaskIdentifier;
    v5 = *v4;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskRequestForIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    GEOGetSubscriptionsDownloadManagerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v13 = 138543362;
        v14 = v5;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "Offline retry background task is already scheduled (%{public}@)", (uint8_t *)&v13, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = 138543362;
        v14 = v5;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Offline retry should be scheduled, but no background task exists. Scheduling new background task (%{public}@)", (uint8_t *)&v13, 0xCu);
      }

      if (a2)
        v10 = &GeoOfflineConfig_OfflineDownloadWaitForInexpensiveNetworkingDelay;
      else
        v10 = &GeoOfflineConfig_FailedOfflineDownloadRetryDelay;
      v11 = (uint64_t *)&unk_1EDF4EB48;
      if (!a2)
        v11 = (uint64_t *)&unk_1EDF4EB58;
      Double = GEOConfigGetDouble(*v10, *v11);
      -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:onlyWaitingForNonCellular:]((char *)a1, a2, Double);
    }

  }
}

- (void)_scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:(double)a3 onlyWaitingForNonCellular:
{
  uint64_t v6;
  __CFString **v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18[6];
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = 48;
    if (a2)
      v6 = 40;
    -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadGroup:startNextDownloadIfNecessary:dueToTaskDeferral:]((uint64_t)a1, *(void **)&a1[v6], 0);
    if (BackgroundSystemTasksLibraryCore())
    {
      v7 = GEOMapDataSubscriptionOfflineDownloadInexpensiveBackgroundTaskIdentifier;
      if (!a2)
        v7 = GEOMapDataSubscriptionOfflineDownloadRetryBackgroundTaskIdentifier;
      v8 = *v7;
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "taskRequestForIdentifier:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        GEOGetSubscriptionsDownloadManagerLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v8;
          _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "NOT scheduling background task %{public}@ because it is already scheduled", buf, 0xCu);
        }

        if (a2)
        {
          v18[1] = (id)MEMORY[0x1E0C809B0];
          v18[2] = (id)3221225472;
          v18[3] = __135__GEOMapDataSubscriptionLocalDownloadManager__scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay_onlyWaitingForNonCellular___block_invoke;
          v18[4] = &unk_1E1BFF6F8;
          v18[5] = a1;
          geo_isolate_sync();
        }
      }
      else
      {
        v12 = (id)objc_msgSend(objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()), "initWithIdentifier:", v8);
        objc_msgSend(v12, "setPriority:", 2);
        objc_msgSend(v12, "setRequiresUserInactivity:", a2 ^ 1u);
        objc_msgSend(v12, "setRequiresProtectionClass:", 3);
        objc_msgSend(v12, "setRequiresNetworkConnectivity:", 1);
        objc_msgSend(v12, "setRequiresMinimumBatteryLevel:", GEOConfigGetUInteger(GeoOfflineConfig_DownloadMinimumBatteryLevel, (uint64_t)off_1EDF4EC78));
        objc_msgSend(v12, "setRequiresExternalPower:", a2 ^ 1u);
        objc_msgSend(v12, "setNetworkDownloadSize:", 524288000);
        _configureBackgroundTaskDisallowingCellular(v12);
        objc_msgSend(v12, "setScheduleAfter:", fmax(a3, 1.0));
        if (((a2 ^ 1) & 1) != 0)
          objc_msgSend(v12, "setRequiresInexpensiveNetworkConnectivity:", 1);
        else
          objc_msgSend(v12, "setTrySchedulingBefore:", a3 + 10.0);

        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = 0;
        v14 = objc_msgSend(v13, "submitTaskRequest:error:", v12, v18);
        v15 = v18[0];

        GEOGetSubscriptionsDownloadManagerLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((v14 & 1) != 0)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v20 = v8;
            v21 = 2048;
            v22 = a3;
            _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "Scheduled offline retry background task (%{public}@) with delay %.0f", buf, 0x16u);
          }

          if (a2)
            geo_isolate_sync();
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v20 = v15;
            _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Error scheduling offline retry background task: %{public}@", buf, 0xCu);
          }

        }
      }

    }
    else
    {
      GEOGetSubscriptionsDownloadManagerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Did not schedule offline retry background task because BackgroundSystemTasks is not supported", buf, 2u);
      }
    }

  }
}

- (void)runAutomaticOfflineDataUpdateBackgroundTask:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__GEOMapDataSubscriptionLocalDownloadManager_runAutomaticOfflineDataUpdateBackgroundTask___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __90__GEOMapDataSubscriptionLocalDownloadManager_runAutomaticOfflineDataUpdateBackgroundTask___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _startUpdateForUserInitiatedSubscriptionsForDataType:mode:updateType:auditToken:forBackgroundTask:startedHandler:](*(_QWORD *)(a1 + 32), 1024, 6, 1, 0, *(void **)(a1 + 40), 0);
}

- (void)_startUpdateForUserInitiatedSubscriptionsForDataType:(uint64_t)a3 mode:(uint64_t)a4 updateType:(void *)a5 auditToken:(void *)a6 forBackgroundTask:(void *)a7 startedHandler:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a1)
  {
    v16 = *(void **)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke;
    v18[3] = &unk_1E1C040F8;
    v22 = a2;
    v23 = a4;
    v18[4] = a1;
    v19 = v14;
    v21 = v15;
    v24 = a3;
    v20 = v13;
    objc_msgSend(v16, "fetchAllSubscriptionsWithQueue:callback:", v17, v18);

  }
}

- (void)runRetryOfflineDownloadBackgroundTask:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  GEOMapDataSubscriptionLocalDownloadManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__GEOMapDataSubscriptionLocalDownloadManager_runRetryOfflineDownloadBackgroundTask___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __84__GEOMapDataSubscriptionLocalDownloadManager_runRetryOfflineDownloadBackgroundTask___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.geod.OfflineDownload.Inexpensive"));

  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 1;
LABEL_5:
    -[GEOMapDataSubscriptionLocalDownloadManager _offlineRetryBackgroundTaskFired:onlyWaitingForNonCellular:](v4, v5, v6);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.geod.OfflineDownload.FailedRetry"));

  if (v8)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 0;
    goto LABEL_5;
  }
  GEOGetSubscriptionsDownloadManagerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, "Unexpected background task identifier: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
}

- (void)_offlineRetryBackgroundTaskFired:(char)a3 onlyWaitingForNonCellular:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = *(void **)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke;
    v9[3] = &unk_1E1C042C8;
    v9[4] = a1;
    v11 = a3;
    v10 = v5;
    objc_msgSend(v7, "fetchAllSubscriptionsWithQueue:callback:", v8, v9);

  }
}

- (void)didAddSubscription:(id)a3
{
  -[GEOMapDataSubscriptionLocalDownloadManager didAddSubscription:completionHandler:](self, "didAddSubscription:completionHandler:", a3, 0);
}

- (void)didAddSubscription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *workQueue;
  _QWORD v10[4];
  id v11;
  GEOMapDataSubscriptionLocalDownloadManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "policy") == 1)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    workQueue = self->_workQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__GEOMapDataSubscriptionLocalDownloadManager_didAddSubscription_completionHandler___block_invoke;
    v10[3] = &unk_1E1C03EB0;
    v11 = v6;
    v12 = self;
    v13 = v7;
    -[GEOMapDataSubscriptionLocalDownloadManager fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:](self, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v8, workQueue, v10);

  }
}

void __83__GEOMapDataSubscriptionLocalDownloadManager_didAddSubscription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558275;
      v22 = 1752392040;
      v23 = 2113;
      v24 = v8;
      v9 = "Failed to fetch state for newly-added subscription '%{private, mask.hash}@'. Ignoring";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_1885A9000, v10, v11, v9, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v12 = objc_msgSend(v5, "loadState");
  if ((unint64_t)(v12 - 1) < 3)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558275;
      v22 = 1752392040;
      v23 = 2113;
      v24 = v8;
      v9 = "Newly-added/modified subscription '%{private, mask.hash}@' is already fully-downloaded. Ignoring";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v12 && (unint64_t)objc_msgSend(v5, "downloadState") <= 2)
  {
    if (GEOConfigGetUInteger(GeoOfflineConfig_DownloadMinimumBatteryLevel, (uint64_t)off_1EDF4EC78)
      && (objc_msgSend(*(id *)(a1 + 32), "dataTypes") & 0x400) != 0)
    {
      GEOGetSubscriptionsDownloadManagerLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558275;
        v22 = 1752392040;
        v23 = 2113;
        v24 = v18;
        _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_INFO, "Scheduling background download task for newly-added subscription '%{private, mask.hash}@'", buf, 0x16u);

      }
      -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:onlyWaitingForNonCellular:](*(char **)(a1 + 40), 1, 0.0);
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](v19, 3, v7);
    }
    else
    {
      GEOGetSubscriptionsDownloadManagerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558275;
        v22 = 1752392040;
        v23 = 2113;
        v24 = v15;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Enqueuing download for newly-added subscription '%{private, mask.hash}@'", buf, 0x16u);

      }
      v16 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](v16, v7, 0, 0, 1, 0, 0);
    }
    goto LABEL_8;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

}

- (void)_enqueueDownloadForSubscriptions:(uint64_t)a3 mode:(void *)a4 auditToken:(uint64_t)a5 reason:(uint64_t)a6 updateType:(int)a7 enqueueAtHead:
{
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  id WeakRetained;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[8];
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  __int128 *p_buf;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _BYTE v62[128];
  uint8_t v63[128];
  __int128 buf;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v37 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (objc_msgSend(v13, "count"))
    {
      GEOGetSubscriptionsDownloadManagerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134349056;
        *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v13, "count");
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Enqueuing downloads of %{public}llu subscriptions", (uint8_t *)&buf, 0xCu);
      }

      v15 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke;
      v60[3] = &unk_1E1C04148;
      v61 = v37;
      objc_msgSend(v13, "_geo_map:", v60);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 80);
      if (v16)
      {
        v58[0] = v15;
        v58[1] = 3221225472;
        v58[2] = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_2;
        v58[3] = &unk_1E1C04198;
        v59 = v13;
        objc_msgSend(v16, "_geo_filter:", v58);
        if (a7)
        {
          v17 = (void *)objc_msgSend(v36, "mutableCopy");
          objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(a1 + 80));
          v18 = *(void **)(a1 + 80);
          *(_QWORD *)(a1 + 80) = v17;

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 80), "addObjectsFromArray:", v36);
        }
        v20 = v59;
      }
      else
      {
        v19 = objc_msgSend(v36, "mutableCopy");
        v20 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v19;
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__11;
      v67 = __Block_byref_object_dispose__11;
      v68 = 0;
      v47 = v15;
      v48 = 3221225472;
      v49 = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_4;
      v50 = &unk_1E1C041C0;
      v51 = v13;
      v52 = a1;
      p_buf = &buf;
      v55 = a6;
      v56 = a3;
      v57 = a5;
      v22 = v21;
      v53 = v22;
      geo_isolate_sync_data();
      if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
      {
        if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count") != 1
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v46 = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloadersToCancel.count == 1", v46, 2u);
        }
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "firstObject", v36);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == *(void **)(a1 + 88);

        if (!v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v46 = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloadersToCancel.firstObject == _currentDownloader", v46, 2u);
        }
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v25 = *(id *)(*((_QWORD *)&buf + 1) + 40);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v43 != v27)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "cancel");
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
          }
          while (v26);
        }

      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v29 = v22;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v39 != v31)
              objc_enumerationMutation(v29);
            v33 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            objc_msgSend(v29, "objectForKeyedSubscript:", v33, v36);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
            objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, v34, v33);

          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
        }
        while (v30);
      }

      -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](a1);
      _Block_object_dispose(&buf, 8);

    }
  }

}

- (void)didRemoveSubscriptionWithIdentifier:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__GEOMapDataSubscriptionLocalDownloadManager_didRemoveSubscriptionWithIdentifier___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __82__GEOMapDataSubscriptionLocalDownloadManager_didRemoveSubscriptionWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeSubscriptionWithIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeSubscriptionWithIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeSubscriptionWithIdentifier:", *(_QWORD *)(a1 + 40));
  -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
}

- (void)_cancelDownloadForSubscriptionIdentifier:(int)a3 shouldPersistPausedState:
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id WeakRetained;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__11;
    v31 = __Block_byref_object_dispose__11;
    v32 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke;
    v23 = &unk_1E1C041E8;
    v26 = &v27;
    v24 = a1;
    v7 = v5;
    v25 = v7;
    geo_isolate_sync_data();
    if (a3)
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](a1, 1, v7);
    v8 = v28[5];
    if (v8)
    {
      if (v8 != *(_QWORD *)(a1 + 88) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloader == _currentDownloader", buf, 2u);
      }
      GEOGetSubscriptionsDownloadManagerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 141558275;
        *(_QWORD *)&buf[4] = 1752392040;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Canceling currently-downloading subscription '%{private, mask.hash}@'", buf, 0x16u);
      }

      objc_msgSend((id)v28[5], "cancel");
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](a1, 0, v7, v10);
    }
    else
    {
      v11 = *(void **)(a1 + 80);
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke_106;
      v18[3] = &unk_1E1C04210;
      v12 = v7;
      v19 = v12;
      v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v18);
      GEOGetSubscriptionsDownloadManagerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 141558275;
          *(_QWORD *)&buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v12;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Asked to cancel subscription '%{private, mask.hash}@' which is neither downloading nor queued for download", buf, 0x16u);
        }

      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 141558275;
          *(_QWORD *)&buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v12;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Canceling queued-for-download subscription '%{private, mask.hash}@'", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 80), "removeObjectAtIndex:", v13);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v34 = __Block_byref_object_copy__11;
      v35 = __Block_byref_object_dispose__11;
      v36 = 0;
      v16 = v12;
      geo_isolate_sync_data();
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v16);

      }
      _Block_object_dispose(buf, 8);

      v10 = v19;
    }

    _Block_object_dispose(&v27, 8);
  }

}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 dataTypes:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  GEOPBOfflineDataBatchesSizeRequest *v14;
  uint64_t Uint64;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  GEOPBOfflineDataBatchesSizeRequest *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  _QWORD block[4];
  id v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[4];
  GEOPBOfflineDataBatchesSizeRequest *v32;
  uint64_t *v33;
  _QWORD v34[5];
  NSObject *v35;
  _QWORD *v36;
  uint64_t *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  GEOMapDataSubscriptionLocalDownloadManager *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[5];
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v10 = a5;
  v11 = a6;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = -1;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__11;
  v54[4] = __Block_byref_object_dispose__11;
  v55 = 0;
  v12 = dispatch_group_create();
  v13 = MEMORY[0x1E0C809B0];
  if (a4 == 1024)
  {
    v57[3] = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__11;
    v52 = __Block_byref_object_dispose__11;
    v53 = 0;
    v42 = v13;
    v43 = 3221225472;
    v44 = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_2;
    v45 = &unk_1E1BFF920;
    v46 = self;
    v47 = &v48;
    geo_isolate_sync();
    v14 = objc_alloc_init(GEOPBOfflineDataBatchesSizeRequest);
    -[GEOPBOfflineDataBatchesSizeRequest setRegion:](v14, "setRegion:", v26);
    Uint64 = GEOConfigGetUint64(GeoOfflineConfig_OfflineClientVersionModifier, (uint64_t)off_1EDF4EC38);
    if (Uint64)
      -[GEOPBOfflineDataBatchesSizeRequest setClientVersionModifier:](v14, "setClientVersionModifier:", Uint64);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[GEOOfflineDataConfiguration requiredLayers](self->_dataConfiguration, "requiredLayers", Uint64, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v60, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v16);
          -[GEOPBOfflineDataBatchesSizeRequest addLayers:](v14, "addLayers:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "intValue"));
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v60, 16);
      }
      while (v17);
    }

    dispatch_group_enter(v12);
    v20 = (void *)v49[5];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_3;
    v34[3] = &unk_1E1C03F00;
    v34[4] = self;
    v36 = v54;
    v37 = &v56;
    v35 = v12;
    objc_msgSend(v20, "startWithRequest:traits:options:completionHandler:", v14, 0, 0, v34);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_5;
    v31[3] = &unk_1E1C00760;
    v32 = v14;
    v33 = &v48;
    v21 = v14;
    v22 = (void *)MEMORY[0x18D765024](v31);

    _Block_object_dispose(&v48, 8);
    v13 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v22 = &__block_literal_global_78;
  }
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_6;
  block[3] = &unk_1E1C016C8;
  v23 = v11;
  v28 = v23;
  v29 = &v56;
  v30 = v54;
  dispatch_group_notify(v12, v10, block);
  GEOCancellableForBlock(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v56, 8);

  return v24;
}

void __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  GEOOfflineDataSizeEstimationServiceRequester *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(GEOOfflineDataSizeEstimationServiceRequester);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v9 = v5;
  v7 = v5;
  v8 = v6;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (!v4)
    objc_storeStrong(v3, *(id *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 40), "hasSizeBytes");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "sizeBytes");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += result;
  }
  return result;
}

uint64_t __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancelRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __128__GEOMapDataSubscriptionLocalDownloadManager_determineEstimatedSizeForSubscriptionWithRegion_dataTypes_queue_completionHandler___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)fetchStateForSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  GEOGetSubscriptionsDownloadManagerLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 141558275;
    v13 = 1752392040;
    v14 = 2113;
    v15 = v8;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Fetching state for subscription '%{private, mask.hash}@'", (uint8_t *)&v12, 0x16u);
  }

  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, v8, v10, v9);
}

- (void)_updateStateForSubscriptionWithIdentifier:(void *)a3 callbackQueue:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = *(void **)(a1 + 64);
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
    v13[3] = &unk_1E1C03FA0;
    v17 = v9;
    v14 = v8;
    v15 = a1;
    v16 = v7;
    objc_msgSend(v10, "fetchSubscriptionsMatchingIdentifiers:queue:callback:", v11, v12, v13);

  }
}

- (void)fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __117__GEOMapDataSubscriptionLocalDownloadManager_fetchLastUpdatedDateForOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v8[3] = &unk_1E1BFF970;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);

}

void __117__GEOMapDataSubscriptionLocalDownloadManager_fetchLastUpdatedDateForOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastUpdatedDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9 = *(void **)(v7 + 64);
    v10 = *(_QWORD *)(v7 + 8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3;
    v16[3] = &unk_1E1C03F78;
    v16[4] = v7;
    v17 = v8;
    v18 = v5;
    v20 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v9, "fetchSubscriptionMetadataWithIdentifier:queue:callback:", v17, v10, v16);

  }
  else if (*(_QWORD *)(a1 + 56))
  {
    if (v6)
    {
      v11 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("Subscription not found"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E1BFF970;
    v14 = *(id *)(a1 + 56);
    v22 = v12;
    v23 = v14;
    v15 = v12;
    dispatch_async(v13, block);

  }
}

uint64_t __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a2;
  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11;
  v30 = __Block_byref_object_dispose__11;
  v31 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v19 = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_4;
  v20 = &unk_1E1C03F28;
  v9 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v21 = v7;
  v22 = v8;
  v10 = v5;
  v23 = v10;
  v24 = *(id *)(a1 + 48);
  v25 = &v26;
  geo_isolate_sync_data();
  if (v10 && v27[5])
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", *(_QWORD *)(a1 + 32), v27[5], *(_QWORD *)(a1 + 40));

  }
  v12 = *(void **)(a1 + 64);
  if (v12)
  {
    v13 = *(NSObject **)(a1 + 56);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_5;
    block[3] = &unk_1E1C03F50;
    v15 = v12;
    v16 = &v26;
    dispatch_async(v13, block);

  }
  _Block_object_dispose(&v26, 8);

}

void __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  id v12;
  char v13;
  uint64_t *v14;
  char v15;
  int v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _QWORD v61[4];
  id v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;

  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v26 = (id)v2;
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_21;
  objc_msgSend(*(id *)(a1 + 56), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activeVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "latestAvailableVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isUpdateAvailable");
  v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isUpdateRequired");
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9 = v3;
  v25 = v4;
  v23 = v5;
  v10 = v6;
  v24 = v8;
  if (v26)
  {
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 1;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 1;
    v11 = objc_msgSend(v9, "dataTypes");
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke;
    v61[3] = &unk_1E1C03D98;
    v12 = v25;
    v62 = v12;
    v63 = &v79;
    v64 = &v75;
    v65 = &v71;
    v66 = &v67;
    _GEOEnumerateTileSetsForSubscriptionDataTypes(v24, v11, v61);
    if ((objc_msgSend(v9, "dataTypes") & 0x400) == 0)
    {
LABEL_19:
      os_unfair_lock_lock_with_options();
      *((_BYTE *)v26 + 12) = *((_BYTE *)v72 + 24);
      *((_BYTE *)v26 + 13) = *((_BYTE *)v68 + 24);
      *((_BYTE *)v26 + 14) = v22;
      *((_QWORD *)v26 + 2) = v80[3];
      *((_QWORD *)v26 + 3) = v76[3];
      *((_QWORD *)v26 + 8) = objc_msgSend(v12, "downloadState");
      -[_GEOMapDataSubscriptionDownloadState _updateExternalState]((uint64_t)v26);
      os_unfair_lock_unlock((os_unfair_lock_t)v26 + 2);

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v79, 8);
      goto LABEL_20;
    }
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    if (objc_msgSend(v10, "count"))
    {
      *((_BYTE *)v58 + 24) = 1;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_2;
      v40[3] = &unk_1E1C03DC0;
      v41 = v12;
      v42 = &v49;
      v43 = &v45;
      v44 = &v57;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v40);

    }
    v13 = v7 ^ 1;
    if (!*((_BYTE *)v58 + 24))
      v13 = 1;
    if ((v13 & 1) == 0)
      *((_BYTE *)v58 + 24) = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    if (v7 && objc_msgSend(v23, "count"))
    {
      *((_BYTE *)v54 + 24) = 1;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_3;
      v27[3] = &unk_1E1C03DC0;
      v28 = v12;
      v29 = &v36;
      v30 = &v32;
      v31 = &v53;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v27);

    }
    v14 = v72;
    *((_BYTE *)v72 + 24) &= *((_BYTE *)v58 + 24);
    v15 = *((_BYTE *)v68 + 24);
    v16 = (v15 & v54[3]);
    *((_BYTE *)v68 + 24) = v15 & v54[3];
    if (*((_BYTE *)v14 + 24))
    {
      v80[3] += v50[3];
      v17 = v46;
    }
    else
    {
      if (!v16)
      {
LABEL_18:
        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v49, 8);
        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v57, 8);
        goto LABEL_19;
      }
      v80[3] += v37[3];
      v17 = v33;
    }
    v76[3] += v17[3];
    goto LABEL_18;
  }
LABEL_20:

  v2 = (uint64_t)v26;
LABEL_21:
  if (v2)
    v18 = *(void **)(v2 + 96);
  else
    v18 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v18);
  v19 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "downloadState");
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(a1 + 40);
  if (v19 == 5)
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v20, v21, v26);
  else
    -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v20, v21);

}

- (_GEOMapDataSubscriptionDownloadState)_stateForSubscriptionWithIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _GEOMapDataSubscriptionDownloadState *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    geo_assert_isolated();
    v4 = *(void **)(a1 + 112);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v7 = (_GEOMapDataSubscriptionDownloadState *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(_GEOMapDataSubscriptionDownloadState);
      objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v7, v3);
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = objc_msgSend(&unk_1E1E85450, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(&unk_1E1E85450);
            -[_GEOMapDataSubscriptionDownloadState addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", a1, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), 0, _KVOContext);
          }
          while (v9 != v11);
          v9 = objc_msgSend(&unk_1E1E85450, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_startObservingWaitingConditionsIfNecessaryForIdentifier:(void *)a3 state:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    geo_assert_isolated();
    v6 = *(void **)(a1 + 120);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v7;

      v6 = *(void **)(a1 + 120);
    }
    v9 = objc_msgSend(v6, "count");
    objc_msgSend(*(id *)(a1 + 120), "addObject:", v10);
    if (v9)
    {
      if (*(_BYTE *)(a1 + 128))
        -[_GEOMapDataSubscriptionDownloadState setWaitingUserInfo:]((uint64_t)v5, *(void **)(a1 + 136));
    }
    else
    {
      -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessary](a1);
    }
  }

}

- (void)_stopObservingWaitingConditionsIfNecessaryForIdentifier:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    geo_assert_isolated();
    if (objc_msgSend(*(id *)(a1 + 120), "containsObject:", v3))
    {
      objc_msgSend(*(id *)(a1 + 120), "removeObject:", v3);
      if (!objc_msgSend(*(id *)(a1 + 120), "count"))
        -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessary](a1);
    }
  }

}

uint64_t __120__GEOMapDataSubscriptionLocalDownloadManager__updateStateForSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (void)_startObservingWaitingConditionsIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (a1)
  {
    geo_assert_isolated();
    if (!*(_BYTE *)(a1 + 128))
    {
      if (objc_msgSend(*(id *)(a1 + 120), "count"))
      {
        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "taskRequestForIdentifier:", CFSTR("com.apple.geod.OfflineDownload.Inexpensive"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
        {
          +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addNetworkReachableObserver:selector:", a1, sel__networkReachabilityChanged_);

          if (objc_msgSend(v3, "requiresExternalPower"))
          {
            +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addPowerAdapterObserver:queue:", a1, *(_QWORD *)(a1 + 8));

          }
          if (objc_msgSend(v3, "requiresMinimumBatteryLevel"))
          {
            +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addBatteryLevelObserver:onlyWhenCharging:queue:", a1, objc_msgSend(v3, "requiresExternalPower"), *(_QWORD *)(a1 + 8));

          }
          *(_BYTE *)(a1 + 128) = 1;
          v7 = *(NSObject **)(a1 + 8);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __89__GEOMapDataSubscriptionLocalDownloadManager__startObservingWaitingConditionsIfNecessary__block_invoke;
          block[3] = &unk_1E1BFF6F8;
          block[4] = a1;
          dispatch_async(v7, block);
        }

      }
    }
  }
}

void __89__GEOMapDataSubscriptionLocalDownloadManager__startObservingWaitingConditionsIfNecessary__block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _updateWaitingReasons](*(_QWORD *)(a1 + 32));
}

- (void)_updateWaitingReasons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  id WeakRetained;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskRequestForIdentifier:", CFSTR("com.apple.geod.OfflineDownload.Inexpensive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_18;
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isNetworkReachable") & 1) != 0)
  {
    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isCellConnection");

    if (!v7)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v8 = 1;
LABEL_8:
  if (objc_msgSend(v3, "requiresExternalPower"))
  {
    +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPowerAdapterConnected");

    if (!v10)
      v8 |= 2uLL;
  }
  if (objc_msgSend(v3, "requiresMinimumBatteryLevel"))
  {
    if (!objc_msgSend(v3, "requiresExternalPower")
      || (+[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isPowerAdapterConnected"),
          v11,
          v12))
    {
      +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "batteryLevel");
      v15 = objc_msgSend(v3, "requiresMinimumBatteryLevel");

      if (v14 < v15)
      {
        v8 |= 4uLL;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "requiresMinimumBatteryLevel"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey"));

LABEL_17:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("GEOMapDataSubscriptionStateWaitingReasonKey"));

        goto LABEL_18;
      }
    }
  }
  if (v8)
    goto LABEL_17;
LABEL_18:
  v28 = v3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke;
  v36 = &unk_1E1C01790;
  v37 = a1;
  v19 = v4;
  v38 = v19;
  v39 = v18;
  geo_isolate_sync();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v39;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, v26, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v22);
  }

}

- (uint64_t)_stopObservingWaitingConditionsIfNecessary
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  if (result)
  {
    v1 = result;
    result = geo_assert_isolated();
    if (*(_BYTE *)(v1 + 128))
    {
      *(_BYTE *)(v1 + 128) = 0;
      +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removePowerAdapterObserver:", v1);

      +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeBatteryLevelObserver:", v1);

      v4 = *(void **)(v1 + 136);
      *(_QWORD *)(v1 + 136) = 0;

      return objc_msgSend(*(id *)(v1 + 112), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_90_0);
    }
  }
  return result;
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__stopObservingWaitingConditionsIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[_GEOMapDataSubscriptionDownloadState setWaitingUserInfo:](a3, 0);
}

- (void)registerExternallyManagedDownloader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "subscription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:]((uint64_t)self, v5, v7, 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloader != ((void *)0)", v8, 2u);
  }

}

- (void)_updateStateWithDownloader:(void *)a3 forIdentifier:(void *)a4 error:
{
  id v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  NSObject *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349571;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2160;
      *(_QWORD *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2113;
      v28 = v8;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "Associating downloader %{public}p with subscription '%{private, mask.hash}@'", buf, 0x20u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__11;
    v29 = __Block_byref_object_dispose__11;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__11;
    v25 = __Block_byref_object_dispose__11;
    v26 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __93__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloader_forIdentifier_error___block_invoke;
    v16 = &unk_1E1C04010;
    v17 = a1;
    v11 = v8;
    v18 = v11;
    v19 = v7;
    v20 = v9;
    geo_isolate_sync_data();
    if (v22[5])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", a1, v22[5], v11, v13, 3221225472, __93__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloader_forIdentifier_error___block_invoke, &unk_1E1C04010, a1, v11, v19, v20, buf, &v21);

    }
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "cancel", v13, v14, v15, v16, v17);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (void)externallyManagedDownloaderDidFinish:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *global_queue;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "subscription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    global_queue = (void *)geo_get_global_queue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__GEOMapDataSubscriptionLocalDownloadManager_externallyManagedDownloaderDidFinish_withError___block_invoke;
    v11[3] = &unk_1E1C03FE8;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, v9, global_queue, v11);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloader != ((void *)0)", buf, 2u);
  }

}

void __93__GEOMapDataSubscriptionLocalDownloadManager_externallyManagedDownloaderDidFinish_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](v2, 0, v3, *(void **)(a1 + 48));

}

void __93__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloader_forIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  if (v2 != v3)
  {
    -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v14);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    -[_GEOMapDataSubscriptionDownloadState setDownloader:]((uint64_t)v14, *(void **)(a1 + 48));
    v8 = *(void **)(a1 + 56);
    v9 = v8;
    if (v14)
    {
      objc_msgSend(v14, "willChangeValueForKey:", CFSTR("lastError"));
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)v14 + 9, v8);
      -[_GEOMapDataSubscriptionDownloadState _updateExternalState]((uint64_t)v14);
      os_unfair_lock_unlock((os_unfair_lock_t)v14 + 2);
      objc_msgSend(v14, "didChangeValueForKey:", CFSTR("lastError"));

      v10 = (void *)*((_QWORD *)v14 + 12);
    }
    else
    {

      v10 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v10);
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "downloadState");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    if (v11 == 5)
      -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v12, v13, v14);
    else
      -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v12, v13);
  }

}

void __90__GEOMapDataSubscriptionLocalDownloadManager__updateStateWithDownloadState_forIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  os_unfair_lock_s *v9;

  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = v2 + 2;
    os_unfair_lock_lock(v2 + 2);
    *(_QWORD *)&v9[16]._os_unfair_lock_opaque = v3;
    -[_GEOMapDataSubscriptionDownloadState _updateExternalState]((uint64_t)v9);
    os_unfair_lock_unlock(v4);
    v5 = *(void **)&v9[24]._os_unfair_lock_opaque;
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "downloadState");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  if (v6 == 5)
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v7, v8, v9);
  else
    -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v7, v8);

}

- (void)startDownloadForSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  id v8;
  id v9;
  GEOTileDB *tileDB;
  OS_dispatch_queue *workQueue;
  _QWORD v12[4];
  id v13;
  GEOMapDataSubscriptionLocalDownloadManager *v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    tileDB = self->_tileDB;
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__GEOMapDataSubscriptionLocalDownloadManager_startDownloadForSubscriptionIdentifiers_mode_auditToken___block_invoke;
    v12[3] = &unk_1E1C04060;
    v13 = v8;
    v14 = self;
    v16 = a4;
    v15 = v9;
    -[GEOTileDB fetchSubscriptionsMatchingIdentifiers:queue:callback:](tileDB, "fetchSubscriptionsMatchingIdentifiers:queue:callback:", v13, workQueue, v12);

  }
}

void __102__GEOMapDataSubscriptionLocalDownloadManager_startDownloadForSubscriptionIdentifiers_mode_auditToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "clearDownloadStateForSubscriptionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v5, "count"))
      -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](*(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 56), *(void **)(a1 + 48), 2, 0, 0);
  }
  else
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Failed to look up subscriptions: %{public}@", buf, 0xCu);
    }

  }
}

- (void)forceUpdateForUserInitiatedSubscriptionsForDataType:(unint64_t)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  id v8;
  NSObject *workQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a5;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_forceUpdateForUserInitiatedSubscriptionsForDataType_mode_auditToken___block_invoke;
  v11[3] = &unk_1E1BFFCE0;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(workQueue, v11);

}

void __114__GEOMapDataSubscriptionLocalDownloadManager_forceUpdateForUserInitiatedSubscriptionsForDataType_mode_auditToken___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _startUpdateForUserInitiatedSubscriptionsForDataType:mode:updateType:auditToken:forBackgroundTask:startedHandler:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 2, *(void **)(a1 + 40), 0, 0);
}

void __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id obj;
  _QWORD block[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  NSObject *v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v23 = a3;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_2;
  v42[3] = &__block_descriptor_40_e32_B16__0__GEOMapDataSubscription_8l;
  v42[4] = *(_QWORD *)(a1 + 64);
  v22 = v5;
  objc_msgSend(v5, "_geo_filtered:", v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__11;
  v40[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_3;
        v33[3] = &unk_1E1C040A8;
        v35 = v40;
        v33[4] = v11;
        v34 = v7;
        objc_msgSend(v12, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v13, v14, v33);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v8);
  }

  v15 = *(void **)(a1 + 40);
  v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_4;
  block[3] = &unk_1E1C040D0;
  v17 = *(_QWORD *)(a1 + 72);
  v30 = v40;
  v31 = v17;
  v26 = v15;
  v18 = *(id *)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 80);
  v29 = v18;
  v32 = v19;
  v20 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 32);
  v27 = v20;
  v28 = v21;
  dispatch_group_notify(v7, v16, block);

  _Block_object_dispose(v40, 8);
}

BOOL __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(_QWORD *)(a1 + 32) & objc_msgSend(a2, "dataTypes")) != 0;
}

void __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_3(uint64_t a1, void *a2)
{
  if ((unint64_t)(objc_msgSend(a2, "loadState") - 1) <= 2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __159__GEOMapDataSubscriptionLocalDownloadManager__startUpdateForUserInitiatedSubscriptionsForDataType_mode_updateType_auditToken_forBackgroundTask_startedHandler___block_invoke_4(uint64_t a1)
{
  unint64_t v2;
  __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  GEOMapDataSubscriptionUpdateSession *v6;
  uint64_t v7;
  GEOMapDataSubscriptionUpdateSession *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE buf[12];
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 72) - 1;
  if (v2 > 2)
    v3 = 0;
  else
    v3 = off_1E1C04528[v2];
  GEOGetSubscriptionsDownloadManagerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v3;
    v17 = 2050;
    v18 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Initiating %{public}@ update for %{public}llu subscriptions", buf, 0x16u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    v6 = -[GEOMapDataSubscriptionUpdateSession initWithSubscriptions:downloadMode:updateType:auditToken:backgroundTask:delegate:delegateQueue:]([GEOMapDataSubscriptionUpdateSession alloc], "initWithSubscriptions:downloadMode:updateType:auditToken:backgroundTask:delegate:delegateQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v6;
    if (v7)
    {
      -[GEOMapDataSubscriptionLocalDownloadManager _cancelCurrentUpdateSession:dueToTaskDeferral:](v7, 0, 0);
      if (BackgroundSystemTasksLibraryCore()
        && (-[GEOMapDataSubscriptionUpdateSession updateType](v8, "updateType") == 2
         || -[GEOMapDataSubscriptionUpdateSession updateType](v8, "updateType") == 3))
      {
        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "taskRequestForIdentifier:", CFSTR("com.apple.geod.UpdateOfflineData"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          GEOGetSubscriptionsDownloadManagerLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Canceling scheduled automatic offline update background task due to forced update", buf, 2u);
          }

          objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          objc_msgSend(v12, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.UpdateOfflineData"), buf);

        }
      }
      objc_storeStrong((id *)(v7 + 72), v6);
      objc_msgSend(*(id *)(v7 + 72), "subscriptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](v7, v13, objc_msgSend(*(id *)(v7 + 72), "downloadMode"), 0, 3, -[GEOMapDataSubscriptionUpdateSession updateType](v8, "updateType"), 1);

    }
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
      (*(void (**)(void))(v14 + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
      (*(void (**)(void))(v15 + 16))();
  }
}

- (void)_cancelCurrentUpdateSession:(int)a3 dueToTaskDeferral:
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_QWORD *)(a1 + 72))
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Canceling current in-progress update session", buf, 2u);
    }

    v7 = *(id *)(a1 + 88);
    if (v7)
    {
      v8 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

      objc_msgSend(v7, "subscription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](a1, 0, v10, v11);

      objc_msgSend(v7, "cancel");
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 72), "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](a1, v17, 0);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 72), "backgroundTask");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a3)
    {
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 72), "backgroundTask");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v21 = objc_msgSend(v20, "setTaskExpiredWithRetryAfter:error:", &v26, 0.0);
        v22 = v26;

        if ((v21 & 1) == 0)
        {
          GEOGetSubscriptionsDownloadManagerLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v22;
            _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Failed to expire background task: %{public}@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 72), "backgroundTask");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setTaskCompleted");

        }
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      objc_msgSend(v18, "setTaskCompleted");
      v22 = v19;
    }

    v25 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    if (a2)
      -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](a1);

  }
}

- (void)_startNextDownloadIfNecessary
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _BYTE buf[24];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      if (!*(_QWORD *)(a1 + 88))
      {
        if (objc_msgSend(*(id *)(a1 + 80), "count"))
        {
          v2 = objc_msgSend(*(id *)(a1 + 80), "indexOfObjectPassingTest:", &__block_literal_global_109);
          v3 = *(void **)(a1 + 80);
          if (v2 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v3, "firstObject");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v2 = 0;
          }
          else
          {
            objc_msgSend(v3, "objectAtIndexedSubscript:", v2);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(*(id *)(a1 + 80), "removeObjectAtIndex:", v2);
        }
        else
        {
          v4 = 0;
        }
        objc_msgSend(v4, "subscription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          GEOGetSubscriptionsDownloadManagerLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "identifier");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 141558275;
            *(_QWORD *)&buf[4] = 1752392040;
            *(_WORD *)&buf[12] = 2113;
            *(_QWORD *)&buf[14] = v7;
            _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Starting download for subscription: %{private, mask.hash}@", buf, 0x16u);

          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v16 = 0;
          v14 = v5;
          geo_isolate_sync_data();
          v8 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
          objc_msgSend(v4, "auditToken");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "_createDownloaderForSubscription:mode:auditToken:", v14, v8, v9);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(void **)(a1 + 88);
          *(_QWORD *)(a1 + 88) = v10;

          v12 = *(void **)(a1 + 88);
          objc_msgSend(v14, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](a1, v12, v13, 0);

          objc_msgSend(*(id *)(a1 + 88), "resume");
          _Block_object_dispose(buf, 8);
        }

      }
    }
  }
}

void __81__GEOMapDataSubscriptionLocalDownloadManager__failCurrentUpdateSessionWithError___block_invoke(uint64_t a1, double a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  GEOGetSubscriptionsDownloadManagerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2 >= 0.0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Forced offline data update failed. Rescheduling automatic update", buf, 2u);
    }

    -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:](*(_QWORD *)(a1 + 32), 0, a2);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Forced offline data update failed. NOT scheduling automatic update because they are disabled", v6, 2u);
    }

  }
}

- (void)_finishedDownloadGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "remainingSubscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: group.remainingSubscriptions.count == 0", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v4, "backgroundTask");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTaskCompleted");

      if (*(void **)(a1 + 40) == v4)
      {
        *(_QWORD *)(a1 + 40) = 0;

        geo_isolate_sync();
      }
      else if (*(void **)(a1 + 48) == v4)
      {
        *(_QWORD *)(a1 + 48) = 0;

      }
    }
  }

}

uint64_t __69__GEOMapDataSubscriptionLocalDownloadManager__finishedDownloadGroup___block_invoke(uint64_t a1)
{
  return -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessary](*(_QWORD *)(a1 + 32));
}

_GEOMapDataSubscriptionQueuedDownload *__127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _GEOMapDataSubscriptionQueuedDownload *v4;

  v3 = a2;
  v4 = -[_GEOMapDataSubscriptionQueuedDownload initWithSubscription:auditToken:]([_GEOMapDataSubscriptionQueuedDownload alloc], "initWithSubscription:auditToken:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_3;
  v8[3] = &unk_1E1C04170;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8) == 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

void __127__GEOMapDataSubscriptionLocalDownloadManager__enqueueDownloadForSubscriptions_mode_auditToken_reason_updateType_enqueueAtHead___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v31;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v31 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v4);
        GEOGetSubscriptionsDownloadManagerLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 141558275;
          v35 = 1752392040;
          v36 = 2113;
          v37 = v7;
          _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Subscription '%{private, mask.hash}@' is queued for download", buf, 0x16u);

        }
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v8, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (!v12)
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count")
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: downloadersToCancel.count == 0", buf, 2u);
          }
          v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (!v13)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v16 = *(void **)(v15 + 40);
            *(_QWORD *)(v15 + 40) = v14;

            v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          }
          -[_GEOMapDataSubscriptionDownloadState downloader]((os_unfair_lock_s *)v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v17);

          -[_GEOMapDataSubscriptionDownloadState setDownloader:](v10, 0);
        }
        if (v10)
        {
          v18 = *(_QWORD *)(a1 + 64);
          os_unfair_lock_lock((os_unfair_lock_t)(v10 + 8));
          if (*(_QWORD *)(v10 + 56) != v18)
          {
            *(_QWORD *)(v10 + 56) = v18;
            -[_GEOMapDataSubscriptionDownloadState _updateProgressDownloadReason](v10);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
          -[_GEOMapDataSubscriptionDownloadState setQueuedForDownload:](v10, 1);
          v19 = *(_QWORD *)(a1 + 72);
          os_unfair_lock_lock((os_unfair_lock_t)(v10 + 8));
          *(_QWORD *)(v10 + 40) = v19;
          os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
          v20 = *(_QWORD *)(a1 + 80);
          os_unfair_lock_lock((os_unfair_lock_t)(v10 + 8));
          *(_QWORD *)(v10 + 48) = v20;
          os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
          v21 = *(void **)(v10 + 96);
        }
        else
        {
          -[_GEOMapDataSubscriptionDownloadState setQueuedForDownload:](0, 1);
          v21 = 0;
        }
        v22 = v21;
        v23 = objc_msgSend(v22, "downloadState") == 5;
        v24 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v24, v25, (void *)v10);
        else
          -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v24, v25);

        v26 = *(void **)(a1 + 48);
        objc_msgSend(v5, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, v27);

        ++v4;
      }
      while (v2 != v4);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v2 = v28;
    }
    while (v28);
  }

}

- (void)cancelDownloadForSubscriptionIdentifiers:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  GEOMapDataSubscriptionLocalDownloadManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__GEOMapDataSubscriptionLocalDownloadManager_cancelDownloadForSubscriptionIdentifiers___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __87__GEOMapDataSubscriptionLocalDownloadManager_cancelDownloadForSubscriptionIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++), 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;

  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[_GEOMapDataSubscriptionDownloadState downloader](v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke_106(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "subscription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

void __112__GEOMapDataSubscriptionLocalDownloadManager__cancelDownloadForSubscriptionIdentifier_shouldPersistPausedState___block_invoke_108(uint64_t a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  os_unfair_lock_s *v8;

  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2 + 2;
    v8 = v2;
    os_unfair_lock_lock(v2 + 2);
    v4 = *(_QWORD *)&v8[8]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3);
    v2 = v8;
    if (v4)
    {
      -[_GEOMapDataSubscriptionDownloadState setQueuedForDownload:]((uint64_t)v8, 0);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)&v8[24]._os_unfair_lock_opaque);
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "downloadState");
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      if (v5 == 5)
        -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessaryForIdentifier:state:](v6, v7, v8);
      else
        -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessaryForIdentifier:](v6, v7);
      v2 = v8;
    }
  }

}

BOOL __72__GEOMapDataSubscriptionLocalDownloadManager__popNextSubscriptionToLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "subscription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "policy") == 1;

  return v3;
}

- (id)_createDownloaderForSubscription:(id)a3 mode:(unint64_t)a4 auditToken:(id)a5
{
  id v8;
  id v9;
  GEOApplicationAuditToken *v10;
  void *v11;
  int BOOL;
  GEOApplicationAuditToken *v13;
  GEOMapDataSubscriptionDownloader *v14;
  GEOTileDB *tileDB;
  void *v16;
  OS_dispatch_queue *workQueue;
  void *v18;
  GEOMapDataSubscriptionUpdateSession *currentUpdateSession;
  uint64_t v20;
  GEOMapDataSubscriptionDownloader *v21;

  v8 = a3;
  v9 = a5;
  if (!GEOConfigGetBOOL(GeoServicesConfig_ShouldAttributeSubscriptionDownloads, (uint64_t)off_1EDF4E288))
    goto LABEL_6;
  v10 = (GEOApplicationAuditToken *)v9;
  if (v10)
    goto LABEL_7;
  objc_msgSend(v8, "_originatingBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    v10 = 0;
    goto LABEL_13;
  }
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldAttributeSubscriptionDownloadsToOriginatingBundle, (uint64_t)off_1EDF4E298);

  if (!BOOL)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v13 = [GEOApplicationAuditToken alloc];
  objc_msgSend(v8, "_originatingBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOApplicationAuditToken initWithProxiedApplicationBundleId:](v13, "initWithProxiedApplicationBundleId:", v11);
LABEL_13:

LABEL_7:
  v14 = [GEOMapDataSubscriptionDownloader alloc];
  tileDB = self->_tileDB;
  -[GEOOfflineDataConfiguration requiredLayers](self->_dataConfiguration, "requiredLayers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  GEOGetSubscriptionsDownloadManagerLog();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  currentUpdateSession = self->_currentUpdateSession;
  if (currentUpdateSession)
    currentUpdateSession = -[GEOMapDataSubscriptionUpdateSession updateType](currentUpdateSession, "updateType");
  v20 = ~((_BYTE)a4 << 7) & 0x80;
  if ((a4 & 2) != 0)
    v20 |= 0x50uLL;
  v21 = -[GEOMapDataSubscriptionDownloader initWithSubscription:diskCache:requiredOfflineLayers:delegate:delegateQueue:reason:requestOptions:auditToken:manifestManager:log:logPrefix:tileRequesterCreationBlock:tileDownloader:offlineDownloader:updateType:](v14, "initWithSubscription:diskCache:requiredOfflineLayers:delegate:delegateQueue:reason:requestOptions:auditToken:manifestManager:log:logPrefix:tileRequesterCreationBlock:tileDownloader:offlineDownloader:updateType:", v8, tileDB, v16, self, workQueue, 0, v20 & 0xFFFFFFFFFFFFFFDFLL | (32 * ((a4 >> 2) & 1)), v10, 0, v18, &stru_1E1C241D0, &__block_literal_global_115, 0, 0, currentUpdateSession);

  return v21;
}

GEOVoltaireTileRequester *__95__GEOMapDataSubscriptionLocalDownloadManager__createDownloaderForSubscription_mode_auditToken___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  GEOVoltaireTileRequester *v11;
  uint8_t v13[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (a2 == 2)
  {
    v11 = -[GEOSimpleTileRequester initWithTileRequest:delegateQueue:delegate:]([GEOVoltaireTileRequester alloc], "initWithTileRequest:delegateQueue:delegate:", v8, v9, v10);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: providerID == GEOVoltaireTileProvider", v13, 2u);
    }
    v11 = 0;
  }

  return v11;
}

void __75__GEOMapDataSubscriptionLocalDownloadManager__startNextDownloadIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  os_unfair_lock_s *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v2, v3);
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[_GEOMapDataSubscriptionDownloadState downloadMode](v4);
}

- (void)_cancelDownloadGroup:(uint64_t)a1 startNextDownloadIfNecessary:(void *)a2 dueToTaskDeferral:(int)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](a1, v12, 0);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "backgroundTask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a3)
    {
      if (v13)
      {
        objc_msgSend(v6, "backgroundTask");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v16 = objc_msgSend(v15, "setTaskExpiredWithRetryAfter:error:", &v21, 0.0);
        v17 = v21;

        if ((v16 & 1) == 0)
        {
          GEOGetSubscriptionsDownloadManagerLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v17;
            _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Failed to expire background task: %{public}@", buf, 0xCu);
          }

          objc_msgSend(v6, "backgroundTask");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setTaskCompleted");

        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      objc_msgSend(v13, "setTaskCompleted");
      v17 = v14;
    }

    v20 = (_QWORD *)(a1 + 40);
    if (*(void **)(a1 + 40) == v6 || (v20 = (_QWORD *)(a1 + 48), *(void **)(a1 + 48) == v6))
    {
      *v20 = 0;

    }
    -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](a1);
  }

}

void __135__GEOMapDataSubscriptionLocalDownloadManager__scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay_onlyWaitingForNonCellular___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessary](*(_QWORD *)(a1 + 32));
}

void __135__GEOMapDataSubscriptionLocalDownloadManager__scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay_onlyWaitingForNonCellular___block_invoke_117(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
    -[GEOMapDataSubscriptionLocalDownloadManager _startObservingWaitingConditionsIfNecessary](*(_QWORD *)(a1 + 32));
}

void __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id obj;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  _QWORD v26[5];
  NSObject *v27;
  _QWORD *v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v19 = a3;
  objc_msgSend(v18, "_geo_filtered:", &__block_literal_global_118);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__11;
  v34[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
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
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_3;
        v26[3] = &unk_1E1C04278;
        v28 = v34;
        v26[4] = v10;
        v29 = *(_BYTE *)(a1 + 48);
        v27 = v6;
        objc_msgSend(v11, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v12, v13, v26);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  v14 = *(void **)(a1 + 40);
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_4;
  block[3] = &unk_1E1C042A0;
  v24 = v34;
  v16 = v14;
  v17 = *(_QWORD *)(a1 + 32);
  v22 = v16;
  v23 = v17;
  v25 = *(_BYTE *)(a1 + 48);
  dispatch_group_notify(v6, v15, block);

  _Block_object_dispose(v34, 8);
}

unint64_t __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (!objc_msgSend(v4, "loadState"))
  {
    v3 = objc_msgSend(v4, "downloadState");
    if (!v3 || v3 == 5 || v3 == 4 && !*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  GEOMapDataSubscriptionDownloadGroup *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  GEOMapDataSubscriptionDownloadGroup *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  GEOGetSubscriptionsDownloadManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
      *(_DWORD *)buf = 134349056;
      v13 = v5;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Retrying download for %{public}llu subscriptions", buf, 0xCu);
    }

    if (*(_BYTE *)(a1 + 56))
      v6 = 0;
    else
      v6 = 6;
    v7 = -[GEOMapDataSubscriptionDownloadGroup initWithSubscriptions:downloadMode:auditToken:backgroundTask:delegate:delegateQueue:]([GEOMapDataSubscriptionDownloadGroup alloc], "initWithSubscriptions:downloadMode:auditToken:backgroundTask:delegate:delegateQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 40;
    if (!*(_BYTE *)(a1 + 56))
      v9 = 48;
    v10 = *(void **)(v8 + v9);
    *(_QWORD *)(v8 + v9) = v7;
    v11 = v7;

    -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](*(_QWORD *)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6, 0, 5, 0, 0);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "No un-downloaded offline subscriptions match criteria. Nothing to retry", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
    geo_isolate_sync();
  }
}

uint64_t __105__GEOMapDataSubscriptionLocalDownloadManager__offlineRetryBackgroundTaskFired_onlyWaitingForNonCellular___block_invoke_119(uint64_t a1)
{
  return -[GEOMapDataSubscriptionLocalDownloadManager _stopObservingWaitingConditionsIfNecessary](*(_QWORD *)(a1 + 32));
}

- (void)subscriptionDownloader:(id)a3 willUseOfflineDataVersions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  int BOOL;
  GEOMapDataSubscriptionUpdateSession *currentUpdateSession;
  id *p_currentUpdateSession;
  GEOOfflineDataConfiguration *dataConfiguration;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  GEOTileDB *tileDB;
  OS_dispatch_queue *workQueue;
  _QWORD v31[4];
  id v32;
  GEOMapDataSubscriptionLocalDownloadManager *v33;
  id v34;
  void (**v35)(id, uint64_t);
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[GEOOfflineDataConfiguration activeVersions](self->_dataConfiguration, "activeVersions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToDictionary:", v11) & 1) != 0)
  {
    BOOL = GEOConfigGetBOOL(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1EDF4EAB8);

    if (!BOOL)
    {
      p_currentUpdateSession = (id *)&self->_currentUpdateSession;
      currentUpdateSession = self->_currentUpdateSession;
      if (!currentUpdateSession)
      {
        if (-[GEOOfflineDataConfiguration isUpdateAvailable](self->_dataConfiguration, "isUpdateAvailable"))
        {
          dataConfiguration = self->_dataConfiguration;
          _getOfflineTileMetadata(self->_tileDB, v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOOfflineDataConfiguration updateCompletedWithVersions:tileMetadata:](dataConfiguration, "updateCompletedWithVersions:tileMetadata:", v9, v16);

        }
LABEL_17:
        v10[2](v10, 1);
        goto LABEL_18;
      }
LABEL_10:
      -[GEOMapDataSubscriptionUpdateSession offlineDataVersions](currentUpdateSession, "offlineDataVersions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *p_currentUpdateSession;
      if (v19)
      {
        objc_msgSend(v20, "offlineDataVersions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToDictionary:", v9);

        if ((v22 & 1) == 0)
        {
          GEOGetSubscriptionsDownloadManagerLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*p_currentUpdateSession, "completedSubscriptions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");
            *(_DWORD *)buf = 134349056;
            v37 = v25;
            _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_INFO, "Latest offline data versions changed mid-update. Will re-download %{public}llu subscriptions which had already been updated", buf, 0xCu);

          }
          -[GEOMapDataSubscriptionUpdateSession setOfflineDataVersions:](self->_currentUpdateSession, "setOfflineDataVersions:", v9);
          -[GEOMapDataSubscriptionDownloadGroup completedSubscriptions](self->_currentUpdateSession, "completedSubscriptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOMapDataSubscriptionDownloadGroup restartedSubscriptions:](self->_currentUpdateSession, "restartedSubscriptions:", v26);
          v27 = -[GEOMapDataSubscriptionDownloadGroup downloadMode](self->_currentUpdateSession, "downloadMode");
          -[GEOMapDataSubscriptionDownloadGroup auditToken](self->_currentUpdateSession, "auditToken");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:]((uint64_t)self, v26, v27, v28, 3, -[GEOMapDataSubscriptionUpdateSession updateType](self->_currentUpdateSession, "updateType"), 1);

        }
      }
      else
      {
        objc_msgSend(v20, "setOfflineDataVersions:", v9);
      }
      goto LABEL_17;
    }
  }
  else
  {

  }
  GEOGetSubscriptionsDownloadManagerLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    -[GEOOfflineDataConfiguration activeVersions](self->_dataConfiguration, "activeVersions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = (uint64_t)v18;
    v38 = 2114;
    v39 = v9;
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_INFO, "Latest offline data versions differ from active versions: %{public}@ -> %{public}@", buf, 0x16u);

  }
  -[GEOOfflineDataConfiguration setLatestAvailableVersions:](self->_dataConfiguration, "setLatestAvailableVersions:", v9);
  p_currentUpdateSession = (id *)&self->_currentUpdateSession;
  currentUpdateSession = self->_currentUpdateSession;
  if (currentUpdateSession)
    goto LABEL_10;
  tileDB = self->_tileDB;
  workQueue = self->_workQueue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke;
  v31[3] = &unk_1E1C03FA0;
  v35 = v10;
  v32 = v8;
  v33 = self;
  v34 = v9;
  -[GEOTileDB fetchAllSubscriptionsWithQueue:callback:](tileDB, "fetchAllSubscriptionsWithQueue:callback:", workQueue, v31);

LABEL_18:
}

void __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *group;
  _QWORD block[5];
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  char v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v25 = a3;
  v26 = v5;
  if (v25)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_121);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v40 = 0;
    group = dispatch_group_create();
    v6 = objc_msgSend(v24, "count");
    v7 = MEMORY[0x1E0C809B0];
    v8 = (_QWORD *)&unk_189CC1000;
    if (v6 >= 2)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if ((objc_msgSend(v13, "dataTypes", v24, v25) & 0x400) != 0)
            {
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "subscription");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v14, "isEqualToString:", v16);

              if ((v17 & 1) == 0)
              {
                dispatch_group_enter(group);
                v18 = *(void **)(a1 + 40);
                objc_msgSend(v13, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v32[0] = MEMORY[0x1E0C809B0];
                v32[1] = 3221225472;
                v32[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_3;
                v32[3] = &unk_1E1C042F0;
                v34 = v39;
                v33 = group;
                objc_msgSend(v18, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v19, v20, v32);

              }
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v10);
      }

      v7 = MEMORY[0x1E0C809B0];
      v8 = &unk_189CC1000;
    }
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(void **)(a1 + 48);
    v23 = *(NSObject **)(v21 + 8);
    block[0] = v7;
    block[1] = v8[96];
    block[2] = __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_4;
    block[3] = &unk_1E1C04318;
    v31 = v39;
    block[4] = v21;
    v29 = v22;
    v30 = *(id *)(a1 + 56);
    dispatch_group_notify(group, v23, block);

    _Block_object_dispose(v39, 8);
  }

}

unint64_t __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  if ((unint64_t)(objc_msgSend(a2, "loadState") - 1) <= 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __114__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_willUseOfflineDataVersions_completionHandler___block_invoke_4(_QWORD *a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
  GEOGetSubscriptionsDownloadManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Downloader would use new data versions, but existing subscriptions need to be updated first", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Downloader would use new data versions, but there are no existing, fully-downloaded subscriptions. Allowing", v6, 2u);
    }

    objc_msgSend(*(id *)(a1[4] + 32), "updateCompletedWithVersions:tileMetadata:", a1[5], 0);
  }
  return (*(uint64_t (**)(_QWORD, BOOL))(a1[6] + 16))(a1[6], *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) == 0);
}

- (void)subscriptionDownloader:(id)a3 didFinishWithError:(id)a4
{
  GEOMapDataSubscriptionDownloader *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  GEOTileDB *tileDB;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  _BOOL4 v26;
  GEOTileDB *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id WeakRetained;
  void *v34;
  NSObject *workQueue;
  id v36;
  BOOL v37;
  void *v38;
  void *v39;
  OS_dispatch_queue *v40;
  _QWORD v41[4];
  id v42;
  GEOMapDataSubscriptionDownloader *v43;
  GEOMapDataSubscriptionLocalDownloadManager *v44;
  uint64_t *v45;
  _BYTE *v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  GEOMapDataSubscriptionLocalDownloadManager *v52;
  GEOMapDataSubscriptionDownloader *v53;
  _BYTE *v54;
  uint64_t *v55;
  _QWORD block[4];
  id v57;
  _BYTE *v58;
  _QWORD v59[4];
  NSObject *v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  _BYTE buf[24];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = (GEOMapDataSubscriptionDownloader *)a3;
  v7 = a4;
  if (self->_currentDownloader != v6)
    goto LABEL_32;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  GEOGetSubscriptionsDownloadManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558275;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Successfully downloaded subscription '%{private, mask.hash}@'", buf, 0x16u);

    }
    tileDB = self->_tileDB;
    -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTileDB clearDownloadStateForSubscriptionWithIdentifier:](tileDB, "clearDownloadStateForSubscriptionWithIdentifier:", v21);

    if (self->_currentUpdateSession)
      goto LABEL_29;
    -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
    v22 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject dataTypes](v22, "dataTypes") & 0x400) != 0)
    {
      -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "policy") == 1;

      if (!v24)
        goto LABEL_26;
      -[GEOOfflineDataConfiguration setLastUpdatedDateToNow](self->_dataConfiguration, "setLastUpdatedDateToNow");
      -[GEOOfflineDataConfiguration tileMetadata](self->_dataConfiguration, "tileMetadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

      if (v26)
      {
        v27 = self->_tileDB;
        -[GEOOfflineDataConfiguration activeVersions](self->_dataConfiguration, "activeVersions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _getOfflineTileMetadata(v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOOfflineDataConfiguration setTileMetadata:](self->_dataConfiguration, "setTileMetadata:", v29);

      }
      -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetSubscriptionsDownloadManagerLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v30, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558275;
        *(_QWORD *)&buf[4] = 1752392040;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v32;
        _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_INFO, "Finished downloading offline subscription '%{private, mask.hash}@' for the first time. Asking to display notification", buf, 0x16u);

      }
      v22 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v67) = 0;
      if (GEOConfigGetBOOL(MapsFeaturesConfig_StandaloneWatchOffline, (uint64_t)off_1EDF4B158))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (WeakRetained)
        {
          dispatch_group_enter(v22);
          objc_msgSend(v30, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = v10;
          v59[1] = 3221225472;
          v59[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke;
          v59[3] = &unk_1E1C04340;
          v61 = buf;
          v60 = v22;
          objc_msgSend(WeakRetained, "downloadManager:fetchShouldSyncToActivePairedDeviceForIdentifier:completionHandler:", self, v34, v59);

        }
      }
      workQueue = self->_workQueue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2;
      block[3] = &unk_1E1BFF920;
      v57 = v30;
      v58 = buf;
      v36 = v30;
      dispatch_group_notify(v22, workQueue, block);

      _Block_object_dispose(buf, 8);
    }

LABEL_26:
    if (!self->_currentUpdateSession)
      notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
    goto LABEL_29;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558531;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    v67 = v7;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Finished download of subscription '%{private, mask.hash}@' with error: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v7, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v14))
  {
    v15 = objc_msgSend(v7, "code") == -28;

    if (v15)
    {
      if (self->_currentUpdateSession)
      {
        GEOGetSubscriptionsDownloadManagerLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, "Encountered version mismatch error during update. That should not be possible.", buf, 2u);
        }

      }
      else
      {
        *((_BYTE *)v63 + 24) = 1;
      }
    }
  }
  else
  {

  }
LABEL_29:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v67 = 0;
  if (*((_BYTE *)v63 + 24))
  {
    v48 = v10;
    v49 = 3221225472;
    v50 = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_127;
    v51 = &unk_1E1C043B0;
    v52 = self;
    v53 = v6;
    v54 = buf;
    v55 = &v62;
    geo_isolate_sync_data();

  }
  v37 = self->_currentUpdateSession != 0;
  -[GEOMapDataSubscriptionDownloader subscription](v6, "subscription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = self->_workQueue;
  v41[0] = v10;
  v41[1] = 3221225472;
  v41[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_128;
  v41[3] = &unk_1E1C04400;
  v47 = v37;
  v45 = &v62;
  v42 = v7;
  v43 = v6;
  v44 = self;
  v46 = buf;
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, v39, v40, v41);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v62, 8);
LABEL_32:

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0CB3B38];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_3;
  v5[3] = &unk_1E1C04368;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "geo_withMapsNotificationProviderDaemon:errorHandler:", v5, &__block_literal_global_126);

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishedDownloadingOfflineSubscription:withDisplayName:willSyncToPairedDevice:", v6, v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetSubscriptionsDownloadManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_127(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  int v8;
  os_unfair_lock_s *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v2, v4);
  v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[_GEOMapDataSubscriptionDownloadState downloadMode](v5);
  v6 = -[_GEOMapDataSubscriptionDownloadState downloadReason](v5);
  if (v6 == (os_unfair_lock_s *)3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v8 = 134217984;
      v9 = -[_GEOMapDataSubscriptionDownloadState downloadReason](v5);
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Unexpected download reason: %lli", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6 == (os_unfair_lock_s *)4)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Not initiating update because update already occurred/failed", (uint8_t *)&v8, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  void *v38;
  BOOL v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double Double;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  NSObject *v60;
  _QWORD *v61;
  uint64_t *v62;
  double v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[5];
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t);
  void *v97;
  uint64_t v98;
  id v99;
  _BYTE *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  void (*v106)(uint64_t, double);
  void *v107;
  uint64_t v108;
  _BYTE buf[24];
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v88 = a2;
  v89 = a3;
  if (*(_BYTE *)(a1 + 72) || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) || !*(_QWORD *)(a1 + 32))
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v46, "dataTypes") & 0x400) == 0)
  {

LABEL_3:
    v5 = 0;
    v6 = 0;
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v73, "isEqualToString:", v74))
  {
    v75 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v75 == -2)
      goto LABEL_3;
  }
  else
  {

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v110 = 0;
  v94 = MEMORY[0x1E0C809B0];
  v96 = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_129;
  v97 = &unk_1E1BFF8F8;
  v77 = *(void **)(a1 + 40);
  v76 = *(_QWORD *)(a1 + 48);
  v95 = 3221225472;
  v98 = v76;
  v99 = v77;
  v100 = buf;
  geo_isolate_sync_data();
  v78 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  if (!v78 || v78 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "code") == -1005)
      {

LABEL_76:
        v6 = 1;
        v80 = 3;
        goto LABEL_77;
      }
      v81 = objc_msgSend(*(id *)(a1 + 32), "code") == -1009;

      if (v81)
        goto LABEL_76;
    }
    else
    {

    }
  }
  v6 = 0;
  v80 = 2;
LABEL_77:
  v82 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "identifier");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloadState:forIdentifier:](v82, v80, v84);

  _Block_object_dispose(buf, 8);
  v5 = 1;
LABEL_4:
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionLocalDownloadManager _updateStateWithDownloader:forIdentifier:error:](v7, 0, v9, *(void **)(a1 + 32));

  v10 = *(void **)(*(_QWORD *)(a1 + 48) + 88);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88) = 0;

  v11 = *(void **)(*(_QWORD *)(a1 + 48) + 72);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishedDownloadingSubscription:withError:", v12, *(_QWORD *)(a1 + 32));

  v13 = *(void **)(*(_QWORD *)(a1 + 48) + 72);
  if (!v13)
    goto LABEL_45;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v13, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "subscription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    v17 = *(_QWORD *)(a1 + 48);
    if ((v16 & 1) != 0)
    {
      v87 = *(id *)(a1 + 32);
      if (v17)
      {
        v18 = *(void **)(v17 + 72);
        if (v18)
        {
          v19 = v18;
          objc_msgSend(*(id *)(v17 + 72), "remainingSubscriptions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          GEOGetSubscriptionsDownloadManagerLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = objc_msgSend(v20, "count");
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v87;
            *(_WORD *)&buf[12] = 2050;
            *(_QWORD *)&buf[14] = v22;
            _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Update session failed with error: %{public}@. Canceling download of %{public}llu remaining subscriptions", buf, 0x16u);
          }

          v103 = 0u;
          v104 = 0u;
          v102 = 0u;
          v101 = 0u;
          v23 = v20;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, buf, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v102;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v102 != v25)
                  objc_enumerationMutation(v23);
                objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "identifier", v87, v88, v89);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadForSubscriptionIdentifier:shouldPersistPausedState:](v17, v27, 0);

              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, buf, 16);
            }
            while (v24);
          }

          objc_msgSend(*(id *)(v17 + 72), "backgroundTask");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTaskCompleted");

          v29 = *(void **)(v17 + 72);
          *(_QWORD *)(v17 + 72) = 0;

          if ((objc_msgSend(v19, "updateType") == 2 || objc_msgSend(v19, "updateType") == 3)
            && objc_msgSend(*(id *)(v17 + 32), "isUpdateAvailable", v87))
          {
            *(_QWORD *)&v105 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v105 + 1) = 3221225472;
            v106 = __81__GEOMapDataSubscriptionLocalDownloadManager__failCurrentUpdateSessionWithError___block_invoke;
            v107 = &unk_1E1C04120;
            v108 = v17;
            -[GEOMapDataSubscriptionLocalDownloadManager _determineAutomaticOfflineUpdateDelay:](v17, &v105);
          }
          else if (objc_msgSend(v19, "updateType", v87) == 1)
          {
            if ((objc_msgSend(*(id *)(v17 + 32), "isUpdateAvailable") & 1) == 0
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              LOWORD(v105) = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _dataConfiguration.updateAvailable", (uint8_t *)&v105, 2u);
            }
            Double = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesRetryDelay, (uint64_t)off_1EDF4E958);
            GEOGetSubscriptionsDownloadManagerLog();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              LODWORD(v105) = 134217984;
              *(_QWORD *)((char *)&v105 + 4) = (unint64_t)Double;
              _os_log_impl(&dword_1885A9000, v48, OS_LOG_TYPE_INFO, "Automatic offline data update failed. Retrying after a minimum of %llu seconds", (uint8_t *)&v105, 0xCu);
            }

            -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:](v17, 0, Double);
          }

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _currentUpdateSession != ((void *)0)", buf, 2u);
        }
      }

      goto LABEL_45;
    }
    v13 = *(void **)(v17 + 72);
  }
  objc_msgSend(v13, "remainingSubscriptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count") == 0;

  if (!v31)
    goto LABEL_45;
  v32 = *(_QWORD *)(a1 + 48);
  if (!v32)
    goto LABEL_45;
  v33 = *(void **)(v32 + 72);
  if (!v33)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v85 = MEMORY[0x1E0C81028];
    v86 = "Assertion failed: _currentUpdateSession != ((void *)0)";
LABEL_84:
    _os_log_fault_impl(&dword_1885A9000, v85, OS_LOG_TYPE_FAULT, v86, buf, 2u);
    goto LABEL_45;
  }
  objc_msgSend(v33, "remainingSubscriptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count") == 0;

  if (!v35)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v85 = MEMORY[0x1E0C81028];
    v86 = "Assertion failed: _currentUpdateSession.remainingSubscriptions.count == 0";
    goto LABEL_84;
  }
  GEOGetSubscriptionsDownloadManagerLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_INFO, "Successfully completed current update session", buf, 2u);
  }

  objc_msgSend(*(id *)(v32 + 72), "backgroundTask");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTaskCompleted");

  objc_msgSend(*(id *)(v32 + 72), "offlineDataVersions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (v39)
  {
    _setValue(GeoOfflineConfig_SimulateDataUpdateAvailable, (uint64_t)off_1EDF4EAB8, 0, 0, 0);
  }
  else
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_INFO, "Switching to new active offline data versions", buf, 2u);
    }

    v41 = *(void **)(v32 + 32);
    objc_msgSend(*(id *)(v32 + 72), "offlineDataVersions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(void **)(v32 + 64);
    objc_msgSend(*(id *)(v32 + 72), "offlineDataVersions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _getOfflineTileMetadata(v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "updateCompletedWithVersions:tileMetadata:", v42, v45);

  }
  v49 = *(void **)(v32 + 72);
  *(_QWORD *)(v32 + 72) = 0;

  notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
LABEL_45:
  v50 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
  objc_msgSend(*(id *)(a1 + 40), "subscription", v87);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "finishedDownloadingSubscription:withError:", v51, *(_QWORD *)(a1 + 32));

  v52 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "finishedDownloadingSubscription:withError:", v53, *(_QWORD *)(a1 + 32));

  v54 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v54 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "remainingSubscriptions");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count") == 0;

    v54 = *(_QWORD *)(a1 + 48);
    if (v56)
    {
      -[GEOMapDataSubscriptionLocalDownloadManager _finishedDownloadGroup:](v54, *(void **)(v54 + 40));
      v54 = *(_QWORD *)(a1 + 48);
    }
  }
  v57 = *(void **)(v54 + 48);
  if (v57)
  {
    objc_msgSend(v57, "remainingSubscriptions");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "count") == 0;

    if (v59)
      -[GEOMapDataSubscriptionLocalDownloadManager _finishedDownloadGroup:](*(_QWORD *)(a1 + 48), *(void **)(*(_QWORD *)(a1 + 48) + 48));
  }
  if (v5)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v60, OS_LOG_TYPE_INFO, "Offline subscription failed. Scheduling automatic retry", buf, 2u);
    }

    if (v6)
      v61 = &GeoOfflineConfig_OfflineDownloadWaitForInexpensiveNetworkingDelay;
    else
      v61 = &GeoOfflineConfig_FailedOfflineDownloadRetryDelay;
    v62 = (uint64_t *)&unk_1EDF4EB48;
    if (!v6)
      v62 = (uint64_t *)&unk_1EDF4EB58;
    v63 = GEOConfigGetDouble(*v61, *v62);
    -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionRetryWithMinimumDelay:onlyWaitingForNonCellular:](*(char **)(a1 + 48), v6, v63);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "subscription");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "auditToken");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "subscription");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "dataTypes");
    v69 = *(_QWORD *)(a1 + 64);
    v70 = *(_QWORD *)(*(_QWORD *)(v69 + 8) + 24);
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_130;
    v90[3] = &unk_1E1C043D8;
    v90[4] = *(_QWORD *)(a1 + 48);
    v91 = v64;
    v92 = v65;
    v93 = v69;
    v71 = v65;
    v72 = v64;
    -[GEOMapDataSubscriptionLocalDownloadManager _startUpdateForUserInitiatedSubscriptionsForDataType:mode:updateType:auditToken:forBackgroundTask:startedHandler:](v66, v68, v70, 3, v71, 0, v90);

  }
  else
  {
    -[GEOMapDataSubscriptionLocalDownloadManager _startNextDownloadIfNecessary](*(_QWORD *)(a1 + 48));
  }

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_129(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapDataSubscriptionLocalDownloadManager _stateForSubscriptionWithIdentifier:](v2, v4);
  v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    os_unfair_lock_lock(v6 + 2);
    v5 = *(_QWORD *)&v6[16]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v6 + 2);
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

void __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_130(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "subscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_131;
  v6[3] = &unk_1E1C04170;
  v7 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v6);

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapDataSubscriptionLocalDownloadManager _enqueueDownloadForSubscriptions:mode:auditToken:reason:updateType:enqueueAtHead:](v4, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(void **)(a1 + 48), 4, 0, 0);

  }
}

uint64_t __88__GEOMapDataSubscriptionLocalDownloadManager_subscriptionDownloader_didFinishWithError___block_invoke_2_131(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  NSObject *workQueue;
  objc_super v13;
  _QWORD block[5];
  id v15;

  v10 = a4;
  v11 = v10;
  if ((void *)_KVOContext == a6)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E1C00738;
    block[4] = self;
    v15 = v10;
    dispatch_async(workQueue, block);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOMapDataSubscriptionLocalDownloadManager;
    -[GEOMapDataSubscriptionLocalDownloadManager observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

void __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  if (v7[5] && v13[5])
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "downloadManager:didUpdateState:forIdentifier:", *(_QWORD *)(a1 + 32), v7[5], v13[5], v3, 3221225472, __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2, &unk_1E1C043B0, v4, v5, &v6, &v12);

  }
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

void __93__GEOMapDataSubscriptionLocalDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1[4] + 112);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1[4] + 112), "objectForKeyedSubscript:", v7, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)a1[5];

        if (v8 == v9)
        {
          v10 = a1[5];
          if (v10)
            v11 = *(void **)(v10 + 96);
          else
            v11 = 0;
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v11);
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)subscriptionDownloadGroupDidDefer:(id)a3
{
  GEOMapDataSubscriptionUpdateSession *v4;
  GEOMapDataSubscriptionUpdateSession *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];
  uint8_t v10[16];

  v4 = (GEOMapDataSubscriptionUpdateSession *)a3;
  v5 = v4;
  if (self->_currentUpdateSession == v4)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Current update has been deferred", buf, 2u);
    }

    -[GEOMapDataSubscriptionLocalDownloadManager _cancelCurrentUpdateSession:dueToTaskDeferral:]((uint64_t)self, 1, 1);
  }
  else if ((GEOMapDataSubscriptionUpdateSession *)self->_offlineInexpensiveDownloadGroup == v4
         || (GEOMapDataSubscriptionUpdateSession *)self->_offlineRetryFailedDownloadGroup == v4)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Retry download group has been deferred", v8, 2u);
    }

    -[GEOMapDataSubscriptionLocalDownloadManager _cancelDownloadGroup:startNextDownloadIfNecessary:dueToTaskDeferral:]((uint64_t)self, v5, 1);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: group == _currentUpdateSession || group == _offlineInexpensiveDownloadGroup || group == _offlineRetryFailedDownloadGroup", v10, 2u);
  }

}

- (void)offlineDataConfiguration:(id)a3 didChangeUpdateAvailability:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  GEOMapDataSubscriptionLocalDownloadManager *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__11;
  v32 = __Block_byref_object_dispose__11;
  v33 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke;
  v25 = &unk_1E1C00760;
  v26 = self;
  v27 = &v28;
  geo_isolate_sync_data();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)v29[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        -[GEOMapDataSubscriptionLocalDownloadManager _updateStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:]((uint64_t)self, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11++), self->_workQueue, &__block_literal_global_134);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v34, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v28, 8);
  if (!self->_currentUpdateSession)
  {
    if (a4)
    {
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke_3;
      v16[3] = &unk_1E1C04468;
      v16[4] = self;
      -[GEOMapDataSubscriptionLocalDownloadManager _determineIfShouldScheduleAutomaticUpdate:]((uint64_t)self, v16);
    }
    else if (BackgroundSystemTasksLibraryCore())
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "taskRequestForIdentifier:", CFSTR("com.apple.geod.UpdateOfflineData"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (!v14)
      {
        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_backgroundTaskSchedulerClass"), "sharedScheduler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        objc_msgSend(v15, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.UpdateOfflineData"), &v17);

      }
    }
  }

}

void __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __99__GEOMapDataSubscriptionLocalDownloadManager_offlineDataConfiguration_didChangeUpdateAvailability___block_invoke_3(uint64_t a1, int a2, double a3)
{
  NSObject *v5;
  double Double;
  uint64_t Uint64;
  double v8;
  uint64_t v9;
  uint8_t v10[16];

  if (a2)
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Informed of new offline data versions. Scheduling automatic update", v10, 2u);
    }

    Double = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1EDF4E968);
    Uint64 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78);
    if (Double >= ((double)(unint64_t)Uint64 + (double)(unint64_t)Uint64) / 3.0)
    {
      v9 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78);
      v8 = ((double)(unint64_t)v9 + (double)(unint64_t)v9) / 3.0;
    }
    else
    {
      v8 = GEOConfigGetDouble(GeoOfflineConfig_AutomaticUpdatesInitialMaxDelay, (uint64_t)off_1EDF4E968);
    }
    -[GEOMapDataSubscriptionLocalDownloadManager _scheduleOfflineUserInitiatedSubscriptionUpdateWithMinimumDelay:maxRandomizedDelay:](*(_QWORD *)(a1 + 32), vcvtmd_u64_f64(v8), a3);
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke(uint64_t a1, double a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[8];
  _QWORD v9[5];
  id v10;
  double v11;

  if (a2 >= 0.0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(v4 + 64);
    v7 = *(_QWORD *)(v4 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_2;
    v9[3] = &unk_1E1C044B8;
    v9[4] = v4;
    v11 = a2;
    v10 = v5;
    objc_msgSend(v6, "fetchAllSubscriptionsWithQueue:callback:", v7, v9);

  }
  else
  {
    GEOGetSubscriptionsDownloadManagerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Automatic updates are disabled. No need to schedule any update", v8, 2u);
    }

    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(-1.0);
  }
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id obj;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[5];
  NSObject *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = a3;
  objc_msgSend(v16, "_geo_filtered:", &__block_literal_global_135);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__11;
  v30[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        dispatch_group_enter(v6);
        v11 = (void *)a1[4];
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1[4] + 8);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_4;
        v23[3] = &unk_1E1C040A8;
        v25 = v30;
        v23[4] = v10;
        v24 = v6;
        objc_msgSend(v11, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v12, v13, v23);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  v14 = (void *)a1[5];
  v15 = *(NSObject **)(a1[4] + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_5;
  block[3] = &unk_1E1C04490;
  v21 = v30;
  v22 = a1[6];
  v20 = v14;
  dispatch_group_notify(v6, v15, block);

  _Block_object_dispose(v30, 8);
}

unint64_t __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  if ((unint64_t)(objc_msgSend(a2, "loadState") - 1) <= 2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __88__GEOMapDataSubscriptionLocalDownloadManager__determineIfShouldScheduleAutomaticUpdate___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  __n128 v6;
  __n128 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count");
  GEOGetSubscriptionsDownloadManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = a1[6];
      v9 = 134217984;
      v10 = v5;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Should schedule autoupdate after %.1f seconds", (uint8_t *)&v9, 0xCu);
    }

    v6.n128_u64[0] = a1[6];
    return (*(uint64_t (**)(__n128))(a1[4] + 16))(v6);
  }
  else
  {
    if (v4)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "No fully-downloaded offline subscriptions -- no need to schedule any update", (uint8_t *)&v9, 2u);
    }

    v8.n128_u64[0] = -1.0;
    return (*(uint64_t (**)(__n128))(a1[4] + 16))(v8);
  }
}

void __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isEqualToDictionary:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = v2;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke_2;
    v7[3] = &unk_1E1C04508;
    v7[4] = v5;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

void __67__GEOMapDataSubscriptionLocalDownloadManager__updateWaitingReasons__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  -[_GEOMapDataSubscriptionDownloadState setWaitingUserInfo:]((uint64_t)v5, *(void **)(*(_QWORD *)(a1 + 32) + 136));
  if (v5)
    v6 = (void *)v5[12];
  else
    v6 = 0;
  if (objc_msgSend(v6, "downloadState") == 5)
  {
    if (v5)
      v7 = v5[12];
    else
      v7 = 0;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v8);
  }

}

- (void)_networkReachabilityChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__GEOMapDataSubscriptionLocalDownloadManager__networkReachabilityChanged___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __74__GEOMapDataSubscriptionLocalDownloadManager__networkReachabilityChanged___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionLocalDownloadManager _updateWaitingReasons](*(_QWORD *)(a1 + 32));
}

- (GEOMapDataSubscriptionDownloadManagerDelegate)delegate
{
  return (GEOMapDataSubscriptionDownloadManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWaitingUserInfo, 0);
  objc_storeStrong((id *)&self->_waitingObservers, 0);
  objc_storeStrong((id *)&self->_subscriptionStates, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_pendingSubscriptionsToLoad, 0);
  objc_storeStrong((id *)&self->_currentUpdateSession, 0);
  objc_storeStrong((id *)&self->_tileDB, 0);
  objc_storeStrong((id *)&self->_offlineDataSizeEstimationRequester, 0);
  objc_storeStrong((id *)&self->_offlineRetryFailedDownloadGroup, 0);
  objc_storeStrong((id *)&self->_offlineInexpensiveDownloadGroup, 0);
  objc_storeStrong((id *)&self->_dataConfiguration, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
