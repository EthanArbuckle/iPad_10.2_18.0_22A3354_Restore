@implementation HDCloudSyncCoordinator

- (HDCloudSyncCoordinator)initWithDaemon:(id)a3
{
  id v4;
  HDCloudSyncCoordinator *v5;
  HDCloudSyncCoordinator *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  HDCloudSyncManagerTaskQueue *v9;
  HDCloudSyncManagerTaskQueue *syncTaskQueue;
  HDCloudSyncPeriodicActivityScheduler *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HDCloudSyncPeriodicActivityScheduler *periodicActivityScheduler;
  HDCloudSyncAccountProvider *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HDCloudSyncAccountProvider *accountProvider;
  HDCloudSyncStatusProvider *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HDCloudSyncStatusProvider *syncStatusProvider;
  HDCloudSyncSubscriptionNotificationHandler *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HDCloudSyncSubscriptionNotificationHandler *subscriptionNotificationHandler;
  void *v31;
  id WeakRetained;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HDCloudSyncCoordinator;
  v5 = -[HDCloudSyncCoordinator init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialUtilityDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(HDCloudSyncManagerTaskQueue);
    syncTaskQueue = v6->_syncTaskQueue;
    v6->_syncTaskQueue = v9;

    -[HDCloudSyncManagerTaskQueue setDelegate:](v6->_syncTaskQueue, "setDelegate:", v6);
    v11 = [HDCloudSyncPeriodicActivityScheduler alloc];
    -[HDCloudSyncCoordinator daemon](v6, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDCloudSyncPeriodicActivityScheduler initWithCoordinator:behavior:](v11, "initWithCoordinator:behavior:", v6, v13);
    periodicActivityScheduler = v6->_periodicActivityScheduler;
    v6->_periodicActivityScheduler = (HDCloudSyncPeriodicActivityScheduler *)v14;

    v16 = [HDCloudSyncAccountProvider alloc];
    -[HDCloudSyncCoordinator daemon](v6, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "behavior");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDCloudSyncAccountProvider initWithCoordinator:behavior:](v16, "initWithCoordinator:behavior:", v6, v18);
    accountProvider = v6->_accountProvider;
    v6->_accountProvider = (HDCloudSyncAccountProvider *)v19;

    v21 = [HDCloudSyncStatusProvider alloc];
    -[HDCloudSyncCoordinator daemon](v6, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "behavior");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HDCloudSyncStatusProvider initWithCoordinator:behavior:](v21, "initWithCoordinator:behavior:", v6, v23);
    syncStatusProvider = v6->_syncStatusProvider;
    v6->_syncStatusProvider = (HDCloudSyncStatusProvider *)v24;

    v26 = [HDCloudSyncSubscriptionNotificationHandler alloc];
    -[HDCloudSyncCoordinator daemon](v6, "daemon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "behavior");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HDCloudSyncSubscriptionNotificationHandler initWithCoordinator:behavior:](v26, "initWithCoordinator:behavior:", v6, v28);
    subscriptionNotificationHandler = v6->_subscriptionNotificationHandler;
    v6->_subscriptionNotificationHandler = (HDCloudSyncSubscriptionNotificationHandler *)v29;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v6);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    objc_msgSend(WeakRetained, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDatabaseJournalMergeObserver:journalType:queue:", self, 2, self->_queue);

  v8 = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(v8, "primaryProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerProfileReadyObserver:queue:", self, self->_queue);

}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t *v7;
  HKObserverSet *v8;
  HKObserverSet *observers;
  xpc_object_t empty;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  HDXPCGatedActivity *v17;
  HDXPCGatedActivity *clientGatedSyncActivity;
  HDCoalescedTaskPoolQuota *v19;
  xpc_object_t v20;
  id v21;
  uint64_t v22;
  HDXPCGatedActivity *v23;
  HDXPCGatedActivity *sharedSummaryPushActivity;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  v25 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDCloudSyncCoordinator _setupCloudSyncSupportIfRequired]((uint64_t)self);
  v4 = objc_alloc(MEMORY[0x1E0CB6988]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (uint64_t *)MEMORY[0x1E0CB5370];
  v8 = (HKObserverSet *)objc_msgSend(v4, "initWithName:loggingCategory:", v6, *MEMORY[0x1E0CB5370]);
  observers = self->_observers;
  self->_observers = v8;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808B8], 1);
  v11 = (const char *)*MEMORY[0x1E0C808D0];
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808A0], 1);
  v12 = (const char *)*MEMORY[0x1E0C80878];
  v13 = (const char *)*MEMORY[0x1E0C80888];
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  _HKInitializeLogging();
  objc_initWeak(&location, self);
  v14 = objc_alloc(MEMORY[0x1E0D298F8]);
  v15 = *v7;
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke;
  v28[3] = &unk_1E6CEFA88;
  objc_copyWeak(&v29, &location);
  v17 = (HDXPCGatedActivity *)objc_msgSend(v14, "initWithName:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.sync.client.request"), empty, v15, v28);
  clientGatedSyncActivity = self->_clientGatedSyncActivity;
  self->_clientGatedSyncActivity = v17;

  v19 = -[HDCoalescedTaskPoolQuota initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:]([HDCoalescedTaskPoolQuota alloc], "initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:", 3, 3, 1800.0, 60.0, 0.0);
  -[HDXPCGatedActivity setQuota:](self->_clientGatedSyncActivity, "setQuota:", v19);

  v20 = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(v20, (const char *)*MEMORY[0x1E0C808A8], 1);
  xpc_dictionary_set_BOOL(v20, v11, 1);
  xpc_dictionary_set_string(v20, v12, v13);
  v21 = objc_alloc(MEMORY[0x1E0D298F8]);
  v22 = *MEMORY[0x1E0CB5370];
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke_2;
  v26[3] = &unk_1E6CEFA88;
  objc_copyWeak(&v27, &location);
  v23 = (HDXPCGatedActivity *)objc_msgSend(v21, "initWithName:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.sync.cloud.summary.push"), v20, v22, v26);
  sharedSummaryPushActivity = self->_sharedSummaryPushActivity;
  self->_sharedSummaryPushActivity = v23;

  -[HDXPCGatedActivity setRescheduleWhileInProgress:](self->_sharedSummaryPushActivity, "setRescheduleWhileInProgress:", 1);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_setupCloudSyncSupportIfRequired
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  _BYTE v11[24];
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
    objc_msgSend(WeakRetained, "behavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsCloudSync");

    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      NSStringFromSelector(sel__setupCloudSyncSupportIfRequired);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("NO");
      *(_DWORD *)v11 = 138543874;
      *(_QWORD *)&v11[4] = a1;
      *(_WORD *)&v11[12] = 2114;
      if (v4)
        v9 = CFSTR("YES");
      *(_QWORD *)&v11[14] = v7;
      *(_WORD *)&v11[22] = 2114;
      v12 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ : %{public}@", v11, 0x20u);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(_BYTE *)(a1 + 15) && *(unsigned __int8 *)(a1 + 14) == v4)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      *(_BYTE *)(a1 + 15) = 1;
      *(_BYTE *)(a1 + 14) = v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v4)
      {
        v10 = *(NSObject **)(a1 + 128);
        *(_QWORD *)v11 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v11[8] = 3221225472;
        *(_QWORD *)&v11[16] = __49__HDCloudSyncCoordinator__enableCloudSyncSupport__block_invoke;
        v12 = (const __CFString *)&unk_1E6CE80E8;
        v13 = a1;
        dispatch_async(v10, v11);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 152), "disablePeriodicActivities");
      }
    }
  }
}

