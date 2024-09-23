@implementation HDAppSubscriptionManager

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_launchQueue);
  if (v4)
  {
    +[HDMutableDatabaseTransactionContext contextForWriting](HDMutableDatabaseTransactionContext, "contextForWriting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setCacheScope:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = self;
    v14 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke;
    v13[3] = &unk_1E6CEBC00;
    v10 = objc_msgSend(v9, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &v14, v13, 0);
    v11 = v14;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to update scheduled launch times: %{public}@", buf, 0xCu);
      }
    }

  }
}

uint64_t __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke_2;
  v4[3] = &unk_1E6CF4968;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  return 1;
}

- (HDAppSubscriptionManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDAppSubscriptionManager)initWithProfile:(id)a3
{
  id v4;
  HDAppSubscriptionManager *v5;
  HDAppSubscriptionManager *v6;
  uint64_t v7;
  OS_dispatch_queue *launchQueue;
  uint64_t v9;
  NSMutableDictionary *pendingTypeCodesToAnchors;
  NSMutableSet *v11;
  NSMutableSet *observedDataTypeCodes;
  NSMutableDictionary *v13;
  NSMutableDictionary *outstandingLaunchesByBundleIdentifier;
  uint64_t v15;
  NSMutableDictionary *launchTimers;
  uint64_t v17;
  NSMutableDictionary *launchTimerLaunchTimes;
  void *v19;
  uint64_t v20;
  HDBackgroundTaskScheduler *backgroundTaskScheduler;
  HDBackgroundAppLauncher *v22;
  HDBackgroundAppLauncher *backgroundAppLauncher;
  HDBackgroundTaskScheduler *v24;
  id WeakRetained;
  id v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HDAppSubscriptionManager;
  v5 = -[HDAppSubscriptionManager init](&v35, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    launchQueue = v6->_launchQueue;
    v6->_launchQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingTypeCodesToAnchors = v6->_pendingTypeCodesToAnchors;
    v6->_pendingTypeCodesToAnchors = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observedDataTypeCodes = v6->_observedDataTypeCodes;
    v6->_observedDataTypeCodes = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outstandingLaunchesByBundleIdentifier = v6->_outstandingLaunchesByBundleIdentifier;
    v6->_outstandingLaunchesByBundleIdentifier = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    launchTimers = v6->_launchTimers;
    v6->_launchTimers = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    launchTimerLaunchTimes = v6->_launchTimerLaunchTimes;
    v6->_launchTimerLaunchTimes = (NSMutableDictionary *)v17;

    objc_msgSend(v4, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backgroundTaskScheduler");
    v20 = objc_claimAutoreleasedReturnValue();
    backgroundTaskScheduler = v6->_backgroundTaskScheduler;
    v6->_backgroundTaskScheduler = (HDBackgroundTaskScheduler *)v20;

    v22 = objc_alloc_init(HDBackgroundAppLauncher);
    backgroundAppLauncher = v6->_backgroundAppLauncher;
    v6->_backgroundAppLauncher = v22;

    objc_initWeak(&location, v6);
    v24 = v6->_backgroundTaskScheduler;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __44__HDAppSubscriptionManager_initWithProfile___block_invoke;
    v32 = &unk_1E6CF4828;
    objc_copyWeak(&v33, &location);
    -[HDBackgroundTaskScheduler registerClientWithName:taskHandler:](v24, "registerClientWithName:taskHandler:", CFSTR("HDAppSubscriptionManager"), &v29);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, v6->_launchQueue, v29, v30, v31, v32);

    v26 = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(v26, "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addProtectedDataObserver:queue:", v6, v6->_launchQueue);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __44__HDAppSubscriptionManager_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD *WeakRetained;
  __int128 buf;
  void (*v9)(uint64_t);
  void *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = v3;
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "Background task job %{public}@ has fired!", (uint8_t *)&buf, 0xCu);
    }
    v6 = WeakRetained[7];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v9 = __57__HDAppSubscriptionManager__backgroundTaskFiredWithName___block_invoke;
    v10 = &unk_1E6CE8080;
    v11 = WeakRetained;
    v12 = v4;
    dispatch_async(v6, &buf);

  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  NSObject *launchQueue;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  _QWORD block[5];
  _QWORD handler[4];
  id v12;
  id location;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  launchQueue = self->_launchQueue;
  v6 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke;
  handler[3] = &unk_1E6CE8390;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch("kKeepAppsUpToDateEnabledChangedNotification", &self->_backgroundAppRefreshNotifyToken, launchQueue, handler);
  self->_shouldScheduleLaunches = HDCheckAutomaticAppUpdatesAllowed();
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldScheduleLaunches)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Setting should schedule launches %{public}@", buf, 0xCu);
  }
  v9 = self->_launchQueue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke_208;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(v9, block);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[24] = HDCheckAutomaticAppUpdatesAllowed();
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
    {
      if (WeakRetained[24])
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "Updating should schedule launches %{public}@", (uint8_t *)&v4, 0xCu);
    }
    -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:]((uint64_t)WeakRetained, -1, 0, 0);
  }

}

