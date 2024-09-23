@implementation HDCloudSyncPeriodicActivityScheduler

- (HDCloudSyncPeriodicActivityScheduler)initWithCoordinator:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncPeriodicActivityScheduler *v8;
  HDCloudSyncPeriodicActivityScheduler *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  HDCloudSyncPlatformConfiguration *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  HDCloudSyncPlatformConfiguration *platformConfiguration;
  id v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncPeriodicActivityScheduler;
  v8 = -[HDCloudSyncPeriodicActivityScheduler init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_coordinator, v6);
    HKCreateSerialUtilityDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_behavior, a4);
    v12 = [HDCloudSyncPlatformConfiguration alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v9->_coordinator);
    objc_msgSend(WeakRetained, "daemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "primaryProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDCloudSyncPlatformConfiguration initWithPrimaryProfile:behavior:](v12, "initWithPrimaryProfile:behavior:", v15, v7);
    platformConfiguration = v9->_platformConfiguration;
    v9->_platformConfiguration = (HDCloudSyncPlatformConfiguration *)v16;

    v18 = objc_loadWeakRetained((id *)&v9->_coordinator);
    objc_msgSend(v18, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerDaemonReadyObserver:queue:", v9, v9->_queue);

  }
  return v9;
}

+ (void)registerDisabledPeriodicActivitiesForUnsupportedDaemon:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D29908], "registerDisabledPeriodicActivityWithName:loggingCategory:", CFSTR("com.apple.healthd.sync.cloud.periodic"), *MEMORY[0x1E0CB5370]);
}

- (void)updatePeriodicActivityCriteria
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivityCriteria__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __70__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivityCriteria__block_invoke(uint64_t a1)
{
  -[HDCloudSyncPeriodicActivityScheduler _setCriteriaForActivity:](*(id **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_setCriteriaForActivity:(id *)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    -[HDCloudSyncPeriodicActivityScheduler _criteriaForActivity:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v5, "setCriteria:", v4);

    v3 = v5;
  }

}

- (void)updatePeriodicActivitesWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  double v19;

  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitesWithResult_minimumRetryInterval_activityStartDate_error___block_invoke;
  block[3] = &unk_1E6D0A5F0;
  v19 = a4;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a3;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

uint64_t __119__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitesWithResult_minimumRetryInterval_activityStartDate_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
}

- (void)_queue_createActivities
{
  id v2;
  double v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location[2];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if ((objc_msgSend(*(id *)(a1 + 40), "shouldRegisterForPeriodicSyncActivities") & 1) != 0)
    {
      objc_initWeak(location, (id)a1);
      v2 = objc_alloc(MEMORY[0x1E0D29908]);
      v3 = (double)(uint64_t)*MEMORY[0x1E0C807D8];
      v4 = *MEMORY[0x1E0C80748];
      v5 = (uint64_t *)MEMORY[0x1E0CB5370];
      v6 = *MEMORY[0x1E0CB5370];
      v7 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke;
      v17[3] = &unk_1E6D0A618;
      objc_copyWeak(&v18, location);
      v8 = objc_msgSend(v2, "initWithName:baseInterval:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.sync.cloud.periodic"), v4, v6, v17, v3);
      v9 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v8;

      -[HDCloudSyncPeriodicActivityScheduler _setCriteriaForActivity:]((id *)a1, *(void **)(a1 + 48));
      v10 = objc_alloc(MEMORY[0x1E0D29908]);
      v11 = *v5;
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke_2;
      v15[3] = &unk_1E6D0A618;
      objc_copyWeak(&v16, location);
      v12 = objc_msgSend(v10, "initWithName:baseInterval:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.sync.cloud.userRequestedBackup"), v4, v11, v15, 0.0);
      v13 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v12;

      -[HDCloudSyncPeriodicActivityScheduler _setCriteriaForActivity:]((id *)a1, *(void **)(a1 + 32));
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Skipping registering periodic sync activities for unsupported device", (uint8_t *)location, 2u);
      }
    }
  }
}

void __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id *WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  -[HDCloudSyncPeriodicActivityScheduler performPeriodicActivity:completion:](WeakRetained, v6, v5);

}

