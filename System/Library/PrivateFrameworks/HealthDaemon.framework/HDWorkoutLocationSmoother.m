@implementation HDWorkoutLocationSmoother

- (HDWorkoutLocationSmoother)initWithProfile:(id)a3
{
  id v4;
  HDWorkoutLocationSmoother *v5;
  uint64_t v6;
  OS_dispatch_queue *queue;
  NSMutableArray *v8;
  NSMutableArray *pendingSmoothingTasks;
  HDSmoothingTask *currentSmoothingTask;
  id WeakRetained;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDWorkoutLocationSmoother;
  v5 = -[HDWorkoutLocationSmoother init](&v13, sel_init);
  if (v5)
  {
    HKCreateSerialUtilityDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_profile, v4);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingSmoothingTasks = v5->_pendingSmoothingTasks;
    v5->_pendingSmoothingTasks = v8;

    currentSmoothingTask = v5->_currentSmoothingTask;
    v5->_currentSmoothingTask = 0;

    WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v5, v5->_queue);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeProtectedDataObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processStateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterForegroundClientProcessObserver:", self);

  if (-[HDWorkoutLocationSmoother _shouldObserveWorkouts]((uint64_t)self))
  {
    v9 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v9, "dataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:forDataType:", self, v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)HDWorkoutLocationSmoother;
  -[HDWorkoutLocationSmoother dealloc](&v12, sel_dealloc);
}

- (uint64_t)_shouldObserveWorkouts
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v1 = (id *)(a1 + 24);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAppleWatch"))
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "daemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "behavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsWorkoutRouteSmoothing");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_associationsSyncedForWorkout:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[routes] Workout-sample associations occurred, start smoothing if unlocked.", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HDWorkoutLocationSmoother__associationsSyncedForWorkout___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __59__HDWorkoutLocationSmoother__associationsSyncedForWorkout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");

  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
    -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](v5);
  else
    *(_BYTE *)(v5 + 56) = 1;
}

- (void)_queue_smoothAllUnsmoothedLocationSeries
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  HDSmoothingTask *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  _QWORD v40[4];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 102);
    v2 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v25 = (void *)v2;
    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v2, WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(v5, "metadataManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithMetadataKey:value:operatorType:", *MEMORY[0x1E0CB7360], 0, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setPredicate:", v7);
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("end_date"), objc_opt_class(), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOrderingTerms:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __69__HDWorkoutLocationSmoother__queue_smoothAllUnsmoothedLocationSeries__block_invoke;
    v32[3] = &unk_1E6CF4E18;
    v32[4] = a1;
    v11 = v10;
    v33 = v11;
    v26 = objc_msgSend(v4, "enumerateWithError:handler:", &v34, v32);
    v27 = v34;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v18 = [HDSmoothingTask alloc];
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[HDSmoothingTask _initWithWorkout:routes:](v18, v17, v19);

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v14);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      -[HDWorkoutLocationSmoother _queue_smoothNextSample](a1);
    if ((v26 & 1) != 0)
    {
      v21 = 0;
      v22 = v25;
      v23 = v27;
    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5380];
      v23 = v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = v27;
        v37 = 2112;
        v38 = v4;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "[routes] Error occurred in enumerator: %{public}@ %@", buf, 0x16u);
      }
      v21 = 1;
      v22 = v25;
    }
    *(_BYTE *)(a1 + 56) = v21;
    *(_BYTE *)(a1 + 57) = 0;

  }
}

uint64_t __69__HDWorkoutLocationSmoother__queue_smoothAllUnsmoothedLocationSeries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7360]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(id **)(a1 + 32);
  v22 = 0;
  -[HDWorkoutLocationSmoother _workoutWithUUIDString:error:](v6, v5, (uint64_t *)&v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  if (v7)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v3, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[routes] Will smooth route: %@, workout: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v14, "addObject:", v3);
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E0CB5380];
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (!v16)
        goto LABEL_12;
      v14 = v15;
      objc_msgSend(v3, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v5;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v8;
      v18 = "[routes] Unable to fetch workout %@ for route %@. Error: %@";
      v19 = v14;
      v20 = 32;
    }
    else
    {
      if (!v16)
        goto LABEL_12;
      v14 = v15;
      objc_msgSend(v3, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v5;
      v18 = "[routes] Route %@ is orphaned, workout %@ doesn't exist.";
      v19 = v14;
      v20 = 22;
    }
    _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

  }
LABEL_12:

  return 1;
}

- (id)_workoutWithUUIDString:(uint64_t *)a3 error:
{
  id v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    WeakRetained = objc_loadWeakRetained(a1 + 3);
    +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDWorkoutEntity, "objectWithUUID:encodingOptions:profile:error:", v6, 0, WeakRetained, a3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();

    if (!a1)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v10 = *a3;
        v11 = 138412546;
        v12 = v5;
        v13 = 2114;
        v14 = v10;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[routes] Failed to find workout with UUID=%@: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      a1 = 0;
    }
  }

  return a1;
}

