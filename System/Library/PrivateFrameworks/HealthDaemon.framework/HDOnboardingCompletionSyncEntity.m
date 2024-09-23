@implementation HDOnboardingCompletionSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 54);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  BOOL (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  int64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  end = a4.end;
  start = a4.start;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -1;
  objc_msgSend(v13, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25 = &unk_1E6CF7068;
  v17 = v13;
  v26 = v17;
  v18 = v12;
  v30 = start;
  v31 = end;
  v27 = v18;
  v29 = &v32;
  v19 = v15;
  v28 = v19;
  LODWORD(start) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDOnboardingCompletionEntity, "performReadTransactionWithHealthDatabase:error:block:", v16, a7, &v22);

  if ((_DWORD)start)
    v20 = objc_msgSend(v14, "sendCodableChange:resultAnchor:sequence:done:error:", v19, v33[3], 0, 1, a7, v22, v23, v24, v25, v26, v27);
  else
    v20 = 0;

  _Block_object_dispose(&v32, 8);
  return v20;
}

BOOL __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _BOOL8 v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  +[HDOnboardingCompletionEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDOnboardingCompletionEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v17[3] = &unk_1E6CF7040;
  v18 = v6;
  v19 = *(id *)(a1 + 32);
  v20 = v5;
  v21 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v13 = v5;
  v14 = v6;
  v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDOnboardingCompletionEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v7, 0, v9, v12, v11, 0, v8, v10, a3, v17);

  return v15;
}

BOOL __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = HDSQLiteColumnWithNameAsInt64();
    objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identityForEntityID:transaction:error:", v11, *(_QWORD *)(a1 + 48), a8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v13, "identity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "codableSyncIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSyncIdentity:", v16);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int64_t v11;

  v9 = a3;
  objc_msgSend(a5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDOnboardingCompletionEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableOnboardingCompletion *v4;

  v3 = a3;
  v4 = -[HDCodableOnboardingCompletion initWithData:]([HDCodableOnboardingCompletion alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v10 = a3;
  v11 = a5;
  objc_msgSend(a6, "onboardingCompletionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "syncProvenance");

  LODWORD(a7) = objc_msgSend(v12, "insertCodableOnboardingCompletions:syncProvenance:error:", v10, v13, a7);
  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

@end
