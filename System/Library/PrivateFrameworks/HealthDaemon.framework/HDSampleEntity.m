@implementation HDSampleEntity

+ (id)objectInsertionFilterForProfile:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD aBlock[4];
  id v14;

  objc_msgSend(a3, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSampleExpiration");

  if (!v5)
    return &__block_literal_global_282;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB6120];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfDateBySubtractingDays:fromDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HDSampleEntity_objectInsertionFilterForProfile___block_invoke;
  aBlock[3] = &unk_1E6CF2E08;
  v14 = v9;
  v10 = v9;
  v11 = _Block_copy(aBlock);

  return v11;
}

uint64_t __50__HDSampleEntity_objectInsertionFilterForProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 3, CFSTR("The provided object's end date is too early."));
  return v6;
}

+ (id)samplesWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 limit:(unint64_t)a7 anchor:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityEnumeratorWithType:profile:", v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v18);
  objc_msgSend(v20, "addEncodingOptionsFromDictionary:", v17);
  objc_msgSend(v20, "setLimitCount:", a7);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], objc_opt_class(), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOrderingTerms:", v22);

  if (a8)
  {
    objc_msgSend(v20, "setAnchor:", *a8);
    v23 = objc_msgSend(*a8, "longLongValue");
    v36[3] = v23;
  }
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __87__HDSampleEntity_samplesWithType_profile_encodingOptions_predicate_limit_anchor_error___block_invoke;
  v32 = &unk_1E6CE7E78;
  v24 = v19;
  v33 = v24;
  v34 = &v35;
  v25 = objc_msgSend(v20, "enumerateWithError:handler:", a9, &v29);
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v36[3], v29, v30, v31, v32);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v25)
    v26 = v24;
  else
    v26 = 0;
  v27 = v26;

  _Block_object_dispose(&v35, 8);
  return v27;
}

+ (id)entityEnumeratorWithType:(id)a3 profile:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HDDataEntityEnumerator _initWithObjectType:entityClass:profile:]([HDDataEntityEnumerator alloc], "_initWithObjectType:entityClass:profile:", v6, objc_msgSend((id)objc_msgSend(v6, "dataObjectClass"), "hd_dataEntityClass"), v5);

  return v7;
}

+ (id)anySampleOfType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__60;
  v24 = __Block_byref_object_dispose__60;
  v25 = 0;
  objc_msgSend(a1, "entityEnumeratorWithType:profile:", v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v15);
  objc_msgSend(v16, "addEncodingOptionsFromDictionary:", v14);
  objc_msgSend(v16, "setLimitCount:", 1);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__HDSampleEntity_anySampleOfType_profile_encodingOptions_predicate_error___block_invoke;
  v19[3] = &unk_1E6CE7EA0;
  v19[4] = &v20;
  objc_msgSend(v16, "enumerateWithError:handler:", a7, v19);
  v17 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v17;
}

+ (id)mostRecentSampleWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 anchor:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__60;
  v33 = __Block_byref_object_dispose__60;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__60;
  v27 = __Block_byref_object_dispose__60;
  v28 = 0;
  objc_msgSend(a1, "entityEnumeratorWithType:profile:", v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v17);
  objc_msgSend(v18, "addEncodingOptionsFromDictionary:", v16);
  HDSampleEntityOrderingTermsForRecentness();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOrderingTerms:", v19);

  objc_msgSend(v18, "setLimitCount:", 1);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__HDSampleEntity_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error___block_invoke;
  v22[3] = &unk_1E6CF2C40;
  v22[4] = &v29;
  v22[5] = &v23;
  objc_msgSend(v18, "enumerateWithError:handler:", a8, v22);
  if (a7)
    *a7 = objc_retainAutorelease((id)v24[5]);
  v20 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v20;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleEntity.m"), 100, CFSTR("Subclasses must override %s"), "+[HDSampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__HDSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v22[3] = &unk_1E6CE7750;
  v23 = v14;
  v24 = v12;
  v16 = v12;
  v17 = v14;
  if (objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO samples (data_id, data_type, start_date, end_date) VALUES (?, ?, ?, ?)"), a7, v22, 0))v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

+ (BOOL)requiresSampleTypePredicate
{
  return objc_opt_class() == (_QWORD)a1;
}

uint64_t __87__HDSampleEntity_samplesWithType_profile_encodingOptions_predicate_limit_anchor_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v6 + 24) < a3)
    *(_QWORD *)(v6 + 24) = a3;

  return 1;
}

