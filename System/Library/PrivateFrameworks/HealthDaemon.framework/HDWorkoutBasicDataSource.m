@implementation HDWorkoutBasicDataSource

- (HDWorkoutBasicDataSource)initWithConfiguration:(id)a3 client:(id)a4
{
  id v7;
  id v8;
  HDWorkoutBasicDataSource *v9;
  void *v10;
  NSLock *v11;
  NSLock *lock;
  NSUUID *v13;
  NSUUID *workoutDataProcessorUUID;
  id v15;
  uint64_t v16;
  HKDataFlowLink *workoutDataFlowLink;
  uint64_t v18;
  NSSet *sampleTypesToCollect;
  HDClientDataCollectionObservationStateMonitor *v20;
  HDClientDataCollectionObservationStateMonitor *clientStateMonitor;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HDWorkoutBasicDataSource;
  v9 = -[HDWorkoutBasicDataSource init](&v23, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_profile, v10);

    objc_storeStrong((id *)&v9->_client, a4);
    objc_storeStrong((id *)&v9->_workoutConfiguration, a3);
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v9->_lock;
    v9->_lock = v11;

    v13 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    workoutDataProcessorUUID = v9->_workoutDataProcessorUUID;
    v9->_workoutDataProcessorUUID = v13;

    _HKInitializeLogging();
    v15 = objc_alloc(MEMORY[0x1E0CB6588]);
    v16 = objc_msgSend(v15, "initWithProcessor:sourceProtocol:destinationProtocol:loggingCategory:", v9, &unk_1EF1A1298, &unk_1EF1B99A8, *MEMORY[0x1E0CB5380]);
    workoutDataFlowLink = v9->_workoutDataFlowLink;
    v9->_workoutDataFlowLink = (HKDataFlowLink *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    sampleTypesToCollect = v9->_sampleTypesToCollect;
    v9->_sampleTypesToCollect = (NSSet *)v18;

    v20 = -[HDClientDataCollectionObservationStateMonitor initWithClient:delegate:]([HDClientDataCollectionObservationStateMonitor alloc], "initWithClient:delegate:", v8, v9);
    clientStateMonitor = v9->_clientStateMonitor;
    v9->_clientStateMonitor = v20;

    v9->_collectionStopped = 0;
  }

  return v9;
}

- (void)stopCollectionOnConnectionInvalidation
{
  NSObject *v3;
  int v4;
  HDWorkoutBasicDataSource *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@:stopping collection on connection invalidation", (uint8_t *)&v4, 0xCu);
  }
  -[HDWorkoutBasicDataSource _stopCollection]((uint64_t)self);
}

- (uint64_t)_stopCollection
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 32);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __43__HDWorkoutBasicDataSource__stopCollection__block_invoke;
    v2[3] = &unk_1E6CE80E8;
    v2[4] = result;
    return objc_msgSend(v1, "hk_withLock:", v2);
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[HDWorkoutBasicDataSource workoutDataProcessorUUID](self, "workoutDataProcessorUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Basic data source deallocated: %@.", buf, 0xCu);

  }
  -[HDWorkoutBasicDataSource _stopCollection]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)HDWorkoutBasicDataSource;
  -[HDWorkoutBasicDataSource dealloc](&v6, sel_dealloc);
}

void __43__HDWorkoutBasicDataSource__stopCollection__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104);
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection already ended", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending collection", (uint8_t *)&v8, 0xCu);
    }
    -[HDWorkoutBasicDataSource _stopObservingSampleTypes:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(a1 + 32));

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
  }
}

- (void)_stopObservingSampleTypes:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = a1;
      v24 = 2114;
      v25 = v3;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending observation of types: %{public}@", buf, 0x16u);
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
            objc_msgSend(WeakRetained, "dataManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "quantitySeriesManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObserver:forType:", a1, v9);

            v13 = objc_loadWeakRetained((id *)(a1 + 8));
            objc_msgSend(v13, "dataCollectionManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "aggregatorForType:", v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "unregisterSensorDataObserver:", a1);
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

  }
}

