@implementation HDWorkoutBuilderSampleQueryServer

- (HDWorkoutBuilderSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDWorkoutBuilderSampleQueryServer *v12;
  uint64_t v13;
  NSUUID *workoutBuilderIdentifier;
  void *v15;
  void *v16;
  void *v17;
  NSUUID *v18;
  void *v19;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDWorkoutBuilderSampleQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v21, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    v12->_hasFinishedHistoricalFetch = objc_msgSend(v10, "needsHistoricalData") ^ 1;
    objc_msgSend(v10, "workoutBuilderIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    workoutBuilderIdentifier = v12->_workoutBuilderIdentifier;
    v12->_workoutBuilderIdentifier = (NSUUID *)v13;

    v12->_deliverQuantities = objc_msgSend(v10, "deliverQuantities");
    objc_msgSend(v11, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "taskServerRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12->_workoutBuilderIdentifier;
    -[HDQueryServer queryQueue](v12, "queryQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forTaskServerUUID:queue:", v12, v18, v19);

  }
  return v12;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  BOOL v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_assignError:code:format:", a5, 3, CFSTR("Invalid configuration class %@."), v13);

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "workoutBuilderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Missing workout builder identifier.");
LABEL_9:
    objc_msgSend(v14, "hk_assignError:code:description:", a5, 3, v15);
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "deliverQuantities"))
  {
    objc_msgSend(v6, "objectType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Attempt to request quantities for a non-quantity type.");
      goto LABEL_9;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)_workoutBuilderSampleQueryClientWithErrorHandler:(id)a1
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "clientProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldObserveOnPause
{
  return 0;
}

- (BOOL)_shouldObserveDatabaseProtectedDataAvailability
{
  return 1;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDWorkoutBuilderSampleQueryServer;
  -[HDQueryServer _queue_start](&v4, sel__queue_start);
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutBuilderServer);

  if (WeakRetained)
    -[HDWorkoutBuilderSampleQueryServer _queue_performHistoricalQuery]((uint64_t)self);
}

- (void)_queue_performHistoricalQuery
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;
  int v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _BYTE *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  _BYTE *v33;
  id v34;
  _QWORD v35[5];
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 216));

    if (WeakRetained)
    {
      if (*(_BYTE *)(a1 + 200))
        return;
      v3 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke;
      v35[3] = &unk_1E6CE8030;
      v35[4] = a1;
      -[HDWorkoutBuilderSampleQueryServer _workoutBuilderSampleQueryClientWithErrorHandler:]((id)a1, v35);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 203))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v37 = __Block_byref_object_copy__32;
        v38 = __Block_byref_object_dispose__32;
        v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v5 = objc_loadWeakRetained((id *)(a1 + 216));
        objc_msgSend((id)a1, "sampleType");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v3;
        v30[1] = 3221225472;
        v30[2] = __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_197;
        v30[3] = &unk_1E6CEDC90;
        v33 = buf;
        v34 = 0;
        v7 = v4;
        v31 = v7;
        v32 = a1;
        v8 = objc_msgSend(v5, "enumerateQuantitiesOfType:error:handler:", v6, &v34, v30);
        v9 = v34;

        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") || !*(_BYTE *)(a1 + 201))
        {
          v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v11 = *(unsigned __int8 *)(a1 + 200);
          objc_msgSend((id)a1, "queryUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "client_deliverQuantities:hasFinishedHistoricalFetch:queryUUID:", v10, v11 != 0, v12);

          *(_BYTE *)(a1 + 201) = 1;
        }

        _Block_object_dispose(buf, 8);
        if ((v8 & 1) != 0)
        {
LABEL_13:
          *(_BYTE *)(a1 + 200) = 1;
LABEL_18:

          return;
        }
      }
      else
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v37 = __Block_byref_object_copy__32;
        v38 = __Block_byref_object_dispose__32;
        v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = objc_loadWeakRetained((id *)(a1 + 216));
        v15 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend((id)a1, "sampleType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setWithObject:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v3;
        v25[1] = 3221225472;
        v25[2] = __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_2;
        v25[3] = &unk_1E6CEDCB8;
        v28 = buf;
        v29 = 0;
        v18 = v4;
        v26 = v18;
        v27 = a1;
        v19 = objc_msgSend(v14, "enumerateSamplesOfTypes:error:handler:", v17, &v29, v25);
        v20 = v29;

        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") || !*(_BYTE *)(a1 + 201))
        {
          v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v22 = *(unsigned __int8 *)(a1 + 200);
          objc_msgSend((id)a1, "queryUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "client_deliverSamples:hasFinishedHistoricalFetch:queryUUID:", v21, v22 != 0, v23);

          *(_BYTE *)(a1 + 201) = 1;
        }

        _Block_object_dispose(buf, 8);
        v9 = 0;
        if (v19)
          goto LABEL_13;
      }
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to complete historical fetch: %{public}@", buf, 0x16u);
      }
      goto LABEL_18;
    }
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to perform historical query: no workout builder server has been found yet.", buf, 0xCu);
    }
  }
}

