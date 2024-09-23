@implementation HDLocationDataCollector

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDLocationEventDelegate)delegate
{
  return (HDLocationEventDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __52__HDLocationDataCollector__queue_createSeriesSample__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  v7 = *MEMORY[0x1E0CB5380];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 80);
      v10 = v6;
      objc_msgSend(v9, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Saved route %@ with associated workout %@.", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workoutRouteUpdated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138543618;
    v16 = v14;
    v17 = 2114;
    v18 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[routes] %{public}@ Error occurred while saving route: %{public}@", (uint8_t *)&v15, 0x16u);
  }

}

- (HDLocationDataCollector)initWithProfile:(id)a3 sampleSavingDelegate:(id)a4 configuration:(id)a5 workoutUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDLocationDataCollector *v14;
  HDLocationDataCollector *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  int v18;
  double *v19;
  void *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HDLocationDataCollector;
  v14 = -[HDLocationDataCollector init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    v15->_state = 0;
    objc_storeStrong((id *)&v15->_sampleSavingDelegate, a4);
    objc_storeStrong((id *)&v15->_workoutUUID, a6);
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v15->_lastPausedTime = -1.0;
    v15->_activityType = objc_msgSend(v12, "activityType");
    v18 = objc_msgSend(v12, "shouldUseExtendedMode");
    v19 = (double *)MEMORY[0x1E0C9E4F0];
    if (!v18)
      v19 = (double *)MEMORY[0x1E0C9E490];
    v15->_desiredAccuracy = *v19;
    objc_msgSend(v12, "predictionSessionUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_predictedActivity = v20 != 0;

  }
  return v15;
}

- (void)dealloc
{
  HDAssertion *locationUpdatingAssertion;
  objc_super v4;

  -[HDAssertion invalidate](self->_locationUpdatingAssertion, "invalidate");
  locationUpdatingAssertion = self->_locationUpdatingAssertion;
  self->_locationUpdatingAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDLocationDataCollector;
  -[HDLocationDataCollector dealloc](&v4, sel_dealloc);
}

- (int64_t)state
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
  v5[2] = __32__HDLocationDataCollector_state__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__HDLocationDataCollector_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t state;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  if (state >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%zd)"), self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E6D0D1F8[state];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)workoutLocationManager
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "workoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)authorizationStatus
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundlePath:", CFSTR("/System/Library/LocationBundles/AppleWatchWorkout.bundle"));
}

- (BOOL)locationServicesEnabled
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
}

- (id)createCMElevation
{
  return objc_alloc_init(MEMORY[0x1E0CA5630]);
}

- (BOOL)isElevationAvailable
{
  return objc_msgSend(MEMORY[0x1E0CA5630], "isElevationAvailable");
}

- (void)_queue_deleteCurrentRoute
{
  os_log_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HDDataDeletionConfiguration *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x1E0CB5380];
    v3 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 80);
      v5 = v3;
      objc_msgSend(v4, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = a1;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ route %@ is empty, deleting.", buf, 0x16u);

    }
    v7 = objc_alloc_init(HDDataDeletionConfiguration);
    -[HDDataDeletionConfiguration setGenerateDeletedObjects:](v7, "setGenerateDeletedObjects:", 0);
    -[HDDataDeletionConfiguration setFailIfNotFound:](v7, "setFailIfNotFound:", 0);
    -[HDDataDeletionConfiguration setNotifyObservers:](v7, "setNotifyObservers:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "dataManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v9, "deleteObjectsWithUUIDCollection:configuration:error:", v11, v7, &v17);
    v12 = v17;

    if (v12)
    {
      _HKInitializeLogging();
      v13 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        v14 = *(void **)(a1 + 80);
        v15 = v13;
        objc_msgSend(v14, "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = a1;
        v20 = 2114;
        v21 = v16;
        v22 = 2114;
        v23 = v12;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[routes] %{public}@ error deleting empty route %{public}@: %{public}@.", buf, 0x20u);

      }
    }

  }
}

