@implementation HDHRHealthLiteDataCollector

- (HDHRHealthLiteDataCollector)initWithProfile:(id)a3
{
  id v5;
  HDHRHealthLiteDataCollector *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  HKDataCollectorState *v14;
  HKDataCollectorState *heartRateCollectionState;
  HKDataCollectorState *v16;
  HKDataCollectorState *tachycardiaCollectionState;
  HKDataCollectorState *v18;
  HKDataCollectorState *bradycardiaCollectionState;
  void *v20;
  id WeakRetained;
  void *v22;
  const char *v23;
  NSObject *v24;
  void *v26;
  _QWORD handler[4];
  id v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDHRHealthLiteDataCollector;
  v6 = -[HDHRHealthLiteDataCollector init](&v29, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HDHRHealthLiteDataCollector.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    }
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v10;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing", buf, 0xCu);

    }
    v11 = (const char *)HDDispatchQueueName();
    v12 = dispatch_queue_create(v11, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v6->_profile, v5);
    v14 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E0CB6578]);
    heartRateCollectionState = v6->_heartRateCollectionState;
    v6->_heartRateCollectionState = v14;

    v16 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E0CB6578]);
    tachycardiaCollectionState = v6->_tachycardiaCollectionState;
    v6->_tachycardiaCollectionState = v16;

    v18 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E0CB6578]);
    bradycardiaCollectionState = v6->_bradycardiaCollectionState;
    v6->_bradycardiaCollectionState = v18;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v6);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "healthDaemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerForDaemonReady:", v6);

    v6->_heartRateEnabledInPrivacy = HKIsHeartRateEnabled();
    v6->_privacyPreferencesNotificationToken = -1;
    objc_initWeak((id *)buf, v6);
    v23 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0CB7750]), "UTF8String");
    v24 = v6->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__HDHRHealthLiteDataCollector_initWithProfile___block_invoke;
    handler[3] = &unk_1E87EFCE0;
    objc_copyWeak(&v28, (id *)buf);
    notify_register_dispatch(v23, &v6->_privacyPreferencesNotificationToken, v24, handler);
    -[HDHRHealthLiteDataCollector _startObservingCurrentWorkoutChanges](v6, "_startObservingCurrentWorkoutChanges");
    -[HDHRHealthLiteDataCollector _startObservingAssertionManagerChanges](v6, "_startObservingAssertionManagerChanges");
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

void __47__HDHRHealthLiteDataCollector_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_privacyPreferencesDidChange");

}

- (void)dealloc
{
  NSObject *queue;
  void *v4;
  int privacyPreferencesNotificationToken;
  void *v6;
  objc_super v7;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HDHRHealthLiteDataCollector_dealloc__block_invoke;
  block[3] = &unk_1E87EF6F0;
  block[4] = self;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  privacyPreferencesNotificationToken = self->_privacyPreferencesNotificationToken;
  if (privacyPreferencesNotificationToken != -1)
    notify_cancel(privacyPreferencesNotificationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)HDHRHealthLiteDataCollector;
  -[HDHRHealthLiteDataCollector dealloc](&v7, sel_dealloc);
}

uint64_t __38__HDHRHealthLiteDataCollector_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unregisterDataCollector:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unregisterDataCollector:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unregisterDataCollector:");
}

- (void)daemonReady:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  HDHRHealthLiteDataCollector *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received daemon ready", buf, 0xCu);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HDHRHealthLiteDataCollector_daemonReady___block_invoke;
  v11[3] = &unk_1E87EFB30;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(queue, v11);

}

