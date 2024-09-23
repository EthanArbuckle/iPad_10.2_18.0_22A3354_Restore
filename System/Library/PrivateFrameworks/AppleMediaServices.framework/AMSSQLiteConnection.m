@implementation AMSSQLiteConnection

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  AMSSQLitePreparedStatement *v12;
  id v14;
  id v15;

  v6 = a3;
  v15 = 0;
  v7 = -[AMSSQLiteConnection _openWithError:](self, "_openWithError:", &v15);
  v8 = v15;
  v9 = v8;
  if (!v7)
  {
    v12 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  v14 = v8;
  -[AMSSQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v6, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;

  if (v10)
  {
    v12 = -[AMSSQLitePreparedStatement initWithConnection:SQL:]([AMSSQLitePreparedStatement alloc], "initWithConnection:SQL:", self, v6);
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v10, v12);
  }
  else
  {
    v12 = 0;
  }

  v9 = v11;
  if (a4)
  {
LABEL_8:
    if (!v12)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_10:

  return v12;
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  id v15;
  id v16;

  v8 = (void (**)(id, void *))a5;
  v16 = 0;
  -[AMSSQLiteConnection _verifiedStatementForPreparedStatement:error:](self, "_verifiedStatementForPreparedStatement:error:", a3, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9 && !v10)
  {
    if (v8)
      v8[2](v8, v9);
    v15 = 0;
    v12 = -[AMSSQLiteConnection _executeStatement:error:](self, "_executeStatement:error:", v9, &v15);
    v13 = v15;
    if (v13)
    {
      v11 = v13;
      if (!a4)
        goto LABEL_16;
      goto LABEL_14;
    }
    if (v8)
      objc_msgSend(v9, "clearBindings");
LABEL_13:
    objc_msgSend(v9, "reset");
    v11 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_14;
  }
  v12 = 0;
  if (!v10)
    goto LABEL_13;
  if (!a4)
    goto LABEL_16;
LABEL_14:
  if (!v12)
    *a4 = objc_retainAutorelease(v11);
LABEL_16:

  return v12;
}

- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v15;
  id v16;

  v6 = a3;
  if ((AMSSQLiteConnection *)objc_msgSend(v6, "connectionPointer") != self)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Statement from a different connection"));
    v7 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_14;
  }
  v16 = 0;
  v9 = -[AMSSQLiteConnection _openWithError:](self, "_openWithError:", &v16);
  v10 = v16;
  v8 = v10;
  if (!v9)
  {
    v7 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_14;
  }
  v15 = v10;
  -[AMSSQLiteConnection _statementForPreparedStatement:error:](self, "_statementForPreparedStatement:error:", v6, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v11)
  {
    if (-[AMSSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
      && (objc_msgSend(v11, "isReadOnly") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E2562A20, -7701, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v12 = (id)v13;
    }
    else
    {
      v7 = v11;
    }
  }
  else
  {
    v7 = 0;
  }

  v8 = v12;
  if (a4)
  {
LABEL_14:
    if (!v7)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_16:

  return v7;
}

- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "SQL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[AMSSQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v10, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v8)
    {
      -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v8, v6);
    }
    else if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v8 = 0;
      *a4 = v9;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)performTransaction:(id)a3
{
  int64_t transactionDepth;
  int v5;
  int64_t v6;
  int64_t v7;
  const __CFString *v8;
  uint64_t (**v9)(void);

  v9 = (uint64_t (**)(void))a3;
  transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (!-[AMSSQLiteConnection executeStatement:error:](self, "executeStatement:error:", CFSTR("BEGIN DEFERRED TRANSACTION"), 0))goto LABEL_12;
    self->_transactionDepth = 1;
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_transactionDepth = transactionDepth + 1;
  }
  v5 = v9[2]() ^ 1;
  v6 = self->_transactionDepth;
  if (self->_transactionWantsRollback)
    v5 = 1;
  self->_transactionWantsRollback = v5;
  v7 = v6 - 1;
  self->_transactionDepth = v7;
  if (!v7)
  {
    if (v5)
      v8 = CFSTR("ROLLBACK TRANSACTION");
    else
      v8 = CFSTR("COMMIT TRANSACTION");
    -[AMSSQLiteConnection executeStatement:error:](self, "executeStatement:error:", v8, 0);
    -[AMSSQLiteConnection _flushAfterTransactionBlocks](self, "_flushAfterTransactionBlocks");
  }
