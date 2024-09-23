@implementation HDSharingRelationshipSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 61);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  id v14;
  void *v15;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -1;
  objc_msgSend(v13, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25 = &unk_1E6CF8DB0;
  v17 = v12;
  v30 = start;
  v31 = end;
  v26 = v17;
  v29 = &v32;
  v18 = v13;
  v27 = v18;
  v19 = v15;
  v28 = v19;
  LODWORD(v13) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSharingRelationshipEntity, "performReadTransactionWithHealthDatabase:error:block:", v16, a7, &v22);

  if ((_DWORD)v13)
    v20 = objc_msgSend(v14, "sendCodableChange:resultAnchor:sequence:done:error:", v19, v33[3], 0, 1, a7, v22, v23, v24, v25, v26, v27);
  else
    v20 = 0;

  _Block_object_dispose(&v32, 8);
  return v20;
}

BOOL __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19[0] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E6CF8D88;
  v16 = v5;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v12 = v5;
  v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDSharingRelationshipEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

uint64_t __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  HDCodableSharingRelationship *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v10 = a2;
  v11 = *(_QWORD *)(a1 + 32);
  v41 = 0;
  objc_msgSend(v10, "recipientIdentifierInDatabaseTransaction:error:", v11, &v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v41;
  v14 = v13;
  if (!v12)
  {
    v33 = v13;
    v16 = v33;
    if (v33)
    {
      if (a8)
      {
        v16 = objc_retainAutorelease(v33);
        v26 = 0;
        *a8 = v16;
      }
      else
      {
        _HKLogDroppedError();
        v26 = 0;
      }
      v14 = v16;
    }
    else
    {
      v14 = 0;
      v26 = 1;
    }
LABEL_29:

    goto LABEL_30;
  }
  if (objc_msgSend(v12, "type") == 1)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v40 = v14;
    objc_msgSend(v10, "dateModifiedInDatabaseTransaction:error:", v15, &v40);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v40;

    if (v16)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v39 = v17;
      +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:](HDSharingAuthorizationsEntity, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:", v12, v18, &v39);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v39;

      if (objc_msgSend(v19, "count"))
      {
        v21 = HDSQLiteColumnWithNameAsInt64();
        objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 32);
        v38 = v20;
        objc_msgSend(v22, "identityForEntityID:transaction:error:", v21, v23, &v38);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v14 = v38;

        if (v24)
        {
          v25 = objc_alloc_init(HDCodableSharingRelationship);
          v26 = 1;
          -[HDCodableSharingRelationship setRecipientType:](v25, "setRecipientType:", 1);
          objc_msgSend(v12, "clinicalAccountIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableSharingRelationship setRecipientIdentifier:](v25, "setRecipientIdentifier:", v27);

          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          -[HDCodableSharingRelationship setDateModified:](v25, "setDateModified:");
          HDCodableSharingAuthorizationsFromSharingAuthorizations(v19);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableSharingRelationship setSharingAuthorizations:](v25, "setSharingAuthorizations:", v28);

          -[HDCodableSharingRelationship sharingAuthorizations](v25, "sharingAuthorizations");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v29);
          v37 = v19;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableSharingRelationship setAuthorizationIdentifiers:](v25, "setAuthorizationIdentifiers:", v30);

          objc_msgSend(v24, "identity");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "codableSyncIdentity");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableSharingRelationship setSyncIdentity:](v25, "setSyncIdentity:", v32);

          v19 = v37;
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);

        }
        else
        {
          v26 = 0;
        }
      }
      else
      {
        v35 = v20;
        v24 = v35;
        if (v35)
        {
          if (a8)
          {
            v24 = objc_retainAutorelease(v35);
            v26 = 0;
            *a8 = v24;
          }
          else
          {
            _HKLogDroppedError();
            v26 = 0;
          }
          v14 = v24;
        }
        else
        {
          v14 = 0;
          v26 = 1;
        }
      }

    }
    else
    {
      v34 = v17;
      v19 = v34;
      if (v34)
      {
        if (a8)
        {
          v19 = objc_retainAutorelease(v34);
          v26 = 0;
          *a8 = v19;
        }
        else
        {
          _HKLogDroppedError();
          v26 = 0;
        }
        v14 = v19;
      }
      else
      {
        v14 = 0;
        v26 = 1;
      }
    }

    goto LABEL_29;
  }
  v26 = 1;
LABEL_30:

  return v26;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableSharingRelationship *v4;

  v3 = a3;
  v4 = -[HDCodableSharingRelationship initWithData:]([HDCodableSharingRelationship alloc], "initWithData:", v3);

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
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDSharingRelationshipEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  HDInsertOrUpdateSharingRelationshipOperation *v13;
  uint64_t v14;
  HDInsertOrUpdateSharingRelationshipOperation *v15;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = [HDInsertOrUpdateSharingRelationshipOperation alloc];
  v14 = objc_msgSend(v12, "syncProvenance");

  v15 = -[HDInsertOrUpdateSharingRelationshipOperation initWithCodableSharingRelationships:syncProvenance:](v13, "initWithCodableSharingRelationships:syncProvenance:", v10, v14);
  LODWORD(a7) = -[HDJournalableOperation performOrJournalWithProfile:error:](v15, "performOrJournalWithProfile:error:", v11, a7);

  return a7 ^ 1;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return objc_msgSend(a3, "syncStoreType") == 2;
}

@end
