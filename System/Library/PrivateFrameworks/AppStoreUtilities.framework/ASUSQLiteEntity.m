@implementation ASUSQLiteEntity

+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4
{
  return (id)objc_msgSend(a1, "memoryEntityForPersistentID:withProperties:usingConnection:", a3, 0, a4);
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)objc_msgSend(a1, "memoryEntityClass");
  v11 = v10;
  if (!v8)
  {
    -[objc_class defaultProperties](v10, "defaultProperties");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentID:onConnection:", a3, v9);

  v13 = (void *)objc_msgSend([v11 alloc], "initWithDatabaseEntity:properties:", v12, v8);
  return v13;
}

- (ASUSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7;
  ASUSQLiteEntity *v8;
  ASUSQLiteEntity *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASUSQLiteEntity;
  v8 = -[ASUSQLiteEntity init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (ASUSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFUUID *v11;
  id v12;
  id v13;
  id v14;
  ASUSQLiteEntity *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("ROWID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "longLongValue");
  }
  else
  {
    v11 = CFUUIDCreate(0);
    v10 = *(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }
  v12 = -[ASUSQLiteEntity _copyTableClusteredValuesWithValues:](self, v7);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke;
  v17[3] = &unk_2507A9228;
  v19 = v6;
  v20 = v10;
  v18 = v12;
  v13 = v6;
  v14 = v12;
  if ((objc_msgSend(v13, "performTransaction:error:", v17, 0) & 1) == 0)
  {

    self = 0;
  }
  v15 = -[ASUSQLiteEntity initWithPersistentID:onConnection:](self, "initWithPersistentID:onConnection:", v10, v13);

  return v15;
}

- (id)_copyTableClusteredValuesWithValues:(void *)a1
{
  id v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  void *v15;

  v2 = a1;
  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x24BDBCED8];
    v4 = a2;
    v5 = objc_alloc_init(v3);
    v6 = (void *)objc_opt_class();
    objc_msgSend(v6, "databaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__ASUSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke;
    v12[3] = &unk_2507A9428;
    v15 = v6;
    v13 = v7;
    v8 = v5;
    v14 = v8;
    v9 = v7;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);

    v10 = v14;
    v2 = v8;

  }
  return v2;
}

uint64_t __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2;
  v4[3] = &unk_2507A9200;
  v7 = *(_QWORD *)(a1 + 48);
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = &v8;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);
  v2 = *((unsigned __int8 *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v2;
}

uint64_t __55__ASUSQLiteEntity_initWithPropertyValues_onConnection___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = +[ASUSQLiteEntity _insertValues:intoTable:withPersistentID:onConnection:]((uint64_t)ASUSQLiteEntity, a3, a2, *(_QWORD *)(a1 + 48), *(void **)(a1 + 32));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

+ (uint64_t)_insertValues:(void *)a3 intoTable:(uint64_t)a4 withPersistentID:(void *)a5 onConnection:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v30;
  id v31;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_self();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("INSERT OR REPLACE INTO "));
  objc_msgSend(v11, "appendString:", v8);
  objc_msgSend(v11, "appendString:", CFSTR(" ("));
  objc_msgSend(v10, "foreignKeyColumnForTable:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("ROWID");
  objc_msgSend(v11, "appendString:", v14);
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v41 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "appendString:", CFSTR(", "));
        objc_msgSend(v11, "appendString:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v17);
  }

  objc_msgSend(v11, "appendString:", CFSTR(") VALUES (?"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = v15;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v38;
    while (1)
    {
      if (*(_QWORD *)v38 != v24)
        objc_enumerationMutation(v21);
      objc_msgSend(v11, "appendString:", CFSTR(", ?"));
      if (!--v23)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (!v23)
          break;
      }
    }
  }

  objc_msgSend(v11, "appendString:", CFSTR(");"));
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __73__ASUSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke;
  v33[3] = &unk_2507A9400;
  v35 = a4;
  v36 = 0;
  v25 = v21;
  v34 = v25;
  v26 = objc_msgSend(v9, "executeStatement:error:bindings:", v11, &v36, v33);
  v27 = v36;
  if (v27)
  {
    ASULogHandleForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v46 = v30;
      v47 = 2112;
      v48 = v27;
      v31 = v30;
      _os_log_error_impl(&dword_236337000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %@", buf, 0x16u);

    }
  }

  return v26;
}

