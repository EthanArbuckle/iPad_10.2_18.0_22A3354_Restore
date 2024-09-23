@implementation HDSQLiteEntity

- (HDSQLiteEntity)initWithPersistentID:(int64_t)a3
{
  HDSQLiteEntity *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDSQLiteEntity;
  result = -[HDSQLiteEntity init](&v5, sel_init);
  if (result)
    result->_persistentID = a3;
  return result;
}

+ (id)entityWithPersistentID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentID:", objc_msgSend(v4, "longLongValue"));
  else
    v5 = 0;

  return v5;
}

+ (BOOL)hasROWID
{
  return 1;
}

+ (id)primaryKeyColumns
{
  return 0;
}

+ (id)additionalPredicateForEnumeration
{
  return 0;
}

- (id)_updateSQLForProperties:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "entityForProperty:", v6);

    objc_msgSend(v4, "hk_map:", &__block_literal_global_296);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "disambiguatedDatabaseTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ WHERE %@ = ?"), v10, v11, CFSTR("ROWID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __42__HDSQLiteEntity__updateSQLForProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ = ?"), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 properties:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;

  v10 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(a1, "insertSQLForProperties:shouldReplace:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __81__HDSQLiteEntity_insertOrReplaceEntity_database_properties_error_bindingHandler___block_invoke;
  v25 = &unk_24CB18CA8;
  v16 = v13;
  v26 = v16;
  v17 = v14;
  v27 = v17;
  if (objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a6, &v22, 0))
  {
    v18 = objc_alloc((Class)a1);
    objc_msgSend(v12, "lastInsertRowID", v22, v23, v24, v25, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithPersistentID:", objc_msgSend(v19, "longLongValue"));

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __81__HDSQLiteEntity_insertOrReplaceEntity_database_properties_error_bindingHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE v4[8];
  uint64_t v5;
  uint64_t v6;

  HDSQLiteStatementBinder::HDSQLiteStatementBinder((uint64_t)v4, a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  HDSQLiteStatementBinder::assertAllPropertiesBound((HDSQLiteStatementBinder *)v4);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v6);
  return std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v5);
}

+ (int64_t)sizeOfEntityTableInDatabase:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT SUM(\"pgsize\") FROM \"dbstat\" WHERE name=\"%@\"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[4] = &v12;
  v11 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__HDSQLiteEntity_sizeOfEntityTableInDatabase___block_invoke;
  v10[3] = &unk_24CB18CD0;
  objc_msgSend(v3, "executeSQL:error:bindingHandler:enumerationHandler:", v6, &v11, 0, v10);
  v7 = v11;
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __46__HDSQLiteEntity_sizeOfEntityTableInDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64(a2) / 1024;
  return 1;
}

- (BOOL)updateProperties:(id)a3 database:(id)a4 error:(id *)a5 bindingHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  HDSQLiteEntity *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HDSQLiteEntity _updateSQLForProperties:]((uint64_t)self, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__HDSQLiteEntity_updateProperties_database_error_bindingHandler___block_invoke;
  v17[3] = &unk_24CB18CF8;
  v14 = v10;
  v18 = v14;
  v15 = v12;
  v19 = self;
  v20 = v15;
  LOBYTE(a5) = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v13, a5, v17, 0);

  return (char)a5;
}

uint64_t __65__HDSQLiteEntity_updateProperties_database_error_bindingHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  _BYTE v5[8];
  uint64_t v6;
  uint64_t v7;

  HDSQLiteStatementBinder::HDSQLiteStatementBinder((uint64_t)v5, (uint64_t)a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  HDSQLiteStatementBinder::assertAllPropertiesBound((HDSQLiteStatementBinder *)v5);
  sqlite3_bind_int64(a2, objc_msgSend(*(id *)(a1 + 32), "count") + 1, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v7);
  return std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v6);
}

+ (BOOL)updateProperties:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6 bindingHandler:(id)a7
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

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(a1, "updateSQLForProperties:predicate:", v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__HDSQLiteEntity_updateProperties_predicate_database_error_bindingHandler___block_invoke;
  v21[3] = &unk_24CB18CF8;
  v17 = v12;
  v22 = v17;
  v18 = v15;
  v24 = v18;
  v19 = v13;
  v23 = v19;
  LOBYTE(a6) = objc_msgSend(v14, "executeSQL:error:bindingHandler:enumerationHandler:", v16, a6, v21, 0);

  return (char)a6;
}

