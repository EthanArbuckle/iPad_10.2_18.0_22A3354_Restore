@implementation HDHealthEntity

+ (id)maxRowIDForPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__119;
  v20 = __Block_byref_object_dispose__119;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDHealthEntity_Conveniences__maxRowIDForPredicate_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E6CFCE08;
  v14 = &v16;
  v15 = a1;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a4, a5, v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)insertOrReplaceEntity:(BOOL)a3 healthDatabase:(id)a4 properties:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v12 = a5;
  v13 = a7;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__119;
  v28 = __Block_byref_object_dispose__119;
  v29 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__HDHealthEntity_insertOrReplaceEntity_healthDatabase_properties_error_bindingHandler___block_invoke;
  v18[3] = &unk_1E6CFCD68;
  v21 = &v24;
  v22 = a1;
  v23 = a3;
  v19 = v12;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", a4, a6, v18);
  v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

BOOL __87__HDHealthEntity_insertOrReplaceEntity_healthDatabase_properties_error_bindingHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "insertOrReplaceEntity:database:properties:error:bindingHandler:", *(unsigned __int8 *)(a1 + 64), v6, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

+ (BOOL)enumerateProperties:(id)a3 withPredicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthEntity.mm"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[properties count] > 0"));

    if (v16)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthEntity.mm"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationHandler != NULL"));

    goto LABEL_3;
  }
  if (!v16)
    goto LABEL_5;
LABEL_3:
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __106__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_healthDatabase_error_enumerationHandler___block_invoke;
  v24[3] = &unk_1E6CFCDB8;
  v28 = a1;
  v17 = v14;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v19 = v16;
  v27 = v19;
  v20 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v15, a6, v24);

  return v20;
}

uint64_t __106__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_healthDatabase_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "queryWithDatabase:predicate:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));

  return v7;
}

uint64_t __74__HDHealthEntity_Conveniences__maxRowIDForPredicate_healthDatabase_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[6];
  v8 = *MEMORY[0x1E0D29618];
  v9 = a1[4];
  v17 = 0;
  objc_msgSend(v7, "maxValueForProperty:predicate:database:error:", v8, v9, v6, &v17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

  v14 = *(_QWORD *)(a1[5] + 8);
  if (*(_QWORD *)(v14 + 40))
    goto LABEL_2;
  if (!v11)
  {
    *(_QWORD *)(v14 + 40) = &unk_1E6DFE228;
LABEL_2:
    v15 = 1;
    goto LABEL_3;
  }
  v15 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v11);
LABEL_3:

  return v15;
}

+ (BOOL)updateProperties:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__HDHealthEntity_updateProperties_predicate_healthDatabase_error_bindingHandler___block_invoke;
  v21[3] = &unk_1E6CFCDB8;
  v25 = a1;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  v19 = v15;
  v24 = v19;
  LOBYTE(a6) = objc_msgSend(v16, "performWriteTransactionWithHealthDatabase:error:block:", v14, a6, v21);

  return (char)a6;
}

uint64_t __81__HDHealthEntity_updateProperties_predicate_healthDatabase_error_bindingHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 56), "updateProperties:predicate:database:error:bindingHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, a3, *(_QWORD *)(a1 + 48));

  return v6;
}

+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 session:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  return objc_msgSend(a1, "nextSyncAnchorWithStartAnchor:predicate:syncEntityClass:session:orderingTerms:limit:healthDatabase:error:", a3, a4, 0, a5, 0, 0, a6, a7);
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 limit:(unint64_t)a7 lastSyncAnchor:(int64_t *)a8 healthDatabase:(id)a9 error:(id *)a10 block:(id)a11
{
  return objc_msgSend(a1, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:healthDatabase:error:block:", a3, a4, 0, a5, a6.start, a6.end, 0, a7, a8, a9, a10, a11);
}

- (BOOL)getValuesForProperties:(id)a3 healthDatabase:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HDHealthEntity_Conveniences__getValuesForProperties_healthDatabase_error_handler___block_invoke;
  v17[3] = &unk_1E6CFCD90;
  v17[4] = self;
  v14 = v10;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  LOBYTE(a5) = objc_msgSend(v13, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v17);

  return (char)a5;
}

