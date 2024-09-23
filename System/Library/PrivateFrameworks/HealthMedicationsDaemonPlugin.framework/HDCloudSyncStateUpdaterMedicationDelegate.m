@implementation HDCloudSyncStateUpdaterMedicationDelegate

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDCloudSyncStateUpdaterMedicationDelegate domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStateUpdaterMedicationDelegate key](self, "key");
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
  return (NSString *)CFSTR("cloudSyncStateUpdaterDelegateKeyMedications");
}

- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)+[HDCloudSyncStateUpdaterMedicationDelegate supportedSyncVersionRange](HDCloudSyncStateUpdaterMedicationDelegate, "supportedSyncVersionRange");
}

- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedicationDelegate _fetchPersistedMeds:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, a3, a4, a5, (uint64_t)a6);
}

+ (uint64_t)_fetchPersistedMeds:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_opt_self();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v11 = (void *)MEMORY[0x1E0D295C0];
  +[HDCloudSyncStateUpdaterMedicationDelegate _medicationsPredicate]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncStateUpdaterMedicationDelegate _medsListOrderingTerms]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __91__HDCloudSyncStateUpdaterMedicationDelegate__fetchPersistedMeds_profile_transaction_error___block_invoke;
  v25[3] = &unk_1E6DFFE40;
  v25[4] = &v26;
  LOBYTE(a5) = objc_msgSend(v11, "enumerateCodableObjectsForPredicate:limit:orderingTerms:profile:transaction:error:handler:", v12, 500, v13, v8, v9, a5, v25);

  if ((a5 & 1) == 0)
  {
LABEL_8:
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend((id)v27[5], "concepts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (unint64_t)objc_msgSend(v14, "count") > 0x1F3;

  if (v15)
  {
    if (!*MEMORY[0x1E0D295E0])
    {
      _HKInitializeLogging();
      HKLogMedication();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend((id)v27[5], "concepts");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 138543618;
        v33 = v10;
        v34 = 2048;
        v35 = v24;
        _os_log_fault_impl(&dword_1B815E000, v16, OS_LOG_TYPE_FAULT, "[%{public}@] Trying to query for at least %ld medications for state sync, but this is too many!", buf, 0x16u);

      }
    }
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 13, CFSTR("%@ Unable to update the cloud state because max medication count (%ld) exceeded"), v10, 500);
    goto LABEL_8;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v27[5], "concepts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 138543618;
    v33 = v10;
    v34 = 2048;
    v35 = v21;
    _os_log_impl(&dword_1B815E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetch %ld local medications for state sync", buf, 0x16u);

  }
  if (a2)
    *a2 = objc_retainAutorelease((id)v27[5]);
  v18 = 1;
LABEL_14:
  _Block_object_dispose(&v26, 8);

  return v18;
}

- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedicationDelegate _fetchCloudState:codableSyncState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, a3, a4, (uint64_t)a4, (uint64_t)a6);
}

+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_opt_self();
  v15 = 0;
  v9 = objc_msgSend(v7, "decodedObjectOfClass:version:decodedObject:error:", objc_opt_class(), 0, &v15, a5);

  v10 = v15;
  v11 = 0;
  if (v9)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v10, "conceptsCount");
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2048;
      v19 = v13;
      _os_log_impl(&dword_1B815E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode %ld cloud medications for state sync", buf, 0x16u);
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
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationDelegate.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[cloudState isKindOfClass:HDCodableUserDomainConceptCollection.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationDelegate.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[localState isKindOfClass:HDCodableUserDomainConceptCollection.class]"));

  }
  v19 = +[HDCloudSyncStateUpdaterMedicationDelegate _shouldUpdateWithMergedState:cloudState:localState:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, a3, v15, v16, v17, v18, (uint64_t)a8);

  return v19;
}

