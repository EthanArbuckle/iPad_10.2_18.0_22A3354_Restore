@implementation GEOMapDataSubscriptionExpirationHelper

+ (GEOMapDataSubscriptionExpirationHelper)sharedHelper
{
  if (_MergedGlobals_335 != -1)
    dispatch_once(&_MergedGlobals_335, &__block_literal_global_204);
  return (GEOMapDataSubscriptionExpirationHelper *)(id)qword_1ECDBCC10;
}

void __54__GEOMapDataSubscriptionExpirationHelper_sharedHelper__block_invoke()
{
  GEOMapDataSubscriptionExpirationHelper *v0;
  void *v1;

  v0 = objc_alloc_init(GEOMapDataSubscriptionExpirationHelper);
  v1 = (void *)qword_1ECDBCC10;
  qword_1ECDBCC10 = (uint64_t)v0;

}

- (GEOMapDataSubscriptionExpirationHelper)init
{
  GEOMapDataSubscriptionExpirationHelper *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  GEOMapDataSubscriptionExpirationHelper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapDataSubscriptionExpirationHelper;
  v2 = -[GEOMapDataSubscriptionExpirationHelper init](&v7, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_workloop_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  int fullyDownloadedSubscriptionsChangedToken;
  objc_super v4;

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  fullyDownloadedSubscriptionsChangedToken = self->_fullyDownloadedSubscriptionsChangedToken;
  if (fullyDownloadedSubscriptionsChangedToken != -1)
    notify_cancel(fullyDownloadedSubscriptionsChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)GEOMapDataSubscriptionExpirationHelper;
  -[GEOMapDataSubscriptionExpirationHelper dealloc](&v4, sel_dealloc);
}

- (void)configureWithDB:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *queue;
  const char *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v14;
  id location;
  _QWORD block[5];

  v5 = a3;
  if (self->_db)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(location) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _db == ((void *)0)", (uint8_t *)&location, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_db, a3);
    -[GEOTileDB registerObserver:queue:](self->_db, "registerObserver:queue:", self, self->_queue);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__subscriptionsDidChange_, 0x1E1CA61B0, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__subscriptionsDidChange_, 0x1E1CA61D0, 0);

    +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerObserver:queue:", self, self->_queue);

    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageEnabled, (uint64_t)off_1EDF4EA38, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageLastUsedDeleteInterval, (uint64_t)off_1EDF4EA48, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_OptimizeStorageNeverUsedDeleteInterval, (uint64_t)off_1EDF4EA58, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval, (uint64_t)off_1EDF4EA88, self->_queue, self);
    _GEOConfigAddDelegateListenerForKey(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1EDF4EAA8, self->_queue, self);
    v9 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(queue, block);
    objc_initWeak(&location, self);
    v11 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
    v12 = self->_queue;
    handler[0] = v9;
    handler[1] = 3221225472;
    handler[2] = __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke_2;
    handler[3] = &unk_1E1C05280;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v11, &self->_fullyDownloadedSubscriptionsChangedToken, v12, handler);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary](*(_QWORD *)(a1 + 32));
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if ((GEOConfigGetBOOL(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1EDF4EC88) & 1) == 0)
    {
      +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(v2 + 8);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke;
      v5[3] = &unk_1E1C02930;
      v5[4] = v2;
      objc_msgSend(v3, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", v4, v5);

    }
  }
}

- (uint64_t)_scheduleExpirationTaskIfNecessary
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v1 = result;
    result = BackgroundSystemTasksLibraryCore();
    if (result)
    {
      v3 = *(_QWORD *)(v1 + 8);
      v2 = *(void **)(v1 + 16);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __76__GEOMapDataSubscriptionExpirationHelper__scheduleExpirationTaskIfNecessary__block_invoke;
      v4[3] = &unk_1E1C20B08;
      v4[4] = v1;
      return objc_msgSend(v2, "getNextSubscriptionExpirationDateWithQueue:callback:", v3, v4);
    }
  }
  return result;
}

- (void)_scheduleUpcomingExpirationTaskIfNecessary
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (a1
    && (GEOConfigGetBOOL(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1EDF4EAA8) & 1) == 0)
  {
    if (BackgroundSystemTasksLibraryCore())
    {
      +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1 + 8);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __84__GEOMapDataSubscriptionExpirationHelper__scheduleUpcomingExpirationTaskIfNecessary__block_invoke;
      v4[3] = &unk_1E1C02930;
      v4[4] = a1;
      objc_msgSend(v2, "_fetchFullyDownloadedSubscriptionsOfType:includeOutOfDate:callbackQueue:completionHandler:", 1024, 1, v3, v4);

    }
  }
}

