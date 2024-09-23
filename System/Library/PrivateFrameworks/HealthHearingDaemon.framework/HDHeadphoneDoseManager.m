@implementation HDHeadphoneDoseManager

- (HDHeadphoneDoseManager)initWithProfile:(id)a3
{
  id v4;
  HDHeadphoneDoseMetadataStore *v5;
  HDHeadphoneAudioExposureStatisticsCalculator *v6;
  HDHeadphoneDoseManager *v7;

  v4 = a3;
  v5 = -[HDHeadphoneDoseMetadataStore initWithProfile:]([HDHeadphoneDoseMetadataStore alloc], "initWithProfile:", v4);
  v6 = -[HDHeadphoneAudioExposureStatisticsCalculator initWithProfile:keyValueStore:]([HDHeadphoneAudioExposureStatisticsCalculator alloc], "initWithProfile:keyValueStore:", v4, v5);
  v7 = -[HDHeadphoneDoseManager _initWithProfile:keyValueStore:calculator:](self, "_initWithProfile:keyValueStore:calculator:", v4, v5, v6);

  return v7;
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5
{
  return -[HDHeadphoneDoseManager _initWithProfile:keyValueStore:calculator:unitTesting_didUpdateHandler:](self, "_initWithProfile:keyValueStore:calculator:unitTesting_didUpdateHandler:", a3, a4, a5, 0);
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5 unitTesting_didUpdateHandler:(id)a6
{
  return -[HDHeadphoneDoseManager _initWithProfile:keyValueStore:calculator:unitTesting_profileDidBecomeReadyHandler:unitTesting_didObserveProtectedDataHandler:unitTesting_didUpdateHandler:](self, "_initWithProfile:keyValueStore:calculator:unitTesting_profileDidBecomeReadyHandler:unitTesting_didObserveProtectedDataHandler:unitTesting_didUpdateHandler:", a3, a4, a5, 0, 0, a6);
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 calculator:(id)a5 unitTesting_profileDidBecomeReadyHandler:(id)a6 unitTesting_didObserveProtectedDataHandler:(id)a7 unitTesting_didUpdateHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  HDHeadphoneDoseManager *v21;
  HDHeadphoneDoseManager *v22;
  uint64_t v23;
  OS_dispatch_queue *queue;
  HDHeadphoneExposureNotificationSyncManager *v25;
  HDHeadphoneExposureNotificationSyncManager *notificationSyncManager;
  HDHeadphoneExposureNotificationCenter *v27;
  HDHeadphoneExposureNotificationCenter *notificationCenter;
  HDDataCollectionAssertion *collectionAssertion;
  uint64_t v30;
  id unitTesting_profileDidBecomeReadyHandler;
  uint64_t v32;
  id unitTesting_didObserveProtectedDataHandler;
  uint64_t v34;
  id unitTesting_didUpdateHandler;
  NSDate *lastLockDateForAnalytics;
  id WeakRetained;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  HDHeadphoneDoseManager *v46;
  void *v48;
  id obj;
  id v51;
  objc_super v52;

  v14 = a3;
  v15 = a4;
  obj = a5;
  v51 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v14, "profileIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_profileIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v19, "isEqual:", v20);

  if ((a7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseManager.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[profile.profileIdentifier isEqual:keyValueStore._profileIdentifier]"));

  }
  v52.receiver = self;
  v52.super_class = (Class)HDHeadphoneDoseManager;
  v21 = -[HDHeadphoneDoseManager init](&v52, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_profile, v14);
    v22->_dose = -1.0;
    v22->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v23;

    v22->_enabled = objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled");
    objc_storeStrong((id *)&v22->_keyValueStore, a4);
    v25 = -[HDHeadphoneExposureNotificationSyncManager initWithProfile:]([HDHeadphoneExposureNotificationSyncManager alloc], "initWithProfile:", v14);
    notificationSyncManager = v22->_notificationSyncManager;
    v22->_notificationSyncManager = v25;

    v27 = -[HDHeadphoneExposureNotificationCenter initWithProfile:syncManager:]([HDHeadphoneExposureNotificationCenter alloc], "initWithProfile:syncManager:", v14, v22->_notificationSyncManager);
    notificationCenter = v22->_notificationCenter;
    v22->_notificationCenter = v27;

    objc_storeStrong((id *)&v22->_statisticsCalculator, obj);
    collectionAssertion = v22->_collectionAssertion;
    v22->_collectionAssertion = 0;

    v30 = MEMORY[0x22073925C](v16);
    unitTesting_profileDidBecomeReadyHandler = v22->_unitTesting_profileDidBecomeReadyHandler;
    v22->_unitTesting_profileDidBecomeReadyHandler = (id)v30;

    v32 = MEMORY[0x22073925C](v17);
    unitTesting_didObserveProtectedDataHandler = v22->_unitTesting_didObserveProtectedDataHandler;
    v22->_unitTesting_didObserveProtectedDataHandler = (id)v32;

    v34 = MEMORY[0x22073925C](v18);
    unitTesting_didUpdateHandler = v22->_unitTesting_didUpdateHandler;
    v22->_unitTesting_didUpdateHandler = (id)v34;

    lastLockDateForAnalytics = v22->_lastLockDateForAnalytics;
    v22->_lastLockDateForAnalytics = 0;

    -[HDHeadphoneDoseManager _registerForSignificantTimeChangeNotification](v22, "_registerForSignificantTimeChangeNotification");
    WeakRetained = objc_loadWeakRetained((id *)&v22->_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    HKHeadphoneAudioExposureEventType();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:forDataType:", v22, v39);

    v40 = objc_loadWeakRetained((id *)&v22->_profile);
    objc_msgSend(v40, "dataManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "quantitySeriesManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HKHeadphoneAudioExposureType();
    v43 = v16;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:forType:queue:", v22, v44, v22->_queue);

    v16 = v43;
    v45 = objc_loadWeakRetained((id *)&v22->_profile);
    objc_msgSend(v45, "registerProfileReadyObserver:queue:", v22, v22->_queue);

    -[HDHeadphoneExposureNotificationSyncManager addObserver:queue:](v22->_notificationSyncManager, "addObserver:queue:", v22, v22->_queue);
    v46 = v22;
  }

  return v22;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[HDHeadphoneDoseManager _unregisterForSignificantTimeChangeNotification](self, "_unregisterForSignificantTimeChangeNotification");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProtectedDataObserver:", self);

  v5 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v5, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKHeadphoneAudioExposureEventType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forDataType:", self, v7);

  v8 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v8, "dataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantitySeriesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKHeadphoneAudioExposureType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forType:", self, v11);

  -[HDHeadphoneExposureNotificationSyncManager removeObserver:](self->_notificationSyncManager, "removeObserver:", self);
  -[HDDataCollectionAssertion invalidate](self->_collectionAssertion, "invalidate");
  v12.receiver = self;
  v12.super_class = (Class)HDHeadphoneDoseManager;
  -[HDHeadphoneDoseManager dealloc](&v12, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  OS_dispatch_queue *queue;
  void (**unitTesting_profileDidBecomeReadyHandler)(id, HDHeadphoneDoseManager *);
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21A0AA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Profile ready; Dispatch setup to maintenance queue.",
      buf,
      0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__HDHeadphoneDoseManager_profileDidBecomeReady___block_invoke;
  v11[3] = &unk_24DC5F008;
  v11[4] = self;
  objc_msgSend(v8, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v11);

  unitTesting_profileDidBecomeReadyHandler = (void (**)(id, HDHeadphoneDoseManager *))self->_unitTesting_profileDidBecomeReadyHandler;
  if (unitTesting_profileDidBecomeReadyHandler)
    unitTesting_profileDidBecomeReadyHandler[2](unitTesting_profileDidBecomeReadyHandler, self);
}

void __48__HDHeadphoneDoseManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(a1 + 32), "_takeAccessibilityAssertion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__headphoneExposureNotificationsEnabledDidChange_, *MEMORY[0x24BE45680], 0);

  objc_msgSend(MEMORY[0x24BE456A0], "startObservingForChanges");
  objc_msgSend(*(id *)(a1 + 32), "_lock_updateIsEnabledForInitialSetup:assertion:", 1, v6);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProtectedDataObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v6, "invalidate");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL8 v4;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  _BOOL4 v13;
  id v14;
  NSDate *v15;
  NSDate *lastLockDateForAnalytics;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  BOOL v21;
  id v22;
  int v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  os_log_t v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  NSDate *v32;
  void (**unitTesting_protectedDataDidBecomeAvailable)(id, _BOOL8);
  HDHeadphoneDoseMetadataStore *v34;
  id v35;
  int v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD3000];
  v7 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_opt_class();
    HKStringFromBool();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v9;
    v43 = 2114;
    v44 = v10;
    _os_log_impl(&dword_21A0AA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Protected data available: %{public}@.", buf, 0x16u);

  }
  if (!v4)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastLockDateForAnalytics = self->_lastLockDateForAnalytics;
    self->_lastLockDateForAnalytics = v15;

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_29;
  }
  -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v12 = -[HDHeadphoneAudioExposureStatisticsCalculator needsRebuild](self->_statisticsCalculator, "needsRebuild");
  LOBYTE(v13) = v12;
  if (self->_enabled)
  {
    if (v12)
    {
      v14 = 0;
      goto LABEL_20;
    }
    keyValueStore = self->_keyValueStore;
    v40 = 0;
    v21 = -[HDHeadphoneDoseMetadataStore _shouldRebuildPreviousSevenDayNotificationWithError:](keyValueStore, "_shouldRebuildPreviousSevenDayNotificationWithError:", &v40);
    v22 = v40;
    v14 = v22;
    if (v22)
    {
      v23 = objc_msgSend(v22, "hk_isHealthStoreUnavailableError");
      _HKInitializeLogging();
      v24 = *v6;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.5();
          if (v21)
            goto LABEL_20;
LABEL_33:

          v34 = self->_keyValueStore;
          v39 = 0;
          v13 = -[HDHeadphoneDoseMetadataStore _shouldRebuildSevenDayStatisticsWithError:](v34, "_shouldRebuildSevenDayStatisticsWithError:", &v39);
          v35 = v39;
          v14 = v35;
          if (v35)
          {
            v36 = objc_msgSend(v35, "hk_isHealthStoreUnavailableError");
            _HKInitializeLogging();
            v37 = *v6;
            if (v36)
            {
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.3();
            }
            else if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.4();
            }
            goto LABEL_11;
          }
          if (!v13)
            goto LABEL_28;
LABEL_20:
          v25 = v14;
          v38 = v14;
          v26 = -[HDHeadphoneDoseManager _lock_rebuildWithAssertion:error:](self, "_lock_rebuildWithAssertion:error:", v11, &v38);
          v14 = v38;

          if (v26)
          {
            _HKInitializeLogging();
            v27 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
            {
              v28 = v27;
              v29 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v42 = v29;
              _os_log_impl(&dword_21A0AA000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt 7-Day HAEN dose after device unlock.", buf, 0xCu);

            }
          }
          else
          {
            v30 = objc_msgSend(v14, "hearing_isExpectedError");
            _HKInitializeLogging();
            v31 = *v6;
            if (v30)
            {
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.1();
            }
            else if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.2();
            }
          }
          goto LABEL_28;
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        -[HDHeadphoneDoseManager database:protectedDataDidBecomeAvailable:].cold.6();
        if (v21)
          goto LABEL_20;
        goto LABEL_33;
      }
    }
    if (v21)
      goto LABEL_20;
    goto LABEL_33;
  }
  _HKInitializeLogging();
  v17 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v42 = v19;
    _os_log_impl(&dword_21A0AA000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring protected data availability since HAEN is disabled.", buf, 0xCu);

  }
  v14 = 0;