uint64_t __84__HDHealthEntity_Conveniences__getValuesForProperties_healthDatabase_error_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "getValuesForProperties:database:handler:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48));

  return v4;
}

+ (int64_t)countOfObjectsWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HDHealthEntity_Conveniences__countOfObjectsWithPredicate_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E6CFCDE0;
  v14 = &v16;
  v15 = a1;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a4, a5, v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

BOOL __81__HDHealthEntity_Conveniences__countOfObjectsWithPredicate_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "countValueForProperty:predicate:database:error:", *MEMORY[0x1E0D29620], *(_QWORD *)(a1 + 32), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "longValue");

  return v8 != 0;
}

+ (id)anyWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__119;
  v20 = __Block_byref_object_dispose__119;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HDHealthEntity_Conveniences__anyWithPredicate_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E6CFCE08;
  v14 = &v16;
  v15 = a1;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a4, a5, v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __70__HDHealthEntity_Conveniences__anyWithPredicate_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "anyInDatabase:predicate:error:", v6, *(_QWORD *)(a1 + 32), a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 1;
}

- (id)valueForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__119;
  v21 = __Block_byref_object_dispose__119;
  v22 = 0;
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HDHealthEntity_Conveniences__valueForProperty_healthDatabase_error___block_invoke;
  v14[3] = &unk_1E6CF4720;
  v14[4] = self;
  v16 = &v17;
  v11 = v8;
  v15 = v11;
  objc_msgSend(v10, "performReadTransactionWithHealthDatabase:error:block:", v9, a5, v14);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __70__HDHealthEntity_Conveniences__valueForProperty_healthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:database:", *(_QWORD *)(a1 + 40), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 1;
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 syncAnchorRange:(HDSyncAnchorRange)a7 orderingTerms:(id)a8 limit:(unint64_t)a9 lastSyncAnchor:(int64_t *)a10 healthDatabase:(id)a11 error:(id *)a12 block:(id)a13
{
  uint64_t v14;

  LOBYTE(v14) = 1;
  return objc_msgSend(a1, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:distinct:healthDatabase:error:block:", a3, a4, a5, a6, a7.start, a7.end, a8, a9, a10, v14, a11, a12, a13);
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 syncAnchorRange:(HDSyncAnchorRange)a7 orderingTerms:(id)a8 limit:(unint64_t)a9 lastSyncAnchor:(int64_t *)a10 distinct:(BOOL)a11 healthDatabase:(id)a12 error:(id *)a13 block:(id)a14
{
  int64_t start;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;
  id v28;
  id v29;
  char v30;
  char v31;
  int64_t v32;
  void *v34;
  id v36;
  id v37;
  int64_t end;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  id v48;
  Class v49;
  int64_t v50;
  int64_t v51;
  unint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  end = a7.end;
  start = a7.start;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v37 = a8;
  v21 = a12;
  v22 = a14;
  objc_msgSend(a1, "propertyForSyncAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthEntity+Sync.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchorProperty != nil"));

  }
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke;
  v40[3] = &unk_1E6CF6D00;
  v36 = v18;
  v41 = v36;
  v24 = v23;
  v42 = v24;
  v48 = a1;
  v25 = v19;
  v43 = v25;
  v49 = a5;
  v26 = v20;
  v44 = v26;
  v27 = start;
  v50 = start;
  v51 = end;
  v28 = v37;
  v52 = a9;
  v53 = a11;
  v45 = v28;
  v47 = &v54;
  v29 = v22;
  v46 = v29;
  v30 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v21, a13, v40);
  v31 = v30 ^ 1;
  if (!a10)
    v31 = 1;
  if ((v31 & 1) == 0)
  {
    v32 = v55[3];
    if (!v32)
      v32 = v27;
    *a10 = v32;
  }

  _Block_object_dispose(&v54, 8);
  return v30;
}