- (void)performPeriodicActivity:(void *)a3 completion:
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  id *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  CFAbsoluteTime Current;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id *v28;
  id v29;
  id v30;
  id v31;
  CFAbsoluteTime v32;
  id v33;
  uint8_t buf[4];
  id *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    _HKInitializeLogging();
    v7 = (os_log_t *)MEMORY[0x1E0CB5370];
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = a1;
      v36 = 2114;
      v37 = v5;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Triggered to Perform Periodic Activity: %{public}@", buf, 0x16u);
    }
    v9 = a1 + 1;
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    objc_msgSend(WeakRetained, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "analyticsSubmissionCoordinator");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "cloudSync_reportPeriodicSyncStartForType:", 0);

    Current = CFAbsoluteTimeGetCurrent();
    v14 = objc_loadWeakRetained(a1 + 1);
    v33 = 0;
    LOBYTE(v12) = objc_msgSend(v14, "markAllClientSyncRequestsAsInProgress:", &v33);
    v15 = v33;

    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      v16 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = a1;
        v36 = 2114;
        v37 = v15;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Error marking all client sync requests in progress %{public}@", buf, 0x16u);
      }
    }
    v17 = objc_loadWeakRetained(a1 + 1);
    objc_msgSend(v17, "prepareAllProfilesForPeriodicSyncAndRestore");

    objc_msgSend(a1, "syncContextForPeriodicActivity:periodicSyncType:", v5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke;
      v27 = &unk_1E6D0A668;
      v28 = a1;
      v29 = v18;
      v32 = Current;
      v30 = v5;
      v31 = v6;
      +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", CFSTR("Periodic Cloud Sync"), &v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFaultOnTimeout:", 0, v24, v25, v26, v27, v28);
      v21 = objc_loadWeakRetained(v9);
      objc_msgSend(v21, "daemon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "maintenanceWorkCoordinator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "enqueueMaintenanceOperation:", v20);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, double))v6 + 2))(v6, 0, 0, 0.0);
    }

  }
}

void __63__HDCloudSyncPeriodicActivityScheduler__queue_createActivities__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id *WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  -[HDCloudSyncPeriodicActivityScheduler performPeriodicActivity:completion:](WeakRetained, v6, v5);

}

- (void)setupPeriodicActivities
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v9 = 0;
  v3 = objc_msgSend(WeakRetained, "canPerformCloudSyncWithError:", &v9);
  v4 = v9;

  if (v3)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "syncStatusProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_2;
    v8[3] = &unk_1E6CE80E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "updateCachedLastSyncDatesWithCompletion:", v8);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Sync unavailable; setting up periodic activity with default values: %{public}@",
        buf,
        0xCu);
    }
    -[HDCloudSyncPeriodicActivityScheduler _queue_createActivities](*(_QWORD *)(a1 + 32));
  }

}

void __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_3;
  block[3] = &unk_1E6CE80E8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __63__HDCloudSyncPeriodicActivityScheduler_setupPeriodicActivities__block_invoke_3(uint64_t a1)
{
  -[HDCloudSyncPeriodicActivityScheduler _queue_createActivities](*(_QWORD *)(a1 + 32));
}

- (void)disablePeriodicActivities
{
  _QWORD *v2;

  v2 = (_QWORD *)MEMORY[0x1E0CB5370];
  objc_msgSend(MEMORY[0x1E0D29908], "registerDisabledPeriodicActivityWithName:loggingCategory:", CFSTR("com.apple.healthd.sync.cloud.periodic"), *MEMORY[0x1E0CB5370]);
  objc_msgSend(MEMORY[0x1E0D29908], "registerDisabledPeriodicActivityWithName:loggingCategory:", CFSTR("com.apple.healthd.sync.cloud.userRequestedBackup"), *v2);
}

- (int64_t)periodicActivityErrorCount
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HDCloudSyncPeriodicActivityScheduler_periodicActivityErrorCount__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__HDCloudSyncPeriodicActivityScheduler_periodicActivityErrorCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "errorCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updatePeriodicActivitiesWithSyncSuccess:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitiesWithSyncSuccess___block_invoke;
  v4[3] = &unk_1E6CF1C08;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

