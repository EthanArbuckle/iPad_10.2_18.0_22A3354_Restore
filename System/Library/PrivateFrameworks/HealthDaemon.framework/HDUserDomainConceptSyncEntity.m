@implementation HDUserDomainConceptSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 59);
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0x400000000;
}

+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)0x400000000;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableUserDomainConcept *v4;

  v3 = a3;
  v4 = -[HDCodableUserDomainConcept initWithData:]([HDCodableUserDomainConcept alloc], "initWithData:", v3);

  return v4;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;

  v10 = a5;
  v11 = a3;
  +[HDUserDomainConceptSyncEntity _predicateForSyncableUserDomainConceptEntitiesForProfile:syncSession:]((uint64_t)a1, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDUserDomainConceptEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v12, v11, v13, a6);
  return v14;
}

+ (id)_predicateForSyncableUserDomainConceptEntitiesForProfile:(void *)a3 syncSession:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userDomainConceptEntityRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registeredDictionaryOfEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__HDUserDomainConceptSyncEntity__predicateForSyncableUserDomainConceptEntitiesForProfile_syncSession___block_invoke;
  v14[3] = &unk_1E6D10450;
  v15 = v4;
  v16 = v9;
  v10 = v9;
  v11 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifiers(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  id v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  end = a4.end;
  start = a4.start;
  v13 = a3;
  v14 = a5;
  v23 = a6;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v16 = objc_msgSend(v13, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  objc_msgSend(v14, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E6D10400;
  v18 = v14;
  v25 = v18;
  v30 = a1;
  v19 = v13;
  v31 = start;
  v32 = end;
  v26 = v19;
  v28 = &v35;
  v20 = v15;
  v27 = v20;
  v29 = v34;
  v33 = v16;
  LOBYTE(v16) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v17, a7, v24);

  if ((v16 & 1) != 0)
    v21 = objc_msgSend(v23, "sendCodableChange:version:resultAnchor:sequence:done:error:", v20, 0x400000000, v36[3], 0, 1, a7);
  else
    v21 = 0;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

BOOL __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BOOL8 v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  +[HDUserDomainConceptEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDUserDomainConceptEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), a2, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDUserDomainConceptSyncEntity _predicateForSyncableUserDomainConceptEntitiesForProfile:syncSession:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 32), *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6D103D8;
  v19 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 64);
  v20 = v11;
  v21 = v12;
  v22 = *(_QWORD *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  v15 = v5;
  v16 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDUserDomainConceptEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, v7, v9, v14, v13, 0, v8, v10, a3, v18);

  return v16;
}

BOOL __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v10, "encodedByteCount");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
      *a7 = 1;
  }

  return v10 != 0;
}

+ (BOOL)enumerateCodableObjectsForPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;

  v15 = a9;
  v16 = a7;
  v17 = a5;
  v18 = a3;
  +[HDUserDomainConceptEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDUserDomainConceptEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", a6, v16, 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "protectedDatabase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDUserDomainConceptEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v20, v18, a4, v17, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "orderedProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __123__HDUserDomainConceptSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke;
  v26[3] = &unk_1E6CEE9A0;
  v27 = v19;
  v28 = v15;
  v23 = v15;
  v24 = v19;
  LOBYTE(a8) = objc_msgSend(v21, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v22, a8, v26);

  return (char)a8;
}

uint64_t __123__HDUserDomainConceptSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v4 = 0;

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  int v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a4.var0 < 5)
  {
    v19 = objc_msgSend(a1, "receiveSyncObjects:version:syncProvenance:profile:error:", v12, a4, objc_msgSend(v13, "syncProvenance"), v14, a7) ^ 1;
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v12, "count");
      HDSyncVersionRangeToString(*(_QWORD *)&a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDSyncVersionRangeToString(0x400000000uLL);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413314;
      v22 = a1;
      v23 = 2048;
      v24 = v16;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%@: Ignoring %lu sync objects from sync store %@ with version %@ because our current version is %@", (uint8_t *)&v21, 0x34u);

    }
    v19 = 0;
  }

  return v19;
}