- (void)_queue_stopUpdates
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    v2 = *(_QWORD *)(a1 + 64);
    if (v2 == 3 || v2 == 0)
    {
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        return;
      v13 = 138543362;
      v14 = a1;
      v5 = "[routes] %{public}@ Inactive collector, ignoring end request";
      v6 = v4;
      v7 = 12;
      goto LABEL_11;
    }
    *(_QWORD *)(a1 + 64) = 3;
    objc_msgSend((id)a1, "workoutLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", a1);

    -[HDLocationDataCollector _queue_stopGPSUpdates](a1);
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 120);
      v12 = *(_QWORD *)(a1 + 128);
      v13 = 138543874;
      v14 = a1;
      v15 = 2048;
      v16 = v11;
      v17 = 2048;
      v18 = v12;
      v5 = "[routes] %{public}@ Received %tu valid locations, skipped %tu";
      v6 = v9;
      v7 = 32;
LABEL_11:
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v13, v7);
    }
  }
}

- (void)_queue_stopGPSUpdates
{
  os_log_t *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x1E0CB5380];
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = a1;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop elevation updates.", (uint8_t *)&v7, 0xCu);
    }
    *(_QWORD *)(a1 + 96) = 0xBFF0000000000000;
    objc_msgSend(*(id *)(a1 + 144), "stopElevationUpdates");
    _HKInitializeLogging();
    v4 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = a1;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop location manager GPS updates.", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 112), "invalidate");
    v5 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = 0;

    objc_msgSend((id)a1, "workoutLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", a1);

  }
}