- (void)_queue_smoothNextSample
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id obj;
  uint8_t buf[4];
  id *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (id *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "hk_dequeue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v3;
      if (v3)
      {
        v4 = v3;
        +[HKDaemonTransaction transactionWithOwner:](HDDaemonTransaction, "transactionWithOwner:", a1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSmoothingTask setTransaction:]((uint64_t)v4, v5);

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "hk_BOOLForKey:defaultValue:", CFSTR("HDLocationSmootherSmoothWithZeroLocations"), 0);

        objc_msgSend(v4[2], "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB73A0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[HDSmoothingTask totalLocations]((uint64_t)v4) || v9 || (v7 & 1) != 0)
        {
          v4[7] = (id)1;
          _HKInitializeLogging();
          v21 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v4;
            _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[routes] New smoothing task will run: %{public}@", buf, 0xCu);
          }
          objc_storeStrong(v2, obj);
          -[HDWorkoutLocationSmoother _queue_scheduleSmoothingTimeoutTimerForTask:]((dispatch_queue_t *)a1, v4);
          -[HDWorkoutLocationSmoother _queue_startSmoothingTask:](a1, v4);
        }
        else
        {
          _HKInitializeLogging();
          v10 = (void *)*MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v11 = v4[2];
            v12 = v10;
            objc_msgSend(v11, "UUID");
            v13 = (id *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v24 = v13;
            _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[routes] Workout %{public}@ has 0 locations; deleting it.",
              buf,
              0xCu);

          }
          -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](a1, v4);
          -[HDWorkoutLocationSmoother _finishSmoothingSampleWithTask:](a1, v4);
        }

      }
      else
      {
        objc_msgSend((id)a1, "didCompleteAllPendingSmoothingTasksHandler");
        v14 = objc_claimAutoreleasedReturnValue();
        v4 = (id *)v14;
        if (v14)
          (*(void (**)(uint64_t))(v14 + 16))(v14);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        objc_msgSend(WeakRetained, "nanoSyncManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("Workout route smoothed"), &__block_literal_global_77);

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
        v18 = objc_loadWeakRetained((id *)(a1 + 24));
        objc_msgSend(v18, "cloudSyncManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:", v17);
        objc_msgSend(v19, "syncWithRequest:reason:completion:", v20, CFSTR("Workout route smoothed"), &__block_literal_global_246);

      }
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  int v7;
  objc_class *v8;
  void *v9;
  OS_dispatch_queue *queue;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[16];

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProtectedDataAvailable");

  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __51__HDWorkoutLocationSmoother_profileDidBecomeReady___block_invoke;
    v31[3] = &unk_1E6CE80E8;
    v31[4] = self;
    +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", v9, queue, v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v12, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "maintenanceWorkCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enqueueMaintenanceOperation:", v11);

  }
  else if (!self)
  {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v15, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "behavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isCompanionCapable");

  if (v18)
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[routes] Set up location observers", buf, 2u);
    }
    self->_isFirstLaunchAndNotYetSmoothed = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel__associationsSyncedForWorkout_, CFSTR("HDAssociationEntityDidReceiveSyncObjectsNotification"), 0);

    v21 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v21, "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addProtectedDataObserver:queue:", self, self->_queue);

    v23 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v23, "daemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "processStateManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "registerForegroundClientProcessObserver:", self);

  }
  if (-[HDWorkoutLocationSmoother _shouldObserveWorkouts]((uint64_t)self))
  {
    v26 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v26, "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addProtectedDataObserver:queue:", self, self->_queue);

    v28 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v28, "dataManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:forDataType:", self, v30);

  }
}

void __51__HDWorkoutLocationSmoother_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](*(_QWORD *)(a1 + 32));
}

- (void)foregroundClientProcessesDidChange:(id)a3 previouslyForegroundBundleIdentifiers:(id)a4
{
  id WeakRetained;
  void *v6;
  int v7;
  NSObject *queue;
  _QWORD block[5];

  if (objc_msgSend(a3, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isProtectedDataAvailable");

    if (v7)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __102__HDWorkoutLocationSmoother_foregroundClientProcessesDidChange_previouslyForegroundBundleIdentifiers___block_invoke;
      block[3] = &unk_1E6CE80E8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

void __102__HDWorkoutLocationSmoother_foregroundClientProcessesDidChange_previouslyForegroundBundleIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[routes] Activity app launched, is first launch, and is unlocked.", v3, 2u);
    }
    -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](*(_QWORD *)(a1 + 32));
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (self->_isFirstLaunchAndNotYetSmoothed)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:
        -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries]((uint64_t)self);
        return;
      }
      v10 = 0;
      v7 = "[routes] Protected data available and isFirstLaunch; Attempting to smooth unsmoothed routes.";
      v8 = (uint8_t *)&v10;
    }
    else
    {
      if (!self->_needToCheckForLocationSeriesOnUnlock)
        return;
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v9 = 0;
      v7 = "[routes] Protected data available; location samples were possibly added while locked; check for workout route.";
      v8 = (uint8_t *)&v9;
    }
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_9;
  }
}

