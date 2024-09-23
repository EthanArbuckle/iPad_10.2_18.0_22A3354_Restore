@implementation HDSourceSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 10;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 11);
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
  v24[2] = __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E6CF0110;
  v18 = v14;
  v25 = v18;
  v19 = v13;
  v29 = start;
  v30 = end;
  v26 = v19;
  v28 = &v32;
  v20 = v15;
  v27 = v20;
  v31 = v16 / 256;
  LODWORD(start) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v17, a7, v24);

  if ((_DWORD)start)
    v21 = objc_msgSend(v23, "sendCodableChange:resultAnchor:sequence:done:error:", v20, v33[3], 0, 1, a7);
  else
    v21 = 0;

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  id v16;
  _BOOL8 v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v5 = a2;
  +[HDSourceEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDSourceEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v19[3] = &unk_1E6CF00E8;
  v20 = v6;
  v21 = *(id *)(a1 + 32);
  v22 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 80);
  v23 = v11;
  v24 = v12;
  v14 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v15 = v5;
  v16 = v6;
  v17 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDSourceEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v7, 0, v9, v14, v13, 0, v8, v10, a3, v19);

  return v17;
}

BOOL __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = HDSQLiteColumnWithNameAsInt64();
    objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identityForEntityID:transaction:error:", v12, *(_QWORD *)(a1 + 48), a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14 != 0;
    if (v14)
    {
      objc_msgSend(v14, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "codableSyncIdentity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSyncIdentity:", v17);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
      if (*(uint64_t *)(a1 + 64) >= 1
        && (unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") >= *(_QWORD *)(a1 + 64))
      {
        *a7 = 1;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int64_t v11;

  v9 = a3;
  objc_msgSend(a5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDSourceEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableSource *v4;

  v3 = a3;
  v4 = -[HDCodableSource initWithData:]([HDCodableSource alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDSyncSampleOriginUtilities ingestSourceSyncObjects:syncStore:profile:error:](HDSyncSampleOriginUtilities, "ingestSourceSyncObjects:syncStore:profile:error:", a3, a5, a6, a7);
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

@end