uint64_t __74__HDSampleEntity_anySampleOfType_profile_encodingOptions_predicate_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (int64_t)countOfSamplesWithType:(id)a3 profile:(id)a4 matchingPredicate:(id)a5 withError:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;

  v9 = (void *)MEMORY[0x1E0D29890];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  HDSampleEntityPredicateForDataType(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "compoundPredicateWithPredicate:otherPredicate:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v12, "dataObjectClass");
  v16 = (void *)objc_msgSend(v15, "hd_dataEntityClass");
  objc_msgSend(v11, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v16, "countOfObjectsWithPredicate:healthDatabase:error:", v14, v17, a6);
  return v18;
}

uint64_t __90__HDSampleEntity_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 0;
}

+ (id)oldestSampleWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__60;
  v25 = __Block_byref_object_dispose__60;
  v26 = 0;
  objc_msgSend(a1, "entityEnumeratorWithType:profile:", v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v15);
  objc_msgSend(v16, "addEncodingOptionsFromDictionary:", v14);
  HDSampleEntityOrderingTermsForOldness();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOrderingTerms:", v17);

  objc_msgSend(v16, "setLimitCount:", 1);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__HDSampleEntity_oldestSampleWithType_profile_encodingOptions_predicate_error___block_invoke;
  v20[3] = &unk_1E6CE7EA0;
  v20[4] = &v21;
  objc_msgSend(v16, "enumerateWithError:handler:", a7, v20);
  v18 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v18;
}

uint64_t __79__HDSampleEntity_oldestSampleWithType_profile_encodingOptions_predicate_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (id)databaseTable
{
  return CFSTR("samples");
}

+ (Class)_deletedEntityClass
{
  return (Class)objc_opt_class();
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_29;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v18[0] = CFSTR("data_type");
  v18[1] = CFSTR("start_date");
  v18[2] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("type_dates"), v4);
  v19[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D29860]);
  v7 = objc_opt_class();
  v17[0] = CFSTR("data_type");
  v17[1] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntity:name:columns:", v7, CFSTR("type_end"), v8);
  v19[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D29860]);
  v11 = objc_opt_class();
  v16[0] = CFSTR("data_type");
  v16[1] = CFSTR("data_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithEntity:name:columns:", v11, CFSTR("type_anchor"), v12);
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __80__HDSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;
  double v6;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 2, objc_msgSend(v4, "code"));

  objc_msgSend(*(id *)(a1 + 40), "_startTimestamp");
  sqlite3_bind_double(a2, 3, v5);
  objc_msgSend(*(id *)(a1 + 40), "_endTimestamp");
  return sqlite3_bind_double(a2, 4, v6);
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ascending");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5E60]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("start_date");
LABEL_5:
    v10 = v7;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5E48]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("end_date");
    goto LABEL_5;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB56C8]))
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___HDSampleEntity;
    objc_msgSendSuper2(&v15, sel_orderingTermForSortDescriptor_, v4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1E0D29888];
  v8 = objc_opt_class();
  v10 = v14;
  v9 = CFSTR("data_id");
LABEL_6:
  objc_msgSend(v10, "orderingTermWithProperty:entityClass:ascending:", v9, v8, v6);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v12 = (void *)v11;

  return v12;
}