+ (uint64_t)_shouldUpdateWithMergedState:(void *)a3 cloudState:(void *)a4 localState:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_opt_self();
  v16 = objc_alloc_init(MEMORY[0x1E0D29478]);
  v29 = 0;
  v17 = +[HDCloudSyncStateUpdaterMedicationDelegate _didUpdateMergedConcepts:cloudState:localState:profile:nonDeletedCloudConceptUUIDs:error:](v15, v16, v14, v13, v11, &v29);

  v18 = v29;
  _HKInitializeLogging();
  HKLogMedication();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromStateSyncMergeResult();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2114;
    v33 = v20;
    _os_log_impl(&dword_1B815E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ merge result \"%{public}@\", buf, 0x16u);

  }
  v21 = v17 == 3;
  v22 = v17 == 2;
  v23 = +[HDCloudSyncStateUpdaterMedicationDelegate _replaceDeletedConceptIn:nonDeletedCloudConceptUUIDs:profile:transaction:error:](v15, v16, v18, v11, v12, a7);

  _HKInitializeLogging();
  HKLogMedication();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromStateSyncMergeResult();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2114;
    v33 = v25;
    _os_log_impl(&dword_1B815E000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ replace deleted concepts result \"%{public}@\", buf, 0x16u);

  }
  if (v23)
  {
    if (v23 == 3)
    {
      v21 = 1;
    }
    else if (v23 == 2)
    {
      v22 = 1;
    }
    if (a2)
      *a2 = objc_retainAutorelease(v16);
    v26 = 1;
    if (v22)
      v26 = 2;
    if (v21)
      v23 = 3;
    else
      v23 = v26;
  }

  return v23;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationDelegate.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mergeState isKindOfClass:HDCodableUserDomainConceptCollection.class]"));

  }
  +[HDCloudSyncStateUpdaterMedicationDelegate _updateCodableSyncState:withMergeState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, v10, v11, v12);

  return 1;
}

+ (uint64_t)_updateCodableSyncState:(uint64_t)a1 withMergeState:(void *)a2 profile:(void *)a3 error:(void *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a2;
  v9 = objc_opt_self();
  _HKInitializeLogging();
  HKLogMedication();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v6, "conceptsCount");
    _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %ld medications in cloud state for state sync", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v8, "setCodableObject:version:profile:", v6, 0, v7);
  return 1;
}

- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  char v11;
  void *v13;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStateUpdaterMedicationDelegate.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[codableCloudState isKindOfClass:HDCodableUserDomainConceptCollection.class]"));

  }
  v11 = +[HDCloudSyncStateUpdaterMedicationDelegate _persistCloudState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, v9, v10, (uint64_t)a5);

  return v11;
}

+ (uint64_t)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v8;
    v16 = 2048;
    v17 = objc_msgSend(v6, "conceptsCount");
    _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %ld medication concepts for state sync", (uint8_t *)&v14, 0x16u);
  }

  v10 = (void *)MEMORY[0x1E0D295C0];
  objc_msgSend(v6, "concepts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "receiveSyncObjects:version:syncProvenance:profile:error:", v11, objc_msgSend(MEMORY[0x1E0D295C0], "supportedSyncVersionRange"), 0, v7, a4);

  return v12;
}

+ (id)_medicationsPredicate
{
  void *v0;
  void *v1;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_medsListOrderingTerms
{
  id v0;
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0D29888]);
  v1 = (void *)objc_msgSend(v0, "initWithExpression:ascending:", *MEMORY[0x1E0D293D0], 1);
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __91__HDCloudSyncStateUpdaterMedicationDelegate__fetchPersistedMeds_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D29478]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addConcepts:", v3);

  return 1;
}

+ (uint64_t)_didUpdateMergedConcepts:(uint64_t)a1 cloudState:(void *)a2 localState:(void *)a3 profile:(void *)a4 nonDeletedCloudConceptUUIDs:(void *)a5 error:(_QWORD *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v32;
  void *v33;
  char v34;
  id v35;
  id obj;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v32 = a6;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v38 = a5;
  v37 = objc_opt_self();
  v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = v10;
  objc_msgSend(v10, "concepts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v34 = 0;
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1BCCAD8D8]();
        if ((objc_msgSend(v17, "deleted") & 1) == 0)
        {
          v19 = (void *)MEMORY[0x1E0CB3A28];
          objc_msgSend(v17, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hk_UUIDWithData:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v21);

        }
        objc_msgSend(v11, "concepts", v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __134__HDCloudSyncStateUpdaterMedicationDelegate__didUpdateMergedConcepts_cloudState_localState_profile_nonDeletedCloudConceptUUIDs_error___block_invoke;
        v39[3] = &unk_1E6E002C0;
        v39[4] = v17;
        objc_msgSend(v22, "hk_firstObjectPassingTest:", v39);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          +[HDCloudSyncStateUpdaterMedicationDelegate _mergeCloudConcept:localConcept:profile:](v37, v17, v23, v38);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24 == v17)
          {
            objc_msgSend(v17, "modificationDate");
            v26 = v25;
            objc_msgSend(v23, "modificationDate");
            if (v26 > v27)
              v14 = 1;
          }
          else
          {
            v34 = 1;
          }
          objc_msgSend(v9, "addConcepts:", v24);

        }
        else
        {
          objc_msgSend(v9, "addConcepts:", v17);
          v14 |= objc_msgSend(v17, "deleted") ^ 1;
        }

        objc_autoreleasePoolPop(v18);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v13);
  }
  else
  {
    LOBYTE(v14) = 0;
    v34 = 0;
  }

  if (v32)
    *v32 = objc_retainAutorelease(v35);
  v28 = v34 | +[HDCloudSyncStateUpdaterMedicationDelegate _didAddNewLocalConcepts:toMergedConcepts:](v37, v11, v9);
  v29 = 1;
  if ((v14 & 1) != 0)
    v29 = 2;
  if ((v28 & 1) != 0)
    v30 = 3;
  else
    v30 = v29;

  return v30;
}