- (void)_queue_scheduleLaunches:(void *)a3 anchor:(uint64_t)a4 type:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id *v46;
  uint64_t i;
  void *v48;
  void *v49;
  id WeakRetained;
  id v51;
  NSObject *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  _QWORD *v64;
  id obj;
  _QWORD block[5];
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  void *v74;
  id v75;
  NSObject *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 buf;
  uint64_t (*v82)(uint64_t, uint64_t);
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      if ((HDBackgroundObservationSupportedForDataTypeCode(a2) & 1) != 0)
      {
        if (a2 < 0
          || (v8 = *(void **)(a1 + 8),
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9),
              v9,
              (v8 & 1) != 0))
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v82 = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke;
          v83 = &unk_1E6CEC7A8;
          v64 = (_QWORD *)a1;
          v84 = a1;
          v87 = a2;
          v12 = v11;
          v85 = v12;
          v13 = v10;
          v86 = v13;
          v14 = 0;
          if (HKWithAutoreleasePool())
            v14 = (void *)objc_msgSend(v12, "copy");

          v15 = 0;
          v16 = v15;
          if (!v14)
          {
            v28 = &unk_1E6DFAF40;
            if (v7)
              v28 = v7;
            v29 = v15;
            v30 = *(void **)(a1 + 64);
            v31 = (void *)MEMORY[0x1E0CB37E8];
            v32 = v28;
            objc_msgSend(v31, "numberWithInteger:", a2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDAppSubscriptionManager _updateOrCreateSubscription:value:type:](v34, v32, a4);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = (void *)v64[8];
            v16 = v29;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v37);

            _HKInitializeLogging();
            v38 = *MEMORY[0x1E0CB5288];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v16;
              _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "Failed to look up app subscriptions: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            goto LABEL_43;
          }
          if (!objc_msgSend(v14, "count"))
          {
LABEL_43:

            goto LABEL_44;
          }
          v59 = a4;
          v62 = a2;
          if (!_HKValidDataTypeCode())
          {
            _HKInitializeLogging();
            v39 = *MEMORY[0x1E0CB5288];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "Scheduling launches for all data codes.", (uint8_t *)&buf, 2u);
            }
            goto LABEL_32;
          }
          objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E0CB5288];
          v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v18;
              v21 = "Scheduling launches for %@";
LABEL_30:
              _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&buf, 0xCu);
            }
          }
          else if (v20)
          {
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = a2;
            v21 = "Scheduling launches for %lu";
            goto LABEL_30;
          }

LABEL_32:
          v58 = v16;
          v60 = v14;
          v40 = v14;
          v61 = v13;
          v56 = v13;
          v63 = v7;
          v57 = v7;
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v40, "count"));
          v42 = dispatch_group_create();
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          obj = v40;
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, &buf, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v78;
            v46 = (id *)(a1 + 32);
            do
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v78 != v45)
                  objc_enumerationMutation(obj);
                v48 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
                objc_msgSend(v48, "bundleIdentifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                WeakRetained = objc_loadWeakRetained(v46);
                +[HDAppSubscriptionAppLaunchEntity appSDKVersionTokenForBundleID:profile:error:](HDAppSubscriptionAppLaunchEntity, "appSDKVersionTokenForBundleID:profile:error:", v49, WeakRetained, 0);

                if ((dyld_version_token_at_least() & 1) != 0)
                {
                  dispatch_group_enter(v42);
                  v72[0] = MEMORY[0x1E0C809B0];
                  v72[1] = 3221225472;
                  v72[2] = __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke;
                  v72[3] = &unk_1E6CF4850;
                  v73 = v41;
                  v74 = v48;
                  v51 = v49;
                  v75 = v51;
                  v76 = v42;
                  objc_msgSend(v64, "_isBackgroundAppRefreshDisabledForBundleIdentifier:completion:", v51, v72);

                }
                else
                {
                  objc_msgSend(v41, "addObject:", v48);
                }

              }
              v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, &buf, 16);
            }
            while (v44);
          }

          v52 = v64[7];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke_213;
          block[3] = &unk_1E6CF4878;
          block[4] = v64;
          v67 = v41;
          v53 = v56;
          v68 = v53;
          v70 = v62;
          v54 = v57;
          v69 = v54;
          v71 = v59;
          v55 = v41;
          dispatch_group_notify(v42, v52, block);

          v7 = v63;
          v14 = v60;
          v13 = v61;
          v16 = v58;
          goto LABEL_43;
        }
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = a2;
          v23 = "Ignoring scheduling launches for unobserved type %ld";
          goto LABEL_20;
        }
      }
      else
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = a2;
          v23 = "Ignoring scheduling launches for unsupported type %ld";
LABEL_20:
          v24 = v27;
          v25 = OS_LOG_TYPE_INFO;
          v26 = 12;
          goto LABEL_21;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v23 = "Not scheduling launches";
        v24 = v22;
        v25 = OS_LOG_TYPE_DEFAULT;
        v26 = 2;
LABEL_21:
        _os_log_impl(&dword_1B7802000, v24, v25, v23, (uint8_t *)&buf, v26);
      }
    }
  }
LABEL_44:

}

void __50__HDAppSubscriptionManager_profileDidBecomeReady___block_invoke_208(uint64_t a1)
{
  -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](*(_QWORD *)(a1 + 32), -1, 0, 0);
}