+ (id)maxAnchorForSamplesWithType:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  HDSampleEntityPredicateForDataType(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDHealthEntity maxRowIDForPredicate:healthDatabase:error:](HDSampleEntity, "maxRowIDForPredicate:healthDatabase:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)deleteSamplesWithTypes:(id)a3 sourceEntities:(id)a4 profile:(id)a5 recursiveDeleteAuthorizationBlock:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, id);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v25 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, id))a7;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__60;
  v58 = __Block_byref_object_dispose__60;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__60;
  v52 = __Block_byref_object_dispose__60;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__60;
  v46 = __Block_byref_object_dispose__60;
  v47 = 0;
  if (objc_msgSend(v13, "count") || objc_msgSend(v14, "count"))
  {
    if (objc_msgSend(v14, "count"))
    {
      HDDataEntityPredicateForSourceEntitySet(7, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if (objc_msgSend(v13, "count"))
    {
      HDSampleEntityPredicateForDataTypes(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v15, "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke;
    v31[3] = &unk_1E6CF2C90;
    v21 = v18;
    v32 = v21;
    v22 = v17;
    v33 = v22;
    v40 = a1;
    v34 = v15;
    v35 = v25;
    v36 = &v60;
    v37 = &v54;
    v38 = &v48;
    v39 = &v42;
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_3;
    v26[3] = &unk_1E6CF2CD8;
    v27 = v14;
    v28 = v13;
    v30 = &v60;
    v29 = v34;
    v23 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v19, &v41, v31, v26);
    v24 = v41;

    if (v16)
      v16[2](v16, v23, *((unsigned __int8 *)v61 + 24), v55[5], v49[5], v43[5], v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Invalid arguments to delete; source entities or types must be non-empty."));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, 0, 0, 0, 0, v22);
    v24 = 0;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

}

BOOL __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  _QWORD v18[6];
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D29840];
  HDDataEntityPredicateForType(1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compoundPredicateWithPredicate:otherPredicate:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__60;
  v25 = __Block_byref_object_dispose__60;
  v26 = 0;
  v10 = *MEMORY[0x1E0D29968];
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v18[1] = 3221225472;
  v18[2] = __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2;
  v18[3] = &unk_1E6CF2C68;
  v18[4] = *(_QWORD *)(a1 + 64);
  v18[5] = &v21;
  v19 = *(_OWORD *)(a1 + 72);
  v13 = *(void **)(a1 + 96);
  v20 = *(_QWORD *)(a1 + 88);
  v18[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v13, "deleteSamplesWithPredicate:limit:generateDeletedObjects:transaction:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v9, v10, 1, v5, v11, v12, v18);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v14 = 1;
  }
  else
  {
    v15 = (id)v22[5];
    v16 = v15;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v14 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2(_QWORD *a1, char a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v23 = a7;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if ((a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a7);
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v12;
  v17 = v12;

  v18 = *(_QWORD *)(a1[7] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v13;
  v20 = v13;

  v21 = *(_QWORD *)(a1[8] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v14;

}

uint64_t __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_65);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HDSampleTypesDeletionEntry initWithSourceIDs:types:]([_HDSampleTypesDeletionEntry alloc], v5, *(void **)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 48), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "addJournalEntry:error:", v6, a3);

  return v8;
}

uint64_t __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

+ (void)deleteSamplesWithPredicate:(id)a3 limit:(unint64_t)a4 generateDeletedObjects:(BOOL)a5 transaction:(id)a6 profile:(id)a7 recursiveDeleteAuthorizationBlock:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HDDataEntityDeletionContext *v21;

  v12 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a3;
  v21 = -[HDDataEntityDeletionContext initWithProfile:transaction:]([HDDataEntityDeletionContext alloc], "initWithProfile:transaction:", v18, v19);

  -[HDDataEntityDeletionContext setInsertDeletedObjects:](v21, "setInsertDeletedObjects:", v12);
  -[HDDataEntityDeletionContext setRecursiveDeleteAuthorizationBlock:](v21, "setRecursiveDeleteAuthorizationBlock:", v17);

  objc_msgSend(a1, "deleteSamplesWithPredicate:limit:deletionContext:completionHandler:", v20, a4, v21, v16);
  -[HDDataEntityDeletionContext finish](v21, "finish");

}

+ (void)deleteSamplesWithPredicate:(id)a3 limit:(unint64_t)a4 deletionContext:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleEntity.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleEntity.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(v12, "transaction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v16, v11, a4, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = CFSTR("data_type");
  v38[1] = CFSTR("uuid");
  v38[2] = CFSTR("provenance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
  v37 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __85__HDSampleEntity_deleteSamplesWithPredicate_limit_deletionContext_completionHandler___block_invoke;
  v33[3] = &unk_1E6CF2D00;
  v21 = v12;
  v34 = v21;
  v22 = v19;
  v35 = v22;
  v23 = v20;
  v36 = v23;
  v24 = objc_msgSend(v17, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v18, &v37, v33);
  v25 = v37;
  objc_msgSend(v21, "finish");
  if (v14)
  {
    if (v24)
    {
      objc_msgSend(v21, "lastInsertedDeletedObjectPersistentID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v21, "deletedObjectCount");
      objc_msgSend(v21, "deletedObjectTypeSet");
      v32 = v17;
      v28 = v11;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *, uint64_t, void *, id, id))v14)[2](v14, 1, v26, v27, v29, v23, v25);

      v11 = v28;
      v17 = v32;

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))v14)[2](v14, 0, 0, 0, 0, 0, v25);
    }
  }

}