uint64_t __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v20;
  _QWORD v21[4];
  __int128 v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0D29618]);
  if ((v7 & 1) != 0)
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (!v6 || (v9 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(a1 + 40)), v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v10 = *(void **)(a1 + 32);
      if (v10)
      {
        objc_msgSend(v10, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
        v11 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v11 = objc_claimAutoreleasedReturnValue();

      }
      v6 = (id)v11;
      v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    }
    v8 = v9;
  }
  objc_msgSend(*(id *)(a1 + 88), "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v5, "databaseForEntityClass:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHealthEntity _syncQueryWithDatabase:predicate:orderingTerms:limit:anchorProperty:distinct:](v13, v14, v12, *(void **)(a1 + 64), *(_QWORD *)(a1 + 120), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 128));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke_2;
  v21[3] = &unk_1E6CF6CD8;
  v16 = *(_QWORD *)(a1 + 88);
  v26 = v7;
  v20 = *(_OWORD *)(a1 + 72);
  v24 = v16;
  v25 = v8;
  v17 = (id)v20;
  v22 = v20;
  v23 = v27;
  v18 = objc_msgSend(v15, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v6, a3, v21);

  _Block_object_dispose(v27, 8);
  return v18;
}

+ (id)_syncQueryWithDatabase:(void *)a3 predicate:(void *)a4 orderingTerms:(uint64_t)a5 limit:(void *)a6 anchorProperty:(uint64_t)a7 distinct:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = a2;
  v16 = objc_opt_self();
  +[HDHealthEntity _syncQueryDescriptorWithPredicate:orderingTerms:limit:anchorProperty:distinct:](v16, v14, v13, a5, v12, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v15, v17);
  return v18;
}

uint64_t __184__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_syncEntityClass_session_syncAnchorRange_orderingTerms_limit_lastSyncAnchor_distinct_healthDatabase_error_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithPersistentID:", a2);
  if (!*(_BYTE *)(a1 + 72))
    a2 = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v7 = *(_QWORD *)(a1 + 32);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = (*(unsigned int (**)(void))(v7 + 16))();

  return v8;
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke;
  v19[3] = &unk_1E6CF6D50;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  v23 = a1;
  v15 = v14;
  v16 = v12;
  v17 = v13;
  LOBYTE(a6) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a5, a6, v19);

  return (char)a6;
}

uint64_t __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[4];

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "databaseForEntityClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHealthEntity _syncQueryWithDatabase:predicate:orderingTerms:limit:anchorProperty:distinct:](v6, v7, *(void **)(a1 + 32), 0, 0, (void *)*MEMORY[0x1E0D29618], 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke_2;
  v12[3] = &unk_1E6CF6D28;
  v15 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = v16;
  v10 = objc_msgSend(v8, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v9, a3, v12);

  _Block_object_dispose(v16, 8);
  return v10;
}

uint64_t __100__HDHealthEntity_Sync__enumerateEntitiesForSyncWithProperties_predicate_healthDatabase_error_block___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;

  v5 = (objc_class *)a1[6];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithPersistentID:", a2);
  v8 = a1[4];
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v9 = (*(uint64_t (**)(void))(v8 + 16))();

  return v9;
}

+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 syncEntityClass:(Class)a5 session:(id)a6 orderingTerms:(id)a7 limit:(unint64_t)a8 healthDatabase:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int64_t v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  id v35;
  Class v36;
  int64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  objc_msgSend(a1, "propertyForSyncAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthEntity+Sync.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchorProperty != nil"));

  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = -1;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __129__HDHealthEntity_Sync__nextSyncAnchorWithStartAnchor_predicate_syncEntityClass_session_orderingTerms_limit_healthDatabase_error___block_invoke;
  v29[3] = &unk_1E6CF6D78;
  v35 = a1;
  v22 = v17;
  v30 = v22;
  v36 = a5;
  v23 = v18;
  v31 = v23;
  v37 = a3;
  v24 = v19;
  v32 = v24;
  v38 = a8;
  v25 = v21;
  v33 = v25;
  v34 = &v39;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v20, a10, v29);
  v26 = v40[3];

  _Block_object_dispose(&v39, 8);
  return v26;
}

