@implementation HDMCAnalysisManager

- (HKMCAnalysis)currentAnalysis
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[HKMCAnalysis copy](self->_lock_currentAnalysis, "copy");
  os_unfair_lock_unlock(p_lock);
  return (HKMCAnalysis *)v4;
}

- (HDMCAnalysisManager)initWithProfile:(id)a3 settingsManager:(id)a4 featureAvailabilityManager:(id)a5 heartRateAvailabilityManager:(id)a6 wristTemperatureAvailabilityManager:(id)a7 deviationsAvailabilityManager:(id)a8 deviceScopedStorageManager:(id)a9 calendarCache:(id)a10
{
  return (HDMCAnalysisManager *)-[HDMCAnalysisManager _initWithProfile:settingsManager:featureAvailabilityManager:heartRateAvailabilityManager:wristTemperatureAvailabilityManager:deviationsAvailabilityManager:deviceScopedStorageManager:calendarCache:dayStreamProcessorProvider:historicalAnalyzerProvider:](self, "_initWithProfile:settingsManager:featureAvailabilityManager:heartRateAvailabilityManager:wristTemperatureAvailabilityManager:deviationsAvailabilityManager:deviceScopedStorageManager:calendarCache:dayStreamProcessorProvider:historicalAnalyzerProvider:", a3, a4, a5, a6, a7, a8, a9, a10, &__block_literal_global_0, &__block_literal_global_187);
}

id __218__HDMCAnalysisManager_initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE3F590];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithConfig:", v3);

  return v4;
}

id __218__HDMCAnalysisManager_initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache___block_invoke_2()
{
  return objc_alloc_init(MEMORY[0x24BE3F5C0]);
}

- (id)_initWithProfile:(id)a3 settingsManager:(id)a4 featureAvailabilityManager:(id)a5 heartRateAvailabilityManager:(id)a6 wristTemperatureAvailabilityManager:(id)a7 deviationsAvailabilityManager:(id)a8 deviceScopedStorageManager:(id)a9 calendarCache:(id)a10 dayStreamProcessorProvider:(id)a11 historicalAnalyzerProvider:(id)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  HDMCAnalysisManager *v23;
  HDMCAnalysisManager *v24;
  uint64_t v25;
  HKFeatureStatusManager *heartRateFeatureStatusManager;
  uint64_t v27;
  HKFeatureStatusManager *wristTemperatureFeatureStatusManager;
  uint64_t v29;
  HKFeatureStatusManager *deviationsFeatureStatusManager;
  HDMCDeviationInputManager *v31;
  id WeakRetained;
  uint64_t v33;
  HDMCDeviationInputManager *deviationInputManager;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  HKObserverSet *observers;
  uint64_t v39;
  HKObserverSet *userInitiatedObservers;
  uint64_t v41;
  OS_dispatch_queue *queue;
  id v43;
  void *v44;
  id dayStreamProcessorProvider;
  void *v46;
  id historicalAnalyzerProvider;
  id v48;
  OS_dispatch_queue *v49;
  uint64_t v50;
  _HKDelayedOperation *analyzeOperation;
  id v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id v60;
  _QWORD v61[4];
  id v62;
  id location;
  objc_super v64;

  v17 = a3;
  v58 = a4;
  v57 = a5;
  v60 = a6;
  v18 = a7;
  v19 = a8;
  v56 = a9;
  v20 = v17;
  v55 = a10;
  v21 = a11;
  v22 = a12;
  v64.receiver = self;
  v64.super_class = (Class)HDMCAnalysisManager;
  v23 = -[HDMCAnalysisManager init](&v64, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_profile, v17);
    v24->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v24->_settingsManager, a4);
    objc_storeStrong((id *)&v24->_featureAvailabilityManager, a5);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v60, v17);
    heartRateFeatureStatusManager = v24->_heartRateFeatureStatusManager;
    v24->_heartRateFeatureStatusManager = (HKFeatureStatusManager *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v18, v17);
    wristTemperatureFeatureStatusManager = v24->_wristTemperatureFeatureStatusManager;
    v24->_wristTemperatureFeatureStatusManager = (HKFeatureStatusManager *)v27;

    if (v19)
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v19, v17);
      deviationsFeatureStatusManager = v24->_deviationsFeatureStatusManager;
      v24->_deviationsFeatureStatusManager = (HKFeatureStatusManager *)v29;
    }
    else
    {
      deviationsFeatureStatusManager = v24->_deviationsFeatureStatusManager;
      v24->_deviationsFeatureStatusManager = 0;
    }

    objc_storeStrong((id *)&v24->_deviceScopedStorageManager, a9);
    v31 = [HDMCDeviationInputManager alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v24->_profile);
    v33 = -[HDMCDeviationInputManager initWithProfile:](v31, "initWithProfile:", WeakRetained);
    deviationInputManager = v24->_deviationInputManager;
    v24->_deviationInputManager = (HDMCDeviationInputManager *)v33;

    v35 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v36 = (_QWORD *)MEMORY[0x24BDD3030];
    v37 = objc_msgSend(v35, "initWithName:loggingCategory:", CFSTR("HKMCAnalysisManagerObservers"), *MEMORY[0x24BDD3030]);
    observers = v24->_observers;
    v24->_observers = (HKObserverSet *)v37;

    v39 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3DD0]), "initWithName:loggingCategory:", CFSTR("HKMCAnalysisManagerUserInitiatedObservers"), *v36);
    userInitiatedObservers = v24->_userInitiatedObservers;
    v24->_userInitiatedObservers = (HKObserverSet *)v39;

    HKCreateSerialDispatchQueue();
    v41 = objc_claimAutoreleasedReturnValue();
    queue = v24->_queue;
    v24->_queue = (OS_dispatch_queue *)v41;

    objc_storeStrong((id *)&v24->_calendarCache, a10);
    v43 = v21;
    v44 = _Block_copy(v21);
    dayStreamProcessorProvider = v24->_dayStreamProcessorProvider;
    v24->_dayStreamProcessorProvider = v44;

    v46 = _Block_copy(v22);
    historicalAnalyzerProvider = v24->_historicalAnalyzerProvider;
    v24->_historicalAnalyzerProvider = v46;

    objc_initWeak(&location, v24);
    v48 = objc_alloc(MEMORY[0x24BDD41D0]);
    v49 = v24->_queue;
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __273__HDMCAnalysisManager__initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache_dayStreamProcessorProvider_historicalAnalyzerProvider___block_invoke;
    v61[3] = &unk_24DB21C40;
    objc_copyWeak(&v62, &location);
    v50 = objc_msgSend(v48, "initWithMode:clock:queue:delay:block:", 0, 1, v49, v61, 0.25);
    analyzeOperation = v24->_analyzeOperation;
    v24->_analyzeOperation = (_HKDelayedOperation *)v50;

    v52 = objc_loadWeakRetained((id *)&v24->_profile);
    objc_msgSend(v52, "database");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addProtectedDataObserver:queue:", v24, v24->_queue);

    -[HDMCAnalysisManager _startObserving](v24, "_startObserving");
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
    v21 = v43;
  }

  return v24;
}

void __273__HDMCAnalysisManager__initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache_dayStreamProcessorProvider_historicalAnalyzerProvider___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "_queue_analyzeNowWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", 0, 0, 0);

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[HKMCSettingsManager removeObserver:](self->_settingsManager, "removeObserver:", self);
  -[HDFeatureAvailabilityManager unregisterObserver:](self->_featureAvailabilityManager, "unregisterObserver:", self);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  HKMCDaySummarySampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "dataManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObserver:forDataType:", self, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v5);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  HKMCCycleFactorsTypes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
        v17 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v17, "dataManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObserver:forDataType:", self, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v13);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  HKMCDeviationSampleTypes();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23);
        v25 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v25, "dataManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObserver:forDataType:", self, v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeObserver:", self);

  v28.receiver = self;
  v28.super_class = (Class)HDMCAnalysisManager;
  -[HDMCAnalysisManager dealloc](&v28, sel_dealloc);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_needsMaintenanceAnalysis)
    -[HDMCAnalysisManager _queue_enqueueMaintenanceOperationIfNeeded](self, "_queue_enqueueMaintenanceOperationIfNeeded");
}

- (void)_startObserving
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[HKMCSettingsManager addObserver:queue:](self->_settingsManager, "addObserver:queue:", self, self->_queue);
  -[HDFeatureAvailabilityManager registerObserver:queue:](self->_featureAvailabilityManager, "registerObserver:queue:", self, self->_queue);
  -[HKFeatureStatusManager registerObserver:queue:](self->_heartRateFeatureStatusManager, "registerObserver:queue:", self, self->_queue);
  -[HKFeatureStatusManager registerObserver:queue:](self->_wristTemperatureFeatureStatusManager, "registerObserver:queue:", self, self->_queue);
  -[HKFeatureStatusManager registerObserver:queue:](self->_deviationsFeatureStatusManager, "registerObserver:queue:", self, self->_queue);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  HKMCDaySummarySampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "dataManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:forDataType:", self, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v5);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  HKMCCycleFactorsTypes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
        v17 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v17, "dataManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObserver:forDataType:", self, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v13);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  HKMCDeviationSampleTypes();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23);
        v25 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v25, "dataManager", (_QWORD)v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObserver:forDataType:", self, v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__userCharacteristicsDidChange_, *MEMORY[0x24BE40980], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__calendarDayDidChange_, *MEMORY[0x24BDBC9E8], 0);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__HDMCAnalysisManager_samplesAdded_anchor___block_invoke;
  v8[3] = &unk_24DB21C68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __43__HDMCAnalysisManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = v4;
    HKSensitiveLogItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to samples added: %@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded");
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HDMCAnalysisManager_samplesOfTypesWereRemoved_anchor___block_invoke;
  v8[3] = &unk_24DB21C68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __56__HDMCAnalysisManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = v4;
    HKSensitiveLogItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to samples removed of types: %@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded");
}