void __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivityWithCompletion:]((uint64_t)WeakRetained, v5);

}

- (void)_syncAllProfilesViaGatedXPCActivityWithCompletion:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  HDCloudSyncContext *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, void *);
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v30 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__44;
    v34 = __Block_byref_object_dispose__44;
    v35 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
    objc_msgSend(WeakRetained, "primaryProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __78__HDCloudSyncCoordinator__computeCoalescedSyncContext_coalescedRequest_error___block_invoke;
    v31[3] = &unk_1E6CEE6D0;
    v31[4] = buf;
    v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedSyncRequestEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v30, v31);

    if (v8)
    {
      v9 = [HDCloudSyncContext alloc];
      v10 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:](v9, "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(*(void **)(*(_QWORD *)&buf[8] + 40)), 1, *(_QWORD *)(a1 + 80));
      objc_msgSend(v10, "setSyncRequest:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v11 = objc_retainAutorelease(v10);
      v12 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));

    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    _Block_object_dispose(buf, 8);

    v13 = v11;
    v14 = v12;
    v15 = v30;
    v16 = v15;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      v23 = 3221225472;
      v24 = __76__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivityWithCompletion___block_invoke;
      v25 = &unk_1E6CEFBC0;
      v26 = a1;
      v18 = v14;
      v27 = v18;
      v28 = v17;
      v29 = v3;
      v19 = v17;
      objc_msgSend((id)a1, "syncAllProfilesWithContext:completion:", v13, &v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addChild:withPendingUnitCount:", v20, 1, v22, v23, v24, v25, v26);
      objc_msgSend((id)a1, "notifyObservers:syncRequestStarted:withProgress:", *(_QWORD *)(a1 + 88), v18, v19);

    }
    else
    {
      if (v15)
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Error fetching computing coalesced sync context %@", buf, 0x16u);
        }
      }
      (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    }

  }
}

void __48__HDCloudSyncCoordinator_profileDidBecomeReady___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id v6;
  id *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id *WeakRetained;
  __int128 buf;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  v6 = v5;
  if (WeakRetained)
  {
    v7 = WeakRetained + 21;
    v8 = objc_loadWeakRetained(WeakRetained + 21);
    objc_msgSend(v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsSharedSummarySync");

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(v7);
      objc_msgSend(v11, "profileManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allProfileIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hk_firstObjectPassingTest:", &__block_literal_global_349);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_loadWeakRetained(v7);
        objc_msgSend(v15, "profileManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "profileForIdentifier:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "cloudSyncManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sharedSummaryManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v24 = __61__HDCloudSyncCoordinator__pushSharedSummariesWithCompletion___block_invoke_2;
        v25 = &unk_1E6CE77F0;
        v26 = v6;
        v20 = (id)objc_msgSend(v19, "push:", &buf);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to push shared summaries. Primary profile not found."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 1, v17);
      }

    }
    else
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = WeakRetained;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Device ineligible for pushing shared summaries", (uint8_t *)&buf, 0xCu);
      }
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }
  }

}

- (void)cloudSyncSupportStatusDidChange
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetSupportsCloudSync");

  -[HDCloudSyncCoordinator _setupCloudSyncSupportIfRequired]((uint64_t)self);
}

uint64_t __49__HDCloudSyncCoordinator__enableCloudSyncSupport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setupPeriodicActivities");
}

- (void)dealloc
{
  HKObserverSet *observers;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  observers = self->_observers;
  self->_observers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeDatabaseJournalMergeObserver:journalType:", self, 2);

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", self);

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCoordinator;
  -[HDCloudSyncCoordinator dealloc](&v8, sel_dealloc);
}

- (double)nextCloudKitOperationDelay
{
  double Current;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  os_unfair_lock_lock(&self->_lock);
  v4 = fmax(self->_lock_nextAvailableOperationStartTime - Current, 0.0);
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (void)delayNextCloudKitOperation:(double)a3
{
  double Current;
  double lock_nextAvailableOperationStartTime;
  void *v7;
  objc_class *v8;
  NSObject *v9;
  void *v10;
  int v11;
  HDCloudSyncCoordinator *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  lock_nextAvailableOperationStartTime = Current + a3;
  os_unfair_lock_lock(&self->_lock);
  if (Current + a3 < self->_lock_nextAvailableOperationStartTime)
    lock_nextAvailableOperationStartTime = self->_lock_nextAvailableOperationStartTime;
  self->_lock_nextAvailableOperationStartTime = lock_nextAvailableOperationStartTime;
  os_unfair_lock_unlock(&self->_lock);
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v7;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithTimeIntervalSinceReferenceDate:", lock_nextAvailableOperationStartTime);
    v11 = 138544130;
    v12 = self;
    v13 = 2048;
    v14 = a3;
    v15 = 2048;
    v16 = lock_nextAvailableOperationStartTime - Current;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: CloudKit operation delay of %0.2lfs requested; next available operation start is in %0.2lfs at %{public}@",
      (uint8_t *)&v11,
      0x2Au);

  }
}