LABEL_12:

}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return -[AMSSQLiteConnection executeStatement:error:bindings:](self, "executeStatement:error:bindings:", a3, a4, 0);
}

- (void)_flushAfterTransactionBlocks
{
  NSMutableArray *afterTransactionBlocks;
  void *v4;
  NSMutableArray *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  afterTransactionBlocks = self->_afterTransactionBlocks;
  if (afterTransactionBlocks)
  {
    v4 = (void *)-[NSMutableArray copy](afterTransactionBlocks, "copy");
    v5 = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AMSSQLiteConnection__flushAfterTransactionBlocks__block_invoke;
    block[3] = &unk_1E253DBD8;
    v9 = v4;
    v7 = v4;
    dispatch_async(v6, block);

  }
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6;
  void (**v7)(id, AMSSQLiteQueryResults *, id);
  void *v8;
  id v9;
  AMSSQLitePreparedStatement *v10;
  AMSSQLiteQueryResults *v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, AMSSQLiteQueryResults *, id))a4;
  v12 = 0;
  -[AMSSQLiteConnection _verifiedStatementForSQL:error:](self, "_verifiedStatementForSQL:error:", v6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = -[AMSSQLitePreparedStatement initWithConnection:SQL:]([AMSSQLitePreparedStatement alloc], "initWithConnection:SQL:", self->_database, v6);
  if (v10)
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v8, v10);
  if (v8)
    v11 = -[AMSSQLiteQueryResults initWithStatement:]([AMSSQLiteQueryResults alloc], "initWithStatement:", v8);
  else
    v11 = 0;
  v7[2](v7, v11, v9);
  objc_msgSend(v8, "finalizeStatement");
  if (v10)
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v10);

}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  void *v10;
  id v11;
  AMSSQLitePreparedStatement *v12;
  BOOL v13;
  id v14;
  id v16;
  id v17;

  v8 = (void (**)(id, void *))a5;
  v17 = 0;
  v9 = a3;
  -[AMSSQLiteConnection _verifiedStatementForSQL:error:](self, "_verifiedStatementForSQL:error:", v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = -[AMSSQLitePreparedStatement initWithConnection:SQL:]([AMSSQLitePreparedStatement alloc], "initWithConnection:SQL:", self->_database, v9);

  if (v12)
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v10, v12);
  if (!v10)
  {
    v13 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  if (v8)
    v8[2](v8, v10);
  v16 = v11;
  v13 = -[AMSSQLiteConnection _executeStatement:error:](self, "_executeStatement:error:", v10, &v16);
  v14 = v16;

  objc_msgSend(v10, "finalizeStatement");
  if (v12)
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v12);
  v11 = v14;
  if (a4)
  {
LABEL_11:
    if (!v13)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_13:

  return v13;
}

- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v15;
  id v16;

  v6 = a3;
  v16 = 0;
  v7 = -[AMSSQLiteConnection _openWithError:](self, "_openWithError:", &v16);
  v8 = v16;
  v9 = v8;
  if (!v7)
  {
    v12 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v15 = v8;
  -[AMSSQLiteConnection _prepareStatement:error:](self, "_prepareStatement:error:", v6, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
  {
    if (-[AMSSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly")
      && (objc_msgSend(v10, "isReadOnly") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E2562A20, -7701, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "finalizeStatement");
      v12 = 0;
      v11 = (id)v13;
    }
    else
    {
      v12 = v10;
    }
  }
  else
  {
    v12 = 0;
  }

  v9 = v11;
  if (a4)
  {
LABEL_11:
    if (!v12)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_13:

  return v12;
}

- (BOOL)_openWithError:(id *)a3
{
  return -[AMSSQLiteConnection _openAndAllowRetry:error:](self, "_openAndAllowRetry:error:", 1, a3);
}

- (BOOL)_openAndAllowRetry:(BOOL)a3 error:(id *)a4
{
  char v4;
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  AMSSQLiteConnectionOptions *options;
  uint8_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  sqlite3 *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = 1;
  if (!self->_database)
  {
    v5 = a3;
    v7 = 0;
    v31 = 0;
    v8 = 67111936;
    v9 = 1;
    do
    {
      v10 = v9;
      v11 = v7;
      *(_DWORD *)buf = 0;
      options = self->_options;
      v30 = v7;
      v4 = AMSSQLiteOpen(options, &v31, buf, &v30);
      v7 = v30;

      if ((v4 & 1) != 0)
      {
        self->_database = v31;
        goto LABEL_28;
      }
      v13 = buf[0];
      if (!*(_DWORD *)buf)
      {
        objc_msgSend(v7, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", 0x1E2562A40);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "userInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", 0x1E2562A40);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v17, "longLongValue");

        }
        else
        {
          v13 = 1;
        }

        v8 = 67111936;
      }
      if (!v5)
        break;
      if (v13 > 0x1Au || ((1 << v13) & 0x4000C00) == 0)
        break;
      if (!-[AMSSQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError"))
        break;
      v9 = 0;
    }
    while ((v10 & 1) != 0);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = objc_opt_class();
      v24 = v23;
      if (v21)
      {
        AMSLogKey();
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v8);
      }
      else
      {
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSQLiteConnectionOptions databasePath](self->_options, "databasePath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v25;
      v34 = 2114;
      v35 = v27;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error opening database. path = %{public}@ | error = %@", buf, 0x20u);

      if (v21)
      {

        v25 = (void *)v8;
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v7);
LABEL_28:

  }
  return v4;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__AMSSQLiteConnection__executeStatement_error___block_invoke;
  v10[3] = &unk_1E2545970;
  v7 = v6;
  v11 = v7;
  v8 = -[AMSSQLiteConnection _executeWithError:usingBlock:](self, "_executeWithError:usingBlock:", a4, v10);
  if (v8)
    objc_msgSend(v7, "reset");

  return v8;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__62;
  v15 = __Block_byref_object_dispose__62;
  v16 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "UTF8String");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__AMSSQLiteConnection__prepareStatement_error___block_invoke;
  v10[3] = &unk_1E2545998;
  v10[5] = &v11;
  v10[6] = v7;
  v10[4] = self;
  -[AMSSQLiteConnection _executeWithError:usingBlock:](self, "_executeWithError:usingBlock:", a4, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4
{
  unsigned __int8 (**v6)(id, uint8_t *);
  BOOL v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  id v13;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned __int8 (**)(id, uint8_t *))a4;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    while (1)
    {
      v9 = (void *)MEMORY[0x18D78A1C4]();
      buf[0] = 0;
      v10 = v6[2](v6, buf);
      if ((v10 - 5) >= 2)
        break;
      if (v8 > 9)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E2562A20, -7702, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      ++v8;
      usleep(0xF4240u);
      v11 = buf[0];
      objc_autoreleasePoolPop(v9);
      if (v11)
      {
        v13 = 0;
        if (!v7)
          goto LABEL_31;
LABEL_30:
        v7 = 1;
        goto LABEL_43;
      }
    }
    if (v10 <= 10)
      break;
    if (v10 <= 99)
    {
      if (v10 != 11 && v10 != 26)
        goto LABEL_28;
LABEL_21:
      AMSSQLiteGetCurrentError(self->_database);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v9);
      -[AMSSQLiteConnection _resetAfterCorruptionError](self, "_resetAfterCorruptionError");
      if (v7)
        goto LABEL_30;
      goto LABEL_31;
    }
    if (v10 != 100)
    {
      if (v10 == 101)
      {
LABEL_27:
        objc_autoreleasePoolPop(v9);
        v13 = 0;
        goto LABEL_30;
      }
LABEL_28:
      AMSSQLiteGetCurrentError(self->_database);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v13 = (id)v15;
      objc_autoreleasePoolPop(v9);
      if (v7)
        goto LABEL_30;
      goto LABEL_31;
    }
    v12 = buf[0];
    objc_autoreleasePoolPop(v9);
    v7 = 1;
    if (v12)
    {
      v13 = 0;
      goto LABEL_43;
    }
  }
  if (!v10)
    goto LABEL_27;
  if (v10 == 8)
    goto LABEL_21;
  if (v10 != 10)
    goto LABEL_28;
  AMSSQLiteGetCurrentError(self->_database);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  -[AMSSQLiteConnection _resetAfterIOError](self, "_resetAfterIOError");
  if (v7)
    goto LABEL_30;
LABEL_31:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    v21 = v20;
    if (v18)
    {
      AMSLogKey();
      self = (AMSSQLiteConnection *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, self);
    }
    else
    {
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v22;
    v27 = 2114;
    v28 = v23;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@Execution error: %{public}@", buf, 0x16u);
    if (v18)
    {

      v22 = self;
    }

  }
  if (a3)
  {
    v13 = objc_retainAutorelease(v13);
    v7 = 0;
    *a3 = v13;
  }
  else
  {
    v7 = 0;
  }
LABEL_43:

  return v7;
}

uint64_t __47__AMSSQLiteConnection__prepareStatement_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  AMSSQLiteStatement *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), *(const char **)(a1 + 48), -1, &ppStmt, 0);
  if (v2 - 100 < 2 || v2 == 0)
  {
    v4 = [AMSSQLiteStatement alloc];
    v5 = -[AMSSQLiteStatement initWithStatement:onConnection:](v4, "initWithStatement:onConnection:", ppStmt, *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t __47__AMSSQLiteConnection__executeStatement_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "step");
}

- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v11;
  id v13;

  v6 = a3;
  v13 = 0;
  -[AMSSQLiteConnection _verifiedStatementForPreparedStatement:error:](self, "_verifiedStatementForPreparedStatement:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    v9 = objc_msgSend(v7, "finalizeStatement");
    if ((v9 - 100) >= 2 && v9 != 0)
    {
      AMSSQLiteGetCurrentError(self->_database);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v11;
    }
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v6);
  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSSQLiteConnection)initWithOptions:(id)a3
{
  id v4;
  AMSSQLiteConnection *v5;
  uint64_t v6;
  AMSSQLiteConnectionOptions *options;
  uint64_t v8;
  NSMapTable *preparedStatements;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSQLiteConnection;
  v5 = -[AMSSQLiteConnection init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (AMSSQLiteConnectionOptions *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSMapTable *)v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSSQLiteConnection _close](self, "_close");
  v3.receiver = self;
  v3.super_class = (Class)AMSSQLiteConnection;
  -[AMSSQLiteConnection dealloc](&v3, sel_dealloc);
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *afterTransactionBlocks;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;

    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_afterTransactionBlocks;
    v9 = _Block_copy(v7);
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6;
  void (**v7)(id, AMSSQLiteQueryResults *, id);
  void *v8;
  id v9;
  AMSSQLiteQueryResults *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, AMSSQLiteQueryResults *, id))a4;
  v11 = 0;
  -[AMSSQLiteConnection _verifiedStatementForPreparedStatement:error:](self, "_verifiedStatementForPreparedStatement:error:", v6, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
    v10 = -[AMSSQLiteQueryResults initWithStatement:]([AMSSQLiteQueryResults alloc], "initWithStatement:", v8);
  else
    v10 = 0;
  v7[2](v7, v10, v9);
  objc_msgSend(v8, "clearBindings");
  objc_msgSend(v8, "reset");

}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return -[AMSSQLiteConnection executePreparedStatement:error:bindings:](self, "executePreparedStatement:error:bindings:", a3, a4, 0);
}