LABEL_11:
  if (v13)
    goto LABEL_20;
LABEL_28:
  objc_msgSend(v11, "invalidate");
  v32 = self->_lastLockDateForAnalytics;
  self->_lastLockDateForAnalytics = 0;

  os_unfair_lock_unlock(&self->_lock);
LABEL_29:
  unitTesting_protectedDataDidBecomeAvailable = (void (**)(id, _BOOL8))self->_unitTesting_protectedDataDidBecomeAvailable;
  if (unitTesting_protectedDataDidBecomeAvailable)
    unitTesting_protectedDataDidBecomeAvailable[2](unitTesting_protectedDataDidBecomeAvailable, v4);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v13 = objc_opt_class();
    v14 = 2048;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21A0AA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing %lu added HAEN samples.", buf, 0x16u);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__HDHeadphoneDoseManager_samplesAdded_anchor___block_invoke;
  v10[3] = &unk_24DC5F030;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(queue, v10);

}

void __46__HDHeadphoneDoseManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_takeAccessibilityAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_updateWithNotifications:journaled:assertion:", *(_QWORD *)(a1 + 40), 0, v2);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reportSyncedHeadphoneNotificationSamples:journaled:nowDate:", v4, 0, v5);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v2, "invalidate");
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = objc_opt_class();
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    v10 = 138543618;
    v11 = v8;
    v12 = 2048;
    v13 = v9;
    _os_log_impl(&dword_21A0AA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processed added %lu HAEN samples.", (uint8_t *)&v10, 0x16u);

  }
}

- (void)samplesJournaled:(id)a3 type:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v13 = objc_opt_class();
    v14 = 2048;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21A0AA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing %lu journaled HAEN samples.", buf, 0x16u);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__HDHeadphoneDoseManager_samplesJournaled_type___block_invoke;
  v10[3] = &unk_24DC5F030;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(queue, v10);

}

void __48__HDHeadphoneDoseManager_samplesJournaled_type___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_updateWithNotifications:journaled:assertion:", *(_QWORD *)(a1 + 40), 1, 0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reportSyncedHeadphoneNotificationSamples:journaled:nowDate:", v3, 1, v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_opt_class();
    v8 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 138543618;
    v10 = v7;
    v11 = 2048;
    v12 = v8;
    _os_log_impl(&dword_21A0AA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processed %lu journaled HAEN samples.", (uint8_t *)&v9, 0x16u);

  }
}

- (void)_reportSyncedHeadphoneNotificationSamples:(id)a3 journaled:(BOOL)a4 nowDate:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v18 = a5;
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "profileType");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v14, "hk_isHearingSevenDayDoseNotification"))
            {
              objc_msgSend(v14, "sourceRevision");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "source");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "_isLocalDevice");

              if ((v17 & 1) == 0)
              {
                v19 = v18;
                AnalyticsSendEventLazy();

              }
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

  }
}

id __86__HDHeadphoneDoseManager__reportSyncedHeadphoneNotificationSamples_journaled_nowDate___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v3 - v5;

  v12[0] = CFSTR("notificationSyncDelta");
  +[HDAudioAnalyticsUtilities boundedIntegerForSyncDelayDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForSyncDelayDuration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("journaled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = CFSTR("primaryProfile");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v13 = objc_opt_class();
    _os_log_impl(&dword_21A0AA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] HAEN samples were removed, requesting rebuild.", buf, 0xCu);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke;
  v10[3] = &unk_24DC5F030;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(queue, v10);

}

void __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v2;
  void *v3;
  os_unfair_lock_s *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_takeAccessibilityAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(*v2 + 6);
  v4 = *v2;
  if (LOBYTE((*v2)[10]._os_unfair_lock_opaque))
  {
    v18 = 0;
    v5 = -[os_unfair_lock_s _lock_rebuildWithAssertion:resetSyncNotification:error:](v4, "_lock_rebuildWithAssertion:resetSyncNotification:error:", v3, 1, &v18);
    v6 = v18;
    v7 = v6;
    if (v5)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v20 = v10;
        _os_log_impl(&dword_21A0AA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt 7-Day HAEN dose after discarding HAENs.", buf, 0xCu);

      }
    }
    else
    {
      v15 = objc_msgSend(v6, "hearing_isExpectedError");
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x24BDD3000];
      v17 = *MEMORY[0x24BDD3000];
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_1((uint64_t)v2, v16);
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_2((uint64_t)v2, v16);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      v14 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2048;
      v22 = v14;
      _os_log_impl(&dword_21A0AA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring %lu removed sampleTypes since HAEN is disabled.", buf, 0x16u);

    }
    v7 = 0;
  }
  os_unfair_lock_unlock(*v2 + 6);
  objc_msgSend(v3, "invalidate");

}

- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4
{
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  os_log_t v12;
  NSObject *v13;
  uint64_t v14;
  os_log_t v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x24BDD3000];
  v6 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v21 = objc_opt_class();
    _os_log_impl(&dword_21A0AA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] HAE samples were removed, requesting rebuild.", buf, 0xCu);

  }
  -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (self->_enabled)
  {
    v19 = 0;
    v9 = -[HDHeadphoneDoseManager _lock_rebuildWithAssertion:error:](self, "_lock_rebuildWithAssertion:error:", v8, &v19);
    v10 = v19;
    v11 = v10;
    if (v9)
    {
      _HKInitializeLogging();
      v12 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v21 = v14;
        _os_log_impl(&dword_21A0AA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt 7-Day HAEN dose after discarding HAE Series.", buf, 0xCu);

      }
    }
    else
    {
      v17 = -[NSObject hearing_isExpectedError](v10, "hearing_isExpectedError");
      _HKInitializeLogging();
      v18 = *v5;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[HDHeadphoneDoseManager profile:didDiscardSeriesOfType:].cold.1();
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        -[HDHeadphoneDoseManager profile:didDiscardSeriesOfType:].cold.2();
      }
    }
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v15;
    v16 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v21 = v16;
    _os_log_impl(&dword_21A0AA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring removed HAE Series since HAEN is disabled.", buf, 0xCu);
LABEL_14:

  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v8, "invalidate");

}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 enabled;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _BYTE *v25;
  int64_t v26;
  BOOL v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (os_unfair_lock_trylock(&self->_lock))
  {
    enabled = self->_enabled;
    os_unfair_lock_unlock(&self->_lock);
    if (enabled)
    {
LABEL_3:
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = objc_opt_class();
        v13 = CFSTR("added");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        if (v6)
          v13 = CFSTR("journaled");
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a5;
        *(_WORD *)&buf[22] = 2114;
        v29 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_impl(&dword_21A0AA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted %ld %{public}@ samples", buf, 0x20u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v29 = __Block_byref_object_copy_;
      v30 = __Block_byref_object_dispose_;
      v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a5);
      if (v6)
      {
        v14 = 0;
      }
      else
      {
        -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __87__HDHeadphoneDoseManager_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
      v23[3] = &unk_24DC5F080;
      v25 = buf;
      v26 = a5;
      v27 = v6;
      v23[4] = self;
      v24 = v14;
      v21 = v14;
      v20 = (void *)MEMORY[0x22073925C](v23);

      _Block_object_dispose(buf, 8);
      goto LABEL_17;
    }
  }
  else if ((objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled") & 1) != 0)
  {
    goto LABEL_3;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_opt_class();
    v18 = CFSTR("added");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v17;
    if (v6)
      v18 = CFSTR("journaled");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2114;
    v29 = (uint64_t (*)(uint64_t, uint64_t))v18;
    v19 = v17;
    _os_log_impl(&dword_21A0AA000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring %lu %{public}@ HAE sample(s) since HAEN Feature is disabled", buf, 0x20u);

  }
  v20 = 0;
LABEL_17:

  return v20;
}

void __87__HDHeadphoneDoseManager_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_log_t *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  id v33;
  os_log_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void **v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  int v54;
  const __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  uint64_t v63;
  int v64;
  id v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  const __CFString *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  __CFString *v96;
  __int16 v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v15, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceNow");
  v20 = v19;

  if (v20 >= -(608400.0 + 3600.0))
  {
    v21 = (void *)MEMORY[0x24BDD3E68];
    objc_msgSend(v15, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endDate");
    v86 = v17;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v14, v13, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v86;
    objc_msgSend(v16, "sourceRevision");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_setSourceRevision:", v26);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v25);
  }
  if (a7)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    {
LABEL_35:
      objc_msgSend(*(id *)(a1 + 40), "invalidate");
      goto LABEL_36;
    }
    _HKInitializeLogging();
    v27 = (os_log_t *)MEMORY[0x24BDD3000];
    v28 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = (void *)objc_opt_class();
      v31 = *(const __CFString **)(a1 + 56);
      v32 = CFSTR("journaled");
      if (!*(_BYTE *)(a1 + 64))
        v32 = CFSTR("added");
      *(_DWORD *)buf = 138543874;
      v92 = (uint64_t)v30;
      v93 = 2048;
      v94 = v31;
      v95 = 2114;
      v96 = (__CFString *)v32;
      v33 = v30;
      _os_log_impl(&dword_21A0AA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applying %ld %{public}@ samples", buf, 0x20u);

    }
    _HKInitializeLogging();
    v34 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = (void *)objc_opt_class();
      v37 = (uint64_t)v36;
      v38 = v15;
      v39 = v16;
      v40 = v14;
      v41 = v13;
      v42 = v17;
      if (*(_BYTE *)(a1 + 64))
        v43 = CFSTR("journaled");
      else
        v43 = CFSTR("added");
      v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v87 = v36;
      v45 = v44;
      v27 = (os_log_t *)MEMORY[0x24BDD3000];
      v46 = objc_msgSend(v45, "count");
      *(_DWORD *)buf = 138543874;
      v92 = v37;
      v93 = 2114;
      v94 = v43;
      v17 = v42;
      v13 = v41;
      v14 = v40;
      v16 = v39;
      v15 = v38;
      v95 = 2048;
      v96 = (__CFString *)v46;
      _os_log_impl(&dword_21A0AA000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Total Accumulated %{public}@ samples: %ld", buf, 0x20u);

    }
    v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (*(_BYTE *)(a1 + 64))
      +[HDHeadphoneExposureSampleBatch batchWithJournaledSamples:](HDHeadphoneExposureSampleBatch, "batchWithJournaledSamples:", v47);
    else
      +[HDHeadphoneExposureSampleBatch batchWithAddedSamples:anchor:](HDHeadphoneExposureSampleBatch, "batchWithAddedSamples:anchor:", v47, v17);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v17;
    _HKInitializeLogging();
    v49 = (void **)v27;
    v50 = *v27;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      v52 = (void *)objc_opt_class();
      v53 = v52;
      v54 = objc_msgSend(v48, "canTriggerUserNotification");
      v55 = CFSTR("NO");
      if (v54)
        v55 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v92 = (uint64_t)v52;
      v93 = 2112;
      v94 = v55;
      _os_log_impl(&dword_21A0AA000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Is Batch Eligible For Notifications: %@", buf, 0x16u);

    }
    v56 = CFSTR("journaled");
    if (!*(_BYTE *)(a1 + 64))
      v56 = CFSTR("added");
    v57 = v56;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
    v58 = *(_QWORD *)(a1 + 40);
    v59 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v90 = 0;
    objc_msgSend(v59, "updateWithExposure:assertion:error:", v48, v58, &v90);
    v60 = objc_claimAutoreleasedReturnValue();
    v84 = v90;
    v85 = (void *)v60;
    if (v60)
    {
      v83 = v48;
      v61 = v57;
      v62 = *(void **)(a1 + 32);
      v63 = *(_QWORD *)(a1 + 40);
      v89 = 0;
      v64 = objc_msgSend(v62, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v60, v63, &v89);
      v65 = v89;
      _HKInitializeLogging();
      v66 = *v49;
      v67 = *v49;
      if (v64)
      {
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = v66;
          v69 = objc_opt_class();
          v70 = *(const __CFString **)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          v92 = v69;
          v93 = 2048;
          v94 = v70;
          v95 = 2114;
          v96 = v61;
          _os_log_impl(&dword_21A0AA000, v68, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applied %ld %{public}@ samples to dose", buf, 0x20u);

        }
      }
      else if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v78 = v66;
        v79 = objc_opt_class();
        v80 = *(const __CFString **)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        v92 = v79;
        v93 = 2048;
        v94 = v80;
        v95 = 2114;
        v96 = v61;
        v97 = 2112;
        v77 = v84;
        v98 = v84;
        _os_log_error_impl(&dword_21A0AA000, v78, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to apply %ld %{public}@ samples to dose: %@", buf, 0x2Au);

        v57 = v61;
        v48 = v83;
        goto LABEL_34;
      }
      v57 = v61;
      v48 = v83;
      v77 = v84;
LABEL_34:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));

      v17 = v88;
      goto LABEL_35;
    }
    v71 = *(_QWORD *)(a1 + 40);
    _HKInitializeLogging();
    v72 = *v49;
    v73 = *v49;
    if (v71)
    {
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      {
        v74 = v72;
        v75 = objc_opt_class();
        v76 = *(const __CFString **)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        v92 = v75;
        v93 = 2048;
        v94 = v76;
        v95 = 2114;
        v96 = v57;
        v97 = 2112;
        v77 = v84;
        v98 = v84;
        _os_log_fault_impl(&dword_21A0AA000, v74, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to apply %ld %{public}@ samples to statistics: %@", buf, 0x2Au);
LABEL_39:

        v65 = 0;
        goto LABEL_34;
      }
    }
    else if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = v72;
      v81 = objc_opt_class();
      v82 = *(const __CFString **)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      v92 = v81;
      v93 = 2048;
      v94 = v82;
      v95 = 2114;
      v96 = v57;
      v97 = 2112;
      v77 = v84;
      v98 = v84;
      _os_log_error_impl(&dword_21A0AA000, v74, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to apply %ld %{public}@ samples to statistics: %@", buf, 0x2Au);
      goto LABEL_39;
    }
    v65 = 0;
    v77 = v84;
    goto LABEL_34;
  }
LABEL_36:

}

- (void)didReceiveResetDosageToFireDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    v15 = 2113;
    v16 = v4;
    _os_log_impl(&dword_21A0AA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received reset dosage notification at %{public}@ for fire date %{private}@.", buf, 0x20u);

  }
  -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeadphoneDoseManager _updateWithRemoteNotificationDismissalDate:assertion:](self, "_updateWithRemoteNotificationDismissalDate:assertion:", v4, v9);
  objc_msgSend(v9, "invalidate");
  if (self->_unitTesting_didFinishResetDosageToFireDate)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__HDHeadphoneDoseManager_didReceiveResetDosageToFireDate___block_invoke;
    block[3] = &unk_24DC5F008;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __58__HDHeadphoneDoseManager_didReceiveResetDosageToFireDate___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "unitTesting_didFinishResetDosageToFireDate");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (BOOL)_rebuildWithError:(id *)a3
{
  void *v5;

  -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a3) = -[HDHeadphoneDoseManager _lock_rebuildWithAssertion:error:](self, "_lock_rebuildWithAssertion:error:", v5, a3);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v5, "invalidate");

  return (char)a3;
}