+ (id)databaseTable
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("+[%@ databaseTable] not implemented"), a1);
  return 0;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "joinClauseForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "databaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v8, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  uint64_t v3;
  ASUSQLiteConnection *connection;
  _BOOL4 v5;
  int64_t v6;
  NSObject *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke;
  v10[3] = &unk_2507A9250;
  v10[4] = self;
  v5 = -[ASUSQLiteConnection performTransaction:error:](connection, "performTransaction:error:", v10, 0);
  if (v5)
  {
    v6 = -[ASUSQLiteEntity persistentID](self, "persistentID");
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke_2;
    v9[3] = &__block_descriptor_40_e5_v8__0l;
    v9[4] = v6;
    dispatch_async(v7, v9);

  }
  return v5;
}

uint64_t __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "databaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASUSQLiteEntity _deleteRowFromTable:usingColumn:](v2, v3, CFSTR("ROWID"));

  objc_msgSend((id)objc_opt_class(), "foreignDatabaseTablesToDelete");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend((id)objc_opt_class(), "foreignKeyColumnForTable:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if ((-[ASUSQLiteEntity _deleteRowFromTable:usingColumn:](*(_QWORD *)(a1 + 32), v10, v11) & 1) == 0)
          {

            v14 = 0;
            v13 = v5;
            goto LABEL_14;
          }
          v4 = 1;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  if ((v4 & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 8);
    *(_QWORD *)(v12 + 8) = 0;
    v14 = 1;
LABEL_14:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)_deleteRowFromTable:(void *)a3 usingColumn:
{
  uint64_t v3;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = a1;
  if (a1)
  {
    v5 = (objc_class *)MEMORY[0x24BDD17C8];
    v6 = a3;
    v7 = a2;
    v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?;"), v7, v6);

    v9 = *(void **)(v3 + 8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__ASUSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke;
    v11[3] = &unk_2507A9450;
    v11[4] = v3;
    v3 = objc_msgSend(v9, "executeStatement:error:bindings:", v8, 0, v11);

  }
  return v3;
}

void __37__ASUSQLiteEntity_deleteFromDatabase__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("ASUSQLiteUserInfoKeyPersistentID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ASUSQLiteDidDeleteEntityNotification"), 0, v4);

}

- (BOOL)existsInDatabase
{
  id v3;
  void *v4;
  void *v5;
  ASUSQLiteConnection *connection;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;"), v4, CFSTR("ROWID"));

  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__ASUSQLiteEntity_existsInDatabase__block_invoke;
  v8[3] = &unk_2507A9298;
  v8[4] = self;
  v8[5] = &v9;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v5, v8);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __35__ASUSQLiteEntity_existsInDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (id)getValuesForProperties:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  ASUSQLiteConnection *connection;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void *v35;
  _BYTE v36[128];
  const __CFString *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ROWID")),
        v5,
        v6))
  {
    v37 = CFSTR("ROWID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_persistentID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v9, "databaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("SELECT "));
    v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke;
    v32[3] = &unk_2507A92C0;
    v35 = v9;
    v12 = v10;
    v33 = v12;
    v13 = v11;
    v34 = v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(v12, "appendString:", CFSTR(" FROM "));
    objc_msgSend(v12, "appendString:", v7);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18);
          objc_msgSend(v12, "appendString:", CFSTR(" "));
          objc_msgSend(v12, "appendString:", v19);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v16);
    }

    objc_msgSend(v12, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v12, "appendString:", v7);
    objc_msgSend(v12, "appendString:", CFSTR(".ROWID = ?;"));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_2;
    v25[3] = &unk_2507A9338;
    v25[4] = self;
    v26 = v4;
    v22 = v20;
    v27 = v22;
    -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v12, v25);
    v23 = v27;
    v8 = v22;

  }
  return v8;
}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v5, "disambiguatedSQLForProperty:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(a1[4], "appendString:", CFSTR(", "));
  objc_msgSend(a1[4], "appendString:", v8);
  objc_msgSend(a1[6], "joinClauseForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(a1[5], "addObject:", v7);

}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", v3, 1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_3;
  v5[3] = &unk_2507A9310;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v5);

}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x23B7F02C4]();
  if (v8)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_4;
    v9[3] = &unk_2507A92E8;
    v7 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
  objc_autoreleasePoolPop(v6);

}