- (int64_t)lastChangeCount
{
  _BOOL4 v3;
  int64_t result;

  v3 = -[AMSSQLiteConnection _openWithError:](self, "_openWithError:", 0);
  result = 0;
  if (v3)
    return sqlite3_changes(self->_database);
  return result;
}

- (BOOL)truncate
{
  BOOL v3;
  int v4;
  int v6;

  if (-[AMSSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly"))
    return 0;
  v3 = 0;
  if (-[AMSSQLiteConnection _openAndAllowRetry:error:](self, "_openAndAllowRetry:error:", 0, 0))
  {
    -[AMSSQLiteConnection _finalizeAllStatements](self, "_finalizeAllStatements");
    v6 = 129;
    v4 = sqlite3_file_control(self->_database, 0, 101, &v6);
    v3 = v4 == 0;
    if (!v4)
    {
      sqlite3_close(self->_database);
      self->_database = 0;
    }
  }
  return v3;
}

- (NSError)currentError
{
  sqlite3 *database;

  database = self->_database;
  if (database)
  {
    AMSSQLiteGetCurrentError(database);
    database = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  }
  return (NSError *)database;
}

- (BOOL)_close
{
  int v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  BOOL result;
  NSMutableArray *afterTransactionBlocks;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_database)
    return 1;
  -[AMSSQLiteConnection _finalizeAllStatements](self, "_finalizeAllStatements");
  v3 = sqlite3_close(self->_database);
  if (v3)
  {
    v4 = v3;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543618;
      v11 = (id)objc_opt_class();
      v12 = 1024;
      v13 = v4;
      v7 = v11;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the database: closeResult=%d", (uint8_t *)&v10, 0x12u);

    }
    return 0;
  }
  else
  {
    afterTransactionBlocks = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    self->_database = 0;
    self->_transactionDepth = 0;
    result = 1;
    self->_transactionWantsRollback = 0;
  }
  return result;
}

