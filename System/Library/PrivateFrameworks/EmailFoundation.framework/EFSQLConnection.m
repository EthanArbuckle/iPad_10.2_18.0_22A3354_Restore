@implementation EFSQLConnection

+ (BOOL)isSuccessResultCode:(int)a3 forStep:(BOOL)a4 error:(id *)a5
{
  BOOL result;
  id v7;

  if ((a3 - 100) < 2)
  {
    result = a4;
    if (!a5)
      return result;
    if (!a4)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (!a3)
  {
    if (!a5)
      return 1;
LABEL_7:
    *a5 = 0;
    return 1;
  }
  if (a5)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_SQLiteErrorWithCode:");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v7;

  }
  return 0;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return -[EFSQLConnection executeStatementString:error:](self, "executeStatementString:error:", CFSTR("COMMIT"), a3);
}

- (BOOL)beginTransaction:(int64_t)a3 error:(id *)a4
{
  __CFString *v4;

  if ((unint64_t)a3 > 2)
    v4 = 0;
  else
    v4 = off_1E62A70C0[a3];
  return -[EFSQLConnection executeStatementString:error:](self, "executeStatementString:error:", v4, a4);
}

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  id v8;

  v6 = a3;
  v7 = -[EFSQLConnection sqlDB](self, "sqlDB");
  v8 = objc_retainAutorelease(v6);
  LOBYTE(a4) = -[EFSQLConnection _isSuccessResultCode:sqlDB:error:](self, "_isSuccessResultCode:sqlDB:error:", sqlite3_exec(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, 0), v7, a4);

  return (char)a4;
}

- (id)preparedStatementForQueryString:(id)a3 transactionLabel:(id)a4 queryLogger:(id)a5
{
  id v9;
  id v10;
  id v11;
  EFSQLPreparedStatement *v12;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLConnection.m"), 345, CFSTR("preparedStatementForQueryString called without a query"));

  }
  if (!-[EFSQLConnection isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLConnection.m"), 346, CFSTR("preparedStatementForQueryString called with NULL database and pattern %@"), v9);

  }
  v12 = -[EFSQLPreparedStatement initWithString:connection:transactionLabel:queryLogger:]([EFSQLPreparedStatement alloc], "initWithString:connection:transactionLabel:queryLogger:", v9, self, v10, v11);
  if (v12)
    -[NSHashTable addObject:](self->_preparedStatements, "addObject:", v12);

  return v12;
}

- (BOOL)isOpen
{
  return -[EFSQLConnection sqlDB](self, "sqlDB") != 0;
}

- (sqlite3)sqlDB
{
  return self->_sqlDB;
}

- (BOOL)_isSuccessResultCode:(int)a3 sqlDB:(sqlite3 *)a4 error:(id *)a5
{
  uint64_t v6;

  v6 = *(_QWORD *)&a3;
  if (a4 && a3 && a5)
    v6 = sqlite3_extended_errcode(a4);
  return objc_msgSend((id)objc_opt_class(), "isSuccessResultCode:forStep:error:", v6, 0, a5);
}

- (BOOL)finalizeStatementsWithError:(id *)a3
{
  sqlite3 *v5;
  sqlite3 *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  sqlite3_stmt *stmt;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[EFSQLConnection sqlDB](self, "sqlDB");
  if (!v5)
  {
LABEL_15:
    LOBYTE(v12) = 1;
    return v12;
  }
  v6 = v5;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_preparedStatements;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "finalizeWithError:", a3, (_QWORD)v14) & 1) == 0)
        {

          LOBYTE(v12) = 0;
          return v12;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  stmt = sqlite3_next_stmt(v6, 0);
  if (!stmt)
  {
LABEL_13:
    if (a3)
      *a3 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    v12 = -[EFSQLConnection _isSuccessResultCode:sqlDB:error:](self, "_isSuccessResultCode:sqlDB:error:", sqlite3_finalize(stmt), v6, a3);
    if (!v12)
      return v12;
    stmt = sqlite3_next_stmt(v6, 0);
    if (!stmt)
      goto LABEL_13;
  }
}

- (BOOL)openWithError:(id *)a3
{
  return -[EFSQLConnection openWithFlags:error:](self, "openWithFlags:error:", 6, a3);
}

