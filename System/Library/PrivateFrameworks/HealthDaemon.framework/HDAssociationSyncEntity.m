@implementation HDAssociationSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 8;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 9);
}

+ (id)_syncPredicateForSession:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a2;
  objc_opt_self();
  HDAssociationEntityPredicateForAssociationEntityWithType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultMaximumObjectAge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v2, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v6, "dateByAddingTimeInterval:", -v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HDAssociationEntityPredicateForChildEndDate(6, (uint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v3, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v3;
  }

  return v10;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  char v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  _QWORD *v43;
  id v44;
  int64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];

  end = a4.end;
  start = a4.start;
  v13 = a3;
  v32 = a5;
  v14 = a6;
  +[HDAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = objc_msgSend(v13, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  v58[0] = 0;
  v58[1] = v58;
  if (v16 >= 0)
    v17 = v16;
  else
    v17 = v16 + 127;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = -1;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__164;
  v52 = __Block_byref_object_dispose__164;
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v32, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = a7;
  v20 = v14;
  v21 = v17 >> 7;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v36[3] = &unk_1E6D09F68;
  v30 = v29;
  v37 = v30;
  v44 = a1;
  v22 = v13;
  v45 = start;
  v46 = end;
  v38 = v22;
  v42 = &v54;
  v23 = v32;
  v39 = v23;
  v24 = v31;
  v40 = v24;
  v25 = v15;
  v41 = v25;
  v43 = v58;
  v47 = v21;
  v26 = v19;
  LOBYTE(v19) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v18, v19, v36);

  if ((v19 & 1) != 0)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v33[3] = &unk_1E6D09F90;
    v34 = v24;
    v35 = &v48;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v33);
    v27 = objc_msgSend(v20, "sendCodableChange:resultAnchor:sequence:done:error:", v49[5], v55[3], 0, 1, v26);

  }
  else
  {
    v27 = 0;
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);

  return v27;
}

BOOL __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
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
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
  objc_msgSend(*(id *)(a1 + 48), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6D09F40;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 48);
  v21 = v5;
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 80);
  v22 = v11;
  v23 = v12;
  v24 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 104);
  v15 = v5;
  v16 = +[HDAssociationEntity _enumerateAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:error:block:](HDAssociationEntity, "_enumerateAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:error:block:", v8, v6, v7, v14, v13, v9, v10, a3, v18);

  return v16;
}

uint64_t __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5, _QWORD *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v23;

  v11 = a2;
  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v23 = 0;
  objc_msgSend(v14, "identityForEntityID:transaction:error:", a4, v15, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v11);

LABEL_4:
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v11);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v18, v11);
    }
    objc_msgSend(v18, "hk_appendBytesWithUUID:", v12);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v19 = *(_QWORD *)(a1 + 72);
    if (v19)
    {
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v21 = 1;
      if (v20 >= v19)
        *a5 = 1;
    }
    else
    {
      v21 = 1;
    }
    goto LABEL_15;
  }
  v18 = v17;
  if (v18)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }

  v21 = 0;
LABEL_15:

  return v21;
}

void __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HDCodableObjectAssociation *v10;

  v5 = a3;
  v6 = a2;
  v10 = -[HDCodableObjectAssociation initWithAssociationUUID:]([HDCodableObjectAssociation alloc], "initWithAssociationUUID:", v6);
  -[HDCodableObjectAssociation setObjectUuids:](v10, "setObjectUuids:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableSyncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableObjectAssociation setSyncIdentity:](v10, "setSyncIdentity:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a3;
  +[HDAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29880], "isNotNullPredicateWithProperty:", CFSTR("child_id_objects.uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29880], "isNotNullPredicateWithProperty:", CFSTR("parent_id_objects.uuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29840];
  v22[0] = v13;
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDAssociationEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v18, v11, v19, a6);
  return v20;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableObjectAssociation *v4;

  v3 = a3;
  v4 = -[HDCodableObjectAssociation initWithData:]([HDCodableObjectAssociation alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  _BOOL4 v7;
  void *v8;

  v7 = +[HDAssociationEntity _insertCodableObjectAssociations:syncStore:profile:error:](HDAssociationEntity, "_insertCodableObjectAssociations:syncStore:profile:error:", a3, a5, a6, a7);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("HDAssociationEntityDidReceiveSyncObjectsNotification"), 0);

  }
  return !v7;
}

@end
