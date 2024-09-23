@implementation HDWorkoutTrainingLoadQueryServer

- (HDWorkoutTrainingLoadQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDWorkoutTrainingLoadQueryServer *v11;
  uint64_t v12;
  _HKWorkoutTrainingLoadQueryServerConfiguration *trainingLoadQueryServerConfiguration;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutTrainingLoadQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    trainingLoadQueryServerConfiguration = v11->_trainingLoadQueryServerConfiguration;
    v11->_trainingLoadQueryServerConfiguration = (_HKWorkoutTrainingLoadQueryServerConfiguration *)v12;

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
  v13.super_class = (Class)HDWorkoutTrainingLoadQueryServer;
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
      -[HDWorkoutTrainingLoadQueryServer _queue_fetchTrainingLoadWithError:](self, "_queue_fetchTrainingLoadWithError:", &v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v10 = v9;
      if (v8 || !v9)
        objc_msgSend(v4, "client_deliverTrainingLoadResults:forQuery:", v8, v3);
      else
        objc_msgSend(v4, "client_deliverError:forQuery:", v9, v3);

    }
    else
    {
      objc_msgSend(v4, "client_deliverTrainingLoadResults:forQuery:", 0, v3);
    }
  }
  else
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
  }

}

- (id)_queue_fetchTrainingLoadWithError:(id *)a3
{
  uint64_t v5;
  HDWorkoutTrainingLoadQueryHelper *v6;
  void *v7;
  void *v8;
  HDWorkoutTrainingLoadQueryHelper *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__92;
  v25 = __Block_byref_object_dispose__92;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__92;
  v19 = __Block_byref_object_dispose__92;
  v20 = 0;
  v5 = -[_HKWorkoutTrainingLoadQueryServerConfiguration options](self->_trainingLoadQueryServerConfiguration, "options");
  v6 = [HDWorkoutTrainingLoadQueryHelper alloc];
  -[HDQueryServer filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDWorkoutTrainingLoadQueryHelper initWithFilter:options:profile:](v6, "initWithFilter:options:profile:", v7, v5, v8);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HDWorkoutTrainingLoadQueryServer__queue_fetchTrainingLoadWithError___block_invoke;
  v14[3] = &unk_1E6CF8A78;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v21;
  -[HDWorkoutTrainingLoadQueryHelper fetchTrainingLoadWithCompletion:](v9, "fetchTrainingLoadWithCompletion:", v14);
  v10 = (id)v16[5];
  v11 = v10;
  if (v10)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __70__HDWorkoutTrainingLoadQueryServer__queue_fetchTrainingLoadWithError___block_invoke(_QWORD *a1, void *a2, void *a3)
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
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch training load: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

- (int64_t)trainingLoadOptions
{
  return self->_trainingLoadOptions;
}

- (_HKWorkoutTrainingLoadQueryServerConfiguration)trainingLoadQueryServerConfiguration
{
  return self->_trainingLoadQueryServerConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingLoadQueryServerConfiguration, 0);
}

@end
