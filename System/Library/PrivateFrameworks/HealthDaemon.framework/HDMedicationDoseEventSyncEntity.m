@implementation HDMedicationDoseEventSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 63);
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB68A8], "createWithCodable:", a3, a4);
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsSampleExpiration");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v11, v5, *MEMORY[0x1E0CB6120]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  end = a4.end;
  start = a4.start;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a5;
  objc_msgSend(a1, "_predicateForSyncSession:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "generateSyncObjectsForSession:syncEntityClass:predicate:syncAnchorRange:profile:messageHandler:error:", v13, a1, v16, start, end, v15, v14, a7);

  objc_msgSend(v13, "syncStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "syncStoreType");

  if (v19 == 1)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HKStringFromBool();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = a1;
      v25 = 2048;
      v26 = start;
      v27 = 2048;
      v28 = end;
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32 = v13;
      v33 = 2114;
      v34 = v16;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: objects for (%ld, %ld) %{public}@ session %{public}@ predicate %{public}@", buf, 0x3Eu);

    }
  }

  return v17;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  id v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "_predicateForSyncSession:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(a1, "healthEntityClass");
  objc_msgSend(v11, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v13, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v12, v10, v14, a6);
  objc_msgSend(v10, "syncStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "syncStoreType");

  if (v17 == 1)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138544386;
      v21 = a1;
      v22 = 2048;
      v23 = v15;
      v24 = 2048;
      v25 = a4;
      v26 = 2114;
      v27 = v10;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: next %ld for start %ld session %{public}@ predicate %{public}@", (uint8_t *)&v20, 0x34u);
    }

  }
  return v15;
}

@end
