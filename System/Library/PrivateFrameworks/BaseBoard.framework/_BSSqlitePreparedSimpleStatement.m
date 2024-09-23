@implementation _BSSqlitePreparedSimpleStatement

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  int v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  if (WeakRetained && self->_statement)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79___BSSqlitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v14[3] = &unk_1E1EBE770;
    v17 = &v18;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, (uint64_t)v14);

    v11 = *((_DWORD *)v19 + 6);
    if (!a5)
      goto LABEL_8;
  }
  else
  {
    v11 = 21;
    *((_DWORD *)v19 + 6) = 21;
    if (!a5)
      goto LABEL_8;
  }
  if (v11)
  {
    -[_BSSqlitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *((_DWORD *)v19 + 6);
  }
LABEL_8:
  v12 = v11 == 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)_initWithDatabaseConnection:(void *)a3 statement:
{
  id v5;
  id *v6;
  id WeakRetained;

  v5 = a2;
  if (a1)
  {
    v6 = -[BSSqlitePreparedStatement _initWithDatabaseConnection:](a1, v5);
    a1 = v6;
    if (v6)
    {
      v6[2] = a3;
      WeakRetained = objc_loadWeakRetained(v6 + 1);
      -[BSSqliteDatabaseConnection addObserver:]((uint64_t)WeakRetained, (uint64_t)a1);

    }
  }

  return a1;
}

- (void)dealloc
{
  id WeakRetained;
  sqlite3_stmt *statement;
  objc_super v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  statement = self->_statement;
  if (statement)
  {
    if (WeakRetained)
    {
      self->_statement = 0;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __43___BSSqlitePreparedSimpleStatement_dealloc__block_invoke;
      v6[3] = &__block_descriptor_40_e18_v16__0__sqlite3__8l;
      v6[4] = statement;
      -[BSSqliteDatabaseConnection performWithDatabase:]((uint64_t)WeakRetained, (uint64_t)v6);
    }
    else
    {
      sqlite3_finalize(statement);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)_BSSqlitePreparedSimpleStatement;
  -[BSSqlitePreparedStatement dealloc](&v5, sel_dealloc);
}

- (id)_sqliteError:(uint64_t)a1
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    -[BSSqliteDatabaseConnection lastErrorMessage]((uint64_t)WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.baseboard.bssqlite"), a2, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)sqliteDatabaseConnectionWillClose:(id)a3
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
  {
    sqlite3_finalize(statement);
    self->_statement = 0;
  }
  objc_storeWeak((id *)&self->super._dbConnection, 0);
}

@end
