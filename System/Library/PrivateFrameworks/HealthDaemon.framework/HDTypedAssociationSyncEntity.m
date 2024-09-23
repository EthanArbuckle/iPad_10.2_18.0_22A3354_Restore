@implementation HDTypedAssociationSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 71);
}

+ (id)_syncPredicateForSession:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v2 = a2;
  objc_opt_self();
  HDAssociationEntityPredicateForAssociationEntityForNotType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultMaximumObjectAge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CB6128];
    objc_msgSend(v2, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_dateBySubtractingDays:fromDate:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    objc_msgSend(v6, "numberWithDouble:", -v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v14, "dateByAddingTimeInterval:", -v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    HDAssociationEntityPredicateForChildEndDate(6, (uint64_t)v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v3, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v3;
  }

  return v18;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t start;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  char v25;
  id v27;
  int64_t end;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  _QWORD *v44;
  id v45;
  int64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];

  end = a4.end;
  start = a4.start;
  v11 = a3;
  v12 = a5;
  v30 = a6;
  +[HDTypedAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = objc_msgSend(v11, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  v59[0] = 0;
  v59[1] = v59;
  if (v16 >= 0)
    v17 = v16;
  else
    v17 = v16 + 127;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = -1;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__86;
  v53 = __Block_byref_object_dispose__86;
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v36[3] = &unk_1E6CF76B8;
  v19 = v13;
  v37 = v19;
  v45 = a1;
  v46 = start;
  v47 = end;
  v29 = v11;
  v38 = v29;
  v43 = &v55;
  v20 = v12;
  v39 = v20;
  v21 = v14;
  v40 = v21;
  v22 = v15;
  v41 = v22;
  v23 = v27;
  v42 = v23;
  v44 = v59;
  v48 = v17 >> 7;
  v24 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v18, a7, v36);

  if (v24)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v32[3] = &unk_1E6CF76E0;
    v33 = v22;
    v34 = v21;
    v35 = &v49;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v32);
    v25 = objc_msgSend(v30, "sendCodableChange:resultAnchor:sequence:done:error:", v50[5], v56[3], 0, 1, a7);

  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v59, 8);

  return v25;
}

BOOL __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  id v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24;
  objc_msgSend(*(id *)(a1 + 48), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6CF7690;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 48);
  v21 = v5;
  v22 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 88);
  v23 = v11;
  v24 = v12;
  v25 = *(_QWORD *)(a1 + 120);
  v14 = *(_QWORD *)(a1 + 104);
  v13 = *(_QWORD *)(a1 + 112);
  v15 = v5;
  v16 = +[HDAssociationEntity _enumerateTypedAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:transaction:error:block:](HDAssociationEntity, "_enumerateTypedAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:transaction:error:block:", v8, v6, v7, v14, v13, v9, v10, v15, a3, v18);

  return v16;
}

uint64_t __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned int a6, uint64_t a7, void *a8, _BYTE *a9, _QWORD *a10)
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  HDIntermediateSyncAssociation *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v34;
  id v36;

  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a8;
  objc_msgSend(v16, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v18, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    goto LABEL_6;
  v34 = v17;
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1 + 48);
  v36 = 0;
  objc_msgSend(v24, "identityForEntityID:transaction:error:", a5, v25, &v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v36;

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v26, v20);

    v17 = v34;
LABEL_6:
    v28 = -[HDIntermediateSyncAssociation initWithAssociationUUID:type:creationDate:deleted:destinationSubObjectUUID:]([HDIntermediateSyncAssociation alloc], "initWithAssociationUUID:type:creationDate:deleted:destinationSubObjectUUID:", v16, a7, v19, a6, v18);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v28, v20);

    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v20);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v29 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v29, v20);
    }
    objc_msgSend(v29, "hk_appendBytesWithUUID:", v17);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v30 = *(_QWORD *)(a1 + 80);
    if (v30)
    {
      v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v32 = 1;
      if (v31 >= v30)
        *a9 = 1;
    }
    else
    {
      v32 = 1;
    }
    goto LABEL_17;
  }
  v29 = v27;
  v17 = v34;
  if (v29)
  {
    if (a10)
      *a10 = objc_retainAutorelease(v29);
    else
      _HKLogDroppedError();
  }

  v32 = 0;
LABEL_17:

  return v32;
}

void __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HDCodableTypedObjectAssociation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDCodableTypedObjectAssociation *v12;

  v5 = a3;
  v6 = a2;
  v7 = [HDCodableTypedObjectAssociation alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDCodableTypedObjectAssociation initWithIntermediateSyncAssociation:](v7, "initWithIntermediateSyncAssociation:", v8);

  -[HDCodableTypedObjectAssociation setObjectUUIDs:](v12, "setObjectUUIDs:", v5);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "codableSyncIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTypedObjectAssociation setSyncIdentity:](v12, "setSyncIdentity:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
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
  +[HDTypedAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v11);
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
  HDCodableTypedObjectAssociation *v4;

  v3 = a3;
  v4 = -[HDCodableTypedObjectAssociation initWithData:]([HDCodableTypedObjectAssociation alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "associationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v13, "insertCodableTypedObjectAssociations:syncStore:profile:error:", v12, v11, v10, a7);

  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 50;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

@end
