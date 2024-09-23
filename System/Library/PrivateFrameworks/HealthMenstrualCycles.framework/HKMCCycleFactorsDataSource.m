@implementation HKMCCycleFactorsDataSource

- (HKMCCycleFactorsDataSource)initWithHealthStore:(id)a3 pregnancyModelProvider:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKMCCycleFactorsDataSource *v12;
  HKMCCycleFactorsDataSource *v13;
  NSMutableSet *v14;
  NSMutableSet *cycleFactors;
  HKMCPregnancyModelProviding *v16;
  HKMCPregnancyModelProviding *pregnancyModelProvider;
  char v18;
  HKMCPregnancyModelProvider *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  HKMCCycleFactorsDataSource *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKMCCycleFactorsDataSource;
  v12 = -[HKMCCycleFactorsDataSource init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    cycleFactors = v13->_cycleFactors;
    v13->_cycleFactors = v14;

    if (v10)
    {
      v16 = (HKMCPregnancyModelProviding *)v10;
      pregnancyModelProvider = v13->_pregnancyModelProvider;
      v13->_pregnancyModelProvider = v16;
      v18 = 1;
    }
    else
    {
      v19 = -[HKMCPregnancyModelProvider initWithHealthStore:startQueryImmediately:]([HKMCPregnancyModelProvider alloc], "initWithHealthStore:startQueryImmediately:", v9, 0);
      v18 = 0;
      pregnancyModelProvider = v13->_pregnancyModelProvider;
      v13->_pregnancyModelProvider = (HKMCPregnancyModelProviding *)v19;
    }

    v13->_pregnancyQueryHasStarted = v18;
    v13->_isRegisteredForPregnancyModelUpdates = 0;
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v27 = v22;
    v28 = 2048;
    v29 = v13;
    v23 = v22;
    _os_log_impl(&dword_218A9C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Initializing", buf, 0x16u);

  }
  return v13;
}

- (void)startObservingCycleFactorsInDayIndexRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  os_log_t *v6;
  os_log_t v7;
  NSObject *v8;
  id v9;
  int64_t duration;
  int64_t start;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HKAnchoredObjectQuery *v34;
  HKAnchoredObjectQuery *observerQuery;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, void *, void *, uint64_t, void *);
  void *v40;
  HKMCCycleFactorsDataSource *v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  HKMCCycleFactorsDataSource *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  var1 = a3.var1;
  var0 = a3.var0;
  v49 = *MEMORY[0x24BDAC8D0];
  v6 = (os_log_t *)MEMORY[0x24BDD3030];
  if (!self->_observerQuery)
  {
LABEL_19:
    self->_currentDayIndexRange.start = var0 - 150;
    self->_currentDayIndexRange.duration = var1 + 150;
    _HKInitializeLogging();
    v24 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      v27 = v26;
      NSStringFromHKDayIndexRange();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v26;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v28;
      _os_log_impl(&dword_218A9C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Starting cycle factors fetch for range: %@", buf, 0x20u);

    }
    -[HKMCCycleFactorsDataSource _startPregnancyModelObservationIfNeeded]((uint64_t)self);
    objc_msgSend(MEMORY[0x24BDD1758], "hk_predicateForSamplesInDayIndexRange:", self->_currentDayIndexRange.start, self->_currentDayIndexRange.duration);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD3E98];
    HKMCCycleFactorsTypes();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hkmc_descriptorsForTypes:predicate:", v31, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v37 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke;
    v40 = &unk_24D99E050;
    v41 = self;
    objc_copyWeak(&v42, (id *)buf);
    v33 = (void *)MEMORY[0x219A1F070](&v37);
    v34 = (HKAnchoredObjectQuery *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3920]), "initWithQueryDescriptors:anchor:limit:resultsHandler:", v32, 0, 0, v33);
    observerQuery = self->_observerQuery;
    self->_observerQuery = v34;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p Cycle Factors Query>"), objc_opt_class(), self, v37, v38, v39, v40, v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAnchoredObjectQuery setDebugIdentifier:](self->_observerQuery, "setDebugIdentifier:", v36);

    -[HKAnchoredObjectQuery setUpdateHandler:](self->_observerQuery, "setUpdateHandler:", v33);
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_observerQuery);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);

    return;
  }
  _HKInitializeLogging();
  v7 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543618;
    v44 = (id)objc_opt_class();
    v45 = 2048;
    v46 = self;
    v9 = v44;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] We're already running a cycle factors query", buf, 0x16u);

  }
  start = self->_currentDayIndexRange.start;
  duration = self->_currentDayIndexRange.duration;
  if (var0 != start || duration != var1)
  {
    if (var0 >= start && var0 - start < duration)
    {
      v13 = var1 + var0 - 1;
      if (var1 <= 0)
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      v14 = __OFSUB__(v13, start);
      v15 = v13 - start;
      if (v15 < 0 == v14 && v15 < duration)
      {
        _HKInitializeLogging();
        v16 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v44 = v18;
          v45 = 2048;
          v46 = self;
          v19 = v18;
          _os_log_impl(&dword_218A9C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping restarting query, new dayIndexRange is already covered", buf, 0x16u);

        }
        return;
      }
    }
    -[HKMCCycleFactorsDataSource stopObserving](self, "stopObserving");
    goto LABEL_19;
  }
  _HKInitializeLogging();
  v20 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v44 = v22;
    v45 = 2048;
    v46 = self;
    v23 = v22;
    _os_log_impl(&dword_218A9C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping restarting query, due to identical day index ranges", buf, 0x16u);

  }
}

