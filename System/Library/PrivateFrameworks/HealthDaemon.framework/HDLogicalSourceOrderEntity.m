@implementation HDLogicalSourceOrderEntity

+ (id)databaseTable
{
  return CFSTR("logical_source_order");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_97;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("logical_source");
  +[HDHealthEntity defaultForeignKey](HDLogicalSourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
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

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("data_type");
  v3[1] = CFSTR("logical_source");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sources.ROWID")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("sources.uuid")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("sources.provenance")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("sources.deleted")))
  {
    v5 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = *MEMORY[0x1E0D29618];
    objc_msgSend(v5, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v6, v7, 0, CFSTR("logical_source"), *MEMORY[0x1E0D29618]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D29870];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v11, objc_opt_class(), 0, v8, CFSTR("logical_source_id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v9, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___HDLogicalSourceOrderEntity;
    objc_msgSendSuper2(&v15, sel_joinClausesForProperty_, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (BOOL)updateOrderedLogicalSourcesForType:(id)a3 transaction:(id)a4 error:(id *)a5 updateHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD *);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[5];
  _QWORD v37[5];

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD *))a6;
  v13 = objc_msgSend(v10, "code");
  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke;
  v37[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v37[4] = a1;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2;
  v36[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v36[4] = v13;
  if (objc_msgSend(v14, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateOrderedLogicalSourcesForType_transaction_error_updateHandler__deleteKey, a5, v37, v36, 0))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__192;
    v30 = __Block_byref_object_dispose__192;
    v31 = 0;
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_226;
    v20[3] = &unk_1E6D0EB18;
    v22 = &v32;
    v21 = v14;
    v23 = &v26;
    v24 = a1;
    v25 = v13;
    v12[2](v12, v20);
    if (*((_BYTE *)v33 + 24))
    {
      v16 = 1;
    }
    else
    {
      v17 = (id)v27[5];
      v18 = v17;
      v16 = v17 == 0;
      if (v17)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v17);
        else
          _HKLogDroppedError();
      }

    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke(uint64_t a1)
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

uint64_t __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

void __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_226(_QWORD *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[9];
  char v14;
  _QWORD v15[5];
  id v16;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v7 = a1[7];
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = (void *)a1[4];
    v16 = *(id *)(v8 + 40);
    v15[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2_227;
    v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[4] = v7;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_3;
    v13[3] = &__block_descriptor_73_e23_v16__0__sqlite3_stmt__8l;
    v13[4] = a1[8];
    v13[5] = a2;
    v14 = a3;
    v13[6] = a4;
    *(double *)&v13[7] = a6;
    v13[8] = a5;
    v10 = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_DataTypeSourceOrderPropertyDeleted_block_invoke_insertKey, &v16, v15, v13, 0);
    objc_storeStrong((id *)(v8 + 40), v16);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v10;
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

    }
  }
}

id __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2_227(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?)"), v3, CFSTR("data_type"), CFSTR("logical_source"), CFSTR("user_preferred"), CFSTR("provenance"), CFSTR("modification_date"), CFSTR("sync_identity"), 0);

  return v4;
}

uint64_t __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(unsigned __int8 *)(a1 + 72));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 48));
  sqlite3_bind_double(a2, 5, *(double *)(a1 + 56));
  return sqlite3_bind_int64(a2, 6, *(_QWORD *)(a1 + 64));
}

+ (BOOL)saveOrderedLogicalSourceIDs:(id)a3 type:(id)a4 userOrdered:(BOOL)a5 syncIdentity:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  BOOL v25;

  v14 = a3;
  v15 = a4;
  objc_msgSend(a7, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke;
  v20[3] = &unk_1E6D0EB68;
  v21 = v15;
  v22 = v14;
  v25 = a5;
  v23 = a1;
  v24 = a6;
  v17 = v14;
  v18 = v15;
  LOBYTE(a8) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v16, a8, v20);

  return (char)a8;
}

uint64_t __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CFAbsoluteTime Current;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  char v15;

  v5 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke_2;
  v11[3] = &unk_1E6D0EB40;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v15 = *(_BYTE *)(a1 + 64);
  v13 = Current;
  v14 = *(_QWORD *)(a1 + 56);
  v9 = objc_msgSend(v8, "updateOrderedLogicalSourcesForType:transaction:error:updateHandler:", v7, v5, a3, v11);

  return v9;
}

void __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke_2(uint64_t a1, void *a2)
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
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, double))v3 + 2))(v3, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "longLongValue", (_QWORD)v9), *(unsigned __int8 *)(a1 + 56), 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 40));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (BOOL)enumerateOrderedLogicalSourceIDsForType:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v10 = a6;
  v11 = a4;
  v12 = objc_msgSend(a3, "code");
  objc_msgSend(v11, "databaseForEntityClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[4] = v12;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17 = v10;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E6CE82B0;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateOrderedLogicalSourceIDsForType_transaction_error_block__lookupKey, a5, v19, v18, v16);

  return (char)a5;
}

