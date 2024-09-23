@implementation HDDataTypeSourceOrderEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("provenance");
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("so_source.uuid")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("so_source.provenance")))
  {
    v5 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v6, objc_opt_class(), CFSTR("so_source"), CFSTR("source"), *MEMORY[0x1E0D29618]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDDataTypeSourceOrderEntity;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)orderedSourceIDsForType:(id)a3 userOrdered:(BOOL *)a4 profile:(id)a5 error:(id *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  BOOL *v20;

  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__HDDataTypeSourceOrderEntity_orderedSourceIDsForType_userOrdered_profile_error___block_invoke;
  v18[3] = &unk_1E6CFE8C0;
  v19 = v13;
  v20 = a4;
  v14 = v13;
  LODWORD(a6) = objc_msgSend(a1, "enumerateOrderedSourceIDsForType:profile:error:block:", v12, v11, a6, v18);

  if ((_DWORD)a6)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __81__HDDataTypeSourceOrderEntity_orderedSourceIDsForType_userOrdered_profile_error___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *v3;
  void *v4;
  void *v5;

  v3 = *(_BYTE **)(a1 + 40);
  if (v3)
    *v3 = a3;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return 1;
}

+ (id)databaseTable
{
  return CFSTR("datatype_source_order");
}

+ (id)tableAliases
{
  return &unk_1E6DF9CC8;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_65;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("source");
  +[HDHealthEntity defaultForeignKey](HDSourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v4 = *MEMORY[0x1E0D29618];
  v10[0] = CFSTR("data_type");
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("data_type"), v5);

  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)updateOrderedSourcesForType:(id)a3 profile:(id)a4 error:(id *)a5 updateHandler:(id)a6
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
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__HDDataTypeSourceOrderEntity_updateOrderedSourcesForType_profile_error_updateHandler___block_invoke;
  v18[3] = &unk_1E6CF6D50;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = a1;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v13, a5, v18);

  return (char)a5;
}

BOOL __87__HDDataTypeSourceOrderEntity_updateOrderedSourcesForType_profile_error_updateHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(id, _QWORD *);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  _QWORD v36[6];

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = a2;
  v10 = v6;
  v11 = objc_opt_self();
  v12 = objc_msgSend(v7, "code");
  objc_msgSend(v9, "databaseForEntityClass:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke;
  v36[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v36[4] = v11;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2;
  v35[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v35[4] = v12;
  if (objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_updateOrderedSourcesForType_profile_transaction_error_updateHandler__deleteKey, a3, v36, v35, 0))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 1;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__128;
    v29 = __Block_byref_object_dispose__128;
    v30 = 0;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_224;
    v19[3] = &unk_1E6CFE870;
    v21 = &v31;
    v20 = v13;
    v22 = &v25;
    v23 = v11;
    v24 = v12;
    v10[2](v10, v19);
    v15 = *((_BYTE *)v32 + 24) != 0;
    if (!*((_BYTE *)v32 + 24))
    {
      v16 = (id)v26[5];
      v17 = v16;
      if (v16)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v16);
        else
          _HKLogDroppedError();
      }

    }
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v3, CFSTR("data_type"), 0);

  return v4;
}

uint64_t __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

void __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_224(_QWORD *a1, uint64_t a2, char a3, uint64_t a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[8];
  char v13;
  _QWORD v14[5];
  id v15;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v6 = a1[7];
    v7 = *(_QWORD *)(a1[6] + 8);
    v15 = *(id *)(v7 + 40);
    v14[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2_225;
    v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v8 = (void *)a1[4];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[4] = v6;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_3;
    v12[3] = &__block_descriptor_65_e23_v16__0__sqlite3_stmt__8l;
    v12[4] = a1[8];
    v12[5] = a2;
    v13 = a3;
    v12[6] = a4;
    *(double *)&v12[7] = a5;
    v9 = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_DataTypeSourceOrderPropertySourceProvenance_block_invoke_insertKey, &v15, v14, v12, 0);
    objc_storeStrong((id *)(v7 + 40), v15);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      v10 = *(_QWORD *)(a1[6] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

    }
  }
}

id __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2_225(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)"), v3, CFSTR("data_type"), CFSTR("source"), CFSTR("user_preferred"), CFSTR("provenance"), CFSTR("modification_date"), 0);

  return v4;
}

uint64_t __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(unsigned __int8 *)(a1 + 64));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 48));
  return sqlite3_bind_double(a2, 5, *(double *)(a1 + 56));
}

+ (BOOL)saveOrderedSourceIDs:(id)a3 type:(id)a4 userOrdered:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  CFAbsoluteTime Current;
  id v16;
  _QWORD v18[4];
  id v19;
  CFAbsoluteTime v20;
  BOOL v21;

  v12 = a3;
  v13 = a6;
  v14 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__HDDataTypeSourceOrderEntity_saveOrderedSourceIDs_type_userOrdered_profile_error___block_invoke;
  v18[3] = &unk_1E6CFE898;
  v19 = v12;
  v21 = a5;
  v20 = Current;
  v16 = v12;
  LOBYTE(a7) = objc_msgSend(a1, "updateOrderedSourcesForType:profile:error:updateHandler:", v14, v13, a7, v18);

  return (char)a7;
}

void __83__HDDataTypeSourceOrderEntity_saveOrderedSourceIDs_type_userOrdered_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, double))v3 + 2))(v3, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "longLongValue", (_QWORD)v9), *(unsigned __int8 *)(a1 + 48), 0, *(double *)(a1 + 40));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6
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
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_error_block___block_invoke;
  v18[3] = &unk_1E6CF6D50;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = a1;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a5, v18);

  return (char)a5;
}

uint64_t __84__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 56), "enumerateOrderedSourceIDsForType:profile:transaction:error:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48));
}

+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 block:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v11 = a3;
  v12 = a7;
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = a5;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = ? ORDER BY %@ ASC"), CFSTR("source"), CFSTR("user_preferred"), CFSTR("modification_date"), v15, CFSTR("data_type"), *MEMORY[0x1E0D29618]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "databaseForEntityClass:", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v12;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke;
  v23[3] = &unk_1E6CE9508;
  v24 = v11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke_2;
  v21[3] = &unk_1E6CE82B0;
  v18 = v12;
  v19 = v11;
  LOBYTE(a6) = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", v16, a6, v23, v21);

  return (char)a6;
}

uint64_t __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "code"));
}

uint64_t __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB174](a2, 1);
  MEMORY[0x1BCCAB1A4](a2, 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
