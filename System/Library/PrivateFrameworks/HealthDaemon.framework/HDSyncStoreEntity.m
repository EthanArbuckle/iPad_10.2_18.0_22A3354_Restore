@implementation HDSyncStoreEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)syncStoreEntityWithUUID:(id)a3 type:(int64_t)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  id v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncStoreEntity.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID != nil"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__78;
  v27 = __Block_byref_object_dispose__78;
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke;
  v18[3] = &unk_1E6CF6410;
  v21 = a1;
  v13 = v11;
  v22 = a4;
  v19 = v13;
  v20 = &v23;
  if (objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v18))
    v14 = (void *)v24[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v23, 8);
  return v15;
}

BOOL __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncStoreEntity _predicateWithStoreUUID:type:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "anyInDatabase:predicate:error:", v5, v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v10)
  {
    v23[0] = CFSTR("uuid");
    v23[1] = CFSTR("type");
    v23[2] = CFSTR("creation_date");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke_2;
    v20[3] = &unk_1E6CECA50;
    v13 = *(id *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 56);
    v21 = v13;
    v22 = v14;
    objc_msgSend(v12, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v5, v11, a3, v20);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v18 = v10 != 0;

  return v18;
}

+ (id)_predicateWithStoreUUID:(uint64_t)a3 type:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  objc_opt_self();
  v5 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "predicateWithProperty:equalToValue:", CFSTR("uuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("type"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __71__HDSyncStoreEntity_syncStoreEntityWithUUID_type_healthDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB114](a2, CFSTR("type"), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("creation_date"), v4);

}

+ (id)existingSyncStoreEntityWithUUID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncStoreEntity.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID != nil"));

  }
  v11 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v9, "hk_dataForUUIDBytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("uuid"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v10, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)allSyncStoreEntitiesOfType:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("type"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__HDSyncStoreEntity_allSyncStoreEntitiesOfType_transaction_error___block_invoke;
  v19[3] = &unk_1E6CF6438;
  v20 = v10;
  v15 = v10;
  LODWORD(a5) = objc_msgSend(a1, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v11, v14, a5, v19);

  if ((_DWORD)a5)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

uint64_t __66__HDSyncStoreEntity_allSyncStoreEntitiesOfType_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)recreateSyncStoreWithUUID:(id)a3 type:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v11 = a3;
  v12 = a5;
  objc_opt_self();
  if ((unint64_t)(a4 - 6) >= 0xFFFFFFFFFFFFFFFCLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSyncStoreEntity.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _canRecreateSyncStoreWithType:type]"));

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__78;
  v31 = __Block_byref_object_dispose__78;
  v32 = 0;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__HDSyncStoreEntity_recreateSyncStoreWithUUID_type_profile_error___block_invoke;
  v21[3] = &unk_1E6CF6460;
  v25 = a1;
  v14 = v11;
  v26 = a4;
  v22 = v14;
  v24 = &v27;
  v15 = v12;
  v23 = v15;
  v16 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v13, a6, v21);

  if (v16)
    v17 = (void *)v28[5];
  else
    v17 = 0;
  v18 = v17;

  _Block_object_dispose(&v27, 8);
  return v18;
}

BOOL __66__HDSyncStoreEntity_recreateSyncStoreWithUUID_type_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncStoreEntity _predicateWithStoreUUID:type:](*(_QWORD *)(a1 + 56), *(void **)(a1 + 32), *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 56), "deleteEntitiesInDatabase:predicate:error:", v5, v6, a3))
  {
    v7 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncStoreEntityWithUUID:type:healthDatabase:error:", v9, v8, v10, a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)databaseTable
{
  return CFSTR("sync_stores");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_44;
}

@end
