@implementation EDPersistenceDatabaseConnection

- (BOOL)performWithOptions:(unint64_t)a3 transactionError:(id *)a4 block:(id)a5
{
  char v6;
  uint64_t (**v9)(id, EDPersistenceDatabaseConnection *);
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  char v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v27;
  id v28;
  _BYTE v29[24];
  uint64_t v30;

  v6 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = (uint64_t (**)(id, EDPersistenceDatabaseConnection *))a5;
  v10 = (void *)MEMORY[0x1D824B334]();
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
    v28 = 0;
    v12 = -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:]((uint64_t)self, v11, v6, (uint64_t)&v28);
    v13 = v28;
    if (v13)
    {
      v14 = v13;
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "ef_publicDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:].cold.4((uint64_t)self, v16, (uint64_t)v29, v15);
      }

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseConnection.m"), 400, CFSTR("Transaction error set despite not needing/attempting to take a transaction"));

      }
      goto LABEL_8;
    }
  }
  else
  {
    v12 = 0;
  }
  v18 = v9[2](v9, self);
  if (!v12)
  {
    if ((v18 & 1) != 0)
    {
      v14 = 0;
      v17 = 1;
      goto LABEL_25;
    }
    if ((v6 & 1) != 0)
    {
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "threadDictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_EDPersistenceDatabaseConnectionNestedBlockFailed"));
      v14 = 0;
    }
    else
    {
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:].cold.1();

      v14 = 0;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_25;
  }
  if ((v18 & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:].cold.3();

    v19 = 0;
  }
  v27 = 0;
  v17 = -[EDPersistenceDatabaseConnection _finishTransactionWithSQLConnection:afterSuccess:transactionError:](self, v11, v19, &v27);
  v14 = v27;
LABEL_25:

  objc_autoreleasePoolPop(v10);
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v17;
}

- (id)preparedStatementForQueryString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection transactionLabel](self, "transactionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection SQLQueryLogger](self, "SQLQueryLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preparedStatementForQueryString:transactionLabel:queryLogger:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error preparing statement for query %@"), v4);
    -[EDPersistenceDatabaseConnection handleSQLResult:message:](self, "handleSQLResult:message:", sqlite3_errcode(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB")), v9);

  }
  return v8;
}

- (EFSQLConnection)sqlConnection
{
  return self->_sqlConnection;
}

- (NSString)transactionLabel
{
  return self->_transactionLabel;
}

- (id)SQLQueryLogger
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[EDPersistenceDatabaseConnection delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EDPersistenceDatabaseConnection delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)_startTransactionWithSQLConnection:(char)a3 options:(uint64_t)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v16;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_EDPersistenceDatabaseConnectionInTransaction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) != 0
      || ((a3 & 2) != 0 ? (v12 = objc_msgSend((id)a1, "transactionTypeForWriting")) : (v12 = 0),
          !objc_msgSend(v7, "beginTransaction:error:", v12, a4)))
    {
      a1 = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_EDPersistenceDatabaseConnectionInTransaction"));
    v16 = 0;
    if ((a3 & 4) != 0)
    {
      if ((a3 & 2) != 0)
      {
        if (EFSQLVerboseDebugLoggingEnabled())
        {
          +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:].cold.4();
          goto LABEL_23;
        }
      }
      else if (EFSQLVerboseDebugLoggingEnabled())
      {
        +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:].cold.3();
        goto LABEL_23;
      }
    }
    else
    {
      -[EDPersistenceDatabaseConnection _fetchTransactionWriteGenerationWithSQLConnection:newGeneration:]((void *)a1, v7, &v16);
      if ((a3 & 2) != 0)
      {
        -[EDPersistenceDatabaseConnection _storeTransactionWriteGenerationWithSQLConnection:newGeneration:]((void *)a1, v7, ++v16);
        if (EFSQLVerboseDebugLoggingEnabled())
        {
          +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:].cold.2(&v16);
          goto LABEL_23;
        }
      }
      else if (EFSQLVerboseDebugLoggingEnabled())
      {
        +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:].cold.1(&v16);
LABEL_23:

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("_EDPersistenceDatabaseConnectionTransactionGeneration"));

    a1 = 1;
    goto LABEL_25;
  }
LABEL_26:

  return a1;
}

- (void)setTransactionLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDPersistenceDatabaseConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_64 != -1)
    dispatch_once(&log_onceToken_64, block);
  return (OS_os_log *)(id)log_log_64;
}

- (uint64_t)_fetchTransactionWriteGenerationWithSQLConnection:(_QWORD *)a3 newGeneration:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDPersistenceDatabaseConnection _fetchTransactionWriteGenerationWithSQLConnection:newGeneration:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "SQLQueryLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preparedStatementForQueryString:transactionLabel:queryLogger:", CFSTR("SELECT value FROM properties WHERE key = :key"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("WriteTransactionGeneration"), CFSTR(":key"));
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v13 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __99__EDPersistenceDatabaseConnection__fetchTransactionWriteGenerationWithSQLConnection_newGeneration___block_invoke;
    v14[3] = &unk_1E949B090;
    v14[4] = &v15;
    v10 = objc_msgSend(v8, "executeWithNamedBindings:usingBlock:error:", v9, v14, &v13);
    v11 = v13;
    if (a3)
      *a3 = v16[3];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_finishTransactionWithSQLConnection:(int)a3 afterSuccess:(_QWORD *)a4 transactionError:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  NSObject *v13;
  const __CFString *v14;
  id *v15;
  uint64_t v16;
  const __CFString *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_EDPersistenceDatabaseConnectionNestedBlockFailed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) == 0)
  {
    if ((objc_msgSend(a1, "hadIOError") & 1) == 0)
    {
      v23 = 0;
      v15 = (id *)&v23;
      v16 = objc_msgSend(v7, "commitTransactionWithError:", &v23);
      v17 = CFSTR("commit");
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  v12 = 1;
LABEL_7:
  +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    if ((v12 & 1) != 0)
    {
      v14 = CFSTR(" (due to nested block failure)");
    }
    else if (objc_msgSend(a1, "hadIOError"))
    {
      v14 = CFSTR("(due to IOError)");
    }
    else
    {
      v14 = &stru_1E94A4508;
    }
    -[EDPersistenceDatabaseConnection _finishTransactionWithSQLConnection:afterSuccess:transactionError:].cold.2((uint64_t)v14, (uint64_t)v30, (uint64_t)a1, v13);
  }

  v22 = 0;
  v15 = (id *)&v22;
  objc_msgSend(v7, "rollbackTransactionWithError:", &v22);
  v16 = 0;
  v17 = CFSTR("rollback");
LABEL_15:
  v18 = *v15;
  if (v18)
  {
    +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "ef_publicDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = a1;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v20;
      _os_log_error_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_ERROR, "Transaction on connection %{public}@ %{public}@ failed: %{public}@", buf, 0x20u);

    }
LABEL_21:

    goto LABEL_22;
  }
  if (EFSQLVerboseDebugLoggingEnabled())
  {
    +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[EDPersistenceDatabaseConnection _finishTransactionWithSQLConnection:afterSuccess:transactionError:].cold.1((uint64_t)a1);
    goto LABEL_21;
  }
LABEL_22:
  if (a4)
    *a4 = objc_retainAutorelease(v18);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("_EDPersistenceDatabaseConnectionInTransaction"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("_EDPersistenceDatabaseConnectionNestedBlockFailed"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("_EDPersistenceDatabaseConnectionTransactionGeneration"));

LABEL_25:
  return v16;
}

- (BOOL)hadIOError
{
  return self->_hadIOError;
}

- (BOOL)protectedDatabaseAttached
{
  NSString *protectedDatabaseName;

  if (self)
    protectedDatabaseName = self->_protectedDatabaseName;
  else
    protectedDatabaseName = 0;
  return protectedDatabaseName != 0;
}

- (BOOL)executeSelectStatement:(id)a3 withBlock:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a3, "queryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v10, v8, CFSTR("SELECT statement"), (uint64_t *)a5);
  return (char)a5;
}