- (void)stopUpdates
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  HDLocationDataCollector *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop location updates.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HDLocationDataCollector_stopUpdates__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__HDLocationDataCollector_stopUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  os_log_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HDLocationDataCollector _queue_stopUpdates](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
    if (*(_QWORD *)(v2 + 80))
    {
      if (*(_BYTE *)(v2 + 88) || *(_BYTE *)(v2 + 40))
      {
        _HKInitializeLogging();
        v3 = (os_log_t *)MEMORY[0x1E0CB5380];
        v4 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(void **)(v2 + 80);
          v6 = v4;
          objc_msgSend(v5, "UUID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v22 = v2;
          v23 = 2112;
          v24 = v7;
          _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Freezing series sample: %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(v2 + 80), "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
        v20 = 0;
        +[HDSeriesSampleEntity freezeSeriesWithIdentifier:metadata:profile:error:](HDLocationSeriesSampleEntity, "freezeSeriesWithIdentifier:metadata:profile:error:", v8, MEMORY[0x1E0C9AA70], WeakRetained, &v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v20;

        if (!v10 || v11)
        {
          _HKInitializeLogging();
          v16 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
          {
            v17 = *(void **)(v2 + 80);
            v18 = v16;
            objc_msgSend(v17, "UUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v22 = v2;
            v23 = 2114;
            v24 = v19;
            v25 = 2114;
            v26 = v11;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[routes] %{public}@ error freezing sample UUID %{public}@: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v12 = *(void **)(v2 + 80);
          *(_QWORD *)(v2 + 80) = 0;

        }
      }
      else
      {
        -[HDLocationDataCollector _queue_deleteCurrentRoute](v2);
      }
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        NSStringFromSelector(sel__queue_freezeCurrentWorkoutRoute);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v2;
        v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ %{public}@ _route is nil.", buf, 0x16u);

      }
    }
  }
}

- (void)stopUpdatesAndDiscardData
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  HDLocationDataCollector *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop location updates and discard data.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDLocationDataCollector_stopUpdatesAndDiscardData__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__HDLocationDataCollector_stopUpdatesAndDiscardData__block_invoke(uint64_t a1)
{
  -[HDLocationDataCollector _queue_stopUpdates](*(_QWORD *)(a1 + 32));
  -[HDLocationDataCollector _queue_deleteCurrentRoute](*(_QWORD *)(a1 + 32));
}

- (void)startUpdates
{
  void *v3;
  NSUUID *workoutUUID;
  unint64_t activityType;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  HDLocationDataCollector *v11;
  __int16 v12;
  NSUUID *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    workoutUUID = self->_workoutUUID;
    activityType = self->_activityType;
    v6 = v3;
    -[HDLocationDataCollector delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v11 = self;
    v12 = 2112;
    v13 = workoutUUID;
    v14 = 1024;
    v15 = activityType;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Start location updates for workout %@ of type %d with data source %@", buf, 0x26u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HDLocationDataCollector_startUpdates__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__HDLocationDataCollector_startUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 64) == 1)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ location updates already started, ignoring start request", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    *(_QWORD *)(v2 + 120) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    -[HDLocationDataCollector _queue_setupLocationUpdates](*(_QWORD *)(a1 + 32));
  }
}

- (void)_queue_setupLocationUpdates
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  _BYTE buf[32];
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if ((objc_msgSend((id)a1, "locationServicesEnabled") & 1) != 0)
    {
      objc_msgSend((id)a1, "workoutLocationManager");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObserver:", a1);
      *(_DWORD *)(a1 + 72) = objc_msgSend((id)a1, "authorizationStatus");
      _HKInitializeLogging();
      v3 = (os_log_t *)MEMORY[0x1E0CB5380];
      v4 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        if ((v5 - 3) >= 2)
          v6 = CFSTR("denied/not determined");
        else
          v6 = CFSTR("approved");
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v5;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v6;
        _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization status is: %d (%@)", buf, 0x1Cu);
      }
      v7 = *(_DWORD *)(a1 + 72);
      if ((v7 - 3) >= 2)
      {
        if (!v7)
          objc_msgSend(v2, "requestWhenInUseAuthorization");
      }
      else
      {
        *(_QWORD *)(a1 + 64) = 1;
        v8 = *(_QWORD *)(a1 + 24);
        v9 = objc_msgSend((id)a1, "isElevationAvailable");
        if (v8 == 46)
          v10 = 0;
        else
          v10 = v9;
        if (v10 == 1)
        {
          if (!*(_QWORD *)(a1 + 144))
          {
            _HKInitializeLogging();
            v11 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = a1;
              _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[routes] [elevation] %{public}@ Creating CMElevation.", buf, 0xCu);
            }
            objc_msgSend((id)a1, "createCMElevation");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = *(void **)(a1 + 144);
            *(_QWORD *)(a1 + 144) = v12;

          }
          *(_QWORD *)(a1 + 104) = 0;
          objc_initWeak((id *)buf, (id)a1);
          v14 = *(void **)(a1 + 144);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __54__HDLocationDataCollector__queue_setupLocationUpdates__block_invoke;
          v30[3] = &unk_1E6D0D1B0;
          objc_copyWeak(&v31, (id *)buf);
          objc_msgSend(v14, "startElevationUpdatesWithHandler:", v30);
          objc_destroyWeak(&v31);
          objc_destroyWeak((id *)buf);
        }
        if (!*(_QWORD *)(a1 + 80))
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
          v15 = (void *)MEMORY[0x1E0CB6E58];
          objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = *MEMORY[0x1E0CB7360];
          objc_msgSend(*(id *)(a1 + 16), "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = v17;
          v35[1] = *MEMORY[0x1E0CB55D0];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v36[1] = v19;
          v35[2] = *MEMORY[0x1E0CB55D8];
          v36[2] = &unk_1E6DFE798;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_workoutRouteWithDevice:metadata:", v16, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 80);
          *(_QWORD *)(a1 + 80) = v21;

          v23 = *(void **)(a1 + 48);
          v34 = *(_QWORD *)(a1 + 80);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __52__HDLocationDataCollector__queue_createSeriesSample__block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E6CE77C8;
          v33 = a1;
          objc_msgSend(v23, "saveSamples:withCompletion:", v24, buf);

        }
        _HKInitializeLogging();
        v25 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v2;
          _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Fetched location manager: %@, create in-use assertion, and start updating location.", buf, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 112), "invalidate");
        objc_msgSend(*(id *)(a1 + 16), "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "takeLocationUpdatingAssertionForOwnerIdentifier:desiredAccuracy:", v26, *(double *)(a1 + 32));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(a1 + 112);
        *(_QWORD *)(a1 + 112) = v27;

      }
    }
    else
    {
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = a1;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location services is not enabled", buf, 0xCu);
      }
    }
  }
}