- (void)_finalizeAllStatements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_preparedStatements, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "finalizeStatement");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_preparedStatements, "removeAllObjects");
  stmt = sqlite3_next_stmt(self->_database, 0);
  if (stmt)
  {
    v9 = stmt;
    do
    {
      sqlite3_finalize(v9);
      v9 = sqlite3_next_stmt(self->_database, v9);
    }
    while (v9);
  }
}

void __51__AMSSQLiteConnection__flushAfterTransactionBlocks__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)_performResetAfterCorruptionError
{
  AMSSQLiteConnectionDelegate **p_delegate;
  id WeakRetained;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  AMSSQLiteConnectionOptions *options;
  id v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  AMSSQLiteConnectionOptions *v18;
  id v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      options = self->_options;
      v10 = v8;
      -[AMSSQLiteConnectionOptions databasePath](options, "databasePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v8;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Asking delegate to reset database after corruption: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    v12 = objc_loadWeakRetained((id *)p_delegate);
    v13 = objc_msgSend(v12, "connectionNeedsResetForCorruption:", self);
LABEL_14:
    v14 = v13;

    return v14;
  }
  if (!-[AMSSQLiteConnectionOptions isReadOnly](self->_options, "isReadOnly"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_opt_class();
      v18 = self->_options;
      v19 = v17;
      -[AMSSQLiteConnectionOptions databasePath](v18, "databasePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v17;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Truncating database after corruption: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    -[AMSSQLiteConnectionOptions databasePath](self->_options, "databasePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = AMSSQLiteTruncateDatabase(v12);
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)_resetAfterCorruptionError
{
  BOOL v3;

  if (self->_didResetForCorruption
    || (v3 = 1, self->_didResetForCorruption = 1, !-[AMSSQLiteConnection _resetAfterIOError](self, "_resetAfterIOError")))
  {
    -[AMSSQLiteConnection _close](self, "_close");
    if (-[AMSSQLiteConnection _performResetAfterCorruptionError](self, "_performResetAfterCorruptionError"))
    {
      self->_didResetForCorruption = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (BOOL)_resetAfterIOError
{
  void *v3;
  NSObject *v4;
  void *v5;
  AMSSQLiteConnectionOptions *options;
  id v7;
  void *v8;
  NSMutableArray *afterTransactionBlocks;
  NSMutableArray *v10;
  int64_t transactionDepth;
  BOOL v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    options = self->_options;
    v7 = v5;
    -[AMSSQLiteConnectionOptions databasePath](options, "databasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v5;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Reopening database after IO error: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  v10 = afterTransactionBlocks;
  transactionDepth = self->_transactionDepth;
  if (-[AMSSQLiteConnection _close](self, "_close")
    && -[AMSSQLiteConnection _openWithError:](self, "_openWithError:", 0))
  {
    if (!transactionDepth)
    {
      v12 = 1;
      goto LABEL_10;
    }
    if (!sqlite3_exec(self->_database, "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
    {
      objc_storeStrong((id *)&self->_afterTransactionBlocks, afterTransactionBlocks);
      self->_transactionDepth = transactionDepth;
      v12 = 1;
      self->_transactionWantsRollback = 1;
      goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (AMSSQLiteConnectionDelegate)delegate
{
  return (AMSSQLiteConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AMSSQLiteConnectionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

@end