+ (uint64_t)_replaceDeletedConceptIn:(void *)a3 nonDeletedCloudConceptUUIDs:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_opt_self();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  +[HDCloudSyncStateUpdaterMedicationDelegate _deletedConceptPredicateWithUUIDs:](v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D295C0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke;
  v20[3] = &unk_1E6E002E8;
  v22 = &v23;
  v17 = v10;
  v21 = v17;
  if ((objc_msgSend(v16, "enumerateCodableObjectsForPredicate:limit:orderingTerms:profile:transaction:error:handler:", v15, 0, 0, v12, v13, a6, v20) & 1) != 0)v18 = v24[3];
  else
    v18 = 0;

  _Block_object_dispose(&v23, 8);
  return v18;
}

uint64_t __134__HDCloudSyncStateUpdaterMedicationDelegate__didUpdateMergedConcepts_cloudState_localState_profile_nonDeletedCloudConceptUUIDs_error___block_invoke(uint64_t a1, void *a2)
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

+ (id)_mergeCloudConcept:(void *)a3 localConcept:(void *)a4 profile:
{
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v9 = objc_msgSend(v6, "deleted");
  v10 = v6;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    v12 = v7;
    objc_msgSend(v12, "modificationDate");
    v14 = v13;
    objc_msgSend(v10, "modificationDate");
    if (v14 <= v15)
    {
      v16 = v12;
      v12 = v10;
    }
    else
    {

      v16 = v10;
    }
    objc_msgSend(MEMORY[0x1E0CB6CE8], "createWithCodableConcept:profile:", v12, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CE8], "createWithCodableConcept:profile:", v16, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "copyUserDomainConceptByMergingInConcept:", v18);
    v20 = v19;
    if (v19 == v17)
    {
      v21 = v12;
    }
    else
    {
      objc_msgSend(v19, "codableRepresentationForSyncWithProfile:", v8);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v21;

  }
  return v11;
}

+ (uint64_t)_didAddNewLocalConcepts:(void *)a3 toMergedConcepts:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  char v13;
  char v15;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "concepts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v15 = 0;
    v8 = *(_QWORD *)v19;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "concepts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __86__HDCloudSyncStateUpdaterMedicationDelegate__didAddNewLocalConcepts_toMergedConcepts___block_invoke;
        v17[3] = &unk_1E6E002C0;
        v17[4] = v11;
        v13 = objc_msgSend(v12, "hk_containsObjectPassingTest:", v17);

        if ((v13 & 1) == 0)
        {
          objc_msgSend(v5, "addConcepts:", v11);
          v15 = 1;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  else
  {
    v15 = 0;
  }

  return v15 & 1;
}

uint64_t __86__HDCloudSyncStateUpdaterMedicationDelegate__didAddNewLocalConcepts_toMergedConcepts___block_invoke(uint64_t a1, void *a2)
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

+ (id)_deletedConceptPredicateWithUUIDs:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", *MEMORY[0x1E0D293B0], MEMORY[0x1E0C9AAB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  HDUserDomainConceptEntityPredicateForConceptUUIDs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingAllPredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 3;
  objc_msgSend(*(id *)(a1 + 32), "concepts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke_2;
  v7[3] = &unk_1E6E002C0;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "hk_removeObjectsPassingTest:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addConcepts:", v5);
  return 1;
}

uint64_t __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke_2(uint64_t a1, void *a2)
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

@end
