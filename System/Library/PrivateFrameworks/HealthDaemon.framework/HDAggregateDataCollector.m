@implementation HDAggregateDataCollector

void __44__HDAggregateDataCollector_initWithProfile___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[1] = 3221225472;
    v3[2] = __66__HDAggregateDataCollector__queue_executeHistoricalFetchOperation__block_invoke;
    v3[3] = &unk_1E6CE77C8;
    v3[4] = WeakRetained;
    v2 = WeakRetained;
    v3[0] = MEMORY[0x1E0C809B0];
    -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](WeakRetained, 0, v3);
    WeakRetained = v2;
  }

}

- (id)_queue_lastReceivedSensorDatum
{
  HDSensorDatum *lastReceivedSensorDatum;
  id v4;
  HDSensorDatum *v5;
  HDSensorDatum *v6;

  lastReceivedSensorDatum = self->_lastReceivedSensorDatum;
  if (!lastReceivedSensorDatum)
  {
    -[HDDataCollector _retrieveContextForKey:]((uint64_t)self, CFSTR("context"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_sensorDatumFromContext:", v4);
    v5 = (HDSensorDatum *)objc_claimAutoreleasedReturnValue();

    v6 = self->_lastReceivedSensorDatum;
    self->_lastReceivedSensorDatum = v5;

    lastReceivedSensorDatum = self->_lastReceivedSensorDatum;
  }
  return lastReceivedSensorDatum;
}

void __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  char v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  v7 = *MEMORY[0x1E0CB52A8];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v8 = v6;
    *(_DWORD *)buf = 138543618;
    v15 = (id)objc_opt_class();
    v16 = 2114;
    v17 = v5;
    v9 = v15;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred during update handler: %{public}@", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v9 = v15;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Received update notification", buf, 0xCu);
LABEL_4:

  }
LABEL_6:
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke_319;
  v12[3] = &unk_1E6CF1C08;
  v13 = a2;
  v12[4] = v10;
  dispatch_async(v11, v12);

}

void __44__HDAggregateDataCollector_initWithProfile___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;

  _HKInitializeLogging();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableLoggingWithName:category:", v4, *MEMORY[0x1E0CB52A8]);

}

- (double)_queue_aggregationInterval
{
  return self->super._collectionInterval;
}

- (BOOL)requiresSampleAggregation
{
  return 1;
}

- (id)_queue_processSensorDataBatched:(id)a3 firstDatum:(id)a4 lastSensorDatum:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  BOOL (*v22)(uint64_t, void *, void *, void *, void *);
  void *v23;
  HDAggregateDataCollector *v24;
  id v25;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __87__HDAggregateDataCollector__queue_processSensorDataBatched_firstDatum_lastSensorDatum___block_invoke;
  v23 = &unk_1E6D039E8;
  v24 = self;
  v12 = v11;
  v25 = v12;
  v13 = _Block_copy(&v20);
  -[HDAggregateDataCollector _queue_aggregationInterval](self, "_queue_aggregationInterval", v20, v21, v22, v23, v24);
  v15 = v14;
  -[HDAggregateDataCollector _queue_maxDatumDuration](self, "_queue_maxDatumDuration");
  HDDataCollectorEnumerateBatches(v10, v8, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v17);
  v18 = v12;

  return v18;
}

- (double)_queue_maxDatumDuration
{
  return self->_maxDatumDuration;
}

BOOL __87__HDAggregateDataCollector__queue_processSensorDataBatched_firstDatum_lastSensorDatum___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v17;
  id v18;
  _BYTE v19[24];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "compare:", v12) == 1)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
    {
      v17 = v13;
      *(_DWORD *)v19 = 138543874;
      *(_QWORD *)&v19[4] = objc_opt_class();
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v11;
      *(_WORD *)&v19[22] = 2112;
      v20 = v12;
      v18 = *(id *)&v19[4];
      _os_log_fault_impl(&dword_1B7802000, v17, OS_LOG_TYPE_FAULT, "%{public}@: Tried to create HKObjects with start date (%@) later than end date (%@)", v19, 0x20u);

    }
    v14 = v12;

    v11 = v14;
  }
  objc_msgSend(*(id *)(a1 + 32), "hkObjectsFromSensorData:baseSensorDatum:startDate:endDate:", v9, v10, v11, v12, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v15);

  return v15 != 0;
}

