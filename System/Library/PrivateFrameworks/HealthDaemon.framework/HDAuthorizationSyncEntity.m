@implementation HDAuthorizationSyncEntity

+ (int)nanoSyncObjectType
{
  return 11;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (BOOL)companionDidChangeForProfile:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(a3, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDAuthorizationEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", 0, v5, a4);

  return (char)a4;
}

+ (id)createCodableSourceAuthorizationWithSource:(id)a3 syncSession:(id)a4
{
  id v4;
  HDCodableSourceAuthorization *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(HDCodableSourceAuthorization);
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableSourceAuthorization setSourceUUID:](v5, "setSourceUUID:", v6);
  return v5;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 12);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  const __CFString **v33;
  id v34;
  int64_t v35;
  int64_t v36;
  const __CFString *v37;
  const __CFString **v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;

  end = a4.end;
  start = a4.start;
  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v26 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v37 = CFSTR("source_id");
  v38 = (const __CFString **)CFSTR("object_type");
  v39 = (uint64_t)CFSTR("status");
  v40 = (uint64_t)CFSTR("request");
  v41 = CFSTR("mode");
  v42 = CFSTR("date_modified");
  v43 = CFSTR("modification_epoch");
  v44 = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = -1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v27[3] = &unk_1E6D118E8;
  v17 = v15;
  v28 = v17;
  v34 = a1;
  v18 = v12;
  v35 = start;
  v36 = end;
  v29 = v18;
  v33 = &v37;
  v19 = v16;
  v30 = v19;
  v20 = v14;
  v31 = v20;
  v21 = v13;
  v32 = v21;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAuthorizationEntity, "performReadTransactionWithHealthDatabase:error:block:", v19, a7, v27))
  {
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(a1, "didGenerateCodableSourceAuthorizationsForSyncSession:", v18);
      objc_msgSend(v20, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "sendCodableChange:resultAnchor:sequence:done:error:", v22, v38[3], 0, 1, a7);

    }
    else
    {
      v23 = 1;
    }
  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(&v37, 8);
  return v23;
}

BOOL __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BOOL8 v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6D118C0;
  v10 = *(_QWORD *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 80);
  v20 = v11;
  v23 = v12;
  v21 = *(id *)(a1 + 40);
  v22 = v5;
  v14 = *(_QWORD *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 96);
  v15 = v5;
  v16 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:healthDatabase:error:block:](HDAuthorizationEntity, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:healthDatabase:error:block:", v7, 0, v8, v6, v14, v13, 0, 0, v9, v10, a3, v18);

  return v16;
}

BOOL __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  HDCodableAuthorization *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v30;
  id v31;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  HDSQLiteColumnWithNameAsNumber();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_2;
  +[HDSQLiteEntity entityWithPersistentID:](HDSourceEntity, "entityWithPersistentID:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "codableSourceWithProfile:error:", *(_QWORD *)(a1 + 40), a8);
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v30 = v28;
      v32 = 138543874;
      v33 = (id)objc_opt_class();
      v34 = 2112;
      v35 = v11;
      v36 = 2114;
      v37 = 0;
      v31 = v33;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create codable source for source %@: %{public}@", (uint8_t *)&v32, 0x20u);

    }
    goto LABEL_14;
  }
  v27 = (void *)v26;
  objc_msgSend(*(id *)(a1 + 64), "createCodableSourceAuthorizationWithSource:syncSession:", v26, *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v11);

  if (!v12)
  {
LABEL_14:
    v22 = 1;
    goto LABEL_15;
  }
LABEL_2:
  v13 = *(void **)(a1 + 56);
  v14 = *(void **)(a1 + 40);
  v15 = v12;
  v16 = v13;
  v17 = v14;
  objc_opt_self();
  if (a4)
  {
    v18 = objc_alloc_init(HDCodableAuthorization);
    v19 = HDSQLiteColumnWithNameAsInt64();
    objc_msgSend(v17, "syncIdentityManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identityForEntityID:transaction:error:", v19, v16, a8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v21 != 0;
    if (v21)
    {
      -[HDCodableAuthorization setObjectType:](v18, "setObjectType:", HDSQLiteColumnWithNameAsInt64());
      -[HDCodableAuthorization setAuthorizationStatus:](v18, "setAuthorizationStatus:", HDSQLiteColumnWithNameAsInt64());
      -[HDCodableAuthorization setAuthorizationRequest:](v18, "setAuthorizationRequest:", HDSQLiteColumnWithNameAsInt64());
      -[HDCodableAuthorization setAuthorizationMode:](v18, "setAuthorizationMode:", HDSQLiteColumnWithNameAsInt64());
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableAuthorization setModificationDate:](v18, "setModificationDate:");
      -[HDCodableAuthorization setModificationEpoch:](v18, "setModificationEpoch:", HDSQLiteColumnWithNameAsInt64());
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableAuthorization setModificationDate:](v18, "setModificationDate:");
      objc_msgSend(v21, "identity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "codableSyncIdentity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableAuthorization setSyncIdentity:](v18, "setSyncIdentity:", v24);

      objc_msgSend(v15, "addAuthorizations:", v18);
    }

  }
  else
  {
    v22 = 0;
  }

LABEL_15:
  return v22;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int64_t v12;

  v10 = a3;
  objc_msgSend(a5, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:syncEntityClass:session:orderingTerms:limit:healthDatabase:error:](HDAuthorizationEntity, "nextSyncAnchorWithStartAnchor:predicate:syncEntityClass:session:orderingTerms:limit:healthDatabase:error:", a4, 0, a1, v10, 0, 0, v11, a6);

  return v12;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableSourceAuthorization *v4;

  v3 = a3;
  v4 = -[HDCodableSourceAuthorization initWithData:]([HDCodableSourceAuthorization alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDAuthorizationEntity _insertCodableSourceAuthorizations:overwriteExisting:syncStore:profile:error:]((uint64_t)HDAuthorizationEntity, a3, 1, a5, a6, (uint64_t)a7) ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "syncStoreType");
  return (v3 < 6) & (0x22u >> v3);
}

@end