- (id)_takeAccessibilityAssertion
{
  id WeakRetained;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v5, &v9, 300.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCAnalysisManager _takeAccessibilityAssertion].cold.1();
  }

  return v6;
}

- (void)settingsManagerDidUpdateAnalysisSettings:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HDMCAnalysisManager_settingsManagerDidUpdateAnalysisSettings___block_invoke;
  block[3] = &unk_24DB21D60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__HDMCAnalysisManager_settingsManagerDidUpdateAnalysisSettings___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to settings update", v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)settingsManagerDidUpdateAlgorithmVersionMismatchSettings:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HDMCAnalysisManager_settingsManagerDidUpdateAlgorithmVersionMismatchSettings___block_invoke;
  block[3] = &unk_24DB21D60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __80__HDMCAnalysisManager_settingsManagerDidUpdateAlgorithmVersionMismatchSettings___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to algorithm version mismatch settings update", v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)_userCharacteristicsDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HDMCAnalysisManager__userCharacteristicsDidChange___block_invoke;
  block[3] = &unk_24DB21D60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__HDMCAnalysisManager__userCharacteristicsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to user characteristics change", v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)_calendarDayDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HDMCAnalysisManager__calendarDayDidChange___block_invoke;
  block[3] = &unk_24DB21D60;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__HDMCAnalysisManager__calendarDayDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to calendar day change", v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v5, "featureIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21961B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received feature status update for %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[HDMCAnalysisManager _queue_analyzeIfNeeded](self, "_queue_analyzeIfNeeded");

}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_21961B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to onboarding state changing", v7, 0xCu);

  }
  -[HDMCAnalysisManager _queue_analyzeIfNeeded](self, "_queue_analyzeIfNeeded", *(_OWORD *)v7);
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  id v4;
  HKFeatureSettings **p_queue_lastFeatureSettings;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_queue_lastFeatureSettings = &self->_queue_lastFeatureSettings;
  if (self->_queue_lastFeatureSettings)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "featureSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v7, "featureSettingsForFeatureIdentifier:error:", v8, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    if (v9)
    {
      v11 = objc_msgSend(v9, "projectionsEnabledSettingsHaveChangedFromFeatureSettings:", *p_queue_lastFeatureSettings);
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3030];
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          v14 = v12;
          v15 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v25 = v15;
          v16 = v15;
          _os_log_impl(&dword_21961B000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings changed: projections enabled changed, analyzing", buf, 0xCu);

        }
        -[HDMCAnalysisManager _queue_analyzeIfNeeded](self, "_queue_analyzeIfNeeded");
      }
      else if (v13)
      {
        v20 = v12;
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v25 = v21;
        v22 = v21;
        _os_log_impl(&dword_21961B000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings changed, not affecting projections enabled", buf, 0xCu);

      }
      objc_storeStrong((id *)p_queue_lastFeatureSettings, v9);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCAnalysisManager featureAvailabilityProvidingDidUpdateSettings:].cold.1();
    }

  }
  else
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      *(_DWORD *)buf = 138543362;
      v25 = (id)objc_opt_class();
      v19 = v25;
      _os_log_impl(&dword_21961B000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings changed: no cached settings, analyzing", buf, 0xCu);

    }
    -[HDMCAnalysisManager _queue_analyzeIfNeeded](self, "_queue_analyzeIfNeeded");
  }

}

- (id)_analyzeWithForceIncludeCycles:(BOOL)a3 forceAnalyzeCompleteHistory:(BOOL)a4 error:(id *)a5
{
  NSObject *queue;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__HDMCAnalysisManager__analyzeWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke;
  v11[3] = &unk_24DB21D88;
  v11[4] = self;
  v11[5] = &v20;
  v12 = a3;
  v13 = a4;
  v11[6] = &v14;
  dispatch_sync(queue, v11);
  v7 = (id)v15[5];
  v8 = v7;
  if (v7)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  v9 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __88__HDMCAnalysisManager__analyzeWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 57);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_queue_analyzeNowWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)analyzeWithError:(id *)a3
{
  return -[HDMCAnalysisManager _analyzeWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:](self, "_analyzeWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", 0, 0, a3);
}

- (void)_queue_analyzeIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HKObserverSet count](self->_userInitiatedObservers, "count"))
  {
    -[_HKDelayedOperation execute](self->_analyzeOperation, "execute");
  }
  else if (-[HKObserverSet count](self->_observers, "count"))
  {
    -[HDMCAnalysisManager _queue_enqueueMaintenanceOperationIfNeeded](self, "_queue_enqueueMaintenanceOperationIfNeeded");
  }
}

- (void)_queue_enqueueMaintenanceOperationIfNeeded
{
  void *v3;
  objc_class *v4;
  void *v5;
  OS_dispatch_queue *queue;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_maintenanceOperationQueued)
  {
    *(_WORD *)&self->_queue_needsMaintenanceAnalysis = 257;
    v3 = (void *)MEMORY[0x24BE40AF8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__HDMCAnalysisManager__queue_enqueueMaintenanceOperationIfNeeded__block_invoke;
    v15[3] = &unk_24DB21D60;
    v15[4] = self;
    objc_msgSend(v3, "maintenanceOperationWithName:queue:synchronousBlock:", v5, queue, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maintenanceWorkCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueMaintenanceOperation:", v7);

    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      v14 = v13;
      _os_log_impl(&dword_21961B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enqueued maintenance operation for analysis", buf, 0xCu);

    }
  }
}

uint64_t __65__HDMCAnalysisManager__queue_enqueueMaintenanceOperationIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runMaintenanceOperation");
}

- (void)_queue_runMaintenanceOperation
{
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_needsMaintenanceAnalysis)
  {
    -[_HKDelayedOperation execute](self->_analyzeOperation, "execute");
  }
  else
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_21961B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping maintenance operation for analysis since no longer needed", (uint8_t *)&v6, 0xCu);

    }
  }
  self->_queue_maintenanceOperationQueued = 0;
}

- (id)_queue_analyzeNowWithForceIncludeCycles:(BOOL)a3 forceAnalyzeCompleteHistory:(BOOL)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, uint64_t);
  void *v20;
  HDMCAnalysisManager *v21;
  id v22;
  uint64_t *v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMCAnalysisManager _takeAccessibilityAssertion](self, "_takeAccessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40B20], "contextForAccessibilityAssertion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCacheScope:", 1);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __97__HDMCAnalysisManager__queue_analyzeNowWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke;
  v20 = &unk_24DB21DB0;
  v23 = &v26;
  v21 = self;
  v13 = v9;
  v22 = v13;
  v24 = a3;
  v25 = a4;
  LODWORD(a5) = objc_msgSend(v12, "performWithTransactionContext:error:block:", v10, a5, &v17);

  if ((_DWORD)a5 && v27[5])
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_currentAnalysis, (id)v27[5]);
    os_unfair_lock_unlock(&self->_lock);
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  self->_queue_needsMaintenanceAnalysis = v14;
  objc_msgSend(v13, "invalidate", v17, v18, v19, v20, v21);
  v15 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v15;
}