void __58__GEOMapDataSubscriptionExpirationHelper_configureWithDB___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary]((uint64_t)WeakRetained);

  v3 = objc_loadWeakRetained(v1);
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary]((uint64_t)v3);

}

void __76__GEOMapDataSubscriptionExpirationHelper__scheduleExpirationTaskIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  __CFString *v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  const __CFString *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 && v6)
  {
    GEOGetSubscriptionExpirationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = *(double *)&v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch next expiration date: %{public}@", buf, 0xCu);
    }
    goto LABEL_33;
  }
  objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "taskRequestForIdentifier:", CFSTR("com.apple.geod.ExpireSubscription"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v10);
    v12 = v11;

    GEOGetSubscriptionExpirationLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12 <= 0.0)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "Next expiration date is in the past. Performing expiration immediately", buf, 2u);
      }

      if (v8)
      {
        objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v26, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.ExpireSubscription"), &v31);

      }
      objc_msgSend(*(id *)(a1 + 32), "runBackgroundTask:orIdentifier:", 0, CFSTR("com.apple.geod.ExpireSubscription"));
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 134217984;
        v34 = v12;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "Next expiration date is in %f seconds. Scheduling XPC activity", buf, 0xCu);
      }

      _createBGNonRepeatingSystemTaskRequest(CFSTR("com.apple.geod.ExpireSubscription"), v12);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v8)
        {
          v30 = 0;
          v19 = objc_msgSend(v17, "updateTaskRequest:error:", v16, &v30);
          v20 = (__CFString *)v30;

          if ((v19 & 1) == 0)
          {
            GEOGetSubscriptionExpirationLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = CFSTR("Unknown");
              if (v20)
                v22 = v20;
              *(_DWORD *)buf = 138412290;
              v34 = *(double *)&v22;
              v23 = "Failed to update existing task with error: %@";
LABEL_30:
              _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
              goto LABEL_31;
            }
            goto LABEL_31;
          }
        }
        else
        {
          v29 = 0;
          v27 = objc_msgSend(v17, "submitTaskRequest:error:", v16, &v29);
          v20 = (__CFString *)v29;

          if ((v27 & 1) == 0)
          {
            GEOGetSubscriptionExpirationLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v28 = CFSTR("Unknown");
              if (v20)
                v28 = v20;
              *(_DWORD *)buf = 138412290;
              v34 = *(double *)&v28;
              v23 = "Failed to submit task with error: %@";
              goto LABEL_30;
            }
LABEL_31:

          }
        }

      }
    }
  }
  else
  {
    GEOGetSubscriptionExpirationLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, "No upcoming subscriptions will expire. Not scheduling XPC activity", buf, 2u);
    }

    if (v8)
    {
      objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v25, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.ExpireSubscription"), &v32);

    }
  }
LABEL_33:

}