uint64_t __75__HDSQLiteEntity_updateProperties_predicate_database_error_bindingHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v5;
  _BYTE v6[8];
  uint64_t v7;
  uint64_t v8;

  HDSQLiteStatementBinder::HDSQLiteStatementBinder((uint64_t)v6, a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  HDSQLiteStatementBinder::assertAllPropertiesBound((HDSQLiteStatementBinder *)v6);
  v5 = objc_msgSend(*(id *)(a1 + 32), "count") + 1;
  objc_msgSend(*(id *)(a1 + 40), "bindToStatement:bindingIndex:", a2, &v5);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v8);
  return std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v7);
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__HDSQLiteEntity_deleteFromDatabase_error___block_invoke;
  v5[3] = &unk_24CB18D20;
  v5[4] = self;
  return objc_msgSend(a3, "performTransactionWithType:error:usingBlock:", 1, a4, v5);
}

uint64_t __43__HDSQLiteEntity_deleteFromDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSQLiteEntity _deleteRowFromTable:usingColumn:database:error:](v6, v7, CFSTR("ROWID"), v5, a3);

  return v8;
}

- (uint64_t)_deleteRowFromTable:(void *)a3 usingColumn:(void *)a4 database:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = (void *)+[HDSQLiteSchemaEntity _copyDeleteSQLWithTableName:columnName:]((uint64_t)HDSQLiteEntity, v9, v10);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__HDSQLiteEntity__deleteRowFromTable_usingColumn_database_error___block_invoke;
    v15[3] = &unk_24CB189D8;
    v15[4] = a1;
    v13 = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a5, v15, 0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)existsInDatabase:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;"), v6, CFSTR("ROWID"));

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__HDSQLiteEntity_existsInDatabase___block_invoke;
  v10[3] = &unk_24CB189D8;
  v10[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__HDSQLiteEntity_existsInDatabase___block_invoke_2;
  v9[3] = &unk_24CB18CD0;
  v9[4] = &v11;
  objc_msgSend(v4, "executeSQL:error:bindingHandler:enumerationHandler:", v7, 0, v10, v9);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __35__HDSQLiteEntity_existsInDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __35__HDSQLiteEntity_existsInDatabase___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (BOOL)getValuesForProperties:(id)a3 database:(id)a4 handler:(id)a5
{
  return -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", a3, a4, 0, a5);
}

- (BOOL)getValuesForProperties:(id)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  HDSQLiteEntity *v31;
  id *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v34 = a4;
  v33 = a6;
  v11 = (void *)objc_opt_class();
  objc_msgSend((id)objc_msgSend(v11, "entityClassForEnumeration", v10), "disambiguatedDatabaseTable");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("SELECT "));
  v31 = self;
  v32 = a5;
  v36 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v46;
    v16 = 1;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v11, "disambiguatedSQLForProperty:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 & 1) == 0)
          objc_msgSend(v12, "appendString:", CFSTR(", "));
        objc_msgSend(v12, "appendString:", v19);
        objc_msgSend(v11, "joinClausesForProperty:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
          objc_msgSend(v36, "unionSet:", v20);

        v16 = 0;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      v16 = 0;
    }
    while (v14);
  }

  objc_msgSend(v12, "appendString:", CFSTR(" FROM "));
  objc_msgSend(v12, "appendString:", v35);
  v44 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v21 = v36;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v12, "appendString:", CFSTR(" "));
        objc_msgSend(v25, "SQLJoinClause");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v26);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v22);
  }

  objc_msgSend(v12, "appendString:", CFSTR(" WHERE "));
  objc_msgSend(v12, "appendString:", v35);
  objc_msgSend(v12, "appendString:", CFSTR(".ROWID = ?;"));
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke;
  v40[3] = &unk_24CB189D8;
  v40[4] = v31;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke_2;
  v37[3] = &unk_24CB18D48;
  v27 = v13;
  v38 = v27;
  v28 = v33;
  v39 = v28;
  v29 = objc_msgSend(v34, "executeSQL:error:bindingHandler:enumerationHandler:", v12, v32, v40, v37);

  return v29;
}