void __54__HDLocationDataCollector__queue_setupLocationUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD *WeakRetained;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD *v14;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v7 = v6;
  v8 = v5;
  if (WeakRetained)
  {
    v9 = WeakRetained[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HDLocationDataCollector__handleElevationData_error___block_invoke;
    block[3] = &unk_1E6CE7FB8;
    v12 = v8;
    v13 = v7;
    v14 = WeakRetained;
    dispatch_async(v9, block);

  }
}

- (void)pauseUpdatesAfterDelay:(unint64_t)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  HDLocationDataCollector *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ HDLocationDataCollector: Pause updates.", buf, 0xCu);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HDLocationDataCollector_pauseUpdatesAfterDelay___block_invoke;
  v7[3] = &unk_1E6CE8058;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

void __50__HDLocationDataCollector_pauseUpdatesAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 64) == 2)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      return;
    v4 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v4;
    v5 = "[routes] %{public}@ location updates already paused, ignoring end request";
    v6 = v3;
    v7 = 12;
    goto LABEL_8;
  }
  if ((*(_DWORD *)(v2 + 72) - 3) < 2)
  {
    -[HDLocationDataCollector _queue_pauseLocationUpdatesAfterDelay:](v2, *(_QWORD *)(a1 + 40));
    return;
  }
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_DWORD *)(v9 + 72);
    v11 = 138543618;
    v12 = v9;
    v13 = 1024;
    v14 = v10;
    v5 = "[routes] %{public}@ Last status was %d, location not approved";
    v6 = v8;
    v7 = 18;
LABEL_8:
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
  }
}

- (void)_queue_pauseLocationUpdatesAfterDelay:(uint64_t)a1
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[6];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    *(CFAbsoluteTime *)(a1 + 96) = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)(a1 + 64) = 2;
    v4 = dispatch_time(0, 1000000000 * a2);
    v5 = *(NSObject **)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__HDLocationDataCollector__queue_pauseLocationUpdatesAfterDelay___block_invoke;
    v6[3] = &unk_1E6CE8058;
    v6[4] = a1;
    v6[5] = a2;
    dispatch_after(v4, v5, v6);
  }
}

- (void)pauseUpdates
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HDPauseWorkoutGPSTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v5 = 180;

  -[HDLocationDataCollector pauseUpdatesAfterDelay:](self, "pauseUpdatesAfterDelay:", v5);
}

void __65__HDLocationDataCollector__queue_pauseLocationUpdatesAfterDelay___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;

  if (*(double *)(*(_QWORD *)(a1 + 32) + 96) > 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v3 = *(_QWORD *)(a1 + 32);
    if (Current - *(double *)(v3 + 96) > (double)*(unint64_t *)(a1 + 40))
      -[HDLocationDataCollector _queue_stopGPSUpdates](v3);
  }
}

- (void)resumeUpdates
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  HDLocationDataCollector *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ HDLocationDataCollector: Resume updates.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HDLocationDataCollector_resumeUpdates__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__HDLocationDataCollector_resumeUpdates__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[8];
  if (!v3)
  {
    objc_msgSend(v2, "startUpdates");
    return;
  }
  if (v3 == 3 || v3 == 1)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      return;
    v6 = *(_QWORD *)(a1 + 32);
    v14 = 138543362;
    v15 = v6;
    v7 = "[routes] %{public}@ location updates already started or ended, ignoring resume request";
    v8 = v5;
    v9 = 12;
    goto LABEL_14;
  }
  v2[8] = 1;
  v10 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(v10 + 72) - 3) < 2)
  {
    -[HDLocationDataCollector _queue_resumeWorkout](v10);
    return;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_DWORD *)(v12 + 72);
    v14 = 138543618;
    v15 = v12;
    v16 = 1024;
    v17 = v13;
    v7 = "[routes] %{public}@ Last status was %d, location not approved";
    v8 = v11;
    v9 = 18;
LABEL_14:
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
  }
}

