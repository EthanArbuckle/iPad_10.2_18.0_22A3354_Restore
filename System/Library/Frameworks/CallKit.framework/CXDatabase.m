@implementation CXDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlQueryToStatements, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Error closing database: %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)setBusyTimeout:(double)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t busy;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (int)(a3 * 1000.0);
  busy = sqlite3_busy_timeout(-[CXDatabase database](self, "database"), v6);
  v8 = busy;
  if (a4 && (_DWORD)busy)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlite3_busy_timeout for %@ with ms=%d returned %d"), self, v6, busy);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v8, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8 == 0;
}

- (CXDatabase)initWithURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  CXDatabase *v10;
  id v11;
  const char *v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *sqlQueryToStatements;
  uint64_t v21;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v6 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CXDatabase;
  v10 = -[CXDatabase init](&v23, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");

    if (v6)
      v13 = 131073;
    else
      v13 = 131074;
    v14 = sqlite3_open_v2(v12, &v10->_database, v13, 0);
    if ((_DWORD)v14)
    {
      if (a5)
      {
        v15 = v14;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlite3_open_v2 for filename %s readOnly %d returned %d"), v12, v6, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = v15;
        v24 = *MEMORY[0x1E0CB2D50];
        v25[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v18, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      sqlQueryToStatements = v10;
      v10 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v10->_url, a3);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = objc_claimAutoreleasedReturnValue();
      sqlQueryToStatements = v10->_sqlQueryToStatements;
      v10->_sqlQueryToStatements = (NSMutableDictionary *)v21;
    }

  }
  return v10;
}

- (BOOL)enableForeignKeysWithError:(id *)a3
{
  return -[CXDatabase executeSQL:error:](self, "executeSQL:error:", CFSTR("PRAGMA foreign_keys = ON"), a3);
}

- (BOOL)executeSQL:(id)a3 withBindings:(id)a4 transient:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__CXDatabase_executeSQL_withBindings_transient_error___block_invoke;
  v15[3] = &unk_1E4B893B8;
  v16 = v10;
  v11 = v10;
  v12 = a3;
  v13 = (void *)MEMORY[0x1A859A7A4](v15);
  LOBYTE(a6) = -[CXDatabase executeSQL:withStatementPreparationBlock:transient:error:](self, "executeSQL:withStatementPreparationBlock:transient:error:", v12, v13, v7, a6);

  return (char)a6;
}

- (BOOL)executeSQL:(id)a3 withStatementPreparationBlock:(id)a4 transient:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  unsigned int (**v10)(id, void *, id *);
  void *v11;
  char v12;

  v7 = a5;
  v10 = (unsigned int (**)(id, void *, id *))a4;
  -[CXDatabase _statementForSQL:transient:error:](self, "_statementForSQL:transient:error:", a3, v7, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && v10[2](v10, v11, a6))
    v12 = objc_msgSend(v11, "executeWithError:", a6);
  else
    v12 = 0;

  return v12;
}

uint64_t __54__CXDatabase_executeSQL_withBindings_transient_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "bind:error:", *(_QWORD *)(a1 + 32), a3);
}