- (void)_queue_locationManagerDidSmoothRoutes:(void *)a3 forTask:(void *)a4 error:
{
  id v7;
  id *v8;
  id v9;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id *v16;
  id v17;
  uint64_t v18;
  os_log_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  os_log_t v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  os_log_t v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void (**v34)(id, id, id, _QWORD);
  int v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    v10 = (os_log_t *)MEMORY[0x1E0CB5380];
    v11 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v35 = 134217984;
      v36 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[routes] Successfully smoothed %lu routes", (uint8_t *)&v35, 0xCu);

    }
    if (v8 && ((_BYTE)v8[1] & 1) != 0)
    {
      _HKInitializeLogging();
      v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v20 = v8[2];
        v21 = v19;
        objc_msgSend(v20, "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = (uint64_t)v22;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[routes] Did finish smoothing locations after timeout for workout %{public}@, locations will be ignored.", (uint8_t *)&v35, 0xCu);

      }
    }
    else
    {
      -[HDWorkoutLocationSmoother _queue_cancelTimeout](a1);
      if (v9)
      {
        objc_msgSend(v9, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("CLSmootherErrorDomain"));

        if (v14 && (unint64_t)(objc_msgSend(v9, "code") - 3) <= 1)
        {
          v15 = a1;
          v16 = v8;
          v17 = v9;
          v18 = 1;
        }
        else
        {
          v15 = a1;
          v16 = v8;
          v17 = v9;
          v18 = 0;
        }
        -[HDWorkoutLocationSmoother _queue_smoothingDidFailForTask:error:shouldRetry:](v15, v16, v17, v18);
      }
      else
      {
        _HKInitializeLogging();
        v23 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
            v24 = v8[2];
          else
            v24 = 0;
          v25 = v24;
          v26 = v23;
          objc_msgSend(v25, "UUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138543362;
          v36 = (uint64_t)v27;
          _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "[routes] Did finish smoothing locations for workout %{public}@", (uint8_t *)&v35, 0xCu);

        }
        if (!objc_msgSend(v7, "count") && !-[HDSmoothingTask totalLocations]((uint64_t)v8))
        {
          _HKInitializeLogging();
          v28 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            if (v8)
              v29 = v8[2];
            else
              v29 = 0;
            v30 = v29;
            v31 = v28;
            objc_msgSend(v30, "UUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 138543362;
            v36 = (uint64_t)v32;
            _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "[routes] Smoothed route has 0 locations for workout %{public}@, deleting it", (uint8_t *)&v35, 0xCu);

          }
          -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](a1, v8);
        }
        if (v8)
        {
          v33 = v8[5];
          if (v33)
          {
            v34 = (void (**)(id, id, id, _QWORD))v33;
            v34[2](v34, v7, v8[7], 0);

          }
        }
        -[HDWorkoutLocationSmoother _finishSmoothingSampleWithTask:](a1, v8);
      }
    }
  }

}

- (void)_queue_cancelTimeout
{
  NSObject *v2;
  void *v3;

  v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

  }
}

- (void)_queue_smoothingDidFailForTask:(void *)a3 error:(int)a4 shouldRetry:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  os_log_t *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  os_log_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(id, void *, _QWORD, id);
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id WeakRetained;
  void *v35;
  void *v36;
  int v37;
  const __CFString *v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
    goto LABEL_32;
  if (!a4 || v7 && *((_QWORD *)v7 + 7) > 2uLL)
  {
    _HKInitializeLogging();
    v14 = (os_log_t *)MEMORY[0x1E0CB5380];
    v15 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_FAULT))
    {
      if (v7)
        v30 = (void *)*((_QWORD *)v7 + 2);
      else
        v30 = 0;
      v31 = v30;
      v32 = v15;
      objc_msgSend(v31, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "daemon");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "behavior");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isAppleWatch");
      v38 = CFSTR("Phone");
      *(_DWORD *)buf = 138544130;
      v43 = 2048;
      v42 = v33;
      v44 = 3;
      if (v37)
        v38 = CFSTR("Watch");
      v45 = 2112;
      v46 = v38;
      v47 = 2112;
      v48 = v8;
      _os_log_fault_impl(&dword_1B7802000, v32, OS_LOG_TYPE_FAULT, "[routes] Couldn't smooth routes for workout %{public}@ after %ld attempts on device %@, marking as v2. Error: %@", buf, 0x2Au);

    }
    if (-[HDSmoothingTask totalLocations]((uint64_t)v7))
    {
      if (v7)
      {
        v16 = *((id *)v7 + 3);
        v17 = (void *)*((_QWORD *)v7 + 2);
      }
      else
      {
        v16 = 0;
        v17 = 0;
      }
      v39 = 0;
      v18 = v17;
      -[HDWorkoutLocationSmoother _queue_createNewSeriesFromTask:locations:error:](a1, v7, 0, &v39);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v39;

      if (!v19)
      {
        _HKInitializeLogging();
        v21 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v20;
          _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[routes] An error occurred marking routes as V2: %{public}@", buf, 0xCu);
        }
      }

      if (!v7)
        goto LABEL_31;
    }
    else
    {
      _HKInitializeLogging();
      v22 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v7)
          v23 = (void *)*((_QWORD *)v7 + 2);
        else
          v23 = 0;
        v24 = v23;
        v25 = v22;
        objc_msgSend(v24, "UUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v26;
        _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[routes] v2 route has 0 locations for workout %{public}@, deleting it", buf, 0xCu);

      }
      -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](a1, v7);
      v19 = 0;
      if (!v7)
        goto LABEL_31;
    }
    v27 = (void *)*((_QWORD *)v7 + 5);
    if (v27)
    {
      if (v19)
      {
        v40 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)*((_QWORD *)v7 + 5);
      }
      else
      {
        v28 = 0;
      }
      v29 = v27;
      v29[2](v29, v28, *((_QWORD *)v7 + 7), v8);

    }
LABEL_31:
    -[HDWorkoutLocationSmoother _finishSmoothingSampleWithTask:](a1, v7);

    goto LABEL_32;
  }
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v10 = (void *)*((_QWORD *)v7 + 2);
    else
      v10 = 0;
    v11 = v10;
    v12 = v9;
    objc_msgSend(v11, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v13;
    v43 = 2112;
    v44 = (uint64_t)v8;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[routes] Smoothing did fail for workout %{public}@ with error: %@", buf, 0x16u);

  }
  if (v7)
    ++*((_QWORD *)v7 + 7);
  -[HDWorkoutLocationSmoother _queue_scheduleSmoothingTimeoutTimerForTask:](a1, v7);
  -[HDWorkoutLocationSmoother _queue_startSmoothingTask:](a1, v7);
LABEL_32:

}