- (uint64_t)_executePreparedStatement:(void *)a3 withBlock:(void *)a4 description:(uint64_t *)a5 error:
{
  id v9;
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v18 = 0;
    if (a5)
      v12 = a5;
    else
      v12 = &v18;
    v13 = objc_msgSend(v9, "executeUsingBlock:error:", v10, v12);
    v14 = v13;
    if (a5)
      v15 = 1;
    else
      v15 = v13;
    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while executing %@"), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "handleError:message:", v18, v16);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)countForSelectStatement:(id)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__EDPersistenceDatabaseConnection_countForSelectStatement___block_invoke;
  v5[3] = &unk_1E949B090;
  v5[4] = &v6;
  -[EDPersistenceDatabaseConnection executeSelectStatement:withBlock:error:](self, "executeSelectStatement:withBlock:error:", a3, v5, 0);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)journalDatabaseAttached
{
  NSString *journalDatabaseName;

  if (self)
    journalDatabaseName = self->_journalDatabaseName;
  else
    journalDatabaseName = 0;
  return journalDatabaseName != 0;
}

- (uint64_t)_storeTransactionWriteGenerationWithSQLConnection:(uint64_t)a3 newGeneration:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDPersistenceDatabaseConnection _storeTransactionWriteGenerationWithSQLConnection:newGeneration:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "SQLQueryLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preparedStatementForQueryString:transactionLabel:queryLogger:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("WriteTransactionGeneration"), CFSTR(":key"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR(":value"));

    v16 = 0;
    v11 = objc_msgSend(v8, "executeWithNamedBindings:usingBlock:error:", v9, 0, &v16);
    v12 = v16;
    if ((v11 & 1) == 0)
    {
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDPersistenceDatabaseConnection _storeTransactionWriteGenerationWithSQLConnection:newGeneration:].cold.1(v14, (uint64_t)v17, v13);
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)EDPersistenceDatabaseConnection;
  -[EDPersistenceDatabaseConnection description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDPersistenceDatabaseConnection isWriter](self, "isWriter");
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("NO");
  if (v5)
    v8 = CFSTR("YES");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@ isWriter: %@, SQL connection: %@]"), v4, v8, v6);

  return (NSString *)v9;
}

- (BOOL)attachProtectedDatabaseWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[EDPersistenceDatabaseConnection delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protectedDatabasePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlForDatabasePath:type:", v9, -[EDPersistenceDatabaseConnection _adjustedDatabaseTypeForType:]((uint64_t)self, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = -[EDPersistenceDatabaseConnection attachProtectedDatabaseWithName:url:error:](self, "attachProtectedDatabaseWithName:url:error:", v6, v10, a4);
  return (char)v7;
}

- (uint64_t)_adjustedDatabaseTypeForType:(uint64_t)result
{
  void *v3;

  if (result)
  {
    objc_msgSend((id)result, "basePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return a2;
    else
      return 3;
  }
  return result;
}

- (EDPersistenceDatabaseConnection)initWithBasePath:(id)a3 databaseName:(id)a4 isWriter:(BOOL)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  EDPersistenceDatabaseConnection *v14;
  EDPersistenceDatabaseConnection *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  EFSQLConnection *sqlConnection;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)EDPersistenceDatabaseConnection;
  v14 = -[EDPersistenceDatabaseConnection init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeStrong((id *)&v15->_basePath, a3);
    v15->_isWriter = a5;
    -[EDPersistenceDatabaseConnection _databasePathForFileName:](v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabaseConnection basePath](v15, "basePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v18 = 0;
    else
      v18 = 3;
    objc_msgSend(v13, "urlForDatabasePath:type:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFD8]), "initWithURL:", v19);
    sqlConnection = v15->_sqlConnection;
    v15->_sqlConnection = (EFSQLConnection *)v20;

  }
  return v15;
}

- (NSString)basePath
{
  return self->_basePath;
}

- (id)_databasePathForFileName:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "basePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v3;
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)attachProtectedDatabaseWithName:(id)a3 url:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  EDPersistenceDatabaseConnection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[EDPersistenceDatabaseConnection protectedDatabaseAttached](self, "protectedDatabaseAttached")
    || !-[EDPersistenceDatabaseConnection _attachDatabaseWithName:url:error:](self, v8, v9, (uint64_t)a5))
  {
    v12 = 0;
  }
  else
  {
    if (self)
      objc_setProperty_nonatomic_copy(self, v10, v8, 16);
    +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Attached Protected Index on connection %{public}@", (uint8_t *)&v14, 0xCu);
    }

    v12 = 1;
  }

  return v12;
}

- (uint64_t)_attachDatabaseWithName:(void *)a3 url:(uint64_t)a4 error:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    if (!objc_msgSend(a1, "sqlDB"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__attachDatabaseWithName_url_error_, a1, CFSTR("EDPersistenceDatabaseConnection.m"), 770, CFSTR("Attaching database when not open"));

    }
    +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[EDPersistenceDatabaseConnection _attachDatabaseWithName:url:error:].cold.1((uint64_t)v7);

    objc_msgSend(a1, "sqlConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ef_quotedSQLEscapedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("ATTACH DATABASE %@ AS %@"), v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v10, "executeStatementString:error:", v14, a4);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setIsWriter:(BOOL)a3
{
  self->_isWriter = a3;
}

- (BOOL)isWriter
{
  return self->_isWriter;
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpen");

  return v3;
}

- (void)open
{
  int v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v12, "isOpen");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseConnection.m"), 297, CFSTR("EDPersistenceDatabaseConnection open called when already open"));

  }
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

  if ((objc_msgSend(v13, "openWithError:", 0) & 1) == 0)
  {
    -[EDPersistenceDatabaseConnection basePath](self, "basePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          -[EDPersistenceDatabaseConnection basePath](self, "basePath"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0),
          v10,
          v9,
          (objc_msgSend(v13, "openWithError:", 0) & 1) == 0))
    {
      -[EDPersistenceDatabaseConnection basePath](self, "basePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_18;
      if (self && v7)
        chmod(v7, 0x180u);
      if (!objc_msgSend(v13, "openWithError:", 0))
        goto LABEL_18;
    }
  }
  if (objc_msgSend(v13, "isOpen")
    && -[EDPersistenceDatabaseConnection configureSQLConnection](self, "configureSQLConnection"))
  {
LABEL_18:
    if (objc_msgSend(v13, "isOpen"))
    {
      objc_msgSend(v13, "finalizeStatementsWithError:", 0);
      objc_msgSend(v13, "close");
    }
  }

}

void __64__EDPersistenceDatabaseConnection_executeUpdateStatement_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "ef_SQLBinding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindToStatement:usingName:", *(_QWORD *)(a1 + 32), v6);

}

- (int)configureSQLConnection
{
  void *v4;
  char v5;
  void *v6;
  sqlite3 *v7;
  uint64_t function;
  uint64_t v9;
  const __CFString *v10;
  void *v12;

  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOpen");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseConnection.m"), 357, CFSTR("configureSQLConnection called on a closed connection"));

  }
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (sqlite3 *)objc_msgSend(v6, "sqlDB");

  function = sqlite3_create_function(v7, "and64", 2, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))and64, 0, 0);
  -[EDPersistenceDatabaseConnection handleSQLResult:message:](self, "handleSQLResult:message:", function, CFSTR("error creating user function and64"));
  if (!(_DWORD)function)
  {
    v9 = sqlite3_exec(v7, "PRAGMA foreign_keys = ON;", 0, 0, 0);
    if ((_DWORD)v9)
    {
      function = v9;
      v10 = CFSTR("error enabling foreign key support");
LABEL_8:
      -[EDPersistenceDatabaseConnection handleSQLResult:message:](self, "handleSQLResult:message:", function, v10);
      return function;
    }
    function = sqlite3_busy_timeout(v7, 0x7FFFFFFF);
    if ((_DWORD)function)
    {
      v10 = CFSTR("error setting busy timeout");
      goto LABEL_8;
    }
  }
  return function;
}