uint64_t __43__HDHRHealthLiteDataCollector_daemonReady___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  objc_msgSend(*(id *)(a1 + 32), "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "heartRatePush");

  if ((v4 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "dataCollectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aggregatorForType:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "registerDataCollector:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
  }
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v11, "dataCollectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "aggregatorForType:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "registerDataCollector:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v17, "dataCollectionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "aggregatorForType:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(void **)(v21 + 48);
  *(_QWORD *)(v21 + 48) = v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "registerDataCollector:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  return objc_msgSend(*(id *)(a1 + 40), "_queue_createHealthLiteManager");
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HDHRHealthLiteDataCollector *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
    -[HDHRHealthLiteDataCollector dataAggregator:wantsCollectionWithConfiguration:].cold.1((uint64_t)v6, (uint64_t)v7, v8);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HDHRHealthLiteDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke;
  block[3] = &unk_1E87EFAE0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __79__HDHRHealthLiteDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v3 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (v3 == *(_QWORD *)(v2 + 32))
  {
    objc_storeStrong((id *)(v2 + 56), *(id *)(result + 48));
    return objc_msgSend(*(id *)(v1 + 40), "_queue_updateHeartRateCollectionType");
  }
  else if (v3 == *(_QWORD *)(v2 + 40))
  {
    objc_storeStrong((id *)(v2 + 64), *(id *)(result + 48));
    return objc_msgSend(*(id *)(v1 + 40), "_queue_updateTachycardiaCollectionType");
  }
  else if (v3 == *(_QWORD *)(v2 + 48))
  {
    objc_storeStrong((id *)(v2 + 72), *(id *)(result + 48));
    return objc_msgSend(*(id *)(v1 + 40), "_queue_updateBradycardiaCollectionType");
  }
  return result;
}

- (id)deviceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice", a3);
}

- (id)sourceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C18], "_localDeviceSource", a3);
}

- (id)identifierForDataAggregator:(id)a3
{
  return CFSTR("HDHRHealthLiteDataCollector");
}

- (void)_queue_updateAllCollectionTypes
{
  -[HDHRHealthLiteDataCollector _queue_updateHeartRateCollectionType](self, "_queue_updateHeartRateCollectionType");
  -[HDHRHealthLiteDataCollector _queue_updateTachycardiaCollectionType](self, "_queue_updateTachycardiaCollectionType");
  -[HDHRHealthLiteDataCollector _queue_updateBradycardiaCollectionType](self, "_queue_updateBradycardiaCollectionType");
}

- (void)_queue_updateHeartRateCollectionType
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HKDataCollectorState *v11;
  HKDataCollectorState *heartRateCollectionState;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[HDDataCollectorConfiguration collectionType](self->_heartRateCollectionConfiguration, "collectionType");
  if (self->_heartRateEnabledInPrivacy)
    v4 = v3;
  else
    v4 = 0;
  if (-[HKDataCollectorState collectionType](self->_heartRateCollectionState, "collectionType") != v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (void *)objc_opt_class();
      v8 = v7;
      HKDataCollectionTypeToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HKDataCollectionTypeToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Heart rate collection transitioning from %{public}@ to %{public}@", (uint8_t *)&v13, 0x20u);

    }
    -[HKDataCollectorState cloneWithNewType:](self->_heartRateCollectionState, "cloneWithNewType:", v4);
    v11 = (HKDataCollectorState *)objc_claimAutoreleasedReturnValue();
    heartRateCollectionState = self->_heartRateCollectionState;
    self->_heartRateCollectionState = v11;

    -[HDHeartRateDataAggregator dataCollector:didChangeState:](self->_heartRateAggregator, "dataCollector:didChangeState:", self, self->_heartRateCollectionState);
  }
}

