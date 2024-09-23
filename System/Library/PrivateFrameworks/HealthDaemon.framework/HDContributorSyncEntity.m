@implementation HDContributorSyncEntity

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 56);
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int64_t v11;

  v9 = a3;
  objc_msgSend(a5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDContributorEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (id)_syncCodableContributorFromRow:(HDSQLiteRow *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  HDCodableContributor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDCodableContributor *v21;

  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(HDCodableContributor);
  MEMORY[0x1BCCAB1E0](a3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_dataForUUIDBytes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableContributor setUuid:](v11, "setUuid:", v13);

  MEMORY[0x1BCCAB1D4](a3, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableContributor setAppleID:](v11, "setAppleID:", v14);

  MEMORY[0x1BCCAB1D4](a3, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableContributor setCallerID:](v11, "setCallerID:", v15);

  -[HDCodableContributor setDeleted:](v11, "setDeleted:", MEMORY[0x1BCCAB174](a3, 3));
  MEMORY[0x1BCCAB1A4](a3, 4);
  -[HDCodableContributor setModificationDate:](v11, "setModificationDate:");
  v16 = HDSQLiteColumnAsInt64();
  objc_msgSend(v10, "syncIdentityManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "identityForEntityID:transaction:error:", v16, v9, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "codableSyncIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableContributor setSyncIdentity:](v11, "setSyncIdentity:", v20);

    v21 = v11;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v13;
  id v14;
  void *v15;
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
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  end = a4.end;
  start = a4.start;
  v13 = a3;
  v14 = a5;
  v23 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -1;
  objc_msgSend(v14, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E6D0C7B0;
  v18 = v13;
  v29 = start;
  v30 = end;
  v25 = v18;
  v28 = &v32;
  v19 = v14;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  v31 = v16 / 300;
  LODWORD(v14) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDContributorEntity, "performReadTransactionWithHealthDatabase:error:block:", v17, a7, v24);

  if ((_DWORD)v14)
    v21 = objc_msgSend(v23, "sendCodableChange:resultAnchor:sequence:done:error:", v20, v33[3], 0, 1, a7);
  else
    v21 = 0;

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _BOOL8 v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  +[HDContributorSyncEntity _orderedProperties](HDContributorSyncEntity, "_orderedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v17[3] = &unk_1E6D0C788;
  v18 = *(id *)(a1 + 40);
  v19 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 80);
  v20 = v10;
  v21 = v11;
  v13 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v14 = v5;
  v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDContributorEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v13, v12, 0, v7, v9, a3, v17);

  return v15;
}

BOOL __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  void *v10;

  +[HDContributorSyncEntity _syncCodableContributorFromRow:profile:transaction:error:](HDContributorSyncEntity, "_syncCodableContributorFromRow:profile:transaction:error:", a4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
    if (*(uint64_t *)(a1 + 56) >= 1 && (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 56))
      *a7 = 1;
  }

  return v10 != 0;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "syncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "syncStoreType");

  if ((unint64_t)(v5 - 3) >= 3 && v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "excludedSyncStores");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableContributor *v4;

  v3 = a3;
  v4 = -[HDCodableContributor initWithData:]([HDCodableContributor alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDSyncSampleOriginUtilities ingestContributorSyncObjects:syncStore:profile:error:](HDSyncSampleOriginUtilities, "ingestContributorSyncObjects:syncStore:profile:error:", a3, a5, a6, a7);
}

+ (id)_orderedProperties
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("apple_id");
  v3[2] = CFSTR("caller_id");
  v3[3] = CFSTR("deleted");
  v3[4] = CFSTR("mod_date");
  v3[5] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