- (BOOL)checkForConnectionErrorWithMessage:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  v5 = sqlite3_errcode(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));
  -[EDPersistenceDatabaseConnection handleSQLResult:message:](self, "handleSQLResult:message:", v5, v4);
  v6 = (_DWORD)v5 == 9;
  if (!(_DWORD)v5)
    v6 = 1;
  v7 = (v5 - 100) < 2 || v6;

  return v7;
}

- (sqlite3)sqlDB
{
  void *v4;
  sqlite3 *v5;
  void *v7;

  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (sqlite3 *)objc_msgSend(v4, "sqlDB");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseConnection.m"), 292, CFSTR("We have a database connection without a sql database pointer"));

  }
  return v5;
}

- (BOOL)executeUpdateStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  objc_msgSend(v6, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__EDPersistenceDatabaseConnection_executeUpdateStatement_error___block_invoke;
    v13[3] = &unk_1E949F840;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v6, "enumerateBindingNamesAndValuesUsingBlock:", v13);
    v11 = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v10, 0, CFSTR("UPDATE statement"), (uint64_t *)a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)executeInsertStatement:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__EDPersistenceDatabaseConnection_executeInsertStatement_error___block_invoke;
      v13[3] = &unk_1E949F818;
      v11 = v9;
      v14 = v11;
      objc_msgSend(v6, "enumerateBindingIndicesAndValuesUsingBlock:", v13);
      v7 = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v11, 0, CFSTR("INSERT statement"), (uint64_t *)a4);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

void __59__EDPersistenceDatabaseConnection_countForSelectStatement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "unsignedIntegerValue");

}

void __99__EDPersistenceDatabaseConnection__fetchTransactionWriteGenerationWithSQLConnection_newGeneration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64Value");

}

- (int64_t)transactionGeneration
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_EDPersistenceDatabaseConnectionTransactionGeneration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  return v5;
}

void __38__EDPersistenceDatabaseConnection_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_64;
  log_log_64 = (uint64_t)v1;

}

- (BOOL)executeUpdateStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[EDPersistenceDatabaseConnection executeUpdateStatement:error:](self, "executeUpdateStatement:error:", v6, 0);
  if (a4)
    *a4 = sqlite3_changes(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));

  return v7;
}

- (EDPersistenceDatabaseConnection)init
{
  -[EDPersistenceDatabaseConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistenceDatabaseConnection init]", "EDPersistenceDatabaseConnection.m", 55, "0");
}

- (id)initForInMemoryDatabaseIsWriter:(BOOL)a3 delegate:(id)a4
{
  return -[EDPersistenceDatabaseConnection initWithBasePath:databaseName:isWriter:delegate:](self, "initWithBasePath:databaseName:isWriter:delegate:", 0, CFSTR(":memory:"), a3, a4);
}

- (EDPersistenceDatabaseConnection)initWithSQLDB:(sqlite3 *)a3 isWriter:(BOOL)a4 delegate:(id)a5
{
  id v8;
  EDPersistenceDatabaseConnection *v9;
  EDPersistenceDatabaseConnection *v10;
  uint64_t v11;
  EFSQLConnection *sqlConnection;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EDPersistenceDatabaseConnection;
  v9 = -[EDPersistenceDatabaseConnection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_isWriter = a4;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFD8]), "initWithSQLDB:", a3);
    sqlConnection = v10->_sqlConnection;
    v10->_sqlConnection = (EFSQLConnection *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[EDPersistenceDatabaseConnection close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)EDPersistenceDatabaseConnection;
  -[EDPersistenceDatabaseConnection dealloc](&v3, sel_dealloc);
}

void __64__EDPersistenceDatabaseConnection_executeInsertStatement_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  objc_msgSend(a3, "ef_SQLBinding");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindToStatement:usingIndex:", *(_QWORD *)(a1 + 32), a2);

}

- (BOOL)executeInsertStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[EDPersistenceDatabaseConnection executeInsertStatement:error:](self, "executeInsertStatement:error:", v6, 0);
  if (a4)
    *a4 = sqlite3_changes(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));

  return v7;
}

- (BOOL)executeUpsertStatement:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__EDPersistenceDatabaseConnection_executeUpsertStatement_error___block_invoke;
      v13[3] = &unk_1E949F840;
      v11 = v9;
      v14 = v11;
      objc_msgSend(v6, "enumerateBindingNamesAndValuesUsingBlock:", v13);
      v7 = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v11, 0, CFSTR("UPSERT statement"), (uint64_t *)a4);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

void __64__EDPersistenceDatabaseConnection_executeUpsertStatement_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "ef_SQLBinding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindToStatement:usingName:", *(_QWORD *)(a1 + 32), v6);

}

- (BOOL)executeUpsertStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[EDPersistenceDatabaseConnection executeUpsertStatement:error:](self, "executeUpsertStatement:error:", v6, 0);
  if (a4)
    *a4 = sqlite3_changes(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));

  return v7;
}

- (BOOL)executeDeleteStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a4) = objc_msgSend(v8, "executeStatementString:error:", v9, a4);

  }
  else
  {
    objc_msgSend(v6, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = (id *)-[EDPersistenceDatabaseConnection executeStatementString:errorMessage:](self, "executeStatementString:errorMessage:", v8, CFSTR("Error while executing DELETE statement"));
  }

  return (char)a4;
}

- (BOOL)executeDeleteStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[EDPersistenceDatabaseConnection executeDeleteStatement:error:](self, "executeDeleteStatement:error:", v6, 0);
  if (a4)
    *a4 = sqlite3_changes(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));

  return v7;
}

- (BOOL)executeStatementString:(id)a3 errorMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v12;

  v6 = a3;
  v7 = a4;
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v8, "executeStatementString:error:", v6, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v10, v7);

  return v9;
}

- (id)databaseIDsForSelectStatement:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__EDPersistenceDatabaseConnection_databaseIDsForSelectStatement___block_invoke;
  v8[3] = &unk_1E949AF78;
  v6 = v5;
  v9 = v6;
  -[EDPersistenceDatabaseConnection executeSelectStatement:withBlock:error:](self, "executeSelectStatement:withBlock:error:", v4, v8, 0);

  return v6;
}

void __65__EDPersistenceDatabaseConnection_databaseIDsForSelectStatement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", v4);
}

- (unint64_t)rowsChanged
{
  return sqlite3_changes(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));
}

- (int64_t)lastInsertedDatabaseID
{
  return sqlite3_last_insert_rowid(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"));
}

- (void)clearLastInsertedDatabaseID
{
  sqlite3_set_last_insert_rowid(-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"), 0);
}

- (void)close
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;

  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = objc_msgSend(v3, "finalizeStatementsWithError:", &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v5, CFSTR("Unable to finalize statements"));
  if (-[EDPersistenceDatabaseConnection protectedDatabaseAttached](self, "protectedDatabaseAttached"))
    -[EDPersistenceDatabaseConnection detachProtectedDatabase](self, "detachProtectedDatabase");
  if (-[EDPersistenceDatabaseConnection journalDatabaseAttached](self, "journalDatabaseAttached"))
    -[EDPersistenceDatabaseConnection detachJournalDatabase](self, "detachJournalDatabase");
  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

}

- (int64_t)transactionTypeForWriting
{
  return 2;
}

- (void)handleError:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    objc_msgSend(v9, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1EE10]);

    if (v8)
      -[EDPersistenceDatabaseConnection handleSQLResult:message:](self, "handleSQLResult:message:", objc_msgSend(v9, "code"), v6);
  }

}

- (void)handleSQLResult:(int)a3 message:(id)a4
{
  id v6;

  v6 = a4;
  -[EDPersistenceDatabaseConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistenceDatabaseConnection handleSQLResult:message:]", "EDPersistenceDatabaseConnection.m", 566, "0");
}