- (BOOL)scheduleSyncForAllProfilesViaGatedXPCActivity:(BOOL)a3 context:(id)a4 reason:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v7 = a3;
  v14 = 0;
  v9 = -[HDCloudSyncCoordinator _setupSyncRequestWithContext:reason:error:]((id *)&self->super.isa, a4, a5, &v14);
  v10 = v14;
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivity:completion:]((uint64_t)self, v7, &__block_literal_global_49);
  }
  else
  {
    v12 = v10;
    if (v12)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  return v9;
}

- (uint64_t)_setupSyncRequestWithContext:(void *)a3 reason:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id WeakRetained;
  void *v13;
  char v14;
  char v15;
  id v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  BOOL v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  _QWORD *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v33 = 0;
    goto LABEL_38;
  }
  v9 = v7;
  if (objc_msgSend(v9, "reason") == 1)
  {
    objc_msgSend(a1[19], "platformConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isConfiguredForLiteSync");

    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v42 = v22;
        objc_msgSend(v9, "reason");
        HKCloudSyncReasonToString();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = a1;
        v49 = 2114;
        v50 = v43;
        _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Incoming sync request with reason: %{public}@ is disabled because no iPad is present in context", buf, 0x16u);

      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = CFSTR("Sync requests disabled because no iPad is present in context");
      goto LABEL_13;
    }
  }
  WeakRetained = objc_loadWeakRetained(a1 + 21);
  objc_msgSend(WeakRetained, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsBackgroundSyncRequests");

  if ((v14 & 1) == 0)
  {
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v40 = v19;
      objc_msgSend(v9, "reason");
      HKCloudSyncReasonToString();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = a1;
      v49 = 2114;
      v50 = v41;
      _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Incoming sync request with reason: %{public}@. Sync requests disabled by behavior", buf, 0x16u);

    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = CFSTR("Sync requests disabled by behavior");
LABEL_13:
    objc_msgSend(v20, "hk_error:description:", 111, v21);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v23;
    if (v23)
      v24 = objc_retainAutorelease(v23);

    goto LABEL_16;
  }
  v46 = 0;
  v15 = objc_msgSend(a1, "canPerformCloudSyncWithError:", &v46);
  v16 = v46;
  if ((v15 & 1) != 0)
  {
    v17 = 0;
    v18 = 1;
    goto LABEL_18;
  }
  _HKInitializeLogging();
  v37 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v48 = a1;
    v49 = 2114;
    v50 = v9;
    v51 = 2114;
    v52 = v16;
    _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ \n Sync requested on client gated activity, but is not permitted. %{public}@", buf, 0x20u);
  }
  v38 = v16;
  if (v38)
  {
    v17 = objc_retainAutorelease(v38);
    v16 = v17;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_16:
  v16 = 0;
LABEL_17:

  v18 = 0;
LABEL_18:

  v25 = v17;
  v26 = v25;
  if ((v18 & 1) == 0)
  {
    v34 = v25;
    v32 = v34;
    if (v34)
    {
      if (a4)
      {
        v32 = objc_retainAutorelease(v34);
        *a4 = v32;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_36;
  }
  v44 = a4;
  objc_msgSend(v9, "syncRequest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_loadWeakRetained(a1 + 21);
  objc_msgSend(v29, "primaryProfile");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v26;
  v31 = +[HDCachedSyncRequestEntity insertSyncRequest:reason:date:profile:error:](HDCachedSyncRequestEntity, "insertSyncRequest:reason:date:profile:error:", v27, v8, v28, v30, &v45);
  v32 = v45;

  if (!v31)
  {
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v48 = a1;
      v49 = 2114;
      v50 = v32;
      _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@: Error persisting sync request %{public}@", buf, 0x16u);
    }
    v36 = v32;
    v32 = v36;
    if (v36)
    {
      if (v44)
      {
        v32 = objc_retainAutorelease(v36);
        *v44 = v32;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
LABEL_36:

    v33 = 0;
    goto LABEL_37;
  }
  v33 = 1;
LABEL_37:

LABEL_38:
  return v33;
}

- (void)_syncAllProfilesViaGatedXPCActivity:(void *)a3 completion:
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(void **)(a1 + 80);
    if (a2)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke;
      v11[3] = &unk_1E6CEFAD0;
      v8 = &v12;
      v12 = v5;
      objc_msgSend(v7, "requestRunWithMaximumDelay:completion:", v11, 1800.0);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke_2;
      v9[3] = &unk_1E6CEFAD0;
      v8 = &v10;
      v10 = v5;
      objc_msgSend(v7, "runUngatedWithCompletion:", v9);
    }

  }
}

- (void)syncAllProfilesViaGatedXPCActivity:(BOOL)a3 context:(id)a4 reason:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;

  v8 = a3;
  v12 = 0;
  v10 = a6;
  LOBYTE(a4) = -[HDCloudSyncCoordinator _setupSyncRequestWithContext:reason:error:]((id *)&self->super.isa, a4, a5, &v12);
  v11 = v12;
  if ((a4 & 1) != 0)
    -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivity:completion:]((uint64_t)self, v8, v10);
  else
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v11);

}