void __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send historical samples to client: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = a3;
  v7 = a2;
  if ((unint64_t)objc_msgSend(v5, "count") >= 0x190)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "client_deliverQuantities:hasFinishedHistoricalFetch:queryUUID:", v8, 0, v10);

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6DF0]), "initWithQuantity:dateInterval:", v7, v6);

  objc_msgSend(v14, "addObject:", v15);
}

void __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") >= 0x190)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client_deliverSamples:hasFinishedHistoricalFetch:queryUUID:", v3, 0, v5);

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);

}

- (_BYTE)_queue_scheduleHistoricalQuery
{
  _QWORD v1[5];

  if (result)
  {
    if (!result[200])
    {
      v1[0] = MEMORY[0x1E0C809B0];
      v1[1] = 3221225472;
      v1[2] = __67__HDWorkoutBuilderSampleQueryServer__queue_scheduleHistoricalQuery__block_invoke;
      v1[3] = &unk_1E6CE80E8;
      v1[4] = result;
      return (_BYTE *)objc_msgSend(result, "scheduleDatabaseAccessOnQueueWithBlock:", v1);
    }
  }
  return result;
}

void __67__HDWorkoutBuilderSampleQueryServer__queue_scheduleHistoricalQuery__block_invoke(uint64_t a1)
{
  -[HDWorkoutBuilderSampleQueryServer _queue_performHistoricalQuery](*(_QWORD *)(a1 + 32));
}

- (void)didCreateTaskServer:(id)a3
{
  NSObject *v4;
  id v5;
  id obj;

  obj = a3;
  -[HDQueryServer queryQueue](self, "queryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_storeWeak((id *)&self->_workoutBuilderServer, obj);
    objc_msgSend(obj, "addSampleObserver:", self);

    -[HDWorkoutBuilderSampleQueryServer _queue_scheduleHistoricalQuery](self);
  }

}

- (void)workoutBuilderServer:(id)a3 addedSamples:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _BOOL8 hasFinishedHistoricalFetch;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v6 = v5;
  if (self->_deliverQuantities)
  {
    v7 = v5;
  }
  else
  {
    -[HDQueryServer sampleType](self, "sampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke;
    v15[3] = &unk_1E6CEDCE0;
    v16 = v8;
    v10 = v8;
    objc_msgSend(v6, "hk_filter:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke_2;
    v14[3] = &unk_1E6CE8030;
    v14[4] = self;
    -[HDWorkoutBuilderSampleQueryServer _workoutBuilderSampleQueryClientWithErrorHandler:](self, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") || !self->_hasNotifiedFinishedHistoricalFetch)
    {
      hasFinishedHistoricalFetch = self->_hasFinishedHistoricalFetch;
      -[HDQueryServer queryUUID](self, "queryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "client_deliverSamples:hasFinishedHistoricalFetch:queryUUID:", v7, hasFinishedHistoricalFetch, v13);

    }
    if (self->_hasFinishedHistoricalFetch)
      self->_hasNotifiedFinishedHistoricalFetch = 1;

  }
}

uint64_t __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send added samples to client: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)workoutBuilderServer:(id)a3 addedQuantities:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 hasFinishedHistoricalFetch;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  if (self->_deliverQuantities)
  {
    v5 = a4;
    -[HDQueryServer sampleType](self, "sampleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke;
    v14[3] = &unk_1E6CEDD08;
    v15 = v6;
    v8 = v6;
    objc_msgSend(v5, "hk_map:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke_2;
    v13[3] = &unk_1E6CE8030;
    v13[4] = self;
    -[HDWorkoutBuilderSampleQueryServer _workoutBuilderSampleQueryClientWithErrorHandler:](self, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") || !self->_hasNotifiedFinishedHistoricalFetch)
    {
      hasFinishedHistoricalFetch = self->_hasFinishedHistoricalFetch;
      -[HDQueryServer queryUUID](self, "queryUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "client_deliverQuantities:hasFinishedHistoricalFetch:queryUUID:", v9, hasFinishedHistoricalFetch, v12);

    }
    if (self->_hasFinishedHistoricalFetch)
      self->_hasNotifiedFinishedHistoricalFetch = 1;

  }
}

id __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "hdw_type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB6DF0]);
    objc_msgSend(v3, "hdw_quantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hdw_dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithQuantity:dateInterval:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send added quantities to client: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *v5;

  -[HDQueryServer queryQueue](self, "queryQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HDWorkoutBuilderSampleQueryServer _queue_scheduleHistoricalQuery](self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutBuilderServer);
  objc_storeStrong((id *)&self->_workoutBuilderIdentifier, 0);
}

@end