BOOL __97__HDMCAnalysisManager__queue_analyzeNowWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (id)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(id)a3 forceIncludeCycles:(BOOL)a4 forceAnalyzeCompleteHistory:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  NSObject *v12;
  void *v13;
  HKMCAnalysis *test_analysis;
  id v15;
  HKObserverSet *observers;
  HKMCAnalysis *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  HDMCAnalysisManager *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  HKFeatureStatusManager *heartRateFeatureStatusManager;
  id v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  const __CFString *v41;
  HKFeatureStatusManager *wristTemperatureFeatureStatusManager;
  id v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  const __CFString *v48;
  HKFeatureStatusManager *deviationsFeatureStatusManager;
  id v50;
  NSArray *v51;
  NSArray *v52;
  NSArray *v53;
  NSArray *v54;
  NSArray *v55;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  int v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  HKCalendarCache *calendarCache;
  id v72;
  NSObject *v73;
  id v74;
  void *v75;
  BOOL v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  HDMCHeartStatisticsEnumerator *v86;
  id v87;
  HDMCHeartStatisticsEnumerator *v88;
  NSObject *v89;
  id v90;
  BOOL v91;
  id v92;
  NSObject *v93;
  void *v94;
  NSArray *v95;
  NSArray *v96;
  NSObject *v97;
  NSArray *v98;
  NSArray *v99;
  NSArray *v100;
  NSArray *v101;
  NSArray *v102;
  NSArray *v103;
  HDMCDaySummaryEnumerator *v104;
  id v105;
  NSObject *v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  BOOL v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  id v128;
  void *v129;
  id v130;
  HAMenstrualAlgorithmsAnalysis *test_algorithmsAnalysis;
  HAMenstrualAlgorithmsAnalysis *v132;
  NSObject *v133;
  _BOOL4 v134;
  NSObject *v135;
  NSObject *v136;
  void *v137;
  NSObject *v138;
  HAMenstrualAlgorithmsAnalysis *v139;
  HAMenstrualAlgorithmsAnalysis *v140;
  HAMenstrualAlgorithmsAnalysis *v141;
  uint64_t v142;
  void *v143;
  id v144;
  NSObject *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t j;
  void *v153;
  NSObject *v154;
  id v155;
  void *v156;
  id v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t k;
  void *v162;
  NSObject *v163;
  id v164;
  void *v165;
  id v166;
  NSArray *test_algorithmsCycles;
  NSArray *v168;
  NSArray *v169;
  void *v170;
  id v171;
  NSObject *v172;
  id v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t m;
  void *v178;
  void *v179;
  NSObject *v180;
  id v181;
  id v182;
  NSObject *v183;
  _BOOL4 v184;
  NSObject *v185;
  NSObject *v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  id v199;
  NSObject *v200;
  id v201;
  id v202;
  HKObserverSet *v203;
  NSArray *v204;
  NSArray *v205;
  NSObject *v206;
  void *v207;
  NSArray *v208;
  NSObject *v209;
  HAMenstrualAlgorithmsAnalysis *v210;
  NSObject *v212;
  NSArray *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  id v218;
  HDMCSymptomHistoryBuilder *v219;
  void *v220;
  HAMenstrualAlgorithmsAnalysis *v221;
  HDMCDaySummaryEnumerator *v222;
  uint64_t v223;
  id v224;
  uint64_t spid;
  HDMCSymptomHistoryBuilder *v226;
  void *v227;
  int v228;
  NSArray *v229;
  void *v230;
  uint64_t v231;
  NSArray *v232;
  unsigned int v233;
  NSArray *v234;
  int v235;
  NSArray *v236;
  NSArray *v237;
  id obj;
  id *location;
  id *v240;
  uint64_t v241;
  _BOOL4 v242;
  id v243;
  void *v244;
  HDMCAnalysisManager *v245;
  void *v246;
  _QWORD v247[4];
  NSArray *v248;
  id v249;
  id v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  id v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  id v264;
  _QWORD v265[5];
  id v266;
  NSArray *v267;
  HDMCSymptomHistoryBuilder *v268;
  id v269;
  uint64_t *v270;
  uint64_t *v271;
  uint64_t *v272;
  uint64_t *v273;
  uint64_t *v274;
  uint64_t *v275;
  uint64_t *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  char v280;
  char v281;
  id v282;
  uint64_t v283;
  uint64_t *v284;
  uint64_t v285;
  uint64_t v286;
  _QWORD v287[4];
  id v288;
  uint64_t *v289;
  uint64_t *v290;
  id v291;
  uint64_t v292;
  uint64_t *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t *v297;
  uint64_t v298;
  uint64_t v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  id v304;
  id v305;
  uint64_t v306;
  uint64_t *v307;
  uint64_t v308;
  uint64_t (*v309)(uint64_t, uint64_t);
  void (*v310)(uint64_t);
  id v311;
  uint64_t v312;
  uint64_t *v313;
  uint64_t v314;
  uint64_t (*v315)(uint64_t, uint64_t);
  void (*v316)(uint64_t);
  id v317;
  uint64_t v318;
  uint64_t *v319;
  uint64_t v320;
  uint64_t (*v321)(uint64_t, uint64_t);
  void (*v322)(uint64_t);
  id v323;
  uint64_t v324;
  uint64_t *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t *v333;
  uint64_t v334;
  uint64_t (*v335)(uint64_t, uint64_t);
  void (*v336)(uint64_t);
  id v337;
  id v338;
  id v339;
  id v340;
  id v341;
  _QWORD v342[5];
  _BYTE v343[128];
  _BYTE v344[128];
  uint8_t v345[128];
  uint8_t buf[4];
  id v347;
  __int16 v348;
  id v349;
  __int16 v350;
  id v351;
  __int16 v352;
  void *v353;
  __int16 v354;
  void *v355;
  __int16 v356;
  void *v357;
  __int16 v358;
  void *v359;
  _BYTE v360[128];
  uint64_t v361;

  v7 = a5;
  v8 = a4;
  v361 = *MEMORY[0x24BDAC8D0];
  v243 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v245 = self;
  if (self->_test_analysis)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      test_analysis = self->_test_analysis;
      *(_DWORD *)buf = 138543618;
      v347 = v13;
      v348 = 2112;
      v349 = test_analysis;
      v15 = v13;
      _os_log_impl(&dword_21961B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning test analysis: %@", buf, 0x16u);

    }
    observers = self->_observers;
    v342[0] = MEMORY[0x24BDAC760];
    v342[1] = 3221225472;
    v342[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke;
    v342[3] = &unk_24DB21DD8;
    v342[4] = self;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v342);
    v17 = self->_test_analysis;
    goto LABEL_213;
  }
  location = (id *)&self->_profile;
  v240 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "behavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "tinkerModeEnabled");

  if (!v21)
  {
    v27 = v245;
    if (-[HKObserverSet count](v245->_userInitiatedObservers, "count"))
    {
      v235 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v235 = objc_msgSend(v28, "isAppleWatch") | v8;

      v27 = v245;
    }
    -[HKCalendarCache currentCalendar](v27->_calendarCache, "currentCalendar");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = HKMCTodayIndex();
    v30 = objc_loadWeakRetained(location);
    objc_msgSend(v30, "featureSettingsManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x24BDD2E28];
    v341 = 0;
    objc_msgSend(v31, "featureSettingsForFeatureIdentifier:error:", v32, &v341);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = v341;

    if (obj)
    {
      heartRateFeatureStatusManager = v245->_heartRateFeatureStatusManager;
      v340 = v33;
      -[HKFeatureStatusManager featureStatusWithError:](heartRateFeatureStatusManager, "featureStatusWithError:", &v340);
      v237 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v35 = v340;

      if (v237)
      {
        v36 = *MEMORY[0x24BDD2CA8];
        -[NSArray objectForKeyedSubscript:](v237, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = objc_msgSend(v37, "areAllRequirementsSatisfied");

        _HKInitializeLogging();
        v38 = (id)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = (id)objc_opt_class();
          v40 = v39;
          v41 = CFSTR("NO");
          if (v233)
            v41 = CFSTR("YES");
          *(_DWORD *)buf = 138543618;
          v347 = v39;
          v348 = 2112;
          v349 = (id)v41;
          _os_log_impl(&dword_21961B000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Use heart rate input: %@", buf, 0x16u);

        }
        wristTemperatureFeatureStatusManager = v245->_wristTemperatureFeatureStatusManager;
        v339 = v35;
        -[HKFeatureStatusManager featureStatusWithError:](wristTemperatureFeatureStatusManager, "featureStatusWithError:", &v339);
        v236 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v43 = v339;

        if (v236)
        {
          -[NSArray objectForKeyedSubscript:](v236, "objectForKeyedSubscript:", v36);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v228 = objc_msgSend(v44, "areAllRequirementsSatisfied");

          _HKInitializeLogging();
          v45 = (id)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = (id)objc_opt_class();
            v47 = v46;
            v48 = CFSTR("NO");
            if (v228)
              v48 = CFSTR("YES");
            *(_DWORD *)buf = 138543618;
            v347 = v46;
            v348 = 2112;
            v349 = (id)v48;
            _os_log_impl(&dword_21961B000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Use wrist temperature input: %@", buf, 0x16u);

          }
          deviationsFeatureStatusManager = v245->_deviationsFeatureStatusManager;
          v338 = v43;
          -[HKFeatureStatusManager featureStatusWithError:](deviationsFeatureStatusManager, "featureStatusWithError:", &v338);
          v234 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v50 = v338;

          if (v245->_deviationsFeatureStatusManager && !v234)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
              -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.4();
            v51 = (NSArray *)v50;
            if (v51)
            {
              if (!v240)
              {
                v103 = v51;
                _HKLogDroppedError();
                v17 = 0;
                v51 = v103;
                v55 = v103;
                goto LABEL_209;
              }
              v51 = objc_retainAutorelease(v51);
              v17 = 0;
              *v240 = v51;
            }
            else
            {
              v17 = 0;
            }
            v55 = v51;
LABEL_209:

            v54 = v234;
            goto LABEL_210;
          }
          -[HDMCAnalysisManager _processorConfigurationForTodayIndex:deviationsFeatureStatus:calendar:](v245, "_processorConfigurationForTodayIndex:deviationsFeatureStatus:calendar:", v29, v234, v246);
          v229 = (NSArray *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void))v245->_dayStreamProcessorProvider + 2))();
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void))v245->_historicalAnalyzerProvider + 2))();
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v244)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v214, "handleFailureInMethod:object:file:lineNumber:description:", a2, v245, CFSTR("HDMCAnalysisManager.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processor"));

          }
          if (!v227)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v215, "handleFailureInMethod:object:file:lineNumber:description:", a2, v245, CFSTR("HDMCAnalysisManager.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("historicalAnalyzer"));

          }
          v226 = -[HDMCSymptomHistoryBuilder initWithCurrentDayIndex:]([HDMCSymptomHistoryBuilder alloc], "initWithCurrentDayIndex:", v29);
          v332 = 0;
          v333 = &v332;
          v334 = 0x3032000000;
          v335 = __Block_byref_object_copy__1;
          v336 = __Block_byref_object_dispose__1;
          v337 = 0;
          v328 = 0;
          v329 = &v328;
          v330 = 0x2020000000;
          v331 = 0;
          v324 = 0;
          v325 = &v324;
          v326 = 0x2020000000;
          v327 = 0;
          v318 = 0;
          v319 = &v318;
          v320 = 0x3032000000;
          v321 = __Block_byref_object_copy__1;
          v322 = __Block_byref_object_dispose__1;
          v323 = 0;
          v312 = 0;
          v313 = &v312;
          v314 = 0x3032000000;
          v315 = __Block_byref_object_copy__1;
          v316 = __Block_byref_object_dispose__1;
          v317 = 0;
          v306 = 0;
          v307 = &v306;
          v308 = 0x3032000000;
          v309 = __Block_byref_object_copy__1;
          v310 = __Block_byref_object_dispose__1;
          v311 = 0;
          _HKLogPersistedSignposts();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          spid = _HKLogSignpostIDGenerate();

          _HKInitializeLogging();
          _HKLogPersistedSignposts();
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = os_signpost_enabled(v57);

          if (v58)
          {
            _HKLogPersistedSignposts();
            v59 = objc_claimAutoreleasedReturnValue();
            v60 = v59;
            if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v233);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v347 = v61;
              _os_signpost_emit_with_name_impl(&dword_21961B000, v60, OS_SIGNPOST_INTERVAL_BEGIN, spid, "menstrual-cycles-analysis", "useHeartRateInput=%@", buf, 0xCu);

            }
          }
          if (-[HKObserverSet count](v245->_userInitiatedObservers, "count"))
            v62 = 1;
          else
            v62 = v7;
          v63 = v62 == 0;
          v223 = *MEMORY[0x24BDD3870] + 1;
          if (v62)
            v64 = *(_QWORD *)(MEMORY[0x24BDD2B60] + 8);
          else
            v64 = *MEMORY[0x24BDD3870] + 1;
          v241 = v64;
          v65 = v29 - *MEMORY[0x24BDD3870] + 1;
          if (v63)
            v66 = v29 - *MEMORY[0x24BDD3870] + 1;
          else
            v66 = *MEMORY[0x24BDD2B60];
          v231 = v66;
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "hk_morningIndexWithCalendar:", v246);

          v69 = (void *)MEMORY[0x24BE40A50];
          v70 = objc_loadWeakRetained(location);
          calendarCache = v245->_calendarCache;
          v305 = v50;
          objc_msgSend(v69, "hdmc_ongoingFactorsOnDayIndex:profile:calendarCache:error:", v65, v70, calendarCache, &v305);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v305;

          _HKInitializeLogging();
          v73 = (id)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            v74 = (id)objc_opt_class();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v230, "count"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v347 = v74;
            v348 = 2112;
            v349 = v75;
            _os_log_impl(&dword_21961B000, v73, OS_LOG_TYPE_DEFAULT, "[%{public}@] Total ongoing cycle factors that overlap time range: %@", buf, 0x16u);

          }
          if (v230)
          {
            v304 = v72;
            v76 = -[HDMCAnalysisManager initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:error:](v245, "initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:error:", v243, &v304);
            v77 = v304;

            if (v76)
            {
              v302 = 0u;
              v303 = 0u;
              v300 = 0u;
              v301 = 0u;
              v78 = v230;
              v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v300, v360, 16);
              if (v79)
              {
                v80 = *(_QWORD *)v301;
                do
                {
                  for (i = 0; i != v79; ++i)
                  {
                    if (*(_QWORD *)v301 != v80)
                      objc_enumerationMutation(v78);
                    v82 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * i);
                    objc_msgSend(v82, "hkmc_cycleFactor");
                    v83 = HAMenstrualAlgorithmsPhaseFromHKMCCycleFactor();
                    objc_msgSend(v82, "startDate");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v244, "beginPhase:onJulianDay:", v83, objc_msgSend(v84, "hk_dayIndexWithCalendar:", v246));

                  }
                  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v300, v360, 16);
                }
                while (v79);
              }

              v85 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v296 = 0;
              v297 = &v296;
              v298 = 0x2020000000;
              v299 = 0;
              v292 = 0;
              v293 = &v292;
              v294 = 0x2020000000;
              v295 = 0;
              if (v233)
              {
                v86 = [HDMCHeartStatisticsEnumerator alloc];
                v87 = objc_loadWeakRetained(location);
                v88 = -[HDMCHeartStatisticsEnumerator initWithProfile:calendarCache:dayIndexRange:databaseAccessibilityAssertion:](v86, "initWithProfile:calendarCache:dayIndexRange:databaseAccessibilityAssertion:", v87, v245->_calendarCache, v68 - 100, 100, v243);

                _HKInitializeLogging();
                v89 = (id)*MEMORY[0x24BDD3030];
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                {
                  v90 = (id)objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  v347 = v90;
                  _os_log_impl(&dword_21961B000, v89, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enumerating heart rate statistics", buf, 0xCu);

                }
                v291 = v77;
                v287[0] = MEMORY[0x24BDAC760];
                v287[1] = 3221225472;
                v287[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_232;
                v287[3] = &unk_24DB21E00;
                v288 = v85;
                v289 = &v296;
                v290 = &v292;
                v91 = -[HDMCHeartStatisticsEnumerator enumerateWithError:handler:](v88, "enumerateWithError:handler:", &v291, v287);
                v92 = v291;

                if (!v91)
                {
                  _HKInitializeLogging();
                  v93 = (id)*MEMORY[0x24BDD3030];
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    v94 = (void *)objc_opt_class();
                    -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.10(v94);
                  }

                }
              }
              else
              {
                v92 = v77;
              }
              v104 = [HDMCDaySummaryEnumerator alloc];
              v105 = objc_loadWeakRetained(location);
              LOBYTE(v216) = v228;
              v222 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v104, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v105, v245->_calendarCache, v231, v241, 1, 1, v216);

              _HKInitializeLogging();
              v106 = (id)*MEMORY[0x24BDD3030];
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                v107 = (id)objc_opt_class();
                *(_DWORD *)buf = 138543362;
                v347 = v107;
                _os_log_impl(&dword_21961B000, v106, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enumerating day summaries", buf, 0xCu);

              }
              v283 = 0;
              v284 = &v283;
              v285 = 0x2020000000;
              v286 = v68 - 101;
              v282 = v92;
              v265[0] = MEMORY[0x24BDAC760];
              v265[1] = 3221225472;
              v265[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_235;
              v265[3] = &unk_24DB21E28;
              v277 = v65;
              v278 = v223;
              v265[4] = v245;
              v270 = &v328;
              v280 = v233;
              v266 = v244;
              v271 = &v283;
              v232 = (NSArray *)v85;
              v267 = v232;
              v279 = v29;
              v108 = v266;
              v219 = v226;
              v268 = v219;
              v272 = &v332;
              v273 = &v318;
              v274 = &v312;
              v281 = v235;
              v275 = &v306;
              v276 = &v324;
              v218 = v227;
              v269 = v218;
              v242 = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v222, "enumerateWithError:handler:", &v282, v265);
              v224 = v282;

              if (v233)
              {
                v109 = v284[3];
                if (v109 < v68 - 1)
                {
                  v110 = v109 + 1;
                  do
                  {
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v110);
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSArray objectForKeyedSubscript:](v232, "objectForKeyedSubscript:", v111);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = v112 == 0;

                    if (!v113)
                    {
                      v114 = (void *)MEMORY[0x24BE3F588];
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v110);
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSArray objectForKeyedSubscript:](v232, "objectForKeyedSubscript:", v115);
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v114, "hkmc_dayInputWithHeartStatistics:", v116);
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v108, "appendDay:", v117);

                    }
                    v284[3] = v110++;
                  }
                  while (v68 != v110);
                }
              }
              _HKInitializeLogging();
              v118 = (id)*MEMORY[0x24BDD3030];
              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                v119 = (id)objc_opt_class();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v329[3]);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray birthDateComponents](v229, "birthDateComponents");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "hk_dayIndexDateDescription");
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                HKSensitiveLogItem();
                v122 = (id)objc_claimAutoreleasedReturnValue();
                -[NSArray userReportedCycleLength](v229, "userReportedCycleLength");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray julianDayOfUserReportedCycleLength](v229, "julianDayOfUserReportedCycleLength");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray userReportedMenstruationLength](v229, "userReportedMenstruationLength");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray julianDayOfUserReportedMenstruationLength](v229, "julianDayOfUserReportedMenstruationLength");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544898;
                v347 = v119;
                v348 = 2112;
                v349 = v120;
                v350 = 2112;
                v351 = v122;
                v352 = 2112;
                v353 = v123;
                v354 = 2112;
                v355 = v124;
                v356 = 2112;
                v357 = v125;
                v358 = 2112;
                v359 = v126;
                _os_log_impl(&dword_21961B000, v118, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing %@ summaries with user entered birthdate: %@, cycle length: %@ (%@), period length: %@ (%@)", buf, 0x48u);

              }
              if (v235)
              {
                _HKInitializeLogging();
                v127 = (id)*MEMORY[0x24BDD3030];
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  v128 = (id)objc_opt_class();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v325[3]);
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v347 = v128;
                  v348 = 2112;
                  v349 = v129;
                  _os_log_impl(&dword_21961B000, v127, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing %@ summaries for cycles", buf, 0x16u);

                }
              }
              else
              {
                _HKInitializeLogging();
                v127 = (id)*MEMORY[0x24BDD3030];
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  v130 = (id)objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  v347 = v130;
                  _os_log_impl(&dword_21961B000, v127, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not analyzing for cycles", buf, 0xCu);

                }
              }

              if (v242)
              {
                test_algorithmsAnalysis = v245->_test_algorithmsAnalysis;
                if (test_algorithmsAnalysis)
                {
                  v132 = test_algorithmsAnalysis;
                  goto LABEL_142;
                }
                v142 = objc_msgSend((id)v307[5], "integerValue");
                v264 = v224;
                objc_msgSend(v108, "analyzeWithMostRecentMenstrualFlowJulianDayUpdated:error:", v142, &v264);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = v264;

                v132 = v143;
                if (v132)
                {
                  v224 = v144;
LABEL_142:
                  _HKInitializeLogging();
                  v221 = v132;
                  v145 = (id)*MEMORY[0x24BDD3030];
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                  {
                    v146 = (id)objc_opt_class();
                    -[HAMenstrualAlgorithmsAnalysis hkmc_description](v132, "hkmc_description");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    HKSensitiveLogItem();
                    v148 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v347 = v146;
                    v348 = 2112;
                    v349 = v148;
                    _os_log_impl(&dword_21961B000, v145, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received analysis from algorithms: %@", buf, 0x16u);

                  }
                  v262 = 0u;
                  v263 = 0u;
                  v260 = 0u;
                  v261 = 0u;
                  -[HAMenstrualAlgorithmsAnalysis menstruationPredictions](v221, "menstruationPredictions");
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v260, v345, 16);
                  if (v150)
                  {
                    v151 = *(_QWORD *)v261;
                    do
                    {
                      for (j = 0; j != v150; ++j)
                      {
                        if (*(_QWORD *)v261 != v151)
                          objc_enumerationMutation(v149);
                        v153 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * j);
                        _HKInitializeLogging();
                        v154 = (id)*MEMORY[0x24BDD3030];
                        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                        {
                          v155 = (id)objc_opt_class();
                          objc_msgSend(v153, "hkmc_description");
                          v156 = (void *)objc_claimAutoreleasedReturnValue();
                          HKSensitiveLogItem();
                          v157 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          v347 = v155;
                          v348 = 2112;
                          v349 = v157;
                          _os_log_impl(&dword_21961B000, v154, OS_LOG_TYPE_DEFAULT, "[%{public}@] Menstruation prediction: %@", buf, 0x16u);

                        }
                      }
                      v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v260, v345, 16);
                    }
                    while (v150);
                  }

                  v258 = 0u;
                  v259 = 0u;
                  v256 = 0u;
                  v257 = 0u;
                  -[HAMenstrualAlgorithmsAnalysis fertilityPredictions](v221, "fertilityPredictions");
                  v158 = (void *)objc_claimAutoreleasedReturnValue();
                  v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v256, v344, 16);
                  if (v159)
                  {
                    v160 = *(_QWORD *)v257;
                    do
                    {
                      for (k = 0; k != v159; ++k)
                      {
                        if (*(_QWORD *)v257 != v160)
                          objc_enumerationMutation(v158);
                        v162 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * k);
                        _HKInitializeLogging();
                        v163 = (id)*MEMORY[0x24BDD3030];
                        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                        {
                          v164 = (id)objc_opt_class();
                          objc_msgSend(v162, "hkmc_description");
                          v165 = (void *)objc_claimAutoreleasedReturnValue();
                          HKSensitiveLogItem();
                          v166 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          v347 = v164;
                          v348 = 2112;
                          v349 = v166;
                          _os_log_impl(&dword_21961B000, v163, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fertility prediction: %@", buf, 0x16u);

                        }
                      }
                      v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v256, v344, 16);
                    }
                    while (v159);
                  }

                  if (v235)
                  {
                    test_algorithmsCycles = v245->_test_algorithmsCycles;
                    if (test_algorithmsCycles)
                    {
                      v168 = test_algorithmsCycles;
                    }
                    else
                    {
                      v255 = v224;
                      objc_msgSend(v218, "analyzeWithError:", &v255);
                      v170 = (void *)objc_claimAutoreleasedReturnValue();
                      v171 = v255;

                      v168 = v170;
                      if (!v168)
                      {
                        _HKInitializeLogging();
                        v212 = (id)*MEMORY[0x24BDD3030];
                        if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
                        {
                          objc_opt_class();
                          -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.7();
                        }

                        v213 = (NSArray *)v171;
                        v169 = v213;
                        if (v213)
                        {
                          if (v240)
                          {
                            v169 = objc_retainAutorelease(v213);
                            v17 = 0;
                            *v240 = v169;
                            v55 = v169;
                            goto LABEL_206;
                          }
                          _HKLogDroppedError();
                        }
                        v17 = 0;
                        v55 = v169;
                        goto LABEL_206;
                      }
                      v224 = v171;
                    }
                    _HKInitializeLogging();
                    v172 = (id)*MEMORY[0x24BDD3030];
                    if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                    {
                      v173 = (id)objc_opt_class();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](v168, "count"));
                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v347 = v173;
                      v348 = 2112;
                      v349 = v174;
                      _os_log_impl(&dword_21961B000, v172, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %@ cycles from historical analyzer", buf, 0x16u);

                    }
                    v253 = 0u;
                    v254 = 0u;
                    v251 = 0u;
                    v252 = 0u;
                    v169 = v168;
                    v175 = -[NSArray countByEnumeratingWithState:objects:count:](v169, "countByEnumeratingWithState:objects:count:", &v251, v343, 16);
                    if (v175)
                    {
                      v176 = *(_QWORD *)v252;
                      do
                      {
                        for (m = 0; m != v175; ++m)
                        {
                          if (*(_QWORD *)v252 != v176)
                            objc_enumerationMutation(v169);
                          v178 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * m);
                          _HKInitializeLogging();
                          v179 = (void *)*MEMORY[0x24BDD3030];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEBUG))
                          {
                            v180 = v179;
                            if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
                            {
                              v181 = (id)objc_opt_class();
                              objc_msgSend(v178, "hkmc_description");
                              v182 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              v347 = v181;
                              v348 = 2112;
                              v349 = v182;
                              _os_log_debug_impl(&dword_21961B000, v180, OS_LOG_TYPE_DEBUG, "[%{public}@] Cycle: %@", buf, 0x16u);

                            }
                          }
                        }
                        v175 = -[NSArray countByEnumeratingWithState:objects:count:](v169, "countByEnumeratingWithState:objects:count:", &v251, v343, 16);
                      }
                      while (v175);
                    }

                  }
                  else
                  {
                    v169 = 0;
                  }
                  _HKInitializeLogging();
                  _HKLogPersistedSignposts();
                  v183 = objc_claimAutoreleasedReturnValue();
                  v184 = os_signpost_enabled(v183);

                  if (v184)
                  {
                    _HKLogPersistedSignposts();
                    v185 = objc_claimAutoreleasedReturnValue();
                    v186 = v185;
                    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v185))
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v233);
                      v187 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v347 = v187;
                      _os_signpost_emit_with_name_impl(&dword_21961B000, v186, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-analysis", "useHeartRateInput=%@", buf, 0xCu);

                    }
                  }
                  v188 = -[HDMCSymptomHistoryBuilder recentSymptoms](v219, "recentSymptoms");
                  v189 = v333[5];
                  v190 = v319[5];
                  v191 = v313[5];
                  v192 = v297[3];
                  v193 = v293[3];
                  -[NSArray onboardingRecord](v234, "onboardingRecord");
                  v194 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v194, "featureSettings");
                  v195 = (void *)objc_claimAutoreleasedReturnValue();
                  BYTE1(v217) = v228;
                  LOBYTE(v217) = v233;
                  -[HDMCAnalysisManager _analysisWithAlgorithmsAnalysis:algorithmsCycles:recentSymptoms:mostRecentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:featureSettings:useHeartRateInput:useWristTemperatureInput:deviationsFeatureSettings:](v245, "_analysisWithAlgorithmsAnalysis:algorithmsCycles:recentSymptoms:mostRecentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:featureSettings:useHeartRateInput:useWristTemperatureInput:deviationsFeatureSettings:", v221, v169, v188, v189, v190, v191, v192, v193, obj, v217, v195);
                  v196 = (void *)objc_claimAutoreleasedReturnValue();

                  v197 = (void *)MEMORY[0x24BE40BC0];
                  v250 = 0;
                  v198 = objc_loadWeakRetained(location);
                  v249 = v224;
                  LOBYTE(v194) = objc_msgSend(v197, "hdmc_analysisSampleInfo:forProfile:error:", &v250, v198, &v249);
                  v199 = v250;
                  v55 = (NSArray *)v249;

                  if ((v194 & 1) != 0)
                  {
                    objc_msgSend(v196, "setLatestSampleInfo:", v199);
                    _HKInitializeLogging();
                    v200 = (id)*MEMORY[0x24BDD3030];
                    if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
                    {
                      v201 = (id)objc_opt_class();
                      HKSensitiveLogItem();
                      v202 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v347 = v201;
                      v348 = 2112;
                      v349 = v202;
                      _os_log_impl(&dword_21961B000, v200, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did update analysis: %@", buf, 0x16u);

                    }
                    objc_storeStrong((id *)&v245->_queue_lastFeatureSettings, obj);
                    v203 = v245->_observers;
                    v247[0] = MEMORY[0x24BDAC760];
                    v247[1] = 3221225472;
                    v247[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_239;
                    v247[3] = &unk_24DB21DD8;
                    v204 = v196;
                    v248 = v204;
                    -[HKObserverSet notifyObservers:](v203, "notifyObservers:", v247);
                    v17 = v204;
                    v205 = v248;
                    goto LABEL_205;
                  }
                  _HKInitializeLogging();
                  v206 = (id)*MEMORY[0x24BDD3030];
                  if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
                  {
                    v207 = (void *)objc_opt_class();
                    -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.8(v207);
                  }

                  v208 = v55;
                  v205 = v208;
                  if (v208)
                  {
                    if (v240)
                    {
                      v205 = objc_retainAutorelease(v208);
                      v17 = 0;
                      *v240 = v205;
LABEL_205:

LABEL_206:
                      v140 = v221;
                      goto LABEL_207;
                    }
                    _HKLogDroppedError();
                  }
                  v17 = 0;
                  goto LABEL_205;
                }
                _HKInitializeLogging();
                v209 = (id)*MEMORY[0x24BDD3030];
                if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
                {
                  objc_opt_class();
                  -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.6();
                }

                v210 = (HAMenstrualAlgorithmsAnalysis *)v144;
                v140 = v210;
                if (v210)
                {
                  if (v240)
                  {
                    v141 = objc_retainAutorelease(v210);
                    goto LABEL_136;
                  }
                  _HKLogDroppedError();
                }
              }
              else
              {
                _HKInitializeLogging();
                _HKLogPersistedSignposts();
                v133 = objc_claimAutoreleasedReturnValue();
                v134 = os_signpost_enabled(v133);

                if (v134)
                {
                  _HKLogPersistedSignposts();
                  v135 = objc_claimAutoreleasedReturnValue();
                  v136 = v135;
                  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
                  {
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v233);
                    v137 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v347 = v137;
                    _os_signpost_emit_with_name_impl(&dword_21961B000, v136, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-analysis", "useHeartRateInput=%@", buf, 0xCu);

                  }
                }
                _HKInitializeLogging();
                v138 = (id)*MEMORY[0x24BDD3030];
                if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
                {
                  objc_opt_class();
                  -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.9();
                }

                v139 = (HAMenstrualAlgorithmsAnalysis *)v224;
                v140 = v139;
                if (v139)
                {
                  if (v240)
                  {
                    v141 = objc_retainAutorelease(v139);
LABEL_136:
                    v17 = 0;
                    v140 = v141;
                    *v240 = v141;
                    v55 = (NSArray *)v141;
LABEL_207:

                    _Block_object_dispose(&v283, 8);
                    _Block_object_dispose(&v292, 8);
                    _Block_object_dispose(&v296, 8);
                    v99 = v232;
                    goto LABEL_208;
                  }
                  _HKLogDroppedError();
                }
              }
              v17 = 0;
              v55 = (NSArray *)v140;
              goto LABEL_207;
            }
            v101 = (NSArray *)v77;
            v99 = v101;
            if (v101)
            {
              if (v240)
              {
                v100 = objc_retainAutorelease(v101);
                goto LABEL_104;
              }
              _HKLogDroppedError();
            }
          }
          else
          {
            _HKInitializeLogging();
            v97 = (id)*MEMORY[0x24BDD3030];
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              objc_opt_class();
              -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.5();
            }

            v98 = (NSArray *)v72;
            v99 = v98;
            if (v98)
            {
              if (v240)
              {
                v100 = objc_retainAutorelease(v98);
LABEL_104:
                v17 = 0;
                v99 = v100;
                *v240 = v100;
                v55 = v100;
LABEL_208:

                _Block_object_dispose(&v306, 8);
                _Block_object_dispose(&v312, 8);

                _Block_object_dispose(&v318, 8);
                _Block_object_dispose(&v324, 8);
                _Block_object_dispose(&v328, 8);
                _Block_object_dispose(&v332, 8);

                v51 = v229;
                goto LABEL_209;
              }
              _HKLogDroppedError();
            }
          }
          v17 = 0;
          v55 = v99;
          goto LABEL_208;
        }
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.3();
        v54 = (NSArray *)v43;
        if (v54)
        {
          if (!v240)
          {
            v102 = v54;
            _HKLogDroppedError();
            v17 = 0;
            v54 = v102;
            v55 = v102;
            goto LABEL_210;
          }
          v54 = objc_retainAutorelease(v54);
          v17 = 0;
          *v240 = v54;
        }
        else
        {
          v17 = 0;
        }
        v55 = v54;