- (void)_queue_deleteRoutesForTasks:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  HDDataDeletionConfiguration *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id obj;
  id *location;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  _QWORD v41[4];

  v41[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v3;
  if (v3)
    v4 = (void *)*((_QWORD *)v3 + 3);
  else
    v4 = 0;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    location = (id *)(a1 + 24);
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v9 = objc_alloc_init(HDDataDeletionConfiguration);
        -[HDDataDeletionConfiguration setNotifyObservers:](v9, "setNotifyObservers:", 0);
        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(WeakRetained, "dataManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v14 = objc_msgSend(v11, "deleteObjectsWithUUIDCollection:configuration:error:", v13, v9, &v33);
        v15 = v33;

        v16 = 0;
        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v22 = v17;
            objc_msgSend(v8, "UUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = 138543874;
            v36 = v23;
            v37 = 2048;
            v38 = v24;
            v39 = 2114;
            v40 = v15;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[routes] Error deleting route sample %{public}@ with %lu location(s): %{public}@", buf, 0x20u);

          }
          v18 = v15;
          v16 = v18;
          if (v18)
            v19 = objc_retainAutorelease(v18);

        }
        v20 = v16;
        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          v21 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v20;
            _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[routes] An error occurred deleting old route series %{public}@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

}

- (void)_finishSmoothingSampleWithTask:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HDWorkoutLocationSmoother__finishSmoothingSampleWithTask___block_invoke;
  v6[3] = &unk_1E6CE8080;
  v6[4] = a1;
  v5 = v3;
  v7 = v5;
  dispatch_async(v4, v6);

}

void __52__HDWorkoutLocationSmoother__queue_smoothNextSample__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  v6 = *MEMORY[0x1E0CB5380];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Successfully synced smoothed route", (uint8_t *)&v7, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[routes] Failed to sync smoothed workout route with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __52__HDWorkoutLocationSmoother__queue_smoothNextSample__block_invoke_245(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to cloud sync after route smoothing: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)_queue_scheduleSmoothingTimeoutTimerForTask:(dispatch_queue_t *)a1
{
  double *v3;
  dispatch_source_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  int64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  double *v10;
  _QWORD handler[4];
  double *v12;
  id v13;
  id location;

  v3 = a2;
  -[HDWorkoutLocationSmoother _queue_cancelTimeout]((uint64_t)a1);
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a1[2]);
  v5 = a1[6];
  a1[6] = v4;

  objc_initWeak(&location, a1);
  v6 = a1[6];
  if (v3)
    v7 = (uint64_t)(v3[8] * 1000000000.0);
  else
    v7 = 0;
  v8 = dispatch_time(0, v7);
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9 = a1[6];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __73__HDWorkoutLocationSmoother__queue_scheduleSmoothingTimeoutTimerForTask___block_invoke;
  handler[3] = &unk_1E6CED848;
  v10 = v3;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(a1[6]);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (void)_queue_startSmoothingTask:(uint64_t)a1
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  _QWORD *v39;
  id v40;
  NSObject *group;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  id v47;
  _QWORD block[5];
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  _QWORD *v59;
  char v60;
  _QWORD v61[5];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v44 = a1;
  v46 = v3;
  if (!*(_QWORD *)(a1 + 8))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C9E3E8]);
    v5 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;

    v3 = v46;
  }
  if (v3)
    v6 = (void *)v3[2];
  else
    v6 = 0;
  v7 = v3 == 0;
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7390]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v43, "BOOLValue");
  group = dispatch_group_create();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__72;
  v61[4] = __Block_byref_object_dispose__72;
  v62 = 0;
  if (v7)
    v9 = 0;
  else
    v9 = (void *)v46[2];
  v47 = v9;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v47, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB73A0];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB73A0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v47, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hk_isBeforeDate:", v45);

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v47, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v45);

      objc_msgSend(v10, "addObject:", v17);
    }
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v47, "workoutEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v64 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v22, "metadata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v12);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v22, "dateInterval");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "startDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "hk_isBeforeDate:", v24))
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v26, v24);
            objc_msgSend(v10, "addObject:", v27);

          }
        }

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v19);
  }

  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = v46;
  if (v46)
    v29 = (void *)v46[2];
  v30 = v29;
  objc_msgSend(v30, "workoutActivities");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(group);
  v32 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke;
  v52[3] = &unk_1E6CF4EF8;
  v33 = v31;
  v53 = v33;
  v54 = v44;
  v34 = v46;
  v55 = v34;
  v59 = v61;
  v35 = v10;
  v56 = v35;
  v36 = group;
  v57 = v36;
  v60 = v42;
  v37 = v28;
  v58 = v37;
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v52);
  dispatch_group_leave(v36);
  v38 = *(NSObject **)(v44 + 16);
  block[0] = v32;
  block[1] = 3221225472;
  block[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_4;
  block[3] = &unk_1E6CEF6D8;
  v51 = v61;
  block[4] = v44;
  v39 = v34;
  v49 = v39;
  v50 = v37;
  v40 = v37;
  dispatch_group_notify(v36, v38, block);

  _Block_object_dispose(v61, 8);
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  double v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  id WeakRetained;
  void *v28;
  id v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD *v52;
  _QWORD *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  _QWORD *v66;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[routes] Smoothing route for activity %@", buf, 0xCu);
  }
  objc_msgSend(v5, "workoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activityType");

  if (a3)
  {
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD **)(a1 + 48);
  v56 = v8;
  if (v11)
    v11 = (_QWORD *)v11[3];
  v64 = 0;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  if (v12)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v71 != v19)
            objc_enumerationMutation(v13);
          v18 += objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "count");
        }
        v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    v21 = MEMORY[0x1E0C809B0];
    if (v14)
    {
      if (v15)
      {
        objc_msgSend(v15, "timeIntervalSinceDate:", v14);
        if (v22 > 0.0 && v22 < (double)v18)
          v18 = vcvtad_u64_f64(v22);
      }
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "hk_BOOLForKey:defaultValue:", CFSTR("HDLocationSmootherSmoothWithOverMaxRouteLength"), 0);

    if (v18 < 0x8CA1 || (v24 & 1) != 0)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
      WeakRetained = objc_loadWeakRetained((id *)(v12 + 24));
      objc_msgSend(WeakRetained, "database");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v21;
      v65[1] = 3221225472;
      v65[2] = __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke;
      v65[3] = &unk_1E6CF26F8;
      v66 = v13;
      v67 = v14;
      v68 = v15;
      v69 = v26;
      v29 = v26;
      v30 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDLocationSeriesSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v28, &v64, v65);

      if (v30)
        v31 = v29;
      else
        v31 = 0;
      v25 = v31;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v64, 130, CFSTR("Cannot smooth route with estimated length %ld"), v18);
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    v21 = MEMORY[0x1E0C809B0];
  }

  v32 = v64;
  if (v25)
  {
    v33 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v5, "startDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v33, "initWithStartDate:endDate:", v34, v35);

    v37 = *(void **)(a1 + 56);
    v62[0] = v21;
    v62[1] = 3221225472;
    v62[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_251;
    v62[3] = &unk_1E6CF4E80;
    v38 = v36;
    v63 = v38;
    objc_msgSend(v37, "hk_map:", v62);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count") || objc_msgSend(v39, "count"))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
      v40 = *(_QWORD *)(a1 + 40);
      v41 = *(void **)(a1 + 48);
      v42 = *(void **)(v40 + 8);
      v43 = v21;
      v44 = *(unsigned __int8 *)(a1 + 88);
      v57[0] = v43;
      v57[1] = 3221225472;
      v57[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_2;
      v57[3] = &unk_1E6CF4ED0;
      v45 = *(_QWORD *)(a1 + 80);
      v57[4] = v40;
      v61 = v45;
      v58 = v41;
      v59 = *(id *)(a1 + 72);
      v60 = *(id *)(a1 + 64);
      objc_msgSend(v42, "smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:", v25, v56, v44, v39, v57);

    }
  }
  else
  {
    v46 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v49 = *(void **)(v46 + 40);
    v47 = (id *)(v46 + 40);
    v48 = v49;
    if (v49)
      v50 = v48;
    else
      v50 = v32;
    objc_storeStrong(v47, v50);
    _HKInitializeLogging();
    v51 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v52 = *(_QWORD **)(a1 + 48);
      if (v52)
        v52 = (_QWORD *)v52[2];
      v53 = v52;
      v54 = v51;
      objc_msgSend(v53, "UUID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v75 = v55;
      v76 = 2114;
      v77 = v32;
      _os_log_impl(&dword_1B7802000, v54, OS_LOG_TYPE_DEFAULT, "[routes] Failed to fetch locations for route with UUID=%@: %{public}@", buf, 0x16u);

    }
  }

}

