@implementation HDWorkoutZonesAssociationSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 67);
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
  char v21;
  id v23;
  _QWORD v24[4];
  id v25;
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
  v23 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutZonesAssociationEntity propertyForSyncIdentity](HDWorkoutZonesAssociationEntity, "propertyForSyncIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -1;
  objc_msgSend(v13, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E6CF4A28;
  v17 = v15;
  v25 = v17;
  v18 = v12;
  v30 = start;
  v31 = end;
  v26 = v18;
  v29 = &v32;
  v19 = v13;
  v27 = v19;
  v20 = v14;
  v28 = v20;
  LODWORD(v13) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutZonesAssociationEntity, "performReadTransactionWithHealthDatabase:error:block:", v16, a7, v24);

  if ((_DWORD)v13)
    v21 = objc_msgSend(v23, "sendCodableChange:resultAnchor:sequence:done:error:", v20, v33[3], 0, 1, a7);
  else
    v21 = 0;

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24;
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E6CF4A00;
  v16 = v5;
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v12 = v5;
  v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDWorkoutZonesAssociationEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

BOOL __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  HDCodableWorkoutZonesAssociation *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a2;
  objc_msgSend(v10, "workoutUUIDWithTransaction:error:", *(_QWORD *)(a1 + 32), a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "zonesUUIDWithTransaction:error:", *(_QWORD *)(a1 + 32), a8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = HDSQLiteColumnWithNameAsInt64();
      objc_msgSend(*(id *)(a1 + 48), "syncIdentityManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identityForEntityID:transaction:error:", v13, *(_QWORD *)(a1 + 32), a8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15 != 0;
      if (v15)
      {
        v17 = objc_alloc_init(HDCodableWorkoutZonesAssociation);
        objc_msgSend(v11, "hk_dataForUUIDBytes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableWorkoutZonesAssociation setWorkoutUUID:](v17, "setWorkoutUUID:", v18);

        objc_msgSend(v12, "hk_dataForUUIDBytes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableWorkoutZonesAssociation setZonesSampleUUID:](v17, "setZonesSampleUUID:", v19);

        objc_msgSend(v15, "identity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "codableSyncIdentity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableWorkoutZonesAssociation setSyncIdentity:](v17, "setSyncIdentity:", v21);

        objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableWorkoutZonesAssociation *v4;

  v3 = a3;
  v4 = -[HDCodableWorkoutZonesAssociation initWithData:]([HDCodableWorkoutZonesAssociation alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int64_t v11;

  v9 = a3;
  objc_msgSend(a5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDWorkoutZonesAssociationEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  HDInsertWorkoutZonesAssociationOperation *v13;
  uint64_t v14;
  HDInsertWorkoutZonesAssociationOperation *v15;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = [HDInsertWorkoutZonesAssociationOperation alloc];
  v14 = objc_msgSend(v12, "syncProvenance");

  v15 = -[HDInsertWorkoutZonesAssociationOperation initWithCodableWorkoutZoneAssociations:syncProvenance:](v13, "initWithCodableWorkoutZoneAssociations:syncProvenance:", v10, v14);
  LODWORD(a7) = -[HDJournalableOperation performOrJournalWithProfile:error:](v15, "performOrJournalWithProfile:error:", v11, a7);

  return a7 ^ 1;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  objc_msgSend(a3, "syncStoreType");
  return 1;
}

@end