- (void)setSampleTypesToCollect:(id)a3
{
  id v4;
  NSLock *lock;
  uint64_t v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLock *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HDWorkoutBasicDataSource *v25;
  _QWORD v26[4];
  id v27;
  HDWorkoutBasicDataSource *v28;

  v4 = a3;
  +[HDActiveDataCollectionObserverServer launchObservingProcessesForTypes:](HDActiveDataCollectionObserverServer, "launchObservingProcessesForTypes:", v4);
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke;
  v26[3] = &unk_1E6CE8080;
  v27 = v4;
  v28 = self;
  v19 = v4;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v26);
  self->_sampleTypesContainHeartRate = 0;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_297;
  v23[3] = &unk_1E6D0B340;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = self;
  v7 = v24;
  objc_msgSend(v19, "hk_mapToDictionary:", v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataCollectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthStoreClient process](self->_client, "process");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDClientDataCollectionObservationStateMonitor currentObserverState](self->_clientStateMonitor, "currentObserverState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "takeCollectionAssertionWithOwnerIdentifier:collectionIntervalsByType:observerState:", v12, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDWorkoutBasicDataSource _takeHeartRateCollectionAssertion]((id *)&self->super.isa);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_lock;
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_2;
  v20[3] = &unk_1E6CE7FB8;
  v20[4] = self;
  v21 = v14;
  v22 = v15;
  v17 = v15;
  v18 = v14;
  -[NSLock hk_withLock:](v16, "hk_withLock:", v20);

}

void __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke(uint64_t a1)
{
  uint64_t v1;
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id obj;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v1 = a1;
  v44 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64)) & 1) == 0)
  {
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x1E0CB5380];
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(v1 + 32);
      v4 = *(_QWORD *)(v1 + 40);
      v6 = *(void **)(v4 + 64);
      *(_DWORD *)buf = 138543874;
      v39 = v4;
      v40 = 2114;
      v41 = v6;
      v42 = 2114;
      v43 = v5;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Adjusting collected sample types: %{public}@ -> %{public}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(v1 + 32), "hk_minus:", *(_QWORD *)(*(_QWORD *)(v1 + 40) + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 64), "hk_minus:", *(_QWORD *)(v1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(v1 + 40);
    v10 = v7;
    if (v9)
    {
      _HKInitializeLogging();
      v11 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v9;
        v40 = 2114;
        v41 = v10;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning observation of types: %{public}@", buf, 0x16u);
      }
      v30 = v8;
      v31 = v1;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v29 = v10;
      obj = v10;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v35;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              WeakRetained = objc_loadWeakRetained((id *)(v9 + 8));
              objc_msgSend(WeakRetained, "dataManager");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "quantitySeriesManager");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addSynchronousObserver:forType:", v9, v16);

              v20 = objc_loadWeakRetained((id *)(v9 + 8));
              objc_msgSend(v20, "dataCollectionManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "aggregatorForType:", v16);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "registerSensorDataObserver:queue:", v9, 0);
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
        }
        while (v13);
      }

      v23 = objc_loadWeakRetained((id *)(v9 + 8));
      objc_msgSend(v23, "dataCollectionManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __55__HDWorkoutBasicDataSource__startObservingSampleTypes___block_invoke;
      v33[3] = &unk_1E6CE77C8;
      v33[4] = v9;
      objc_msgSend(v24, "requestAggregationThroughDate:types:mode:options:completion:", v25, obj, 0, 1, v33);

      v8 = v30;
      v1 = v31;
      v10 = v29;
    }

    -[HDWorkoutBasicDataSource _stopObservingSampleTypes:](*(_QWORD *)(v1 + 40), v8);
    v26 = objc_msgSend(*(id *)(v1 + 32), "copy");
    v27 = *(_QWORD *)(v1 + 40);
    v28 = *(void **)(v27 + 64);
    *(_QWORD *)(v27 + 64) = v26;

  }
}

