@implementation ENSQLiteConnection

- (ENSQLiteConnection)init
{
  return (ENSQLiteConnection *)-[ENSQLiteConnection _initWithDatabaseURL:](self, "_initWithDatabaseURL:", 0);
}

- (ENSQLiteConnection)initWithDatabaseURL:(id)a3
{
  id v5;
  ENSQLiteConnection *v6;
  void *v8;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL != nil"));

  }
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL.isFileURL"));

  }
  v6 = -[ENSQLiteConnection _initWithDatabaseURL:](self, "_initWithDatabaseURL:", v5);

  return v6;
}

- (id)_initWithDatabaseURL:(id)a3
{
  id v4;
  ENSQLiteConnection *v5;
  uint64_t v6;
  NSURL *fileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENSQLiteConnection;
  v5 = -[ENSQLiteConnection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v5->_statementCache = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], &kSQLite3StatementDictionaryValueCallbacks);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ENSQLiteConnection close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)ENSQLiteConnection;
  -[ENSQLiteConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (int)openWithError:(id *)a3
{
  sqlite3 **p_db;
  uint64_t v4;
  NSURL *fileURL;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  sqlite3 *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v18;

  p_db = &self->_db;
  if (self->_db)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    fileURL = self->_fileURL;
    if (fileURL)
      v8 = -[NSURL fileSystemRepresentation](fileURL, "fileSystemRepresentation");
    else
      v8 = ":memory:";
    v9 = sqlite3_open_v2(v8, p_db, self->_additionalOpenFlags | 6, 0);
    if ((_DWORD)v9)
    {
      v4 = v9;
    }
    else
    {
      v10 = sqlite3_exec(*p_db, "PRAGMA auto_vacuum = 2;", 0, 0, 0);
      if ((_DWORD)v10)
      {
        v4 = v10;
      }
      else
      {
        v11 = sqlite3_exec(*p_db, "PRAGMA cache_size = 512;", 0, 0, 0);
        if ((_DWORD)v11)
        {
          v4 = v11;
        }
        else
        {
          v12 = sqlite3_exec(*p_db, "PRAGMA journal_mode = WAL;", 0, 0, 0);
          if ((_DWORD)v12)
          {
            v4 = v12;
          }
          else
          {
            v4 = sqlite3_exec(*p_db, "PRAGMA foreign_keys = ON;", 0, 0, 0);
            if (!(_DWORD)v4)
              return v4;
          }
        }
      }
    }
    if (gLogCategory__ENSQLiteConnection <= 90
      && (gLogCategory__ENSQLiteConnection != -1 || _LogCategory_Initialize()))
    {
      v13 = *p_db;
      v14 = (void *)MEMORY[0x1E0CB3938];
      v15 = sqlite3_errmsg(v13);
      v16 = "<unavailable>";
      if (v15)
        v16 = v15;
      objc_msgSend(v14, "stringWithFormat:", CFSTR("[%d, %s]"), v4, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (a3)
    {
      -[ENSQLiteConnection _lastErrorWithResultCode:](self, "_lastErrorWithResultCode:", v4);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (void)close
{
  __CFDictionary *statementCache;
  sqlite3 *db;

  statementCache = self->_statementCache;
  if (statementCache)
  {
    CFRelease(statementCache);
    self->_statementCache = 0;
  }
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
}

- (int64_t)lastInsertedRowID
{
  sqlite3 *db;
  void *v6;

  db = self->_db;
  if (!db)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 145, CFSTR("Database must be open"));

    db = self->_db;
  }
  return sqlite3_last_insert_rowid(db);
}

- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t (**v9)(id, ENSQLiteConnection *, id *);
  __CFString *v10;
  _BOOL4 v11;
  void *v12;
  char v13;
  id v14;
  char v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  id v23;
  id v24;

  v9 = (uint64_t (**)(id, ENSQLiteConnection *, id *))a5;
  if (!self->_db)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 153, CFSTR("Database must be open"));

  }
  if (self->_isInTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 154, CFSTR("Re-entrant transactions not supported"));

  }
  if ((unint64_t)a3 > 2)
    v10 = 0;
  else
    v10 = off_1E87DB8D8[a3];
  v11 = -[ENSQLiteConnection executeUncachedSQL:error:](self, "executeUncachedSQL:error:", v10, a4);
  self->_isInTransaction = v11;
  if (!v11)
    goto LABEL_24;
  v12 = (void *)MEMORY[0x1D17A7CB8]();
  v24 = 0;
  v13 = v9[2](v9, self, &v24);
  v14 = v24;
  objc_autoreleasePoolPop(v12);
  if (a4)
    v15 = v13;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
  {
    if (v14)
    {
      *a4 = objc_retainAutorelease(v14);
    }
    else
    {
      ENErrorF();
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v16;

    }
  }

  self->_isInTransaction = 0;
  if ((v13 & 1) == 0)
  {
    v23 = 0;
    v20 = -[ENSQLiteConnection executeUncachedSQL:error:](self, "executeUncachedSQL:error:", CFSTR("ROLLBACK"), &v23);
    v21 = v23;
    if (v20
      && gLogCategory__ENSQLiteConnection <= 90
      && (gLogCategory__ENSQLiteConnection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

LABEL_24:
    v17 = 0;
    goto LABEL_25;
  }
  v17 = -[ENSQLiteConnection executeUncachedSQL:error:](self, "executeUncachedSQL:error:", CFSTR("COMMIT"), a4);
LABEL_25:

  return v17;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return -[ENSQLiteConnection _executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:](self, "_executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:", a3, 0, a4, 0, 0);
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4
{
  return -[ENSQLiteConnection _executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:](self, "_executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:", a3, 0, a4, 0, 0);
}

- (BOOL)executeUncachedSQLStatements:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!-[ENSQLiteConnection executeUncachedSQL:error:](self, "executeUncachedSQL:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), a4, (_QWORD)v13))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return -[ENSQLiteConnection _executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:](self, "_executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:", a3, 1, a4, a5, a6);
}

- (BOOL)_executeSQL:(id)a3 cacheStatement:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  ENSQLiteConnection *v16;
  id v17;
  id v18;
  BOOL v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v10 = a4;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (!self->_db)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 230, CFSTR("Database must be open"));

  }
  v16 = self;
  objc_sync_enter(v16);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__ENSQLiteConnection__executeSQL_cacheStatement_error_bindingHandler_enumerationHandler___block_invoke;
  v22[3] = &unk_1E87DB898;
  v17 = v14;
  v23 = v17;
  v18 = v15;
  v24 = v18;
  v22[4] = v16;
  v19 = -[ENSQLiteConnection _prepareStatementForSQL:cache:error:statementHandler:](v16, "_prepareStatementForSQL:cache:error:statementHandler:", v13, v10, a5, v22);

  objc_sync_exit(v16);
  return v19;
}