- (void)_queue_updateTachycardiaCollectionType
{
  uint64_t v3;
  void *v4;
  HKDataCollectorState *tachycardiaCollectionState;
  NSObject *v6;
  void *v7;
  void *v8;
  HKDataCollectorState *v9;
  HKDataCollectorState *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[HDDataCollectorConfiguration collectionType](self->_tachycardiaCollectionConfiguration, "collectionType");
  if (-[HKDataCollectorState collectionType](self->_tachycardiaCollectionState, "collectionType") != v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      tachycardiaCollectionState = self->_tachycardiaCollectionState;
      v6 = v4;
      -[HKDataCollectorState collectionType](tachycardiaCollectionState, "collectionType");
      HKDataCollectionTypeToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HKDataCollectionTypeToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "tachycardia collection transitioning from %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[HKDataCollectorState cloneWithNewType:](self->_tachycardiaCollectionState, "cloneWithNewType:", v3);
    v9 = (HKDataCollectorState *)objc_claimAutoreleasedReturnValue();
    v10 = self->_tachycardiaCollectionState;
    self->_tachycardiaCollectionState = v9;

    -[HDTachycardiaDataAggregator dataCollector:didChangeState:](self->_tachycardiaAggregator, "dataCollector:didChangeState:", self, self->_tachycardiaCollectionState);
  }
}

- (void)_queue_updateBradycardiaCollectionType
{
  uint64_t v3;
  void *v4;
  HKDataCollectorState *bradycardiaCollectionState;
  NSObject *v6;
  void *v7;
  void *v8;
  HKDataCollectorState *v9;
  HKDataCollectorState *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[HDDataCollectorConfiguration collectionType](self->_bradycardiaCollectionConfiguration, "collectionType");
  if (-[HKDataCollectorState collectionType](self->_bradycardiaCollectionState, "collectionType") != v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      bradycardiaCollectionState = self->_bradycardiaCollectionState;
      v6 = v4;
      -[HKDataCollectorState collectionType](bradycardiaCollectionState, "collectionType");
      HKDataCollectionTypeToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HKDataCollectionTypeToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "bradycardia collection transitioning from %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[HKDataCollectorState cloneWithNewType:](self->_bradycardiaCollectionState, "cloneWithNewType:", v3);
    v9 = (HKDataCollectorState *)objc_claimAutoreleasedReturnValue();
    v10 = self->_bradycardiaCollectionState;
    self->_bradycardiaCollectionState = v9;

    -[HDBradycardiaDataAggregator dataCollector:didChangeState:](self->_bradycardiaAggregator, "dataCollector:didChangeState:", self, self->_bradycardiaCollectionState);
  }
}

- (void)_queue_createHealthLiteManager
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_heartRateEnabledInPrivacy)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CC29C000, v3, OS_LOG_TYPE_DEFAULT, "heart rate collection is disabled due to privacy", v4, 2u);
    }
  }
}

- (void)_startObservingCurrentWorkoutChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__workoutManagerStateDidChange, *MEMORY[0x1E0D293F0], 0);

}

- (void)_workoutManagerStateDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDHRHealthLiteDataCollector__workoutManagerStateDidChange__block_invoke;
  block[3] = &unk_1E87EF6F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__HDHRHealthLiteDataCollector__workoutManagerStateDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateHeartRateCollectionType");
}

- (void)_startObservingAssertionManagerChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__assertionManagerStateChanged_, *MEMORY[0x1E0D295F8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__assertionManagerStateChanged_, *MEMORY[0x1E0D295F0], 0);

}

- (void)_assertionManagerStateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_assertionManagerStateChanged__onceToken != -1)
    dispatch_once(&_assertionManagerStateChanged__onceToken, &__block_literal_global_5);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D295E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)_assertionManagerStateChanged__relevantAssertionIdentifiers, "containsObject:", v6))
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v6;
      v9 = v13;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating heart rate collection type because assertion changed: %{public}@", buf, 0x16u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HDHRHealthLiteDataCollector__assertionManagerStateChanged___block_invoke_226;
    block[3] = &unk_1E87EF6F0;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

void __61__HDHRHealthLiteDataCollector__assertionManagerStateChanged___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  HDQueryServerSampleTypeObservationAssertionName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, *MEMORY[0x1E0D29228], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_assertionManagerStateChanged__relevantAssertionIdentifiers;
  _assertionManagerStateChanged__relevantAssertionIdentifiers = v2;

}