void __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_297(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id, void *);
  void *v6;
  uint64_t v7;
  BOOL v8;
  double v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 88) = 1;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = objc_msgSend(v11, "code");
    v8 = v7 == 179 || v7 == 75;
    v9 = 60.0;
    if (!v8)
      v9 = 0.5;
    objc_msgSend(v6, "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v11, v10);

  }
}

- (id)_takeHeartRateCollectionAssertion
{
  id *v1;
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v1 = a1;
  v16[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v1 + 88))
    {
      WeakRetained = objc_loadWeakRetained(v1 + 1);
      objc_msgSend(WeakRetained, "dataCollectionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[3], "process");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "applicationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v2;
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = objc_msgSend(v2, "code");
      v9 = v8 == 179 || v8 == 75;
      v10 = 60.0;
      if (!v9)
        v10 = 0.5;
      objc_msgSend(v7, "numberWithDouble:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[12], "currentObserverState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "takeCollectionAssertionWithOwnerIdentifier:collectionIntervalsByType:observerState:", v6, v12, v13);
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

void __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 48));
}

- (NSSet)sampleTypesToCollect
{
  NSSet *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_sampleTypesToCollect;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

void __55__HDWorkoutBasicDataSource__startObservingSampleTypes___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  v7 = *MEMORY[0x1E0CB5380];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@: Completed initial aggregation request for newly observed types.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Initial aggregation upon observation start failed: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

uint64_t __86__HDWorkoutBasicDataSource__enumerateSamplesOfType_from_to_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t result;
  HDWorkoutSeriesQuantity *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HDWorkoutSeriesQuantity *v31;
  _QWORD v32[5];

  if ((!*(_QWORD *)(a1 + 32) || *(double *)(a1 + 96) <= a7) && (!*(_QWORD *)(a1 + 40) || *(double *)(a1 + 104) >= a6))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != a2)
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = 0;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForRowID((uint64_t)v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setPredicate:", v22);

      v23 = *(void **)(a1 + 48);
      v24 = *(_QWORD *)(a1 + 56);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke_2;
      v32[3] = &unk_1E6CE7EA0;
      v32[4] = *(_QWORD *)(a1 + 88);
      result = objc_msgSend(v23, "enumerateInTransaction:error:handler:", v24, a13, v32);
      if (!(_DWORD)result)
        return result;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
        return 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a2;
    }
    v26 = [HDWorkoutSeriesQuantity alloc];
    v27 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(*(id *)(a1 + 64), "canonicalUnit");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28, a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a6, a7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HDWorkoutSeriesQuantity initWithQuantity:dateInterval:series:](v26, "initWithQuantity:dateInterval:series:", v29, v30, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  return 1;
}

uint64_t __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

uint64_t __47__HDWorkoutBasicDataSource__forwardQuantities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addQuantities:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addOtherSamples:dataSource:", v3, *(_QWORD *)(a1 + 40));

}

void __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  v15 = v3;
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v15;
  }
  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hk_isAfterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v9 = v15;
  if ((v8 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v15);
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v9 = v15;
    if (v10 >= 0x190)
    {
      v11 = (void *)MEMORY[0x1BCCACAC4]();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 400);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_autoreleasePoolPop(v11);
      v9 = v15;
    }
  }

}

void __97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addQuantities:dataSource:", v3, *(_QWORD *)(a1 + 40));

}

void __97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a2;
  v16 = v3;
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v16;
  }
  objc_msgSend(v3, "hdw_dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hk_isAfterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v10 = v16;
  if ((v9 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v16);
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v10 = v16;
    if (v11 >= 0x190)
    {
      v12 = (void *)MEMORY[0x1BCCACAC4]();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 400);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      objc_autoreleasePoolPop(v12);
      v10 = v16;
    }
  }

}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (NSUUID)workoutDataProcessorUUID
{
  return self->_workoutDataProcessorUUID;
}

- (void)setWorkoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_workoutConfiguration, a3);
}