- (void)_startPregnancyModelObservationIfNeeded
{
  os_log_t *v2;
  void *v3;
  NSObject *v4;
  id v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  const char *v16;
  id v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "showSensitiveLogItems");

    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD3030];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = v12;
        *(_DWORD *)v18 = 138543618;
        *(_QWORD *)&v18[4] = objc_opt_class();
        *(_WORD *)&v18[12] = 2048;
        *(_QWORD *)&v18[14] = a1;
        v15 = *(id *)&v18[4];
        v16 = "[%{public}@:%p] Starting pregnancy model query";
LABEL_14:
        _os_log_impl(&dword_218A9C000, v14, OS_LOG_TYPE_DEFAULT, v16, v18, 0x16u);

      }
    }
    else if (v13)
    {
      v14 = v12;
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2048;
      *(_QWORD *)&v18[14] = a1;
      v15 = *(id *)&v18[4];
      v16 = "[%{public}@:%p] Starting model query";
      goto LABEL_14;
    }
    v17 = *(id *)(a1 + 80);
    objc_msgSend(v17, "startQuery");
    objc_msgSend(*(id *)(a1 + 80), "registerObserver:isUserInitiated:", a1, 1);
    *(_WORD *)(a1 + 72) = 257;

    return;
  }
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x24BDD3030];
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v18 = 138543618;
    *(_QWORD *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2048;
    *(_QWORD *)&v18[14] = a1;
    v5 = *(id *)&v18[4];
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping starting query", v18, 0x16u);

  }
  if (!*(_BYTE *)(a1 + 73))
  {
    _HKInitializeLogging();
    v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = v8;
      *(_WORD *)&v18[12] = 2048;
      *(_QWORD *)&v18[14] = a1;
      v9 = v8;
      _os_log_impl(&dword_218A9C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Registering for updates", v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 80), "registerObserver:isUserInitiated:", a1, 1, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
    *(_BYTE *)(a1 + 73) = 1;
  }
}

void __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9 && v10)
  {
    if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_2;
      block[3] = &unk_24D99E028;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      v16 = v9;
      v17 = v10;
      dispatch_async(v12, block);

      objc_destroyWeak(&v18);
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_cold_1(a1, v13, (uint64_t)v11);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "stopObserving");

  }
}

void __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_2(void **a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[HKMCCycleFactorsDataSource _handleCycleFactorsAdded:deletedObjects:]((uint64_t)WeakRetained, a1[4], a1[5]);

}

