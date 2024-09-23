@implementation HDCloudSyncStateUpdaterMedsListDelegate

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDCloudSyncStateUpdaterMedsListDelegate domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStateUpdaterMedsListDelegate key](self, "key");
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
  return (NSString *)CFSTR("cloudSyncStateUpdaterDelegateKeyMedsList");
}

- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)+[HDCloudSyncStateUpdaterMedsListDelegate supportedSyncVersionRange](HDCloudSyncStateUpdaterMedsListDelegate, "supportedSyncVersionRange");
}

- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedsListDelegate _fetchPersistedMedsList:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedsListDelegate, a3, a4, a5, (uint64_t)a6);
}

+ (uint64_t)_fetchPersistedMedsList:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_opt_self();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v11 = (void *)MEMORY[0x1E0D295C0];
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForListUserDomainConceptWithType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncStateUpdaterMedsListDelegate _medsListOrderingTerms]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = 3221225472;
  v18[2] = __93__HDCloudSyncStateUpdaterMedsListDelegate__fetchPersistedMedsList_profile_transaction_error___block_invoke;
  v18[3] = &unk_1E6DFFE40;
  v18[4] = &v19;
  v18[0] = MEMORY[0x1E0C809B0];
  v14 = objc_msgSend(v11, "enumerateCodableObjectsForPredicate:limit:orderingTerms:profile:transaction:error:handler:", v12, 1, v13, v8, v9, a5, v18);

  if ((v14 & 1) != 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v20[5])
        v16 = CFSTR("non-nil");
      else
        v16 = CFSTR("nil");
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch %@ local meds list for state sync", buf, 0x16u);
    }

    if (a2)
      *a2 = objc_retainAutorelease((id)v20[5]);
  }
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedsListDelegate _fetchCloudState:codableSyncState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedsListDelegate, a3, a4, (uint64_t)a4, (uint64_t)a6);
}

+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
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
      v13 = CFSTR("non-nil");
      if (!v10)
        v13 = CFSTR("nil");
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1B815E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode %@ cloud meds list for state sync", buf, 0x16u);
    }

    if (a2)
      *a2 = objc_retainAutorelease(v10);
    v11 = 1;
  }

  return v11;
}

- (int64_t)shouldUpdateWithMergedState:(id *)a3 cloudState:(id)a4 localState:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v16 = v12;
  v17 = v14;
  v18 = v13;
  HKWithAutoreleasePool();
  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);
  if (*((_BYTE *)v32 + 24))
  {
    v19 = 3;
  }
  else if (*((_BYTE *)v28 + 24))
  {
    v19 = 2;
  }
  else
  {
    v19 = 1;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v19;
}

uint64_t __119__HDCloudSyncStateUpdaterMedsListDelegate_shouldUpdateWithMergedState_cloudState_localState_profile_transaction_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6800], "createWithCodableConcept:profile:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6800], "createWithCodableConcept:profile:", a1[6], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStateUpdaterMedsListDelegate _mergeCloudList:localList:](a1[7], v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != v2)
  {
    v5 = a1[8];
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 1;
    goto LABEL_11;
  }
  objc_msgSend(v2, "linkCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkCollection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 != (void *)v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v3, "linkCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v2, "linkCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "linkCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    v5 = a1[9];
    goto LABEL_10;
  }

LABEL_11:
  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) || *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[7];
      v20 = 138544130;
      v21 = v15;
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = v3;
      v26 = 2114;
      v27 = v2;
      _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: result %{public}@ from merging %{public}@ and %{public}@", (uint8_t *)&v20, 0x2Au);
    }

    objc_msgSend(v4, "codableRepresentationForSyncWithProfile:", a1[5]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[10] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  return 1;
}

- (id)_mergeCloudList:(void *)a3 localList:
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = v5;
    v8 = v6;
    objc_msgSend(v8, "modificationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v7, "modificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;

    if (v11 > v14)
    {

      v15 = v7;
      v7 = v8;
      v8 = v15;
    }
    v16 = (void *)objc_msgSend(v7, "copyUserDomainConceptByMergingInConcept:", v8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)updateCodableSyncState:(id)a3 withMergeState:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v14;
  HDCloudSyncStateUpdaterMedsListDelegate *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = self;
    _os_log_impl(&dword_1B815E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set meds list in cloud state for state sync", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v11, "setCodableObject:version:profile:", v10, 0, v9);
  return 1;
}

- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5
{
  return +[HDCloudSyncStateUpdaterMedsListDelegate _persistCloudState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedsListDelegate, a3, a4, (uint64_t)a5);
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
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = objc_opt_self();
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist meds list for state sync", buf, 0xCu);
  }

  v10 = (void *)MEMORY[0x1E0D295C0];
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "receiveSyncObjects:version:syncProvenance:profile:error:", v11, objc_msgSend(MEMORY[0x1E0D295C0], "supportedSyncVersionRange"), 0, v6, a4);

  return v12;
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
  v1 = (void *)objc_msgSend(v0, "initWithExpression:ascending:", *MEMORY[0x1E0D293C8], 0);
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __93__HDCloudSyncStateUpdaterMedsListDelegate__fetchPersistedMedsList_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

@end