uint64_t __129__HDHealthEntity_Sync__nextSyncAnchorWithStartAnchor_predicate_syncEntityClass_session_orderingTerms_limit_healthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v21;

  v3 = *(void **)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = a2;
  v9 = HDSyncAnchorRangeMake(v7, 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", v5, v4, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHealthEntity _syncQueryDescriptorWithPredicate:orderingTerms:limit:anchorProperty:distinct:](*(_QWORD *)(a1 + 72), v11, *(void **)(a1 + 48), *(_QWORD *)(a1 + 96), *(void **)(a1 + 56), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *MEMORY[0x1E0D297E0];
  objc_msgSend(v8, "databaseForEntityClass:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v13, "aggregateSingleValueForProperty:function:queryDescriptor:database:error:", v14, v15, v12, v16, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;

  if (v17)
    v19 = objc_msgSend(v17, "longLongValue");
  else
    v19 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v19;

  return 1;
}

+ (id)_syncQueryDescriptorWithPredicate:(void *)a3 orderingTerms:(uint64_t)a4 limit:(void *)a5 anchorProperty:(uint64_t)a6 distinct:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a2;
  v13 = objc_opt_self();
  v14 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v14, "setEntityClass:", v13);
  objc_msgSend(v14, "setLimitCount:", a4);
  objc_msgSend(v14, "setPredicate:", v12);

  objc_msgSend(v14, "setReturnsDistinctEntities:", a6);
  if (v10)
  {
    objc_msgSend(v14, "setOrderingTerms:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", v11, v13, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOrderingTerms:", v16);

  }
  return v14;
}

+ (id)predicateForSyncWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6
{
  int64_t end;
  int64_t start;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  end = a6.end;
  start = a6.start;
  v11 = a3;
  v12 = a5;
  objc_msgSend(a1, "propertyForSyncAnchor");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", start);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);

  if (end != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", end);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", v30, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[objc_class excludedSyncStoresForSession:](a4, "excludedSyncStoresForSession:", v12);
  else
    objc_msgSend(v12, "excludedSyncStores");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "hk_map:", &__block_literal_global_88);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0D29848];
    objc_msgSend(a1, "propertyForSyncProvenance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doesNotContainPredicateWithProperty:values:", v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v23);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[objc_class excludedSyncIdentitiesForSession:](a4, "excludedSyncIdentitiesForSession:", v12);
  else
    objc_msgSend(v12, "excludedSyncIdentities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyForSyncIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v24, "hk_map:", &__block_literal_global_203_0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29848], "doesNotContainPredicateWithProperty:values:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v27);

  }
  if (v11)
    objc_msgSend(v14, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __94__HDHealthEntity_Sync__predicateForSyncWithPredicate_syncEntityClass_session_syncAnchorRange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "syncProvenance"));
}

id __94__HDHealthEntity_Sync__predicateForSyncWithPredicate_syncEntityClass_session_syncAnchorRange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "persistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)protectionClass
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("+[%@ %@] not implemented"), a1, v5);

  return 1;
}

+ (id)defaultForeignKey
{
  id v3;

  v3 = objc_alloc(MEMORY[0x1E0D29858]);
  return (id)objc_msgSend(v3, "initWithEntityClass:property:deletionAction:", a1, *MEMORY[0x1E0D29618], 2);
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  return 1;
}