void __42__ASUSQLiteEntity_getValuesForProperties___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  ASUSQLiteCopyFoundationValue(v5, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDBCE70]);
  v9 = v8;
  if (v6)
  {
    v10 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v7, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v11, v7, 0);

  }
  v12 = -[ASUSQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASUSQLiteConnection *connection;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "databaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke;
  v11[3] = &unk_2507A93D8;
  v11[4] = self;
  v12 = v4;
  v13 = v6;
  v14 = v5;
  v8 = v6;
  v9 = v4;
  LOBYTE(v5) = -[ASUSQLiteConnection performTransaction:error:](connection, "performTransaction:error:", v11, 0);

  return (char)v5;
}

uint64_t __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v2 = -[ASUSQLiteEntity _copyTableClusteredValuesWithValues:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_2;
  v8[3] = &unk_2507A93B0;
  v3 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v11 = &v13;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 56), "foreignKeyColumnForTable:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = CFSTR("ROWID");
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v11 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  v12 = MEMORY[0x24BDAC760];
  if ((v11 & 1) == 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("SELECT 1 FROM "));
    objc_msgSend(v13, "appendString:", v7);
    objc_msgSend(v13, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v13, "appendString:", v10);
    objc_msgSend(v13, "appendString:", CFSTR(" =  ? LIMIT 1;"));
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(v14 + 8);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_3;
    v32[3] = &unk_2507A9298;
    v32[4] = v14;
    v32[5] = &v33;
    objc_msgSend(v15, "executeQuery:withResults:", v13, v32);

  }
  if (*((_BYTE *)v34 + 24))
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("UPDATE "));
    objc_msgSend(v17, "appendString:", v7);
    objc_msgSend(v17, "appendString:", CFSTR(" SET "));
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_4;
    v26[3] = &unk_2507A9360;
    v29 = v30;
    v18 = v17;
    v27 = v18;
    v19 = v16;
    v28 = v19;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v18, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v18, "appendString:", v7);
    objc_msgSend(v18, "appendString:", CFSTR("."));
    objc_msgSend(v18, "appendString:", v10);
    objc_msgSend(v18, "appendString:", CFSTR(" = ?;"));
    v20 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_5;
    v23[3] = &unk_2507A9388;
    v21 = v19;
    v22 = *(_QWORD *)(a1 + 40);
    v24 = v21;
    v25 = v22;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v20, "executeStatement:error:bindings:", v18, 0, v23);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[ASUSQLiteEntity _insertValues:intoTable:withPersistentID:onConnection:]((uint64_t)ASUSQLiteEntity, v8, v7, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(void **)(*(_QWORD *)(a1 + 40) + 8));
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
  _Block_object_dispose(&v33, 8);

}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" = ?"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __43__ASUSQLiteEntity_setValuesWithDictionary___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 1;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        ASUSQLiteBindFoundationValue(v3, v10 + v9, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = (v10 + v9);
    }
    while (v6);
    v11 = (v10 + v9);
  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(v3, "bindInt64:atPosition:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), v11, (_QWORD)v12);
}

- (id)valueForProperty:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASUSQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __73__ASUSQLiteEntity__insertValues_intoTable_withPersistentID_onConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "bindInt64:atPosition:", *(_QWORD *)(a1 + 40), 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 2;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ASUSQLiteBindFoundationValue(v3, v8 + v9, v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = (v8 + v9);
    }
    while (v6);
  }

}

void __55__ASUSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ROWID")) & 1) == 0)
  {
    objc_msgSend(a1[6], "foreignDatabaseTableForProperty:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (id)v6;
      objc_msgSend(a1[6], "foreignDatabaseColumnForProperty:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v10;
      v7 = a1[4];
    }
    objc_msgSend(a1[5], "objectForKey:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(a1[5], "setObject:forKey:", v9, v7);
    }
    objc_msgSend(v9, "setObject:forKey:", v5, v8);

  }
}

uint64_t __51__ASUSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindInt64:atPosition:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1);
}