void __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "BAR is disabled for app: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __107__HDAppSubscriptionManager__updateSubscriptionsBasedOnBARSwitchState_lastLaunchTimes_dataCode_anchor_type___block_invoke_213(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  dispatch_time_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  int v41;
  double Current;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  int v48;
  NSObject *v49;
  _BOOL4 v50;
  NSObject *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  HDBackgroundTask *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  time_t v69;
  id v70;
  uint64_t v71;
  _QWORD handler[5];
  NSObject *v73;
  id v74;
  id v75;
  _BYTE *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE buf[24];
  uint64_t v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v66 = *(_QWORD *)(a1 + 64);
  v64 = *(_QWORD *)(a1 + 72);
  v61 = *(id *)(a1 + 40);
  v67 = v2;
  v70 = v3;
  if (!v1)
    goto LABEL_55;
  WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
  if (!WeakRetained)
    goto LABEL_54;
  v71 = v1;
  v60 = WeakRetained;
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentProtectionManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = time(0);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v61;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (!v68)
    goto LABEL_53;
  v65 = *(_QWORD *)v79;
  do
  {
    for (i = 0; i != v68; ++i)
    {
      if (*(_QWORD *)v79 != v65)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        -[HDAppSubscriptionManager _activityNameForSubscription:anchor:](v7, v70);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Setting next launch time for %@", buf, 0xCu);

      }
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        v15 = objc_msgSend(v7, "lastAckTime");
        v16 = objc_msgSend(v7, "updateFrequency");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Last Ack: %lld - Update Freq: %lld", buf, 0x16u);

      }
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        v19 = objc_msgSend(v9, "longLongValue");
        v20 = objc_msgSend(v7, "launchTimeHysteresis");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "Last Launch: %lld - Hyst: %lld", buf, 0x16u);

      }
      v21 = objc_msgSend(v7, "lastAckTime");
      v22 = objc_msgSend(v7, "updateFrequency");
      v23 = objc_msgSend(v9, "longLongValue");
      v24 = objc_msgSend(v7, "launchTimeHysteresis");
      if (v22 + v21 <= (unint64_t)(v24 + v23))
        v25 = v24 + v23;
      else
        v25 = v22 + v21;
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v69;
        *(_WORD *)&buf[22] = 2048;
        v83 = v25 - v69;
        _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "Next Launch: %lld - Now: %lld - Time Diff: %lld seconds", buf, 0x20u);
      }
      if (_HDIsUnitTesting || v25 <= v69)
      {
        if (!objc_msgSend(v62, "isProtectedDataAvailable"))
        {
          _HKInitializeLogging();
          v51 = *MEMORY[0x1E0CB5288];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_DEFAULT, "Adding code to pending type codes", buf, 2u);
          }
          v52 = *(void **)(v71 + 64);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", v27);
          v28 = objc_claimAutoreleasedReturnValue();
          -[HDAppSubscriptionManager _updateOrCreateSubscription:value:type:](v28, v70, v64);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(void **)(v71 + 64);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
          v34 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v30, v34);
          goto LABEL_50;
        }
        v27 = v7;
        v28 = v70;
        -[HDAppSubscriptionManager _activityNameForSubscription:anchor:](v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "Scheduling subscription %@ for launch", buf, 0xCu);
        }
        v37 = v71;
        if (_HDIsUnitTesting)
        {
          -[HDAppSubscriptionManager _queue_addPendingLaunchForSubscription:anchor:](v71, v27, (uint64_t)v28);
          v37 = v71;
          v38 = *(_QWORD *)(v71 + 104);
          if (v38)
          {
            objc_msgSend(v27, "bundleIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, uint64_t))(v38 + 16))(v38, v39, 1);

            v37 = v71;
          }
        }
        objc_msgSend(*(id *)(v37 + 48), "taskWithName:forClientNamed:", v30, CFSTR("HDAppSubscriptionManager"));
        v40 = objc_claimAutoreleasedReturnValue();
        v34 = v40;
        if (v40)
        {
          v41 = -[NSObject taskExpired](v40, "taskExpired");
          Current = CFAbsoluteTimeGetCurrent();
          v43 = CFAbsoluteTimeGetCurrent();
          -[NSObject endDate](v34, "endDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "timeIntervalSinceReferenceDate");
          v46 = v45;

          v47 = Current + 1.0;
          if (v47 > v46)
            v48 = (v46 > v43) & ~v41;
          else
            v48 = 0;
          _HKInitializeLogging();
          v49 = *MEMORY[0x1E0CB5288];
          v50 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT);
          if (v48)
          {
            if (v50)
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&buf[4] = v46 - v43;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v47 - v43;
              _os_log_impl(&dword_1B7802000, v49, OS_LOG_TYPE_DEFAULT, "Not rescheduling: Job already scheduled to fire in %f vs our %f", buf, 0x16u);
            }
            goto LABEL_50;
          }
          if (v50)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B7802000, v49, OS_LOG_TYPE_DEFAULT, "Removing stale job.", buf, 2u);
          }
          objc_msgSend(*(id *)(v71 + 48), "removeTaskWithName:forClientNamed:", v30, CFSTR("HDAppSubscriptionManager"));
        }
        v54 = CFAbsoluteTimeGetCurrent();
        v55 = v54 + 1.0;
        if (v54 >= v54 + 1.0 + -60.0)
          v56 = v54;
        else
          v56 = v54 + 1.0 + -60.0;
        v57 = objc_alloc_init(HDBackgroundTask);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDBackgroundTask setStartDate:](v57, "setStartDate:", v58);

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v55);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDBackgroundTask setEndDate:](v57, "setEndDate:", v59);

        -[HDBackgroundTask setAllowsPowerOptimizedScheduling:](v57, "setAllowsPowerOptimizedScheduling:", 1);
        objc_msgSend(*(id *)(v71 + 48), "addTask:withName:forClientNamed:", v57, v30, CFSTR("HDAppSubscriptionManager"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v71 + 72), "objectForKeyedSubscript:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v71 + 80), "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v28)
        {
          if (objc_msgSend(v29, "longLongValue") <= v25)
            goto LABEL_51;
          dispatch_source_cancel(v28);
        }
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          *(_QWORD *)&buf[4] = v25 - v69;
          _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "Setting timer with interval %{public}lld", buf, 0xCu);
        }
        v32 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v71 + 56));
        v33 = dispatch_walltime(0, 0);
        dispatch_source_set_timer(v32, v33, 1000000000 * (v25 - v69), 0x1DCD6500uLL);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v83 = 0;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __112__HDAppSubscriptionManager__queue_scheduleLaunchesForAllowedSubscriptions_lastLaunchTimes_dataCode_anchor_type___block_invoke;
        handler[3] = &unk_1E6CF48C8;
        v76 = buf;
        handler[4] = v71;
        v34 = v32;
        v73 = v34;
        v27 = v27;
        v74 = v27;
        v75 = v70;
        v77 = v64;
        dispatch_source_set_event_handler(v34, handler);
        dispatch_resume(v34);
        objc_msgSend(*(id *)(v71 + 72), "setObject:forKeyedSubscript:", v34, v27);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v71 + 80), "setObject:forKeyedSubscript:", v35, v27);

        _Block_object_dispose(buf, 8);
      }