- (id)_infoWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  double dose;
  const __CFString *v11;
  void *v12;
  void *v13;
  double v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:earliestStartDate:profile:](HDHeadphoneAudioExposureStatisticsBucket, "_currentDoseStringForEndDate:earliestStartDate:profile:", v5, 0, WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled");
  HKStringFromBool();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("HAEN Enabled:\t\t %@\n"), v9);

  objc_msgSend(v8, "appendFormat:", CFSTR("Current Dose:\t\t %@\n"), v7);
  dose = self->_dose;
  if (dose >= 0.0)
  {
    v15 = dose * 100.0;
    v11 = CFSTR("Accumulated Dose:\t %.2f%%\n");
  }
  else
  {
    v11 = CFSTR("Accumulated Dose:\t Not Yet Determined\n");
  }
  objc_msgSend(v8, "appendFormat:", v11, *(_QWORD *)&v15);
  -[HDHeadphoneDoseMetadataStore _info](self->_keyValueStore, "_info");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v12);

  os_unfair_lock_unlock(p_lock);
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (id)_infoDictWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:earliestStartDate:profile:](HDHeadphoneAudioExposureStatisticsBucket, "_currentDoseStringForEndDate:earliestStartDate:profile:", v6, 0, WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled");
  HKStringFromBool();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("haen_enabled"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("current_dose"));
  if (self->_dose < 0.0)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("n/a"), CFSTR("accumulated_dose"));
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%.2f"), self->_dose * 100.0);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("accumulated_dose"));

  }
  -[HDHeadphoneDoseMetadataStore _infoDict](self->_keyValueStore, "_infoDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v11);

  os_unfair_lock_unlock(p_lock);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (id)_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDHeadphoneDoseManager _lock_pruneWithNowDate:limit:error:](self, "_lock_pruneWithNowDate:limit:error:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeadphoneAudioExposureStatisticsCalculator pruneWithNowDate:limit:error:](self->_statisticsCalculator, "pruneWithNowDate:limit:error:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_opt_class();
    objc_msgSend(v10, "prunedCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    _os_log_impl(&dword_21A0AA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pruned %{public}@ HAE Buckets.", (uint8_t *)&v20, 0x16u);

  }
  if (v10)
  {
    objc_msgSend(v10, "prunedCount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongValue");

    if (!v16)
    {
      objc_msgSend(v9, "invalidate");
LABEL_10:
      objc_msgSend(v10, "prunedCount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v17 = -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:](self, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v10, v9, a5);
    objc_msgSend(v9, "invalidate");
    if (v17)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(v9, "invalidate");
  }
  v18 = 0;
LABEL_11:

  return v18;
}

- (HDHeadphoneAudioExposureStatisticsCalculator)unitTesting_calculator
{
  return self->_statisticsCalculator;
}

- (HDHeadphoneDoseMetadataStore)unitTesting_keyValueStore
{
  return self->_keyValueStore;
}

- (void)unitTesting_didReceiveResetDosageToFireDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HDHeadphoneDoseManager_unitTesting_didReceiveResetDosageToFireDate___block_invoke;
  v7[3] = &unk_24DC5F030;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __70__HDHeadphoneDoseManager_unitTesting_didReceiveResetDosageToFireDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveResetDosageToFireDate:", *(_QWORD *)(a1 + 40));
}

- (id)_fetchDoseLimitInfoWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneDoseMetadataStore _fetchDoseLimitInfoWithError:](self->_keyValueStore, "_fetchDoseLimitInfoWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)_overrideDoseLimit:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(a4) = -[HDHeadphoneDoseMetadataStore _overrideDoseLimit:error:](self->_keyValueStore, "_overrideDoseLimit:error:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (id)_takeAccessibilityAssertion
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v10, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v8, &v14, 300.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;

  if (!v11)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      -[HDHeadphoneDoseManager _takeAccessibilityAssertion].cold.1();
  }

  return v11;
}

- (void)_headphoneExposureNotificationsEnabledDidChange:(id)a3
{
  id v4;

  -[HDHeadphoneDoseManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneDoseManager _lock_updateIsEnabledForInitialSetup:assertion:](self, "_lock_updateIsEnabledForInitialSetup:assertion:", 0, v4);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v4, "invalidate");

}

