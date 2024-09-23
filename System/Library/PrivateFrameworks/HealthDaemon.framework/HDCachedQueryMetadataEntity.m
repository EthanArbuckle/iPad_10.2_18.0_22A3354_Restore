@implementation HDCachedQueryMetadataEntity

+ (id)databaseTable
{
  return CFSTR("cached_queries");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCachedQueryMetadataEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("query_identifier");
  v3[1] = CFSTR("source_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertCachedQueryMetadata:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCachedQueryMetadataEntity.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryMetadata != nil"));

    if (v11)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCachedQueryMetadataEntity.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_11;
LABEL_3:
  v12 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v9, "intervalComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;

  if (v14 || !v15)
  {
    objc_msgSend(v11, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDCachedQueryMetadataEntityAllProperties();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__HDCachedQueryMetadataEntity_insertCachedQueryMetadata_profile_error___block_invoke;
    v22[3] = &unk_1E6CE89A8;
    v23 = v9;
    v24 = v14;
    objc_msgSend(a1, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v17, v18, a5, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    v16 = 0;
    *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    _HKLogDroppedError();
    v16 = 0;
  }

  return v16;
}

void __71__HDCachedQueryMetadataEntity_insertCachedQueryMetadata_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "cachingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("query_identifier"), v4);

  MEMORY[0x1BCCAB114](a2, CFSTR("source_id"), objc_msgSend(*(id *)(a1 + 32), "sourceEntityPersistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("generation_number"), objc_msgSend(*(id *)(a1 + 32), "generationNumber"));
  MEMORY[0x1BCCAB114](a2, CFSTR("max_anchor"), objc_msgSend(*(id *)(a1 + 32), "maxAnchor"));
  objc_msgSend(*(id *)(a1 + 32), "queryStartIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("last_query_start_index"), v5);

  objc_msgSend(*(id *)(a1 + 32), "queryEndIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("last_query_end_index"), v6);

  objc_msgSend(*(id *)(a1 + 32), "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("build_version"), v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("last_updated_date"), v9);
  MEMORY[0x1BCCAB0E4](a2, CFSTR("creation_date"), v9);
  objc_msgSend(*(id *)(a1 + 32), "anchorDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("anchor_date"), v8);

  MEMORY[0x1BCCAB0D8](a2, CFSTR("interval_components"), *(_QWORD *)(a1 + 40));
}

+ (BOOL)updateCachedQueryMetadata:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[6];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCachedQueryMetadataEntity.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryMetadata != nil"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCachedQueryMetadataEntity.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v9, "cachingIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "sourceEntityPersistentID");
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("query_identifier"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithProperty:equalToValue:", CFSTR("source_id"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D29840];
  v31[0] = v14;
  v31[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateMatchingAllPredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = CFSTR("generation_number");
  v30[1] = CFSTR("max_anchor");
  v30[2] = CFSTR("last_query_start_index");
  v30[3] = CFSTR("last_query_end_index");
  v30[4] = CFSTR("last_updated_date");
  v30[5] = CFSTR("build_version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__HDCachedQueryMetadataEntity_updateCachedQueryMetadata_profile_error___block_invoke;
  v28[3] = &unk_1E6CE84C8;
  v29 = v9;
  v23 = v9;
  v24 = objc_msgSend(a1, "updateProperties:predicate:healthDatabase:error:bindingHandler:", v21, v20, v22, a5, v28);

  return v24;
}

void __71__HDCachedQueryMetadataEntity_updateCachedQueryMetadata_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MEMORY[0x1BCCAB114](a2, CFSTR("generation_number"), objc_msgSend(*(id *)(a1 + 32), "generationNumber"));
  MEMORY[0x1BCCAB114](a2, CFSTR("max_anchor"), objc_msgSend(*(id *)(a1 + 32), "maxAnchor"));
  objc_msgSend(*(id *)(a1 + 32), "queryStartIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("last_query_start_index"), v4);

  objc_msgSend(*(id *)(a1 + 32), "queryEndIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB12C](a2, CFSTR("last_query_end_index"), v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("last_updated_date"), v6);

  objc_msgSend(*(id *)(a1 + 32), "buildVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("build_version"), v7);

}

+ (id)cachedQueryMetadataForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource((uint64_t)v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__210;
  v24 = __Block_byref_object_dispose__210;
  v25 = 0;
  HDCachedQueryMetadataEntityAllProperties();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__HDCachedQueryMetadataEntity_cachedQueryMetadataForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v19[3] = &unk_1E6D11448;
  v19[4] = &v20;
  v19[5] = a1;
  LODWORD(a6) = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v14, v13, v15, a6, v19);

  if ((_DWORD)a6)
    v16 = (void *)v21[5];
  else
    v16 = 0;
  v17 = v16;
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __96__HDCachedQueryMetadataEntity_cachedQueryMetadataForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  HDCachedQueryMetadata *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  HDSQLiteColumnWithNameAsString();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HDSQLiteColumnWithNameAsInt64();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsData();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v1;
      v21 = 2048;
      v22 = v17;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive intervalComponents for cached query entry: <%@, %lld>", buf, 0x16u);
    }
  }
  v11 = -[HDCachedQueryMetadata initWithCachingIdentifier:sourceEntityPersistentID:maxAnchor:queryStartIndex:queryEndIndex:generationNumber:buildVersion:anchorDate:intervalComponents:]([HDCachedQueryMetadata alloc], "initWithCachingIdentifier:sourceEntityPersistentID:maxAnchor:queryStartIndex:queryEndIndex:generationNumber:buildVersion:anchorDate:intervalComponents:", v1, v17, v15, v2, v3, v4, v5, v6, v8);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  return 0;
}

+ (id)generationNumberForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v10 = a5;
  HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource((uint64_t)a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "propertyValueForAnyWithProperty:predicate:healthDatabase:error:", CFSTR("generation_number"), v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)creationDateForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__210;
  v27 = __Block_byref_object_dispose__210;
  v28 = 0;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__HDCachedQueryMetadataEntity_creationDateForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v18[3] = &unk_1E6D00EF8;
  v22 = a1;
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v20 = v15;
  v21 = &v23;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a6, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

uint64_t __89__HDCachedQueryMetadataEntity_creationDateForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "anyInDatabase:predicate:error:", v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dateForProperty:database:", CFSTR("creation_date"), v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  return 1;
}

+ (id)lastUpdatedDateForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__210;
  v27 = __Block_byref_object_dispose__210;
  v28 = 0;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__HDCachedQueryMetadataEntity_lastUpdatedDateForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v18[3] = &unk_1E6D00EF8;
  v22 = a1;
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v20 = v15;
  v21 = &v23;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a6, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

uint64_t __92__HDCachedQueryMetadataEntity_lastUpdatedDateForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "anyInDatabase:predicate:error:", v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dateForProperty:database:", CFSTR("last_updated_date"), v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  return 1;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  id v25;
  void *v26;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_dateBySubtractingDays:fromDate:", *MEMORY[0x1E0CB4BE8], v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForDate();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithProperty:value:comparisonType:", CFSTR("last_updated_date"), v14, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v9, "daemon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "behavior");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentOSBuild");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithProperty:notEqualToValue:", CFSTR("build_version"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D29840];
  v38[0] = v15;
  v38[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateMatchingAnyPredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  objc_msgSend(v9, "database");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__HDCachedQueryMetadataEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v29[3] = &unk_1E6CF6410;
  v32 = a1;
  v25 = v23;
  v33 = a5;
  v30 = v25;
  v31 = &v34;
  LODWORD(v22) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v24, a6, v29);

  if ((_DWORD)v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v35 + 6));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(&v34, 8);
  return v26;
}

uint64_t __68__HDCachedQueryMetadataEntity_pruneWithProfile_nowDate_limit_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v6, "setEntityClass:", objc_opt_class());
  objc_msgSend(v6, "setPredicate:", a1[4]);
  objc_msgSend(v6, "setLimitCount:", a1[7]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v5, v6);
  v8 = objc_msgSend(v7, "deleteAllEntitiesWithError:", a3);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "getChangesCount");

  return v8;
}

@end