- (void)_queue_updateLastReceivedSensorDatum:(id)a3
{
  HDSensorDatum **p_lastReceivedSensorDatum;
  id v6;
  HDSensorDatum *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  HDSensorDatum *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lastReceivedSensorDatum = &self->_lastReceivedSensorDatum;
  objc_storeStrong((id *)&self->_lastReceivedSensorDatum, a3);
  v6 = a3;
  v7 = *p_lastReceivedSensorDatum;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v13)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      v12 = v11;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Error encoding context (%@) %{public}@", buf, 0x20u);

    }
  }

  -[HDDataCollector _persistContext:forKey:]((uint64_t)self, v13, CFSTR("context"));
}

- (void)_queue_beginStreaming
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HDAggregateDataCollector;
  -[HDDataCollector _queue_beginStreaming](&v8, sel__queue_beginStreaming);
  if (self)
  {
    if (self->super._disabled)
    {
      _HKInitializeLogging();
      v3 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
      {
        v4 = v3;
        v5 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        v6 = v5;
        _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: Data collector disabled, not beginning streaming.", buf, 0xCu);

      }
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __49__HDAggregateDataCollector__queue_beginStreaming__block_invoke;
      v7[3] = &unk_1E6CE77C8;
      v7[4] = self;
      -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](self, 0, v7);
    }
  }
}

void __49__HDAggregateDataCollector__queue_beginStreaming__block_invoke(uint64_t a1, int a2)
{
  unsigned __int8 *v2;
  int v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  void (*v11)(uint64_t, int, void *);
  void *v12;
  unsigned __int8 *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 **)(a1 + 32);
  if (a2)
  {
    if (!v2)
      return;
    v3 = v2[72];
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52A8];
    v5 = *MEMORY[0x1E0CB52A8];
    if (v3)
    {
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        return;
      v6 = v4;
      LODWORD(v10) = 138543362;
      *(_QWORD *)((char *)&v10 + 4) = objc_opt_class();
      v7 = *(id *)((char *)&v10 + 4);
      _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Data collector disabled, not beginning streaming.", (uint8_t *)&v10, 0xCu);

    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v4;
        LODWORD(v10) = 138543362;
        *(_QWORD *)((char *)&v10 + 4) = objc_opt_class();
        v9 = *(id *)((char *)&v10 + 4);
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin updates", (uint8_t *)&v10, 0xCu);

      }
      objc_msgSend(v2, "_queue_lastReceivedSensorDatum", v10);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stopPerformingUpdatesWithErrorEncountered:", 0);
      *(_QWORD *)&v10 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v10 + 1) = 3221225472;
      v11 = __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke;
      v12 = &unk_1E6CE77C8;
      v13 = v2;
      objc_msgSend(v2, "beginUpdatesFromDatum:withHandler:", v6, &v10);
    }

  }
  else
  {
    -[HDDataCollector _queue_transitionToFailure](*(_QWORD **)(a1 + 32));
  }
}

- (void)updateHistoricalData
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HDAggregateDataCollector_updateHistoricalData__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__HDAggregateDataCollector_updateHistoricalData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40) == 3)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected failure state, beginning streaming", (uint8_t *)&v7, 0xCu);

    }
    v6 = *(_QWORD **)(a1 + 32);
    if (v6)
    {
      if (v6[5] != 2)
      {
        -[HDDataCollector _queue_transitionToStreaming]((uint64_t)v6);
        objc_msgSend(v6, "_queue_beginStreaming");
      }
    }
  }
  else
  {
    -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:]((_BYTE *)v2, 0, 0);
  }
}

