@implementation HDMedicationsCloudSyncStateEntity

- (HDMedicationsCloudSyncStateEntity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (HDStateSyncEntitySchema)stateEntitySchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7[0] = 0x1E6E02300;
  v7[1] = 0x1E6E01DE0;
  v7[2] = 0x1E6E03AA0;
  v7[3] = CFSTR("MedicationsCloudSyncStateEntityDoseEventWindowKey");
  v7[4] = CFSTR("MedicationsCloudSyncStateEntitySampleOriginKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29590]), "initWithWithDomain:dataKeys:", CFSTR("CloudSyncStateEntityDomainMedications"), v4);
  return (HDStateSyncEntitySchema *)v5;
}

+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  HDCloudSyncStateUpdaterMedicationDelegate *v12;
  char v13;
  id v14;
  HDCloudSyncStateUpdaterMedsListDelegate *v15;
  char v16;
  id v17;
  HDCloudSyncStateUpdaterMedicationScheduleDelegate *v18;
  char v19;
  id v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  HDCloudSyncStateUpdaterMedsListDelegate *v26;
  void *v27;
  NSObject *v28;
  HDCloudSyncStateUpdaterMedicationScheduleDelegate *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  id *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(HDCloudSyncStateUpdaterMedicationDelegate);
  v51 = 0;
  v13 = objc_msgSend(MEMORY[0x1E0D29448], "updateDataWithStateStore:delegate:profile:transaction:error:", v9, v12, v10, v11, &v51);
  v14 = v51;
  if ((v13 & 1) != 0)
  {
    v47 = a6;
    v15 = objc_alloc_init(HDCloudSyncStateUpdaterMedsListDelegate);
    v50 = 0;
    v16 = objc_msgSend(MEMORY[0x1E0D29448], "updateDataWithStateStore:delegate:profile:transaction:error:", v9, v15, v10, v11, &v50);
    v17 = v50;
    v48 = v17;
    if ((v16 & 1) != 0)
    {
      v18 = objc_alloc_init(HDCloudSyncStateUpdaterMedicationScheduleDelegate);
      v49 = 0;
      v19 = objc_msgSend(MEMORY[0x1E0D29448], "updateDataWithStateStore:delegate:profile:transaction:error:", v9, v18, v10, v11, &v49);
      v20 = v49;
      v46 = v20;
      if ((v19 & 1) != 0)
      {
        +[HDMedicationsCloudSyncStateEntity _windowUpdaterConfiguration]();
        v44 = objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(MEMORY[0x1E0D29438], "updateDataWithStateStorage:configuration:profile:transaction:error:", v9);
        v45 = 0;
        _HKInitializeLogging();
        HKLogMedication();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if ((v21 & 1) != 0)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v53 = v24;
            _os_log_impl(&dword_1B815E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] update success", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v43 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v53 = v43;
            v54 = 2114;
            v55 = v44;
            v56 = 2114;
            v57 = v45;
            _os_log_error_impl(&dword_1B815E000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
          }

          v34 = v45;
          v23 = v34;
          if (v34)
          {
            if (v47)
            {
              v23 = objc_retainAutorelease(v34);
              *v47 = v23;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
        }

        v33 = (id)v44;
        goto LABEL_35;
      }
      v30 = v20;
      _HKInitializeLogging();
      HKLogMedication();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v41 = objc_opt_class();
        v42 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v53 = v41;
        v30 = v46;
        v54 = 2114;
        v55 = v42;
        v56 = 2114;
        v57 = v46;
        _os_log_error_impl(&dword_1B815E000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
      }

      v32 = v30;
      v33 = v32;
      if (v32)
      {
        if (v47)
        {
          v33 = objc_retainAutorelease(v32);
          v21 = 0;
          *v47 = v33;
LABEL_35:

          goto LABEL_36;
        }
        _HKLogDroppedError();
      }
      v21 = 0;
      goto LABEL_35;
    }
    v27 = v17;
    _HKInitializeLogging();
    HKLogMedication();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_opt_class();
      v39 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v53 = v38;
      v54 = 2114;
      v55 = v39;
      v56 = 2114;
      v57 = v27;
      _os_log_error_impl(&dword_1B815E000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
    }

    v29 = v27;
    v18 = v29;
    if (v29)
    {
      if (v47)
      {
        v18 = objc_retainAutorelease(v29);
        v21 = 0;
        *v47 = v18;
LABEL_36:

        goto LABEL_37;
      }
      _HKLogDroppedError();
    }
    v21 = 0;
    goto LABEL_36;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v35 = a6;
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v53 = v36;
    a6 = v35;
    v54 = 2114;
    v55 = v37;
    v56 = 2114;
    v57 = v14;
    _os_log_error_impl(&dword_1B815E000, v25, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
  }

  v26 = (HDCloudSyncStateUpdaterMedsListDelegate *)v14;
  v15 = v26;
  if (!v26)
    goto LABEL_23;
  if (!a6)
  {
    _HKLogDroppedError();
LABEL_23:
    v21 = 0;
    goto LABEL_37;
  }
  v15 = objc_retainAutorelease(v26);
  v21 = 0;
  *a6 = v15;
LABEL_37:

  return v21;
}

+ (id)_windowUpdaterConfiguration
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0D29440]);
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(MEMORY[0x1E0D29490], "medicationDoseEventSyncEntityClass");
  +[HDMedicationsCloudSyncStateEntity _timeWindow]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKLogMedication();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v0, "initWithDomain:key:sampleOriginKey:sampleType:syncEntityClass:timeWindow:loggingCategory:sampleUUIDsFunction:", CFSTR("CloudSyncStateEntityDomainMedications"), CFSTR("MedicationsCloudSyncStateEntityDoseEventWindowKey"), CFSTR("MedicationsCloudSyncStateEntitySampleOriginKey"), v1, v2, v3, v4, MEMORY[0x1E0D29278]);

  return v5;
}

+ (void)syncDidFinishWithResult:(int64_t)a3 stateStore:(id)a4 profile:(id)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    +[HDMedicationsCloudSyncStateEntity _stringFromSyncResult:]((uint64_t)a1, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] state sync result '%{public}@' for %{public}@", (uint8_t *)&v12, 0x20u);

  }
}

+ (__CFString)_stringFromSyncResult:(uint64_t)a1
{
  __CFString *v3;

  objc_opt_self();
  if (a2 == 1)
  {
    v3 = CFSTR("Failure");
  }
  else if (a2)
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown (%ld)"), a2);
  }
  else
  {
    v3 = CFSTR("Success");
  }
  return v3;
}

+ (id)_timeWindow
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateByAddingTimeInterval:", -172800.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v1, 172800.0);

  return v2;
}

@end