LABEL_210:

        v53 = v236;
        goto LABEL_211;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.2();
      v53 = (NSArray *)v35;
      if (v53)
      {
        if (!v240)
        {
          v96 = v53;
          _HKLogDroppedError();
          v17 = 0;
          v53 = v96;
          v55 = v96;
          goto LABEL_211;
        }
        v53 = objc_retainAutorelease(v53);
        v17 = 0;
        *v240 = v53;
      }
      else
      {
        v17 = 0;
      }
      v55 = v53;
LABEL_211:

      v52 = v237;
      goto LABEL_212;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.1();
    v52 = (NSArray *)v33;
    if (v52)
    {
      if (!v240)
      {
        v95 = v52;
        _HKLogDroppedError();
        v17 = 0;
        v52 = v95;
        v55 = v95;
        goto LABEL_212;
      }
      v52 = objc_retainAutorelease(v52);
      v17 = 0;
      *v240 = v52;
    }
    else
    {
      v17 = 0;
    }
    v55 = v52;
LABEL_212:

    goto LABEL_213;
  }
  _HKInitializeLogging();
  v22 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    *(_DWORD *)buf = 138543362;
    v347 = (id)objc_opt_class();
    v24 = v347;
    _os_log_impl(&dword_21961B000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping analysis since this is not a primary profile", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_featureUnavailableForProfileError");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if (v240)
      *v240 = objc_retainAutorelease(v25);
    else
      _HKLogDroppedError();
  }

  v17 = 0;