LABEL_50:

LABEL_51:
    }
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  }
  while (v68);
LABEL_53:

  WeakRetained = v60;
LABEL_54:

LABEL_55:
}

- (void)_isBackgroundAppRefreshDisabledForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (self && (HDCheckAutomaticAppUpdatesAllowed() & 1) == 0)
  {
    v7[2](v7, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__HDAppSubscriptionManager__isBackgroundAppRefreshDisabledForBundleIdentifier_completion___block_invoke;
    v9[3] = &unk_1E6CF48A0;
    v10 = v7;
    objc_msgSend(v8, "backgroundAppRefreshEnabledForApp:withHandler:", v6, v9);

  }
}

uint64_t __90__HDAppSubscriptionManager__isBackgroundAppRefreshDisabledForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_backgroundAppRefreshNotifyToken);
  self->_backgroundAppRefreshNotifyToken = 0;
  v4.receiver = self;
  v4.super_class = (Class)HDAppSubscriptionManager;
  -[HDAppSubscriptionManager dealloc](&v4, sel_dealloc);
}

void __57__HDAppSubscriptionManager__backgroundTaskFiredWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  id WeakRetained;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  __int128 buf;
  void (*v51)(uint64_t);
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = v3;
  if (v2
    && (v5 = objc_msgSend(v3, "rangeOfString:", CFSTR("com.apple.healthd.scheduled.")), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "substringFromIndex:", v5 + v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("."));
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v12 = v10;
      v13 = v11;
      objc_msgSend(v9, "substringToIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "substringFromIndex:", v12 + v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (v16 = objc_msgSend(v14, "rangeOfString:", CFSTR("|")), v16 != 0x7FFFFFFFFFFFFFFFLL))
      {
        v19 = v16;
        v20 = v17;
        objc_msgSend(v14, "substringToIndex:", v16);
        v48 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v48);
        *(_QWORD *)&buf = 0;
        v18 = 0;
        if (objc_msgSend(v21, "scanInteger:", &buf))
        {
          objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", (_QWORD)buf);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "substringFromIndex:", v19 + v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v22);

        v49 = 0;
        v7 = 0;
        if (objc_msgSend(v23, "scanInteger:", &v49))
        {
          v24 = (void *)v48;
          if ((v49 & 0x8000000000000000) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
            v7 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v24 = (void *)v48;
        }

      }
      else
      {
        v7 = 0;
        v18 = 0;
      }
      if (objc_msgSend(v15, "length"))
        v25 = v18 == 0;
      else
        v25 = 1;
      if (v25)
      {
        v8 = 0;
      }
      else
      {
        v26 = objc_msgSend(v18, "code");
        WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
        +[HDAppSubscriptionEntity subscriptionForBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "subscriptionForBundleID:dataCode:profile:error:", v15, v26, WeakRetained, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = v4;
  }

  v28 = v7;
  if (v8)
  {
    v29 = *(_QWORD *)(a1 + 32);
    v30 = v8;
    v31 = v28;
    if (v29)
    {
      objc_msgSend(v30, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_loadWeakRetained((id *)(v29 + 32));
      objc_msgSend(v33, "daemon");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "behavior");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isAppleInternalInstall");

      if (v36)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", objc_msgSend(v30, "dataCode"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@ for %@ (anchor: %@)"), v32, v38, v31);
        v39 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v39 = v32;
      }
      -[HDAppSubscriptionManager _queue_addPendingLaunchForSubscription:anchor:](v29, v30, (uint64_t)v31);
      objc_msgSend(*(id *)(v29 + 40), "requestAppLaunchWithBundleID:updateFrequency:", v32, (double)(unint64_t)objc_msgSend(v30, "updateFrequency"));
      _HKInitializeLogging();
      v40 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v39;
        _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, "Requesting Duet to launch for %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v41 = objc_msgSend(v30, "dataCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", time(0));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v32;
      v44 = v42;
      v45 = *(NSObject **)(v29 + 56);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v51 = __64__HDAppSubscriptionManager__updateBundleID_dataCode_launchTime___block_invoke;
      v52 = &unk_1E6CE78C0;
      v53 = v29;
      v46 = v43;
      v54 = v46;
      v56 = v41;
      v47 = v44;
      v55 = v47;
      dispatch_async(v45, &buf);

    }
  }

}