uint64_t __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)syncAllProfilesWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__44;
  v21 = __Block_byref_object_dispose__44;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HDCloudSyncCoordinator_syncAllProfilesWithContext_completion___block_invoke;
  v13[3] = &unk_1E6CEFAF8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __64__HDCloudSyncCoordinator_syncAllProfilesWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id WeakRetained;
  void *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  _BYTE buf[24];
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  os_signpost_id_t v61;
  BOOL v62;
  _QWORD v63[2];
  _QWORD v64[4];

  v1 = a1;
  v64[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(v2 + 160), "checkLastSyncDate");
    v54 = 0;
    v6 = objc_msgSend((id)v2, "canPerformCloudSyncWithError:", &v54);
    v7 = v54;
    v8 = v7;
    if ((v6 & 1) != 0)
    {
      v46 = v7;
      v49 = v1;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 128));
      -[HDCloudSyncCoordinator _primaryProfile](v2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HDCloudSyncRestorePhaseSyncCompleteStartDate(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 160), "lastSuccessfulPullDate");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11 | v10;

      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        HDSetCloudSyncRestorePhaseSyncCompleteStartDate(v13, v9);

      }
      v14 = kHDEventNameCloudSync;
      v63[0] = CFSTR("reason");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "reason"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = CFSTR("options");
      v64[0] = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "options"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDPowerLog(v14, v17, 1);

      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, date=%@"), v4, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = v21;

      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(v2 + 48);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v24;
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: start syncAllProfiles: %{public}@", buf, 0x16u);
      }
      _HKLogPersistedSignposts();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = _HKLogSignpostIDGenerate();

      _HKInitializeLogging();
      _HKLogPersistedSignposts();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_signpost_enabled(v27);

      if (v28)
      {
        _HKLogPersistedSignposts();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v4;
          _os_signpost_emit_with_name_impl(&dword_1B7802000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v26, "cloud-sync", " enableTelemetry=YES %{public}@", buf, 0xCu);
        }

      }
      +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", v2, CFSTR("Sync"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id *)(v2 + 32);
      v32 = *(_QWORD *)(v2 + 32);
      v34 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke;
      v56 = &unk_1E6CEFB48;
      v57 = v2;
      v62 = v32 == 0;
      v48 = v4;
      v35 = v4;
      v58 = v35;
      v61 = v26;
      v36 = v31;
      v59 = v36;
      v47 = v5;
      v60 = v5;
      v37 = _Block_copy(buf);
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 168));
      objc_msgSend(WeakRetained, "profileManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "allProfileIdentifiers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v50[0] = v34;
      v50[1] = 3221225472;
      v50[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_247;
      v50[3] = &unk_1E6CEFB70;
      v41 = v37;
      v53 = v41;
      v50[4] = v2;
      v42 = v40;
      v51 = v42;
      v52 = v35;
      -[HDCloudSyncCoordinator _queue_syncProfilesWithIdentifiers:context:completion:](v2, v42, v52, v50);
      v2 = objc_claimAutoreleasedReturnValue();
      if (!v32)
        objc_storeStrong(v33, (id)v2);

      v4 = v48;
      v1 = v49;
      v8 = v46;
      v5 = v47;
    }
    else
    {
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync triggered, but is not permitted. %{public}@", buf, 0x16u);
      }
      (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v8);
      objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
      v2 = objc_claimAutoreleasedReturnValue();
    }

  }
  v44 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
  v45 = *(void **)(v44 + 40);
  *(_QWORD *)(v44 + 40) = v2;

}

void __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  char v17;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2;
  block[3] = &unk_1E6CEFB20;
  v16 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 128);
  block[1] = 3221225472;
  block[4] = v6;
  v17 = a2;
  v11 = v7;
  v12 = v5;
  v15 = *(_QWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v9 = v5;
  dispatch_async(v8, block);

}

void __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  uint64_t v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 80))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = 0;

    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  else
  {
    v4 = 0;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("YES");
  if (!*(_BYTE *)(a1 + 81))
    v12 = CFSTR("NO");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, date=%@, success=%@, error=%@"), v8, v10, v12, *(_QWORD *)(a1 + 48));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = v13;

  _HKInitializeLogging();
  v16 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(v17 + 56);
    *(_DWORD *)buf = 138543618;
    v43 = v17;
    v44 = 2114;
    v45 = v18;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: finish syncAllProfiles: %{public}@", buf, 0x16u);
  }
  v19 = kHDEventNameCloudSync;
  v40[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "reason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v20;
  v40[1] = CFSTR("options");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "options"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v21;
  v40[2] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  HDPowerLog(v19, v23, 3);

  _HKInitializeLogging();
  _HKLogPersistedSignposts();
  v24 = objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = os_signpost_enabled(v24);

  if ((_DWORD)v19)
  {
    _HKLogPersistedSignposts();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 72);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v28 = *(_QWORD *)(a1 + 40);
      v29 = *(unsigned __int8 *)(a1 + 81);
      *(_DWORD *)buf = 138543618;
      v43 = v28;
      v44 = 1024;
      LODWORD(v45) = v29;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v26, OS_SIGNPOST_INTERVAL_END, v27, "cloud-sync", " enableTelemetry=YES %{public}@, success=%{BOOL}d", buf, 0x12u);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "updatePeriodicActivitiesWithSyncSuccess:", *(unsigned __int8 *)(a1 + 81));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = v4;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v34++) + 16))();
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v32);
  }

}

void __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_247(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
    objc_msgSend(WeakRetained, "profileManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allProfileIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2_248;
    v17[3] = &unk_1E6CEB220;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v8, "hk_filter:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(NSObject **)(v11 + 128);
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_3;
      block[3] = &unk_1E6CE7E08;
      block[4] = v11;
      v14 = v10;
      v15 = *(id *)(a1 + 48);
      v16 = *(id *)(a1 + 56);
      dispatch_async(v12, block);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_2_248(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

id __71__HDCloudSyncCoordinator__queue_syncAllProfilesWithContext_completion___block_invoke_3(uint64_t a1)
{
  return -[HDCloudSyncCoordinator _queue_syncProfilesWithIdentifiers:context:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (id)_queue_syncProfilesWithIdentifiers:(void *)a3 context:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id obj;
  void *v30;
  id *location;
  id v32;
  id v33;
  _QWORD v34[2];
  uint64_t (*v35)(uint64_t, int);
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v33 = a3;
  v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 128));
    if (objc_msgSend(v7, "count"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D298C8]);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke;
      v42[3] = &unk_1E6CEFB98;
      v30 = (void *)a1;
      v42[4] = a1;
      v27 = v8;
      v43 = v8;
      objc_msgSend(v9, "setDidFinish:", v42);
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v46 = v7;
        v47 = 2114;
        v48 = v33;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling cloud sync for profiles %{public}@: %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v7, "count"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginTask");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v28 = v7;
      obj = v7;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v11)
      {
        v12 = v11;
        location = (id *)(a1 + 168);
        v13 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v39 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v9, "beginTask");
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v35 = __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_252;
            v36 = &unk_1E6CE77C8;
            v37 = v9;
            v16 = v15;
            v17 = v33;
            v18 = v34;
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncProfile_context_completion_, v30, CFSTR("HDCloudSyncCoordinator.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileIdentifier != nil"));

            }
            WeakRetained = objc_loadWeakRetained(location);
            objc_msgSend(WeakRetained, "profileManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "profileForIdentifier:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21 && (objc_msgSend(v30, "shouldSyncProfile:", v21) & 1) != 0)
            {
              objc_msgSend(v21, "cloudSyncManager");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v22;
              if (v22)
              {
                objc_msgSend(v22, "syncWithContext:completion:", v17, v18);
              }
              else
              {
                ((void (*)(_QWORD *, uint64_t, _QWORD))v35)(v18, 1, 0);
                objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
              }
              v24 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              ((void (*)(_QWORD *, uint64_t, _QWORD))v35)(v18, 1, 0);
              objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v32, "addChild:withPendingUnitCount:", v24, 1);
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v12);
      }

      objc_msgSend(v9, "finishTask");
      v8 = v27;
      v7 = v28;
    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
      objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v6 = a4;
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_2;
  v10[3] = &unk_1E6CEBC78;
  v13 = a3;
  v11 = v6;
  v12 = v7;
  v9 = v6;
  objc_msgSend(v8, "updateCachedLastSyncDatesWithCompletion:", v10);

}