- (void)_queue_resumeWorkout
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (*(double *)(a1 + 96) <= 0.0 || (*(_DWORD *)(a1 + 72) - 3) > 1)
    {
      _HKInitializeLogging();
      v3 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 96);
        v5 = 138543618;
        v6 = a1;
        v7 = 2048;
        v8 = v4;
        _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ GPS was stopped; restart GPS. Last paused time: %f",
          (uint8_t *)&v5,
          0x16u);
      }
      *(_QWORD *)(a1 + 96) = 0xBFF0000000000000;
      -[HDLocationDataCollector _queue_setupLocationUpdates](a1);
    }
    else
    {
      _HKInitializeLogging();
      v2 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138543362;
        v6 = a1;
        _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ We resumed the workout before GPS was stopped. Don't restart GPS", (uint8_t *)&v5, 0xCu);
      }
      *(_QWORD *)(a1 + 96) = 0xBFF0000000000000;
    }
  }
}

void __54__HDLocationDataCollector__handleElevationData_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v3 = *(void **)(a1 + 40)) == 0)
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(v8 + 144);
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "[routes] [elevation] %{public}@ Error updating: %@, %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v4 = objc_msgSend(v3, "elevationAscended");
    v5 = *(_QWORD *)(a1 + 48);
    if (*(double *)(v5 + 96) <= 0.0)
    {
      if (v4)
      {
        v6 = *(_QWORD *)(v5 + 104);
        v7 = v4 - v6;
        if (v4 != v6)
        {
          *(_QWORD *)(v5 + 104) = v4;
          objc_msgSend(*(id *)(a1 + 48), "delegate");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "elevationUpdated:", v7);

        }
      }
    }
    else
    {
      *(_QWORD *)(v5 + 104) = v4;
    }
  }
}

- (void)_queue_savedLocationData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_didSaveLocationData = 1;
}

- (void)healthLocationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  NSObject *queue;
  _QWORD v5[5];
  int v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__HDLocationDataCollector_healthLocationManager_didChangeAuthorizationStatus___block_invoke;
  v5[3] = &unk_1E6D0D1D8;
  v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

void __78__HDLocationDataCollector_healthLocationManager_didChangeAuthorizationStatus___block_invoke(uint64_t a1)
{
  unsigned int v1;
  os_log_t *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 40) - 3;
  if (v1 < 2 != (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) - 3) < 2)
  {
    _HKInitializeLogging();
    v3 = (os_log_t *)MEMORY[0x1E0CB5380];
    v4 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD *)(v5 + 72);
      v7 = *(_DWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v5;
      v20 = 1024;
      v21 = v6;
      v22 = 1024;
      v23 = v7;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Did change location authorization (%d -> %d)", (uint8_t *)&v18, 0x18u);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_DWORD *)(a1 + 40);
    if (v1 > 1)
    {
      _HKInitializeLogging();
      v12 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v18 = 138543362;
        v19 = v13;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization change: pause location updates.", (uint8_t *)&v18, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("HDPauseWorkoutGPSTimeout"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = objc_msgSend(v15, "unsignedIntegerValue");
      else
        v16 = 180;

      -[HDLocationDataCollector _queue_pauseLocationUpdatesAfterDelay:](*(_QWORD *)(a1 + 32), v16);
    }
    else
    {
      v8 = *(double *)(*(_QWORD *)(a1 + 32) + 96);
      _HKInitializeLogging();
      v9 = *v3;
      v10 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
      if (v8 <= 0.0)
      {
        if (v10)
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = 138543362;
          v19 = v17;
          _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization change: start location updates.", (uint8_t *)&v18, 0xCu);
        }
        -[HDLocationDataCollector _queue_setupLocationUpdates](*(_QWORD *)(a1 + 32));
      }
      else
      {
        if (v10)
        {
          v11 = *(_QWORD *)(a1 + 32);
          v18 = 138543362;
          v19 = v11;
          _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization change: resume location updates.", (uint8_t *)&v18, 0xCu);
        }
        -[HDLocationDataCollector _queue_resumeWorkout](*(_QWORD *)(a1 + 32));
      }
    }
  }
}

