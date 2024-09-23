@implementation HDMetadataKeyEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)_entityForKey:(id)a3 database:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("key"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_keyForPersistentID:(id)a3 database:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[HDSQLiteEntity entityWithPersistentID:](HDMetadataKeyEntity, "entityWithPersistentID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:database:", CFSTR("key"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)databaseTable
{
  return CFSTR("metadata_keys");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_31;
}

+ (id)entityForKey:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
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
  v20 = __Block_byref_object_copy__63;
  v21 = __Block_byref_object_dispose__63;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HDMetadataKeyEntity_entityForKey_healthDatabase_error___block_invoke;
  v13[3] = &unk_1E6CEC940;
  v15 = &v17;
  v16 = a1;
  v10 = v8;
  v14 = v10;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v9, a5, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __57__HDMetadataKeyEntity_entityForKey_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_entityForKey:database:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return 1;
}

+ (id)insertEntityWithKey:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
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
  v21 = __Block_byref_object_copy__63;
  v22 = __Block_byref_object_dispose__63;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__HDMetadataKeyEntity_insertEntityWithKey_healthDatabase_error___block_invoke;
  v14[3] = &unk_1E6CEC940;
  v16 = &v18;
  v17 = a1;
  v10 = v8;
  v15 = v10;
  if (objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v14))
    v11 = (void *)v19[5];
  else
    v11 = 0;
  v12 = v11;

  _Block_object_dispose(&v18, 8);
  return v12;
}

BOOL __64__HDMetadataKeyEntity_insertEntityWithKey_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_insertEntityWithKey:database:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  return v9;
}

+ (id)_insertEntityWithKey:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17[0] = CFSTR("key");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HDMetadataKeyEntity__insertEntityWithKey_database_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v12 = v8;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v10, v11, a5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __59__HDMetadataKeyEntity__insertEntityWithKey_database_error___block_invoke()
{
  JUMPOUT(0x1BCCAB144);
}

@end