uint64_t __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_251(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intersectionWithDateInterval:", *(_QWORD *)(a1 + 32));
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_3;
  block[3] = &unk_1E6CF4EA8;
  block[1] = 3221225472;
  v13 = v6;
  v14 = v7;
  v19 = *(_QWORD *)(a1 + 64);
  v15 = v5;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  HDMutableDatabaseTransactionContext *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(a1 + 32);
  objc_storeStrong(v3, v4);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v24 = 0;
    v9 = v6;
    v10 = v8;
    if (v7)
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__72;
      v33 = __Block_byref_object_dispose__72;
      v34 = 0;
      v11 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext setCacheScope:](v11, "setCacheScope:", 1);
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 24));
      objc_msgSend(WeakRetained, "database");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __68__HDWorkoutLocationSmoother__queue_saveLocations_forTask_saveError___block_invoke;
      v25[3] = &unk_1E6CF4F20;
      v28 = &v29;
      v25[4] = v7;
      v26 = v10;
      v27 = v9;
      v15 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v14, &v24, v25, 0);

      if (v15)
        v16 = (void *)v30[5];
      else
        v16 = 0;
      v17 = v16;

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      v17 = 0;
    }

    v18 = v24;
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v17);
    }
    else
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v22 = *(void **)(v19 + 40);
      v20 = (id *)(v19 + 40);
      v21 = v22;
      if (v22)
        v23 = v21;
      else
        v23 = v18;
      objc_storeStrong(v20, v23);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 1;
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
    v4 = 0;
  else
    v4 = *(void **)(a1 + 48);
  -[HDWorkoutLocationSmoother _queue_locationManagerDidSmoothRoutes:forTask:error:](v3, v4, *(void **)(a1 + 40), v2);
}

