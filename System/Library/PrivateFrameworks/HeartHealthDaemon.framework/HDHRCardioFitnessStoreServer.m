@implementation HDHRCardioFitnessStoreServer

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0D2FBF8], "taskIdentifier");
}

- (HDHRCardioFitnessStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDHRCardioFitnessStoreServer *v6;
  void *v7;
  HDHRCardioFitnessStoreServer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDHRCardioFitnessStoreServer;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v10, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

    v8 = v6;
  }

  return v6;
}

- (void)remote_saveCardioFitnessAlertWithValue:(id)a3 threshold:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _BOOL8, id);
  id v17;
  id v18;
  os_log_t *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  id v27;
  os_log_t v28;
  NSObject *log;
  id v30;
  HDHRCardioFitnessStoreServer *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (void (**)(id, _BOOL8, id))a8;
  v17 = a6;
  v18 = a5;
  _HKInitializeLogging();
  v19 = (os_log_t *)MEMORY[0x1E0CB52E8];
  v20 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    log = v20;
    v21 = a7;
    v22 = (void *)objc_opt_class();
    v30 = v22;
    objc_msgSend(v14, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v31 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v34 = v22;
    a7 = v21;
    v35 = 2112;
    v36 = v24;
    v37 = 2049;
    v38 = v21;
    v39 = 2112;
    v40 = v25;
    _os_log_impl(&dword_1CC29C000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving fitness alert: %@, options:%{private}lu, threshold: %@", buf, 0x2Au);

    v19 = (os_log_t *)MEMORY[0x1E0CB52E8];
    self = v31;

  }
  v32 = 0;
  v26 = -[HDHRCardioFitnessStoreServer _saveCardioFitnessNotificationWithValue:threshold:startDate:endDate:options:error:](self, "_saveCardioFitnessNotificationWithValue:threshold:startDate:endDate:options:error:", v14, v15, v18, v17, a7, &v32, log);

  v27 = v32;
  if (!v26)
  {
    _HKInitializeLogging();
    v28 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      -[HDHRCardioFitnessStoreServer remote_saveCardioFitnessAlertWithValue:threshold:startDate:endDate:options:completion:].cold.1(v28, (uint64_t)self, v27);
  }
  v16[2](v16, v26, v27);

}

- (BOOL)_saveCardioFitnessNotificationWithValue:(id)a3 threshold:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  HDHRHealthKitSyncManager *v25;
  void *v26;
  HDHRHealthKitSyncManager *v27;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v13 = a7 & 1;
  v14 = (void *)MEMORY[0x1E0CB6378];
  v15 = (void *)MEMORY[0x1E0CB6380];
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v15, "lowCardioFitnessEventType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0CB5570];
  v29[0] = *MEMORY[0x1E0CB55F8];
  v29[1] = v21;
  v30[0] = v19;
  v30[1] = v18;
  v29[2] = *MEMORY[0x1E0CB7328];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categorySampleWithType:value:startDate:endDate:metadata:", v20, 1, v17, v16, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a8) = -[HDHRCardioFitnessStoreServer _insertSampleWithLocalSource:error:](self, "_insertSampleWithLocalSource:error:", v24, a8);
  v25 = [HDHRHealthKitSyncManager alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HDHRHealthKitSyncManager initWithProfile:](v25, "initWithProfile:", v26);

  -[HDHRHealthKitSyncManager triggerImmediateSyncWithReason:loggingCategory:](v27, "triggerImmediateSyncWithReason:loggingCategory:", CFSTR("New Cardio Fitness Notification sample added"), *MEMORY[0x1E0CB52E8]);
  return (char)a8;
}

- (BOOL)_insertSampleWithLocalSource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDeviceSourceWithError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "deviceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentDeviceEntityWithError:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "dataProvenanceManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localDataProvenanceForSourceEntity:version:deviceEntity:", v9, 0, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "dataManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v15, v13, 0, a4, CFAbsoluteTimeGetCurrent());

      if (v16)
      {
        _HKInitializeLogging();
        v17 = (void *)*MEMORY[0x1E0CB52E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = (void *)objc_opt_class();
          v20 = v19;
          HKSensitiveLogItem();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543874;
          v24 = v19;
          v25 = 2112;
          v26 = v21;
          v27 = 2112;
          v28 = v9;
          _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted sample: %@, source: %@", (uint8_t *)&v23, 0x20u);

        }
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)diagnosticDescription
{
  return &stru_1E87F0B08;
}

- (void)remote_saveCardioFitnessAlertWithValue:(void *)a3 threshold:startDate:endDate:options:completion:.cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = (void *)objc_opt_class();
  v6 = v5;
  objc_msgSend(a3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Didn't save alert due to error: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