LABEL_213:

  return v17;
}

uint64_t __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateAnalysis:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
}

void __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_232(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)a1[4];
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "dayIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  objc_msgSend(v5, "tenthPercentileAsleepHeartRateStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v5, "tenthPercentileAwakeHeartRateStatistics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

void __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_235(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;

  v45 = a2;
  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    objc_msgSend(v45, "_daySummaryWithOverrideSourceIDBySourceID:ignoreCycleFactors:ignoreOvulationTestResults:", 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "internalCycleFactorsOverrideEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "internalIgnoreOvulationTestResultsEnabled"));
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v3;
  }
  else
  {
    v4 = v45;
  }
  v46 = v4;
  v5 = objc_msgSend(v4, "dayIndex");
  objc_msgSend(MEMORY[0x24BE3F588], "hkmc_dayInputWithDaySummary:", v46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 128);
  if (v5 >= v7 && v5 - v7 < *(_QWORD *)(a1 + 136))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BE3F588], "hkmc_emptyDayInputWithDayIndex:", v7 - 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendDay:", v10);

    }
    if (*(_BYTE *)(a1 + 152))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + 1;
      if (v11 < v5)
      {
        do
        {
          v12 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = (void *)MEMORY[0x24BE3F588];
            v16 = *(void **)(a1 + 40);
            v17 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "hkmc_dayInputWithHeartStatistics:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendDay:", v20);

          }
          ++v11;
        }
        while (v5 != v11);
      }
      v21 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hkmc_updateWithHeartStatistics:", v26);

      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v5;
    }
    objc_msgSend(*(id *)(a1 + 40), "appendDay:", v6);
    objc_msgSend(*(id *)(a1 + 56), "addSymptoms:forDayIndex:", objc_msgSend(v46, "symptoms"), v5);
    objc_msgSend(v46, "basalBodyTemperature");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = *(_QWORD *)(a1 + 144) - 14;

      if (v5 > v28)
      {
        objc_msgSend(v46, "basalBodyTemperature");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v31 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;

      }
    }
    if ((objc_msgSend(v46, "isDataLogged") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = v32;
    }
    else
    {
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v36 = *(id *)(v35 + 40);
      v34 = *(void **)(v35 + 40);
      *(_QWORD *)(v35 + 40) = v36;
    }

    if (objc_msgSend(v46, "menstrualFlow"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v46, "dayIndex"));
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v46, "menstrualFlowModificationDayIndex"));
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
      v42 = *(void **)(v41 + 40);
      *(_QWORD *)(v41 + 40) = v40;

    }
    HKMCAppendCycleFactorsPhaseFromDaySummary();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  if (*(_BYTE *)(a1 + 153))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
    {
      v43 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x24BE3F588], "hkmc_emptyDayInputWithDayIndex:", v5 - 10);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "appendDay:", v44);

    }
    HKMCAppendCycleFactorsPhaseFromDaySummary();
    objc_msgSend(*(id *)(a1 + 64), "appendDay:", v6);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
  }

}

