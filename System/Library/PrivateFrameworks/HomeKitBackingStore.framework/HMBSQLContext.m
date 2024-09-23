@implementation HMBSQLContext

- (HMBSQLContext)initWithURL:(id)a3
{
  id v5;
  HMBSQLContext *v6;
  HMBSQLContext *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSString *logIdentifier;
  HMFUnfairLock *lock;
  HMBSQLContext *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMBSQLContext;
  v6 = -[HMBSQLContext init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    objc_msgSend(v5, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("memory"));

    if (v9)
      objc_msgSend(v5, "description");
    else
      objc_msgSend(v5, "lastPathComponent");
    v10 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v7->_logIdentifier;
    v7->_logIdentifier = (NSString *)v10;

    v7->_context = 0;
    lock = v7->_lock;
    v7->_lock = 0;

    v7->_finalized = 0;
    v13 = v7;
  }

  return v7;
}

- (void)dealloc
{
  HMBSQLContext *v2;
  SEL v3;
  objc_super v4;

  if (self->_finalized)
  {
    v4.receiver = self;
    v4.super_class = (Class)HMBSQLContext;
    -[HMBSQLContext dealloc](&v4, sel_dealloc);
  }
  else
  {
    v2 = (HMBSQLContext *)_HMFPreconditionFailure();
    -[HMBSQLContext close](v2, v3);
  }
}

- (void)close
{
  +[HMBSQLFile close:](HMBSQLFile, "close:", self);
}

- (void)finalize
{
  void *v3;
  HMBSQLContext *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  HMBSQLContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finalizing %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if (v4->_finalized)
    _HMFPreconditionFailure();
  v4->_finalized = 1;
  sqlite3_finalize(v4->_begin);
  sqlite3_finalize(v4->_commit);
  sqlite3_finalize(v4->_rollback);
}

- (BOOL)initializeNewlyCreatedDatabaseWithError:(id *)a3
{
  BOOL v5;
  id v6;
  void *v7;
  HMBSQLContext *v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v5 = -[HMBSQLContext prepareWithError:](self, "prepareWithError:", &v12);
  v6 = v12;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare context during newly created database initialization: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  HMBSQLContext *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  void *v14;
  HMBSQLContext *v15;
  NSObject *v16;
  void *v17;
  sqlite3 *context;
  sqlite3_stmt *v19;
  id v20;
  sqlite3 *v21;
  sqlite3_stmt *v22;
  id v23;
  sqlite3 *v24;
  sqlite3_stmt *v25;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HMBSQLContext runSQLite3:](self, "runSQLite3:", "PRAGMA foreign_keys = ON;");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA cache_size = %@;"), &unk_1E89477C0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[HMBSQLContext runSQLite3:](self, "runSQLite3:", objc_msgSend(v12, "UTF8String"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v6 = (id)v13;
      v14 = (void *)MEMORY[0x1D17B6230]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v17;
        v32 = 2048;
        v33 = 512;
        v34 = 2114;
        v35 = v6;
        _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to set sqlite cache size to %ld: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      if (a3)
      {
LABEL_10:
        v6 = objc_retainAutorelease(v6);
        v11 = 0;
        *a3 = v6;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      context = self->_context;
      v29 = 0;
      v19 = prepareSQLite3(context, "BEGIN;", &v29);
      v20 = v29;
      self->_begin = v19;
      v21 = self->_context;
      v28 = v20;
      v22 = prepareSQLite3(v21, "COMMIT;", &v28);
      v23 = v28;

      self->_commit = v22;
      v24 = self->_context;
      v27 = v23;
      v25 = prepareSQLite3(v24, "ROLLBACK;", &v27);
      v6 = v27;

      self->_rollback = v25;
      if (!v6)
      {
        v11 = 1;
        goto LABEL_16;
      }
      if (a3)
        goto LABEL_10;
    }
    v11 = 0;
    goto LABEL_16;
  }
  v6 = (id)v5;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2114;
    v33 = (uint64_t)v6;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to turn on foreign key enforcement: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (a3)
  {
    v6 = objc_retainAutorelease(v6);
    v11 = 0;
    *a3 = v6;
  }
  else
  {
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (int64_t)migrateFromSchemaVersion:(int64_t)a3 error:(id *)a4
{
  BOOL v5;
  id v6;
  int64_t v7;
  void *v8;
  HMBSQLContext *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v5 = -[HMBSQLContext prepareWithError:](self, "prepareWithError:", &v13, a4);
  v6 = v13;
  if (v5)
  {
    v7 = 3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare tables after migration: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = objc_msgSend(v6, "hmbIsSQLiteDatabaseCorruptedError");
  }

  return v7;
}

- (BOOL)setSchemaVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  sqlite3 *v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %ld;"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBSQLContext context](self, "context");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v14 = 0;
  selectSQLite3(v7, v9, MEMORY[0x1E0C9AA70], &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  v12 = v11;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v11);

  return v10 != 0;
}