void __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __80__HDCloudSyncCoordinator__queue_syncProfilesWithIdentifiers_context_completion___block_invoke_252(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishTask");
  else
    return objc_msgSend(v2, "failTaskWithError:");
}

BOOL __78__HDCloudSyncCoordinator__computeCoalescedSyncContext_coalescedRequest_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL8 v8;
  id obj;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = +[HDCachedSyncRequestEntity fetchCoalescedSyncRequest:transaction:error:](HDCachedSyncRequestEntity, "fetchCoalescedSyncRequest:transaction:error:", &obj, v5, a3);
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = v7
    && +[HDCachedSyncRequestEntity markPendingRequestsAsInProgress:error:](HDCachedSyncRequestEntity, "markPendingRequestsAsInProgress:error:", v5, a3);

  return v8;
}

void __76__HDCloudSyncCoordinator__syncAllProfilesViaGatedXPCActivityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5[11];
  v8 = a3;
  objc_msgSend(v5, "mergeCloudSyncJournalsAndNotifyObservers:syncRequestCompleted:success:error:", v7, v6, a2, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addChild:withPendingUnitCount:", v9, 1);
  objc_msgSend(*(id *)(a1 + 32), "clearClientSyncRequestsQueue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)clearClientSyncRequestsQueue
{
  id WeakRetained;
  void *v4;
  BOOL v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  HDCloudSyncCoordinator *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = +[HDCachedSyncRequestEntity clearInProgressSyncRequests:error:](HDCachedSyncRequestEntity, "clearInProgressSyncRequests:error:", v4, &v10);
  v6 = v10;

  v7 = (os_log_t *)MEMORY[0x1E0CB5370];
  if (!v5)
  {
    _HKInitializeLogging();
    v8 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error clearing all in progress sync requests %@", buf, 0x16u);
    }
  }
  _HKInitializeLogging();
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing client sync request queue", buf, 0xCu);
  }

}

- (BOOL)markAllClientSyncRequestsAsInProgress:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedSyncRequestEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, &__block_literal_global_265);

  return (char)a3;
}

BOOL __64__HDCloudSyncCoordinator_markAllClientSyncRequestsAsInProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDCachedSyncRequestEntity markPendingRequestsAsInProgress:error:](HDCachedSyncRequestEntity, "markPendingRequestsAsInProgress:error:", a2, a3);
}

- (void)prepareAllProfilesForPeriodicSyncAndRestore
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "profileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "profileForIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cloudSyncManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "prepareForPeriodicSync");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)resetAllProfilesWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD v34[2];
  uint64_t (*v35)(uint64_t, int);
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  HDCloudSyncCoordinator *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D298C8]);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke;
  v42[3] = &unk_1E6CEA1D8;
  v29 = v6;
  v43 = v29;
  objc_msgSend(v7, "setDidFinish:", v42);
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v46 = self;
    v47 = 2114;
    v48 = v33;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning cloud reset for all profiles: %{public}@", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "profileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v10;
  objc_msgSend(v10, "allProfileIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginTask");
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v11, "count"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v12)
  {
    v13 = v12;
    v31 = *(_QWORD *)v39;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
        objc_msgSend(v7, "beginTask");
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v35 = __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke_266;
        v36 = &unk_1E6CE77C8;
        v37 = v7;
        v16 = v15;
        v17 = v33;
        v18 = v34;
        if (self)
        {
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__resetProfile_context_completion_, self, CFSTR("HDCloudSyncCoordinator.m"), 631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileIdentifier != nil"));

          }
          v19 = objc_loadWeakRetained((id *)&self->_daemon);
          objc_msgSend(v19, "profileManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "profileForIdentifier:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 && -[HDCloudSyncCoordinator shouldSyncProfile:](self, "shouldSyncProfile:", v21))
          {
            objc_msgSend(v21, "cloudSyncManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              objc_msgSend(v22, "resetWithContext:completion:", v17, v18);
            }
            else
            {
              ((void (*)(_QWORD *, uint64_t, _QWORD))v35)(v18, 1, 0);
              objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            ((void (*)(_QWORD *, uint64_t, _QWORD))v35)(v18, 1, 0);
            objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v24 = 0;
        }

        objc_msgSend(v32, "addChild:withPendingUnitCount:", v24, 1);
        ++v14;
      }
      while (v13 != v14);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      v13 = v26;
    }
    while (v26);
  }

  objc_msgSend(v7, "finishTask");
  return v32;
}