- (id)_queue_lastReceivedSecondaryContext
{
  NSDictionary *lastReceivedSecondaryContext;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  id v9;
  void *v10;
  NSDictionary *v11;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  lastReceivedSecondaryContext = self->_lastReceivedSecondaryContext;
  if (!lastReceivedSecondaryContext)
  {
    -[HDDataCollector _retrieveContextForKey:]((uint64_t)self, CFSTR("secondaryContext"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB3710];
      objc_msgSend((id)objc_opt_class(), "secondaryContextClasses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v7, v5, &v17);
      v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = v17;

      if (!v8)
      {
        _HKInitializeLogging();
        v10 = (void *)*MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
        {
          v13 = v10;
          v14 = (void *)objc_opt_class();
          v15 = v14;
          v16 = objc_msgSend(v5, "length");
          *(_DWORD *)buf = 138543874;
          v19 = v14;
          v20 = 2048;
          v21 = v16;
          v22 = 2114;
          v23 = v9;
          _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Error decoding context (%lu bytes): %{public}@", buf, 0x20u);

        }
      }

    }
    else
    {
      v8 = 0;
    }

    v11 = self->_lastReceivedSecondaryContext;
    self->_lastReceivedSecondaryContext = v8;

    lastReceivedSecondaryContext = self->_lastReceivedSecondaryContext;
  }
  return lastReceivedSecondaryContext;
}

- (HDAggregateDataCollector)initWithProfile:(id)a3
{
  id v4;
  HDAggregateDataCollector *v5;
  HDAggregateDataCollector *v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  uint64_t v10;
  _HKDelayedOperation *historicalFetchOperation;
  NSObject *v12;
  _QWORD block[4];
  HDAggregateDataCollector *v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDAggregateDataCollector;
  v5 = -[HDDataCollector initWithProfile:](&v19, sel_initWithProfile_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_maxDatumDuration = 360.0;
    v5->_didReceiveSensorDatum = 0;
    objc_initWeak(&location, v5);
    v7 = objc_alloc(MEMORY[0x1E0CB6F80]);
    queue = v6->super._queue;
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__HDAggregateDataCollector_initWithProfile___block_invoke;
    v16[3] = &unk_1E6CECE78;
    objc_copyWeak(&v17, &location);
    v10 = objc_msgSend(v7, "initWithMode:clock:queue:delay:block:", 1, 0, queue, v16, 1.84467441e19);
    historicalFetchOperation = v6->_historicalFetchOperation;
    v6->_historicalFetchOperation = (_HKDelayedOperation *)v10;

    v12 = v6->super._queue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __44__HDAggregateDataCollector_initWithProfile___block_invoke_2;
    block[3] = &unk_1E6CE80E8;
    v15 = v6;
    dispatch_async(v12, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setMaxDatumDuration:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__HDAggregateDataCollector_setMaxDatumDuration___block_invoke;
  v3[3] = &unk_1E6CE8058;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[HDDataCollector _performAsync:](self, "_performAsync:", v3);
}

double __48__HDAggregateDataCollector_setMaxDatumDuration___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

void __66__HDAggregateDataCollector__queue_executeHistoricalFetchOperation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      *(_DWORD *)v9 = 138543618;
      *(_QWORD *)&v9[4] = objc_opt_class();
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = v5;
      v8 = *(id *)&v9[4];
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred during historical fetch for update handler: %{public}@", v9, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "stopPerformingUpdatesWithErrorEncountered:", 0, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
    -[HDDataCollector _queue_transitionToFailure](*(_QWORD **)(a1 + 32));
  }

}

- (double)maxDatumDuration
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
  v4[2] = __44__HDAggregateDataCollector_maxDatumDuration__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = self;
  v4[5] = &v5;
  -[HDDataCollector _performSync:](self, "_performSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__HDAggregateDataCollector_maxDatumDuration__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_maxDatumDuration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke_319(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(v1 + 104) = 1;
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[11];
    objc_msgSend(v2, "_queue_aggregationInterval");
    objc_msgSend(v3, "executeWithDelay:");
  }
  else
  {
    *(_BYTE *)(v1 + 104) = 0;
    -[HDDataCollector _queue_transitionToFailure](*(_QWORD **)(a1 + 32));
  }
}

- (void)_queue_updateLastReceivedSecondaryContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_lastReceivedSecondaryContext, a3);
  v5 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (!v11)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v17 = 2114;
      v18 = v6;
      v10 = v9;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error encoding dictionary context (%@) %{public}@", buf, 0x20u);

    }
  }

  -[HDDataCollector _persistContext:forKey:]((uint64_t)self, v11, CFSTR("secondaryContext"));
}