- (void)_lock_updateIsEnabledForInitialSetup:(BOOL)a3 assertion:(id)a4
{
  _BOOL4 v4;
  id v7;
  _BOOL4 enabled;
  _BOOL4 v9;
  int v10;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  os_log_t *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  os_log_t v21;
  NSObject *v22;
  os_log_t v23;
  HDHeadphoneAudioExposureStatisticsCalculator *statisticsCalculator;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  _BOOL4 v33;
  os_log_t v34;
  NSObject *v35;
  uint64_t v36;
  _BOOL4 v37;
  os_log_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  _BYTE v49[10];
  __int16 v50;
  int v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v4 = a3;
  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  enabled = self->_enabled;
  self->_enabled = objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled");
  v9 = -[HDHeadphoneAudioExposureStatisticsCalculator isSetup](self->_statisticsCalculator, "isSetup");
  v10 = !v9;
  if (!enabled)
    v10 = 1;
  if (self->_enabled && v10 != 0)
  {
    v16 = (os_log_t *)MEMORY[0x24BDD3000];
    if (v9)
    {
      if (enabled)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseManager.m"), 572, CFSTR("Unreachable code has been executed"));

        goto LABEL_31;
      }
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseManager.m"), 569, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSetup == NO"));

      }
      _HKInitializeLogging();
      v23 = *v16;
      if (!os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        statisticsCalculator = self->_statisticsCalculator;
        v45 = 0;
        -[HDHeadphoneAudioExposureStatisticsCalculator rebuildWithAssertion:error:](statisticsCalculator, "rebuildWithAssertion:error:", v7, &v45);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v45;
        v27 = v26;
        if (v25)
        {
          v44 = 0;
          v28 = -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:](self, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v25, v7, &v44);
          v29 = v44;
          _HKInitializeLogging();
          v30 = *v16;
          if (!v28)
          {
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              goto LABEL_41;
            v31 = v30;
            v39 = objc_opt_class();
            v40 = self->_enabled;
            *(_DWORD *)buf = 138544386;
            v47 = v39;
            v48 = 1024;
            *(_DWORD *)v49 = v40;
            *(_WORD *)&v49[4] = 1024;
            *(_DWORD *)&v49[6] = enabled;
            v50 = 1024;
            v51 = v4;
            v52 = 2112;
            v53 = v29;
            _os_log_fault_impl(&dword_21A0AA000, v31, OS_LOG_TYPE_FAULT, "[%{public}@] Failure to handle HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d, changed: YES): %@", buf, 0x28u);
            goto LABEL_35;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = v30;
            v32 = objc_opt_class();
            v33 = self->_enabled;
            *(_DWORD *)buf = 138544130;
            v47 = v32;
            v48 = 1024;
            *(_DWORD *)v49 = v33;
            *(_WORD *)&v49[4] = 1024;
            *(_DWORD *)&v49[6] = enabled;
            v50 = 1024;
            v51 = v4;
            _os_log_impl(&dword_21A0AA000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handled HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d, changed: YES)", buf, 0x1Eu);
LABEL_35:

          }
        }
        else
        {
          if (v4 && -[NSObject hearing_isExpectedError](v26, "hearing_isExpectedError"))
          {
            _HKInitializeLogging();
            v34 = *v16;
            if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
            {
              v35 = v34;
              v36 = objc_opt_class();
              v37 = self->_enabled;
              *(_DWORD *)buf = 138544386;
              v47 = v36;
              v48 = 1024;
              *(_DWORD *)v49 = v37;
              *(_WORD *)&v49[4] = 1024;
              *(_DWORD *)&v49[6] = enabled;
              v50 = 1024;
              v51 = 1;
              v52 = 2112;
              v53 = v27;
              _os_log_error_impl(&dword_21A0AA000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to handle HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d): %@", buf, 0x28u);

            }
            goto LABEL_43;
          }
          _HKInitializeLogging();
          v38 = *v16;
          if (!os_log_type_enabled(*v16, OS_LOG_TYPE_FAULT))
          {
LABEL_43:

            goto LABEL_44;
          }
          v29 = v38;
          v41 = objc_opt_class();
          v42 = self->_enabled;
          *(_DWORD *)buf = 138544386;
          v47 = v41;
          v48 = 1024;
          *(_DWORD *)v49 = v42;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = enabled;
          v50 = 1024;
          v51 = v4;
          v52 = 2112;
          v53 = v27;
          _os_log_fault_impl(&dword_21A0AA000, v29, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to handle HAEN isEnabled change (enabled: %d, wasEnabled: %d, initialSetup: %d): %@", buf, 0x28u);
        }
LABEL_41:

        goto LABEL_43;
      }
      v20 = v23;
      *(_DWORD *)buf = 138543362;
      v47 = objc_opt_class();
      _os_log_impl(&dword_21A0AA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has re-ENABLED Headphone Exposure Notifications while healthd is running.", buf, 0xCu);
    }
    else
    {
      v19 = CFSTR("while healthd is running.");
      if (v4)
        v19 = CFSTR("before launching healthd or first unlock");
      v20 = v19;
      _HKInitializeLogging();
      v21 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        *(_DWORD *)buf = 138543618;
        v47 = objc_opt_class();
        v48 = 2114;
        *(_QWORD *)v49 = v20;
        _os_log_impl(&dword_21A0AA000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has ENABLED Headphone Exposure Notifications %{public}@", buf, 0x16u);

      }
    }

    goto LABEL_31;
  }
  if (enabled && !self->_enabled)
  {
    v12 = CFSTR("while healthd is running.");
    if (v4)
      v12 = CFSTR("before launching healthd or first unlock");
    v13 = v12;
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      *(_DWORD *)buf = 138543618;
      v47 = objc_opt_class();
      v48 = 2114;
      *(_QWORD *)v49 = v13;
      _os_log_impl(&dword_21A0AA000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has DISABLED Headphone Exposure Notifications %{public}@.", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (enabled != self->_enabled)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseManager.m"), 602, CFSTR("Unreachable code has been executed"));
    goto LABEL_25;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v18;
    *(_DWORD *)buf = 138543362;
    v47 = objc_opt_class();
    _os_log_impl(&dword_21A0AA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No changes to Headphone Exposure Notifications setting occurred.", buf, 0xCu);
LABEL_25:

  }
LABEL_44:

}

- (BOOL)_lock_rebuildWithAssertion:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  LOBYTE(a4) = -[HDHeadphoneDoseManager _lock_rebuildWithAssertion:resetSyncNotification:error:](self, "_lock_rebuildWithAssertion:resetSyncNotification:error:", v7, 0, a4);

  return (char)a4;
}

- (BOOL)_lock_rebuildWithAssertion:(id)a3 resetSyncNotification:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  BOOL v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  HDHeadphoneDoseMetadataStore *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6)
  {
    keyValueStore = self->_keyValueStore;
    v27 = 0;
    v10 = -[HDHeadphoneDoseMetadataStore _clearPreviousSevenDayRemoteNotificationFireDateWithError:](keyValueStore, "_clearPreviousSevenDayRemoteNotificationFireDateWithError:", &v27);
    v11 = v27;
    if (!v10)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v29 = v14;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_21A0AA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear Previous Seven Date Remote Notification Fire Date returned with error:%@", buf, 0x16u);

      }
      v15 = v11;
      if (!v15)
        goto LABEL_18;
      if (!a5)
      {
LABEL_7:
        _HKLogDroppedError();
LABEL_18:
        v21 = 0;
        v18 = v15;
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = self->_keyValueStore;
  v26 = v11;
  v17 = -[HDHeadphoneDoseMetadataStore rebuildCachedFireDateFromLocalHAENStoreWithError:](v16, "rebuildCachedFireDateFromLocalHAENStoreWithError:", &v26);
  v18 = v26;

  if (!v17)
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_21A0AA000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rebuild Cache Fire Date from Local HAEN Store returned with error:%@", buf, 0x16u);

    }
    v15 = v18;
    if (!v15)
      goto LABEL_18;
    if (!a5)
      goto LABEL_7;
LABEL_17:
    v15 = objc_retainAutorelease(v15);
    v21 = 0;
    *a5 = v15;
    v18 = v15;
    goto LABEL_21;
  }
  -[HDHeadphoneAudioExposureStatisticsCalculator rebuildWithAssertion:error:](self->_statisticsCalculator, "rebuildWithAssertion:error:", v8, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (!v19)
  {
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v19, "cache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 100, CFSTR("Cache not ready. Pending samples should be replayed soon."));
    goto LABEL_20;
  }
  v21 = -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:](self, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v15, v8, a5);