void __84__GEOMapDataSubscriptionExpirationHelper__scheduleUpcomingExpirationTaskIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double Uint64;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  __CFString *v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  void *v24;
  char v25;
  const __CFString *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.geod.ExpireSubscription.Upcoming"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "count");
  if (v6)
  {
    Uint64 = (double)(unint64_t)GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78);
    if ((double)(unint64_t)GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval, (uint64_t)off_1EDF4EA88) < Uint64)Uint64 = (double)(unint64_t)GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval, (uint64_t)off_1EDF4EA88);
    _nextSubscriptionUpdateRequiredExpirationDate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", -Uint64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    GEOGetSubscriptionExpirationLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12 <= 0.0)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "Next pending expiration notification date is in the past. Posting notification immediately", buf, 2u);
      }

      if (v5)
      {
        objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(v24, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.ExpireSubscription.Upcoming"), &v29);

      }
      objc_msgSend(*(id *)(a1 + 32), "runBackgroundTask:orIdentifier:", 0, CFSTR("com.apple.geod.ExpireSubscription.Upcoming"));
      goto LABEL_29;
    }
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      v32 = v12;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "Next pending expiration notification date is in %f seconds. Scheduling XPC activity", buf, 0xCu);
    }

    _createBGNonRepeatingSystemTaskRequest(CFSTR("com.apple.geod.ExpireSubscription.Upcoming"), v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v5)
      {
        v28 = 0;
        v19 = objc_msgSend(v17, "updateTaskRequest:error:", v16, &v28);
        v20 = (__CFString *)v28;

        if ((v19 & 1) == 0)
        {
          GEOGetSubscriptionExpirationLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = CFSTR("Unknown");
            if (v20)
              v22 = v20;
            *(_DWORD *)buf = 138412290;
            v32 = *(double *)&v22;
            v23 = "Failed to update existing task with error: %@";
LABEL_26:
            _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
            goto LABEL_27;
          }
          goto LABEL_27;
        }
      }
      else
      {
        v27 = 0;
        v25 = objc_msgSend(v17, "submitTaskRequest:error:", v16, &v27);
        v20 = (__CFString *)v27;

        if ((v25 & 1) == 0)
        {
          GEOGetSubscriptionExpirationLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v26 = CFSTR("Unknown");
            if (v20)
              v26 = v20;
            *(_DWORD *)buf = 138412290;
            v32 = *(double *)&v26;
            v23 = "Failed to submit task with error: %@";
            goto LABEL_26;
          }
LABEL_27:

        }
      }

    }
LABEL_29:

    goto LABEL_30;
  }
  if (v5)
  {
    objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v9, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.ExpireSubscription.Upcoming"), &v30);
    goto LABEL_29;
  }
LABEL_30:

}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD block[4];
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  NSObject *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  v19 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_15_2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;
    if (objc_msgSend(v20, "count"))
    {
      v7 = dispatch_group_create();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__99;
      v33[4] = __Block_byref_object_dispose__99;
      v34 = 0;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v20;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            dispatch_group_enter(v7);
            +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_17;
            v24[3] = &unk_1E1C20B30;
            v28 = v33;
            v25 = v8;
            v26 = v12;
            v27 = v7;
            objc_msgSend(v13, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v14, v15, v24);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v9);
      }

      v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_19;
      block[3] = &unk_1E1BFF6F8;
      v23 = v8;
      v17 = v8;
      dispatch_group_notify(v7, v16, block);

      _Block_object_dispose(v33, 8);
      v6 = v20;
    }

  }
}

unint64_t __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
  {
    if (objc_msgSend(v6, "loadState") == 3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    GEOGetSubscriptionExpirationLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v28 = v3;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Asking to display incompatibility notification for %llu subscriptions", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_geo_map:", &__block_literal_global_22_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (v13)
          {
            objc_msgSend(v11, "displayName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    v16 = (void *)MEMORY[0x1E0CB3B38];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_25;
    v19[3] = &unk_1E1C20B78;
    v20 = v4;
    v21 = v5;
    v17 = v5;
    v18 = v4;
    objc_msgSend(v16, "geo_withMapsNotificationProviderDaemon:errorHandler:", v19, &__block_literal_global_29);

  }
}

uint64_t __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_2_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyForIncompatibleOfflineDataVersionsForIdentifiers:displayNames:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_26_0);
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_3()
{
  GEOConfigSetBOOL(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1EDF4EC88);
}

void __83__GEOMapDataSubscriptionExpirationHelper__notifyForIncompatibleVersionsIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetSubscriptionExpirationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_subscriptionsDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GEOMapDataSubscriptionExpirationHelper__subscriptionsDidChange___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __66__GEOMapDataSubscriptionExpirationHelper__subscriptionsDidChange___block_invoke(uint64_t a1)
{
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary](*(_QWORD *)(a1 + 32));
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary](*(_QWORD *)(a1 + 32));
}

