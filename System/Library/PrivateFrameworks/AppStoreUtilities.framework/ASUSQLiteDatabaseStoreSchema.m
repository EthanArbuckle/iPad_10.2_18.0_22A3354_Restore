@implementation ASUSQLiteDatabaseStoreSchema

- (ASUSQLiteDatabaseStoreSchema)initWithConnection:(id)a3 schemaName:(id)a4 tableNames:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASUSQLiteDatabaseStoreSchema *v12;
  ASUSQLiteDatabaseStoreSchema *v13;
  uint64_t v14;
  NSArray *tableNames;
  ASUSQLiteConnection *connection;
  _QWORD v18[4];
  ASUSQLiteDatabaseStoreSchema *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASUSQLiteDatabaseStoreSchema;
  v12 = -[ASUSQLiteDatabaseStoreSchema init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_schemaName, a4);
    v14 = objc_msgSend(v11, "copy");
    tableNames = v13->_tableNames;
    v13->_tableNames = (NSArray *)v14;

    connection = v13->_connection;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __73__ASUSQLiteDatabaseStoreSchema_initWithConnection_schemaName_tableNames___block_invoke;
    v18[3] = &unk_2507A9250;
    v19 = v13;
    -[ASUSQLiteConnection performTransaction:error:](connection, "performTransaction:error:", v18, 0);

  }
  return v13;
}

uint64_t __73__ASUSQLiteDatabaseStoreSchema_initWithConnection_schemaName_tableNames___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:error:", CFSTR("PRAGMA user_version = 1;"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:error:", CFSTR("CREATE TABLE IF NOT EXISTS schema_version (schema_name TEXT, schema_version INTEGER DEFAULT 0, PRIMARY KEY(schema_name));"),
    0);
  return 1;
}

- (int64_t)currentSchemaVersion
{
  ASUSQLiteConnection *connection;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__ASUSQLiteDatabaseStoreSchema_currentSchemaVersion__block_invoke;
  v5[3] = &unk_2507A9298;
  v5[4] = self;
  v5[5] = &v6;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT schema_version FROM schema_version WHERE schema_name = ?"), v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__ASUSQLiteDatabaseStoreSchema_currentSchemaVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  v5 = objc_msgSend(v4, "firstInt64Value");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASUSQLiteConnection *connection;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA table_info(%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke;
  v12[3] = &unk_2507A9090;
  v14 = &v15;
  v10 = v6;
  v13 = v10;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v8, v12);
  LOBYTE(connection) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)connection;
}

void __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke_2;
  v5[3] = &unk_2507A9068;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  objc_msgSend(a2, "enumerateRowsUsingBlock:", v5);

}

void __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  id v7;

  objc_msgSend(a2, "stringForColumnName:", CFSTR("name"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  *a4 = v6;

}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  ASUSQLiteConnection *connection;
  id v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke;
  v10[3] = &unk_2507A90E0;
  v10[4] = self;
  v11 = v6;
  v12 = a3;
  v8 = v6;
  LOBYTE(self) = -[ASUSQLiteConnection performSavepoint:](connection, "performSavepoint:", v10);

  return (char)self;
}