- (void)_queue_addPendingLaunchForSubscription:(uint64_t)a3 anchor:
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v6, v5);
    if (a3)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "dataCode"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "dataCode"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E6DFAF40);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          -[NSMutableArray incrementReference](v8);
      }
      -[NSMutableArray incrementReference](v8);
      goto LABEL_11;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E6DFAF40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, &unk_1E6DFAF40);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E6DFAF40);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", &unk_1E6DFAF40);
LABEL_11:

}

- (id)_activityNameForSubscription:(void *)a1 anchor:(void *)a2
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  v6 = a1;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "dataCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = v5;
  else
    v8 = &unk_1E6DFAF40;
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@.%@"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.healthd.scheduled."), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_removeLaunchForSubscription:(uint64_t)a1 anchor:(void *)a2
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[HDAppSubscriptionManager _activityNameForSubscription:anchor:](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Unscheduling subscription for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 48), "removeTaskWithName:forClientNamed:", v3, CFSTR("HDAppSubscriptionManager"));

}

- (id)_updateOrCreateSubscription:(void *)a1 value:(void *)a2 type:(uint64_t)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v5 = a1;
  v6 = a2;
  if (v5)
  {
    if (a3 == 1)
    {
      objc_msgSend(v5, "updateAssociationAnchor:", v6);
    }
    else if (!a3)
    {
      objc_msgSend(v5, "updateDataAnchor:", v6);
    }
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB6A90]);
    v8 = 0;
    v9 = v6;
    goto LABEL_11;
  }
  if (!a3)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB6A90]);
    v8 = v6;
    v9 = 0;
LABEL_11:
    v10 = (id)objc_msgSend(v7, "initWithDataAnchor:associationAnchor:", v8, v9);
    goto LABEL_12;
  }
LABEL_9:
  v10 = v5;
LABEL_12:
  v11 = v10;

  return v11;
}

void __112__HDAppSubscriptionManager__queue_scheduleLaunchesForAllowedSubscriptions_lastLaunchTimes_dataCode_anchor_type___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v2 = *(_QWORD *)(v1 + 24);
  if (v2 == 1)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    if (v4)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Timer fired, scheduling launches", (uint8_t *)v13, 2u);
      }
      v12 = *(NSObject **)(v4 + 56);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__HDAppSubscriptionManager__launchTimerFired_code_anchor_type___block_invoke;
      v13[3] = &unk_1E6CE7D90;
      v13[4] = v4;
      v14 = v9;
      v15 = v10;
      v17 = v7;
      v16 = v8;
      dispatch_async(v12, v13);

    }
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v2 = *(_QWORD *)(v1 + 24);
  }
  *(_QWORD *)(v1 + 24) = v2 + 1;
}

uint64_t __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HDMutableDatabaseTransactionContext *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v4 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  -[HDMutableDatabaseTransactionContext setCacheScope:](v4, "setCacheScope:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_2;
  v11[3] = &unk_1E6CE7C58;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 56);
  v11[4] = v7;
  v11[1] = 3221225472;
  v12 = v8;
  v13 = *(id *)(a1 + 48);
  v9 = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v4, a2, v11, 0);

  return v9;
}

BOOL __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  +[HDAppSubscriptionEntity allSubscriptionsForType:profile:error:](HDAppSubscriptionEntity, "allSubscriptionsForType:profile:error:", v5, WeakRetained, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!objc_msgSend(v7, "count"))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v9);

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v17 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "dataCode"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

          objc_msgSend(v16, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v19);
          }
          objc_msgSend(v16, "objectType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, v21);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v13);
    }

    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(v22 + 96);
    if (v23)
    {
      (*(void (**)(void))(v23 + 16))();
      v22 = *(_QWORD *)(a1 + 32);
    }
    v24 = objc_loadWeakRetained((id *)(v22 + 32));
    objc_msgSend(v24, "sourceManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_3;
    v31[3] = &unk_1E6CF4918;
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    v32 = v25;
    v33 = v26;
    v34 = v27;
    v35 = *(id *)(a1 + 48);
    v28 = v25;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v31);

    v7 = v30;
  }

  return v7 != 0;
}