uint64_t __85__HDSampleEntity_deleteSamplesWithPredicate_limit_deletionContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)objc_msgSend(v9, "dataObjectClass"), "hd_dataEntityClass");
  if (v10)
  {
    v11 = v10;
    MEMORY[0x1BCCAB1E0](a4, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB1C8](a4, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 32), "deleteObjectWithPersistentID:objectUUID:entityClass:objectType:provenanceIdentifier:deletionDate:deletedSampleIntervals:error:", a2, v12, v11, v9, v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a5);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (BOOL)enumerateAssociatedObjectsForIdentifier:(int64_t)a3 inDatabase:(id)a4 error:(id *)a5 associatedObjectHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t aBlock;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a4;
  HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("data_id");
  v21[1] = CFSTR("data_type");
  v21[2] = CFSTR("uuid");
  v21[3] = CFSTR("provenance");
  v21[4] = CFSTR("data_provenances.source_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __99__HDSampleEntity_enumerateAssociatedObjectsForIdentifier_inDatabase_error_associatedObjectHandler___block_invoke;
  v19 = &unk_1E6CE91B8;
  v20 = v9;
  v13 = v9;
  v14 = _Block_copy(&aBlock);
  LOBYTE(a5) = +[HDSQLiteEntity enumerateQueryResultsFromColumns:properties:predicate:groupBy:orderingTerms:limit:database:error:enumerationHandler:](HDSampleEntity, "enumerateQueryResultsFromColumns:properties:predicate:groupBy:orderingTerms:limit:database:error:enumerationHandler:", v12, v12, v11, 0, 0, 0, v10, a5, v14, aBlock, v17, v18, v19);

  return (char)a5;
}

uint64_t __99__HDSampleEntity_enumerateAssociatedObjectsForIdentifier_inDatabase_error_associatedObjectHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  HDSQLiteColumnAsInt64();
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v5, "dataObjectClass"), "hd_dataEntityClass");
  MEMORY[0x1BCCAB1E0](a3, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a3, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a3, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v9;
}

+ (id)entityEnumeratorWithTypes:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "hk_map:", &__block_literal_global_247);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      v11 = -[HDDataEntityEnumerator _initWithObjectTypes:entityClass:profile:]([HDDataEntityEnumerator alloc], "_initWithObjectTypes:entityClass:profile:", v7, objc_msgSend(v10, "anyObject"), v8);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Attempt to query across object types (%@) with incompatible entity classes (%@)"), v7, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Unable to determine entity class for object types (%@)"), v7, v13);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

uint64_t __58__HDSampleEntity_entityEnumeratorWithTypes_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "dataObjectClass"), "hd_dataEntityClass");
}