- (void)runBackgroundTask:(id)a3 orIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  GEOTileDB *db;
  OS_dispatch_queue *queue;
  id v15;
  double v16;
  double v17;
  double Double;
  void *v19;
  OS_dispatch_queue *v20;
  double v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  GEOMapDataSubscriptionExpirationHelper *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  GEOMapDataSubscriptionExpirationHelper *v29;
  uint8_t buf[4];
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "identifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.geod.ExpireSubscription")))
  {
    GEOGetSubscriptionExpirationLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Asking to expire subscriptions if necessary", buf, 2u);
    }

    queue = self->_queue;
    db = self->_db;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke;
    v27[3] = &unk_1E1C0B448;
    v28 = v9;
    v29 = self;
    -[GEOTileDB expireSubscriptionsIfNecessaryWithQueue:completionHandler:](db, "expireSubscriptionsIfNecessaryWithQueue:completionHandler:", queue, v27);
    v15 = v28;
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.geod.ExpireSubscription.Upcoming")))
  {
    _nextSubscriptionUpdateRequiredExpirationDate();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceNow");
    v17 = v16;
    Double = GEOConfigGetDouble(GeoOfflineConfig_UpdateRequiredExpirationNoticeMinIntervalFromNow, (uint64_t)off_1EDF4EA98);
    if (v17 < Double)
    {
      v21 = Double;
      GEOGetSubscriptionExpirationLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v31 = v21;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_INFO, "Expiration date is either in the past or within the next %{public}.1f seconds. Not displaying upcoming expiration notification", buf, 0xCu);
      }

      objc_msgSend(v9, "setTaskCompleted");
    }
    else
    {
      +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_queue;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_30;
      v23[3] = &unk_1E1C0B2B8;
      v24 = v9;
      v25 = self;
      v15 = v15;
      v26 = v15;
      objc_msgSend(v19, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", v20, v23);

    }
    goto LABEL_14;
  }
LABEL_15:

}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
  if (v3)
  {
    GEOGetSubscriptionExpirationLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Failed to expire subscriptions: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary](*(_QWORD *)(a1 + 40));
  }

}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  id obj;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  NSObject *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v21 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_31_0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v22;
    if (objc_msgSend(v22, "count"))
    {
      v7 = dispatch_group_create();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__99;
      v37[4] = __Block_byref_object_dispose__99;
      v38 = 0;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v22;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      v20 = v5;
      if (v9)
      {
        v10 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v34 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            dispatch_group_enter(v7);
            +[GEOMapDataSubscriptionManager sharedManager](GEOMapDataSubscriptionManager, "sharedManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_3;
            v28[3] = &unk_1E1C20B30;
            v32 = v37;
            v29 = v8;
            v30 = v12;
            v31 = v7;
            objc_msgSend(v13, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v14, v15, v28);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v9);
      }

      v16 = *(void **)(a1 + 32);
      v17 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_4;
      block[3] = &unk_1E1C01790;
      v25 = v8;
      v26 = v16;
      v27 = *(id *)(a1 + 48);
      v18 = v8;
      v19 = v17;
      v5 = v20;
      dispatch_group_notify(v7, v19, block);

      _Block_object_dispose(v37, 8);
      v6 = v22;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
  }

}

unint64_t __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
  {
    if ((unint64_t)(objc_msgSend(v6, "loadState") - 1) <= 1)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_4(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "count"))
  {
    GEOGetSubscriptionExpirationLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Asking to display upcoming expiration notification", buf, 2u);
    }

    objc_msgSend(a1[4], "_geo_map:", &__block_literal_global_33_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = a1[4];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v10, "displayName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (v12)
          {
            objc_msgSend(v10, "displayName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    v15 = (void *)MEMORY[0x1E0CB3B38];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_2_34;
    v18[3] = &unk_1E1C20BA0;
    v19 = v3;
    v20 = v4;
    v21 = a1[6];
    v16 = v4;
    v17 = v3;
    objc_msgSend(v15, "geo_withMapsNotificationProviderDaemon:errorHandler:", v18, &__block_literal_global_38_1);
    objc_msgSend(a1[5], "setTaskCompleted");

  }
  else
  {
    objc_msgSend(a1[5], "setTaskCompleted");
  }
}

uint64_t __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_32(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_2_34(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "willExpireOfflineSubscriptionsWithIdentifiers:displayNames:unlessUpdatedByDate:completionHandler:", a1[4], a1[5], a1[6], &__block_literal_global_36_2);
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_3_35()
{
  GEOConfigSetBOOL(GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration, (uint64_t)off_1EDF4EAA8);
}

void __73__GEOMapDataSubscriptionExpirationHelper_runBackgroundTask_orIdentifier___block_invoke_4_37(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetSubscriptionExpirationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  unsigned int var0;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  int v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = a3.var0 == (_DWORD)GeoOfflineConfig_OptimizeStorageEnabled && a3.var1 == off_1EDF4EA38;
  if (v6
    || (a3.var0 == (_DWORD)GeoOfflineConfig_OptimizeStorageLastUsedDeleteInterval
      ? (v7 = a3.var1 == off_1EDF4EA48)
      : (v7 = 0),
        v7
     || (a3.var0 == (_DWORD)GeoOfflineConfig_OptimizeStorageNeverUsedDeleteInterval
       ? (v8 = a3.var1 == off_1EDF4EA58)
       : (v8 = 0),
         v8
      || ((v9 = GeoOfflineConfig_UpdateRequiredExpirationInterval,
           v10 = off_1EDF4EA78,
           a3.var0 == (_DWORD)GeoOfflineConfig_UpdateRequiredExpirationInterval)
        ? (v11 = a3.var1 == off_1EDF4EA78)
        : (v11 = 0),
          v11))))
  {
    -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary]((uint64_t)self);
    v9 = GeoOfflineConfig_UpdateRequiredExpirationInterval;
    v10 = off_1EDF4EA78;
  }
  v12 = v9 == var0 && v10 == var1;
  if (v12
    || (var0 == (_DWORD)GeoOfflineConfig_UpdateRequiredExpirationNoticeInterval
      ? (v13 = var1 == off_1EDF4EA88)
      : (v13 = 0),
        v13
     || (var0 == (_DWORD)GeoOfflineConfig_HasNotifiedForUpcomingUpdateRequiredExpiration
       ? (v14 = var1 == off_1EDF4EAA8)
       : (v14 = 0),
         v14)))
  {
    -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary]((uint64_t)self);
  }
}

