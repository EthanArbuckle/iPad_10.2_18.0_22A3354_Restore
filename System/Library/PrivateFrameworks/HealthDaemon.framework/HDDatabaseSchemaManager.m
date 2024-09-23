@implementation HDDatabaseSchemaManager

- (HDDatabaseSchemaManager)initWithTransaction:(id)a3
{
  id v5;
  HDDatabaseSchemaManager *v6;
  HDDatabaseSchemaManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDatabaseSchemaManager;
  v6 = -[HDDatabaseSchemaManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transaction, a3);

  return v7;
}

- (int64_t)currentVersionForSchema:(id)a3 protectionClass:(int64_t)a4 error:(id *)a5
{
  id v8;
  HDDatabaseMigrationTransaction *transaction;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a3;
  transaction = self->_transaction;
  if (a4 == 2)
    -[HDDatabaseMigrationTransaction protectedDatabase](transaction, "protectedDatabase");
  else
    -[HDDatabaseMigrationTransaction unprotectedDatabase](transaction, "unprotectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (-[HDDatabaseSchemaManager _createSchemaMigrationTableIfNeededForDatabaseName:error:]((uint64_t)self, (uint64_t)a5))
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      -[HDDatabaseSchemaManager _schemaTableNameForDatabaseName:]((__CFString *)self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT version FROM %@ WHERE schema LIKE ?"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __73__HDDatabaseSchemaManager_currentVersionForSchema_protectionClass_error___block_invoke;
      v18[3] = &unk_1E6CE9508;
      v19 = v8;
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __73__HDDatabaseSchemaManager_currentVersionForSchema_protectionClass_error___block_invoke_2;
      v17[3] = &unk_1E6CE8540;
      v17[4] = &v20;
      if (objc_msgSend(v11, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v13, a5, v18, v17))v15 = v21[3];
      else
        v15 = -1;

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      v15 = -1;
    }
  }
  else
  {
    v15 = objc_msgSend(v10, "userVersionWithDatabaseName:error:", 0, a5);
  }

  return v15;
}

- (uint64_t)_createSchemaMigrationTableIfNeededForDatabaseName:(uint64_t)a1 error:(uint64_t)a2
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  if (!a1)
    return 0;
  v4 = CFSTR("main");
  if ((objc_msgSend(*(id *)(a1 + 8), "containsObject:", CFSTR("main")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[HDDatabaseSchemaManager _schemaTableNameForDatabaseName:]((__CFString *)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (schema TEXT NOT NULL PRIMARY KEY, version INTEGER NOT NULL, modification_date DOUBLE NOT NULL)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 16), "isProtectedMigration");
    v9 = *(void **)(a1 + 16);
    if ((v8 & 1) != 0)
      objc_msgSend(v9, "protectedDatabase");
    else
      objc_msgSend(v9, "unprotectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v7, a2, 0, 0);
    if ((_DWORD)v5)
    {
      v11 = *(void **)(a1 + 8);
      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v13 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v12;

        v11 = *(void **)(a1 + 8);
      }
      objc_msgSend(v11, "addObject:", CFSTR("main"));
    }

  }
  return v5;
}

- (__CFString)_schemaTableNameForDatabaseName:(__CFString *)a1
{
  __CFString *v1;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(0, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.schema_user_versions"), 0);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = CFSTR("schema_user_versions");
    }
  }
  return v1;
}

uint64_t __73__HDDatabaseSchemaManager_currentVersionForSchema_protectionClass_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __73__HDDatabaseSchemaManager_currentVersionForSchema_protectionClass_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (BOOL)setVersion:(int64_t)a3 schema:(id)a4 protectionClass:(int64_t)a5 error:(id *)a6
{
  id v10;
  HDDatabaseMigrationTransaction *transaction;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[4];
  id v19;
  int64_t v20;

  v10 = a4;
  transaction = self->_transaction;
  if (a5 == 2)
    -[HDDatabaseMigrationTransaction protectedDatabase](transaction, "protectedDatabase");
  else
    -[HDDatabaseMigrationTransaction unprotectedDatabase](transaction, "unprotectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (-[HDDatabaseSchemaManager _createSchemaMigrationTableIfNeededForDatabaseName:error:]((uint64_t)self, (uint64_t)a6))
    {
      -[HDDatabaseSchemaManager _schemaTableNameForDatabaseName:]((__CFString *)self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (schema, version, modification_date) VALUES (?, ?, ?)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __67__HDDatabaseSchemaManager_setVersion_schema_protectionClass_error___block_invoke;
      v18[3] = &unk_1E6CE82D8;
      v19 = v10;
      v20 = a3;
      v16 = objc_msgSend(v13, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v15, a6, v18, 0);

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend(v12, "setUserVersion:withDatabaseName:error:", a3, 0, a6);
  }

  return v16;
}

uint64_t __67__HDDatabaseSchemaManager_setVersion_schema_protectionClass_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;

  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  Current = CFAbsoluteTimeGetCurrent();
  return sqlite3_bind_double(a2, 3, Current);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_createdDatabaseNames, 0);
}

@end
