@implementation HDKeyValueSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)category
{
  NSRequestConcreteImplementation();
  return -1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t start;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  int64_t end;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  objc_class *v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  end = a4.end;
  start = a4.start;
  v12 = a3;
  v13 = a5;
  v27 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = objc_msgSend(a1, "category");
  +[HDKeyValueEntity _predicateForCategory:]((uint64_t)HDKeyValueEntity, objc_msgSend(a1, "category"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[HDKeyValueEntity _entityClassForKeyValueCategory:](HDKeyValueEntity, "_entityClassForKeyValueCategory:", v15);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = -1;
  objc_msgSend(v13, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v28[3] = &unk_1E6D0BE68;
  v34 = v17;
  v19 = v13;
  v29 = v19;
  v20 = v16;
  v30 = v20;
  v21 = v12;
  v35 = start;
  v36 = end;
  v31 = v21;
  v33 = &v38;
  v22 = v14;
  v32 = v22;
  v37 = v15;
  LODWORD(start) = -[objc_class performReadTransactionWithHealthDatabase:error:block:](v17, "performReadTransactionWithHealthDatabase:error:block:", v18, a7, v28);

  if ((_DWORD)start)
  {
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v27, "sendCodableChange:resultAnchor:sequence:done:error:", v23, v39[3], 0, 1, a7);

  }
  else
  {
    v24 = 0;
  }

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 72), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("domain");
  v29[1] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 72);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v23[3] = &unk_1E6D0BE40;
  v24 = v5;
  v14 = *(id *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 96);
  v25 = v14;
  v28 = v15;
  v26 = *(id *)(a1 + 32);
  v27 = v4;
  v17 = *(_QWORD *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 88);
  v18 = v4;
  v19 = v5;
  v20 = objc_msgSend(v11, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v8, v10, v9, v17, v16, 0, v12, v13, a3, v23);

  return v20;
}

BOOL __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HDCodableCategoryDomainDictionary *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", &stru_1E6D11BB8))
  {

  }
  else if (v11)
  {
    v12 = v11;
    v13 = v12;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
  v14 = (HDCodableCategoryDomainDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = -[HDCodableCategoryDomainDictionary initWithCategory:domain:]([HDCodableCategoryDomainDictionary alloc], "initWithCategory:domain:", *(_QWORD *)(a1 + 64), v13);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v12);
  }
  v15 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(*(id *)(a1 + 48), "syncIdentityManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identityForEntityID:transaction:error:", v15, *(_QWORD *)(a1 + 56), a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HDCodableCategoryDomainDictionary addKeyValuePairs:](v14, "addKeyValuePairs:", v10);
    objc_msgSend(v17, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "codableSyncIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCategoryDomainDictionary setSyncIdentity:](v14, "setSyncIdentity:", v19);

  }
  return v17 != 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int64_t v16;

  v10 = a5;
  v11 = a3;
  v12 = objc_msgSend(a1, "category");
  v13 = +[HDKeyValueEntity _entityClassForKeyValueCategory:](HDKeyValueEntity, "_entityClassForKeyValueCategory:", v12);
  +[HDKeyValueEntity _predicateForCategory:]((uint64_t)HDKeyValueEntity, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[objc_class nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](v13, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v14, v11, v15, a6);
  return v16;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableCategoryDomainDictionary *v4;

  v3 = a3;
  v4 = -[HDCodableCategoryDomainDictionary initWithData:]([HDCodableCategoryDomainDictionary alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  void *v41;
  void *v42;
  uint64_t v44;
  objc_class *v45;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v50 = objc_msgSend(a1, "category");
  v45 = +[HDKeyValueEntity _entityClassForKeyValueCategory:](HDKeyValueEntity, "_entityClassForKeyValueCategory:");
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v15 = v10;
  v53 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (!v53)
  {

    goto LABEL_36;
  }
  v52 = *(_QWORD *)v59;
  v51 = 1;
  v48 = v15;
  v49 = a1;
  v47 = v14;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v59 != v52)
        objc_enumerationMutation(v15);
      v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v16);
      if ((objc_msgSend(v17, "hasCategory") & 1) == 0)
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "ignoring synced dictionary with missing category", buf, 2u);
        }
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = CFSTR("Missing Category");
        goto LABEL_16;
      }
      if (objc_msgSend(v17, "category") != v50)
      {
        _HKInitializeLogging();
        v21 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v37 = v21;
          v38 = objc_msgSend(v17, "category");
          *(_DWORD *)buf = 134217984;
          v64 = v38;
          _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "ignoring synced dictionary with incorrect category %ld", buf, 0xCu);

        }
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v44 = objc_msgSend(v17, "category");
        v19 = v22;
        v20 = CFSTR("Incorrect Category %ld");
LABEL_16:
        objc_msgSend(v19, "hk_error:format:", 100, v20, v44);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "daemon");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "autoBugCaptureReporter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "reportApplyDataFailure:duringSyncFromStore:error:", objc_opt_class(), v11, v23);

        goto LABEL_17;
      }
      if ((v51 & 1) != 0)
        v51 = -[objc_class _insertCodableCategoryDomainDictionary:provenance:profile:error:](v45, "_insertCodableCategoryDomainDictionary:provenance:profile:error:", v17, objc_msgSend(v11, "syncProvenance"), v12, a7);
      else
        v51 = 0;
      objc_msgSend(v17, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v17, "domain");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v27);

      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v17, "keyValuePairs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v28)
      {
        v29 = v28;
        v30 = v12;
        v31 = v11;
        v32 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v55 != v32)
              objc_enumerationMutation(v23);
            v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v34, "key");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              objc_msgSend(v34, "key");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v36);

            }
          }
          v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v29);
        v11 = v31;
        v12 = v30;
        v15 = v48;
        a1 = v49;
        v14 = v47;
      }
LABEL_17:

      ++v16;
    }
    while (v16 != v53);
    v39 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    v53 = v39;
  }
  while (v39);

  if ((v51 & 1) != 0)
  {
LABEL_36:
    objc_msgSend(v14, "allObjects");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "didReceiveValuesForDomainNames:profile:", v41, v12);

    objc_msgSend(v13, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "didReceiveValuesForKeys:profile:", v42, v12);

    v40 = 0;
    goto LABEL_37;
  }
  v40 = 1;
LABEL_37:

  return v40;
}

@end