LABEL_21:

  return v21;
}

- (void)_lock_updateWithNotifications:(id)a3 journaled:(BOOL)a4 assertion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  HDHeadphoneAudioExposureStatisticsCalculator *statisticsCalculator;
  void *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  v10 = CFSTR("added");
  if (v6)
    v10 = CFSTR("journaled");
  v11 = v10;
  if (self->_enabled)
  {
    statisticsCalculator = self->_statisticsCalculator;
    v20 = 0;
    -[HDHeadphoneAudioExposureStatisticsCalculator updateWithNotifications:assertion:error:](statisticsCalculator, "updateWithNotifications:assertion:error:", v8, v9, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (__CFString *)v20;
    if (v13)
    {
      -[HDHeadphoneDoseManager _updateCurrentDoseFromResult:context:sampleCount:assertion:](self, "_updateCurrentDoseFromResult:context:sampleCount:assertion:", v13, v11, objc_msgSend(v8, "count"), v9);
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      {
        v18 = v17;
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v22 = v19;
        v23 = 2114;
        v24 = (uint64_t)v11;
        v25 = 2112;
        v26 = v14;
        _os_log_fault_impl(&dword_21A0AA000, v18, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to process %{public}@ 7-Day HAEN: %@", buf, 0x20u);

      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      *(_DWORD *)buf = 138543874;
      v22 = objc_opt_class();
      v23 = 2048;
      v24 = objc_msgSend(v8, "count");
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_21A0AA000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring %lu %{public}@ HAEN samples since HAEN is disabled.", buf, 0x20u);

    }
  }

}

- (void)_updateCurrentDoseFromResult:(id)a3 context:(id)a4 sampleCount:(unint64_t)a5 assertion:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(v11, "statistics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "statistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "eligbleForUserNotification");

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseManager.m"), 678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.statistics.eligbleForUserNotification == NO"));

    }
    objc_msgSend(v11, "statistics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v18 = -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:](self, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v17, v13, &v28);
    v19 = v28;

    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD3000];
    v21 = *MEMORY[0x24BDD3000];
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v20;
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v30 = v23;
        v31 = 2048;
        v32 = a5;
        v33 = 2114;
        v34 = v12;
        _os_log_impl(&dword_21A0AA000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully updated dose for %lu %{public}@ HAEN samples.", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v25 = v20;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      v31 = 2114;
      v32 = (unint64_t)v12;
      v33 = 2112;
      v34 = v19;
      _os_log_fault_impl(&dword_21A0AA000, v25, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to update 7-Day HAE Dose due to 7-Day HAEN %{public}@ sample arrival: %@", buf, 0x20u);

    }
    goto LABEL_11;
  }
  _HKInitializeLogging();
  v24 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v24;
    *(_DWORD *)buf = 138543874;
    v30 = objc_opt_class();
    v31 = 2048;
    v32 = a5;
    v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_21A0AA000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully processed %lu %{public}@ HAEN samples which did NOT impact current dose", buf, 0x20u);
LABEL_11:

  }
}