void __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(a4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __65__HDCloudSyncCoordinator_resetAllProfilesWithContext_completion___block_invoke_266(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishTask");
  else
    return objc_msgSend(v2, "failTaskWithError:");
}

- (BOOL)shouldSyncProfile:(id)a3
{
  return 1;
}

- (id)fetchCloudDescriptionWithContext:(id)a3 completion:(id)a4
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id obj;
  id v39;
  id v40;
  _QWORD v41[2];
  uint64_t (*v42)(uint64_t, void *);
  void *v43;
  id v44;
  _QWORD *v45;
  _BYTE *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD *v54;
  _BYTE *v55;
  _QWORD v56[4];
  int v57;
  uint8_t v58[128];
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v40;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Scheduling fetch of cloud description for all profiles with context %{public}@", buf, 0xCu);
  }
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2810000000;
  v56[3] = &unk_1B805FAAD;
  v57 = 0;
  _HKInitializeLogging();
  v8 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v40;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning fetch of cloud description for all profiles with context %{public}@", buf, 0x16u);
  }
  -[HDCloudSyncAccountProvider getPersistedAccountInfo](self->_accountProvider, "getPersistedAccountInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v36, "accountPartition");
  CKStringFromPartition();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "hasValidCredentials"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("no");
  objc_msgSend(v36, "accountStatus");
  CKStringFromAccountStatus();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "deviceToDeviceEncryptionAvailability");
  CKStringFromDeviceToDeviceEncryptionStatus();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ Account (Credentials: %@, Status: %@, Encryption: %@)\n"), v10, v11, v12, v13);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v60 = __Block_byref_object_copy__44;
  v61 = __Block_byref_object_dispose__44;
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0D298C8]);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke;
  v51[3] = &unk_1E6CEFC08;
  v54 = v56;
  v55 = buf;
  v33 = v5;
  v53 = v33;
  v34 = v14;
  v52 = v34;
  objc_msgSend(v15, "setDidFinish:", v51);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "profileManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "allProfileIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v17, "count"));
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "beginTask");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v15, "beginTask");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v42 = __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke_2;
        v43 = &unk_1E6CEE790;
        v45 = v56;
        v46 = buf;
        v44 = v15;
        v22 = v21;
        v23 = v40;
        v24 = v41;
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__fetchDescriptionForProfile_context_completion_, self, CFSTR("HDCloudSyncCoordinator.m"), 717, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileIdentifier != nil"));

        }
        v25 = objc_loadWeakRetained((id *)&self->_daemon);
        objc_msgSend(v25, "profileManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "profileForIdentifier:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 && -[HDCloudSyncCoordinator shouldSyncProfile:](self, "shouldSyncProfile:", v27))
        {
          objc_msgSend(v27, "cloudSyncManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
          {
            objc_msgSend(v28, "fetchDescriptionWithContext:completion:", v23, v24);
          }
          else
          {
            ((void (*)(_QWORD *, _QWORD, _QWORD))v42)(v24, 0, 0);
            objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          ((void (*)(_QWORD *, _QWORD, _QWORD))v42)(v24, 0, 0);
          objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v39, "addChild:withPendingUnitCount:", v30, 1);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v18);
  }

  objc_msgSend(v15, "finishTask");
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v56, 8);
  return v39;
}

void __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
    v9 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
    (*(void (**)(_QWORD, _QWORD, id, _QWORD))(a1[5] + 16))(a1[5], a1[4], v9, 0);
  }
  else
  {
    v7 = a1[4];
    v8 = a1[5];
    objc_msgSend(a4, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v8 + 16))(v8, v7, 0, v9);
  }

}

uint64_t __70__HDCloudSyncCoordinator_fetchCloudDescriptionWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishTask");
}

- (BOOL)hasActiveSyncTask
{
  return -[HDCloudSyncManagerTaskQueue hasActiveTask](self->_syncTaskQueue, "hasActiveTask");
}