uint64_t __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke(_QWORD *a1)
{
  ASUSQLiteDatabaseStoreMigrator *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];

  v2 = -[ASUSQLiteDatabaseStoreMigrator initWithConnection:tableNames:]([ASUSQLiteDatabaseStoreMigrator alloc], "initWithConnection:tableNames:", *(_QWORD *)(a1[4] + 8), *(_QWORD *)(a1[4] + 24));
  (*(void (**)(void))(a1[5] + 16))();
  if (-[ASUSQLiteDatabaseStoreMigrator success](v2, "success"))
  {
    v3 = a1[4];
    v4 = *(void **)(v3 + 8);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke_2;
    v8[3] = &unk_2507A9400;
    v5 = a1[6];
    v8[4] = v3;
    v8[5] = v5;
    v6 = objc_msgSend(v4, "executeStatement:error:bindings:", CFSTR("INSERT OR REPLACE INTO schema_version (schema_name, schema_version) VALUES (?, ?)"), 0, v8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  objc_msgSend(v4, "bindInt64:atPosition:", *(_QWORD *)(a1 + 40), 2);

}

- (BOOL)migrateToVersion:(int64_t)a3 usingMapping:(id)a4
{
  return -[ASUSQLiteDatabaseStoreSchema _migrateToVersion:usingMapping:isReattempt:]((uint64_t)self, a3, a4, 0);
}

- (uint64_t)_migrateToVersion:(void *)a3 usingMapping:(int)a4 isReattempt:
{
  void (**v7)(id, uint64_t, uint64_t *, id *);
  uint64_t v8;
  uint64_t v9;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[5];
  void (**v20)(id, uint64_t, uint64_t *, id *);
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a1)
  {
    v8 = objc_msgSend((id)a1, "currentSchemaVersion");
    if (v8 < a2)
    {
      while (1)
      {
        v21 = 0;
        v22 = -1;
        v7[2](v7, v8, &v22, &v21);
        v9 = v22;
        if (v22 <= v8 || v22 > a2)
          break;
        if (!v21)
        {
          ASULogHandleForCategory(1);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)buf = 134218240;
          v24 = v8;
          v25 = 2048;
          v26 = v22;
          v15 = "No migration block provided to migrate schema version %lli -> %lli";
          goto LABEL_32;
        }
        v11 = objc_msgSend((id)a1, "migrateToVersion:usingBlock:", v22);
        ASULogHandleForCategory(1);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if ((v11 & 1) == 0)
        {
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)buf = 134218240;
          v24 = v8;
          v25 = 2048;
          v26 = v22;
          v15 = "Database migration function failed for %lli => %lli";
          goto LABEL_32;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v24 = v8;
          v25 = 2048;
          v26 = v22;
          _os_log_impl(&dword_236337000, v13, OS_LOG_TYPE_DEFAULT, "Database migration function succeeded for %lli => %lli", buf, 0x16u);
        }

        v8 = v22;
        if (v8 >= a2)
          goto LABEL_21;
      }
      ASULogHandleForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if (v9 != -1)
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        *(_DWORD *)buf = 134218240;
        v24 = v22;
        v25 = 2048;
        v26 = v8;
        v15 = "Invalid version %lli provided; currentVersion: %lli";
LABEL_32:
        _os_log_error_impl(&dword_236337000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
        goto LABEL_20;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v22;
        _os_log_impl(&dword_236337000, v13, OS_LOG_TYPE_DEFAULT, "Version mapping not provided for %lli", buf, 0xCu);
      }
LABEL_20:

    }
LABEL_21:
    if (v8 == a2)
    {
      a1 = 1;
    }
    else if (a4)
    {
      ASULogHandleForCategory(1);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236337000, v16, OS_LOG_TYPE_DEFAULT, "Not reattempting to reset schema", buf, 2u);
      }

      a1 = 0;
    }
    else
    {
      v17 = *(void **)(a1 + 8);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __75__ASUSQLiteDatabaseStoreSchema__migrateToVersion_usingMapping_isReattempt___block_invoke;
      v19[3] = &unk_2507A9898;
      v19[4] = a1;
      v20 = v7;
      a1 = objc_msgSend(v17, "performTransaction:error:", v19, 0);

    }
  }

  return a1;
}

uint64_t __75__ASUSQLiteDatabaseStoreSchema__migrateToVersion_usingMapping_isReattempt___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "migrateToVersion:usingBlock:", 0, &__block_literal_global_0) & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v15;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v15 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
          v13 = 0;
          objc_msgSend(CFSTR("DROP TABLE IF EXISTS "), "stringByAppendingString:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:error:", v8, &v13) & 1) == 0)
          {
            ASULogHandleForCategory(1);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v19 = v13;
              _os_log_error_impl(&dword_236337000, v12, OS_LOG_TYPE_ERROR, "Failed to drop table: %{public}@", buf, 0xCu);
            }

            return 0;
          }

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v4)
          continue;
        break;
      }
    }

    ASULogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236337000, v9, OS_LOG_TYPE_DEFAULT, "Successfully reset schema; requesting migration from version 0",
        buf,
        2u);
    }

    return -[ASUSQLiteDatabaseStoreSchema _migrateToVersion:usingMapping:isReattempt:](*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    ASULogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236337000, v11, OS_LOG_TYPE_ERROR, "Failed to set schema version back to 0; rolling back transaction",
        buf,
        2u);
    }

    return 0;
  }
}

- (BOOL)tableExists:(id)a3
{
  id v4;
  ASUSQLiteConnection *connection;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__ASUSQLiteDatabaseStoreSchema_tableExists___block_invoke;
  v8[3] = &unk_2507A9298;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT name FROM sqlite_master where name = ?"), v8);
  LOBYTE(connection) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connection;
}

void __44__ASUSQLiteDatabaseStoreSchema_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_schemaName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