- (BOOL)_lock_updateCurrentDoseUsingStatisticsResult:(id)a3 assertion:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void (**unitTesting_updateCurrentDoseNowDateProvider)(id, void *);
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double dose;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  BOOL lastUpdateSuppressedUserNotification;
  NSObject *v29;
  BOOL v30;
  void *v31;
  void *v32;
  NSObject *v33;
  double v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  const __CFString *v39;
  HDHeadphoneExposureNotificationAnalyticsInfo *v40;
  NSDate *lastLockDateForAnalytics;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  HDHeadphoneExposureNotificationCenter *notificationCenter;
  uint64_t v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  HDHeadphoneAudioExposureStatisticsCalculator *statisticsCalculator;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (**v71)(_QWORD, _QWORD);
  id v72;
  NSObject *v73;
  id v74;
  id v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  SEL v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  _QWORD v94[5];
  _QWORD v95[6];
  void *v96;
  uint8_t buf[4];
  double v98;
  __int16 v99;
  double v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseManager.m"), 691, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statistics"));

  }
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  unitTesting_updateCurrentDoseNowDateProvider = (void (**)(id, void *))self->_unitTesting_updateCurrentDoseNowDateProvider;
  if (unitTesting_updateCurrentDoseNowDateProvider)
  {
    unitTesting_updateCurrentDoseNowDateProvider[2](unitTesting_updateCurrentDoseNowDateProvider, v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v14 = objc_msgSend(v9, "eligbleForUserNotification");
  objc_msgSend(v9, "cache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "snapshotStatisticsForNowDate:error:", v11, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      v30 = 0;
LABEL_73:

      goto LABEL_74;
    }
    v87 = a2;
    objc_msgSend(v17, "statistics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_hearingSevenDayDosePercentageWithError:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v30 = 0;
LABEL_72:

      goto LABEL_73;
    }
    v21 = MEMORY[0x22073925C](self->_unitTesting_didUpdateHandler);
    dose = self->_dose;
    v23 = v20;
    v24 = MEMORY[0x24BDAC760];
    v95[0] = MEMORY[0x24BDAC760];
    v95[1] = 3221225472;
    v95[2] = __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke;
    v95[3] = &unk_24DC5F0A8;
    v88 = (void *)v21;
    v95[4] = v21;
    *(double *)&v95[5] = dose;
    v89 = v23;
    v90 = MEMORY[0x22073925C](v95);
    objc_msgSend(v23, "doubleValue");
    v26 = v25;
    v27 = dose - v25;
    if (v27 < 0.0)
      v27 = -v27;
    if (v14)
      lastUpdateSuppressedUserNotification = self->_lastUpdateSuppressedUserNotification;
    else
      lastUpdateSuppressedUserNotification = 0;
    if (v27 <= 2.22044605e-16 && !lastUpdateSuppressedUserNotification)
    {
      v31 = (void *)v90;
      (*(void (**)(uint64_t, double))(v90 + 16))(v90, v26);
      v30 = 1;
      v32 = v88;
      v20 = v89;
LABEL_71:

      goto LABEL_72;
    }
    _HKInitializeLogging();
    v33 = *MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v34 = self->_dose * 100.0;
      *(_DWORD *)buf = 134283777;
      v98 = v34;
      v99 = 2049;
      v100 = v26 * 100.0;
      _os_log_impl(&dword_21A0AA000, v33, OS_LOG_TYPE_DEFAULT, "Updating dose from %{private}.2f%% to %{private}.2f%%", buf, 0x16u);
    }
    self->_dose = v26;
    (*(void (**)(double))(v90 + 16))(v26);
    -[HDHeadphoneDoseManager _lock_updateCollectionAssertionForDoseAccumulated:](self, "_lock_updateCollectionAssertionForDoseAccumulated:", v26);
    v35 = -[HDHeadphoneDoseMetadataStore shouldNotifyUserForAccumulatedDose:](self->_keyValueStore, "shouldNotifyUserForAccumulatedDose:", v26);
    if (((!v35 | v14) & 1) == 0)
    {
      v35 = 0;
      self->_lastUpdateSuppressedUserNotification = 1;
    }
    _HKInitializeLogging();
    v36 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      *(double *)&v38 = COERCE_DOUBLE(objc_opt_class());
      *(double *)&v39 = COERCE_DOUBLE(CFSTR("NO"));
      if (v35)
        *(double *)&v39 = COERCE_DOUBLE(CFSTR("YES"));
      *(_DWORD *)buf = 138543618;
      v98 = *(double *)&v38;
      v99 = 2112;
      v100 = *(double *)&v39;
      _os_log_impl(&dword_21A0AA000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@] Update Current Dose should notify user:%@", buf, 0x16u);

    }
    if (!v35)
    {
      v30 = 1;
      v32 = v88;
      v20 = v89;
      v31 = (void *)v90;
      goto LABEL_71;
    }
    self->_lastUpdateSuppressedUserNotification = 0;
    v94[0] = v24;
    v94[1] = 3221225472;
    v94[2] = __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke_267;
    v94[3] = &unk_24DC5F0D0;
    v94[4] = self;
    v84 = MEMORY[0x22073925C](v94);
    v40 = [HDHeadphoneExposureNotificationAnalyticsInfo alloc];
    lastLockDateForAnalytics = self->_lastLockDateForAnalytics;
    objc_msgSend(v18, "previousNotificationDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[HDHeadphoneExposureNotificationAnalyticsInfo initWithLastLockDate:lastNotificationDate:](v40, "initWithLastLockDate:lastNotificationDate:", lastLockDateForAnalytics, v42);

    _HKInitializeLogging();
    v44 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      *(double *)&v46 = COERCE_DOUBLE(objc_opt_class());
      *(_DWORD *)buf = 138543362;
      v98 = *(double *)&v46;
      _os_log_impl(&dword_21A0AA000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@] Posting 7-Day HAE Notification", buf, 0xCu);

    }
    notificationCenter = self->_notificationCenter;
    v93 = 0;
    -[HDHeadphoneExposureNotificationCenter postSevenDayDoseNotification:nowDate:analyticsInfo:error:](notificationCenter, "postSevenDayDoseNotification:nowDate:analyticsInfo:error:", v18, v11, v43, &v93);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v93;
    v85 = v49;
    v86 = (void *)v48;
    v83 = (void *)v43;
    if (v48)
    {
      _HKInitializeLogging();
      v50 = *MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A0AA000, v50, OS_LOG_TYPE_DEFAULT, "Posted 7-Day HAE Notification.", buf, 2u);
      }
      if (objc_msgSend(v16, "isDirty"))
      {
        _HKInitializeLogging();
        v51 = *MEMORY[0x24BDD3000];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21A0AA000, v51, OS_LOG_TYPE_DEFAULT, "Marking doseLimit as needing rebuild on next unlock.", buf, 2u);
        }
        -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self->_statisticsCalculator, "setNeedsRebuild");
      }
      statisticsCalculator = self->_statisticsCalculator;
      v96 = v86;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v96, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = 0;
      -[HDHeadphoneAudioExposureStatisticsCalculator updateWithNotifications:assertion:error:](statisticsCalculator, "updateWithNotifications:assertion:error:", v53, v10, &v92);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v92;

      v81 = v54;
      v82 = v55;
      if (v54)
      {
        objc_msgSend(v54, "statistics");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v56)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", v87, self, CFSTR("HDHeadphoneDoseManager.m"), 797, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.statistics"), v54);

        }
        objc_msgSend(v54, "statistics");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "eligbleForUserNotification");

        if (v58)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", v87, self, CFSTR("HDHeadphoneDoseManager.m"), 798, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.statistics.eligbleForUserNotification == NO"));

        }
        objc_msgSend(v54, "statistics");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        v30 = -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:](self, "_lock_updateCurrentDoseUsingStatisticsResult:assertion:error:", v59, v10, &v91);
        v60 = v91;

        v61 = 0;
        v20 = v89;
        if (!v30)
        {
          v62 = v60;
          v61 = v62;
          if (v62)
          {
            if (a5)
              *a5 = objc_retainAutorelease(v62);
            else
              _HKLogDroppedError();
          }

        }
        v76 = v61;
        v71 = (void (**)(_QWORD, _QWORD))v84;
        (*(void (**)(uint64_t, void *))(v84 + 16))(v84, v76);
      }
      else
      {
        v71 = (void (**)(_QWORD, _QWORD))v84;
        (*(void (**)(uint64_t, id))(v84 + 16))(v84, v55);
        v72 = v55;
        v60 = v72;
        if (v72)
        {
          v20 = v89;
          if (a5)
          {
            v60 = objc_retainAutorelease(v72);
            v30 = 0;
            *a5 = v60;
          }
          else
          {
            _HKLogDroppedError();
            v30 = 0;
          }
        }
        else
        {
          v30 = 0;
          v20 = v89;
        }
      }

      v32 = v88;
      v31 = (void *)v90;
      v74 = v82;
      goto LABEL_70;
    }
    v63 = v49;
    v20 = v89;
    v31 = (void *)v90;
    if ((objc_msgSend(v49, "hk_isFeatureDisabledError") & 1) != 0
      || objc_msgSend(v63, "hearing_audioDSP_isHAENDisabled"))
    {
      _HKInitializeLogging();
      v64 = *MEMORY[0x24BDD3000];
      v71 = (void (**)(_QWORD, _QWORD))v84;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
        -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:].cold.1((uint64_t)v85, v64, v65, v66, v67, v68, v69, v70);
    }
    else
    {
      _HKInitializeLogging();
      v73 = *MEMORY[0x24BDD3000];
      v71 = (void (**)(_QWORD, _QWORD))v84;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
        -[HDHeadphoneDoseManager _lock_updateCurrentDoseUsingStatisticsResult:assertion:error:].cold.2((uint64_t)v85, v73);
    }
    ((void (**)(_QWORD, void *))v71)[2](v71, v85);
    v74 = v85;
    if (v74)
    {
      if (a5)
      {
        v74 = objc_retainAutorelease(v74);
        v30 = 0;
        *a5 = v74;
LABEL_64:
        v32 = v88;
LABEL_70:

        goto LABEL_71;
      }
      v75 = v74;
      _HKLogDroppedError();
      v74 = v75;
    }
    v30 = 0;
    goto LABEL_64;
  }
  _HKInitializeLogging();
  v29 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A0AA000, v29, OS_LOG_TYPE_DEFAULT, "Dose did not need updating", buf, 2u);
  }
  v30 = 1;
LABEL_74:

  return v30;
}

uint64_t __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(__n128, double))(result + 16))(a2, *(double *)(a1 + 40));
  return result;
}

void __87__HDHeadphoneDoseManager__lock_updateCurrentDoseUsingStatisticsResult_assertion_error___block_invoke_267(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x22073925C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

- (void)_lock_setCollectionAssertion:(id)a3
{
  HDDataCollectionAssertion *v4;
  HDDataCollectionAssertion *collectionAssertion;
  HDDataCollectionAssertion *v6;

  v4 = (HDDataCollectionAssertion *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  collectionAssertion = self->_collectionAssertion;
  if (collectionAssertion)
    -[HDDataCollectionAssertion invalidate](collectionAssertion, "invalidate");
  v6 = self->_collectionAssertion;
  self->_collectionAssertion = v4;

}

- (void)_lock_updateCollectionAssertionForDoseAccumulated:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  uint8_t buf[4];
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  -[HDHeadphoneDoseMetadataStore collectionIntervalForDoseAccumulated:](self->_keyValueStore, "collectionIntervalForDoseAccumulated:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A0AA000, v18, OS_LOG_TYPE_DEFAULT, "Using default HAE collection interval.", buf, 2u);
    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "doubleValue");
  v8 = v7;
  _HKInitializeLogging();
  v9 = *MEMORY[0x24BDD3000];
  v10 = *MEMORY[0x24BDD3000];
  if (v8 < 5.0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HDHeadphoneDoseManager _lock_updateCollectionAssertionForDoseAccumulated:].cold.1(v9, v11, v12, v13, v14, v15, v16, v17);
LABEL_7:
    -[HDHeadphoneDoseManager _lock_setCollectionAssertion:](self, "_lock_setCollectionAssertion:", 0);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v8;
    _os_log_impl(&dword_21A0AA000, v9, OS_LOG_TYPE_DEFAULT, "Requesting custom HAE collection interval: %f", buf, 0xCu);
  }
  v19 = (void *)MEMORY[0x24BDD17C8];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@"), v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDBCF20];
  HKHeadphoneAudioExposureType();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40A88], "dataCollectionObserverStateInBackground:hasRunningWorkout:", 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataCollectionManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "takeCollectionAssertionWithOwnerIdentifier:sampleTypes:observerState:collectionInterval:", v24, v27, v28, v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHeadphoneDoseManager _lock_setCollectionAssertion:](self, "_lock_setCollectionAssertion:", v31);