- (void)_queue_handleUpdatingHistoricalDataForcedUpdate:(void *)a3 completion:
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__HDAggregateDataCollector__queue_handleUpdatingHistoricalDataForcedUpdate_completion___block_invoke;
    v7[3] = &unk_1E6D01058;
    v7[4] = a1;
    v9 = a2;
    v8 = v5;
    -[HDAggregateDataCollector _queue_fetchHistoricalDataForcedUpdate:completion:](a1, a2, v7);

  }
}

void __87__HDAggregateDataCollector__queue_handleUpdatingHistoricalDataForcedUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  id v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 104))
      *(_QWORD *)(v7 + 64) = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "hk_isHealthKitError") || objc_msgSend(v6, "code") != 450)
  {
LABEL_12:
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, a2, v6);
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB52A8];
  v9 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v17 = 138543362;
    v18 = (id)objc_opt_class();
    v11 = v18;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected CoreMotion database reset, resetting state", (uint8_t *)&v17, 0xCu);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateLastReceivedSensorDatum:", 0);
    _HKInitializeLogging();
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      v17 = 138543362;
      v18 = v14;
      v15 = v14;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Set last received sensor datum to nil, persisting nil context", (uint8_t *)&v17, 0xCu);

    }
  }
  -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_14:

}

- (void)_queue_fetchHistoricalDataForcedUpdate:(void *)a3 completion:
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  CFAbsoluteTime Current;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  const char *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  CFAbsoluteTime v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1[72])
  {
    if (a1[120] && (a2 & 1) == 0)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        *(_DWORD *)buf = 138543362;
        v26 = (id)objc_opt_class();
        v11 = v26;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Requested update while fetching historical data. Marking _needsHistoricalFetch", buf, 0xCu);

      }
      a1[121] = 1;
      goto LABEL_9;
    }
    a1[120] = 1;
    objc_msgSend(a1, "_queue_lastReceivedSensorDatum");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB52A8];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v15)
      {
        v16 = v14;
        v17 = (void *)objc_opt_class();
        v18 = v17;
        _IdentifierStringsFromSensorDatum(v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2112;
        v28 = v12;
        v29 = 2114;
        v30 = v19;
        v20 = "%{public}@: Forced fetch of historical data since last record: %@ %{public}@";
LABEL_16:
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, v20, buf, 0x20u);

      }
    }
    else if (v15)
    {
      v16 = v14;
      v21 = (void *)objc_opt_class();
      v18 = v21;
      _IdentifierStringsFromSensorDatum(v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v12;
      v29 = 2114;
      v30 = v19;
      v20 = "%{public}@: Fetching historical data since last record: %@ %{public}@";
      goto LABEL_16;
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke;
    v22[3] = &unk_1E6CFAEF8;
    v22[4] = a1;
    v24 = Current;
    v23 = v5;
    objc_msgSend(a1, "fetchHistoricalSensorDataSinceDatum:databaseIdentifier:completion:", v12, 0, v22);

    goto LABEL_18;
  }
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v26 = (id)objc_opt_class();
    v8 = v26;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Data collector disabled, not beginning streaming.", buf, 0xCu);

  }
LABEL_9:
  if (v5)
    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
LABEL_18:

}

void __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  CFAbsoluteTime v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  CFAbsoluteTime v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v10 = objc_msgSend(v5, "count");
    v11 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2048;
    v24 = v10;
    v25 = 2048;
    v26 = v11;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Historical fetch returned %ld datums in %0.2lfs", buf, 0x20u);

  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(v12 + 24);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_320;
  v17[3] = &unk_1E6CE7E08;
  v17[4] = v12;
  v18 = v5;
  v19 = v6;
  v20 = v13;
  v15 = v6;
  v16 = v5;
  dispatch_async(v14, v17);

}

void __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_320(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  id v16;
  id *v17;
  id v18;
  _QWORD *v19;
  id v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  _BOOL8 v51;
  id v52;
  void *v53;
  void (**v54)(id, _QWORD, id);
  NSObject *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id *location;
  _QWORD *v67;
  id v68;
  _QWORD v69[2];
  void (*v70)(uint64_t);
  void *v71;
  id *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  _BYTE buf[24];
  void *v81;
  _BYTE v82[24];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_queue_lastReceivedSensorDatum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[6];
  v4 = a1[5];
  v5 = v3;
  v6 = v2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "sourceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7 == 0;
  }
  else
  {
    v8 = 1;
  }
  if (v6)
    v9 = !v8;
  else
    v9 = 1;
  if (v9)
  {
    v12 = 0;
    if (!v5)
    {
LABEL_13:
      v11 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v12 = objc_msgSend(v4, "count") == 0;
    if (!v5)
      goto LABEL_13;
  }
  objc_msgSend(v5, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA5580]))
    v11 = objc_msgSend(v5, "code") == 107;
  else
    v11 = 0;