- (void)healthLocationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HDLocationDataCollector_healthLocationManager_didUpdateLocations___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __68__HDLocationDataCollector_healthLocationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t v9;
  void *v10;
  os_log_t v11;
  double v12;
  uint64_t v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id WeakRetained;
  BOOL v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  __int128 v42;
  id v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  _BYTE v53[18];
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (*(double *)(*(_QWORD *)(a1 + 32) + 96) <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v47;
      v8 = (os_log_t *)MEMORY[0x1E0CB5380];
      *(_QWORD *)&v5 = 138543874;
      v42 = v5;
      v43 = v3;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v47 != v7)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
          _HKInitializeLogging();
          v11 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            v44 = *(_QWORD *)(a1 + 32);
            v15 = v11;
            objc_msgSend(v10, "coordinate");
            v17 = v16;
            objc_msgSend(v10, "coordinate");
            v19 = v18;
            objc_msgSend(v10, "altitude");
            v21 = v20;
            objc_msgSend(v10, "speed");
            v23 = v22;
            v24 = v2;
            v25 = objc_msgSend(v10, "type");
            objc_msgSend(v10, "timestamp");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v51 = v44;
            v52 = 2048;
            *(_QWORD *)v53 = v17;
            *(_WORD *)&v53[8] = 2048;
            *(_QWORD *)&v53[10] = v19;
            v54 = 2048;
            v55 = v21;
            v56 = 2048;
            v57 = v23;
            v58 = 1024;
            v59 = v25;
            v2 = v24;
            v3 = v43;
            v60 = 2112;
            v61 = v26;
            _os_log_debug_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEBUG, "[routes] %{public}@ Did update with location. coord (%f %f) altitude: %f speed: %f, type: %d date: %@", buf, 0x44u);

          }
          if ((objc_msgSend(v10, "type", v42) == 1
             || objc_msgSend(v10, "type") == 9
             || objc_msgSend(v10, "type") == 3
             || objc_msgSend(v10, "type") == 11)
            && (objc_msgSend(v10, "horizontalAccuracy"), v12 < 50.0))
          {
            objc_msgSend(v2, "addObject:", v10);
            v13 = 120;
          }
          else
          {
            _HKInitializeLogging();
            v14 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              v27 = *(_QWORD *)(a1 + 32);
              v28 = v14;
              v29 = objc_msgSend(v10, "type");
              objc_msgSend(v10, "horizontalAccuracy");
              *(_DWORD *)buf = v42;
              v51 = v27;
              v3 = v43;
              v52 = 1024;
              *(_DWORD *)v53 = v29;
              *(_WORD *)&v53[4] = 2048;
              *(_QWORD *)&v53[6] = v30;
              _os_log_debug_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEBUG, "[routes] %{public}@ Skipped adding location of type: %d, horizontal accuracy: %g", buf, 0x1Cu);

            }
            v13 = 128;
          }
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + v13);
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v2, "count"))
    {
      v31 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      if (v31)
      {
        objc_msgSend(v31, "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        v45 = 0;
        v34 = +[HDLocationSeriesSampleEntity insertLocationData:seriesIdentifier:profile:error:](HDLocationSeriesSampleEntity, "insertLocationData:seriesIdentifier:profile:error:", v2, v32, WeakRetained, &v45);
        v35 = v45;

        if (v34)
        {
          objc_msgSend(v2, "lastObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "altitude");
          v38 = v37;

          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "altitudeUpdated:", v38);

          objc_msgSend(*(id *)(a1 + 32), "_queue_savedLocationData");
        }
        else
        {
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v41 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v51 = v41;
            v52 = 2114;
            *(_QWORD *)v53 = v35;
            _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "[routes] %{public}@ Did not successfully save location. Error: %{public}@", buf, 0x16u);
          }
        }

      }
    }

  }
}

- (void)healthLocationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  HDLocationDataCollector *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    v10 = 138543874;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    v14 = 1024;
    v15 = objc_msgSend(v7, "code");
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "[routes] %{public}@ %@ failed to get location with error: %d", (uint8_t *)&v10, 0x1Cu);

  }
}

- (CMElevation)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
  objc_storeStrong((id *)&self->_elevation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locationUpdatingAssertion, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sampleSavingDelegate, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