- (void)setSessionServer:(id)a3
{
  HDWorkoutSessionServer **p_sessionServer;
  id v5;
  id v6;

  p_sessionServer = &self->_sessionServer;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_sessionServer, v6);
  objc_msgSend(v6, "addObserver:queue:", self, 0);

}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  HDWorkoutBasicDataSource *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  HDWorkoutBasicDataSource *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x1E0CB5380];
  v12 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v31 = self;
    v32 = 2114;
    v33 = v9;
    v34 = 2114;
    v35 = v10;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: Fetching data from %{public}@ -> %{public}@", buf, 0x20u);
  }
  -[NSLock lock](self->_lock, "lock");
  v13 = (void *)-[NSSet copy](self->_sampleTypesToCollect, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__HDWorkoutBasicDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke;
  v23[3] = &unk_1E6D0B408;
  v16 = v13;
  v24 = v16;
  v25 = self;
  v17 = v8;
  v26 = v17;
  v18 = v9;
  v27 = v18;
  v19 = v10;
  v28 = v19;
  v20 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, &v29, v23);
  v21 = v29;

  if (!v20)
  {
    _HKInitializeLogging();
    v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      v32 = 2114;
      v33 = v21;
      _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Read transaction handling data request failed: %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __71__HDWorkoutBasicDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _BYTE *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void **v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id WeakRetained;
  void *v53;
  uint64_t *v54;
  uint64_t *v55;
  void *v56;
  _QWORD *v57;
  id v58;
  id v59;
  uint64_t *v60;
  BOOL v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void (*v69)(uint64_t);
  char v70;
  char v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  NSObject *v73;
  __int128 v75;
  id obj;
  id v77;
  uint64_t v78;
  id v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  id v93;
  id v94;
  id *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, void *);
  void *v103;
  id v104;
  void **v105;
  _BYTE *v106;
  BOOL v107;
  id v108;
  uint64_t aBlock;
  uint64_t p_aBlock;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  _BYTE v121[128];
  void *v122;
  void **v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  _BYTE buf[24];
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  _BYTE v132[24];
  void *v133;
  id v134;
  uint64_t *v135;
  uint64_t *v136;
  id v137;
  id v138;
  uint64_t *v139;
  id *v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  id *v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v80 = a2;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = *(id *)(a1 + 32);
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v121, 16);
  if (v81)
  {
    v78 = *(_QWORD *)v97;
    *(_QWORD *)&v2 = 138543874;
    v75 = v2;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v97 != v78)
        {
          v4 = v3;
          objc_enumerationMutation(obj);
          v3 = v4;
        }
        v92 = v3;
        v5 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v3);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v8 = *(id **)(a1 + 40);
        v7 = *(void **)(a1 + 48);
        v10 = *(void **)(a1 + 56);
        v9 = *(void **)(a1 + 64);
        v95 = v8;
        if ((isKindOfClass & 1) != 0)
        {
          v88 = v7;
          v84 = v5;
          v86 = v10;
          v93 = v9;
          v90 = v80;
          if (v8)
          {
            aBlock = MEMORY[0x1E0C809B0];
            p_aBlock = 3221225472;
            v111 = (uint64_t)__97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke;
            v112 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D0B390;
            v113 = (void (*)(uint64_t))v88;
            v114 = v8;
            v11 = _Block_copy(&aBlock);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v129 = __Block_byref_object_copy__170;
            v130 = __Block_byref_object_dispose__170;
            v131 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 400);
            v122 = 0;
            v123 = &v122;
            v124 = 0x3032000000;
            v125 = __Block_byref_object_copy__170;
            v126 = __Block_byref_object_dispose__170;
            v127 = 0;
            v108 = 0;
            v100 = MEMORY[0x1E0C809B0];
            v101 = 3221225472;
            v102 = __97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke_2;
            v103 = &unk_1E6D0B3E0;
            v107 = v93 != 0;
            v105 = &v122;
            v106 = buf;
            v12 = v11;
            v104 = v12;
            v13 = v84;
            v14 = v86;
            v15 = v93;
            v82 = v90;
            v16 = &v100;
            if (v15)
            {
              objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("start_date"), v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14)
                goto LABEL_21;
LABEL_16:
              v34 = (void *)MEMORY[0x1E0D29838];
              objc_msgSend(v14, "dateByAddingTimeInterval:", -86400.0, v75);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("start_date"), v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("end_date"), v14);
              v37 = objc_claimAutoreleasedReturnValue();
              v38 = (void *)v37;
              v39 = (void *)MEMORY[0x1E0D29840];
              if (v17)
              {
                v148 = v17;
                v149 = (uint64_t)v36;
                v150 = v37;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 3);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "predicateMatchingAllPredicates:", v40);
                v41 = objc_claimAutoreleasedReturnValue();

                v17 = (void *)v41;
              }
              else
              {
                v148 = v36;
                v149 = v37;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 2);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "predicateMatchingAllPredicates:", v40);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_21;
            }
            v17 = 0;
            if (v14)
              goto LABEL_16;