LABEL_16:
  if (v12 || v11)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v55 = v13;
      v56 = (void *)objc_opt_class();
      v58 = a1[5];
      v57 = a1[6];
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2112;
      v81 = v6;
      *(_WORD *)v82 = 2112;
      *(_QWORD *)&v82[2] = v58;
      v59 = v56;
      _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Detected a database reset with the following results: %{public}@, %@, %@", buf, 0x2Au);

    }
    *((_BYTE *)a1[4] + 120) = 0;
    v14 = (void (**)(id, _QWORD, void *))a1[7];
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 450, CFSTR("CoreMotion indicated a database reset."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, v15);

    }
    goto LABEL_46;
  }
  v16 = a1[5];
  if (v16)
  {
    v17 = (id *)a1[4];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v70 = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_324;
    v71 = &unk_1E6CED3F8;
    v72 = v17;
    v73 = a1[7];
    v18 = v16;
    v68 = v6;
    v19 = v69;
    if (v17)
    {
      v20 = v18;
      WeakRetained = objc_loadWeakRetained(v17 + 2);
      objc_msgSend(WeakRetained, "database");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mostRecentObliterationDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23
        && (objc_msgSend(v20, "firstObject"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v24, "startDate"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v25, "hk_isBeforeDate:", v23),
            v25,
            v24,
            (v26 & 1) != 0))
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __54__HDAggregateDataCollector__queue_filteredSensorData___block_invoke;
        v81 = &unk_1E6D039C0;
        *(_QWORD *)v82 = v23;
        *(_QWORD *)&v82[8] = v17;
        objc_msgSend(v20, "hk_filter:", buf);
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = v20;
      }
      v18 = v27;

      if (objc_msgSend(v18, "count"))
      {
        v28 = v68;
        v65 = v28;
        if (objc_msgSend(v17, "requiresSampleAggregation"))
        {
          v79 = v28;
          objc_msgSend(v17, "_queue_processSensorDataBatched:firstDatum:lastSensorDatum:", v18, v28, &v79);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v79;
        }
        else
        {
          objc_msgSend(v17, "hkObjectsFromSensorData:baseSensorDatum:startDate:endDate:", v18, v28, 0, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastObject");
          v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        v37 = v30;
        location = v17 + 2;
        v67 = v19;
        _HKInitializeLogging();
        v38 = (void *)*MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          v39 = v38;
          v40 = (void *)objc_opt_class();
          v64 = v40;
          v41 = objc_msgSend(v18, "count");
          v42 = objc_msgSend(v29, "count");
          _IdentifierStringsFromSensorDatum(v37);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v41;
          *(_WORD *)&buf[22] = 2048;
          v81 = (void *)v42;
          *(_WORD *)v82 = 2112;
          *(_QWORD *)&v82[2] = v37;
          *(_WORD *)&v82[10] = 2114;
          *(_QWORD *)&v82[12] = v43;
          _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: (Processed: %ld, Persisting: %ld, Context: %@ %{public}@)", buf, 0x34u);

        }
        v44 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke;
        v81 = &unk_1E6CF0678;
        *(_QWORD *)v82 = v17;
        v45 = v37;
        *(_QWORD *)&v82[8] = v45;
        v46 = v29;
        *(_QWORD *)&v82[16] = v46;
        v47 = _Block_copy(buf);
        v48 = objc_loadWeakRetained(location);
        objc_msgSend(v48, "database");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = 0;
        v76[0] = v44;
        v76[1] = 3221225472;
        v76[2] = __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_2;
        v76[3] = &unk_1E6CF1650;
        v77 = v47;
        v74[0] = v44;
        v74[1] = 3221225472;
        v74[2] = __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_3;
        v74[3] = &unk_1E6CEEAB8;
        v50 = v77;
        v75 = v50;
        v51 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v49, &v78, v76, v74);
        v52 = v78;

        v19 = v67;
        ((void (*)(_QWORD *, _BOOL8, id))v70)(v67, v51, v52);

      }
      else
      {
        _HKInitializeLogging();
        v33 = (void *)*MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          v35 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v35;
          v36 = v35;
          _os_log_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Received empty array of sensor data. Exiting early", buf, 0xCu);

        }
        ((void (*)(_QWORD *, uint64_t, _QWORD))v70)(v19, 1, 0);
      }
    }

    goto LABEL_46;
  }
  objc_msgSend(a1[6], "domain");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CA5580]))
  {

LABEL_42:
    _HKInitializeLogging();
    v53 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v60 = v53;
      v61 = (void *)objc_opt_class();
      v62 = a1[6];
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v62;
      v63 = v61;
      _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching historical sensor data: %{public}@", buf, 0x16u);

    }
    goto LABEL_44;
  }
  v32 = objc_msgSend(a1[6], "code");

  if (v32 != 109)
    goto LABEL_42;