+ (id)createValidationError:(id)a3 rowId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 120, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *MEMORY[0x1E0CB4DE8];
  objc_msgSend(a1, "databaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB3388];
  v17[0] = v9;
  v17[1] = v8;
  v11 = *MEMORY[0x1E0CB4DE0];
  v16[1] = v10;
  v16[2] = v11;
  v17[2] = v7;
  v16[3] = *MEMORY[0x1E0CB4DF8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID %@"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 120, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)propertyForSyncAnchor
{
  return (id)*MEMORY[0x1E0D29618];
}

+ (id)propertyForSyncProvenance
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)propertyForSyncIdentity
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)createTableSQLWithBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  v12 = 0;
  objc_msgSend(a1, "columnDefinitionsWithBehavior:count:", v4, &v12);
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "foreignKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "primaryKeyColumns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniquedColumns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "checkConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hasROWID");
  HDSQLiteEntityCreateTableSQL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)indicesWithBehavior:(id)a3
{
  objc_msgSend(a1, "indices", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)triggersWithBehavior:(id)a3
{
  objc_msgSend(a1, "triggers", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (const)columnDefinitionsWithBehavior:(id)a3 count:(unint64_t *)a4
{
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)objc_msgSend(a1, "columnDefinitionsWithCount:", a4);
}

+ (BOOL)performReadTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;

  v8 = a3;
  v9 = a5;
  objc_opt_self();
  if (v8)
  {
    objc_msgSend(a1, "transactionContextForWriting:baseContext:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "performTransactionWithContext:error:block:inaccessibilityHandler:", v10, a4, v9, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 1500, CFSTR("Nil healthDatabase"));
    v11 = 0;
  }

  return v11;
}

+ (BOOL)performReadTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_opt_self();
  if (v10)
  {
    objc_msgSend(a1, "transactionContextForWriting:baseContext:", 0, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, a5, v12, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 1500, CFSTR("Nil healthDatabase"));
    v14 = 0;
  }

  return v14;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;

  v8 = a3;
  v9 = a5;
  objc_opt_self();
  if (v8)
  {
    objc_msgSend(a1, "transactionContextForWriting:baseContext:", 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "performTransactionWithContext:error:block:inaccessibilityHandler:", v10, a4, v9, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 1500, CFSTR("Nil healthDatabase"));
    v11 = 0;
  }

  return v11;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_opt_self();
  if (v10)
  {
    objc_msgSend(a1, "transactionContextForWriting:baseContext:", 1, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, a5, v12, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 1500, CFSTR("Nil healthDatabase"));
    v14 = 0;
  }

  return v14;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_opt_self();
  if (v10)
  {
    objc_msgSend(a1, "transactionContextForWriting:baseContext:", 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, a4, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 1500, CFSTR("Nil healthDatabase"));
    v14 = 0;
  }

  return v14;
}

+ (BOOL)performWriteTransactionWithHealthDatabase:(id)a3 context:(id)a4 error:(id *)a5 block:(id)a6 inaccessibilityHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_opt_self();
  if (v12)
  {
    objc_msgSend(a1, "transactionContextForWriting:baseContext:", 1, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "performTransactionWithContext:error:block:inaccessibilityHandler:", v16, a5, v14, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 1500, CFSTR("Nil healthDatabase"));
    v17 = 0;
  }

  return v17;
}

+ (id)transactionContextForWriting:(BOOL)a3 baseContext:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "protectionClass") == 2)
  {
    if (v4)
    {
      v7 = (void *)objc_msgSend(v6, "copyForWritingProtectedData");
      if (!v7)
      {
        +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v9 = v8;

        goto LABEL_15;
      }
    }
    else
    {
      v7 = (void *)objc_msgSend(v6, "copyForReadingProtectedData");
      if (!v7)
      {
        +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  if (v4)
  {
    v7 = (void *)objc_msgSend(v6, "copyForWriting");
    if (!v7)
    {
      +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v8 = v7;
    goto LABEL_10;
  }
  if (v6)
  {
    v10 = v6;
  }
  else
  {
    +[HDDatabaseTransactionContext contextForReading](HDDatabaseTransactionContext, "contextForReading");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v10;
LABEL_15:

  return v9;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  return 0;
}

- (BOOL)updateProperties:(id)a3 healthDatabase:(id)a4 error:(id *)a5 bindingHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__HDHealthEntity_updateProperties_healthDatabase_error_bindingHandler___block_invoke;
  v17[3] = &unk_1E6CFCD90;
  v17[4] = self;
  v14 = v10;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  LOBYTE(a5) = objc_msgSend(v13, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v17);

  return (char)a5;
}

uint64_t __71__HDHealthEntity_updateProperties_healthDatabase_error_bindingHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "updateProperties:database:error:bindingHandler:", *(_QWORD *)(a1 + 40), v5, a3, *(_QWORD *)(a1 + 48));

  return v6;
}

+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  return 1;
}

+ (id)countDistinctForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__119;
  v20 = __Block_byref_object_dispose__119;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__HDHealthEntity_Conveniences__countDistinctForProperty_healthDatabase_error___block_invoke;
  v12[3] = &unk_1E6CFCE08;
  v14 = &v16;
  v15 = a1;
  v9 = v8;
  v13 = v9;
  if (objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a4, a5, v12))
    v10 = (id)v17[5];
  else
    v10 = &unk_1E6DFE210;

  _Block_object_dispose(&v16, 8);
  return v10;
}

BOOL __78__HDHealthEntity_Conveniences__countDistinctForProperty_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "countDistinctForProperty:predicate:database:error:", *(_QWORD *)(a1 + 32), 0, v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  return v10;
}