- (NSString)fullPath
{
  void *v2;
  void *v3;
  void *v4;

  -[EDPersistenceDatabaseConnection sqlConnection](self, "sqlConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)databaseIsAttached:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", CFSTR("PRAGMA database_list"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__EDPersistenceDatabaseConnection_databaseIsAttached___block_invoke;
  v12[3] = &unk_1E949B7A0;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  v11 = 0;
  v7 = objc_msgSend(v5, "executeUsingBlock:error:", v12, &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v8, CFSTR("Getting attached databases"));
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __54__EDPersistenceDatabaseConnection_databaseIsAttached___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)tableExists:(id)a3
{
  return -[EDPersistenceDatabaseConnection tableExists:inDatabase:](self, "tableExists:inDatabase:", a3, 0);
}

- (BOOL)tableExists:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  BOOL v13;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (v7)
    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT 1 FROM %@.sqlite_master WHERE name = ? AND type = 'table'"), v7);
  else
    v8 = CFSTR("SELECT 1 FROM sqlite_master WHERE name = ? AND type = 'table'");
  -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__EDPersistenceDatabaseConnection_tableExists_inDatabase___block_invoke;
  v16[3] = &unk_1E949B090;
  v16[4] = &v17;
  v11 = objc_msgSend(v9, "executeWithIndexedBindings:usingBlock:error:", v10, v16, &v15);
  v12 = v15;

  if ((v11 & 1) == 0)
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v12, CFSTR("Checking for existence of table"));
  v13 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __58__EDPersistenceDatabaseConnection_tableExists_inDatabase___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (BOOL)columnExists:(id)a3 inTable:(id)a4 type:(unint64_t *)a5
{
  return -[EDPersistenceDatabaseConnection columnExists:inTable:database:type:](self, "columnExists:inTable:database:type:", a3, a4, 0, a5);
}

- (BOOL)columnExists:(id)a3 inTable:(id)a4 database:(id)a5 type:(unint64_t *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  if (v12)
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA %@.table_info(%@)"), v12, v11);
  else
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA table_info(%@)"), v11);
  v14 = (void *)v13;
  -[EDPersistenceDatabaseConnection preparedStatementForQueryString:](self, "preparedStatementForQueryString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__EDPersistenceDatabaseConnection_columnExists_inTable_database_type___block_invoke;
  v22[3] = &unk_1E949F868;
  v16 = v10;
  v23 = v16;
  v24 = &v30;
  v25 = &v26;
  v21 = 0;
  v17 = objc_msgSend(v15, "executeUsingBlock:error:", v22, &v21);
  v18 = v21;
  if ((v17 & 1) == 0)
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v18, CFSTR("Fetching column type"));
  if (a6)
    *a6 = v27[3];
  v19 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __70__EDPersistenceDatabaseConnection_columnExists_inTable_database_type___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", a1[4]))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v8 = (void *)MEMORY[0x1E0D1EFC8];
    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v8, "columnTypeForString:", v10);

    *a4 = 1;
  }

}

- (BOOL)attachProtectedDatabaseWithName:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  v5 = -[EDPersistenceDatabaseConnection attachProtectedDatabaseWithName:error:](self, "attachProtectedDatabaseWithName:error:", v4, &v9);
  v6 = v9;
  if (!v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attaching %@"), v4);
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v6, v7);

  }
  return v5;
}

- (void)detachProtectedDatabase
{
  NSString *protectedDatabaseName;
  const char *v4;
  int v5;
  NSObject *v6;
  int v7;
  EDPersistenceDatabaseConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[EDPersistenceDatabaseConnection protectedDatabaseAttached](self, "protectedDatabaseAttached"))
  {
    if (self)
      protectedDatabaseName = self->_protectedDatabaseName;
    else
      protectedDatabaseName = 0;
    v5 = -[EDPersistenceDatabaseConnection _detachDatabaseWithName:](self, protectedDatabaseName);
    if (self)
      objc_setProperty_nonatomic_copy(self, v4, 0, 16);
    if (v5)
    {
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543362;
        v8 = self;
        _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Detached Protected Index on connection %{public}@", (uint8_t *)&v7, 0xCu);
      }

    }
    else
    {
      -[EDPersistenceDatabaseConnection close](self, "close");
      -[EDPersistenceDatabaseConnection open](self, "open");
    }
  }
}

- (uint64_t)_detachDatabaseWithName:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    if (!objc_msgSend(a1, "sqlDB"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__detachDatabaseWithName_, a1, CFSTR("EDPersistenceDatabaseConnection.m"), 781, CFSTR("Detaching database when not open"));

    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DETACH DATABASE %@"), v3);
    objc_msgSend(a1, "sqlConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v6 = objc_msgSend(v5, "executeStatementString:error:", v4, &v11);
    v7 = v11;

    if ((v6 & 1) == 0)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("detaching %@"), v3);
      objc_msgSend(a1, "handleError:message:", v7, v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)attachJournalDatabase:(id)a3 withName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  int v17;
  EDPersistenceDatabaseConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[EDPersistenceDatabaseConnection journalDatabaseAttached](self, "journalDatabaseAttached"))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    -[EDPersistenceDatabaseConnection delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "urlForDatabasePath:type:", v12, -[EDPersistenceDatabaseConnection _adjustedDatabaseTypeForType:]((uint64_t)self, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[EDPersistenceDatabaseConnection _attachDatabaseWithName:url:error:](self, v9, v13, (uint64_t)a5);
    if (v10)
    {
      if (self)
        objc_setProperty_nonatomic_copy(self, v14, v9, 24);
      -[EDPersistenceDatabaseConnection setJournal:]((uint64_t)self, v8);
      objc_msgSend(v8, "checkOut");
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = self;
        _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Attached journal on connection %{public}@", (uint8_t *)&v17, 0xCu);
      }

    }
  }

  return v10;
}

- (void)setJournal:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (BOOL)attachJournalDatabase:(id)a3 withName:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  id v11;

  v6 = a4;
  v11 = 0;
  v7 = -[EDPersistenceDatabaseConnection attachJournalDatabase:withName:error:](self, "attachJournalDatabase:withName:error:", a3, v6, &v11);
  v8 = v11;
  if (!v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attaching %@"), v6);
    -[EDPersistenceDatabaseConnection handleError:message:](self, "handleError:message:", v8, v9);

  }
  return v7;
}

