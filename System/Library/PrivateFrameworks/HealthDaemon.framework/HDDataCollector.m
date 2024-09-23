@implementation HDDataCollector

- (void)_persistContext:(void *)a3 forKey:
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  BOOL v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend((id)objc_opt_class(), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v15 = 0;
    v9 = +[HDKeyValueEntity setData:forKey:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "setData:forKey:domain:category:profile:error:", v6, v5, v7, 0, WeakRetained, &v15);

    v10 = v15;
    if (!v9)
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v13;
        v18 = 2114;
        v19 = v10;
        v14 = v13;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error persisting context: %{public}@", buf, 0x16u);

      }
    }

  }
}

+ (double)defaultCollectionInterval
{
  return 300.0;
}

- (void)updateCollectionInterval:(double)a3 forType:(id)a4
{
  NSObject *queue;
  _QWORD v7[6];

  if (objc_msgSend(a4, "isEqual:", self->_observedType))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__HDDataCollector_updateCollectionInterval_forType___block_invoke;
    v7[3] = &unk_1E6CE8058;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_async(queue, v7);
  }
}

- (void)collectionStartedForType:(id)a3 collectionInterval:(double)a4
{
  NSObject *queue;
  _QWORD v7[6];

  if (-[HKObjectType isEqual:](self->_observedType, "isEqual:", a3))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__HDDataCollector_collectionStartedForType_collectionInterval___block_invoke;
    v7[3] = &unk_1E6CE8058;
    v7[4] = self;
    *(double *)&v7[5] = a4;
    dispatch_async(queue, v7);
  }
}

void __52__HDDataCollector_updateCollectionInterval_forType___block_invoke(uint64_t a1)
{
  -[HDDataCollector _queue_updateCollectionInterval:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)_queue_updateCollectionInterval:(uint64_t)a1
{
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(double *)(a1 + 32) != a2)
    {
      _HKInitializeLogging();
      v4 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        v7 = 138543618;
        v8 = (id)objc_opt_class();
        v9 = 2048;
        v10 = a2;
        v6 = v8;
        _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating collection period to %lf", (uint8_t *)&v7, 0x16u);

      }
    }
    *(double *)(a1 + 32) = a2;
  }
}

void __63__HDDataCollector_collectionStartedForType_collectionInterval___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  -[HDDataCollector _queue_updateCollectionInterval:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    if (v2[5] != 2)
    {
      -[HDDataCollector _queue_transitionToStreaming]((uint64_t)v2);
      objc_msgSend(v2, "_queue_beginStreaming");
    }
  }
}

- (void)_queue_transitionToStreaming
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
    {
      v3 = v2;
      v4 = (void *)objc_opt_class();
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v4;
      v9 = 2048;
      v10 = v5;
      v6 = v4;
      _os_log_debug_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Transitioning to Streaming. Previous state %ld", (uint8_t *)&v7, 0x16u);

    }
    *(_QWORD *)(a1 + 40) = 2;
  }
}

- (void)collectionStoppedForType:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (-[HKObjectType isEqual:](self->_observedType, "isEqual:", a3))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__HDDataCollector_collectionStoppedForType___block_invoke;
    block[3] = &unk_1E6CE80E8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __44__HDDataCollector_collectionStoppedForType___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  uint64_t v4;
  os_log_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _BYTE v12[22];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB52A8];
  v3 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
  {
    v6 = v3;
    *(_DWORD *)v12 = 138543362;
    *(_QWORD *)&v12[4] = objc_opt_class();
    v7 = *(id *)&v12[4];
    _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Stopping data collection", v12, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "stopPerformingUpdatesWithErrorEncountered:", 0, *(_OWORD *)v12);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
    {
      v8 = v5;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(v4 + 40);
      *(_DWORD *)v12 = 138543618;
      *(_QWORD *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2048;
      *(_QWORD *)&v12[14] = v10;
      v11 = v9;
      _os_log_debug_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Transitioning to Idle. Previous state %ld", v12, 0x16u);

    }
    *(_QWORD *)(v4 + 40) = 1;
  }
}

- (HDDataCollector)initWithProfile:(id)a3
{
  id v4;
  HDDataCollector *v5;
  HDDataCollector *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  HKObjectType *observedType;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDataCollector;
  v5 = -[HDDataCollector init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeWeak((id *)&v6->_primaryProfile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend((id)objc_opt_class(), "observedType");
    v9 = objc_claimAutoreleasedReturnValue();
    observedType = v6->_observedType;
    v6->_observedType = (HKObjectType *)v9;

    v6->_state = 1;
    objc_msgSend((id)objc_opt_class(), "defaultCollectionInterval");
    v6->_collectionInterval = v11;
  }

  return v6;
}

- (void)_performAsync:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HDDataCollector__performAsync___block_invoke;
  block[3] = &unk_1E6CE7DE0;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

uint64_t __33__HDDataCollector__performAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDisabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__HDDataCollector_setDisabled___block_invoke;
  v3[3] = &unk_1E6CF1C08;
  v4 = a3;
  v3[4] = self;
  -[HDDataCollector _performAsync:](self, "_performAsync:", v3);
}