+ (int64_t)sizeOfDatabaseTableInHealthDatabase:(id)a3 error:(id *)a4
{
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__HDHealthEntity_Conveniences__sizeOfDatabaseTableInHealthDatabase_error___block_invoke;
  v6[3] = &unk_1E6CFCE30;
  v6[4] = &v7;
  v6[5] = a1;
  if (objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a3, a4, v6))
    v4 = v8[3];
  else
    v4 = -1;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __74__HDHealthEntity_Conveniences__sizeOfDatabaseTableInHealthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "sizeOfEntityTableInDatabase:", v4);

  return 1;
}

+ (BOOL)enumerateProperties:(id)a3 withPredicate:(id)a4 orderingTerms:(id)a5 groupBy:(id)a6 limit:(unint64_t)a7 healthDatabase:(id)a8 error:(id *)a9 enumerationHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v31 = a6;
  v20 = a8;
  v21 = a10;
  if (!objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthEntity.mm"), 355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[properties count] > 0"));

    if (v21)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthEntity.mm"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationHandler != NULL"));

    goto LABEL_3;
  }
  if (!v21)
    goto LABEL_5;
LABEL_3:
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __134__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_orderingTerms_groupBy_limit_healthDatabase_error_enumerationHandler___block_invoke;
  v32[3] = &unk_1E6CFCE58;
  v38 = a1;
  v22 = v18;
  v33 = v22;
  v39 = a7;
  v23 = v19;
  v34 = v23;
  v24 = v31;
  v35 = v24;
  v25 = v17;
  v36 = v25;
  v26 = v21;
  v37 = v26;
  v27 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v20, a9, v32);

  return v27;
}

uint64_t __134__HDHealthEntity_Conveniences__enumerateProperties_withPredicate_orderingTerms_groupBy_limit_healthDatabase_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", *(_QWORD *)(a1 + 56), a3, *(_QWORD *)(a1 + 64));

  return v7;
}

+ (BOOL)deleteEntitiesWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HDHealthEntity_Conveniences__deleteEntitiesWithPredicate_healthDatabase_error___block_invoke;
  v11[3] = &unk_1E6CFCE80;
  v12 = v8;
  v13 = a1;
  v9 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", a4, a5, v11);

  return (char)a5;
}

uint64_t __81__HDHealthEntity_Conveniences__deleteEntitiesWithPredicate_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 40), "deleteEntitiesInDatabase:predicate:error:", v5, *(_QWORD *)(a1 + 32), a3);

  return v6;
}

+ (id)propertyValueForAnyWithProperty:(id)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__119;
  v25 = __Block_byref_object_dispose__119;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__HDHealthEntity_Conveniences__propertyValueForAnyWithProperty_predicate_healthDatabase_error___block_invoke;
  v16[3] = &unk_1E6CFCEA8;
  v19 = &v21;
  v20 = a1;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", a5, a6, v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __95__HDHealthEntity_Conveniences__propertyValueForAnyWithProperty_predicate_healthDatabase_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  id v20;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[7];
  v8 = a1[4];
  v9 = a1[5];
  v20 = 0;
  objc_msgSend(v7, "propertyValueForAnyInDatabase:property:predicate:error:", v6, v8, v9, &v20);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

  v14 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v15 = v11;
  v16 = v15;
  if (v15)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();
  }

  if (v16)
    v17 = v14 == 0;
  else
    v17 = 0;
  v18 = !v17;

  return v18;
}

- (id)stringForProperty:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__119;
  v22 = __Block_byref_object_dispose__119;
  v23 = 0;
  v10 = (void *)objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__HDHealthEntity_Conveniences__stringForProperty_healthDatabase_error___block_invoke;
  v15[3] = &unk_1E6CF4720;
  v15[4] = self;
  v17 = &v18;
  v11 = v8;
  v16 = v11;
  if (objc_msgSend(v10, "performReadTransactionWithHealthDatabase:error:block:", v9, a5, v15))
    v12 = (void *)v19[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __71__HDHealthEntity_Conveniences__stringForProperty_healthDatabase_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringForProperty:database:", *(_QWORD *)(a1 + 40), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 1;
}