- (BOOL)detachJournalDatabase
{
  int v3;
  NSString *v4;
  SEL v5;
  NSObject *v6;
  int v8;
  EDPersistenceDatabaseConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[EDPersistenceDatabaseConnection journalDatabaseAttached](self, "journalDatabaseAttached");
  if (v3)
  {
    v4 = self ? self->_journalDatabaseName : 0;
    v3 = -[EDPersistenceDatabaseConnection _detachDatabaseWithName:](self, v4);
    if (v3)
    {
      if (self)
      {
        -[EDPersistenceDatabaseJournal checkIn](self->_journal, "checkIn");
        -[EDPersistenceDatabaseConnection setJournal:]((uint64_t)self, 0);
        objc_setProperty_nonatomic_copy(self, v5, 0, 24);
      }
      else
      {
        objc_msgSend(0, "checkIn");
        -[EDPersistenceDatabaseConnection setJournal:](0, 0);
      }
      +[EDPersistenceDatabaseConnection log](EDPersistenceDatabaseConnection, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = self;
        _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Detached journal on connection %{public}@", (uint8_t *)&v8, 0xCu);
      }

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (EDPersistenceDatabaseConnectionDelegate)delegate
{
  return (EDPersistenceDatabaseConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setHadIOError:(BOOL)a3
{
  self->_hadIOError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLabel, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_sqlConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_journal, 0);
  objc_storeStrong((id *)&self->_journalDatabaseName, 0);
  objc_storeStrong((id *)&self->_protectedDatabaseName, 0);
}

- (id)selectLastProcessedAttachmentID
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v1 = a1;
  if (a1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__30;
    v12 = __Block_byref_object_dispose__30;
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM properties WHERE key = '%@'"), CFSTR("com.apple.mail.searchableIndex.lastProcessedAttachmentIDKey"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "preparedStatementForQueryString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __96__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectLastProcessedAttachmentID__block_invoke;
    v7[3] = &unk_1E949B090;
    v7[4] = &v8;
    objc_msgSend(v3, "executeUsingBlock:error:", v7, &v6);
    v4 = v6;
    objc_msgSend(v1, "handleError:message:", v4, CFSTR("Selecting previous conversation daily export sync anchor"));
    v1 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }
  return v1;
}

void __96__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectLastProcessedAttachmentID__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  EDPersistedAttachmentID *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  if (v4)
  {
    v5 = -[EDPersistedAttachmentID initWithDatabaseID:]([EDPersistedAttachmentID alloc], "initWithDatabaseID:", v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (uint64_t)setLastProcessedAttachmentID:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "preparedStatementForQueryString:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.mail.searchableIndex.lastProcessedAttachmentIDKey"), CFSTR(":key"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "databaseID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR(":value"));

    v10 = 0;
    v7 = objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v5, 0, &v10);
    v8 = v10;
    if ((v7 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v8, CFSTR("Setting latest value for lastProcessAttachmentID"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)attachmentDataForMessageWithIdentifier:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ma.ROWID, m.ROWID, ma.mime_part_number, ma.name, m.mailbox FROM messages AS m LEFT OUTER JOIN message_attachments AS ma ON (ma.global_message_id = m.global_message_id) LEFT OUTER JOIN searchable_attachments AS s ON (ma.ROWID = s.attachment_id) WHERE m.ROWID = %d AND s.attachment_id IS NULL AND ma.attachment IS NOT NULL"), objc_msgSend(v3, "intValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "preparedStatementForQueryString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForMessageWithIdentifier___block_invoke;
    v15[3] = &unk_1E949AF78;
    v8 = v6;
    v16 = v8;
    v14 = 0;
    v9 = objc_msgSend(v7, "executeUsingBlock:error:", v15, &v14);
    v10 = v14;
    if ((v9 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v10, CFSTR("Searching for attachment data for message identifier"));
    v11 = v16;
    v12 = v8;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  EDPersistedAttachmentID *v3;
  void *v4;
  EDPersistedAttachmentID *v5;
  EDPersistedMessageID *v6;
  void *v7;
  EDPersistedMessageID *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  EDSearchableIndexPersistenceAttachmentDatum *v15;
  id v16;

  v16 = a2;
  v3 = [EDPersistedAttachmentID alloc];
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDPersistedAttachmentID initWithDatabaseID:](v3, "initWithDatabaseID:", objc_msgSend(v4, "databaseIDValue"));

  v6 = [EDPersistedMessageID alloc];
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDPersistedMessageID initWithDatabaseID:](v6, "initWithDatabaseID:", objc_msgSend(v7, "databaseIDValue"));

  objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndexedSubscript:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "databaseIDValue");

  v15 = -[EDSearchableIndexPersistenceAttachmentDatum initWithAttachmentPersistentID:messagePersistentID:attachmentID:name:mailboxID:]([EDSearchableIndexPersistenceAttachmentDatum alloc], "initWithAttachmentPersistentID:messagePersistentID:attachmentID:name:mailboxID:", v5, v8, v10, v12, v14);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

}

- (id)attachmentDataForItemsRequiringIndexingExcludingIDs:(void *)a3 lastProcessedAttachmentID:(uint64_t)a4 limit:(void *)a5 cancelationToken:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ma.ROWID, m.ROWID, ma.mime_part_number, ma.name, m.mailbox FROM messages AS m LEFT OUTER JOIN message_attachments AS ma ON (ma.global_message_id = m.global_message_id) LEFT OUTER JOIN searchable_attachments AS s ON (ma.ROWID = s.attachment_id) WHERE ma.ROWID > %lld AND s.attachment_id IS NULL AND ma.attachment IS NOT NULL ORDER BY m.ROWID"), objc_msgSend(v10, "databaseID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "preparedStatementForQueryString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __166__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForItemsRequiringIndexingExcludingIDs_lastProcessedAttachmentID_limit_cancelationToken___block_invoke;
    v22[3] = &unk_1E94A1040;
    v23 = v11;
    v24 = v9;
    v15 = v13;
    v25 = v15;
    v26 = a4;
    v21 = 0;
    v16 = objc_msgSend(v14, "executeUsingBlock:error:", v22, &v21);
    v17 = v21;
    if ((v16 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v17, CFSTR("Searching for attachments to index"));
    v18 = v25;
    v19 = v15;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __166__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForItemsRequiringIndexingExcludingIDs_lastProcessedAttachmentID_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  EDPersistedAttachmentID *v6;
  void *v7;
  EDPersistedAttachmentID *v8;
  EDPersistedMessageID *v9;
  void *v10;
  EDPersistedMessageID *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  EDSearchableIndexPersistenceAttachmentDatum *v18;
  id v19;

  v19 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    *a4 = 1;
  }
  else
  {
    v6 = [EDPersistedAttachmentID alloc];
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDPersistedAttachmentID initWithDatabaseID:](v6, "initWithDatabaseID:", objc_msgSend(v7, "databaseIDValue"));

    if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
    {
      v9 = [EDPersistedMessageID alloc];
      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[EDPersistedMessageID initWithDatabaseID:](v9, "initWithDatabaseID:", objc_msgSend(v10, "databaseIDValue"));

      objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "objectAtIndexedSubscript:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "databaseIDValue");

      v18 = -[EDSearchableIndexPersistenceAttachmentDatum initWithAttachmentPersistentID:messagePersistentID:attachmentID:name:mailboxID:]([EDSearchableIndexPersistenceAttachmentDatum alloc], "initWithAttachmentPersistentID:messagePersistentID:attachmentID:name:mailboxID:", v8, v11, v13, v15, v17);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 56))
        *a4 = 1;

    }
  }

}