void __80__HDCloudSyncPeriodicActivityScheduler_updatePeriodicActivitiesWithSyncSuccess___block_invoke(uint64_t a1)
{
  int v2;
  id *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    -[HDCloudSyncPeriodicActivityScheduler _criteriaForActivity:](v3, v3[6]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resetIntervalWithCriteria:", v4);

  }
  else
  {
    objc_msgSend(v3, "updatePeriodicActivityCriteria");
  }
}

- (id)_criteriaForActivity:(id *)a1
{
  id v3;
  id v4;
  xpc_object_t empty;
  double v6;
  const char *v7;
  const char *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v15;
  id v16;
  int64_t v17;
  const char *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  empty = 0;
  if (a1 && v3)
  {
    empty = xpc_dictionary_create_empty();
    objc_msgSend(v4, "modifiedIntervalForCurrentState");
    if (v6 > 0.0)
      xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x1E0C807A8], (uint64_t)v6);
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C80738], 1);
    v7 = (const char *)*MEMORY[0x1E0C80878];
    v8 = (const char *)*MEMORY[0x1E0C80888];
    xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808D0], 1);
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    v20 = 0;
    v10 = objc_msgSend(WeakRetained, "canPerformCloudSyncWithError:", &v20);
    v11 = v20;

    if ((v10 & 1) != 0)
    {
      xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808C8], objc_msgSend(a1[5], "requireInexpensiveNetworking"));
      if (a1[6] == v4)
      {
        v15 = (const char *)*MEMORY[0x1E0C808B0];
        v16 = empty;
        xpc_dictionary_set_BOOL(v16, v15, 1);
        v17 = objc_msgSend(a1[5], "baseIntervalForPeriodicSyncActivity");
        v18 = (const char *)objc_msgSend(a1[5], "priorityForPeriodicSyncActivity");
        xpc_dictionary_set_int64(v16, (const char *)*MEMORY[0x1E0C807A8], v17);
        xpc_dictionary_set_string(v16, v7, v18);

        _HKInitializeLogging();
        v19 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v22 = v17;
          _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "Setting up primary periodic activity with base interval %{public}lld seconds", buf, 0xCu);
        }
      }
      else if (a1[4] == v4)
      {
        v12 = empty;
        xpc_dictionary_set_string(v12, v7, v8);
        xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x1E0C808F8], 1);

      }
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = (int64_t)a1;
        v23 = 2114;
        v24 = v11;
        _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync unavailable, setting disabled periodic activity criteria: %{public}@", buf, 0x16u);
      }
      xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807E8]);
    }

  }
  return empty;
}

void __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke_2;
  v8[3] = &unk_1E6D0A640;
  v12 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  v7 = (id)objc_msgSend(WeakRetained, "syncAllProfilesWithContext:completion:", v5, v8);

}