void __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1BCCACAC4]();
  v8 = *(void **)(a1 + 32);
  v30 = 0;
  objc_msgSend(v8, "clientSourceForBundleIdentifier:error:", v5, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;
  v11 = v10;
  if (v9)
  {
    if ((objc_msgSend(v9, "_options") & 4) != 0)
    {
      v24 = v7;
      v15 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v6, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
      v29 = 0;
      +[HDAuthorizationEntity readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:", v5, v17, WeakRetained, &v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v29;

      if (v19)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_242;
        v25[3] = &unk_1E6CF48F0;
        v26 = v6;
        v27 = *(id *)(a1 + 48);
        v28 = v5;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v25);

      }
      else
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v32 = v5;
          v33 = 2114;
          v34 = v13;
          _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Failed to look up authorizations for bundle identifier \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }

      v7 = v24;
      goto LABEL_15;
    }
LABEL_3:
    v12 = *(void **)(a1 + 48);
    objc_msgSend(v6, "allValues");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);
LABEL_15:

    v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
    +[HDAppSubscriptionAppLaunchEntity launchTimeForBundleID:profile:error:](HDAppSubscriptionAppLaunchEntity, "launchTimeForBundleID:profile:error:", v5, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v23, v5);

    goto LABEL_18;
  }
  if (v10)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v5;
      v33 = 2114;
      v34 = v11;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to look up source with bundle identifier \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
      goto LABEL_3;
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v5;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_INFO, "Source for bundle identifier \"%{public}@\" not found", buf, 0xCu);
    }
  }
LABEL_18:

  objc_autoreleasePoolPop(v7);
}

void __93__HDAppSubscriptionManager__updateObservationStatusForDataTypeCode_lastAppLaunchTimes_error___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v6, "canRead"))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }
    else
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v10 = v8;
        objc_msgSend(v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring subscription for %{public}@ to %@ because app does not have authorization to read", (uint8_t *)&v12, 0x16u);

      }
    }
  }

}

void __63__HDAppSubscriptionManager__launchTimerFired_code_anchor_type___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  if (v2)
    -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](*(_QWORD *)(a1 + 32), objc_msgSend(v2, "integerValue"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
}

void __75__HDAppSubscriptionManager__queue_ackForBundleID_dataTypes_anchor_ackTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "unsignedIntegerValue"))
    {
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, v10);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (!-[NSMutableArray currentReferenceCount](v6))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v12);

    }
  }

}

void __64__HDAppSubscriptionManager__updateBundleID_dataCode_launchTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 56);
    v3 = *(void **)(a1 + 40);
    v4 = (id *)(v1 + 32);
    v5 = *(id *)(a1 + 48);
    v6 = v3;
    WeakRetained = objc_loadWeakRetained(v4);
    +[HDAppSubscriptionAppLaunchEntity setLaunchTime:forBundleID:profile:error:](HDAppSubscriptionAppLaunchEntity, "setLaunchTime:forBundleID:profile:error:", v5, v6, WeakRetained, 0);

    v8 = objc_loadWeakRetained(v4);
    +[HDAppSubscriptionEntity subscriptionForBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "subscriptionForBundleID:dataCode:profile:error:", v6, v2, v8, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v16, "launchTimeHysteresis");
    if (2 * v9 >= 1209600)
      v10 = 1209600;
    else
      v10 = 2 * v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, 0);
    v15 = objc_loadWeakRetained(v4);
    +[HDAppSubscriptionEntity setLaunchTimeHysteresis:forBundleID:dataTypes:profile:error:](HDAppSubscriptionEntity, "setLaunchTimeHysteresis:forBundleID:dataTypes:profile:error:", v11, v6, v14, v15, 0);

  }
}

void __69__HDAppSubscriptionManager_database_protectedDataDidBecomeAvailable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v10 = a3;
  v5 = a2;
  objc_msgSend(v10, "dataAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v10, "dataAnchor");
  else
    objc_msgSend(v10, "associationAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dataAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](*(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"), v7, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", v5);

}

- (void)removeSubscriptionForBundleID:(id)a3 dataCode:(int64_t)a4
{
  id v6;
  NSObject *launchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  launchQueue = self->_launchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HDAppSubscriptionManager_removeSubscriptionForBundleID_dataCode___block_invoke;
  block[3] = &unk_1E6CE9C58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(launchQueue, block);

}

void __67__HDAppSubscriptionManager_removeSubscriptionForBundleID_dataCode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity subscriptionForBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "subscriptionForBundleID:dataCode:profile:error:", v3, v2, WeakRetained, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[HDAppSubscriptionManager _removeLaunchForSubscription:anchor:](v1, v6);
    v5 = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity removeSubscriptionsWithBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "removeSubscriptionsWithBundleID:dataCode:profile:error:", v3, v2, v5, 0);

  }
}

- (void)removeBundleID:(id)a3
{
  id v4;
  NSObject *launchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  launchQueue = self->_launchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HDAppSubscriptionManager_removeBundleID___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(launchQueue, v7);

}