- (id)identifiersForAttachmentsWithQuery:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "preparedStatementForQueryString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__identifiersForAttachmentsWithQuery___block_invoke;
    v13[3] = &unk_1E949AF78;
    v6 = v4;
    v14 = v6;
    v12 = 0;
    v7 = objc_msgSend(v5, "executeUsingBlock:error:", v13, &v12);
    v8 = v12;
    if ((v7 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v8, CFSTR("searching for removed attachment identifiers"));
    v9 = v14;
    v10 = v6;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__identifiersForAttachmentsWithQuery___block_invoke(uint64_t a1, void *a2)
{
  EDPersistedAttachmentID *v3;
  void *v4;
  EDPersistedAttachmentID *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = [EDPersistedAttachmentID alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDPersistedAttachmentID initWithDatabaseID:](v3, "initWithDatabaseID:", objc_msgSend(v4, "databaseIDValue"));

  +[EDSearchableIndexAttachmentItem identifierForAttachmentPersistentID:](EDSearchableIndexAttachmentItem, "identifierForAttachmentPersistentID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (id)selectAttachmentIdentifiersForTransactions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT attachment_id FROM searchable_attachments WHERE transaction_id in (%@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabaseConnection identifiersForAttachmentsWithQuery:](a1, v6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (id)selectAttachmentIdentifiersForMessages:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "ef_filter:", &__block_literal_global_67);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT attachment_id FROM searchable_attachments WHERE message_id IN (%@)"), v7);
    objc_msgSend(a1, "preparedStatementForQueryString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectAttachmentIdentifiersForMessages___block_invoke_2;
    v17[3] = &unk_1E949AF78;
    v10 = v5;
    v18 = v10;
    v16 = 0;
    v11 = objc_msgSend(v9, "executeUsingBlock:error:", v17, &v16);
    v12 = v16;
    if ((v11 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v12, CFSTR("searching for child attachment identifiers"));
    v13 = v18;
    v14 = v10;

  }
  else
  {
    v14 = 0;
    v6 = v3;
  }

  return v14;
}

BOOL __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectAttachmentIdentifiersForMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:](EDSearchableIndexAttachmentItem, "attachmentPersistentIDFromItemIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectAttachmentIdentifiersForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  EDPersistedAttachmentID *v3;
  void *v4;
  EDPersistedAttachmentID *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = [EDPersistedAttachmentID alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDPersistedAttachmentID initWithDatabaseID:](v3, "initWithDatabaseID:", objc_msgSend(v4, "databaseIDValue"));

  +[EDSearchableIndexAttachmentItem identifierForAttachmentPersistentID:](EDSearchableIndexAttachmentItem, "identifierForAttachmentPersistentID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (id)assignIndexedAttachmentItems:(uint64_t)a3 transaction:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[3];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v29 = a1;
  if (!a1)
  {
    v28 = 0;
    goto LABEL_18;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v28 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_18;
  }
  v26 = v6;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO searchable_attachments (attachment_id, attachment, message_id, transaction_id) VALUES (?, ?, ?, %lld)"), a3);
  objc_msgSend(a1, "preparedStatementForQueryString:", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v8)
    goto LABEL_16;
  v32 = *(_QWORD *)v35;
  v30 = *MEMORY[0x1E0D1EE10];
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v35 != v32)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "attachmentID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "databaseID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "messageID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "databaseID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = v13;
      v38[1] = v13;
      v38[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v18 = objc_msgSend(v7, "executeWithIndexedBindings:usingBlock:error:", v17, 0, &v33);
      v19 = v33;
      v20 = v19;
      if ((v18 & 1) == 0)
      {
        objc_msgSend(v19, "domain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v30))
        {
          v22 = objc_msgSend(v20, "code") == 19;

          if (v22)
          {
            objc_msgSend(v10, "attachmentID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[EDSearchableIndexAttachmentItem identifierForAttachmentPersistentID:](EDSearchableIndexAttachmentItem, "identifierForAttachmentPersistentID:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v24);

            goto LABEL_14;
          }
        }
        else
        {

        }
        objc_msgSend(v29, "handleError:message:", v20, CFSTR("Adding to searchable_attachments"));
      }
LABEL_14:
      objc_msgSend(v7, "clearBindingsWithError:", 0);
      objc_msgSend(v7, "resetWithError:", 0);

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  }
  while (v8);
LABEL_16:

  v6 = v26;
LABEL_18:

  return v28;
}

- (void)deleteAttachmentsAfterTransaction:(void *)a1
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  if (a1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_attachments WHERE transaction_id > %llu"), a2);
    objc_msgSend(a1, "preparedStatementForQueryString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = objc_msgSend(v4, "executeUsingBlock:error:", 0, &v7);
    v6 = v7;
    if ((v5 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v6, CFSTR("Invalidating searchable_attachments"));

  }
}

- (void)deleteAttachmentsInTransactions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_attachments WHERE transaction_id IN (%@)"), v5);
    objc_msgSend(a1, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v8 = objc_msgSend(v7, "executeUsingBlock:error:", 0, &v10);
    v9 = v10;
    if ((v8 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v9, CFSTR("Failed to delete messages for items in searchable_attachments"));

  }
}

- (void)deleteAttachmentsForMessage:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_attachments WHERE message_id = %@"), v3);
    objc_msgSend(a1, "preparedStatementForQueryString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v6 = objc_msgSend(v5, "executeUsingBlock:error:", 0, &v8);
    v7 = v8;
    if ((v6 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v7, CFSTR("Removing message identifier from searchable_attachments"));

  }
}

- (id)selectIdentifiersForDeletedAttachments
{
  if (a1)
  {
    -[EDPersistenceDatabaseConnection identifiersForAttachmentsWithQuery:](a1, CFSTR("SELECT attachment_id FROM searchable_attachments WHERE attachment is NULL"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)selectTransactionAndIndexTypeForMessage:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT transaction_id, reindex_type FROM searchable_messages WHERE message_id = %@"), v3);
    objc_msgSend(a1, "preparedStatementForQueryString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__30;
    v15 = __Block_byref_object_dispose__30;
    v16 = 0;
    v9 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTransactionAndIndexTypeForMessage___block_invoke;
    v10[3] = &unk_1E949B090;
    v10[4] = &v11;
    v6 = objc_msgSend(v5, "executeUsingBlock:error:", v10, &v9);
    v7 = v9;
    if ((v6 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v7, CFSTR("Searching for reindex type"));
    a1 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

void __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTransactionAndIndexTypeForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D1EF38]);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "initWithFirst:second:", v5, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)selectMessageIdentifiersForTransactions:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rowid FROM searchable_messages WHERE transaction_id IN (%@)"), v5);
    objc_msgSend(a1, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIdentifiersForTransactions___block_invoke;
    v15[3] = &unk_1E949AF78;
    v8 = v4;
    v16 = v8;
    v14 = 0;
    v9 = objc_msgSend(v7, "executeUsingBlock:error:", v15, &v14);
    v10 = v14;
    if ((v9 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v10, CFSTR("Failed to get messages for transaction ids in searchable_messages"));
    v11 = v16;
    v12 = v8;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIdentifiersForTransactions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)deleteMessagesAfterTransaction:(void *)a1
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  if (a1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_messages WHERE transaction_id > %llu"), a2);
    objc_msgSend(a1, "preparedStatementForQueryString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = objc_msgSend(v4, "executeUsingBlock:error:", 0, &v7);
    v6 = v7;
    if ((v5 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v6, CFSTR("Invalidating searchable_messages"));

  }
}

- (void)deleteMessagesInTransactions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_messages WHERE transaction_id IN (%@)"), v5);
    objc_msgSend(a1, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v8 = objc_msgSend(v7, "executeUsingBlock:error:", 0, &v10);
    v9 = v10;
    if ((v8 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v9, CFSTR("Failed to delete messages for items in searchable_messages"));

  }
}

- (id)selectIdentifiersForDeletedMessages
{
  id v2;
  void *v3;
  id v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[4];
  id v12;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "preparedStatementForQueryString:", CFSTR("SELECT message_id FROM searchable_messages WHERE message is NULL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForDeletedMessages__block_invoke;
  v11[3] = &unk_1E949AF78;
  v4 = v2;
  v12 = v4;
  v10 = 0;
  v5 = objc_msgSend(v3, "executeUsingBlock:error:", v11, &v10);
  v6 = v10;
  if ((v5 & 1) == 0)
    objc_msgSend(a1, "handleError:message:", v6, CFSTR("searching for removed identifiers"));
  v7 = v12;
  v8 = v4;

  return v8;
}

void __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForDeletedMessages__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (id)selectMessageIDsFromBacklogWithBatchSize:(void *)a1
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT message_id FROM searchable_rebuild LIMIT %ld"), a2);
  objc_msgSend(a1, "preparedStatementForQueryString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIDsFromBacklogWithBatchSize___block_invoke;
  v14[3] = &unk_1E949AF78;
  v7 = v4;
  v15 = v7;
  v13 = 0;
  v8 = objc_msgSend(v6, "executeUsingBlock:error:", v14, &v13);
  v9 = v13;
  if ((v8 & 1) == 0)
    objc_msgSend(a1, "handleError:message:", v9, CFSTR("Could not select message_id from searchable_rebuild table"));
  v10 = v15;
  v11 = v7;

  return v11;
}

void __106__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIDsFromBacklogWithBatchSize___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)selectIsReindexing
{
  _BOOL8 v1;
  id v2;
  void *v3;
  id v4;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D1F040]);
    v3 = (void *)objc_msgSend(v2, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("searchable_rebuild"));
    objc_msgSend(v3, "setLimit:", 1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v6 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIsReindexing__block_invoke;
    v7[3] = &unk_1E949B090;
    v7[4] = &v8;
    objc_msgSend((id)v1, "executeSelectStatement:withBlock:error:", v3, v7, &v6);
    v4 = v6;
    if (v4)
      objc_msgSend((id)v1, "handleError:message:", v4, CFSTR("Failed to query searchable_rebuild table to establish if it still has data"));
    v1 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);

  }
  return v1;
}

uint64_t __83__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIsReindexing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)selectIdentifiersForTombstonesOfType:(void *)a1
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT identifier FROM searchable_message_tombstones WHERE transaction_id IS NULL AND type = %lld"), a2);
  objc_msgSend(a1, "preparedStatementForQueryString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForTombstonesOfType___block_invoke;
  v14[3] = &unk_1E949AF78;
  v7 = v4;
  v15 = v7;
  v13 = 0;
  v8 = objc_msgSend(v6, "executeUsingBlock:error:", v14, &v13);
  v9 = v13;
  if ((v8 & 1) == 0)
    objc_msgSend(a1, "handleError:message:", v9, CFSTR("searching for tombstone identifiers"));
  v10 = v15;
  v11 = v7;

  return v11;
}

void __102__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForTombstonesOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (id)selectTombstoneIdentifiersForTransactions:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rowid FROM searchable_message_tombstones WHERE transaction_id IN (%@)"), v5);
    objc_msgSend(a1, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __107__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTombstoneIdentifiersForTransactions___block_invoke;
    v15[3] = &unk_1E949AF78;
    v8 = v4;
    v16 = v8;
    v14 = 0;
    v9 = objc_msgSend(v7, "executeUsingBlock:error:", v15, &v14);
    v10 = v14;
    if ((v9 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v10, CFSTR("Failed to get messages for transaction ids in searchable_message_tombstones"));
    v11 = v16;
    v12 = v8;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __107__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTombstoneIdentifiersForTransactions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)addTombstonesForIdentifiers:(uint64_t)a3 type:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1 && objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO searchable_message_tombstones (type, identifier) VALUES (%lld, ?)"), a3);
    objc_msgSend(a1, "preparedStatementForQueryString:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v21 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0;
          v13 = objc_msgSend(v7, "executeWithIndexedBindings:usingBlock:error:", v12, 0, &v16);
          v14 = v16;

          if ((v13 & 1) == 0)
            objc_msgSend(a1, "handleError:message:", v14, CFSTR("Adding to searchable_message_tombstones index"));
          objc_msgSend(v7, "clearBindingsWithError:", 0);
          objc_msgSend(v7, "resetWithError:", 0);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

  }
}

- (void)assignTombstonesForIdentifiers:(uint64_t)a3 type:(uint64_t)a4 transaction:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = v7;
  if (a1 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "ef_mapSelector:", sel_ef_quotedSQLEscapedString);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 < 0)
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_message_tombstones WHERE type = %lld AND identifier IN (%@)"), a3, v10);
    else
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE searchable_message_tombstones SET transaction_id = %lld WHERE type = %lld AND identifier IN (%@)"), a4, a3, v10);
    v12 = (void *)v11;
    objc_msgSend(a1, "preparedStatementForQueryString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v14 = objc_msgSend(v13, "executeUsingBlock:error:", 0, &v16);
    v15 = v16;
    if ((v14 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v15, CFSTR("Updating or deleting searchable_message_tombstones"));

  }
}

- (void)clearTransactionsForTombstonesAfterTransaction:(void *)a1
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  if (a1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE searchable_message_tombstones SET transaction_id = NULL WHERE transaction_id > %lld"), a2);
    objc_msgSend(a1, "preparedStatementForQueryString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = objc_msgSend(v4, "executeUsingBlock:error:", 0, &v7);
    v6 = v7;
    if ((v5 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v6, CFSTR("Invalidating searchable_message_tombstones"));

  }
}

- (void)deleteTombstonesBeforeTransaction:(void *)a1
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  if (a1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_message_tombstones WHERE transaction_id < %lld"), a2);
    objc_msgSend(a1, "preparedStatementForQueryString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = objc_msgSend(v4, "executeUsingBlock:error:", 0, &v7);
    v6 = v7;
    if ((v5 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v6, CFSTR("Purging searchable_message_tombstones"));

  }
}

- (void)deleteTombstonesInTransactions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_message_tombstones WHERE transaction_id IN (%@)"), v5);
    objc_msgSend(a1, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v8 = objc_msgSend(v7, "executeUsingBlock:error:", 0, &v10);
    v9 = v10;
    if ((v8 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v9, CFSTR("Failed to delete messages for items in searchable_message_tombstones"));

  }
}

- (id)selectDistinctTransactionIDs
{
  id v1;
  id v2;
  void *v3;
  id v4;
  char v5;
  id v6;
  id v8;
  _QWORD v9[4];
  id v10;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v1, "preparedStatementForQueryString:", CFSTR("SELECT DISTINCT transaction_id FROM searchable_messages"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectDistinctTransactionIDs__block_invoke;
    v9[3] = &unk_1E949AF78;
    v4 = v2;
    v10 = v4;
    v8 = 0;
    v5 = objc_msgSend(v3, "executeUsingBlock:error:", v9, &v8);
    v6 = v8;
    if ((v5 & 1) == 0)
      objc_msgSend(v1, "handleError:message:", v6, CFSTR("Searching for distinct transaction identifiers"));
    v1 = (id)objc_msgSend(v4, "copy");

  }
  return v1;
}

void __93__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectDistinctTransactionIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "longLongValue") >= 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)richLinkDataForItemsRequiringIndexingExcludingIdentifiers:(uint64_t)a3 limit:(void *)a4 cancelationToken:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT m.ROWID, mr.rich_link, m.mailbox, r.title, r.url FROM message_rich_links AS mr LEFT OUTER JOIN messages AS m ON (m.global_message_id = mr.global_message_id) LEFT OUTER JOIN rich_links AS r ON (r.ROWID = mr.rich_link) LEFT OUTER JOIN searchable_rich_links AS s ON (m.ROWID = s.message_id) WHERE s.rich_link_id IS NULL ORDER BY m.ROWID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "preparedStatementForQueryString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __146__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__richLinkDataForItemsRequiringIndexingExcludingIdentifiers_limit_cancelationToken___block_invoke;
    v19[3] = &unk_1E94A1040;
    v20 = v7;
    v12 = v10;
    v21 = v12;
    v23 = a3;
    v22 = v8;
    v18 = 0;
    v13 = objc_msgSend(v11, "executeUsingBlock:error:", v19, &v18);
    v14 = v18;
    if ((v13 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v14, CFSTR("Searching for rich links requiring indexing"));
    v15 = v22;
    v16 = v12;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __146__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__richLinkDataForItemsRequiringIndexingExcludingIdentifiers_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  EDPersistedMessageID *v6;
  void *v7;
  EDPersistedMessageID *v8;
  EDPersistedRichLinkID *v9;
  void *v10;
  EDPersistedRichLinkID *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  EDSearchableIndexPersistenceRichLinkDatum *v21;
  id v22;

  v22 = a2;
  v6 = [EDPersistedMessageID alloc];
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDPersistedMessageID initWithDatabaseID:](v6, "initWithDatabaseID:", objc_msgSend(v7, "databaseIDValue"));

  v9 = [EDPersistedRichLinkID alloc];
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDPersistedRichLinkID initWithDatabaseID:](v9, "initWithDatabaseID:", objc_msgSend(v10, "databaseIDValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsObject:", v11),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "databaseIDValue");

    objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "objectAtIndexedSubscript:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[EDSearchableIndexPersistenceRichLinkDatum initWithMessageID:richLinkID:mailboxID:title:url:]([EDSearchableIndexPersistenceRichLinkDatum alloc], "initWithMessageID:richLinkID:mailboxID:title:url:", v8, v11, v16, v18, v20);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56)
      || objc_msgSend(*(id *)(a1 + 48), "isCanceled"))
    {
      *a4 = 1;
    }

  }
}