uint64_t __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  HDSQLiteRow::setColumnNames(a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return 0;
}

- (id)valueForProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__HDSQLiteEntity_valueForProperty_database___block_invoke;
  v11[3] = &unk_24CB18D70;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __44__HDSQLiteEntity_valueForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  HDSQLiteRow::columnAsNaturalType(this, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)BOOLeanForProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__HDSQLiteEntity_BOOLeanForProperty_database___block_invoke;
  v10[3] = &unk_24CB18D70;
  v10[4] = &v11;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v10);

  LOBYTE(self) = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return (char)self;
}

BOOL __46__HDSQLiteEntity_BOOLeanForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  _BOOL8 result;

  result = HDSQLiteRow::columnAsBoolean(this, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)dateForProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__HDSQLiteEntity_dateForProperty_database___block_invoke;
  v11[3] = &unk_24CB18D70;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __43__HDSQLiteEntity_dateForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  HDSQLiteRow::columnAsDate(this, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)numberForProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__HDSQLiteEntity_numberForProperty_database___block_invoke;
  v11[3] = &unk_24CB18D70;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __45__HDSQLiteEntity_numberForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  HDSQLiteRow::columnAsNumber(this, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)stringForProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__HDSQLiteEntity_stringForProperty_database___block_invoke;
  v11[3] = &unk_24CB18D70;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __45__HDSQLiteEntity_stringForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  HDSQLiteRow::columnAsString(this, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)UUIDForProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__HDSQLiteEntity_UUIDForProperty_database___block_invoke;
  v11[3] = &unk_24CB18D70;
  v11[4] = &v12;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __43__HDSQLiteEntity_UUIDForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  HDSQLiteRow::columnAsUUID(this, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __65__HDSQLiteEntity__deleteRowFromTable_usingColumn_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)isEqual:(id)a3
{
  HDSQLiteEntity *v4;
  BOOL v5;

  v4 = (HDSQLiteEntity *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_persistentID == self->_persistentID;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_persistentID;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteEntity;
  -[HDSQLiteEntity description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, id:%lld>"), v4, -[HDSQLiteEntity persistentID](self, "persistentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  objc_msgSend(a1, "queryWithDatabase:predicate:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__HDSQLiteEntity_SQLiteQueryAdditions__anyInDatabase_predicate_error___block_invoke;
  v10[3] = &unk_24CB18FB0;
  v10[4] = &v11;
  v10[5] = a1;
  objc_msgSend(v7, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a5, v10);
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __70__HDSQLiteEntity_SQLiteQueryAdditions__anyInDatabase_predicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithPersistentID:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

+ (id)firstInDatabase:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 error:(id *)a6
{
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", a3, a4, 1, a5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__HDSQLiteEntity_SQLiteQueryAdditions__firstInDatabase_predicate_orderingTerms_error___block_invoke;
  v11[3] = &unk_24CB18FB0;
  v11[4] = &v12;
  v11[5] = a1;
  objc_msgSend(v8, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a6, v11);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __86__HDSQLiteEntity_SQLiteQueryAdditions__firstInDatabase_predicate_orderingTerms_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithPersistentID:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

+ (BOOL)enumerateEntitiesInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a6;
  objc_msgSend(a1, "queryWithDatabase:predicate:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __103__HDSQLiteEntity_SQLiteQueryAdditions__enumerateEntitiesInDatabase_predicate_error_enumerationHandler___block_invoke;
  v14[3] = &unk_24CB18FD8;
  v16 = a1;
  v12 = v10;
  v15 = v12;
  LOBYTE(a5) = objc_msgSend(v11, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a5, v14);

  return (char)a5;
}

uint64_t __103__HDSQLiteEntity_SQLiteQueryAdditions__enumerateEntitiesInDatabase_predicate_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPersistentID:", a2);
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v4;
}

+ (BOOL)enumerateQueryResultsFromColumns:(id)a3 properties:(id)a4 predicate:(id)a5 groupBy:(id)a6 orderingTerms:(id)a7 limit:(int64_t)a8 database:(id)a9 error:(id *)a10 enumerationHandler:(id)a11
{
  id v16;
  id v17;
  void *v18;

  v16 = a3;
  v17 = a11;
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", a9, a5, a8, a7, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v18, "enumerateProperties:error:enumerationHandler:", v16, a10, v17);

  return (char)a7;
}

+ (BOOL)deleteEntitiesInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  void *v6;

  objc_msgSend(a1, "queryWithDatabase:predicate:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v6, "deleteAllEntitiesWithError:", a5);

  return (char)a5;
}

+ (id)propertyValueForAnyInDatabase:(id)a3 property:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", a3, a5, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__HDSQLiteEntity_SQLiteQueryAdditions__propertyValueForAnyInDatabase_property_predicate_error___block_invoke;
  v15[3] = &unk_24CB19000;
  v15[4] = &v16;
  objc_msgSend(v11, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v12, a6, v15);

  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __95__HDSQLiteEntity_SQLiteQueryAdditions__propertyValueForAnyInDatabase_property_predicate_error___block_invoke(uint64_t a1, int a2, int a3, HDSQLiteRow *this)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  HDSQLiteRow::columnAsNaturalType(this, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 0;
}

+ (id)aggregateValuesForProperty:(id)a3 functions:(id)a4 predicate:(id)a5 groupBy:(id)a6 database:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDSQLiteQueryDescriptor *v19;
  void *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = objc_alloc_init(HDSQLiteQueryDescriptor);
  -[HDSQLiteQueryDescriptor setEntityClass:](v19, "setEntityClass:", a1);
  -[HDSQLiteQueryDescriptor setPredicate:](v19, "setPredicate:", v16);
  -[HDSQLiteQueryDescriptor setGroupBy:](v19, "setGroupBy:", v17);
  objc_msgSend(a1, "aggregateValuesForProperty:functions:queryDescriptor:database:error:", v14, v15, v19, v18, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)aggregateValuesForProperty:(id)a3 functions:(id)a4 queryDescriptor:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v36;
  void *v37;
  void *v38;
  id *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _QWORD v64[2];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v40 = a4;
  v13 = a5;
  v43 = a6;
  v44 = v12;
  v45 = v13;
  objc_msgSend(v13, "groupBy");
  v14 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v14;
  objc_msgSend(a1, "disambiguatedSQLForProperty:", v12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "disambiguatedSQLForProperty:", v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  v39 = a7;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v16 = v40;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v60 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%@)"), *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), v47);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v17);
  }

  if (v14)
  {
    objc_msgSend(v15, "addObject:", v41);
    v64[0] = v44;
    v64[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 2);
  }
  else
  {
    v65 = v44;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_SQLForSelectWithProperties:columns:", v37, v15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v38);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v16, "count");
  if (v14)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v22 = v16;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v56 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, v26);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v23);
    }

  }
  v28 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke;
  v53[3] = &unk_24CB189D8;
  v29 = v45;
  v54 = v29;
  v48[0] = v28;
  v48[1] = 3221225472;
  v48[2] = __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke_2;
  v48[3] = &unk_24CB19028;
  v30 = v46;
  v49 = v30;
  v52 = v36;
  v31 = v21;
  v50 = v31;
  v32 = v16;
  v51 = v32;
  if (objc_msgSend(v43, "executeSQL:error:bindingHandler:enumerationHandler:", v42, v39, v53, v48))
    v33 = v31;
  else
    v33 = 0;
  v34 = v33;

  return v34;
}