- (ASUSQLiteConnection)connection
{
  return self->_connection;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)BOOLValueForProperty:(id)a3
{
  void *v3;
  char v4;

  -[ASUSQLiteEntity numberValueForProperty:](self, "numberValueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)dictValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)errorValueForProperty:(id)a3
{
  void *v3;
  void *v4;

  -[ASUSQLiteEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)integerValueForProperty:(id)a3
{
  void *v3;
  int64_t v4;

  -[ASUSQLiteEntity numberValueForProperty:](self, "numberValueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)numberValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)stringValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)uuidValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)urlValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
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

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  objc_msgSend(a1, "queryOnConnection:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ASUSQLiteEntity_ASUSQLiteQuery__anyOnConnection_predicate___block_invoke;
  v12[3] = &unk_2507A97D0;
  v14 = &v16;
  v15 = a1;
  v9 = v6;
  v13 = v9;
  objc_msgSend(v8, "enumeratePersistentIDsUsingBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __61__ASUSQLiteEntity_ASUSQLiteQuery__anyOnConnection_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPersistentID:onConnection:", a2, *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = 1;
}

+ (id)allOnConnection:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
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

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = (id)objc_opt_new();
  objc_msgSend(a1, "queryOnConnection:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ASUSQLiteEntity_ASUSQLiteQuery__allOnConnection_predicate___block_invoke;
  v12[3] = &unk_2507A97D0;
  v15 = a1;
  v9 = v6;
  v13 = v9;
  v14 = &v16;
  objc_msgSend(v8, "enumeratePersistentIDsUsingBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __61__ASUSQLiteEntity_ASUSQLiteQuery__allOnConnection_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPersistentID:onConnection:", a2, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, CFSTR("COUNT"), a4, a5);
}

+ (id)_aggregateValueForProperty:(void *)a3 function:(void *)a4 predicate:(void *)a5 onConnection:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  ASUSQLiteQueryDescriptor *v13;
  ASUSQLiteQueryDescriptor *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  ASUSQLiteQueryDescriptor *v21;
  id v22;
  _QWORD v24[4];
  ASUSQLiteQueryDescriptor *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_self();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v13 = [ASUSQLiteQueryDescriptor alloc];
  if (v13)
    v14 = -[ASUSQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:](v13, "initWithEntityClass:memoryEntityClass:", v12, 0);
  else
    v14 = 0;
  -[ASUSQLiteQueryDescriptor setPredicate:](v14, "setPredicate:", v10);
  v15 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v12, "disambiguatedSQLForProperty:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@(%@)"), v9, v16);

  v33[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ASUSQLiteQueryDescriptor _newSelectSQLWithProperties:columns:](v14, "_newSelectSQLWithProperties:columns:", v18, v19);

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke;
  v24[3] = &unk_2507A9298;
  v21 = v14;
  v25 = v21;
  v26 = &v27;
  objc_msgSend(v11, "executeQuery:withResults:", v20, v24);
  v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, CFSTR("MAX"), a4, a5);
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, CFSTR("MIN"), a4, a5);
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  void *v5;
  void *v6;
  id v7;

  +[ASUSQLiteEntity _aggregateValueForProperty:function:predicate:onConnection:]((uint64_t)a1, a3, CFSTR("SUM"), a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = &unk_2507ADAA0;
  v7 = v6;

  return v7;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:", a3, a4, 0);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:orderingDirections:", a3, a4, a5, 0);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:orderingDirections:entityClass:", a3, a4, a5, a6, a1);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:orderingDirections:entityClass:", a3, a4, 0, 0, a5);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:orderingDirections:entityClass:", a3, a4, a5, 0, a6);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  ASUSQLiteQueryDescriptor *v15;
  id v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[ASUSQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:]([ASUSQLiteQueryDescriptor alloc], "initWithEntityClass:memoryEntityClass:", a7, -[objc_class memoryEntityClass](a7, "memoryEntityClass"));
  -[ASUSQLiteQueryDescriptor setOrderingProperties:](v15, "setOrderingProperties:", v12);

  -[ASUSQLiteQueryDescriptor setOrderingDirections:](v15, "setOrderingDirections:", v11);
  -[ASUSQLiteQueryDescriptor setPredicate:](v15, "setPredicate:", v13);

  v16 = -[ASUSQLiteQuery initOnConnection:descriptor:]([ASUSQLiteQuery alloc], "initOnConnection:descriptor:", v14, v15);
  return v16;
}

void __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  int v7;

  v7 = 1;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyBinding:atIndex:", v4, &v7);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2;
  v6[3] = &unk_2507A9170;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v6);

}

void __94__ASUSQLiteEntity_ASUSQLiteQuery___aggregateValueForProperty_function_predicate_onConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  ASUSQLiteCopyFoundationValue(a2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = 1;
}

@end