- (id)progressOfActiveSyncTask
{
  void *v2;
  void *v3;

  -[HDCloudSyncManagerTaskQueue activeTask](self->_syncTaskQueue, "activeTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)addCloudSyncProgressCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  HDCloudSyncCoordinator *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__44;
  v26 = __Block_byref_object_dispose__44;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __57__HDCloudSyncCoordinator_addCloudSyncProgressCompletion___block_invoke;
  v13 = &unk_1E6CEFC30;
  v14 = self;
  v16 = &v22;
  v6 = v4;
  v15 = v6;
  v17 = &v18;
  dispatch_sync(queue, &v10);
  if (!*((_BYTE *)v19 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 726, CFSTR("No sync in progress."), v10, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v7);

  }
  v8 = (id)v23[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

void __57__HDCloudSyncCoordinator_addCloudSyncProgressCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v1);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = _Block_copy(v7);
    objc_msgSend(v3, "addObject:", v8);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (BOOL)canPerformCloudSyncWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  char v7;
  _BOOL4 v8;
  _BOOL4 lock_hasComputedCloudSyncEnabled;
  NSObject *v10;
  const char *v11;
  int v13;
  HDCloudSyncCoordinator *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncCoordinator _setupCloudSyncSupportIfRequired]((uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCloudSync");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 111, CFSTR("Cloud sync not supported on this device."));
    LOBYTE(a3) = 0;
    return (char)a3;
  }
  os_unfair_lock_lock(&self->_lock);
  v8 = -[HDCloudSyncAccountProvider computeCanPerformCloudSyncForPrimaryAccount:](self->_accountProvider, "computeCanPerformCloudSyncForPrimaryAccount:", a3);
  LODWORD(a3) = v8;
  if (self->_lock_cloudSyncEnabled == v8)
  {
    lock_hasComputedCloudSyncEnabled = self->_lock_hasComputedCloudSyncEnabled;
    self->_lock_cloudSyncEnabled = v8;
    self->_lock_hasComputedCloudSyncEnabled = 1;
    os_unfair_lock_unlock(&self->_lock);
    if (lock_hasComputedCloudSyncEnabled)
      return (char)a3;
  }
  else
  {
    self->_lock_cloudSyncEnabled = v8;
    self->_lock_hasComputedCloudSyncEnabled = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v11 = "disabled";
    if ((_DWORD)a3)
      v11 = "ENABLED";
    v13 = 138543618;
    v14 = self;
    v15 = 2080;
    v16 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync %s", (uint8_t *)&v13, 0x16u);
  }
  -[HDCloudSyncPeriodicActivityScheduler updatePeriodicActivityCriteria](self->_periodicActivityScheduler, "updatePeriodicActivityCriteria");
  return (char)a3;
}

- (id)stateSyncEntityClasses
{
  os_unfair_lock_s *p_lock;
  NSArray *lock_stateSyncEntityClasses;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
  if (!lock_stateSyncEntityClasses)
  {
    os_unfair_lock_assert_owner(p_lock);
    lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
    if (!lock_stateSyncEntityClasses)
    {
      HDBuiltinStateSyncEntities();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
      objc_msgSend(WeakRetained, "pluginManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pluginsConformingToProtocol:", &unk_1EF2522D8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "stateSyncEntityClasses", (_QWORD)v23);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

      v17 = (NSArray *)objc_msgSend(v6, "copy");
      v18 = self->_lock_stateSyncEntityClasses;
      self->_lock_stateSyncEntityClasses = v17;

      lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
    }
  }
  v19 = lock_stateSyncEntityClasses;
  os_unfair_lock_unlock(p_lock);
  if (v19)
    v20 = v19;
  else
    v20 = (NSArray *)MEMORY[0x1E0C9AA60];
  v21 = v20;

  return v21;
}

- (id)stateSyncDomainForSubscriptionIdentifier
{
  __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = HDCloudSyncMedicationsStateChangedSubscriptionIdentifier;
  v4[0] = CFSTR("CloudSyncStateEntityDomainMedications");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addManagerTask:(id)a3
{
  -[HDCloudSyncManagerTaskQueue addTask:](self->_syncTaskQueue, "addTask:", a3);
}

- (int64_t)compareTask:(id)a3 withTask:(id)a4 queue:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "priority");
  if (v8 <= objc_msgSend(v7, "priority"))
  {
    v10 = objc_msgSend(v6, "priority");
    v9 = v10 < objc_msgSend(v7, "priority");
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)_primaryProfile
{
  void *v1;
  id v2;
  id WeakRetained;

  v1 = *(void **)(a1 + 120);
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
    objc_msgSend(WeakRetained, "primaryProfile");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)scheduleSharedSummaryPushWithMaximumDelay:(double)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  HDCloudSyncCoordinator *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling shared summaries push with delay %lf.", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HDCloudSyncCoordinator_scheduleSharedSummaryPushWithMaximumDelay___block_invoke;
  v7[3] = &unk_1E6CE8058;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_sync(queue, v7);
}

uint64_t __68__HDCloudSyncCoordinator_scheduleSharedSummaryPushWithMaximumDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "requestRunWithMaximumDelay:completion:", &__block_literal_global_344, *(double *)(a1 + 40));
}

BOOL __61__HDCloudSyncCoordinator__pushSharedSummariesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

uint64_t __61__HDCloudSyncCoordinator__pushSharedSummariesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)databaseJournalMergeDidCompleteForProfile:(id)a3 type:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = objc_msgSend(a3, "profileType");
  if (self && v5 == 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[HDCloudSyncCoordinator _primaryProfile]((uint64_t)self);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    HDCloudSyncRestorePhaseSyncCompleteEndDate(v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncRestorePhaseMergeCompleteEndDate(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 && v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HDCloudSyncRestorePhaseSyncCompleteStartDate(v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;
      objc_msgSend(v14, "daemon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "analyticsSubmissionCoordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cloudSync_reportRestoreForProfile:startDate:endDate:duration:finishedJournalMerge:", v14, v8, v7, 1, v10);

      HDSetCloudSyncRestorPhaseMergeCompleteEndDate(v7, v14);
    }
    if (v7)
    {
      objc_msgSend(v14, "database");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeDatabaseJournalMergeObserver:journalType:", self, 2);

    }
  }
}

- (void)addObserver:(id)a3
{
  HKObserverSet *observers;
  id v5;
  id v6;

  observers = self->_observers;
  v5 = a3;
  -[HDCloudSyncCoordinator queue](self, "queue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKObserverSet registerObserver:queue:](observers, "registerObserver:queue:", v5, v6);

}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)notifyObservers:(id)a3 syncRequestStarted:(id)a4 withProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDCloudSyncCoordinator_notifyObservers_syncRequestStarted_withProgress___block_invoke;
  v12[3] = &unk_1E6CEFCD8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "notifyObservers:", v12);

}

void __74__HDCloudSyncCoordinator_notifyObservers_syncRequestStarted_withProgress___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v4 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB38A8], "hd_progressMirroringProgress:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudSyncCoordinator:syncStartedForRequest:progress:", v3, v4, v5);

  }
}

- (void)notifyObservers:(id)a3 syncRequestCompleted:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HDCloudSyncCoordinator_notifyObservers_syncRequestCompleted_success_error___block_invoke;
  v14[3] = &unk_1E6CEFD00;
  v14[4] = self;
  v15 = v10;
  v17 = a5;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(a3, "notifyObservers:", v14);

}

void __77__HDCloudSyncCoordinator_notifyObservers_syncRequestCompleted_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cloudSyncCoordinator:syncRequestDidCompleteForRequest:success:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)unitTest_setAccountProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountProvider, a3);
}

- (void)unitTest_setPeriodicActivityScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActivityScheduler, a3);
}

- (void)unitTest_setPrimaryProfileOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_primaryProfileOverride, a3);
}

- (void)unitTest_setClientGatedSyncActivity:(id)a3
{
  objc_storeStrong((id *)&self->_clientGatedSyncActivity, a3);
}

- (id)unitTest_clientGatedSyncActivity
{
  return self->_clientGatedSyncActivity;
}

- (void)unitTest_performClientGatedSyncActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HDCloudSyncCoordinator_unitTest_performClientGatedSyncActivity___block_invoke;
  v6[3] = &unk_1E6CEFAD0;
  v7 = v4;
  v5 = v4;
  -[HDCloudSyncCoordinator _syncAllProfilesViaGatedXPCActivityWithCompletion:]((uint64_t)self, v6);

}