- (id)assignIndexedRichLinkItems:(uint64_t)a3 transaction:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v29 = a1;
  v27 = v5;
  if (!a1)
  {
    v28 = 0;
    goto LABEL_18;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v28 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_18;
  }
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO searchable_rich_links (rich_link, message_id, transaction_id) VALUES (?, ?, %lld)"), a3);
  objc_msgSend(a1, "preparedStatementForQueryString:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v27;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v7)
    goto LABEL_16;
  v32 = *(_QWORD *)v35;
  v30 = *MEMORY[0x1E0D1EE10];
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v35 != v32)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "richLinkID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "databaseID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "messageID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v14, "databaseID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = v12;
      v38[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v17 = objc_msgSend(v6, "executeWithIndexedBindings:usingBlock:error:", v16, 0, &v33);
      v18 = v33;
      v19 = v18;
      if ((v17 & 1) == 0)
      {
        objc_msgSend(v18, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", v30))
        {
          v21 = objc_msgSend(v19, "code") == 19;

          if (v21)
          {
            objc_msgSend(v9, "messageID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "richLinkID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[EDSearchableIndexRichLinkItem identifierForMessageID:richLinkID:](EDSearchableIndexRichLinkItem, "identifierForMessageID:richLinkID:", v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v24);

            goto LABEL_14;
          }
        }
        else
        {

        }
        objc_msgSend(v29, "handleError:message:", v19, CFSTR("Adding to searchable_rich_links"));
      }
LABEL_14:
      objc_msgSend(v6, "clearBindingsWithError:", 0);
      objc_msgSend(v6, "resetWithError:", 0);

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  }
  while (v7);
LABEL_16:

LABEL_18:
  return v28;
}

- (void)deleteRichLinksInTransactions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_rich_links WHERE transaction_id IN (%@)"), v5);
    objc_msgSend(a1, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v8 = objc_msgSend(v7, "executeUsingBlock:error:", 0, &v10);
    v9 = v10;
    if ((v8 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v9, CFSTR("Failed to delete messages for items in searchable_rich_links"));

  }
}

- (void)addAllMessagesToRebuildTable
{
  void *v2;
  char v3;
  id v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO searchable_rebuild (message_id) SELECT ROWID FROM messages ORDER BY date_received DESC"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v3 = objc_msgSend(v2, "executeUsingBlock:error:", 0, &v5);
    v4 = v5;
    if ((v3 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v4, CFSTR("could not populate searchable_rebuild table"));

  }
}

- (void)clearReferencesToMissingSearchableMessages
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("searchable_message"));

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("message_id"), CFSTR("searchable_messages"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("searchable_message"));
    objc_msgSend(v5, "notIn:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWhereClause:", v6);

    v8 = 0;
    objc_msgSend(v1, "executeUpdateStatement:rowsChanged:", v2, &v8);
    v1 = v8;

  }
  return v1;
}