- (id)_queue_createNewSeriesFromTask:(void *)a3 locations:(_QWORD *)a4 error:
{
  _QWORD *v7;
  id v8;
  id *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  BOOL v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  _QWORD *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  _QWORD *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  id v70;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD *v83;
  id v84;
  id v85;
  id v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _BYTE buf[24];
  void *v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v82 = a1;
    v9 = (id *)(a1 + 24);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(WeakRetained, "sourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = a4;
    if (v7)
      v12 = (void *)v7[2];
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v13, "_source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    objc_msgSend(v11, "localSourceForBundleIdentifier:copyIfNecessary:error:", v15, 1, &v86);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v86;

    if (v16)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99E08]);
      v87[0] = *MEMORY[0x1E0CB55D0];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = v20;
      v87[1] = *MEMORY[0x1E0CB55D8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB7838]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v88[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v18, "initWithDictionary:", v22);

      v79 = v17;
      v81 = v7;
      if (v7)
        v7 = (_QWORD *)v7[3];
      v24 = v23;
      v78 = v16;
      v25 = v16;
      v77 = v8;
      v26 = v8;
      v27 = v7;
      objc_msgSend(MEMORY[0x1E0CB6E58], "_workoutRouteWithDevice:metadata:", 0, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_loadWeakRetained(v9);
      objc_msgSend(v29, "database");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __97__HDWorkoutLocationSmoother__createWorkoutRouteWithMetadata_sourceEntity_locations_routes_error___block_invoke;
      v90 = &unk_1E6CF0058;
      v91 = v82;
      v92 = v28;
      v31 = v25;
      v93 = v31;
      v32 = v26;
      v94 = v32;
      v33 = v27;
      v95 = v33;
      v34 = v24;
      v96 = v34;
      v35 = v28;
      LODWORD(v28) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:", v30, v83, buf);

      objc_msgSend(v35, "_setMetadata:", v34);
      if ((_DWORD)v28)
        v36 = v35;
      else
        v36 = 0;
      v37 = v36;

      if (v37)
      {
        v38 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend(v37, "UUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hk_appendBytesWithUUID:", v39);

        v40 = v81;
        if (v81)
          v40 = (void *)v81[2];
        v41 = v40;
        objc_msgSend(v41, "UUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_loadWeakRetained(v9);
        v85 = v79;
        v76 = v38;
        v44 = +[HDAssociationEntity insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:](HDAssociationEntity, "insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:", v42, v38, 0, 0, v43, &v85);
        v45 = v85;

        if (v44)
        {
          objc_msgSend(v37, "UUID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_loadWeakRetained(v9);
          v84 = v45;
          +[HDAssociationEntity associationUUIDsForObjectUUID:subObjectReference:excludeDeleted:profile:error:](HDAssociationEntity, "associationUUIDsForObjectUUID:subObjectReference:excludeDeleted:profile:error:", v46, 0, 0, v47, &v84);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          v49 = v84;

          v50 = v49;
          _HKInitializeLogging();
          v51 = (id *)MEMORY[0x1E0CB5380];
          v52 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v48;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v49;
            _os_log_impl(&dword_1B7802000, v52, OS_LOG_TYPE_DEFAULT, "[routes] Queried associations table after route insert with parent objects: %{public}@, error: %@", buf, 0x16u);
          }
          _HKInitializeLogging();
          v53 = *v51;
          v7 = v81;
          v16 = v78;
          v80 = v50;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v37, "UUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v81)
            {
              v55 = v81;
              v56 = (void *)v81[2];
            }
            else
            {
              v55 = 0;
              v56 = 0;
            }
            v57 = v56;
            objc_msgSend(v57, "UUID");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v54;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v58;
            _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "[routes] Successfully smoothed route -> %{public}@ for workout %{public}@", buf, 0x16u);

            v7 = v55;
            v16 = v78;
            v50 = v80;
          }

          _HKInitializeLogging();
          v59 = *v51;
          if (os_log_type_enabled((os_log_t)*v51, OS_LOG_TYPE_DEFAULT))
          {
            if (v7)
            {
              v60 = v7;
              v61 = (void *)v7[2];
            }
            else
            {
              v60 = 0;
              v61 = 0;
            }
            v62 = v61;
            v63 = v59;
            objc_msgSend(v62, "UUID");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "UUIDString");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v65;
            _os_log_impl(&dword_1B7802000, v63, OS_LOG_TYPE_DEFAULT, "[routes] Deleting old routes for workout %{public}@", buf, 0xCu);

            v7 = v60;
            v50 = v80;
          }
          -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](v82, v7);
          v66 = v37;
          v8 = v77;
        }
        else
        {
          _HKInitializeLogging();
          v69 = (id)*MEMORY[0x1E0CB5380];
          v8 = v77;
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v37, "UUID");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v81;
            if (v81)
              v73 = (void *)v81[2];
            v74 = v73;
            objc_msgSend(v74, "UUID");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v72;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v75;
            *(_WORD *)&buf[22] = 2114;
            v90 = v45;
            _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "[routes] Failed to associate route %{public}@ with workout %{public}@ %{public}@", buf, 0x20u);

          }
          v70 = v45;
          v48 = v70;
          v7 = v81;
          if (v70)
          {
            v16 = v78;
            if (v83)
            {
              v48 = objc_retainAutorelease(v70);
              v35 = 0;
              *v83 = v48;
            }
            else
            {
              _HKLogDroppedError();
              v35 = 0;
            }
            v50 = v48;
          }
          else
          {
            v50 = 0;
            v35 = 0;
            v16 = v78;
          }
        }

      }
      else
      {
        v35 = 0;
        v50 = v79;
        v7 = v81;
        v16 = v78;
      }

    }
    else
    {
      _HKInitializeLogging();
      v67 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v17;
        _os_log_error_impl(&dword_1B7802000, v67, OS_LOG_TYPE_ERROR, "[routes] Could not fetch local device source. %{public}@", buf, 0xCu);
      }
      v68 = v17;
      v34 = v68;
      if (v68)
      {
        if (v83)
        {
          v34 = objc_retainAutorelease(v68);
          v35 = 0;
          *v83 = v34;
        }
        else
        {
          _HKLogDroppedError();
          v35 = 0;
        }
        v50 = v34;
      }
      else
      {
        v50 = 0;
        v35 = 0;
      }
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

