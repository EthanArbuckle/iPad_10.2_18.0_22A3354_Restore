@implementation HDLogicalSourceOrderSyncEntity

+ (int)nanoSyncObjectType
{
  return 14;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 14);
}

+ (id)_sourceOrderSyncPredicateForSession:(uint64_t)a1
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "syncStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "protocolVersion");

  if (v4 > 5)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v2, "excludedSyncStores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_map:", &__block_literal_global_281);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29848], "doesNotContainPredicateWithProperty:values:", CFSTR("sources.provenance"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __70__HDLogicalSourceOrderSyncEntity__sourceOrderSyncPredicateForSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "syncProvenance"));
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _BOOL4 v28;
  id v29;
  id v30;
  uint64_t *v31;
  char v32;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t *v53;
  id v54;
  int64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[4];
  _QWORD v71[7];

  end = a4.end;
  start = a4.start;
  v71[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = a1;
  v17 = objc_msgSend(v12, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  v18 = v17;
  v70[0] = 0;
  v70[1] = v70;
  if (v17 >= 0)
    v19 = v17;
  else
    v19 = v17 + 63;
  v70[2] = 0x2020000000;
  v70[3] = -1;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  objc_msgSend(v13, "database");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = end;
  v35 = v14;
  v71[0] = CFSTR("data_type");
  v71[1] = CFSTR("user_preferred");
  v71[2] = CFSTR("sources.uuid");
  v71[3] = CFSTR("modification_date");
  v71[4] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = -1;
  objc_msgSend(v13, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 >> 6;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v43[3] = &unk_1E6D0EC40;
  v34 = v21;
  v44 = v34;
  v54 = v37;
  v55 = start;
  v56 = v20;
  v38 = v12;
  v45 = v38;
  v50 = &v58;
  v24 = v36;
  v46 = v24;
  v51 = v70;
  v57 = v23;
  v52 = &v66;
  v53 = &v62;
  v25 = v15;
  v47 = v25;
  v26 = v13;
  v48 = v26;
  v27 = v16;
  v49 = v27;
  v28 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v22, a7, v43);

  if (v28)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v40[3] = &unk_1E6D0EC68;
    v41 = v27;
    v30 = v29;
    v42 = v30;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v40, v34);
    if (v18 <= 63)
    {
      v31 = v59;
    }
    else
    {
      v31 = v59;
      if (v67[3] >= v23)
        v59[3] = v63[3];
    }
    v32 = objc_msgSend(v35, "sendCodableChange:resultAnchor:sequence:done:error:", v30, v31[3], 0, 1, a7);

  }
  else
  {
    v32 = 0;
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(v70, 8);

  return v32;
}

BOOL __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _BOOL8 v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  +[HDLogicalSourceOrderSyncEntity _sourceOrderSyncPredicateForSession:](*(_QWORD *)(a1 + 112), *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v17[3] = &unk_1E6D0EC18;
  v11 = *(_QWORD *)(a1 + 136);
  v22 = *(_OWORD *)(a1 + 88);
  v23 = *(_QWORD *)(a1 + 104);
  v24 = v11;
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v20 = v5;
  v21 = *(id *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 120);
  v12 = *(_QWORD *)(a1 + 128);
  v14 = v5;
  v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDLogicalSourceOrderEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, v7, v9, v13, v12, 0, v8, v10, a3, v17);

  return v15;
}

uint64_t __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, _QWORD *a8)
{
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  HDCodableObjectTypeSourceOrder *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v29;

  v13 = HDSQLiteColumnAsInt64();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (v13 != *(_QWORD *)(v15 + 24))
  {
    v16 = *(_QWORD *)(a1 + 88);
    if (v16 >= 1 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) >= v16)
    {
      v27 = 1;
      *a7 = 1;
      goto LABEL_13;
    }
  }
  *(_QWORD *)(v15 + 24) = v13;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
  v17 = (HDCodableObjectTypeSourceOrder *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = objc_alloc_init(HDCodableObjectTypeSourceOrder);
    -[HDCodableObjectTypeSourceOrder setObjectType:](v17, "setObjectType:", v13);
    -[HDCodableObjectTypeSourceOrder setUserOrdered:](v17, "setUserOrdered:", MEMORY[0x1BCCAB174](a4, 1));
    v18 = HDSQLiteColumnWithNameAsInt64();
    objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 48);
    v29 = 0;
    objc_msgSend(v19, "identityForEntityID:transaction:error:", v18, v20, &v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v29;

    if (!v21)
    {
      v25 = v22;
      if (v25)
      {
        if (a8)
          *a8 = objc_retainAutorelease(v25);
        else
          _HKLogDroppedError();
      }

      v27 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v21, "identity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "codableSyncIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableObjectTypeSourceOrder setSyncIdentity:](v17, "setSyncIdentity:", v24);

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, v14);
  }
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v14);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v25, v14);
  }
  v26 = MEMORY[0x1BCCAB180](a4, 2);
  if (v26)
    objc_msgSend(v25, "appendBytes:length:", v26, (int)MEMORY[0x1BCCAB1EC](a4, 2));
  MEMORY[0x1BCCAB1A4](a4, 3);
  -[HDCodableObjectTypeSourceOrder addModificationDates:](v17, "addModificationDates:");
  v27 = 1;
LABEL_12:

LABEL_13:
  return v27;
}

void __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceUUIDs:", v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
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
  +[HDLogicalSourceOrderSyncEntity _sourceOrderSyncPredicateForSession:]((uint64_t)a1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDLogicalSourceOrderEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v12, v11, v13, a6);
  return v14;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableObjectTypeSourceOrder *v4;

  v3 = a3;
  v4 = -[HDCodableObjectTypeSourceOrder initWithData:]([HDCodableObjectTypeSourceOrder alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9;
  void *v10;

  v9 = a3;
  objc_msgSend(a6, "sourceOrderManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v10, "createSourceOrdersWithCodables:error:", v9, a7);

  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

@end