LABEL_44:
  *((_BYTE *)a1[4] + 120) = 0;
  v54 = (void (**)(id, _QWORD, id))a1[7];
  if (v54)
    v54[2](v54, 0, a1[6]);
LABEL_46:

}

void __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_324(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v4 = v11;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished fetching historical data.", buf, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_325;
  v8[3] = &unk_1E6CE9C08;
  v8[4] = v5;
  v9 = v6;
  dispatch_async(v7, v8);

}

uint64_t __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_325(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121);
    v9 = 138543618;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v6 = v4;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Needs historical fetch: %{BOOL}d", (uint8_t *)&v9, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 121))
  {
    *(_BYTE *)(v7 + 121) = 0;
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return -[HDAggregateDataCollector _queue_fetchHistoricalDataForcedUpdate:completion:](result, 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateLastReceivedSensorDatum:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPersistHKObjects:", *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "dataCollectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  if (v7)
  {
    v8 = (void *)*((_QWORD *)v7 + 7);
    if (!v8)
    {
      v9 = objc_loadWeakRetained((id *)v7 + 2);
      objc_msgSend(v9, "deviceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v10, "currentDeviceEntityWithError:", &v20);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v20;

      if (!v11)
      {
        _HKInitializeLogging();
        v13 = (void *)*MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
        {
          v17 = v13;
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v22 = v18;
          v23 = 2114;
          v24 = v12;
          v19 = v18;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching local device: %{public}@", buf, 0x16u);

        }
      }

      v14 = (void *)*((_QWORD *)v7 + 7);
      *((_QWORD *)v7 + 7) = v11;

      v8 = (void *)*((_QWORD *)v7 + 7);
    }
    v7 = v8;
  }
  v15 = objc_msgSend(v5, "sensorDataArrayReceived:deviceEntity:error:", v6, v7, a2);

  return v15;
}

uint64_t __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__HDAggregateDataCollector__queue_filteredSensorData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hk_isBeforeDate:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration: %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v5 ^ 1u;
}

- (void)updateHistoricalDataWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDAggregateDataCollector_updateHistoricalDataWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__HDAggregateDataCollector_updateHistoricalDataWithCompletion___block_invoke(uint64_t a1)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2)
    -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](v2, 0, *(void **)(a1 + 40));
}

- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HDAggregateDataCollector_updateHistoricalDataForcedUpdate_completion___block_invoke;
  block[3] = &unk_1E6CEBCC8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __72__HDAggregateDataCollector_updateHistoricalDataForcedUpdate_completion___block_invoke(uint64_t a1)
{
  -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](*(_BYTE **)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void **)(a1 + 40));
}

- (void)beginUpdatesFromDatum:(id)a3 withHandler:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)fetchHistoricalSensorDataSinceDatum:(id)a3 databaseIdentifier:(id)a4 completion:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)hkObjectsFromSensorData:(id)a3 baseSensorDatum:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedSecondaryContext, 0);
  objc_storeStrong((id *)&self->_lastReceivedSensorDatum, 0);
  objc_storeStrong((id *)&self->_historicalFetchOperation, 0);
}

@end
