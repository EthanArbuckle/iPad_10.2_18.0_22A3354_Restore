@implementation HDHeartRateWidgetDataManager

- (HDHeartRateWidgetDataManager)initWithProfile:(id)a3
{
  id v4;
  HDHeartRateWidgetDataManager *v5;
  HDHeartRateWidgetDataManager *v6;
  uint64_t v7;
  HKSampleType *workoutType;
  uint64_t v9;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v12;
  id v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  uint64_t v16;
  _HKDelayedOperation *reloadOperation;
  id v18;
  OS_dispatch_queue *v19;
  double v20;
  uint64_t v21;
  _HKDelayedOperation *relevanceReloadOperation;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDHeartRateWidgetDataManager;
  v5 = -[HDHeartRateWidgetDataManager init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(MEMORY[0x1E0CB6B00], "workoutType");
    v7 = objc_claimAutoreleasedReturnValue();
    workoutType = v6->_workoutType;
    v6->_workoutType = (HKSampleType *)v7;

    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

    objc_initWeak(&location, v6);
    v13 = objc_alloc(MEMORY[0x1E0CB6F80]);
    v14 = v6->_queue;
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke;
    v26[3] = &unk_1E87F01B8;
    objc_copyWeak(&v27, &location);
    v16 = objc_msgSend(v13, "initWithMode:clock:queue:delay:block:", 0, 1, v14, v26, 30.0);
    reloadOperation = v6->_reloadOperation;
    v6->_reloadOperation = (_HKDelayedOperation *)v16;

    v18 = objc_alloc(MEMORY[0x1E0CB6F80]);
    v19 = v6->_queue;
    v20 = *MEMORY[0x1E0D2FB68];
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke_2;
    v24[3] = &unk_1E87F01B8;
    objc_copyWeak(&v25, &location);
    v21 = objc_msgSend(v18, "initWithMode:clock:queue:delay:block:", 0, 1, v19, v24, v20);
    relevanceReloadOperation = v6->_relevanceReloadOperation;
    v6->_relevanceReloadOperation = (_HKDelayedOperation *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadHRWidgets");

}

void __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadRelevances");

}

- (void)dealloc
{
  objc_super v3;

  -[HDHeartRateWidgetDataManager _stopObservingHeartRateSamples](self, "_stopObservingHeartRateSamples");
  -[HDHeartRateWidgetDataManager _stopObservingWorkoutSamples](self, "_stopObservingWorkoutSamples");
  v3.receiver = self;
  v3.super_class = (Class)HDHeartRateWidgetDataManager;
  -[HDHeartRateWidgetDataManager dealloc](&v3, sel_dealloc);
}

- (void)_startObservingHeartRateSamples
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forDataType:", self, v4);

}

- (void)_stopObservingHeartRateSamples
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forDataType:", self, v4);

}

- (void)_startObservingWorkoutSamples
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forDataType:", self, self->_workoutType);

}

- (void)_stopObservingWorkoutSamples
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forDataType:", self, self->_workoutType);

}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  OS_dispatch_queue *queue;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] daemonReady", buf, 0xCu);

  }
  -[HDHeartRateWidgetDataManager _startObservingHeartRateSamples](self, "_startObservingHeartRateSamples");
  -[HDHeartRateWidgetDataManager _startObservingWorkoutSamples](self, "_startObservingWorkoutSamples");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__HDHeartRateWidgetDataManager_daemonReady___block_invoke;
  v10[3] = &unk_1E87EF6F0;
  v10[4] = self;
  objc_msgSend(v8, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v10);

}

uint64_t __44__HDHeartRateWidgetDataManager_daemonReady___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_1CC29C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] first unlock occurred", v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_reloadWidgetsWithReason:", 0, *(_OWORD *)v6);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadWorkoutRelevanceAndWidgetWithReason:", 0);
}

- (void)_reloadWidgetsWithReason:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__HDHeartRateWidgetDataManager__reloadWidgetsWithReason___block_invoke;
  v4[3] = &unk_1E87F01E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __57__HDHeartRateWidgetDataManager__reloadWidgetsWithReason___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "execute");
}

- (void)_reloadWorkoutRelevanceAndWidgetWithReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *queue;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    HDStringFromHeartRateWidgetDataManagerReloadReason(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] _reloadWorkoutRelevanceAndWidgetWithReason reason %@", buf, 0x16u);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__HDHeartRateWidgetDataManager__reloadWorkoutRelevanceAndWidgetWithReason___block_invoke;
  v11[3] = &unk_1E87F01E0;
  v11[4] = self;
  v11[5] = a3;
  dispatch_async(queue, v11);
}

uint64_t __75__HDHeartRateWidgetDataManager__reloadWorkoutRelevanceAndWidgetWithReason___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "execute");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadWorkoutHRWidgets");
}

- (void)_queue_reloadHRWidgets
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)_queue_reloadWorkoutHRWidgets
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)_queue_reloadRelevances
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v32 = (id)objc_opt_class();
    v8 = v32;
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] samplesAdded", buf, 0xCu);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[HDHeartRateWidgetDataManager _isFirstSampleHeartRate:](self, "_isFirstSampleHeartRate:", v5))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (-[HDHeartRateWidgetDataManager _isSampleFromWatch:](self, "_isSampleFromWatch:", v15))
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
      -[HDHeartRateWidgetDataManager _reloadWidgetsWithReason:](self, "_reloadWidgetsWithReason:", 1);
  }
  if (-[HDHeartRateWidgetDataManager _isFirstSampleWorkout:](self, "_isFirstSampleWorkout:", v5))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          if (-[HDHeartRateWidgetDataManager _isSampleFromWatch:](self, "_isSampleFromWatch:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21))
          {
            -[HDHeartRateWidgetDataManager _reloadWorkoutRelevanceAndWidgetWithReason:](self, "_reloadWorkoutRelevanceAndWidgetWithReason:", 2);
            goto LABEL_26;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_26:

  }
}

- (BOOL)_isSampleFromWatch:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "_source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isAppleWatch");

  return v4;
}

- (BOOL)_isFirstSampleHeartRate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5CB0]);

  return v6;
}

- (BOOL)_isFirstSampleWorkout:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB6200]);

  return v6;
}

- (HKSampleType)workoutType
{
  return self->_workoutType;
}

- (void)setWorkoutType:(id)a3
{
  objc_storeStrong((id *)&self->_workoutType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutType, 0);
  objc_storeStrong((id *)&self->_relevanceReloadOperation, 0);
  objc_storeStrong((id *)&self->_reloadOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
