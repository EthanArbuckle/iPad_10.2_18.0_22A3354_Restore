@implementation HDWorkoutTrainingLoadCollectionQueryServer

- (HDWorkoutTrainingLoadCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDWorkoutTrainingLoadCollectionQueryServer *v11;
  uint64_t v12;
  _HKWorkoutTrainingLoadCollectionQueryServerConfiguration *trainingLoadCollectionQueryServerConfiguration;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutTrainingLoadCollectionQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    trainingLoadCollectionQueryServerConfiguration = v11->_trainingLoadCollectionQueryServerConfiguration;
    v11->_trainingLoadCollectionQueryServerConfiguration = (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration *)v12;

  }
  return v11;
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

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HDWorkoutTrainingLoadCollectionQueryServer;
  -[HDQueryServer _queue_start](&v13, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v6)
  {
    if ((objc_msgSend(v6, "canRead") & 1) != 0)
    {
      v11 = 0;
      -[HDWorkoutTrainingLoadCollectionQueryServer _queue_fetchTrainingLoadCollectionWithError:](self, "_queue_fetchTrainingLoadCollectionWithError:", &v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      -[HDQueryServer queryUUID](self, "queryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 || !v9)
        objc_msgSend(v4, "client_deliverTrainingLoadCollection:forQuery:", v8, v10);
      else
        objc_msgSend(v4, "client_deliverError:forQuery:", v9, v10);

    }
    else
    {
      objc_msgSend(v4, "client_deliverTrainingLoadCollection:forQuery:", 0, v3);
    }
  }
  else
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
  }

}

- (id)_queue_fetchTrainingLoadCollectionWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  HDWorkoutTrainingLoadQueryHelper *v8;
  void *v9;
  void *v10;
  HDWorkoutTrainingLoadQueryHelper *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__53;
  v27 = __Block_byref_object_dispose__53;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__53;
  v21 = __Block_byref_object_dispose__53;
  v22 = 0;
  v5 = -[_HKWorkoutTrainingLoadCollectionQueryServerConfiguration options](self->_trainingLoadCollectionQueryServerConfiguration, "options");
  -[_HKWorkoutTrainingLoadCollectionQueryServerConfiguration anchorDate](self->_trainingLoadCollectionQueryServerConfiguration, "anchorDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKWorkoutTrainingLoadCollectionQueryServerConfiguration intervalComponents](self->_trainingLoadCollectionQueryServerConfiguration, "intervalComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [HDWorkoutTrainingLoadQueryHelper alloc];
  -[HDQueryServer filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDWorkoutTrainingLoadQueryHelper initWithFilter:options:anchorDate:intervalComponents:profile:](v8, "initWithFilter:options:anchorDate:intervalComponents:profile:", v9, v5, v6, v7, v10);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HDWorkoutTrainingLoadCollectionQueryServer__queue_fetchTrainingLoadCollectionWithError___block_invoke;
  v16[3] = &unk_1E6CF1F68;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v23;
  -[HDWorkoutTrainingLoadQueryHelper fetchTrainingLoadCollectionWithCompletion:](v11, "fetchTrainingLoadCollectionWithCompletion:", v16);
  v12 = (id)v18[5];
  v13 = v12;
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __90__HDWorkoutTrainingLoadCollectionQueryServer__queue_fetchTrainingLoadCollectionWithError___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v7;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch training load collection: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

- (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration)trainingLoadCollectionQueryServerConfiguration
{
  return self->_trainingLoadCollectionQueryServerConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingLoadCollectionQueryServerConfiguration, 0);
}

@end