uint64_t __61__HDHRHealthLiteDataCollector__assertionManagerStateChanged___block_invoke_226(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateHeartRateCollectionType");
}

- (BOOL)_queue_shouldStreamReducedRateHeartRateUpdates
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  char v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "workoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentActivityRequiresExtendedMode");

  if (v6
    && (v7 = objc_loadWeakRetained((id *)p_profile),
        objc_msgSend(v7, "workoutManager"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isInHeartRateRecovery"),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    return !-[HDHRHealthLiteDataCollector _queue_hasHeartRateClientsWithoutWorkouts](self, "_queue_hasHeartRateClientsWithoutWorkouts");
  }
  else
  {
    return 0;
  }
}

- (BOOL)_queue_hasHeartRateClientsWithoutWorkouts
{
  void *v3;
  void *v4;
  HDProfile **p_profile;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDQueryServerSampleTypeObservationAssertionName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sessionAssertionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerIdentifiersForAssertionIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "sessionAssertionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ownerIdentifiersForAssertionIdentifier:", *MEMORY[0x1E0D29228]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v11);
  v13 = objc_msgSend(v12, "count");
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
  {
    v16 = v14;
    HKStringFromBool();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v17;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v11;
    _os_log_debug_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEBUG, "Workout power saving mode is active, full-fidelity streaming allowed: %@, heart rate clients: %@, workout clients: %@", (uint8_t *)&v18, 0x20u);

  }
  return v13 != 0;
}

- (void)_queue_privacyPreferencesDidChange
{
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = HKIsHeartRateEnabled();
  if (self->_heartRateEnabledInPrivacy != v3)
  {
    v4 = v3;
    self->_heartRateEnabledInPrivacy = v3;
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = "disabled";
      if (v4)
        v6 = "enabled";
      v7 = 136315138;
      v8 = v6;
      _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "heart rate privacy setting changed to %s", (uint8_t *)&v7, 0xCu);
    }
    -[HDHRHealthLiteDataCollector _queue_updateAllCollectionTypes](self, "_queue_updateAllCollectionTypes");
  }
}

- (id)diagnosticDescription
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_heartRateEnabledInPrivacy)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[HKDataCollectorState collectionType](self->_heartRateCollectionState, "collectionType");
  HKDataCollectionTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataCollectorState collectionType](self->_tachycardiaCollectionState, "collectionType");
  HKDataCollectionTypeToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataCollectorState collectionType](self->_bradycardiaCollectionState, "collectionType");
  HKDataCollectionTypeToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nHeart enabled in privacy: %@\nHeart Rate Collection: %@\nTachycardia Collection: %@\nBradycardia Collection: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_registerPowerLogEvent:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
    -[HDHRHealthLiteDataCollector _registerPowerLogEvent:].cold.1((uint64_t)v3, v4, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceEntity, 0);
  objc_storeStrong((id *)&self->_bradycardiaCollectionState, 0);
  objc_storeStrong((id *)&self->_tachycardiaCollectionState, 0);
  objc_storeStrong((id *)&self->_heartRateCollectionState, 0);
  objc_storeStrong((id *)&self->_bradycardiaCollectionConfiguration, 0);
  objc_storeStrong((id *)&self->_tachycardiaCollectionConfiguration, 0);
  objc_storeStrong((id *)&self->_heartRateCollectionConfiguration, 0);
  objc_storeStrong((id *)&self->_bradycardiaAggregator, 0);
  objc_storeStrong((id *)&self->_tachycardiaAggregator, 0);
  objc_storeStrong((id *)&self->_heartRateAggregator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)dataAggregator:(NSObject *)a3 wantsCollectionWithConfiguration:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, a3, (uint64_t)a3, "aggregator %{public}@ wants collection with configuration: %{public}@", (uint8_t *)&v3);
}

- (void)_registerPowerLogEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = CFSTR("healthlite_event");
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, a2, a3, "PowerLog %@: %@", (uint8_t *)&v3);
}

@end