- (BOOL)executeSQL:(id)a3 withBindings:(id)a4 error:(id *)a5
{
  return -[CXDatabase executeSQL:withBindings:transient:error:](self, "executeSQL:withBindings:transient:error:", a3, a4, 0, a5);
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return -[CXDatabase executeSQL:withBindings:error:](self, "executeSQL:withBindings:error:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (BOOL)closeWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!-[CXDatabase database](self, "database"))
    return 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CXDatabase sqlQueryToStatements](self, "sqlQueryToStatements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "finalize");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  -[CXDatabase sqlQueryToStatements](self, "sqlQueryToStatements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v12 = sqlite3_close(-[CXDatabase database](self, "database"));
  v13 = v12;
  if (a3 && (_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlite3_close for %@ returned %d"), self, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v13, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = v13 == 0;
  -[CXDatabase setDatabase:](self, "setDatabase:", 0);
  return v17;
}

- (sqlite3)database
{
  return self->_database;
}

- (id)_statementForSQL:(id)a3 transient:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  CXDatabaseStatement *v10;
  void *v11;

  v8 = a3;
  -[CXDatabase sqlQueryToStatements](self, "sqlQueryToStatements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (CXDatabaseStatement *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = -[CXDatabaseStatement initWithSQL:database:error:]([CXDatabaseStatement alloc], "initWithSQL:database:error:", v8, self, a5);
    if (!a4)
    {
      -[CXDatabase sqlQueryToStatements](self, "sqlQueryToStatements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

    }
  }

  return v10;
}

- (NSMutableDictionary)sqlQueryToStatements
{
  return self->_sqlQueryToStatements;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (BOOL)selectSQL:(id)a3 withBindings:(id)a4 expectedColumnCount:(int64_t)a5 transient:(BOOL)a6 resultRowHandler:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;

  v10 = a6;
  v14 = a4;
  v15 = a7;
  -[CXDatabase _statementForSQL:transient:error:](self, "_statementForSQL:transient:error:", a3, v10, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (objc_msgSend(v16, "bind:error:", v14, a8))
    {
      v18 = objc_msgSend(v17, "executeWithExpectedColumnCount:resultRowHandler:error:", a5, v15, a8);
      if (!v10)
        goto LABEL_8;
      goto LABEL_7;
    }
    v18 = 0;
    if (v10)
LABEL_7:
      objc_msgSend(v17, "finalize");
  }
  else
  {
    v18 = 0;
  }
LABEL_8:

  return v18;
}

- (CXDatabase)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXDatabase url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p URL=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)vacuumWithError:(id *)a3
{
  return -[CXDatabase executeSQL:error:](self, "executeSQL:error:", CFSTR("VACUUM"), a3);
}

- (int64_t)lastInsertedRowID
{
  return sqlite3_last_insert_rowid(-[CXDatabase database](self, "database"));
}

- (int)countOfRecordsModifiedByLastQuery
{
  return sqlite3_changes(-[CXDatabase database](self, "database"));
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return -[CXDatabase executeSQL:error:](self, "executeSQL:error:", CFSTR("BEGIN TRANSACTION"), a3);
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return -[CXDatabase executeSQL:error:](self, "executeSQL:error:", CFSTR("COMMIT TRANSACTION"), a3);
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return -[CXDatabase executeSQL:error:](self, "executeSQL:error:", CFSTR("ROLLBACK TRANSACTION"), a3);
}

- (BOOL)executeSQL:(id)a3 withStatementPreparationBlock:(id)a4 error:(id *)a5
{
  return -[CXDatabase executeSQL:withStatementPreparationBlock:transient:error:](self, "executeSQL:withStatementPreparationBlock:transient:error:", a3, a4, 0, a5);
}

- (BOOL)selectSQL:(id)a3 withBindings:(id)a4 expectedColumnCount:(int64_t)a5 resultRowHandler:(id)a6 error:(id *)a7
{
  return -[CXDatabase selectSQL:withBindings:expectedColumnCount:transient:resultRowHandler:error:](self, "selectSQL:withBindings:expectedColumnCount:transient:resultRowHandler:error:", a3, a4, a5, 0, a6, a7);
}

- (id)namesOfColumnsInTableWithName:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __50__CXDatabase_namesOfColumnsInTableWithName_error___block_invoke;
  v17 = &unk_1E4B88F40;
  v9 = v8;
  v18 = v9;
  v10 = (void *)MEMORY[0x1A859A7A4](&v14);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA table_info(%@)"), v7, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CXDatabase selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:](self, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", v11, MEMORY[0x1E0C9AA60], 6, v10, a4))
  {

    v9 = 0;
  }
  v12 = (void *)objc_msgSend(v9, "copy");

  return v12;
}

void __50__CXDatabase_namesOfColumnsInTableWithName_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)performTransactionWithBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, void *, id *);
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = (uint64_t (**)(id, void *, id *))a3;
  if (-[CXDatabase beginTransactionWithError:](self, "beginTransactionWithError:", a4))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__CXDatabase_performTransactionWithBlock_error___block_invoke;
    v10[3] = &unk_1E4B893E0;
    v10[4] = self;
    v10[5] = &v11;
    v7 = (void *)MEMORY[0x1A859A7A4](v10);
    v8 = v6[2](v6, v7, a4);
    if (!*((_BYTE *)v12 + 24))
      v8 = -[CXDatabase commitTransactionWithError:](self, "commitTransactionWithError:", a4);

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __48__CXDatabase_performTransactionWithBlock_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "rollbackTransactionWithError:", a2);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setSqlQueryToStatements:(id)a3
{
  objc_storeStrong((id *)&self->_sqlQueryToStatements, a3);
}

@end