LABEL_21:
            v42 = (void *)MEMORY[0x1E0D29840];
            HDSQLitePredicateForUnfrozenQuantitySeriesSamples();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "disjunctionWithPredicate:otherPredicate:", v17, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = (void *)MEMORY[0x1E0D29840];
            HDSampleEntityPredicateForDataType(v13);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "compoundPredicateWithPredicate:otherPredicate:", v44, v46);
            v47 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "timeIntervalSinceReferenceDate");
            v49 = v48;
            objc_msgSend(v15, "timeIntervalSinceReferenceDate");
            v51 = v50;
            WeakRetained = objc_loadWeakRetained(v95 + 1);
            +[HDDataEntity entityEnumeratorWithProfile:](HDQuantitySampleSeriesEntity, "entityEnumeratorWithProfile:", WeakRetained);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v53, "setIgnoreEntityClassAdditionalPredicateForEnumeration:", 1);
            v144 = 0;
            v145 = &v144;
            v146 = 0x2020000000;
            v147 = -1;
            v54 = v16;
            v115 = 0;
            v116 = &v115;
            v117 = 0x3032000000;
            v118 = __Block_byref_object_copy__170;
            v119 = __Block_byref_object_dispose__170;
            v120 = 0;
            *(_QWORD *)v132 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v132[8] = 3221225472;
            *(_QWORD *)&v132[16] = __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke;
            v133 = &unk_1E6D0B368;
            v77 = v14;
            v134 = v77;
            v142 = v49;
            v55 = (uint64_t *)v15;
            v143 = v51;
            v135 = v55;
            v140 = &v144;
            v56 = (void *)v47;
            v141 = &v115;
            v57 = v53;
            v136 = v57;
            v58 = v82;
            v137 = v58;
            v59 = v13;
            v138 = v59;
            v60 = v54;
            v139 = v60;
            v61 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:transaction:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:transaction:options:error:handler:", v56, v58, 5, &v108, v132);

            _Block_object_dispose(&v115, 8);
            _Block_object_dispose(&v144, 8);

            v62 = v108;
            if (!v61)
            {
              _HKInitializeLogging();
              v63 = *MEMORY[0x1E0CB5380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v132 = v75;
                *(_QWORD *)&v132[4] = v95;
                *(_WORD *)&v132[12] = 2114;
                *(_QWORD *)&v132[14] = v59;
                *(_WORD *)&v132[22] = 2114;
                v133 = v62;
                _os_log_error_impl(&dword_1B7802000, v63, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate samples of type %{public}@: %{public}@", v132, 0x20u);
              }
            }
            (*((void (**)(id, _QWORD))v12 + 2))(v12, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

            _Block_object_dispose(&v122, 8);
            _Block_object_dispose(buf, 8);

          }
          goto LABEL_38;
        }
        v87 = v7;
        v83 = v5;
        v85 = v10;
        v94 = v9;
        v89 = v80;
        if (v8)
        {
          v100 = MEMORY[0x1E0C809B0];
          v101 = 3221225472;
          v102 = __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke;
          v103 = &unk_1E6D0B390;
          v104 = v87;
          v105 = v8;
          v18 = _Block_copy(&v100);
          v115 = 0;
          v116 = &v115;
          v117 = 0x3032000000;
          v118 = __Block_byref_object_copy__170;
          v119 = __Block_byref_object_dispose__170;
          v120 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 400);
          aBlock = 0;
          p_aBlock = (uint64_t)&aBlock;
          v111 = 0x3032000000;
          v112 = __Block_byref_object_copy__170;
          v113 = __Block_byref_object_dispose__170;
          v114 = 0;
          v148 = 0;
          *(_QWORD *)v132 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v132[8] = 3221225472;
          *(_QWORD *)&v132[16] = __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke_2;
          v133 = &unk_1E6D0B3B8;
          LOBYTE(v137) = v94 != 0;
          v135 = &aBlock;
          v136 = &v115;
          v19 = v18;
          v134 = v19;
          v20 = v85;
          v21 = v94;
          v22 = v132;
          v23 = v89;
          v91 = v83;
          v24 = objc_loadWeakRetained(v95 + 1);
          +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v91, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("start_date"), v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v20)
            {
              v28 = (void *)MEMORY[0x1E0D29838];
              objc_msgSend(v20, "dateByAddingTimeInterval:", -86400.0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("start_date"), v29);
              v30 = (void **)objc_claimAutoreleasedReturnValue();

              v31 = (void *)MEMORY[0x1E0D29840];
              v122 = v27;
              v123 = v30;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 2);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "predicateMatchingAllPredicates:", v32);
              v33 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v33 = v26;
            }

          }
          else
          {
            v33 = 0;
          }
          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("end_date"), v20);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v64;
            if (v33)
            {
              v66 = (void *)MEMORY[0x1E0D29840];
              v144 = v33;
              v145 = (id *)v64;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 2);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "predicateMatchingAllPredicates:", v67);
              v68 = objc_claimAutoreleasedReturnValue();

              v33 = (id)v68;
            }
            else
            {
              v33 = v64;
            }

          }
          objc_msgSend(v25, "setPredicate:", v33, v75);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __86__HDWorkoutBasicDataSource__enumerateSamplesOfType_from_to_transaction_error_handler___block_invoke;
          v129 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CF9C30;
          v69 = v22;
          v130 = v69;
          v70 = objc_msgSend(v25, "enumerateInTransaction:error:handler:", v23, &v148, buf);

          LOBYTE(v108) = v70;
          v71 = (char)v108;

          v72 = (uint64_t (*)(uint64_t, uint64_t))v148;
          if ((v71 & 1) == 0)
          {
            _HKInitializeLogging();
            v73 = *MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v75;
              *(_QWORD *)&buf[4] = v95;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v91;
              *(_WORD *)&buf[22] = 2114;
              v129 = v72;
              _os_log_error_impl(&dword_1B7802000, v73, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate samples of type %{public}@: %{public}@", buf, 0x20u);
            }
          }
          (*((void (**)(id, uint64_t))v19 + 2))(v19, v116[5]);

          _Block_object_dispose(&aBlock, 8);
          _Block_object_dispose(&v115, 8);

        }