void __75__HDCloudSyncPeriodicActivityScheduler_performPeriodicActivity_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  _BYTE v32[24];
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
  if ((a2 & 1) != 0)
  {
LABEL_2:
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "analyticsSubmissionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudSync_reportPeriodicSyncSuccessAfterDuration:type:", 0, v6);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = 0.0;
    if (v10)
      dispatch_async(*(dispatch_queue_t *)(v10 + 24), &__block_literal_global_204);
    goto LABEL_27;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v13;
  v15 = (_QWORD *)MEMORY[0x1E0C947D8];
  if (v12
    && (objc_msgSend(v13, "domain"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", *v15),
        v16,
        (v17 & 1) != 0))
  {
    v18 = objc_msgSend(v14, "code");

    if (v18 == 25)
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v32 = 138543618;
        *(_QWORD *)&v32[4] = v31;
        *(_WORD *)&v32[12] = 2114;
        *(_QWORD *)&v32[14] = v14;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Treating cloud sync error as success for periodic activity: %{public}@", v32, 0x16u);
      }

      v5 = 0;
      goto LABEL_2;
    }
  }
  else
  {

  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 124, CFSTR("Periodic sync failed, but did not provide an error"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "shouldDefer");
  v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v20, "daemon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "analyticsSubmissionCoordinator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cloudSync_reportPeriodicSyncFailureWithError:duration:type:", v14, 0, v6);

  objc_msgSend(v14, "domain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v23, "isEqualToString:", *v15);

  if ((_DWORD)v21)
  {
    objc_msgSend(v14, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v11 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "doubleValue");
      v11 = v26;
    }
    if (objc_msgSend(v14, "code") != 3)
      objc_msgSend(v14, "code");

  }
  else
  {
    v11 = 0.0;
    if (objc_msgSend(v14, "hk_isHealthKitError")
      && objc_msgSend(v14, "code") != 701
      && objc_msgSend(v14, "hk_isDatabaseAccessibilityError"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isConfiguredForLiteSync");
    }
  }
  v27 = *(_QWORD *)(a1 + 32);
  v28 = v14;
  v5 = v28;
  if (v27)
  {
    v29 = *(NSObject **)(v27 + 24);
    *(_QWORD *)v32 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v32[8] = 3221225472;
    *(_QWORD *)&v32[16] = __66__HDCloudSyncPeriodicActivityScheduler__persistPeriodicSyncError___block_invoke;
    v33 = &unk_1E6CE8080;
    v34 = v27;
    v35 = v28;
    dispatch_async(v29, v32);

  }
LABEL_27:
  v30 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v30, "clearClientSyncRequestsQueue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(v11);

}

- (id)syncContextForPeriodicActivity:(id)a3 periodicSyncType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  double Sync;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  _BOOL8 v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  _BOOL8 v41;
  char v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  double Current;
  double v50;
  double v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  _BOOL4 v64;
  void *v65;
  id v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  int v72;
  double v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (*(double *)&self == 0.0)
    goto LABEL_52;
  objc_msgSend(v5, "currentCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0C808C8]);
  else
    v9 = 1;
  if (-[HDCloudSyncPlatformConfiguration requireInexpensiveNetworking](self->_platformConfiguration, "requireInexpensiveNetworking")|| ((v9 | !-[HDCloudSyncPeriodicActivityScheduler cellularThresholdPassed](self, "cellularThresholdPassed")) & 1) != 0)
  {

    v10 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138543362;
      v73 = *(double *)&self;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cellular access requested for activity because cellular threshold has passed", (uint8_t *)&v72, 0xCu);
    }

    v10 = 1024;
  }
  if (!-[_HKBehavior supportsPeriodicFullCloudSync](self->_behavior, "supportsPeriodicFullCloudSync"))
    goto LABEL_15;
  Sync = -[HDCloudSyncPeriodicActivityScheduler _timeSinceLastSyncSuccess]((uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "syncStatusProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "syncStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastSuccessfulPullDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(v17, "syncStatusProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "syncStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastSuccessfulPushDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v20 && Sync <= 28800.0)
    {
LABEL_15:
      v21 = objc_loadWeakRetained((id *)&self->_coordinator);
      objc_msgSend(v21, "syncStatusProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "syncStatus");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[_HKBehavior supportsPeriodicLiteCloudSync](self->_behavior, "supportsPeriodicLiteCloudSync"))
      {
LABEL_51:

        goto LABEL_52;
      }
      objc_msgSend(v23, "lastSuccessfulLitePushDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {

LABEL_41:
        v64 = -[HDCloudSyncPlatformConfiguration isConfiguredForLiteSync](self->_platformConfiguration, "isConfiguredForLiteSync");
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6508]), "initWithPush:pull:", 1, 1);
        if (v64)
        {
          v46 = objc_alloc_init(MEMORY[0x1E0CB6C58]);
          v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, -[HDCloudSyncPlatformConfiguration canLiteSyncPull](self->_platformConfiguration, "canLiteSyncPull"), 1);
        }
        else
        {
          v47 = 0;
          v46 = 0;
        }
        v48 = 32;
        goto LABEL_45;
      }
      if (-[HDCloudSyncPlatformConfiguration shouldRestrictSyncInSleepFocus](self->_platformConfiguration, "shouldRestrictSyncInSleepFocus"))
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v72 = 138543362;
          v73 = *(double *)&self;
          _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Device is in sleep focus mode, not triggering lite sync", (uint8_t *)&v72, 0xCu);
        }
        goto LABEL_51;
      }
      Current = CFAbsoluteTimeGetCurrent();
      -[HDCloudSyncPlatformConfiguration liteSyncThreshold](self->_platformConfiguration, "liteSyncThreshold");
      v51 = v50;
      if (-[HDCloudSyncPlatformConfiguration participateInCoordinatedSync](self->_platformConfiguration, "participateInCoordinatedSync"))
      {
        v52 = objc_loadWeakRetained((id *)&self->_coordinator);
        objc_msgSend(v52, "daemon");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "primaryProfile");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        HDCloudSyncLastSuccessfulPushDateForCoordinatedSync(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v55, "timeIntervalSinceReferenceDate");
          v57 = Current - v56;
          if (Current - v56 < 3600.0)
          {
            _HKInitializeLogging();
            v70 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
            {
              v72 = 134217984;
              v73 = v57 / 60.0;
              _os_log_debug_impl(&dword_1B7802000, v70, OS_LOG_TYPE_DEBUG, "Skipping Lite Sync on Watch because paired phone last synced %f minutes ago", (uint8_t *)&v72, 0xCu);
            }

            goto LABEL_51;
          }
        }

      }
      objc_msgSend(v23, "lastSuccessfulPushDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "timeIntervalSinceReferenceDate");
      v60 = Current - v59;

      objc_msgSend(v23, "lastSuccessfulLitePushDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "timeIntervalSinceReferenceDate");
      v63 = Current - v62;

      if (v60 < v63)
        v63 = v60;

      if (v63 > v51)
        goto LABEL_41;
LABEL_52:
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v72 = 138543618;
        v73 = *(double *)&self;
        v74 = 2114;
        v75 = v6;
        v44 = "%{public}@: Performing No-op for activity %{public}@";
        goto LABEL_54;
      }
      goto LABEL_55;
    }
  }
  v26 = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(v26, "syncStatusProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "syncStatus");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastSuccessfulPushDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 1;
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceDate:", v29);
    v32 = v31;

    if (v32 < 7200.0)
      v33 = 0;
  }

  v34 = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(v34, "syncStatusProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "syncStatus");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastSuccessfulPullDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceDate:", v37);
    v40 = v39;

    v41 = v40 > 900.0;
    v42 = v40 > 900.0 || v33;
    if ((v42 & 1) == 0)
    {
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v72 = 138543618;
        v73 = *(double *)&self;
        v74 = 2114;
        v75 = v6;
        v44 = "%{public}@: No Push and Pull required. Performing No-op for activity %{public}@";
LABEL_54:
        _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)&v72, 0x16u);
      }
