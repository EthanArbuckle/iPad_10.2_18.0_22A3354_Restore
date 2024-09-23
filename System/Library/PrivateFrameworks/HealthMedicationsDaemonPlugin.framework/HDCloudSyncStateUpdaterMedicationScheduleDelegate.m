@implementation HDCloudSyncStateUpdaterMedicationScheduleDelegate

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDCloudSyncStateUpdaterMedicationScheduleDelegate domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStateUpdaterMedicationScheduleDelegate key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:%p (%@, %@)]"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- (NSString)domain
{
  return (NSString *)CFSTR("CloudSyncStateEntityDomainMedications");
}

- (NSString)key
{
  return (NSString *)CFSTR("cloudSyncStateUpdaterDelegateKeyMedicationSchedules");
}

- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)+[HDCloudSyncStateUpdaterMedicationScheduleDelegate supportedSyncVersionRange](HDCloudSyncStateUpdaterMedicationScheduleDelegate, "supportedSyncVersionRange");
}

- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a5;
  v10 = a4;
  objc_opt_self();
  +[HDMedicationScheduleEntity availableSchedulePredicate](HDMedicationScheduleEntity, "availableSchedulePredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _fetchLocalState:predicate:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, a3, v11, v10, v9, (uint64_t)a6);

  return (char)a6;
}

+ (BOOL)_fetchLocalState:(void *)a3 predicate:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _BOOL8 v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_self();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__11;
  v24 = __Block_byref_object_dispose__11;
  v25 = 0;
  v19[1] = 3221225472;
  v19[2] = __106__HDCloudSyncStateUpdaterMedicationScheduleDelegate__fetchLocalState_predicate_profile_transaction_error___block_invoke;
  v19[3] = &unk_1E6E013B0;
  v19[4] = &v20;
  v19[0] = MEMORY[0x1E0C809B0];
  v14 = +[HDVersionedMedicationScheduleSyncEntity enumerateCodableObjectsForPredicate:limit:orderingTerms:profile:transaction:error:handler:](HDVersionedMedicationScheduleSyncEntity, "enumerateCodableObjectsForPredicate:limit:orderingTerms:profile:transaction:error:handler:", v10, 0, 0, v11, v12, a6, v19);
  if (v14)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v21[5], "schedules");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 138543618;
      v27 = v13;
      v28 = 2048;
      v29 = v17;
      _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch %ld local medication schedules for state sync", buf, 0x16u);

    }
    if (a2)
      *a2 = objc_retainAutorelease((id)v21[5]);
  }
  _Block_object_dispose(&v20, 8);

  return v14;
}

- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _fetchCloudState:codableSyncState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, a3, a4, (uint64_t)a4, (uint64_t)a6);
}

+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_opt_self();
  v16 = 0;
  v9 = objc_msgSend(v7, "decodedObjectOfClass:version:decodedObject:error:", objc_opt_class(), 0, &v16, a5);

  v10 = v16;
  v11 = 0;
  if (v9)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "schedules");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2048;
      v20 = v14;
      _os_log_impl(&dword_1B815E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode %ld cloud medication schedules for state sync", buf, 0x16u);

    }
    if (a2)
      *a2 = objc_retainAutorelease(v10);
    v11 = 1;
  }

  return v11;
}

- (int64_t)shouldUpdateWithMergedState:(id *)a3 cloudState:(id)a4 localState:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  void *v21;
  void *v22;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationScheduleDelegate.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[cloudState isKindOfClass:HDCodableMedicationScheduleCollection.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationScheduleDelegate.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[localState isKindOfClass:HDCodableMedicationScheduleCollection.class]"));

  }
  v19 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _shouldUpdateWithMergedState:cloudState:localState:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, a3, v15, v16, v17, v18, (uint64_t)a8);

  return v19;
}

+ (uint64_t)_shouldUpdateWithMergedState:(void *)a3 cloudState:(void *)a4 localState:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v41;
  id v42;
  id v43;
  char v45;
  id obj;
  HDCodableMedicationScheduleCollection *v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_opt_self();
  v47 = objc_alloc_init(HDCodableMedicationScheduleCollection);
  v53 = 0;
  +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _unavailableSchedulesPredicate]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _fetchLocalState:predicate:profile:transaction:error:](v15, &v53, v16, v13, v14, a7);
  v18 = v53;

  v19 = 0;
  if (v17)
  {
    v42 = v14;
    v43 = v13;
    v20 = v12;
    objc_msgSend(v12, "schedules");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v18;
    objc_msgSend(v18, "schedules");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v11, "schedules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v45 = 0;
      v26 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v20, "schedules");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __130__HDCloudSyncStateUpdaterMedicationScheduleDelegate__shouldUpdateWithMergedState_cloudState_localState_profile_transaction_error___block_invoke;
          v48[3] = &unk_1E6E013D8;
          v48[4] = v28;
          objc_msgSend(v29, "hk_firstObjectPassingTest:", v48);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _finalScheduleFromCloudSchedule:localSchedule:](v15, v28, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31 == v28)
          {
            objc_msgSend(v28, "creationDate");
            v33 = v32;
            objc_msgSend(v30, "creationDate");
            if (v33 > v34
              || (objc_msgSend(v28, "hasFutureCompatibilityVersion") & 1) == 0
              && objc_msgSend(v30, "isLocallyUnavailable"))
            {
              v45 = 1;
            }
          }
          else
          {
            v25 = 1;
          }
          -[HDCodableMedicationScheduleCollection addSchedules:](v47, "addSchedules:", v31);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v24);
    }
    else
    {
      v25 = 0;
      v45 = 0;
    }

    v12 = v20;
    v35 = (void *)+[HDCloudSyncStateUpdaterMedicationScheduleDelegate _newLocalSchedulesGivenCloudState:localState:](v15, v11, v20);
    v14 = v42;
    v13 = v43;
    if (objc_msgSend(v35, "count"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 138543618;
        v55 = v15;
        v56 = 2048;
        v57 = v37;
        _os_log_impl(&dword_1B815E000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ %ld new local schedules, update the cloud state", buf, 0x16u);
      }

      -[HDCodableMedicationScheduleCollection schedules](v47, "schedules");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObjectsFromArray:", v35);

      v25 = 1;
    }
    v18 = v41;
    if (a2)
      *a2 = objc_retainAutorelease(v47);
    v39 = 1;
    if ((v45 & 1) != 0)
      v39 = 2;
    if ((v25 & 1) != 0)
      v19 = 3;
    else
      v19 = v39;

  }
  return v19;
}