uint64_t __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_239(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateAnalysis:", *(_QWORD *)(a1 + 32));
}

- (void)_forceDisablePredictionsFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id WeakRetained;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "behavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCompanionCapable");

  if (v15)
  {
    -[HKMCSettingsManager forceDisableProjectionsFromOngoingCycleFactors:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:useHeartRateInput:useWristTemperatureInput:](self->_settingsManager, "forceDisableProjectionsFromOngoingCycleFactors:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:useHeartRateInput:useWristTemperatureInput:", v20, v10, v9, v8, v7);
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v16, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "behavior");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isAppleWatch");

    if (v19)
      -[HKMCSettingsManager setProjectionAttributesOnWatchFromUseHeartRateInput:useWristTemperatureInput:](self->_settingsManager, "setProjectionAttributesOnWatchFromUseHeartRateInput:useWristTemperatureInput:", v8, v7);
  }

}

- (id)_analysisWithAlgorithmsAnalysis:(id)a3 algorithmsCycles:(id)a4 recentSymptoms:(unint64_t)a5 mostRecentBasalBodyTemperature:(id)a6 lastLoggedDayIndex:(id)a7 lastMenstrualFlowDayIndex:(id)a8 numberOfDailySleepHeartRateStatisticsForPast100Days:(int64_t)a9 numberOfDailyAwakeHeartRateStatisticsForPast100Days:(int64_t)a10 featureSettings:(id)a11 useHeartRateInput:(BOOL)a12 useWristTemperatureInput:(BOOL)a13 deviationsFeatureSettings:(id)a14
{
  uint64_t v19;
  uint64_t v20;
  HDProfile **p_profile;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  os_log_t *v38;
  id v39;
  void *v40;
  os_log_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  os_log_t v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  os_log_t v63;
  NSObject *v64;
  void *v65;
  const __CFString *v66;
  const __CFString *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  __CFString *v75;
  __CFString *v76;
  void *v77;
  int v78;
  os_log_t v79;
  NSObject *v80;
  void *v81;
  id v82;
  os_log_t v83;
  NSObject *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  HDMCAnalysisManager *v101;
  id v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id obj;
  unsigned int obja;
  id v113;
  unsigned int v114;
  id v115;
  id v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[5];
  id v120;
  uint64_t v121;
  BOOL v122;
  char v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  const __CFString *v132;
  __int16 v133;
  const __CFString *v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  v110 = a3;
  v109 = a4;
  v108 = a6;
  v107 = a7;
  v103 = a8;
  v106 = a11;
  v99 = a14;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v116 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  HKMCCycleFactorsTypes();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
  v101 = self;
  if (v19)
  {
    v20 = v19;
    v113 = *(id *)v126;
    p_profile = &self->_profile;
    v22 = 0;
    v23 = *MEMORY[0x24BE40E68];
    do
    {
      v24 = 0;
      v25 = v22;
      do
      {
        if (*(id *)v126 != v113)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v24);
        v27 = (void *)MEMORY[0x24BE40BC0];
        WeakRetained = objc_loadWeakRetained((id *)p_profile);
        objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HDSampleEntityPredicateForEndDate();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = v25;
        objc_msgSend(v27, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v26, WeakRetained, 0, v30, v23, 0, &v124);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v124;

        objc_msgSend(v116, "addObjectsFromArray:", v31);
        ++v24;
        v25 = v22;
      }
      while (v20 != v24);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
    }
    while (v20);
  }
  else
  {
    v22 = 0;
  }

  v32 = objc_msgSend(v106, "menstruationProjectionsEnabled");
  v33 = objc_msgSend(v106, "fertileWindowProjectionsEnabled");
  v34 = (void *)objc_msgSend(v116, "copy");
  obja = v32;
  v114 = v33;
  -[HDMCAnalysisManager _forceDisablePredictionsFromOngoingCycleFactors:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:useHeartRateInput:useWristTemperatureInput:](v101, "_forceDisablePredictionsFromOngoingCycleFactors:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:useHeartRateInput:useWristTemperatureInput:", v34, v32, v33, a12, a13);

  v35 = v110;
  objc_msgSend(v110, "hkmc_statistics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "cycleLengthMedian");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (os_log_t *)MEMORY[0x24BDD3030];
  v104 = v36;
  if (!v37)
  {
    v39 = objc_loadWeakRetained((id *)&v101->_profile);
    _UserCharacteristicOfType(v39, (void *)*MEMORY[0x24BDD42D8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v41 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = (void *)objc_opt_class();
      v44 = v43;
      HKSensitiveLogItem();
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v130 = v43;
      v131 = 2112;
      v132 = v45;
      _os_log_impl(&dword_21961B000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing statistics cycle length with user entered cycle length: %@", buf, 0x16u);

      v35 = v110;
    }
    if (v40)
    {
      v46 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValueForUnit:", v47);
      objc_msgSend(v46, "numberWithDouble:");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setCycleLengthMedian:", v48);
    }

  }
  objc_msgSend(v36, "menstruationLengthMedian");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    v50 = objc_loadWeakRetained((id *)&v101->_profile);
    _UserCharacteristicOfType(v50, (void *)*MEMORY[0x24BDD42E0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v52 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = (void *)objc_opt_class();
      v55 = v54;
      HKSensitiveLogItem();
      v56 = v35;
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v130 = v54;
      v131 = 2112;
      v132 = v57;
      _os_log_impl(&dword_21961B000, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing statistics period length with user entered period length: %@", buf, 0x16u);

      v35 = v56;
      v36 = v104;

    }
    if (v51)
    {
      v58 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValueForUnit:", v59);
      objc_msgSend(v58, "numberWithDouble:");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setMenstruationLengthMedian:", v60);
    }

  }
  if (a13)
  {
    -[HKMCSettingsManager dayStreamProcessorPredictionPrimarySourceOverride](v101->_settingsManager, "dayStreamProcessorPredictionPrimarySourceOverride");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v105 = 0;
  }
  if (obja)
    v61 = -[HKMCSettingsManager areAllMenstruationPredictionAlgorithmAttributesSupported](v101->_settingsManager, "areAllMenstruationPredictionAlgorithmAttributesSupported");
  else
    v61 = 0;
  if (v114)
    v62 = -[HKMCSettingsManager areAllFertileWindowPredictionAlgorithmAttributesSupported](v101->_settingsManager, "areAllFertileWindowPredictionAlgorithmAttributesSupported");
  else
    v62 = 0;
  _HKInitializeLogging();
  v63 = *v38;
  if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
  {
    v64 = v63;
    v65 = (void *)objc_opt_class();
    v66 = CFSTR("OFF");
    if (v61)
      v67 = CFSTR("ON");
    else
      v67 = CFSTR("OFF");
    *(_DWORD *)buf = 138543874;
    v130 = v65;
    v132 = v67;
    v131 = 2112;
    if (v62)
      v66 = CFSTR("ON");
    v133 = 2112;
    v134 = v66;
    v68 = v65;
    _os_log_impl(&dword_21961B000, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] Surfacing analysis with period predictions: %@, fertility predictions: %@", buf, 0x20u);

  }
  if (v61)
  {
    objc_msgSend(v35, "hkmc_menstruationProjections");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v62)
    {
LABEL_40:
      v69 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_43;
    }
  }
  else
  {
    v98 = (void *)MEMORY[0x24BDBD1A8];
    if (!v62)
      goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarCache currentCalendar](v101->_calendarCache, "currentCalendar");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource:currentDayIndex:", v105, objc_msgSend(v70, "hk_dayIndexWithCalendar:", v71));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
  objc_msgSend(v69, "subarrayWithRange:", 0, objc_msgSend(v69, "count") != 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = MEMORY[0x24BDAC760];
  if (v109)
  {
    v73 = objc_msgSend(v109, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v73);
    v119[0] = v72;
    v119[1] = 3221225472;
    v119[2] = __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke;
    v119[3] = &unk_24DB21E50;
    v120 = (id)objc_claimAutoreleasedReturnValue();
    v121 = v73;
    v122 = a13;
    v119[4] = v101;
    v123 = v114;
    v74 = v120;
    objc_msgSend(v109, "enumerateObjectsWithOptions:usingBlock:", 2, v119);
    v96 = (void *)objc_msgSend(v74, "copy");

  }
  else
  {
    v96 = 0;
  }
  objc_msgSend(v35, "hkmc_deviations");
  v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v117[0] = v72;
  v117[1] = 3221225472;
  v117[2] = __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke_2;
  v117[3] = &unk_24DB21E78;
  v100 = v99;
  v118 = v100;
  -[__CFString hk_filter:](v75, "hk_filter:", v117);
  v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "showSensitiveLogItems");

  if (v78)
  {
    _HKInitializeLogging();
    v79 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v80 = v79;
      v81 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v130 = v81;
      v131 = 2112;
      v132 = v75;
      v82 = v81;
      _os_log_impl(&dword_21961B000, v80, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviations detected (all): %@", buf, 0x16u);

    }
    _HKInitializeLogging();
    v83 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v84 = v83;
      v85 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v130 = v85;
      v131 = 2112;
      v132 = v76;
      v86 = v85;
      _os_log_impl(&dword_21961B000, v84, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviations detected (enabled): %@", buf, 0x16u);

    }
  }
  v87 = objc_alloc(MEMORY[0x24BE46B38]);
  v88 = objc_loadWeakRetained((id *)&v101->_profile);
  +[HDMCRecentBasalBodyTemperatureRangeQuery recentRangeForAnalysisWithProfile:](HDMCRecentBasalBodyTemperatureRangeQuery, "recentRangeForAnalysisWithProfile:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "recentBasalBodyTemperatureWithMostRecentQuantity:", v108);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v35, "isUserInactive");
  v92 = (void *)objc_msgSend(v116, "copy");
  LOBYTE(v95) = -[HDMCAnalysisManager _hasHealthAppDevicesWithHigherAlgorithmVersions](v101, "_hasHealthAppDevicesWithHigherAlgorithmVersions");
  LOBYTE(v94) = v91;
  v115 = (id)objc_msgSend(v87, "initWithStatistics:menstruationProjections:fertileWindowProjections:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:cycles:deviations:recentSymptoms:recentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:isPeriodLogLate:ongoingCycleFactors:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:hasHealthAppDevicesWithHigherAlgorithmVersions:", v104, v98, v97, obja, v114, v96, v76, a5, v90, v107, v103, v94, v92, a9,
               a10,
               v95);

  return v115;
}

void __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = (void *)MEMORY[0x219A3147C]();
  v6 = *(_QWORD *)(a1 + 48) + ~a3;
  if (!*(_BYTE *)(a1 + 56))
  {
    v8 = 0;
    v9 = 0;
    v7 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v15, "hkmc_cycleWithLastDayIndex:includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:", 0, *(unsigned __int8 *)(a1 + 57), v7, v8, v9, *(unsigned __int8 *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex:", *(_QWORD *)(a1 + 48) + ~a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menstruationSegment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "days");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hkmc_cycleWithLastDayIndex:includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:", v13, *(unsigned __int8 *)(a1 + 57), v7, v8, v9, *(unsigned __int8 *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

  objc_autoreleasePoolPop(v5);
}

uint64_t __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviationDetectionEnabledForType:", objc_msgSend(a2, "type"));
}

- (id)_processorConfigurationForTodayIndex:(int64_t)a3 deviationsFeatureStatus:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  HDProfile **p_profile;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  const __CFString *v33;
  id v34;
  void *v35;
  void *v36;
  HDMCDeviationInputManager *deviationInputManager;
  BOOL v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  id v54;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  const __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  _UserCharacteristicOfType(WeakRetained, (void *)*MEMORY[0x24BDD2A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)&self->_profile);
  v13 = (void *)*MEMORY[0x24BDD42D8];
  _UserCharacteristicOfType(v12, (void *)*MEMORY[0x24BDD42D8]);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained((id *)&self->_profile);
  v16 = _UserCharacteristicModificationDayOfType(v15, v13, v8);

  v17 = objc_loadWeakRetained((id *)&self->_profile);
  v18 = (void *)*MEMORY[0x24BDD42E0];
  _UserCharacteristicOfType(v17, (void *)*MEMORY[0x24BDD42E0]);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = objc_loadWeakRetained((id *)&self->_profile);
  v58 = v8;
  v21 = v8;
  v22 = v7;
  v23 = _UserCharacteristicModificationDayOfType(v20, v18, v21);

  v24 = -[HKMCSettingsManager cycleLengthModificationDayIndexOverriding:](self->_settingsManager, "cycleLengthModificationDayIndexOverriding:", v16);
  v25 = -[HKMCSettingsManager periodLengthModificationDayIndexOverriding:](self->_settingsManager, "periodLengthModificationDayIndexOverriding:", v23);
  v59 = (void *)v14;
  v57 = (void *)v19;
  objc_msgSend(MEMORY[0x24BE3F598], "hkmc_configurationWithBirthDateComponents:userReportedCycleLength:onDayIndex:userReportedMenstruationLength:onDayIndex:", v11, v14, v24, v19, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTodayAsJulianDay:", a3);
  if (v7)
  {
    v56 = v11;
    v27 = *MEMORY[0x24BDD2CA8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "areAllRequirementsSatisfied");

    _HKInitializeLogging();
    v30 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (void *)objc_opt_class();
      v33 = CFSTR("NO");
      if ((_DWORD)v29)
        v33 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v62 = v32;
      v63 = 2112;
      v64 = v33;
      v34 = v32;
      _os_log_impl(&dword_21961B000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation detection meets usage requirements: %@", buf, 0x16u);

    }
    objc_msgSend(v22, "onboardingRecord");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "featureSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    deviationInputManager = self->_deviationInputManager;
    v60 = 0;
    v38 = -[HDMCDeviationInputManager clearStateIfNecessaryFromSettings:usageRequirementsSatisfied:error:](deviationInputManager, "clearStateIfNecessaryFromSettings:usageRequirementsSatisfied:error:", v36, v29, &v60);
    v39 = v60;
    v40 = v58;
    if (!v38 && (_HKInitializeLogging(), os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR)))
    {
      -[HDMCAnalysisManager _processorConfigurationForTodayIndex:deviationsFeatureStatus:calendar:].cold.1();
      if ((_DWORD)v29)
        goto LABEL_9;
    }
    else if ((_DWORD)v29)
    {
LABEL_9:
      v41 = objc_msgSend(v36, "deviationDetectionEnabledSetExplicitlyForAnyType");
      v42 = (void *)MEMORY[0x24BE3F5B0];
      v43 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v42, "hdmc_deviationInputWithProfile:enabledSetExplicitly:calendar:", v43, v41, v58);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDeviationInput:", v44);

LABEL_15:
      v11 = v56;
      goto LABEL_16;
    }
    _HKInitializeLogging();
    v48 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      v50 = (void *)objc_opt_class();
      v54 = v50;
      objc_msgSend(v22, "objectForKeyedSubscript:", v27);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "unsatisfiedRequirementIdentifiers");
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v50;
      v63 = 2112;
      v64 = v52;
      _os_log_impl(&dword_21961B000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation detection unsatisfied usage requirements: %@", buf, 0x16u);

    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v45 = (void *)*MEMORY[0x24BDD3030];
  v40 = v58;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v46 = v45;
    *(_DWORD *)buf = 138543362;
    v62 = (id)objc_opt_class();
    v47 = v62;
    _os_log_impl(&dword_21961B000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation detection suppressed on watch", buf, 0xCu);

  }
LABEL_16:

  return v26;
}

- (BOOL)_hasHealthAppDevicesWithHigherAlgorithmVersions
{
  HDMCDeviceScopedStorageManager *deviceScopedStorageManager;
  void *v4;
  id v5;
  char v6;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  deviceScopedStorageManager = self->_deviceScopedStorageManager;
  v8 = 0;
  -[HDMCDeviceScopedStorageManager accountDevicesInfoWithError:](deviceScopedStorageManager, "accountDevicesInfoWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    v6 = objc_msgSend(v4, "hasHealthAppDevicesWithHigherAlgorithmVersions");
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCAnalysisManager _hasHealthAppDevicesWithHigherAlgorithmVersions].cold.1();
    v6 = 0;
  }

  return v6;
}

- (void)registerObserver:(id)a3 queue:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", v8, v9);
  if (v5)
  {
    -[HKObserverSet registerObserver:queue:](self->_userInitiatedObservers, "registerObserver:queue:", v8, v9);
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v12 = v16;
      _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to user-initiated observer add: %{public}@", buf, 0x16u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__HDMCAnalysisManager_registerObserver_queue_userInitiated___block_invoke;
    block[3] = &unk_24DB21D60;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

uint64_t __60__HDMCAnalysisManager_registerObserver_queue_userInitiated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded");
}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  id v5;

  observers = self->_observers;
  v5 = a3;
  -[HKObserverSet unregisterObserver:](observers, "unregisterObserver:", v5);
  -[HKObserverSet unregisterObserver:](self->_userInitiatedObservers, "unregisterObserver:", v5);

}

- (void)_test_setAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_test_analysis, a3);
}