LABEL_55:
      v66 = 0;
      goto LABEL_56;
    }
  }
  else
  {
    v41 = 1;
  }
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6508]), "initWithPush:pull:", 1, 1);
  v46 = objc_alloc_init(MEMORY[0x1E0CB6C58]);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", v33, v41, 0);
  v48 = 0;
LABEL_45:
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:", v47, v45, v46, 0, 0);
  v66 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v65) | v10, v48, v6);
  objc_msgSend(v66, "setSyncRequest:", v65);
  _HKInitializeLogging();
  v67 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v68 = v67;
    HKCloudSyncReasonToString();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 138544130;
    v73 = *(double *)&self;
    v74 = 2114;
    v75 = v69;
    v76 = 2114;
    v77 = v66;
    v78 = 2114;
    v79 = v6;
    _os_log_impl(&dword_1B7802000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing %{public}@ with context %{public}@ for activity %{public}@", (uint8_t *)&v72, 0x2Au);

  }
LABEL_56:

  return v66;
}

- (__CFString)_reportingDescriptionForError:(void *)a1
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB4E20]);

  if (v3)
  {
    if (objc_msgSend(v1, "code") == 100)
    {
      objc_msgSend(v1, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[HDCloudSyncPeriodicActivityScheduler _reportingDescriptionForError:](v5);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v1, "userInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v27)
        {
          objc_msgSend(v25, "stringWithFormat:", CFSTR("HealthKit Internal Failure: %@"), v27);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v1, "description");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("HealthKit Internal Failure: %@"), v29);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }

      goto LABEL_27;
    }