+ (BOOL)receiveSyncObjects:(id)a3 version:(id)a4 syncProvenance:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t *v32;
  int64_t v33;
  $2825F4736939C4A6D3AD43837233062D v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v11 = a3;
  v12 = a6;
  v13 = v11;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__203;
  v43 = __Block_byref_object_dispose__203;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke;
  v35[3] = &unk_1E6CEB640;
  v16 = v13;
  v36 = v16;
  v17 = v12;
  v37 = v17;
  v38 = &v39;
  +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v14, a7, v35);

  if (objc_msgSend((id)v40[5], "count"))
  {
    objc_msgSend(v17, "userDomainConceptManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openObserverTransaction");

    aBlock[0] = v15;
    aBlock[1] = 3221225472;
    aBlock[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_195;
    aBlock[3] = &unk_1E6D10428;
    v32 = &v39;
    v19 = v17;
    v31 = v19;
    v33 = a5;
    v34 = a4;
    v20 = _Block_copy(aBlock);
    objc_msgSend(v19, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_2;
    v28[3] = &unk_1E6CF1650;
    v29 = v20;
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_3;
    v26[3] = &unk_1E6CEEAB8;
    v22 = v29;
    v27 = v22;
    v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDUserDomainConceptEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v21, a7, v28, v26);

    objc_msgSend(v19, "userDomainConceptManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "closeObserverTransaction");

  }
  else
  {
    v23 = 1;
  }

  _Block_object_dispose(&v39, 8);
  return v23;
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  uint64_t v22;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      v22 = v4;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "legacySyncIdentity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "hasSyncIdentity"))
        {
          v10 = v5;
          objc_msgSend(v7, "syncIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v11, &v25);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v25;

          if (!v12)
          {
            _HKInitializeLogging();
            v18 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v13;
              _os_log_fault_impl(&dword_1B7802000, v18, OS_LOG_TYPE_FAULT, "HDUserDomainConcept SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
            }
            v12 = 0;
            goto LABEL_20;
          }
          objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v13;
          objc_msgSend(v14, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v12, 1, v21, &v24);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v24;

          if (!v15)
          {
            _HKInitializeLogging();
            v19 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v16;
              _os_log_fault_impl(&dword_1B7802000, v19, OS_LOG_TYPE_FAULT, "HDUserDomainConcept ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
            }
            v9 = 0;
            v13 = v16;
LABEL_20:
            v5 = v10;
            v4 = v22;
            goto LABEL_21;
          }

          v9 = (void *)v15;
          v5 = v10;
          v4 = v22;
        }
        objc_msgSend(MEMORY[0x1E0CB6CE8], "createWithCodableConcept:profile:", v7, *(_QWORD *)(a1 + 40));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_22;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);
        }
        else
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, 0);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v9);
        }
LABEL_21:

LABEL_22:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v4);
  }

  return 1;
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_195(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "userDomainConceptManager", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "entity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v10, "modifyUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:error:", v11, 1, v12, objc_msgSend(v13, "persistentID"), *(_QWORD *)(a1 + 56), a2);

        if (!(_DWORD)v12)
        {
          v14 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  void **v41;
  unint64_t v42;
  void *v43;
  void **v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v37 = a6;
  v11 = v9;
  v12 = v10;
  objc_opt_self();
  v38 = v12;
  objc_msgSend(v12, "dateByAddingTimeInterval:", -31536000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanValue:", CFSTR("modification_date"), v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v11)
  {
    v16 = (void *)MEMORY[0x1E0D29840];
    v49[0] = v14;
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("sync_anchor"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateMatchingAnyPredicates:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  v20 = (void *)MEMORY[0x1E0D29840];
  v43 = v15;
  objc_opt_self();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@(%@)"), *MEMORY[0x1E0D297E0], CFSTR("sync_anchor"));
  v23 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v23, "setEntityClass:", objc_opt_class());
  v24 = (void *)MEMORY[0x1E0D29838];
  v50[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("sync_anchor"), 2, v23, v25);
  v26 = (void **)objc_claimAutoreleasedReturnValue();

  v44 = v26;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAB0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (uint64_t)v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateMatchingAllPredicates:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__203;
  v47 = __Block_byref_object_dispose__203;
  v48 = &unk_1E6DFE918;
  objc_msgSend(v37, "database");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __93__HDUserDomainConceptSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke;
  v39[3] = &unk_1E6CEC9E0;
  v31 = v29;
  v41 = &v43;
  v42 = a4;
  v40 = v31;
  LODWORD(v28) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performWriteTransactionWithHealthDatabase:error:block:", v30, a7, v39);

  if ((_DWORD)v28)
    v32 = v44[5];
  else
    v32 = 0;
  v33 = v32;

  _Block_object_dispose(&v43, 8);
  return v33;
}

uint64_t __93__HDUserDomainConceptSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDUserDomainConceptEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, a1[4], a1[6], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deleteAllEntitiesWithError:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "getChangesCount"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return v7;
}

void __102__HDUserDomainConceptSyncEntity__predicateForSyncableUserDomainConceptEntitiesForProfile_syncSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "syncStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(a3, "supportsSyncStore:", v5);

  if ((_DWORD)a3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

@end