BOOL __68__HDWorkoutLocationSmoother__queue_saveLocations_forTask_saveError___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[HDWorkoutLocationSmoother _queue_createNewSeriesFromTask:locations:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
}

void __60__HDWorkoutLocationSmoother__finishSmoothingSampleWithTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  -[HDWorkoutLocationSmoother _queue_smoothNextSample](*(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(void **)(v4 + 48);
  else
    v5 = 0;
  objc_msgSend(v5, "invalidate");
  -[HDSmoothingTask setTransaction:](*(_QWORD *)(a1 + 40), 0);
}

uint64_t __97__HDWorkoutLocationSmoother__createWorkoutRouteWithMetadata_sourceEntity_locations_routes_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  _QWORD *v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  v47 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v55 = 0;
  v9 = objc_msgSend(v6, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v7, v8, 0, 0, &v55, CFAbsoluteTimeGetCurrent());
  v10 = v55;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v10;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "[routes] Error occurred while saving new series sample: %{public}@", buf, 0xCu);
    }
    v17 = v10;
    if (v17)
    {
      if (!a3)
        goto LABEL_8;
LABEL_13:
      v17 = objc_retainAutorelease(v17);
      v18 = 0;
      *a3 = v17;
      v19 = v17;
      goto LABEL_41;
    }
    goto LABEL_14;
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (!v11)
  {
    v46 = a3;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v17 = *(id *)(a1 + 64);
    v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v51;
      while (2)
      {
        v24 = 0;
        v25 = v10;
        do
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v24), "UUID", v46);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "UUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v25;
          v28 = +[HDLocationSeriesSampleEntity copyLocationDataFromSeriesIdentifier:toSeriesIdentifier:transaction:error:](HDLocationSeriesSampleEntity, "copyLocationDataFromSeriesIdentifier:toSeriesIdentifier:transaction:error:", v26, v27, v47, &v49);
          v10 = v49;

          if (!v28)
          {
            _HKInitializeLogging();
            v34 = (void *)*MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
            {
              v40 = *(void **)(a1 + 40);
              v41 = v34;
              objc_msgSend(v40, "UUID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v58 = v42;
              v59 = 2114;
              v60 = v10;
              _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "[routes] Couldn't copy location data for series sample %{public}@: %{public}@", buf, 0x16u);

            }
            v19 = v10;
            if (v19)
            {
              if (v46)
                *v46 = objc_retainAutorelease(v19);
              else
                _HKLogDroppedError();
            }

            goto LABEL_40;
          }
          ++v24;
          v25 = v10;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v22)
          continue;
        break;
      }
    }

    v15 = v10;
    a3 = v46;
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v54 = v10;
  v14 = +[HDLocationSeriesSampleEntity insertLocationData:seriesIdentifier:profile:error:](HDLocationSeriesSampleEntity, "insertLocationData:seriesIdentifier:profile:error:", v11, v12, v13, &v54);
  v15 = v54;

  if (v14)
  {
LABEL_24:
    objc_msgSend(*(id *)(a1 + 40), "sampleType", v46);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend((id)objc_msgSend(v29, "dataObjectClass"), "hd_dataEntityClass");

    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 72);
    v33 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    v48 = v15;
    objc_msgSend(v30, "freezeSeriesWithIdentifier:metadata:profile:error:", v31, v32, v33, &v48);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v48;

    if (v17)
    {
      v18 = 1;
      goto LABEL_41;
    }
    _HKInitializeLogging();
    v35 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v43 = *(void **)(a1 + 40);
      v44 = v35;
      objc_msgSend(v43, "UUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v45;
      v59 = 2114;
      v60 = v19;
      _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "[routes] Couldn't freeze series %{public}@: %{public}@", buf, 0x16u);

    }
    v19 = v19;
    if (v19)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
LABEL_40:
    v18 = 0;
    goto LABEL_41;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v37 = *(void **)(a1 + 40);
    v38 = v16;
    objc_msgSend(v37, "UUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v39;
    v59 = 2114;
    v60 = v15;
    _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "[routes] Couldn't insert location data for series sample %{public}@: %{public}@", buf, 0x16u);

  }
  v17 = v15;
  if (!v17)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_40;
  }
  if (a3)
    goto LABEL_13;
LABEL_8:
  _HKLogDroppedError();
  v18 = 0;
  v19 = v17;
LABEL_41:

  return v18;
}

uint64_t __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v27;
  _QWORD *v28;
  id obj;
  BOOL v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  objc_msgSend(v31, "databaseForEntityClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v28 = a3;
    v8 = *(_QWORD *)v37;
    v27 = v5;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v10, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForDataUUID();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0;
        +[HDDataEntity anyInDatabase:predicate:error:](HDLocationSeriesSampleEntity, "anyInDatabase:predicate:error:", v5, v12, &v35);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v35;
        v15 = v14;
        if (v13)
        {
          v16 = *(_QWORD *)(a1 + 40);
          v17 = *(_QWORD *)(a1 + 48);
          v34 = 0;
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke_2;
          v32[3] = &unk_1E6CF4F48;
          v33 = *(id *)(a1 + 56);
          LOBYTE(v16) = objc_msgSend(v13, "enumerateLocationDataInTransaction:startDate:endDate:error:handler:", v31, v16, v17, &v34, v32);
          v18 = v34;
          v19 = v18;
          if ((v16 & 1) != 0)
          {
            v20 = 0;
          }
          else
          {
            v21 = v18;
            v22 = v21;
            v30 = v21 == 0;
            if (v21)
            {
              if (v28)
                *v28 = objc_retainAutorelease(v21);
              else
                _HKLogDroppedError();
              v5 = v27;
            }

            v20 = 1;
          }

        }
        else if (v14)
        {
          if (v28)
          {
            v30 = 0;
            *v28 = objc_retainAutorelease(v14);
          }
          else
          {
            _HKLogDroppedError();
            v30 = 0;
          }
          v20 = 1;
          v5 = v27;
        }
        else
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v10, "UUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "hk_assignError:code:format:", v28, 100, CFSTR("Did not find the expected route sample with UUID=%@"), v24);

          v30 = 0;
          v20 = 1;
        }

        if (v20)
        {
          v25 = v30;
          goto LABEL_27;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v7)
        continue;
      break;
    }
  }
  v25 = 1;