LABEL_19:
    objc_msgSend(v1, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  objc_msgSend(v1, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C947D8];
  v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v9 || objc_msgSend(v1, "code") != 2)
    goto LABEL_19;
  v32 = v1;
  v10 = v1;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CloudKit Partial Error:"));
  v31 = v10;
  objc_msgSend(v10, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
LABEL_9:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v18);
      objc_msgSend(v14, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", v8);

      if (!v22)
        goto LABEL_15;
      v23 = objc_msgSend(v20, "code");
      if (v23 != 11)
        break;
LABEL_16:

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v16)
          goto LABEL_9;
        goto LABEL_18;
      }
    }
    if (v23 == 110)
    {

      v6 = CFSTR("Manatee Unavailable (Within CloudKit Partial Error)");
      goto LABEL_23;
    }
LABEL_15:
    objc_msgSend(v20, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("\n\t%@ => %@"), v19, v24);

    goto LABEL_16;
  }
LABEL_18:

  v6 = v11;
LABEL_23:

  v1 = v32;
LABEL_27:

  return v6;
}

- (BOOL)cellularThresholdPassed
{
  double Sync;
  double v4;

  Sync = -[HDCloudSyncPeriodicActivityScheduler _timeSinceLastSyncSuccess]((uint64_t)self);
  -[HDCloudSyncPlatformConfiguration cellularSyncThreshold](self->_platformConfiguration, "cellularSyncThreshold");
  return Sync > v4;
}

- (double)_timeSinceLastSyncSuccess
{
  double Current;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  if (!a1)
    return 0.0;
  Current = CFAbsoluteTimeGetCurrent();
  v3 = (id *)(a1 + 8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "syncStatusProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastSuccessfulPullDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "syncStatusProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastSuccessfulPushDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "syncStatusProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastSuccessfulLitePushDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v17 = Current - v16;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v19 = Current - v18;
  if (v17 >= v19)
    v17 = v19;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v21 = Current - v20;
  if (v17 >= v21)
    v22 = v17;
  else
    v22 = v21;

  return v22;
}

void __66__HDCloudSyncPeriodicActivityScheduler__persistPeriodicSyncError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_7;
  -[HDCloudSyncPeriodicActivityScheduler _reportingDescriptionForError:](*(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@] %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringArrayForKey:", CFSTR("HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertObject:atIndex:", v6, 0);
      if ((unint64_t)objc_msgSend(v9, "count") >= 0x1D)
        objc_msgSend(v9, "removeLastObject");
    }
    else
    {
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"));

  }
  else
  {
LABEL_7:
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Skipping persistence of error: %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

}

void __73__HDCloudSyncPeriodicActivityScheduler__resetPersistedPeriodicSyncErrors__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"));

}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[HDCloudSyncPlatformConfiguration shouldRegisterForPeriodicSyncActivities](self->_platformConfiguration, "shouldRegisterForPeriodicSyncActivities"))objc_msgSend(MEMORY[0x1E0D29908], "registerDisabledPeriodicActivityWithName:loggingCategory:", CFSTR("com.apple.healthd.sync.cloud.periodic"), *MEMORY[0x1E0CB5370]);
}

- (void)unitTest_performPeriodicSyncWithCompletion:(id)a3
{
  id v4;
  HDXPCPeriodicActivity *periodicActivity;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  periodicActivity = self->_periodicActivity;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__HDCloudSyncPeriodicActivityScheduler_unitTest_performPeriodicSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E6D0A6B0;
  v8 = v4;
  v6 = v4;
  -[HDCloudSyncPeriodicActivityScheduler performPeriodicActivity:completion:]((id *)&self->super.isa, periodicActivity, v7);

}

uint64_t __83__HDCloudSyncPeriodicActivityScheduler_unitTest_performPeriodicSyncWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unitTest_setPeriodicActivity:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActivity, a3);
}

- (id)unitTest_periodicActivity
{
  return self->_periodicActivity;
}

- (HDCloudSyncPlatformConfiguration)platformConfiguration
{
  return self->_platformConfiguration;
}

- (HDXPCPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_platformConfiguration, 0);
  objc_storeStrong((id *)&self->_userRequestedBackupActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