uint64_t __89__ENSQLiteConnection__executeSQL_cacheStatement_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  void *v11;
  int v12;
  id v13;
  char v14;
  unsigned __int8 v16;

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  if (!*(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_stepStatement:hasRow:error:", a2, 0, a3);
  v7 = 0;
  v16 = 0;
  while (1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "_stepStatement:hasRow:error:", a2, &v16, a3);
    v9 = v16;
    if ((_DWORD)v8)
      v10 = v16 == 0;
    else
      v10 = 1;
    if (v10)
      goto LABEL_11;
    v11 = (void *)MEMORY[0x1D17A7CB8]();
    v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v13 = v7;

    objc_autoreleasePoolPop(v11);
    if (!v12)
      break;
    v9 = v16;
    v7 = v13;
LABEL_11:
    if (v9)
      v14 = v8;
    else
      v14 = 0;
    if ((v14 & 1) == 0)
    {
      v13 = v7;
      if (!v7)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  v8 = 1;
  if (!v13)
    goto LABEL_21;
LABEL_19:
  v8 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v13);
LABEL_21:

  return v8;
}

- (BOOL)_prepareStatementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 statementHandler:(id)a6
{
  _BOOL4 v8;
  id v11;
  uint64_t (**v12)(id, sqlite3_stmt *, id *);
  sqlite3_stmt *Value;
  sqlite3_stmt *v14;
  int v15;
  uint64_t v16;
  sqlite3 *db;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  char v26;
  void *v28;
  char *pzTail;
  sqlite3_stmt *ppStmt;

  v8 = a4;
  v11 = a3;
  v12 = (uint64_t (**)(id, sqlite3_stmt *, id *))a6;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_statementCache, v11);
  ppStmt = Value;
  if (Value)
  {
    v14 = Value;
    v15 = 0;
    goto LABEL_22;
  }
  while (1)
  {
    pzTail = 0;
    db = self->_db;
    v18 = objc_retainAutorelease(v11);
    v19 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v18, "UTF8String"), objc_msgSend(v18, "length"), &ppStmt, (const char **)&pzTail);
    if (!(_DWORD)v19)
      break;
    v16 = v19;
    if ((v19 - 5) >= 2)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isSensitiveLoggingAllowed");

      if (v21
        && gLogCategory_ENSQLiteConnection <= 90
        && (gLogCategory_ENSQLiteConnection != -1 || _LogCategory_Initialize()))
      {
        v22 = (void *)MEMORY[0x1E0CB3938];
        v23 = sqlite3_errmsg(self->_db);
        v24 = "<unavailable>";
        if (v23)
          v24 = v23;
        objc_msgSend(v22, "stringWithFormat:", CFSTR("[%d, %s]"), v16, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      if (a5)
      {
        -[ENSQLiteConnection _lastErrorWithResultCode:](self, "_lastErrorWithResultCode:", v16);
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  if (pzTail && *pzTail)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 284, CFSTR("SQL strings must contain only a single statement; remaining statements will not be executed: %s"),
      pzTail);

    if (v8)
      goto LABEL_8;
  }
  else if (v8)
  {
LABEL_8:
    CFDictionarySetValue(self->_statementCache, v18, ppStmt);
LABEL_18:
    v15 = 0;
    goto LABEL_21;
  }
  v15 = 1;
LABEL_21:
  v14 = ppStmt;
  if (!ppStmt)
  {
    v26 = 0;
    goto LABEL_25;
  }
LABEL_22:
  v26 = v12[2](v12, v14, a5);
  if (v15)
  {
    sqlite3_finalize(ppStmt);
  }
  else
  {
    sqlite3_clear_bindings(ppStmt);
    sqlite3_reset(ppStmt);
  }
LABEL_25:

  return v26 & 1;
}