uint64_t __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;

  v3 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "bindToSelectStatement:bindingIndex:", a2, &v3);
}

uint64_t __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
  {
    HDSQLiteColumnAsNaturalType(a2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56))
    {
      v6 = 0;
      do
      {
        HDSQLiteColumnAsNaturalType(a2, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v5);

        }
        ++v6;
      }
      while (v6 < *(_QWORD *)(a1 + 56));
    }

  }
  else if (v4)
  {
    v11 = 0;
    do
    {
      HDSQLiteColumnAsNaturalType(a2, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

      }
      ++v11;
    }
    while (v11 < *(_QWORD *)(a1 + 56));
  }
  return 1;
}

+ (id)aggregateSingleValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aggregateValuesForProperty:functions:predicate:groupBy:database:error:", v12, v16, v14, 0, v15, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)aggregateSingleValueForProperty:(id)a3 function:(id)a4 queryDescriptor:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aggregateValuesForProperty:functions:queryDescriptor:database:error:", v12, v16, v14, v15, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "aggregateSingleValueForProperty:function:predicate:database:error:", a3, CFSTR("MAX"), a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sumValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "aggregateSingleValueForProperty:function:predicate:database:error:", a3, CFSTR("SUM"), a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)countValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "aggregateSingleValueForProperty:function:predicate:database:error:", a3, CFSTR("COUNT"), a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)maxPersistentIDWithPredicate:(id)a3 database:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "aggregateSingleValueForProperty:function:predicate:database:error:", CFSTR("ROWID"), CFSTR("MAX"), a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)countDistinctForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  HDSQLiteQueryDescriptor *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HDSQLiteQueryDescriptor *v21;
  id v22;
  _QWORD v24[5];
  _QWORD v25[4];
  HDSQLiteQueryDescriptor *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  void *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(HDSQLiteQueryDescriptor);
  -[HDSQLiteQueryDescriptor setEntityClass:](v13, "setEntityClass:", a1);
  -[HDSQLiteQueryDescriptor setPredicate:](v13, "setPredicate:", v11);
  v14 = objc_alloc(MEMORY[0x24BDD16A8]);
  objc_msgSend(a1, "disambiguatedSQLForProperty:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@(DISTINCT %@)"), CFSTR("COUNT"), v15);

  v34[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteQueryDescriptor _SQLForSelectWithProperties:columns:](v13, "_SQLForSelectWithProperties:columns:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v20 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke;
  v25[3] = &unk_24CB189D8;
  v21 = v13;
  v26 = v21;
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke_2;
  v24[3] = &unk_24CB18CD0;
  v24[4] = &v27;
  objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v19, a6, v25, v24);
  v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