- (id)sqlBlockWithActivity:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6527;
  v19 = __Block_byref_object_dispose__6528;
  v20 = 0;
  -[HMBSQLContext lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HMBSQLContext_sqlBlockWithActivity_block___block_invoke;
  v12[3] = &unk_1E8933958;
  v14 = &v15;
  v9 = v7;
  v12[4] = self;
  v13 = v9;
  objc_msgSend(v8, "performBlock:", v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)sqlTransactionWithActivity:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6527;
  v19 = __Block_byref_object_dispose__6528;
  v20 = 0;
  -[HMBSQLContext lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__HMBSQLContext_sqlTransactionWithActivity_block___block_invoke;
  v12[3] = &unk_1E8933958;
  v14 = &v15;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "performBlock:", v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)begin
{
  void *v3;

  if (sqlite3_step(self->_begin) == 101)
  {
    if (sqlite3_reset(self->_begin))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", self->_begin);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", self->_begin);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(self->_begin);
  }
  return v3;
}

- (id)commit
{
  void *v3;

  if (sqlite3_get_autocommit(self->_context))
    goto LABEL_2;
  if (sqlite3_step(self->_commit) != 101)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", self->_commit);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(self->_commit);
    return v3;
  }
  if (!sqlite3_reset(self->_commit))
  {
LABEL_2:
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", self->_commit);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)rollback
{
  if (!sqlite3_get_autocommit(self->_context))
  {
    sqlite3_step(self->_rollback);
    sqlite3_reset(self->_rollback);
  }
}

- (id)runSQLite3:(const char *)a3
{
  void *v5;
  sqlite3 *context;
  id v7;
  void *v8;
  void *v9;
  HMBSQLContext *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  __removeExtraWhitespace(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v7 = objc_retainAutorelease(v5);
  if (sqlite3_exec(context, (const char *)objc_msgSend(v7, "UTF8String"), 0, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Context:statement:", self->_context, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2080;
      v17 = a3;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to run SQL statement %s: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)execSQLite3:(sqlite3_stmt *)a3
{
  id v4;

  v4 = 0;
  __execSQLite3(self, a3, &v4);
  return v4;
}

- (unint64_t)execSQLite3:(sqlite3_stmt *)a3 error:(id *)a4
{
  return __execSQLite3(self, a3, a4);
}

- (BOOL)runSQLite3:(const char *)a3 error:(id *)a4
{
  BOOL v7;
  void *v8;
  void *v9;
  HMBSQLContext *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a4 || !*a4)
  {
    if (sqlite3_exec(self->_context, a3, 0, 0, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Context:statement:", self->_context, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1D17B6230]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v12;
        v16 = 2080;
        v17 = a3;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to run SQL statement %s: %@", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v8 = 0;
      if (!a4)
        goto LABEL_9;
    }
    *a4 = objc_retainAutorelease(v8);
LABEL_9:
    v7 = v8 == 0;

    return v7;
  }
  return 0;
}

- (unint64_t)insertSQLite3:(sqlite3_stmt *)a3 error:(id *)a4
{
  void *v6;
  sqlite3 *v7;
  sqlite3_int64 insert_rowid;
  int v9;
  unint64_t result;
  id v11;

  if (!a4)
  {
    if (sqlite3_step(a3) == 101)
      goto LABEL_7;
    sqlite3_reset(a3);
    return 0;
  }
  if (*a4)
    return 0;
  if (sqlite3_step(a3) != 101)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (sqlite3_reset(a3))
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
LABEL_13:
      objc_msgSend(v6, "hmbErrorWithSQLite3Statement:", a3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v11;
      return result;
    }
    return 0;
  }
LABEL_7:
  v7 = sqlite3_db_handle(a3);
  insert_rowid = sqlite3_last_insert_rowid(v7);
  v9 = sqlite3_reset(a3);
  if (v9)
    result = 0;
  else
    result = insert_rowid;
  if (a4 && v9)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_13;
  }
  return result;
}

- (BOOL)fetchSQLite3:(sqlite3_stmt *)a3 error:(id *)a4 block:(id)a5
{
  return -[HMBSQLContext fetchSQLite3:limit:error:block:](self, "fetchSQLite3:limit:error:block:", a3, -1, a4, a5);
}

- (BOOL)fetchSQLite3:(sqlite3_stmt *)a3 limit:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  void (**v10)(id, sqlite3_stmt *, int *);
  void *v11;
  HMBSQLContext *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  int v20;
  BOOL v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, sqlite3_stmt *, int *))a6;
  if (a5 && *a5)
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *a5;
      v23 = 138543618;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring fetch due to previous error: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