- (id)dateForProperty:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__119;
  v23 = __Block_byref_object_dispose__119;
  v24 = 0;
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__HDHealthEntity_Conveniences__dateForProperty_transaction_error___block_invoke;
  v16[3] = &unk_1E6CFCED0;
  v18 = &v19;
  v12 = v8;
  v17 = v12;
  LODWORD(a5) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v10, v11, a5, v16);

  if ((_DWORD)a5)
    v13 = (void *)v20[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __66__HDHealthEntity_Conveniences__dateForProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsDate();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setDate:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__HDHealthEntity_Conveniences__setDate_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6CFCEF8;
  v15 = v11;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  LOBYTE(a6) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v13, v14, a6, v18);

  return (char)a6;
}

void __70__HDHealthEntity_Conveniences__setDate_forProperty_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0E4);
}

- (id)stringForProperty:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__119;
  v23 = __Block_byref_object_dispose__119;
  v24 = 0;
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HDHealthEntity_Conveniences__stringForProperty_transaction_error___block_invoke;
  v16[3] = &unk_1E6CFCED0;
  v18 = &v19;
  v12 = v8;
  v17 = v12;
  LODWORD(a5) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v10, v11, a5, v16);

  if ((_DWORD)a5)
    v13 = (void *)v20[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __68__HDHealthEntity_Conveniences__stringForProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsString();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setString:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HDHealthEntity_Conveniences__setString_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6CFCEF8;
  v15 = v11;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  LOBYTE(a6) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v13, v14, a6, v18);

  return (char)a6;
}

void __72__HDHealthEntity_Conveniences__setString_forProperty_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB144);
}

- (id)numberForProperty:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__119;
  v23 = __Block_byref_object_dispose__119;
  v24 = 0;
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HDHealthEntity_Conveniences__numberForProperty_transaction_error___block_invoke;
  v16[3] = &unk_1E6CFCED0;
  v18 = &v19;
  v12 = v8;
  v17 = v12;
  LODWORD(a5) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v10, v11, a5, v16);

  if ((_DWORD)a5)
    v13 = (void *)v20[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __68__HDHealthEntity_Conveniences__numberForProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setNumber:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HDHealthEntity_Conveniences__setNumber_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6CFCEF8;
  v15 = v11;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  LOBYTE(a6) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v13, v14, a6, v18);

  return (char)a6;
}

void __72__HDHealthEntity_Conveniences__setNumber_forProperty_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB12CLL);
}

- (id)foreignKeyEntity:(Class)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  Class v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__119;
  v26 = __Block_byref_object_dispose__119;
  v27 = 0;
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseForEntity:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__HDHealthEntity_Conveniences__foreignKeyEntity_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6CFCF20;
  v14 = v10;
  v19 = v14;
  v20 = &v22;
  v21 = a3;
  LODWORD(a6) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v12, v13, a6, v18);

  if ((_DWORD)a6)
    v15 = (void *)v23[5];
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&v22, 8);
  return v16;
}

void __79__HDHealthEntity_Conveniences__foreignKeyEntity_forProperty_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPersistentID:", HDSQLiteColumnWithNameAsInt64());
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (BOOL)setForeignKeyEntity:(id)a3 forProperty:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseForEntity:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__HDHealthEntity_Conveniences__setForeignKeyEntity_forProperty_transaction_error___block_invoke;
  v18[3] = &unk_1E6CFCEF8;
  v15 = v10;
  v19 = v15;
  v16 = v11;
  v20 = v16;
  LOBYTE(a6) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v13, v14, a6, v18);

  return (char)a6;
}

void __82__HDHealthEntity_Conveniences__setForeignKeyEntity_forProperty_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "persistentID");
    JUMPOUT(0x1BCCAB114);
  }
  JUMPOUT(0x1BCCAB120);
}

- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteEntity willDeleteFromDatabase:](self, "willDeleteFromDatabase:", v7);

  return 1;
}

+ (id)updateSQLForTimeOffsetWithBindingCount:(unint64_t *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  unint64_t *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "columnNamesForTimeOffset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v17, "count");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("UPDATE %@ SET "), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a3;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v17;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      v12 = 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          if (v12 + i >= v5)
            v14 = "";
          else
            v14 = ", ";
          objc_msgSend(v8, "appendFormat:", CFSTR("%@ = %@ + ?%s"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v14);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v12 += i;
      }
      while (v10);
    }

    if (v16)
      *v16 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)columnNamesForTimeOffset
{
  return 0;
}

@end