LABEL_11:

}

- (void)_updateWithRemoteNotificationDismissalDate:(id)a3 assertion:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDHeadphoneDoseManager _lock_updateWithRemoteNotificationDismissalDate:assertion:](self, "_lock_updateWithRemoteNotificationDismissalDate:assertion:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateWithRemoteNotificationDismissalDate:(id)a3 assertion:(id)a4
{
  id v6;
  id v7;
  HDHeadphoneAudioExposureStatisticsCalculator *statisticsCalculator;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_enabled)
  {
    statisticsCalculator = self->_statisticsCalculator;
    v13 = 0;
    -[HDHeadphoneAudioExposureStatisticsCalculator updateWithRemoteNotificationDismissalFireDate:assertion:error:](statisticsCalculator, "updateWithRemoteNotificationDismissalFireDate:assertion:error:", v6, v7, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v9)
    {
      -[HDHeadphoneDoseManager _updateCurrentDoseFromResult:context:sampleCount:assertion:](self, "_updateCurrentDoseFromResult:context:sampleCount:assertion:", v9, CFSTR("Notification Synced"), 1, v7);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
        -[HDHeadphoneDoseManager _lock_updateWithRemoteNotificationDismissalDate:assertion:].cold.1();
    }

  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      *(_DWORD *)buf = 138543362;
      v15 = objc_opt_class();
      _os_log_impl(&dword_21A0AA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring incoming reset dosage notification since HAEN is disabled.", buf, 0xCu);

    }
  }

}

- (void)_registerForSignificantTimeChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_significantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleSignificantTimeChangeNotification_, *MEMORY[0x24BDBC9E8], 0);

}

- (void)_unregisterForSignificantTimeChangeNotification
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDBC9E8], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
}

- (void)_handleSignificantTimeChangeNotification:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A0AA000, v4, OS_LOG_TYPE_DEFAULT, "Queueing dose recomputation due to significant time change.", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke;
  block[3] = &unk_24DC5F008;
  block[4] = self;
  dispatch_async(queue, block);
}

void __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  os_unfair_lock_s **v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  int v8;
  id v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  uint64_t v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  os_log_t v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x24BDD3000];
  v3 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A0AA000, v3, OS_LOG_TYPE_DEFAULT, "Starting dose recomputation due to significant time change.", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v4 = (os_unfair_lock_s **)(a1 + 32);
  objc_msgSend(v5, "_takeAccessibilityAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(*v4 + 6);
  v7 = *v4;
  if (LOBYTE((*v4)[10]._os_unfair_lock_opaque))
  {
    v20 = 0;
    v8 = -[os_unfair_lock_s _lock_rebuildWithAssertion:error:](v7, "_lock_rebuildWithAssertion:error:", v6, &v20);
    v9 = v20;
    v10 = v9;
    if (v8)
    {
      _HKInitializeLogging();
      v11 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v22 = v13;
        _os_log_impl(&dword_21A0AA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Succesfully rebuilt HAEN dose after significant time change.", buf, 0xCu);

      }
    }
    else
    {
      v17 = objc_msgSend(v9, "hearing_isExpectedError");
      _HKInitializeLogging();
      v18 = *v2;
      v19 = *v2;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_1((uint64_t)v4, v18);
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_2((uint64_t)v4, v18);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_21A0AA000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring significant time change since HAEN is disabled.", buf, 0xCu);

    }
    v10 = 0;
  }
  os_unfair_lock_unlock(*v4 + 6);
  objc_msgSend(v6, "invalidate");

}

- (id)unitTesting_profileDidBecomeReadyHandler
{
  return self->_unitTesting_profileDidBecomeReadyHandler;
}

- (void)setUnitTesting_profileDidBecomeReadyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)unitTesting_didUpdateHandler
{
  return self->_unitTesting_didUpdateHandler;
}

- (void)setUnitTesting_didUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)unitTesting_didObserveProtectedDataHandler
{
  return self->_unitTesting_didObserveProtectedDataHandler;
}

- (void)setUnitTesting_didObserveProtectedDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)unitTesting_didNotifyUser
{
  return self->_unitTesting_didNotifyUser;
}

- (void)setUnitTesting_didNotifyUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)unitTesting_protectedDataDidBecomeAvailable
{
  return self->_unitTesting_protectedDataDidBecomeAvailable;
}

- (void)setUnitTesting_protectedDataDidBecomeAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)unitTesting_didFinishResetDosageToFireDate
{
  return self->_unitTesting_didFinishResetDosageToFireDate;
}

- (void)setUnitTesting_didFinishResetDosageToFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)unitTesting_updateCurrentDoseNowDateProvider
{
  return self->_unitTesting_updateCurrentDoseNowDateProvider;
}

- (void)setUnitTesting_updateCurrentDoseNowDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_updateCurrentDoseNowDateProvider, 0);
  objc_storeStrong(&self->_unitTesting_didFinishResetDosageToFireDate, 0);
  objc_storeStrong(&self->_unitTesting_protectedDataDidBecomeAvailable, 0);
  objc_storeStrong(&self->_unitTesting_didNotifyUser, 0);
  objc_storeStrong(&self->_unitTesting_didObserveProtectedDataHandler, 0);
  objc_storeStrong(&self->_unitTesting_didUpdateHandler, 0);
  objc_storeStrong(&self->_unitTesting_profileDidBecomeReadyHandler, 0);
  objc_storeStrong((id *)&self->_lastLockDateForAnalytics, 0);
  objc_storeStrong((id *)&self->_collectionAssertion, 0);
  objc_storeStrong((id *)&self->_statisticsCalculator, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)database:protectedDataDidBecomeAvailable:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to rebuild 7-Day HAEN dose after device unlock: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)database:protectedDataDidBecomeAvailable:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to rebuild 7-Day HAEN dose after device unlock: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)database:protectedDataDidBecomeAvailable:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to fetch shouldRebuild flag for 7-Day HAEN Dose Statistics: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)database:protectedDataDidBecomeAvailable:.cold.4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to fetch shouldRebuild flag for 7-Day HAEN Dose Statistics: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)database:protectedDataDidBecomeAvailable:.cold.5()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to fetch shouldRebuild flag for Previous 7-Day HAEN FireDate: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)database:protectedDataDidBecomeAvailable:.cold.6()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to fetch shouldRebuild flag for Previous 7-Day HAEN FireDate: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAENs: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __59__HDHeadphoneDoseManager_samplesOfTypesWereRemoved_anchor___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v3, v4, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAENs: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)profile:didDiscardSeriesOfType:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAE Series: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)profile:didDiscardSeriesOfType:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to rebuild 7-Day HAEN dose after discarding HAE Series: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_takeAccessibilityAssertion
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "%{public}@: unable to take accessibility assertion: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_lock_updateCurrentDoseUsingStatisticsResult:(uint64_t)a3 assertion:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_21A0AA000, a2, a3, "Unable to post 7-Day HAE Notification since feature was disabled: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)_lock_updateCurrentDoseUsingStatisticsResult:(uint64_t)a1 assertion:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_21A0AA000, a2, OS_LOG_TYPE_FAULT, "Unable to post 7-Day HAE Notification: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_9();
}

- (void)_lock_updateCollectionAssertionForDoseAccumulated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_21A0AA000, a1, a3, "Computed HAE collection interval (%f) is too frequent so using default instead.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_lock_updateWithRemoteNotificationDismissalDate:assertion:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to rebuild bucket collection earliest date: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v3, v4, "[%{public}@] Failed to rebuild HAEN dose after significant time change: %@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __67__HDHeadphoneDoseManager__handleSignificantTimeChangeNotification___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21A0AA000, v3, v4, "[%{public}@] Failed to rebuild HAEN dose after significant time change: %@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