- (void)_test_setAlgorithmsAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_test_algorithmsAnalysis, a3);
}

- (void)_test_setAlgorithmsCycles:(id)a3
{
  objc_storeStrong((id *)&self->_test_algorithmsCycles, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)_test_didNotUpgradeOnboardingRecord
{
  return self->__test_didNotUpgradeOnboardingRecord;
}

- (void)set_test_didNotUpgradeOnboardingRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__test_didNotUpgradeOnboardingRecord, 0);
  objc_storeStrong((id *)&self->_test_algorithmsCycles, 0);
  objc_storeStrong((id *)&self->_test_algorithmsAnalysis, 0);
  objc_storeStrong((id *)&self->_test_analysis, 0);
  objc_storeStrong(&self->_historicalAnalyzerProvider, 0);
  objc_storeStrong(&self->_dayStreamProcessorProvider, 0);
  objc_storeStrong((id *)&self->_queue_lastFeatureSettings, 0);
  objc_storeStrong((id *)&self->_lock_currentAnalysis, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_deviationInputManager, 0);
  objc_storeStrong((id *)&self->_deviationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_analyzeOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userInitiatedObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (BOOL)initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void (**v18)(void);
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v6 = a3;
  -[HDMCAnalysisManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "onboardingCompletionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDD2E28];
    v26 = 0;
    objc_msgSend(v9, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:error:", v10, &v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;

    v13 = v11 != 0;
    if (!v11)
    {
      v20 = v12;
      if (v20)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCAnalysisManager(CycleFactorsAutomaticUpgrade) initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:error:].cold.1(v21);
      goto LABEL_17;
    }
    objc_msgSend(v11, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "version") <= 1)
    {
      objc_msgSend(v6, "cloneWithOwnerIdentifier:", CFSTR("HDMCAnalysisManager+CycleFactorsAutomaticUpgrade"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCAnalysisManager queue](self, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke;
      v23[3] = &unk_24DB21FD0;
      v23[4] = self;
      v24 = v16;
      v25 = v8;
      v18 = v16;
      dispatch_async(v17, v23);

    }
    else
    {
      -[HDMCAnalysisManager _test_didNotUpgradeOnboardingRecord](self, "_test_didNotUpgradeOnboardingRecord");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_10:

LABEL_17:
        goto LABEL_18;
      }
      -[HDMCAnalysisManager _test_didNotUpgradeOnboardingRecord](self, "_test_didNotUpgradeOnboardingRecord");
      v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v18[2]();
    }

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 1, CFSTR("Profile is going away"));
  v13 = 0;
LABEL_18:

  return v13;
}