void __43__HDAppSubscriptionManager_removeBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    v3 = (id *)(v1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity allSubscriptionsForBundleID:profile:error:](HDAppSubscriptionEntity, "allSubscriptionsForBundleID:profile:error:", v2, WeakRetained, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[HDAppSubscriptionManager _removeLaunchForSubscription:anchor:](v1, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    v11 = objc_loadWeakRetained(v3);
    +[HDAppSubscriptionEntity removeSubscriptionsWithBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "removeSubscriptionsWithBundleID:dataCode:profile:error:", v2, -1, v11, 0, (_QWORD)v13);

    v12 = objc_loadWeakRetained(v3);
    +[HDAppSubscriptionAppLaunchEntity removeBundleIdentifier:profile:error:](HDAppSubscriptionAppLaunchEntity, "removeBundleIdentifier:profile:error:", v2, v12, 0);

  }
}

- (void)subscribeForBundleID:(id)a3 dataCode:(int64_t)a4 frequencyInSeconds:(unint64_t)a5 appSDKVersionToken:(unint64_t)a6
{
  id v10;
  NSObject *launchQueue;
  id v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;

  v10 = a3;
  launchQueue = self->_launchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__HDAppSubscriptionManager_subscribeForBundleID_dataCode_frequencyInSeconds_appSDKVersionToken___block_invoke;
  block[3] = &unk_1E6CF4990;
  block[4] = self;
  v14 = v10;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v12 = v10;
  dispatch_async(launchQueue, block);

}

void __96__HDAppSubscriptionManager_subscribeForBundleID_dataCode_frequencyInSeconds_appSDKVersionToken___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  if (v1)
  {
    if ((HDBackgroundObservationSupportedForDataTypeCode(v2) & 1) != 0)
    {
      v6 = *(void **)(v1 + 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v8 = *(_QWORD *)(v1 + 96);
      if (v8)
        (*(void (**)(void))(v8 + 16))();
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
      +[HDAppSubscriptionEntity subscriptionForBundleID:dataCode:profile:error:](HDAppSubscriptionEntity, "subscriptionForBundleID:dataCode:profile:error:", v5, v2, WeakRetained, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && objc_msgSend(v10, "updateFrequency") == v3)
      {
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v20 = (uint64_t)v5;
          v21 = 2048;
          v22 = v2;
          v23 = 2048;
          v24 = v3;
          _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Ignoring app subscription request since %@ is already subscribed for %ld at freq %llu", buf, 0x20u);
        }
      }
      else
      {
        v13 = objc_loadWeakRetained((id *)(v1 + 32));
        +[HDAppSubscriptionEntity addSubscriptionWithBundleID:dataCode:updateFrequency:profile:error:](HDAppSubscriptionEntity, "addSubscriptionWithBundleID:dataCode:updateFrequency:profile:error:", v5, v2, v3, v13, 0);

        v14 = objc_loadWeakRetained((id *)(v1 + 32));
        +[HDAppSubscriptionAppLaunchEntity insertOrUpdateAppSDKVersionToken:forBundleID:profile:error:](HDAppSubscriptionAppLaunchEntity, "insertOrUpdateAppSDKVersionToken:forBundleID:profile:error:", v4, v5, v14, 0);

        v15 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, 0);
        v18 = objc_loadWeakRetained((id *)(v1 + 32));
        +[HDAppSubscriptionEntity setLaunchTimeHysteresis:forBundleID:dataTypes:profile:error:](HDAppSubscriptionEntity, "setLaunchTimeHysteresis:forBundleID:dataTypes:profile:error:", &unk_1E6DFAF58, v5, v17, v18, 0);

        -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](v1, v2, 0, 0);
      }

    }
    else
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v2;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Ignoring app subscription for unsupported type %ld", buf, 0xCu);
      }
    }
  }

}

- (void)setAnchor:(id)a3 forDataCode:(int64_t)a4 type:(int64_t)a5
{
  id v8;
  NSObject *launchQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a3;
  launchQueue = self->_launchQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HDAppSubscriptionManager_setAnchor_forDataCode_type___block_invoke;
  v11[3] = &unk_1E6CECEA0;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(launchQueue, v11);

}

void __55__HDAppSubscriptionManager_setAnchor_forDataCode_type___block_invoke(uint64_t a1)
{
  -[HDAppSubscriptionManager _queue_scheduleLaunches:anchor:type:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56));
}

- (void)ackForBundleID:(id)a3 dataTypes:(id)a4 anchor:(id)a5 ackTime:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *launchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  launchQueue = self->_launchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HDAppSubscriptionManager_ackForBundleID_dataTypes_anchor_ackTime___block_invoke;
  block[3] = &unk_1E6CF49B8;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(launchQueue, block);

}