- (void)tileDB:(id)a3 didExpireSubscriptions:(id)a4 forReason:(int64_t)a5
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    GEOGetSubscriptionExpirationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v39 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Expired %llu subscriptions", buf, 0xCu);
    }

    notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
    notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
    v8 = a5 - 2;
    if ((unint64_t)(a5 - 2) <= 4)
    {
      objc_msgSend(v6, "_geo_filtered:", &__block_literal_global_39_2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v28 = v9;
        v12 = v9;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v17, "identifier", v28);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v18);

              objc_msgSend(v17, "displayName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v17, "displayName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:forKey:", v20, v21);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v14);
        }

        if (v8 > 4)
          v22 = 0;
        else
          v22 = qword_189CE3BD8[v8];
        GEOGetSubscriptionExpirationLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 134217984;
          v39 = v24;
          _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_INFO, "Asking to display expiration notification for %llu subscriptions", buf, 0xCu);
        }

        v25 = (void *)MEMORY[0x1E0CB3B38];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke_40;
        v29[3] = &unk_1E1C153F0;
        v30 = v11;
        v31 = v10;
        v32 = v22;
        v26 = v10;
        v27 = v11;
        objc_msgSend(v25, "geo_withMapsNotificationProviderDaemon:errorHandler:", v29, &__block_literal_global_41_0);

        v9 = v28;
      }

    }
  }

}

unint64_t __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke(uint64_t a1, void *a2)
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

uint64_t __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke_40(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "expiredOfflineSubscriptions:withDisplayNames:forReason:", a1[4], a1[5], a1[6]);
}

void __82__GEOMapDataSubscriptionExpirationHelper_tileDB_didExpireSubscriptions_forReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetSubscriptionExpirationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to display notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)offlineDataConfiguration:(id)a3 didChangeActiveVersions:(id)a4
{
  -[GEOMapDataSubscriptionExpirationHelper _scheduleExpirationTaskIfNecessary]((uint64_t)self);
  -[GEOMapDataSubscriptionExpirationHelper _scheduleUpcomingExpirationTaskIfNecessary]((uint64_t)self);
  if (GEOConfigGetBOOL(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1EDF4EC88))
  {
    _setValue(GeoOfflineConfig_HasNotifiedForIncompatibleVersions, (uint64_t)off_1EDF4EC88, 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB3B38], "geo_withMapsNotificationProviderDaemon:errorHandler:", &__block_literal_global_42_2, &__block_literal_global_43_1);
  }
}

uint64_t __91__GEOMapDataSubscriptionExpirationHelper_offlineDataConfiguration_didChangeActiveVersions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearIncompatibleOfflineDataNotification");
}

void __91__GEOMapDataSubscriptionExpirationHelper_offlineDataConfiguration_didChangeActiveVersions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetSubscriptionExpirationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Could not communicate with notification provider to clear notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