LABEL_38:
        v3 = v92 + 1;
      }
      while (v81 != v92 + 1);
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v121, 16);
    }
    while (v81);
  }

  return 1;
}

- (void)workoutDataDestination:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (a5 == 4 || a5 == 2)
    -[HDWorkoutBasicDataSource _stopCollection]((uint64_t)self);
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  HDWorkoutBasicDataSource *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HDWorkoutBasicDataSource setWorkoutConfiguration:](self, "setWorkoutConfiguration:", v5);
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@: Updated workout configuration : %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  HDWorkoutBasicDataSource *v12;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__HDWorkoutBasicDataSource_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
  v10[3] = &unk_1E6D0B430;
  v11 = v6;
  v12 = self;
  v7 = v6;
  v8 = _Block_copy(v10);

  return v8;
}

void __89__HDWorkoutBasicDataSource_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, int a7)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  HDWorkoutSeriesQuantity *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v11 = a5;
  v12 = a4;
  v13 = a2;
  v18 = -[HDWorkoutSeriesQuantity initWithQuantity:dateInterval:series:]([HDWorkoutSeriesQuantity alloc], "initWithQuantity:dateInterval:series:", v13, v12, v11);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
  if (a7)
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    v16 = v15;
    if (v14)
    {
      v17 = *(void **)(v14 + 40);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __47__HDWorkoutBasicDataSource__forwardQuantities___block_invoke;
      v19[3] = &unk_1E6CE8008;
      v20 = v15;
      v21 = v14;
      objc_msgSend(v17, "sendToDestinationProcessors:", v19);

    }
  }

}

- (void)dataCollectionObservationStateDidChangeForClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HDWorkoutBasicDataSource *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection state changed for %{public}@", (uint8_t *)&v8, 0x16u);
  }
  -[HDClientDataCollectionObservationStateMonitor currentObserverState](self->_clientStateMonitor, "currentObserverState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataCollectionAssertion setObserverState:](self->_collectionAssertion, "setObserverState:", v6);

  -[HDClientDataCollectionObservationStateMonitor currentObserverState](self->_clientStateMonitor, "currentObserverState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataCollectionAssertion setObserverState:](self->_heartRateDataCollectionAssertion, "setObserverState:", v7);

}

- (void)aggregator:(id)a3 didCollectSensorData:(id)a4 objectType:(id)a5 device:(id)a6
{
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HKDataFlowLink *workoutDataFlowLink;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB5C88]);

  if (v10)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      v15 = *MEMORY[0x1E0CB7350];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = v15;
            v18 = v17;
            objc_msgSend(v18, "quantity");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            workoutDataFlowLink = self->_workoutDataFlowLink;
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __78__HDWorkoutBasicDataSource_aggregator_didCollectSensorData_objectType_device___block_invoke;
            v24[3] = &unk_1E6CF6C20;
            v24[4] = self;
            v25 = v20;
            v26 = v18;
            v22 = v20;
            -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v24);

          }
          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v13);
    }

    v8 = v23;
  }

}

void __78__HDWorkoutBasicDataSource_aggregator_didCollectSensorData_objectType_device___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "activityType") == 82)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "dateInterval");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addMetadataToWorkoutActivity:withSampleStartDate:dataSource:", v3, v5, *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    objc_msgSend(v6, "addMetadata:dataSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }

}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  id v10;
  void *v11;
  NSLock *v12;
  id v13;
  NSLock *lock;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v15 = a3;
  v10 = a6;
  if (a4 == 17)
  {
    lock = self->_lock;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke_2;
    v16[3] = &unk_1E6CE80E8;
    v16[4] = self;
    -[NSLock hk_withLock:](lock, "hk_withLock:", v16, v15);
  }
  else if (a4 == 7 && a5 == 17)
  {
    -[HDWorkoutBasicDataSource _takeHeartRateCollectionAssertion]((id *)&self->super.isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_lock;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke;
    v17[3] = &unk_1E6CE8080;
    v17[4] = self;
    v18 = v11;
    v13 = v11;
    -[NSLock hk_withLock:](v12, "hk_withLock:", v17, v15);

  }
}

void __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

uint64_t __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateMonitor, 0);
  objc_storeStrong((id *)&self->_heartRateDataCollectionAssertion, 0);
  objc_storeStrong((id *)&self->_collectionAssertion, 0);
  objc_storeStrong((id *)&self->_sampleTypesToCollect, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_workoutDataProcessorUUID, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_sessionServer);
  objc_destroyWeak((id *)&self->_profile);
}

@end