- (void)_handleCycleFactorsAdded:(void *)a3 deletedObjects:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  id WeakRetained;
  void *v32;
  NSObject *log;
  id v34;
  id v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v35 = a3;
  if (a1)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      log = v6;
      v7 = (void *)objc_opt_class();
      v8 = (void *)MEMORY[0x24BDD16E0];
      v34 = v7;
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      v11 = v5;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v48 = v7;
      v49 = 2048;
      v50 = a1;
      v51 = 2112;
      v52 = v10;
      v53 = 2112;
      v54 = v13;
      v55 = 2112;
      v56 = v15;
      _os_log_impl(&dword_218A9C000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Factors did update, added: %@ | deleted: %@ | currently cached: %@", buf, 0x34u);

      v5 = v11;
    }
    v16 = v5;
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), log);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v19);
      }
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v16);
      v17 = *(id *)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v22;
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = v35;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      v27 = MEMORY[0x24BDAC760];
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v30 = *(void **)(a1 + 40);
          v36[0] = v27;
          v36[1] = 3221225472;
          v36[2] = __70__HKMCCycleFactorsDataSource__handleCycleFactorsAdded_deletedObjects___block_invoke;
          v36[3] = &unk_24D99E078;
          v36[4] = v29;
          objc_msgSend(v30, "hk_removeObjectsPassingTest:", v36, log);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v25);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cycleFactorsDataSource:didFetchCycleFactors:", a1, v32);

  }
}

uint64_t __70__HKMCCycleFactorsDataSource__handleCycleFactorsAdded_deletedObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  HKMCPregnancyModel *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *queue;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD block[5];
  HKMCPregnancyModel *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  HKMCCycleFactorsDataSource *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (HKMCPregnancyModel *)a3;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showSensitiveLogItems");

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2048;
      v25 = self;
      v9 = v23;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received pregnancy model update", buf, 0x16u);

    }
  }
  v10 = MEMORY[0x24BDAC760];
  if (self->_pregnancyModel == v4)
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "showSensitiveLogItems");

    if (v13)
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v16;
        v24 = 2048;
        v25 = self;
        v17 = v16;
        _os_log_impl(&dword_218A9C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping notifying delegate due to identical pregnancy model", buf, 0x16u);

      }
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke;
    block[3] = &unk_24D99D8E8;
    block[4] = self;
    v21 = v4;
    dispatch_async(queue, block);

  }
  v18 = self->_queue;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke_195;
  v19[3] = &unk_24D99DA00;
  v19[4] = self;
  dispatch_async(v18, v19);

}

void __54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSensitiveLogItems");

  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      v8 = v6;
      _os_log_impl(&dword_218A9C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Notifying delegate of pregnancy model update", (uint8_t *)&v10, 0x16u);

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "cycleFactorsDataSource:didUpdatePregnancyModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

_QWORD *__54__HKMCCycleFactorsDataSource_pregnancyModelDidUpdate___block_invoke_195(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[4])
    return (_QWORD *)objc_msgSend(result, "startObservingCycleFactorsInDayIndexRange:", result[7], result[8]);
  return result;
}

- (void)stopObserving
{
  HKAnchoredObjectQuery *observerQuery;

  if (self->_observerQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    observerQuery = self->_observerQuery;
    self->_observerQuery = 0;

    -[HKMCPregnancyModelProviding unregisterObserver:](self->_pregnancyModelProvider, "unregisterObserver:", self);
  }
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  HKMCCycleFactorsDataSource *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2048;
    v10 = self;
    v5 = v8;
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Dealloc", buf, 0x16u);

  }
  -[HKMCCycleFactorsDataSource stopObserving](self, "stopObserving");
  v6.receiver = self;
  v6.super_class = (Class)HKMCCycleFactorsDataSource;
  -[HKMCCycleFactorsDataSource dealloc](&v6, sel_dealloc);
}

- (HKMCCycleFactorsDataSourceDelegate)delegate
{
  return (HKMCCycleFactorsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKMCPregnancyModelProviding)pregnancyModelProvider
{
  return self->_pregnancyModelProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregnancyModelProvider, 0);
  objc_storeStrong((id *)&self->_pregnancyModel, 0);
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_observerQuery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __72__HKMCCycleFactorsDataSource_startObservingCycleFactorsInDayIndexRange___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 32);
  v9 = 138543874;
  v10 = v6;
  v11 = 2048;
  v12 = v7;
  v13 = 2114;
  v14 = a3;
  v8 = v6;
  _os_log_error_impl(&dword_218A9C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@:%p] Factors query failed with error: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