+ (id)sourceIDsForSamplesWithType:(id)a3 profile:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  HDSampleEntityPredicateForDataType(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v11, v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v12;
  }
  objc_msgSend(a1, "sourceIDsForObjectsOfType:profile:predicate:error:", 1, v10, v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)sampleCountsByTypeForProfile:(id)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@, COUNT(%@) FROM %@ GROUP BY %@;"),
    CFSTR("data_type"),
    CFSTR("data_type"),
    v9,
    CFSTR("data_type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke;
  v18[3] = &unk_1E6CEA620;
  v19 = v10;
  v20 = v11;
  v21 = a1;
  v22 = a2;
  v13 = v11;
  v14 = v10;
  LODWORD(a4) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a4, v18);

  if ((_DWORD)a4)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke_3;
  v11[3] = &unk_1E6CF2D68;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  v12 = v7;
  v13 = v8;
  v9 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a3, &__block_literal_global_256, v11);

  return v9;
}

uint64_t __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = HDSQLiteColumnAsInt64();
  if (_HKValidDataTypeCode())
  {
    MEMORY[0x1BCCAB1C8](a2, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject integerValue](v5, "integerValue") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

    }
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      return 1;
    v9 = *(const char **)(a1 + 40);
    v5 = v7;
    NSStringFromSelector(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2048;
    v14 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@ unknown data type code %ld", (uint8_t *)&v11, 0x16u);

  }
  return 1;
}

+ (id)dateIntervalsForSampleTypes:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  SEL v35;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a4;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("SELECT (SELECT %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@ = ? AND %@ = ? ORDER BY %@ ASC LIMIT 1) AS min, (SELECT %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@ = ? AND %@ = ? ORDER BY %@ DESC LIMIT 1) AS max"), CFSTR("start_date"), v10, v11, CFSTR("data_id"), CFSTR("data_type"), CFSTR("type"), CFSTR("end_date"), CFSTR("end_date"), v12, v13, CFSTR("data_id"), CFSTR("data_type"), CFSTR("type"), CFSTR("end_date"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke;
  aBlock[3] = &unk_1E6CF2DB8;
  v33 = v14;
  v34 = v15;
  v35 = a2;
  v17 = v15;
  v18 = v14;
  v19 = _Block_copy(aBlock);
  objc_msgSend(v9, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_263;
  v28[3] = &unk_1E6CF2DE0;
  v30 = v19;
  v31 = a1;
  v29 = v7;
  v21 = v19;
  v22 = v7;
  LODWORD(v16) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v20, a5, v28);

  if ((_DWORD)v16)
    v23 = v17;
  else
    v23 = 0;
  v24 = v23;

  return v24;
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_2;
  v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[4] = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_3;
  v12[3] = &unk_1E6CF2D90;
  v14 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v15 = v9;
  v10 = objc_msgSend(a3, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a4, v16, v12);

  return v10;
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, 1);
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 4, 1);
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((MEMORY[0x1BCCAB204](a2, 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB198](a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB198](a2, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v6);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v4);
    }
    else
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB52B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      v10 = *(const char **)(a1 + 48);
      v7 = v8;
      NSStringFromSelector(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@ unknown data type code %ld", (uint8_t *)&v13, 0x16u);

    }
LABEL_6:

  }
  return 1;
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_263(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          if (!(*(unsigned int (**)(_QWORD, uint64_t, void *, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "code", (_QWORD)v15), v5, a3))
          {
            v11 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_12:

  }
  else
  {
    v12 = 0;
    do
    {
      v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (!(_DWORD)v11)
        break;
    }
    while (v12++ != 316);
  }

  return v11;
}

+ (id)populatedSampleTypes:(id)a3 inDateInterval:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  int v28;
  void *v29;
  id v30;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v33 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "code"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v14);
  }

  v18 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("SELECT COUNT(%@), %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@ = ? AND (%@ > ?) AND (%@ < ?) AND %@ IN (%@) GROUP BY %@"), CFSTR("start_date"), CFSTR("data_type"), v19, v20, CFSTR("data_id"), CFSTR("type"), CFSTR("start_date"), CFSTR("start_date"), CFSTR("data_type"), v21, CFSTR("data_type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "database");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke;
  v34[3] = &unk_1E6CE7C58;
  v35 = v22;
  v36 = v10;
  v37 = v23;
  v38 = a1;
  v25 = v23;
  v26 = v10;
  v27 = v22;
  v28 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v24, a6, v34);

  if (v28)
    v29 = v25;
  else
    v29 = 0;
  v30 = v29;

  return v30;
}