- (void)clearReferencesToSearchableMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;

  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("searchable_message"));

    objc_msgSend(v2, "queryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "preparedStatementForQueryString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v6 = objc_msgSend(v5, "executeUsingBlock:error:", 0, &v8);
    v7 = v8;
    if ((v6 & 1) == 0)
      objc_msgSend(a1, "handleError:message:", v7, CFSTR("Clearing searchable_message column"));

  }
}

- (void)emptyAllSearchableIndexTables
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id obj;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[8];

  v18[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v18[0] = CFSTR("searchable_messages");
    v18[1] = CFSTR("searchable_message_tombstones");
    v18[2] = CFSTR("searchable_attachments");
    v18[3] = CFSTR("searchable_rich_links");
    v18[4] = CFSTR("searchable_data_detection_results");
    v18[5] = CFSTR("searchable_rebuild");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v2)
    {
      v3 = *(_QWORD *)v14;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v14 != v3)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v4);
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@"), v5);
          objc_msgSend(a1, "preparedStatementForQueryString:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v8 = objc_msgSend(v7, "executeUsingBlock:error:", 0, &v12);
          v9 = v12;
          if ((v8 & 1) == 0)
          {
            v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Purging %@"), v5);
            objc_msgSend(a1, "handleError:message:", v9, v10);

          }
          ++v4;
        }
        while (v2 != v4);
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v2);
    }

  }
}

- (void)removeIndexedIdentifiers:(void *)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  if (a1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = v23;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:](EDSearchableIndexAttachmentItem, "attachmentPersistentIDFromItemIdentifier:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "stringValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
          else
          {
            objc_msgSend(v3, "addObject:", v9);
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_messages WHERE message_id IN (%@)"), v13);
      objc_msgSend(a1, "preparedStatementForQueryString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v16 = objc_msgSend(v15, "executeUsingBlock:error:", 0, &v25);
      v17 = v25;
      if ((v16 & 1) == 0)
        objc_msgSend(a1, "handleError:message:", v17, CFSTR("Removing items from searchable_messages"));

    }
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM searchable_attachments WHERE attachment_id IN (%@)"), v18);
      objc_msgSend(a1, "preparedStatementForQueryString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v21 = objc_msgSend(v20, "executeUsingBlock:error:", 0, &v24);
      v22 = v24;
      if ((v21 & 1) == 0)
        objc_msgSend(a1, "handleError:message:", v22, CFSTR("Removing items from searchable_attachments"));

    }
  }

}

- (id)messageIDTransactionIDDictionaryToVerifyWithCount:(uint64_t)a3 lastVerifiedMessageID:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;

  if (!a1)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT message_id, transaction_id FROM searchable_messages WHERE reindex_type = 0 AND message IS NOT NULL AND message_id > %lu LIMIT %lu"), a3, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preparedStatementForQueryString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __137__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__messageIDTransactionIDDictionaryToVerifyWithCount_lastVerifiedMessageID___block_invoke;
  v16[3] = &unk_1E949AF78;
  v9 = v6;
  v17 = v9;
  v15 = 0;
  v10 = objc_msgSend(v8, "executeUsingBlock:error:", v16, &v15);
  v11 = v15;
  if ((v10 & 1) == 0)
    objc_msgSend(a1, "handleError:message:", v11, CFSTR("Searching for random sample of messages to verify for spotlight integrity"));
  v12 = v17;
  v13 = v9;

  return v13;
}

void __137__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__messageIDTransactionIDDictionaryToVerifyWithCount_lastVerifiedMessageID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);
}

- (void)performWithOptions:transactionError:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Non-transactional database block failed on connection %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)performWithOptions:transactionError:block:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Nested database block failed on connection %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)performWithOptions:transactionError:block:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v0, v1, "Outer database block failed on connection %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)performWithOptions:(uint64_t)a3 transactionError:(NSObject *)a4 block:.cold.4(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to begin transaction on connection %{public}@: %{public}@", (uint8_t *)a3, a4);

}

- (void)_startTransactionWithSQLConnection:(_QWORD *)a1 options:error:.cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v1, v2, "Read Transaction (generation: %lld) on connection %{public}@ started successfully", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_startTransactionWithSQLConnection:(_QWORD *)a1 options:error:.cold.2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v1, v2, "Write Transaction (generation: %lld) on connection %{public}@ started successfully", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_startTransactionWithSQLConnection:options:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "Read Transaction (generation: ignored) on connection %{public}@ started successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startTransactionWithSQLConnection:options:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "Write Transaction (generation: ignored) on connection %{public}@ started successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_finishTransactionWithSQLConnection:(uint64_t)a1 afterSuccess:transactionError:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v1, v2, "Transaction on connection %{public}@ %{public}@ succeeded", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_finishTransactionWithSQLConnection:(uint64_t)a3 afterSuccess:(NSObject *)a4 transactionError:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Rolling back transaction on connection %{public}@ %{public}@", (uint8_t *)a2, a4);
}

- (void)_storeTransactionWriteGenerationWithSQLConnection:(NSObject *)a3 newGeneration:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Unable to increment transaction generation: %{public}@", (uint8_t *)a2);

}

- (void)_attachDatabaseWithName:(uint64_t)a1 url:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v1, v2, "Attaching database '%{public}@' at URL %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

@end