id __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = ? ORDER BY %@ ASC"), CFSTR("logical_source"), CFSTR("user_preferred"), CFSTR("modification_date"), v1, CFSTR("data_type"), *MEMORY[0x1E0D29618], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB174](a2, 1);
  MEMORY[0x1BCCAB1A4](a2, 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sourceIDsWithDataType:(id)a3 transaction:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__HDLogicalSourceOrderEntity_sourceIDsWithDataType_transaction_error___block_invoke;
  v16[3] = &unk_1E6D0EB90;
  v17 = v11;
  v12 = v11;
  LODWORD(a5) = objc_msgSend(a1, "enumerateOrderedSourceIDsForType:transaction:error:block:", v10, v9, a5, v16);

  if ((_DWORD)a5)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

uint64_t __70__HDLogicalSourceOrderEntity_sourceIDsWithDataType_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

+ (id)sourceIDsWithDataType:(id)a3 unorderedIDs:(id)a4 transaction:(id)a5 error:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;

  v35 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v34 = a5;
  v9 = a3;
  objc_msgSend(v8, "hk_arrayWithCount:generator:", objc_msgSend(v35, "count"), &__block_literal_global_229);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v9, "code");
  v32 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D29618];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("SELECT %@.%@ FROM %@ JOIN %@ ON %@.%@ = %@.%@ JOIN %@ ON %@.%@ = %@.%@ WHERE %@.%@ = ? AND %@.%@ IN (%@) ORDER BY %@.%@ ASC, %@.%@ ASC"), v31, v11, v30, v29, v27, CFSTR("logical_source"), v26, v11, v28, v25, v11, v12, CFSTR("logical_source_id"), v13, CFSTR("data_type"), v14,
    v11,
    v37,
    v15,
    v11,
    v16,
    CFSTR("uuid"),
    0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v34, "databaseForEntityClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v18;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_2;
  v40[3] = &unk_1E6CE82D8;
  v41 = v35;
  v42 = v33;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_3;
  v38[3] = &unk_1E6CE8CF8;
  v20 = v18;
  v21 = v35;
  if (objc_msgSend(v19, "executeSQL:error:bindingHandler:enumerationHandler:", v17, a6, v40, v38))
    v22 = v20;
  else
    v22 = 0;
  v23 = v22;

  return v23;
}

const __CFString *__83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke()
{
  return CFSTR("?");
}

void __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = 2;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        sqlite3_bind_int64(a2, v8 + v9, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "longLongValue", (_QWORD)v10));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 += v9;
    }
    while (v6);
  }

}

uint64_t __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

+ (id)orderedLogicalSourceIDsForType:(id)a3 userOrdered:(BOOL *)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL *v24;

  v10 = a3;
  v11 = (objc_class *)MEMORY[0x1E0C99DE8];
  v12 = a5;
  v13 = objc_alloc_init(v11);
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke;
  v20[3] = &unk_1E6CEA620;
  v23 = a1;
  v24 = a4;
  v21 = v10;
  v22 = v13;
  v15 = v13;
  v16 = v10;
  LODWORD(a6) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v20);

  if ((_DWORD)a6)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

uint64_t __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke_2;
  v9[3] = &unk_1E6CFE8C0;
  v5 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v5, "enumerateOrderedLogicalSourceIDsForType:transaction:error:block:", v6, a2, a3, v9);

  return v7;
}

uint64_t __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
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

+ (id)propertyForSyncProvenance
{
  return CFSTR("provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v10 = a6;
  v11 = a4;
  v12 = objc_msgSend(a3, "code");
  objc_msgSend(v11, "databaseForEntityClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[4] = v12;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17 = v10;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E6CE82B0;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateOrderedSourceIDsForType_transaction_error_block__lookupKey, a5, v19, v18, v16);

  return (char)a5;
}

id __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  v1 = *MEMORY[0x1E0D29618];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT s.%@, o.%@, o.%@ FROM %@ o JOIN %@ l ON o.%@ = l.%@ JOIN %@ s ON l.%@ = s.%@ WHERE o.%@ = ? ORDER BY o.%@ ASC, s.%@ ASC"), v1, CFSTR("user_preferred"), CFSTR("modification_date"), v2, v3, CFSTR("logical_source"), v1, v4, v1, CFSTR("logical_source_id"), CFSTR("data_type"), v1, CFSTR("uuid"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB174](a2, 1);
  MEMORY[0x1BCCAB1A4](a2, 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)syncIdentityForType:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("data_type"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyValueForAnyInDatabase:property:predicate:error:", v16, CFSTR("sync_identity"), v15, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v11, "syncIdentityManager");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identityForEntityID:transaction:error:", (int)objc_msgSend(v17, "intValue"), v12, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("self"), objc_opt_class(), a2, CFSTR("No source order present for this data type"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }

  return v19;
}

@end