void __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  os_log_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x24BDD3030];
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v5 = v15;
    _os_log_impl(&dword_21961B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writing a Cycle Factors onboarding record for backwards compatibility", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE40B20], "contextForAccessibilityAssertion:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCacheScope:", 1);
  objc_msgSend(*(id *)(a1 + 48), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_190;
  v11[3] = &unk_24DB22CB8;
  v12 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "performWithTransactionContext:error:block:", v6, &v13, v11);
  v9 = v13;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_cold_1(a1, v10);
  }

}

uint64_t __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_190(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = objc_alloc(MEMORY[0x24BDD3DD8]);
  v5 = *MEMORY[0x24BDD2E28];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v5, 3, v6, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "onboardingCompletionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "insertOnboardingCompletion:error:", v7, a2);

  return v9;
}

- (void)_takeAccessibilityAssertion
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v0, v4, "[%{public}@] Unable to take an accessibility assertion: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)featureAvailabilityProvidingDidUpdateSettings:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v0, v4, "[%{public}@] Settings change: unable to read new settings: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.1()
{
  id v0;
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_14();
  v1 = OUTLINED_FUNCTION_4(v0);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_5_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v1, v4, "[%{public}@] Error retrieving feature settings: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.2()
{
  id v0;
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_14();
  v1 = OUTLINED_FUNCTION_4(v0);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_5_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v1, v4, "[%{public}@] Error retrieving feature status for heart rate input: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.3()
{
  id v0;
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_14();
  v1 = OUTLINED_FUNCTION_4(v0);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_5_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v1, v4, "[%{public}@] Error retrieving feature status for wrist temperature input: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.4()
{
  id v0;
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_14();
  v1 = OUTLINED_FUNCTION_4(v0);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_5_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v1, v4, "[%{public}@] Error retrieving feature status for deviations: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.5()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_3_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving initial factors: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.6()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_3_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v4, v5, "[%{public}@] Error analyzing predictions with most recent menstrual flow julian day updated: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.7()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_3_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v4, v5, "[%{public}@] Error analyzing historical cycles: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(void *)a1 forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_10(a1);
  OUTLINED_FUNCTION_12((uint64_t)v1, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v2, v3, "[%{public}@] Error retrieving analysis sample info: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.9()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_3_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v4, v5, "[%{public}@] Error enumerating day summaries: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(void *)a1 forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.10(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_10(a1);
  OUTLINED_FUNCTION_12((uint64_t)v1, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v2, v3, "[%{public}@] Error retrieving heart statistics: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_processorConfigurationForTodayIndex:deviationsFeatureStatus:calendar:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v0, v4, "[%{public}@] Unable to clear state for deviation input: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_hasHealthAppDevicesWithHigherAlgorithmVersions
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v0, v4, "[%{public}@] Failed to retrieve account device info: %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_3();
  v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_21961B000, v6, v7, "[%{public}@] Error writing a Cycle Factors onboarding record for backwards compatibility: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

@end