uint64_t __66__HDCloudSyncCoordinator_unitTest_performClientGatedSyncActivity___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unitTest_setStateSyncEntityClasses:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSArray *v6;
  NSArray *lock_stateSyncEntityClasses;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  lock_stateSyncEntityClasses = self->_lock_stateSyncEntityClasses;
  self->_lock_stateSyncEntityClasses = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)diagnosticDescription
{
  void *v3;
  _BOOL4 v4;
  id v5;
  const __CFString *v6;
  void *v7;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9 = 0;
  v4 = -[HDCloudSyncCoordinator canPerformCloudSyncWithError:](self, "canPerformCloudSyncWithError:", &v9);
  v5 = v9;
  v6 = CFSTR("NO");
  if (v4)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nCloudSync Enabled: %@ \nStarted: %@\nEnded: %@\n"), v6, self->_latestSyncStartLog, self->_latestSyncEndLog);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDCloudSyncAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (HDCloudSyncSubscriptionNotificationHandler)subscriptionNotificationHandler
{
  return self->_subscriptionNotificationHandler;
}

- (HDCloudSyncPeriodicActivityScheduler)periodicActivityScheduler
{
  return self->_periodicActivityScheduler;
}

- (HDCloudSyncStatusProvider)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
  objc_storeStrong((id *)&self->_periodicActivityScheduler, 0);
  objc_storeStrong((id *)&self->_subscriptionNotificationHandler, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unitTest_primaryProfileOverride, 0);
  objc_storeStrong((id *)&self->_lock_stateSyncEntityClasses, 0);
  objc_storeStrong((id *)&self->_sharedSummaryPushActivity, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_clientGatedSyncActivity, 0);
  objc_storeStrong((id *)&self->_progressCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_latestSyncEndLog, 0);
  objc_storeStrong((id *)&self->_latestSyncStartLog, 0);
  objc_storeStrong((id *)&self->_activeSyncCompletions, 0);
  objc_storeStrong((id *)&self->_activeSyncProgress, 0);
  objc_storeStrong((id *)&self->_syncTaskQueue, 0);
}

- (id)mergeCloudSyncJournalsAndNotifyObservers:(id)a3 syncRequestCompleted:(id)a4 success:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    if (v7)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __125__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsAndNotifyObservers_syncRequestCompleted_success_error___block_invoke;
      v16[3] = &unk_1E6CE7DB8;
      v16[4] = self;
      v17 = v10;
      v18 = v11;
      -[HDCloudSyncCoordinator mergeCloudSyncJournalsWithCompletion:](self, "mergeCloudSyncJournalsWithCompletion:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, 1);

    }
    else
    {
      objc_msgSend(v13, "setCompletedUnitCount:", 1);
      -[HDCloudSyncCoordinator notifyObservers:syncRequestCompleted:success:error:](self, "notifyObservers:syncRequestCompleted:success:error:", v10, v11, 0, v12);
    }
  }
  else
  {
    objc_msgSend(v13, "setCompletedUnitCount:", 1);
  }

  return v13;
}

uint64_t __125__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsAndNotifyObservers_syncRequestCompleted_success_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObservers:syncRequestCompleted:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3);
}

- (id)mergeCloudSyncJournalsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  HDCloudSyncCoordinator *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync journal merge attempt starting.", buf, 0xCu);
  }
  v6 = objc_alloc(MEMORY[0x1E0D29810]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsWithCompletion___block_invoke;
  v11[3] = &unk_1E6CF1260;
  v12 = v4;
  v7 = v4;
  v8 = (void *)objc_msgSend(v6, "initWithDescription:completion:", CFSTR("Merge pending cloud sync journals"), v11);
  -[HDCloudSyncCoordinator _mergeCloudSyncJournalsWithTaskTree:](self, "_mergeCloudSyncJournalsWithTaskTree:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "begin");

  return v9;
}

uint64_t __86__HDCloudSyncCoordinator_CloudSyncJournalMerge__mergeCloudSyncJournalsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0, a4);
}

- (id)_mergeCloudSyncJournalsWithTaskTree:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDCloudSyncCoordinator daemon](self, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allProfileIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[HDCloudSyncCoordinator _mergeCloudSyncJournalsForProfile:taskTree:](self, "_mergeCloudSyncJournalsForProfile:taskTree:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v4, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addChild:withPendingUnitCount:", v14, 1);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_mergeCloudSyncJournalsForProfile:(id)a3 taskTree:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB38A8];
  v8 = a4;
  objc_msgSend(v7, "discreteProgressWithTotalUnitCount:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke;
  v15[3] = &unk_1E6CF12B0;
  v15[4] = self;
  v16 = v6;
  v10 = v9;
  v17 = v10;
  v11 = v6;
  objc_msgSend(v8, "addTask:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

void __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _BYTE *v23;
  id v24;
  uint8_t v25[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  _BYTE buf[24];
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profileForIdentifier:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _HKInitializeLogging();
    v10 = (os_log_t *)MEMORY[0x1E0CB5370];
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Merging cloud sync journal for profile %{public}@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v32 = 0;
    objc_msgSend(v9, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_190;
    v21[3] = &unk_1E6CF1288;
    v14 = v9;
    v22 = v14;
    v23 = buf;
    v15 = objc_msgSend(v13, "performWithJournalType:error:block:", 2, &v24, v21);
    v16 = v24;

    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", 1);
    if ((v15 & 1) != 0)
    {
      v17 = 0;
      v18 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v25 = 138543874;
        v26 = v20;
        v27 = 2114;
        v28 = v14;
        v29 = 2114;
        v30 = v16;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to merge cloud sync journals for profile %{public}@: %{public}@", v25, 0x20u);
      }
      v17 = 1;
      v18 = v16;
    }
    ((void (**)(id, uint64_t, id))v6)[2](v6, v17, v18);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", 1);
    v6[2](v6, 0, 0);
  }

}

BOOL __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_190(uint64_t a1, uint64_t a2)
{
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_2;
  v7[3] = &unk_1E6CEE6D0;
  v7[4] = *(_QWORD *)(a1 + 40);
  v5 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v4, a2, v7);

  return v5;
}

uint64_t __92__HDCloudSyncCoordinator_CloudSyncJournalMerge___mergeCloudSyncJournalsForProfile_taskTree___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

@end