LABEL_27:

  return v25 & 1;
}

uint64_t __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __73__HDWorkoutLocationSmoother__queue_scheduleSmoothingTimeoutTimerForTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (id)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3)
      v3 = (_QWORD *)v3[2];
    v4 = v3;
    objc_msgSend(v4, "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v7 = *(_QWORD *)(v7 + 64);
    v11 = 138543618;
    v12 = v5;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[routes] Smoothing did timeout for workout %{public}@ after %f sec", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Smoothing task timed out"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    *(_BYTE *)(v9 + 8) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDWorkoutLocationSmoother _queue_smoothingDidFailForTask:error:shouldRetry:]((uint64_t)WeakRetained, *(void **)(a1 + 32), v8, 1);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HDWorkoutLocationSmoother_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __49__HDWorkoutLocationSmoother_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  int v7;
  uint64_t v8;
  uint8_t v9[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "Workout Sample saved. Attempting to smooth all unsmoothed location series samples.", v9, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "unitTest_wilTriggerSmoothing");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProtectedDataAvailable");

  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
    -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](v8);
  else
    *(_BYTE *)(v8 + 56) = 1;

}

- (void)smoothRouteWithWorkoutUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *queue;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  HDWorkoutLocationSmoother *v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  HDDataEntityPredicateForDataUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDWorkoutEntity, "anyWithPredicate:healthDatabase:error:", v8, v10, &v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v30;

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 102);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->_profile);
    HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(objc_msgSend(v11, "persistentID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    +[HDSampleEntity samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:](HDSeriesSampleEntity, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v13, v14, 0, v15, 0, 0, &v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v29;

    if (v16)
    {
      objc_msgSend(v6, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v17;
      -[HDWorkoutLocationSmoother _workoutWithUUIDString:error:]((id *)&self->super.isa, v18, (uint64_t *)&v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v28;

      if (v19)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke;
        block[3] = &unk_1E6CE7E08;
        v24 = v16;
        v22 = v19;
        v25 = v22;
        v26 = self;
        v27 = v7;
        dispatch_sync(queue, block);

      }
      else
      {
        (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v20);
        v22 = 0;
      }
    }
    else
    {
      v20 = v17;
      v22 = v20;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("Object not found"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v22);
    }

  }
  else
  {
    v20 = v12;
    v13 = v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("Object not found"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
  }

}

void __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  HDSmoothingTask *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  int v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = [HDSmoothingTask alloc];
        v9 = *(void **)(a1 + 40);
        v22 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HDSmoothingTask _initWithWorkout:routes:](v8, v9, v10);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "addObject:", v11);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke_2;
    v16[3] = &unk_1E6CE7DE0;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "setDidCompleteAllPendingSmoothingTasksHandler:", v16);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 24));
    objc_msgSend(WeakRetained, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isProtectedDataAvailable");

    v15 = *(_QWORD *)(a1 + 48);
    if (v14)
      -[HDWorkoutLocationSmoother _queue_smoothNextSample](v15);
    else
      *(_BYTE *)(v15 + 56) = 1;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unitTest_smoothRouteSample:(id)a3 withSmoother:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HDWorkoutLocationSmoother_unitTest_smoothRouteSample_withSmoother_completion___block_invoke;
  v15[3] = &unk_1E6CE7E08;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

void __80__HDWorkoutLocationSmoother_unitTest_smoothRouteSample_withSmoother_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  HDSmoothingTask *v11;
  void *v12;
  _QWORD *v13;
  const char *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 48);
    v4 = v2;
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[routes] Will smooth sample %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 48), "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7360]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(id **)(a1 + 32);
  v15 = 0;
  -[HDWorkoutLocationSmoother _workoutWithUUIDString:error:](v8, v7, (uint64_t *)&v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v11 = [HDSmoothingTask alloc];
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDSmoothingTask _initWithWorkout:routes:](v11, v9, v12);

    if (v13)
    {
      v13[8] = 0x3FC999999999999ALL;
      objc_setProperty_nonatomic_copy(v13, v14, *(id *)(a1 + 56), 40);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v13);
    -[HDWorkoutLocationSmoother _queue_smoothNextSample](*(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (id)didCompleteAllPendingSmoothingTasksHandler
{
  return self->_didCompleteAllPendingSmoothingTasksHandler;
}

- (void)setDidCompleteAllPendingSmoothingTasksHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)unitTest_wilTriggerSmoothing
{
  return self->_unitTest_wilTriggerSmoothing;
}

- (void)setUnitTest_wilTriggerSmoothing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_wilTriggerSmoothing, 0);
  objc_storeStrong(&self->_didCompleteAllPendingSmoothingTasksHandler, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_currentSmoothingTask, 0);
  objc_storeStrong((id *)&self->_pendingSmoothingTasks, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_smoother, 0);
}

@end