void __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;

  v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindToStatement:bindingIndex:", a2, &v4);

}

uint64_t __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  HDSQLiteColumnAsNaturalType(a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

+ (id)distinctProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  HDSQLiteQueryDescriptor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HDSQLiteQueryDescriptor *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  HDSQLiteQueryDescriptor *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(HDSQLiteQueryDescriptor);
  -[HDSQLiteQueryDescriptor setEntityClass:](v13, "setEntityClass:", a1);
  -[HDSQLiteQueryDescriptor setPredicate:](v13, "setPredicate:", v11);
  -[HDSQLiteQueryDescriptor setReturnsDistinctEntities:](v13, "setReturnsDistinctEntities:", 1);
  objc_msgSend(a1, "disambiguatedSQLForProperty:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteQueryDescriptor _SQLForSelectWithProperties:columns:](v13, "_SQLForSelectWithProperties:columns:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke;
  v27[3] = &unk_24CB189D8;
  v20 = v13;
  v28 = v20;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke_2;
  v25[3] = &unk_24CB189B0;
  v26 = v18;
  v21 = v18;
  if (objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v17, a6, v27, v25))
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  return v23;
}

void __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;

  v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindToStatement:bindingIndex:", a2, &v4);

}

uint64_t __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  HDSQLiteColumnAsNaturalType(a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", a3, a4, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 orderingTerms:(id)a6 groupBy:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDSQLiteQueryDescriptor *v16;
  HDSQLiteQuery *v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(HDSQLiteQueryDescriptor);
  -[HDSQLiteQueryDescriptor setEntityClass:](v16, "setEntityClass:", a1);
  -[HDSQLiteQueryDescriptor setLimitCount:](v16, "setLimitCount:", a5);
  -[HDSQLiteQueryDescriptor setOrderingTerms:](v16, "setOrderingTerms:", v14);
  -[HDSQLiteQueryDescriptor setPredicate:](v16, "setPredicate:", v13);
  -[HDSQLiteQueryDescriptor setGroupBy:](v16, "setGroupBy:", v15);
  v17 = -[HDSQLiteQuery initWithDatabase:descriptor:]([HDSQLiteQuery alloc], "initWithDatabase:descriptor:", v12, v16);

  return v17;
}

@end