uint64_t __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_2;
  v12[3] = &unk_1E6CE9508;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_3;
  v10[3] = &unk_1E6CE8CF8;
  v11 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v5, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v7, a3, v12, v10);

  return v8;
}

void __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;
  double v6;
  id v7;

  sqlite3_bind_int64(a2, 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, 2, v5);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, 3, v6);

}

uint64_t __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = HDSQLiteColumnAsInt64();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  return 1;
}

+ (id)sampleTypesForSamplesMatchingPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = (objc_class *)MEMORY[0x1E0C99E20];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(a1, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__HDSampleEntity_sampleTypesForSamplesMatchingPredicate_profile_error___block_invoke;
  v19[3] = &unk_1E6CE9280;
  v21 = v11;
  v22 = a1;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a5, v19);

  if ((_DWORD)a5)
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

BOOL __71__HDSampleEntity_sampleTypesForSamplesMatchingPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "distinctProperty:predicate:database:error:", CFSTR("data_type"), *(_QWORD *)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithNumber:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }

  return v7 != 0;
}

+ (id)minimumSampleStartDateForProfile:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[HDSampleEntity dateIntervalsForSampleTypes:profile:error:](HDSampleEntity, "dateIntervalsForSampleTypes:profile:error:", 0, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        if (v13 == 2.22507386e-308)
        {

        }
        else
        {
          objc_msgSend(v11, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15;

          if (v16 >= 0.0)
          {
            objc_msgSend(v11, "startDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timeIntervalSinceReferenceDate");
            v19 = v18;

            if (v9 >= v19)
              v9 = v19;
          }
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
    if (v9 != 1.79769313e308)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_17:

  return v7;
}

+ (BOOL)validateEntitiesOfTypes:(id)a3 profile:(id)a4 error:(id *)a5 validationErrorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "entityEnumeratorWithType:profile:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v11, (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(a1, "_validateEntityWithEnumerator:error:validationErrorHandler:", v18, a5, v12);

        if (!v19)
        {
          v20 = 0;
          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_11:

  return v20;
}

+ (BOOL)_validateEntityWithEnumerator:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HDSampleEntity__validateEntityWithEnumerator_error_validationErrorHandler___block_invoke;
  v11[3] = &unk_1E6CED200;
  v12 = v8;
  v13 = a1;
  v9 = v8;
  LOBYTE(a4) = objc_msgSend(a3, "enumerateWithError:handler:", a4, v11);

  return (char)a4;
}

uint64_t __77__HDSampleEntity__validateEntityWithEnumerator_error_validationErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = HKDefaultObjectValidationConfiguration();
    objc_msgSend(v5, "_validateWithConfiguration:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v25[0] = *MEMORY[0x1E0CB4DE8];
      objc_msgSend(*(id *)(a1 + 40), "databaseTable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("No database table name found");
      if (v9)
        v11 = (const __CFString *)v9;
      v12 = *MEMORY[0x1E0CB3388];
      v26[0] = v11;
      v26[1] = v8;
      v13 = *MEMORY[0x1E0CB4DF0];
      v25[1] = v12;
      v25[2] = v13;
      objc_msgSend(v5, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("No UUID found");
      if (v15)
        v17 = (const __CFString *)v15;
      v26[2] = v17;
      v25[3] = *MEMORY[0x1E0CB4DE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v18;
      v25[4] = *MEMORY[0x1E0CB4DF8];
      objc_msgSend(v5, "_valueDescription");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = CFSTR("N/A");
      if (v19)
        v21 = (const __CFString *)v19;
      v26[4] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 120, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

  return 1;
}

+ (id)syntheticQuantityColumnName
{
  return 0;
}

+ (int64_t)preferredEntityType
{
  return 1;
}

uint64_t __50__HDSampleEntity_objectInsertionFilterForProfile___block_invoke_2()
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDSampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)columnNamesForTimeOffset
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3[0] = CFSTR("start_date");
  v3[1] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