uint64_t __31__HDDataCollector_setDisabled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  v3 = *(unsigned __int8 *)(v2 + 72);
  *(_BYTE *)(v2 + 72) = v1;
  if (v1 != v3)
  {
    v4 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v4 + 72))
    {
      return objc_msgSend(*(id *)(result + 32), "stopPerformingUpdatesWithErrorEncountered:", 0);
    }
    else if ((unint64_t)(*(_QWORD *)(v4 + 40) - 1) >= 2)
    {
      -[HDDataCollector _queue_transitionToStreaming](*(_QWORD *)(result + 32));
      return objc_msgSend((id)v4, "_queue_beginStreaming");
    }
  }
  return result;
}

- (id)_retrieveContextForKey:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  +[HDDataCollector _retrieveContextForKey:domain:profile:]((uint64_t)HDDataCollector, v3, v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_retrieveContextForKey:(void *)a3 domain:(void *)a4 profile:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_opt_self();
  v16 = 0;
  +[HDKeyValueEntity dataForKey:domain:category:profile:entity:error:](HDUnprotectedKeyValueEntity, "dataForKey:domain:category:profile:entity:error:", v8, v7, 0, v6, 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  if (v10)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v10;
      v15 = v14;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving context: %{public}@", buf, 0x16u);

    }
  }

  return v9;
}

+ (id)_sensorDatumFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(a1, "sensorDatumClass"), v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (!v6)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        v11 = v8;
        v12 = objc_msgSend(v5, "length");
        *(_DWORD *)buf = 138543874;
        v15 = a1;
        v16 = 2048;
        v17 = v12;
        v18 = 2114;
        v19 = v7;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error decoding context (%lu bytes) %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = a1;
      v16 = 2114;
      v17 = (uint64_t)v5;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Asked to decode empty context (%{public}@), returning nil", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)secondaryContextClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_performSync:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HDDataCollector__performSync___block_invoke;
  block[3] = &unk_1E6CE7DE0;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __32__HDDataCollector__performSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)_primaryContextExistsForDomain:(id)a3 profile:(id)a4
{
  void *v4;
  BOOL v5;

  +[HDDataCollector _retrieveContextForKey:domain:profile:]((uint64_t)a1, CFSTR("context"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (id)_lastReceivedSensorDatumForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataCollector _retrieveContextForKey:domain:profile:]((uint64_t)a1, CFSTR("context"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_sensorDatumFromContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)collectionInterval
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__HDDataCollector_collectionInterval__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = self;
  v4[5] = &v5;
  -[HDDataCollector _performSync:](self, "_performSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

double __37__HDDataCollector_collectionInterval__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCollectionInterval:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__HDDataCollector_setCollectionInterval___block_invoke;
  v3[3] = &unk_1E6CE8058;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[HDDataCollector _performAsync:](self, "_performAsync:", v3);
}

double __41__HDDataCollector_setCollectionInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- (BOOL)disabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__HDDataCollector_disabled__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = self;
  v4[5] = &v5;
  -[HDDataCollector _performSync:](self, "_performSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__HDDataCollector_disabled__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    LOBYTE(v1) = *(_BYTE *)(v1 + 72) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (void)_queue_transitionToFailure
{
  os_log_t *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  os_log_t v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x1E0CB52A8];
    v3 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (void *)objc_opt_class();
      v6 = a1[5];
      v19 = 138543618;
      v20 = v5;
      v21 = 2048;
      v22 = v6;
      v7 = v5;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Transitioning to Failure. Previous state %ld", (uint8_t *)&v19, 0x16u);

    }
    if (a1[5] != 1)
    {
      objc_msgSend(a1, "stopPerformingUpdatesWithErrorEncountered:", 1);
      a1[5] = 3;
      v8 = a1[8];
      _HKInitializeLogging();
      v9 = *v2;
      v10 = os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT);
      if (v8 > 2)
      {
        if (v10)
        {
          v15 = v9;
          v16 = (void *)objc_opt_class();
          v17 = a1[8];
          v19 = 138543618;
          v20 = v16;
          v21 = 2048;
          v22 = v17;
          v18 = v16;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying count limit reached (%ld), not retrying", (uint8_t *)&v19, 0x16u);

        }
        a1[8] = 0;
      }
      else
      {
        if (v10)
        {
          v11 = v9;
          v12 = (void *)objc_opt_class();
          v13 = a1[8];
          v19 = 138543618;
          v20 = v12;
          v21 = 2048;
          v22 = v13;
          v14 = v12;
          _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying from failure (%ld)", (uint8_t *)&v19, 0x16u);

        }
        ++a1[8];
        if (a1[5] != 2)
        {
          -[HDDataCollector _queue_transitionToStreaming]((uint64_t)a1);
          objc_msgSend(a1, "_queue_beginStreaming");
        }
      }
    }
  }
}

- (void)updateHistoricalDataWithCompletion:(id)a3
{
  -[HDDataCollector updateHistoricalDataForcedUpdate:completion:](self, "updateHistoricalDataForcedUpdate:completion:", 0, a3);
}

- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (id)dataCollectorDiagnosticDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "observedType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_collectionInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_state - 1;
  if (v7 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown <%ld>"), self->_state);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E6D03A28[v7];
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@): %@, %@"), v5, v3, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)observedType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)domain
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (Class)sensorDatumClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)stopPerformingUpdatesWithErrorEncountered:(BOOL)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (HDSourceEntity)sourceEntity
{
  return (HDSourceEntity *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_deviceEntity, 0);
  objc_storeStrong((id *)&self->_observedType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_primaryProfile);
}

@end