LABEL_28:
    v21 = 0;
  }
  else
  {
    LOBYTE(v23) = 0;
    while (1)
    {
      v16 = sqlite3_step(a3);
      if (v16 != 100)
        break;
      if (a4 == -1)
      {
        if ((_BYTE)v23)
          goto LABEL_21;
        a4 = -1;
      }
      else
      {
        v17 = a4-- != 0;
        if (!v17 || (_BYTE)v23)
          goto LABEL_21;
      }
      v10[2](v10, a3, &v23);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        sqlite3_reset(a3);
        if (a5)
          *a5 = objc_retainAutorelease(v19);

        goto LABEL_28;
      }
    }
    if (v16 && v16 != 101)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a3);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      sqlite3_reset(a3);
      goto LABEL_28;
    }
LABEL_21:
    v20 = sqlite3_reset(a3);
    v21 = 1;
    if ((v20 - 100) >= 2 && v20)
    {
      if (!a5)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a3);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v21;
}

- (BOOL)fetchSQLite3One:(sqlite3_stmt *)a3 error:(id *)a4 block:(id)a5
{
  void (**v8)(id, sqlite3_stmt *);
  void *v9;
  HMBSQLContext *v10;
  NSObject *v11;
  void *v12;
  id v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v21;
  int v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, sqlite3_stmt *))a5;
  if (a4 && *a4)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *a4;
      v23 = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring fetch due to previous error: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    goto LABEL_6;
  }
  v15 = sqlite3_step(a3);
  if (v15 == 101)
  {
LABEL_10:
    v16 = sqlite3_reset(a3);
    v14 = 0;
    if (!a4 || !v16)
      goto LABEL_20;
    goto LABEL_18;
  }
  if (v15 != 100)
  {
    if (!v15)
      goto LABEL_10;
    sqlite3_reset(a3);
    if (a4)
    {
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v14 = 0;
      *a4 = v19;
      goto LABEL_20;
    }
LABEL_6:
    v14 = 0;
    goto LABEL_20;
  }
  v8[2](v8, a3);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    sqlite3_reset(a3);
    if (a4)
      *a4 = objc_retainAutorelease(v18);

    goto LABEL_6;
  }
  v21 = sqlite3_step(a3);
  if (v21 != 101)
  {
    if (v21 == 100)
    {
      sqlite3_reset(a3);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      goto LABEL_6;
    }
    if (v21)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      sqlite3_reset(a3);
      goto LABEL_6;
    }
  }
  v22 = sqlite3_reset(a3);
  v14 = v22 == 0;
  if (v22 && a4)
    goto LABEL_18;
LABEL_20:

  return v14;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", -[HMBSQLContext context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Context"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBSQLContext url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("URL"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_logIdentifier, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (sqlite3)context
{
  return self->_context;
}

- (void)setContext:(sqlite3 *)a3
{
  self->_context = a3;
}

- (HMFUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __50__HMBSQLContext_sqlTransactionWithActivity_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(v8, "commit");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        return;
      v8 = *(void **)(a1 + 32);
    }
    objc_msgSend(v8, "rollback");
  }
}

void __44__HMBSQLContext_sqlBlockWithActivity_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_6620 != -1)
    dispatch_once(&logCategory__hmf_once_t13_6620, &__block_literal_global_6621);
  return (id)logCategory__hmf_once_v14_6622;
}

void __28__HMBSQLContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_6622;
  logCategory__hmf_once_v14_6622 = v0;

}

@end