void __68__HDAppSubscriptionManager_ackForBundleID_dataTypes_anchor_ackTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t v43[4];
  id v44;
  _BYTE buf[24];
  void *v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  if (v1)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v46 = v7;
      LOWORD(v47) = 2112;
      *(_QWORD *)((char *)&v47 + 2) = v8;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "Acking '%@' with '%@' to anchor %@ and ackTime %@.", buf, 0x2Au);
    }
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity setLastAnchor:lastAckTime:forBundleID:dataTypes:profile:error:](HDAppSubscriptionEntity, "setLastAnchor:lastAckTime:forBundleID:dataTypes:profile:error:", v7, v8, v5, v6, WeakRetained, 0);

    v11 = objc_loadWeakRetained((id *)(v1 + 32));
    +[HDAppSubscriptionEntity setLaunchTimeHysteresis:forBundleID:dataTypes:profile:error:](HDAppSubscriptionEntity, "setLaunchTimeHysteresis:forBundleID:dataTypes:profile:error:", &unk_1E6DFAF58, v5, v6, v11, 0);

    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(v1 + 16);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Outstanding launches: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(v1 + 16), "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __75__HDAppSubscriptionManager__queue_ackForBundleID_dataTypes_anchor_ackTime___block_invoke;
      v46 = &unk_1E6CF4940;
      v16 = v14;
      *(_QWORD *)&v47 = v16;
      *((_QWORD *)&v47 + 1) = &v39;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", buf);
      if (!*((_BYTE *)v40 + 24) || !objc_msgSend(v6, "count"))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E6DFAF40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          if (objc_msgSend(v17, "count"))
            objc_msgSend(v18, "removeObjectAtIndex:", 0);
          if (!objc_msgSend(v18, "count"))
            objc_msgSend(v16, "removeObjectForKey:", &unk_1E6DFAF40);
        }

      }
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v43 = 138543362;
        v44 = v16;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "Launch anchors after ack %{public}@", v43, 0xCu);
      }
      if (!objc_msgSend(v16, "count"))
      {
        objc_msgSend(*(id *)(v1 + 16), "removeObjectForKey:", v5);
        objc_msgSend(*(id *)(v1 + 40), "requestAssertionInvalidationForBundleID:", v5);
        v20 = objc_loadWeakRetained((id *)(v1 + 32));
        objc_msgSend(v20, "daemon");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "behavior");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isAppleInternalInstall");

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0C99EA0];
          v25 = v5;
          objc_msgSend(v24, "standardUserDefaults");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", CFSTR("HDBackgroundLaunchInvalidationStringsKey"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = (void *)MEMORY[0x1E0C99D68];
          v28 = v25;
          objc_msgSend(v27, "date");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("[%@]: %@"), v29, v28);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v37, "stringByAppendingFormat:", CFSTR("\n%@"), v36);
            v30 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("\n"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v31, "count") <= 0xA)
            {
              v33 = v30;
            }
            else
            {
              v32 = (void *)objc_msgSend(v31, "mutableCopy");
              objc_msgSend(v32, "removeLastObject");
              objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
              v33 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else
          {
            v33 = v36;
          }
          objc_msgSend(v38, "setObject:forKey:", v33, CFSTR("HDBackgroundLaunchInvalidationStringsKey"));

        }
        v34 = *(_QWORD *)(v1 + 104);
        if (v34)
          (*(void (**)(uint64_t, id, _QWORD))(v34 + 16))(v34, v5, 0);
        _HKInitializeLogging();
        v35 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v43 = 138543362;
          v44 = v5;
          _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "Requesting Duet to invalidate launch for %{public}@", v43, 0xCu);
        }
      }

      _Block_object_dispose(&v39, 8);
    }

  }
}

- (BOOL)unitTesting_isObservingDataTypeCode:(int64_t)a3
{
  NSMutableSet *observedDataTypeCodes;
  void *v4;

  observedDataTypeCodes = self->_observedDataTypeCodes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(observedDataTypeCodes) = -[NSMutableSet containsObject:](observedDataTypeCodes, "containsObject:", v4);

  return (char)observedDataTypeCodes;
}

- (BOOL)unitTesting_isAwaitingLaunchForBundleID:(id)a3 dataTypeCode:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingLaunchesByBundleIdentifier, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", &unk_1E6DFAF40);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSMutableArray currentReferenceCount](v7) != 0;
  }

  return v8;
}

- (void)unitTesting_synchronizeWithQueue
{
  dispatch_sync((dispatch_queue_t)self->_launchQueue, &__block_literal_global_73);
}

- (id)unitTesting_backgroundAppRefreshStatusGenerator
{
  return self->_unitTesting_backgroundAppRefreshStatusGenerator;
}

- (void)setUnitTesting_backgroundAppRefreshStatusGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)unitTesting_didUpdateObservingDataTypeCode
{
  return self->_unitTesting_didUpdateObservingDataTypeCode;
}

- (void)setUnitTesting_didUpdateObservingDataTypeCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)unitTesting_launchEventHandler
{
  return self->_unitTesting_launchEventHandler;
}

- (void)setUnitTesting_launchEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_launchEventHandler, 0);
  objc_storeStrong(&self->_unitTesting_didUpdateObservingDataTypeCode, 0);
  objc_storeStrong(&self->_unitTesting_backgroundAppRefreshStatusGenerator, 0);
  objc_storeStrong((id *)&self->_launchTimerLaunchTimes, 0);
  objc_storeStrong((id *)&self->_launchTimers, 0);
  objc_storeStrong((id *)&self->_pendingTypeCodesToAnchors, 0);
  objc_storeStrong((id *)&self->_launchQueue, 0);
  objc_storeStrong((id *)&self->_backgroundTaskScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundAppLauncher, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_outstandingLaunchesByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observedDataTypeCodes, 0);
}

@end