- (BOOL)updateCodableSyncState:(id)a3 withMergeState:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationScheduleDelegate.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mergeState isKindOfClass:HDCodableMedicationScheduleCollection.class]"));

  }
  +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _updateCodableSyncState:withMergeState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, v10, v11, v12);

  return 1;
}

+ (uint64_t)_updateCodableSyncState:(uint64_t)a1 withMergeState:(void *)a2 profile:(void *)a3 error:(void *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a2;
  v9 = objc_opt_self();
  _HKInitializeLogging();
  HKLogMedication();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "schedules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2048;
    v16 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %ld medication schedules in cloud state for state sync", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v8, "setCodableObject:version:profile:", v6, 0, v7);

  return 1;
}

- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  BOOL v11;
  void *v13;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationScheduleDelegate.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[codableCloudState isKindOfClass:HDCodableMedicationScheduleCollection.class]"));

  }
  v11 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _persistCloudState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, v9, v10, (uint64_t)a5);

  return v11;
}

+ (BOOL)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL8 v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = objc_opt_self();
  objc_msgSend(v7, "schedules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hk_map:", &__block_literal_global_11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKLogMedication();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v8;
    v16 = 2048;
    v17 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %ld medication schedules for state sync", (uint8_t *)&v14, 0x16u);
  }

  v12 = +[HDVersionedMedicationScheduleSyncEntity receiveCodableSchedules:syncProvenance:profile:error:](HDVersionedMedicationScheduleSyncEntity, "receiveCodableSchedules:syncProvenance:profile:error:", v10, 0, v6, a4);
  return v12;
}

uint64_t __106__HDCloudSyncStateUpdaterMedicationScheduleDelegate__fetchLocalState_predicate_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDCodableMedicationScheduleCollection *v4;
  uint64_t v5;
  void *v6;
  HDCodableMedicationScheduleData *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v4 = objc_alloc_init(HDCodableMedicationScheduleCollection);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = objc_alloc_init(HDCodableMedicationScheduleData);
  objc_msgSend(v3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationScheduleData setUuid:](v7, "setUuid:", v8);

  objc_msgSend(v3, "creationDate");
  -[HDCodableMedicationScheduleData setCreationDate:](v7, "setCreationDate:");
  objc_msgSend(v3, "compatibilityVersionRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationScheduleData setCompatibilityVersionRange:](v7, "setCompatibilityVersionRange:", v9);

  objc_msgSend(v3, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationScheduleData setScheduleData:](v7, "setScheduleData:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addSchedules:", v7);
  return 1;
}

+ (id)_unavailableSchedulesPredicate
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0D29840];
  +[HDMedicationScheduleEntity availableSchedulePredicate](HDMedicationScheduleEntity, "availableSchedulePredicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "negatedPredicate:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __130__HDCloudSyncStateUpdaterMedicationScheduleDelegate__shouldUpdateWithMergedState_cloudState_localState_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToData:", v4);

  return v5;
}

+ (id)_finalScheduleFromCloudSchedule:(void *)a3 localSchedule:
{
  id v4;
  id v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = v4;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isLocallyUnavailable");
    v6 = v4;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v4, "creationDate");
      v9 = v8;
      objc_msgSend(v5, "creationDate");
      if (v9 < v10)
        v6 = v5;
      else
        v6 = v4;
    }
  }
  v11 = v6;

  return v11;
}

+ (uint64_t)_newLocalSchedulesGivenCloudState:(void *)a3 localState:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  objc_msgSend(v5, "schedules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke;
  v10[3] = &unk_1E6E013D8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "hk_filter:", v10);
  v8 = objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isLocallyUnavailable") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "schedules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke_2;
    v7[3] = &unk_1E6E013D8;
    v8 = v3;
    v4 = objc_msgSend(v5, "hk_containsObjectPassingTest:", v7) ^ 1;

  }
  return v4;
}

uint64_t __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToData:", v5);
  return v6;
}

HDCodableMedicationSchedule *__86__HDCloudSyncStateUpdaterMedicationScheduleDelegate__persistCloudState_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDCodableMedicationSchedule *v3;
  void *v4;
  HDCodableMedicationSchedule *v5;

  v2 = a2;
  v3 = [HDCodableMedicationSchedule alloc];
  objc_msgSend(v2, "scheduleData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[HDCodableMedicationSchedule initWithData:](v3, "initWithData:", v4);
  return v5;
}

@end