- (BOOL)openWithFlags:(int)a3 error:(id *)a4
{
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v14;
  sqlite3 *ppDb;

  if (self->_sqlDB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLConnection.m"), 263, CFSTR("%s called when already open"), "-[EFSQLConnection openWithFlags:error:]");

  }
  -[EFSQLConnection url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");

  ppDb = 0;
  v10 = sqlite3_open_v2(v9, &ppDb, a3, 0);
  v11 = -[EFSQLConnection _isSuccessResultCode:sqlDB:error:](self, "_isSuccessResultCode:sqlDB:error:", v10, ppDb, a4);
  if (v11)
  {
    self->_sqlDB = ppDb;
  }
  else if (ppDb)
  {
    sqlite3_close(ppDb);
  }
  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (EFSQLConnection)initWithURL:(id)a3
{
  id v5;
  EFSQLConnection *v6;
  EFSQLConnection *v7;
  uint64_t v8;
  NSHashTable *preparedStatements;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLConnection;
  v6 = -[EFSQLConnection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    preparedStatements = v7->_preparedStatements;
    v7->_preparedStatements = (NSHashTable *)v8;

  }
  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)EFSQLConnection;
  -[EFSQLConnection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ sqlite handle: %p"), v4, -[EFSQLConnection sqlDB](self, "sqlDB"));

  return (NSString *)v5;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__EFSQLConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (OS_os_log *)(id)log_log_6;
}

void __22__EFSQLConnection_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

+ (BOOL)setFileProtection:(id)a3 forDatabaseAtURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;

  v9 = a3;
  v10 = a4;
  +[EFSQLConnection log](EFSQLConnection, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[EFSQLConnection setFileProtection:forDatabaseAtURL:error:].cold.1((uint64_t)v10, (uint64_t)v9, v11);

  v12 = 1048582;
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C99918]) & 1) == 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C99920]) & 1) != 0)
    {
      v12 = 2097158;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C99928]) & 1) != 0)
    {
      v12 = 3145734;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C99940]) & 1) != 0)
    {
      v12 = 4194310;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLConnection.m"), 212, CFSTR("Unknown protection class"));

      v12 = 6;
    }
  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v10);
  if ((objc_msgSend(v14, "openWithFlags:error:", v12, a5) & 1) != 0)
  {
    v15 = objc_msgSend(v14, "executeStatementString:error:", CFSTR("SELECT 1 FROM sqlite_master"), a5);
    objc_msgSend(v14, "close");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (EFSQLConnection)init
{
  -[EFSQLConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EFSQLConnection init]", "EFSQLConnection.m", 229, "0");
}

- (EFSQLConnection)initWithInMemoryDatabase
{
  void *v3;
  EFSQLConnection *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR(":memory:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EFSQLConnection initWithURL:](self, "initWithURL:", v3);

  return v4;
}

- (EFSQLConnection)initWithSQLDB:(sqlite3 *)a3
{
  EFSQLConnection *v4;
  EFSQLConnection *v5;
  uint64_t v6;
  NSHashTable *preparedStatements;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EFSQLConnection;
  v4 = -[EFSQLConnection init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sqlDB = a3;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSHashTable *)v6;

  }
  return v5;
}

- (void)close
{
  sqlite3 *v3;

  v3 = -[EFSQLConnection sqlDB](self, "sqlDB");
  if (v3)
  {
    sqlite3_close(v3);
    self->_sqlDB = 0;
  }
}

- (void)flush
{
  -[EFSQLConnection commitTransactionWithError:](self, "commitTransactionWithError:", 0);
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return -[EFSQLConnection executeStatementString:error:](self, "executeStatementString:error:", CFSTR("ROLLBACK"), a3);
}

- (id)test_resultsForQueryString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[EFSQLConnection preparedStatementForQueryString:transactionLabel:queryLogger:](self, "preparedStatementForQueryString:transactionLabel:queryLogger:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__EFSQLConnection_test_resultsForQueryString___block_invoke;
    v8[3] = &unk_1E62A7040;
    v5 = v4;
    v9 = v5;
    if (objc_msgSend(v3, "executeUsingBlock:error:", v8, 0))
      v6 = (void *)objc_msgSend(v5, "copy");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __46__EFSQLConnection_test_resultsForQueryString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "columnNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = *(void **)(a1 + 32);
  v13 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v12, "addObject:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
}

+ (void)setFileProtection:(uint64_t)a1 forDatabaseAtURL:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1B106E000, log, OS_LOG_TYPE_DEBUG, "Setting file protection for %{public}@ to %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