- (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  const char *v16;
  const char *v17;
  BOOL result;
  id v19;
  void *v20;

  if (a4)
    *a4 = 0;
  if (a3)
  {
    while (1)
    {
      v9 = sqlite3_step(a3);
      if (v9 == 101)
        break;
      if (v9 == 100)
      {
        result = 1;
        if (a4)
          *a4 = 1;
        return result;
      }
      v10 = v9;
      v11 = v9;
      if (v9 - 5 >= 2)
      {
        if (v9 == 19)
          v12 = 10;
        else
          v12 = 90;
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isSensitiveLoggingAllowed");

        if (v14
          && v12 >= gLogCategory_ENSQLiteConnection
          && (gLogCategory_ENSQLiteConnection != -1 || _LogCategory_Initialize()))
        {
          sqlite3_sql(a3);
          v15 = (void *)MEMORY[0x1E0CB3938];
          v16 = sqlite3_errmsg(self->_db);
          v17 = "<unavailable>";
          if (v16)
            v17 = v16;
          objc_msgSend(v15, "stringWithFormat:", CFSTR("[%d, %s]"), v11, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        if (!a5)
          return 0;
        -[ENSQLiteConnection _lastErrorWithResultCode:](self, "_lastErrorWithResultCode:", v10);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a5 = v19;
        return result;
      }
    }
  }
  return 1;
}

- (BOOL)setIntegerValue:(int64_t)a3 forPragma:(id)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("PRAGMA %@=%lld"), a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[ENSQLiteConnection executeUncachedSQL:error:](self, "executeUncachedSQL:error:", v7, a5);

  return (char)a5;
}

- (BOOL)getIntegerValue:(int64_t *)a3 forPragma:(id)a4 error:(id *)a5
{
  void *v8;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("PRAGMA %@"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ENSQLiteConnection_getIntegerValue_forPragma_error___block_invoke;
  v10[3] = &__block_descriptor_40_e27_B24__0__sqlite3_stmt__8__16l;
  v10[4] = a3;
  LOBYTE(a5) = -[ENSQLiteConnection _executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:](self, "_executeSQL:cacheStatement:error:bindingHandler:enumerationHandler:", v8, 0, a5, 0, v10);

  return (char)a5;
}

uint64_t __54__ENSQLiteConnection_getIntegerValue_forPragma_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  **(_QWORD **)(a1 + 32) = sqlite3_column_int64(a2, 0);
  return 0;
}

- (BOOL)setUserVersion:(int64_t)a3 error:(id *)a4
{
  return -[ENSQLiteConnection setIntegerValue:forPragma:error:](self, "setIntegerValue:forPragma:error:", a3, CFSTR("user_version"), a4);
}

- (BOOL)getUserVersion:(int64_t *)a3 error:(id *)a4
{
  return -[ENSQLiteConnection getIntegerValue:forPragma:error:](self, "getIntegerValue:forPragma:error:", a3, CFSTR("user_version"), a4);
}

- (BOOL)truncateWithError:(id *)a3
{
  void *v6;

  if (!self->_db)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 382, CFSTR("Database must be open"));

  }
  return _sqlite3_db_truncate() == 0;
}

- (id)_lastErrorWithResultCode:(int)a3
{
  uint64_t v3;
  void *v5;
  sqlite3 *db;
  void *v7;
  const char *v8;
  const char *v9;
  void *v11;
  void *v13;

  v3 = *(_QWORD *)&a3;
  if (self->_db)
  {
    if (a3)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSQLiteConnection.m"), 387, CFSTR("Database must be open"));

  if (!(_DWORD)v3)
    goto LABEL_9;
LABEL_3:
  if ((_DWORD)v3 == 23)
  {
    ENErrorF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation");
    db = self->_db;
    v7 = (void *)MEMORY[0x1E0CB3938];
    v8 = sqlite3_errmsg(db);
    v9 = "<unavailable>";
    if (v8)
      v9 = v8;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[%d, %s]"), v3, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ENErrorF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (int)additionalOpenFlags
{
  return self->_additionalOpenFlags;
}

- (void)setAdditionalOpenFlags:(int)a3
{
  self->_additionalOpenFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
