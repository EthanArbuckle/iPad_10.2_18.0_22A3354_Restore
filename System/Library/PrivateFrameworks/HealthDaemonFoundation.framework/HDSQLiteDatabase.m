@implementation HDSQLiteDatabase

- (HDSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  id v4;
  HDSQLiteDatabase *v5;
  HDSQLiteDatabase *v6;
  uint64_t v7;
  NSURL *fileURL;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSQLiteDatabase;
  v5 = -[HDSQLiteDatabase init](&v10, sel_init);
  if (v5)
  {
    if (v4 && (objc_msgSend(v4, "isFileURL") & 1) == 0)
    {

      v6 = 0;
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid database URL"));
    }
    else
    {
      v6 = v5;
    }
    v7 = objc_msgSend(v4, "copy");
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v7;

    v6->_interruptionLock._os_unfair_lock_opaque = 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)initMemoryDatabase
{
  return -[HDSQLiteDatabase initWithDatabaseURL:](self, "initWithDatabaseURL:", 0);
}

+ (uint64_t)_copyContentsFromDatabase:(sqlite3 *)a3 toDatabase:
{
  sqlite3_backup *v5;
  sqlite3_backup *v6;

  objc_opt_self();
  v5 = sqlite3_backup_init(a3, "main", a2, "main");
  if (v5)
  {
    v6 = v5;
    sqlite3_backup_step(v5, -1);
    sqlite3_backup_finish(v6);
  }
  return sqlite3_errcode(a3);
}

+ (id)memoryDatabaseFromURL:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  sqlite3 *v35;
  id v36;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseURL:", v4);
  v6 = v5;
  if (v5)
  {
    v36 = 0;
    v7 = -[HDSQLiteDatabase _openForWriting:additionalFlags:error:](v5, 1, 0, &v36);
    v8 = v36;
    if ((_DWORD)v7)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
        +[HDSQLiteDatabase memoryDatabaseFromURL:].cold.2(v7, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      v35 = 0;
      v17 = sqlite3_open(":memory:", &v35);
      if ((_DWORD)v17)
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x24BDD2FD8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
          +[HDSQLiteDatabase memoryDatabaseFromURL:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      else
      {
        if (!+[HDSQLiteDatabase _copyContentsFromDatabase:toDatabase:]((uint64_t)a1, *(sqlite3 **)(v6 + 8), v35))
        {
          objc_msgSend((id)v6, "close");
          v34 = *(void **)(v6 + 72);
          *(_QWORD *)(v6 + 72) = 0;

          *(_QWORD *)(v6 + 8) = v35;
          v16 = (id)v6;
          goto LABEL_14;
        }
        _HKInitializeLogging();
        v25 = *MEMORY[0x24BDD2FD8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
          +[HDSQLiteDatabase memoryDatabaseFromURL:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      objc_msgSend((id)v6, "close");
    }
    v16 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (uint64_t)_openForWriting:(int)a3 additionalFlags:(_QWORD *)a4 error:
{
  sqlite3 **v5;
  uint64_t busy;
  void *v10;
  __CFString *v11;
  int v12;
  void *v13;
  id *v14;
  id *v15;
  NSObject *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v25;
  unsigned int v26;
  int v27;
  __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;
  uint8_t buf[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v5 = (sqlite3 **)(a1 + 8);
    if (!*(_QWORD *)(a1 + 8))
    {
      v10 = *(void **)(a1 + 72);
      if (v10)
      {
        objc_msgSend(v10, "path");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR(":memory:");
      }
      if (a2)
        v12 = 6;
      else
        v12 = 1;
      v14 = (id *)(a1 + 80);
      v13 = *(void **)(a1 + 80);
      v15 = (id *)MEMORY[0x24BDD2FD8];
      if (v13)
      {
        if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD0CF8]))
        {
          v12 |= 0x400000u;
        }
        else if (objc_msgSend(*v14, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
        {
          v12 |= 0x300000u;
        }
        else if (objc_msgSend(*v14, "isEqualToString:", *MEMORY[0x24BDD0CD8]))
        {
          v12 |= 0x200000u;
        }
        else if (objc_msgSend(*v14, "isEqualToString:", *MEMORY[0x24BDD0CD0]))
        {
          v12 |= 0x100000u;
        }
        else
        {
          _HKInitializeLogging();
          v16 = *v15;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = objc_opt_class();
            -[HDSQLiteDatabase _openForWriting:additionalFlags:error:].cold.1(v17, (uint64_t *)(a1 + 80), buf, v16);
          }

        }
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
      v18 = objc_retainAutorelease(v11);
      busy = sqlite3_open_v2((const char *)-[__CFString fileSystemRepresentation](v18, "fileSystemRepresentation"), v5, v12 | a3 & ~(a3 >> 31), 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
      if ((_DWORD)busy)
      {
        v19 = CFSTR("opening database");
      }
      else
      {
        busy = sqlite3_exec_busy_retry(*v5, "PRAGMA cache_size=384;", 0, 0, 0);
        if ((_DWORD)busy)
        {
          v19 = CFSTR("setting cache_size");
        }
        else
        {
          busy = sqlite3_busy_timeout(*v5, 60000);
          if ((_DWORD)busy)
          {
            v19 = CFSTR("setting busy timeout");
          }
          else
          {
            if (a2)
            {
              busy = sqlite3_exec_busy_retry(*v5, "PRAGMA journal_mode = WAL;", 0, 0, 0);
              if ((_DWORD)busy)
              {
                v19 = CFSTR("setting journal_mode");
                goto LABEL_28;
              }
              busy = sqlite3_exec_busy_retry(*v5, "PRAGMA foreign_keys = ON;", 0, 0, 0);
              if ((_DWORD)busy)
              {
                v19 = CFSTR("enabling foreign keys");
                goto LABEL_28;
              }
            }
            if (HDSQLiteInstallCustomFunctionsInDatabase(*v5))
            {
              busy = 0;
LABEL_35:

              return busy;
            }
            v26 = sqlite3_extended_errcode(*v5);
            if (v26 <= 1)
              busy = 1;
            else
              busy = v26;
            v19 = CFSTR("installing custom functions");
          }
        }
      }
LABEL_28:
      HDSQLiteErrorFromDatabase(*v5, 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteDatabaseErrorFromSQLiteError(v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      v23 = *v15;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = v19;
        v29 = 1024;
        v30 = busy;
        v31 = 2114;
        v32 = v18;
        v33 = 2112;
        v34 = v25;
        _os_log_error_impl(&dword_210F9A000, v23, OS_LOG_TYPE_ERROR, "Error %{public}@: [%d, %{public}@] (%@)", (uint8_t *)&v27, 0x26u);

      }
      objc_msgSend((id)a1, "close");

      goto LABEL_35;
    }
  }
  return 0;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_db)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_db == NULL"));

    if (self->_db)
      -[HDSQLiteDatabase close](self, "close");
  }
  v5.receiver = self;
  v5.super_class = (Class)HDSQLiteDatabase;
  -[HDSQLiteDatabase dealloc](&v5, sel_dealloc);
}

- (int)openWithError:(id *)a3
{
  return -[HDSQLiteDatabase _openForWriting:additionalFlags:error:]((uint64_t)self, 1, 0, a3);
}

- (int)openForReadingWithError:(id *)a3
{
  return -[HDSQLiteDatabase _openForWriting:additionalFlags:error:]((uint64_t)self, 0, 0, a3);
}

- (void)close
{
  HDSQLiteStatementCache *statementCache;
  sqlite3 *db;

  -[HDSQLiteStatementCache clearCachedStatements](self->_statementCache, "clearCachedStatements");
  statementCache = self->_statementCache;
  self->_statementCache = 0;

  os_unfair_lock_lock(&self->_interruptionLock);
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  os_unfair_lock_unlock(&self->_interruptionLock);
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (BOOL)transactionInterruptRequested
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_transactionInterruptRequested);
  return v2 & 1;
}

- (void)setTransactionInterruptRequested:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_interruptionLock;
  BOOL *p_transactionInterruptRequested;
  int v7;
  sqlite3 *db;

  v3 = a3;
  p_interruptionLock = &self->_interruptionLock;
  os_unfair_lock_lock(&self->_interruptionLock);
  p_transactionInterruptRequested = &self->_transactionInterruptRequested;
  do
  {
    v7 = __ldaxr((unsigned __int8 *)p_transactionInterruptRequested);
    if (v7 != !v3)
    {
      __clrex();
      goto LABEL_9;
    }
  }
  while (__stlxr(v3, (unsigned __int8 *)p_transactionInterruptRequested));
  if (v3)
  {
    db = self->_db;
    if (db)
      sqlite3_interrupt(db);
  }
LABEL_9:
  os_unfair_lock_unlock(p_interruptionLock);
}

- (void)setFileProtectionType:(id)a3
{
  void *v5;
  NSString *v6;
  NSString *fileProtectionType;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[HDSQLiteDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open == NO"));

  }
  -[HDSQLiteDatabase fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.fileURL != nil"));

  }
  v6 = (NSString *)objc_msgSend(v10, "copy");
  fileProtectionType = self->_fileProtectionType;
  self->_fileProtectionType = v6;

}

- (void)accessDatabaseUsingBlock:(id)a3
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (!-[HDSQLiteDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open"));

  }
  if (self->_db)
    v6[2]();

}

- (uint64_t)_executeUncachedSQL:(_QWORD *)a3 error:
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (a1)
    v6 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:](a1, v5, a3, 0, 1);
  else
    v6 = 0;

  return v6;
}

- (uint64_t)_executeUncachedSQL:(_QWORD *)a3 error:(int)a4 retryIfBusy:(int)a5 interruptible:
{
  id v9;
  sqlite3 *v10;
  unsigned __int8 v11;
  id v12;
  const char *v13;
  int busy;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  if (!a1)
    goto LABEL_20;
  if ((objc_msgSend((id)a1, "isOpen") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__executeUncachedSQL_error_retryIfBusy_interruptible_, a1, CFSTR("HDSQLiteDatabase.mm"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open"));

  }
  v10 = *(sqlite3 **)(a1 + 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 3, CFSTR("Database connection is closed"));
LABEL_20:
    v16 = 0;
    goto LABEL_25;
  }
  if (a5)
  {
    v11 = atomic_load((unsigned __int8 *)(a1 + 32));
    if ((v11 & 1) != 0)
    {
      v16 = -[HDSQLiteDatabase _handleInterruptionWithError:](a1, a3);
      goto LABEL_25;
    }
    v10 = *(sqlite3 **)(a1 + 8);
  }
  v24 = 0;
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (a4)
    busy = sqlite3_exec_busy_retry(v10, v13, 0, 0, (char **)&v24);
  else
    busy = MEMORY[0x24BEDE118](v10, v13, 0, 0, &v24);
  v15 = busy;
  v16 = busy == 0;
  if (busy)
  {
    v17 = v24;
    if (!v24)
      v17 = (void *)sqlite3_errmsg(*(sqlite3 **)(a1 + 8));
    _HKInitializeLogging();
    v18 = *MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 1024;
      v28 = v15;
      v29 = 2082;
      v30 = v17;
      _os_log_error_impl(&dword_210F9A000, v18, OS_LOG_TYPE_ERROR, "Could not execute SQL: %{public}@: [%d, %{public}s]", buf, 0x1Cu);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_executeUncachedSQL(%@)"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "getLastErrorWithStatement:context:", 0, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    if (v24)
      sqlite3_free(v24);
  }
LABEL_25:

  return v16;
}

- (uint64_t)_handleInterruptionWithError:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  id v5;
  void *v6;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    os_unfair_lock_unlock(v4);
    *(_BYTE *)(a1 + 17) = 1;
    objc_msgSend(MEMORY[0x24BDD1540], "hk_transactionInterruptedError");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v5);
      else
        _HKLogDroppedError();
    }

  }
  return 0;
}

- (id)getLastErrorWithStatement:(sqlite3_stmt *)a3 context:(id)a4
{
  id v7;
  sqlite3 *db;
  id v9;
  void *v10;
  void *v12;
  id v13;

  v7 = a4;
  if (!-[HDSQLiteDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open"));

  }
  db = self->_db;
  if (db)
  {
    if (sqlite3_errcode(db) == 9)
    {
      v13 = 0;
      -[HDSQLiteDatabase _handleInterruptionWithError:]((uint64_t)self, &v13);
      v9 = v13;
    }
    else
    {
      HDSQLiteErrorFromDatabase(self->_db, a3, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteDatabaseErrorFromSQLiteError(v10);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)getChangesCount
{
  sqlite3 *db;
  void *v5;

  if (!-[HDSQLiteDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 499, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open"));

  }
  db = self->_db;
  if (db)
    LODWORD(db) = sqlite3_changes(db);
  return (int)db;
}

- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9;
  void *v10;
  _BOOL4 isInTransaction;
  int64_t cacheScope;
  __CFString *v13;
  int v14;
  __CFString *v15;
  char v16;
  unint64_t transactionType;
  __CFString *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  int i;
  NSMutableArray *v30;
  NSMutableArray *beforeCommitBlocks;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  char v37;
  id v38;
  id v39;
  void *v40;
  NSMutableArray *v41;
  char v42;
  NSMutableArray *v43;
  NSObject *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  NSMutableArray *onCommitBlocks;
  NSMutableArray *onRollbackBlocks;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void *v75;
  HDSQLiteDatabase *v76;
  id v77;
  uint64_t v78;
  uint8_t v79[128];
  uint8_t buf[4];
  NSMutableArray *v81;
  uint8_t v82[128];
  uint8_t v83[4];
  _BYTE v84[128];
  uint64_t v85;
  _QWORD v86[4];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (-[HDSQLiteDatabase isOpen](self, "isOpen"))
  {
    if (!self)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open"));

    if (!self)
      goto LABEL_9;
  }
  if (self->_db)
  {
    -[HDSQLiteDatabase _statementCache](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isInTransaction = self->_isInTransaction;
    cacheScope = self->_cacheScope;
    if (self->_isInTransaction)
    {
      if (self->_transactionType < a3)
      {
        if ((unint64_t)a3 > 2)
          v13 = 0;
        else
          v13 = off_24CB18AC8[a3];
        transactionType = self->_transactionType;
        if (transactionType > 2)
          v18 = 0;
        else
          v18 = off_24CB18AC8[transactionType];
        _HKInitializeLogging();
        v19 = *MEMORY[0x24BDD2FD8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_FAULT))
          -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:].cold.3((uint64_t)v13, (uint64_t)v18, v19);
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot perform %@ transaction inside an existing %@ transaction"), v13, v18);
      }
    }
    else
    {
      -[HDSQLiteDatabase setTransactionInterruptRequested:](self, "setTransactionInterruptRequested:", 0);
      self->_permitWritesInReadTransaction = 0;
      self->_requiresRollback = 0;
      if ((unint64_t)a3 >= 3)
        v15 = 0;
      else
        v15 = off_24CB18AB0[a3];
      self->_transactionType = a3;
      v16 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:]((uint64_t)self, v15, a4, 1, 1);
      self->_isInTransaction = v16;
      if ((v16 & 1) == 0)
        goto LABEL_27;
      if (cacheScope == 1)
        objc_msgSend(v10, "beginTransaction");
    }
    if (self->_isInTransaction)
    {
      v78 = 0;
      v72 = MEMORY[0x24BDAC760];
      v73 = 3221225472;
      v74 = __64__HDSQLiteDatabase_performTransactionWithType_error_usingBlock___block_invoke;
      v75 = &unk_24CB188B8;
      v76 = self;
      v77 = v9;
      v57 = v10;
      v14 = HKWithAutoreleasePool();
      v20 = 0;
      v21 = v20;
      if ((v14 & 1) != 0)
      {
LABEL_36:

        if (!isInTransaction)
        {
          if (v14)
          {
            if (self->_requiresRollback
              && -[HDSQLiteDatabase transactionInterruptRequested](self, "transactionInterruptRequested"))
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hk_transactionInterruptedError");
              v26 = (id)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26)
              {
                if (a4)
                  *a4 = objc_retainAutorelease(v26);
                else
                  _HKLogDroppedError();
              }

            }
            v14 = !self->_requiresRollback;
          }
          -[HDSQLiteDatabase setTransactionInterruptRequested:](self, "setTransactionInterruptRequested:", 0);
          v28 = 1;
          self->_isHandlingTransactionBeforeCommit = 1;
          if (v14)
          {
            for (i = 10; ; --i)
            {
              if (!-[NSMutableArray count](self->_beforeCommitBlocks, "count"))
              {
                v28 = 0;
                v14 = 1;
                goto LABEL_66;
              }
              if (!i)
                break;
              v30 = self->_beforeCommitBlocks;
              beforeCommitBlocks = self->_beforeCommitBlocks;
              self->_beforeCommitBlocks = 0;

              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v32 = v30;
              v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
              if (v33)
              {
                v34 = *(_QWORD *)v69;
                while (2)
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v69 != v34)
                      objc_enumerationMutation(v32);
                    v36 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
                    v67 = 0;
                    v37 = (*(uint64_t (**)(void))(v36 + 16))();
                    v38 = 0;
                    if ((v37 & 1) == 0)
                    {
                      v39 = v38;
                      v40 = v39;
                      if (v39)
                      {
                        if (a4)
                          *a4 = objc_retainAutorelease(v39);
                        else
                          _HKLogDroppedError();
                      }

                      goto LABEL_65;
                    }

                  }
                  v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                  if (v33)
                    continue;
                  break;
                }
              }

            }
            objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("beforeCommitLoopLimit limit reached in transaction"));
            _HKInitializeLogging();
            v32 = (id)*MEMORY[0x24BDD2FD8];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              v55 = (void *)objc_opt_class();
              -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:].cold.1(v55, (uint64_t)v83);
            }
LABEL_65:

            v14 = 0;
            v28 = 1;
          }
LABEL_66:
          v41 = self->_beforeCommitBlocks;
          self->_beforeCommitBlocks = 0;

          self->_isHandlingTransactionBeforeCommit = 0;
          if (cacheScope == 1)
            objc_msgSend(v57, "endTransaction");
          if ((v28 & 1) == 0)
            v14 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:]((uint64_t)self, CFSTR("COMMIT;"),
                    a4,
                    1,
                    0);
          self->_isHandlingTransactionEnd = 1;
          if (v14)
          {
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v43 = self->_onCommitBlocks;
            v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v64;
              do
              {
                for (k = 0; k != v49; ++k)
                {
                  if (*(_QWORD *)v64 != v50)
                    objc_enumerationMutation(v43);
                  (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k) + 16))();
                }
                v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
              }
              while (v49);
            }
          }
          else
          {
            os_unfair_lock_lock(&self->_interruptionLock);
            v62 = 0;
            v42 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:]((uint64_t)self, CFSTR("ROLLBACK;"),
                    &v62,
                    1,
                    0);
            v43 = (NSMutableArray *)v62;
            if ((v42 & 1) == 0)
            {
              _HKInitializeLogging();
              v44 = *MEMORY[0x24BDD2FD8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v81 = v43;
                _os_log_impl(&dword_210F9A000, v44, OS_LOG_TYPE_DEFAULT, "Failed to roll back transaction: %{public}@", buf, 0xCu);
              }
            }
            os_unfair_lock_unlock(&self->_interruptionLock);
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v45 = self->_onRollbackBlocks;
            v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
            if (v46)
            {
              v47 = *(_QWORD *)v59;
              do
              {
                for (m = 0; m != v46; ++m)
                {
                  if (*(_QWORD *)v59 != v47)
                    objc_enumerationMutation(v45);
                  (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * m) + 16))();
                }
                v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
              }
              while (v46);
            }

          }
          onCommitBlocks = self->_onCommitBlocks;
          self->_onCommitBlocks = 0;

          onRollbackBlocks = self->_onRollbackBlocks;
          self->_onRollbackBlocks = 0;

          self->_isHandlingTransactionEnd = 0;
          *(_WORD *)&self->_isInTransaction = 0;
        }
        v10 = v57;
        goto LABEL_91;
      }
      if (v20)
      {
        v21 = v20;
      }
      else
      {
        if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x24BDD2FD8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_FAULT))
            -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:].cold.2(v22);
        }
        v23 = (void *)MEMORY[0x24BDD1540];
        v85 = *MEMORY[0x24BDD0FC8];
        v86[0] = CFSTR("Transaction block failed without an error.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthd.SQLite"), 1, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v25;
        if (!v21)
          goto LABEL_35;
      }
      if (a4)
      {
        v21 = objc_retainAutorelease(v21);
        *a4 = v21;
      }
      else
      {
        _HKLogDroppedError();
      }
LABEL_35:

      goto LABEL_36;
    }
LABEL_27:
    LOBYTE(v14) = 0;
LABEL_91:

    goto LABEL_92;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Database connection is closed"));
LABEL_9:
  LOBYTE(v14) = 0;
LABEL_92:

  return v14;
}

- (_QWORD)_statementCache
{
  _QWORD *v1;
  void *v2;
  HDSQLiteStatementCache *v3;
  void *v4;
  void *v6;

  if (a1)
  {
    v1 = a1;
    if (!a1[1])
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__statementCache, v1, CFSTR("HDSQLiteDatabase.mm"), 1319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_db != NULL"));

    }
    v2 = (void *)v1[13];
    if (!v2)
    {
      v3 = -[HDSQLiteStatementCache initWithDatabase:]([HDSQLiteStatementCache alloc], "initWithDatabase:", v1[1]);
      v4 = (void *)v1[13];
      v1[13] = v3;

      v2 = (void *)v1[13];
    }
    a1 = v2;
  }
  return a1;
}

uint64_t __64__HDSQLiteDatabase_performTransactionWithType_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (BOOL)_executeStatementWithError:(id *)a3 statementProvider:(id)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  uint64_t (**v11)(id, uint8_t *, id *);
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v32;
  const char *v33;
  void *v34;
  id *v35;
  NSObject *v36;
  void (**v37)(id, sqlite3_stmt *);
  uint64_t (**v38)(void);
  id v39;
  id v40;
  id v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint8_t buf[24];
  _QWORD v45[7];

  v45[5] = *MEMORY[0x24BDAC8D0];
  v38 = (uint64_t (**)(void))a4;
  v37 = (void (**)(id, sqlite3_stmt *))a5;
  v11 = (uint64_t (**)(id, uint8_t *, id *))a6;
  if (-[HDSQLiteDatabase isOpen](self, "isOpen"))
  {
    if (!self)
      goto LABEL_52;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.open"));

    if (!self)
      goto LABEL_52;
  }
  if (self->_db)
  {
    if (self->_isHandlingTransactionEnd)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 100, CFSTR("Attempt to execute SQL within a commit or rollback block."));
      _HKInitializeLogging();
      v36 = (id)*MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        v12 = (void *)objc_opt_class();
        -[HDSQLiteDatabase _executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:].cold.2(v12, (uint64_t)buf);
      }
      LOBYTE(self) = 0;
      goto LABEL_51;
    }
    v35 = a3;
    -[HDSQLiteDatabase _statementCache](self);
    v43 = 0;
    v36 = objc_claimAutoreleasedReturnValue();
    v13 = (sqlite3_stmt *)v38[2]();
    v14 = 0;
    v15 = v14;
    if (v13)
    {
      if (!self->_isInTransaction
        || self->_transactionType
        || self->_permitWritesInReadTransaction
        || sqlite3_stmt_readonly(v13))
      {
        if (v37)
          v37[2](v37, v13);
        if (v11)
        {
          HDSQLiteRow::HDSQLiteRow((uint64_t)buf, v13, 0);
          v16 = 0;
          v42 = 0;
          do
          {
            v41 = v15;
            v17 = -[HDSQLiteDatabase _stepStatement:hasRow:error:]((uint64_t)self, v13, &v42, &v41);
            v18 = v41;

            v15 = v18;
            v19 = v17;
            v20 = v42;
            if (v42)
              v21 = v17;
            else
              v21 = 0;
            if (v21 == 1)
            {
              v22 = (void *)MEMORY[0x212BD35D0]();
              v40 = v16;
              v23 = v11[2](v11, buf, &v40);
              v24 = v40;

              objc_autoreleasePoolPop(v22);
              if (!v23)
                break;
              v20 = v42;
              v16 = v24;
            }
            else
            {
              v24 = v16;
            }
            if (v20)
              v25 = v17;
            else
              v25 = 0;
          }
          while ((v25 & 1) != 0);
          if (v24)
          {
            v26 = v24;

            v19 = 0;
            v15 = v26;
          }

          *(_QWORD *)buf = &unk_24CB18A80;
          std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)v45);
          if (v19)
            goto LABEL_49;
        }
        else
        {
          v39 = v15;
          v19 = -[HDSQLiteDatabase _stepStatement:hasRow:error:]((uint64_t)self, v13, 0, &v39);
          v28 = v39;

          v15 = v28;
          if (v19)
          {
LABEL_49:
            LOBYTE(self) = v19 != 0;
            -[NSObject checkInStatement:](v36, "checkInStatement:", v13);
            goto LABEL_50;
          }
        }
        v29 = v15;
        v30 = v29;
        if (v29)
        {
          if (v35)
            *v35 = objc_retainAutorelease(v29);
          else
            _HKLogDroppedError();
        }

        goto LABEL_49;
      }
      _HKInitializeLogging();
      v32 = (id)*MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        v33 = sqlite3_sql(v13);
        -[HDSQLiteDatabase _executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:].cold.1((uint64_t)v33, buf, v32);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 131, CFSTR("Unsafe statement in read-only transaction: %s"), sqlite3_sql(v13));
    }
    else
    {
      if (objc_msgSend(v14, "hd_isDatabaseCorruptionError"))
        objc_storeStrong((id *)&self->_corruptionError, 0);
      if (objc_msgSend(v15, "hk_isTransactionInterruptedError"))
        -[HDSQLiteDatabase _handleInterruptionWithError:]((uint64_t)self, 0);
      v27 = v15;
      v15 = v27;
      if (v27)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v27);
        else
          _HKLogDroppedError();
      }

    }
    LOBYTE(self) = 0;
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 3, CFSTR("Database connection is closed"));
  LOBYTE(self) = 0;
LABEL_52:

  return (char)self;
}

- (uint64_t)_stepStatement:(_BYTE *)a3 hasRow:(_QWORD *)a4 error:
{
  uint64_t v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  sqlite3 *v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  sqlite3 *v28;
  id v29;
  void *v30;
  int v31;
  _BYTE v32[14];
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v7 = result;
    if (a3)
      *a3 = 0;
    if (a2)
    {
      while (1)
      {
        v8 = atomic_load((unsigned __int8 *)(v7 + 32));
        if ((v8 & 1) != 0)
          return -[HDSQLiteDatabase _handleInterruptionWithError:](v7, a4);
        v9 = sqlite3_step(a2);
        if (v9 == 9)
          goto LABEL_31;
        if (v9 == 101)
          return 1;
        if (v9 == 100)
          break;
        v10 = v9;
        if (v9 - 5 >= 2)
        {
          switch(v9)
          {
            case 0x13u:
              _HKInitializeLogging();
              v21 = (void *)*MEMORY[0x24BDD2FD8];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_DEBUG))
                goto LABEL_31;
              v22 = v21;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v23 = sqlite3_db_handle(a2);
                v24 = sqlite3_errmsg(v23);
                v25 = sqlite3_sql(a2);
                -[HDSQLiteDatabase _stepStatement:hasRow:error:].cold.2((uint64_t)v24, (uint64_t)v25, (uint8_t *)&v31, v22);
              }
              break;
            case 0xDu:
              *(_BYTE *)(v7 + 70) = 1;
              _HKInitializeLogging();
              v26 = (void *)*MEMORY[0x24BDD2FD8];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_INFO))
                goto LABEL_31;
              v22 = v26;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                v31 = 136315138;
                *(_QWORD *)v32 = sqlite3_sql(a2);
                _os_log_impl(&dword_210F9A000, v22, OS_LOG_TYPE_INFO, "Encountered device out of space during statement step: %s", (uint8_t *)&v31, 0xCu);
              }
              break;
            case 0xBu:
              HDSQLiteErrorFromDatabase(*(sqlite3 **)(v7 + 8), a2, 0);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              HDSQLiteDatabaseErrorFromSQLiteError(v11);
              v12 = objc_claimAutoreleasedReturnValue();
              v13 = *(void **)(v7 + 112);
              *(_QWORD *)(v7 + 112) = v12;

              _HKInitializeLogging();
              v14 = *MEMORY[0x24BDD2FD8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
                -[HDSQLiteDatabase _stepStatement:hasRow:error:].cold.1(v7 + 112, v14, v15, v16, v17, v18, v19, v20);
              goto LABEL_31;
            default:
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x24BDD2FD8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_INFO))
              {
                v22 = v27;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  v28 = sqlite3_db_handle(a2);
                  v31 = 67109634;
                  *(_DWORD *)v32 = v10;
                  *(_WORD *)&v32[4] = 2080;
                  *(_QWORD *)&v32[6] = sqlite3_errmsg(v28);
                  v33 = 2080;
                  v34 = sqlite3_sql(a2);
                  _os_log_impl(&dword_210F9A000, v22, OS_LOG_TYPE_INFO, "Step failed: [%d, %s]: %s", (uint8_t *)&v31, 0x1Cu);
                }
                break;
              }
LABEL_31:
              objc_msgSend((id)v7, "getLastErrorWithStatement:context:", a2, 0);
              v29 = (id)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                if (a4)
                  *a4 = objc_retainAutorelease(v29);
                else
                  _HKLogDroppedError();
              }

              return 0;
          }

          goto LABEL_31;
        }
      }
      result = 1;
      if (a3)
        *a3 = 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return -[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, a3, 1, (uint64_t)a4, a5, a6);
}

- (uint64_t)_executeSQL:(char)a3 cache:(uint64_t)a4 error:(void *)a5 bindingHandler:(void *)a6 enumerationHandler:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  char v18;

  v11 = a2;
  v12 = a5;
  v13 = a6;
  if (a1)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__HDSQLiteDatabase__executeSQL_cache_error_bindingHandler_enumerationHandler___block_invoke;
    v16[3] = &unk_24CB18910;
    v17 = v11;
    v18 = a3;
    v14 = objc_msgSend(a1, "_executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:", a4, v16, v12, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return -[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, a3, 0, (uint64_t)a4, a5, a6);
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4
{
  return -[HDSQLiteDatabase executeUncachedSQL:error:bindingHandler:enumerationHandler:](self, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", a3, a4, 0, 0);
}

- (BOOL)executeSQLStatements:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if (!-[HDSQLiteDatabase executeUncachedSQL:error:bindingHandler:enumerationHandler:](self, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), a4, 0, 0, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)executeCachedStatementForKey:(const char *)a3 error:(id *)a4 SQLGenerator:(id)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  const char *v17;

  v12 = a5;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__HDSQLiteDatabase_executeCachedStatementForKey_error_SQLGenerator_bindingHandler_enumerationHandler___block_invoke;
  v15[3] = &unk_24CB188E8;
  v16 = v12;
  v17 = a3;
  v13 = v12;
  LOBYTE(a7) = -[HDSQLiteDatabase _executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:](self, "_executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:", a4, v15, a6, a7);

  return (char)a7;
}

uint64_t __102__HDSQLiteDatabase_executeCachedStatementForKey_error_SQLGenerator_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "checkOutCachedStatementForKey:SQLGenerator:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a3);
}

uint64_t __78__HDSQLiteDatabase__executeSQL_cache_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "checkOutStatementForSQL:shouldCache:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a3);
}

- (BOOL)setUserVersion:(int64_t)a3 withDatabaseName:(id)a4 error:(id *)a5
{
  return -[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, CFSTR("user_version"), a3, a4, a5);
}

- (uint64_t)_setPragma:(uint64_t)a3 integerValue:(void *)a4 withDatabaseName:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v9 = a2;
  v10 = a4;
  v11 = v10;
  if (a1)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    HDSQLiteDatabaseNamePrefix(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("PRAGMA %@%@=%lld"), v13, v9, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[HDSQLiteDatabase _executeUncachedSQL:error:](a1, v14, a5);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)userVersionWithDatabaseName:(id)a3 error:(id *)a4
{
  int64_t v5;

  v5 = -1;
  -[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, CFSTR("user_version"), a3, (uint64_t)&v5, (uint64_t)a4);
  return v5;
}

- (BOOL)_integerValueForPragma:(void *)a3 databaseName:(uint64_t)a4 value:(uint64_t)a5 error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v9 = a2;
  v10 = a3;
  v11 = v10;
  if (a1)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    HDSQLiteDatabaseNamePrefix(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("PRAGMA %@%@;"), v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __68__HDSQLiteDatabase__integerValueForPragma_databaseName_value_error___block_invoke;
    v17[3] = &unk_24CB18938;
    v17[4] = &v18;
    v17[5] = a4;
    -[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v14, 0, a5, 0, v17);
    v15 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSNumber)lastInsertRowID
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_last_insert_rowid(self->_db));
}

uint64_t __68__HDSQLiteDatabase__integerValueForPragma_databaseName_value_error___block_invoke(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(a1 + 40) = HDSQLiteColumnAsInt64(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
  id v7;
  NSMutableArray *onCommitBlocks;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  NSMutableArray *onRollbackBlocks;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a4;
  if (!self->_isInTransaction)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isInTransaction"));

  }
  if (!self->_isHandlingTransactionEnd
    || (objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 847, CFSTR("Cannot add new commit or rollback handlers from within a commit or rollback handler.")), v19, !self->_isHandlingTransactionEnd))
  {
    if (v20)
    {
      onCommitBlocks = self->_onCommitBlocks;
      if (!onCommitBlocks)
      {
        v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v10 = self->_onCommitBlocks;
        self->_onCommitBlocks = v9;

        onCommitBlocks = self->_onCommitBlocks;
      }
      v11 = (void *)objc_msgSend(v20, "copy");
      v12 = (void *)MEMORY[0x212BD3780]();
      -[NSMutableArray addObject:](onCommitBlocks, "addObject:", v12);

    }
    if (v7)
    {
      onRollbackBlocks = self->_onRollbackBlocks;
      if (!onRollbackBlocks)
      {
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v15 = self->_onRollbackBlocks;
        self->_onRollbackBlocks = v14;

        onRollbackBlocks = self->_onRollbackBlocks;
      }
      v16 = (void *)objc_msgSend(v7, "copy");
      v17 = (void *)MEMORY[0x212BD3780]();
      -[NSMutableArray addObject:](onRollbackBlocks, "addObject:", v17);

    }
  }

}

- (void)beforeCommit:(id)a3
{
  id v5;
  NSMutableArray *beforeCommitBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (!self->_isInTransaction)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isInTransaction"));

    v5 = v13;
  }
  if (self->_isHandlingTransactionEnd)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isHandlingTransactionEnd"));

    v5 = v13;
  }
  beforeCommitBlocks = self->_beforeCommitBlocks;
  if (!beforeCommitBlocks)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = self->_beforeCommitBlocks;
    self->_beforeCommitBlocks = v7;

    beforeCommitBlocks = self->_beforeCommitBlocks;
    v5 = v13;
  }
  v9 = (void *)objc_msgSend(v5, "copy");
  v10 = (void *)MEMORY[0x212BD3780]();
  -[NSMutableArray addObject:](beforeCommitBlocks, "addObject:", v10);

}

- (void)requireRollback
{
  if (self->_isInTransaction)
    self->_requiresRollback = 1;
}

- (int64_t)validateForeignKeysForTable:(id)a3 databaseName:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 885, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  HDSQLiteDatabaseNamePrefix(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v11, "stringWithFormat:", CFSTR("PRAGMA %@foreign_key_check(%@)"), v12, v9);
  else
    objc_msgSend(v11, "stringWithFormat:", CFSTR("PRAGMA %@foreign_key_check"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __67__HDSQLiteDatabase_validateForeignKeysForTable_databaseName_error___block_invoke;
  v24[3] = &unk_24CB18960;
  v24[4] = &v31;
  v24[5] = &v25;
  if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, v13, 0, (uint64_t)a5, 0, v24) & 1) != 0)
  {
    if (*((_BYTE *)v32 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 100, v26[5]);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      -[HDSQLiteDatabase validateForeignKeysForTable:databaseName:error:].cold.1((uint64_t)a5, v15, v16, v17, v18, v19, v20, v21);
    v14 = 2;
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v14;
}

uint64_t __67__HDSQLiteDatabase_validateForeignKeysForTable_databaseName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v4 = (void *)MEMORY[0x24BDD17C8];
  HDSQLiteColumnAsString(a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsNumber(a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsString(a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Foreign key check failed for reference from %@ to row %@ in %@"), v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 0;
}

- (BOOL)table:(id)a3 hasColumnWithName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a4;
  -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, a3, 0, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "columns");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (HDSQLiteDatabaseTableSchema)_schemaForTableWithName:(void *)a3 database:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDSQLiteDatabaseTableSchema *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  __CFString *v32;
  HDSQLiteDatabaseTableSchema *v34;
  id v35;
  id obj;
  id v37;
  void *v38;
  void *v39;
  HDSQLiteDatabaseTableSchema *v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  char *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  HDSQLiteDatabaseTableSchema *v59;
  _QWORD v60[4];
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      v38 = v7;
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") < 2)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v39 = v7;
    v40 = objc_alloc_init(HDSQLiteDatabaseTableSchema);
    -[HDSQLiteDatabaseTableSchema setName:](v40, "setName:", v7);
    v11 = (void *)objc_opt_new();
    if (v9)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA %@.table_info(%@);"), v9, v7);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA table_info(%@);"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke;
    v60[3] = &unk_24CB189B0;
    v37 = v11;
    v61 = v37;
    if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v12, 0, a4, 0, v60) & 1) != 0)
    {
      -[HDSQLiteDatabaseTableSchema setColumns:](v40, "setColumns:", v37);
      if (v9)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT sql FROM %@.sqlite_master WHERE type='table' AND tbl_name='%@';"),
          v9,
          v7);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT sql FROM sqlite_master WHERE type='table' AND tbl_name='%@';"),
          v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_2;
      v58[3] = &unk_24CB189B0;
      v34 = v40;
      v59 = v34;
      if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v14, 0, a4, 0, v58) & 1) != 0)
      {
        if (v9)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA %@.index_list(%@)"), v9, v7);
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA index_list(%@)"), v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_3;
        v56[3] = &unk_24CB189B0;
        v35 = v16;
        v57 = v35;
        if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v15, 0, a4, 0, v56) & 1) != 0)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          obj = v35;
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v53;
            while (2)
            {
              v19 = 0;
              v20 = v15;
              do
              {
                if (*(_QWORD *)v53 != v18)
                  objc_enumerationMutation(obj);
                v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v19);
                v22 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v21, "name");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v9)
                  objc_msgSend(v22, "stringWithFormat:", CFSTR("PRAGMA %@.index_info(%@)"), v9, v23);
                else
                  objc_msgSend(v22, "stringWithFormat:", CFSTR("PRAGMA index_info(%@)"), v23);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                v24 = (void *)objc_opt_new();
                v50[0] = MEMORY[0x24BDAC760];
                v50[1] = 3221225472;
                v50[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_4;
                v50[3] = &unk_24CB189B0;
                v25 = v24;
                v51 = v25;
                if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v15, 0, a4, 0, v50) & 1) == 0)
                {

                  v13 = 0;
                  goto LABEL_47;
                }
                objc_msgSend(v21, "setColumns:", v25);

                ++v19;
                v20 = v15;
              }
              while (v17 != v19);
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
              if (v17)
                continue;
              break;
            }
          }

          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", obj);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDSQLiteDatabaseTableSchema setIndices:](v34, "setIndices:", v26);

          if (v9)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select name, sql from %@.sqlite_master where type='trigger' AND tbl_name=?"), v9);
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v27 = CFSTR("select name, sql from sqlite_master where type='trigger' AND tbl_name=?");
          }

          v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v29 = MEMORY[0x24BDAC760];
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_5;
          v48[3] = &unk_24CB189D8;
          v49 = v39;
          v45[0] = v29;
          v45[1] = 3221225472;
          v45[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_6;
          v45[3] = &unk_24CB18A00;
          v30 = v49;
          v46 = v30;
          obj = v28;
          v47 = obj;
          if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v27, 0, a4, v48, v45) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", obj);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDSQLiteDatabaseTableSchema setTriggers:](v34, "setTriggers:", v31);

            if (v9)
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA %@.foreign_key_list(%@);"), v9, v30);
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA foreign_key_list(%@);"), v30);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_7;
            v41[3] = &unk_24CB18A28;
            v43 = a1;
            v44 = sel__schemaForTableWithName_database_error_;
            v42 = v37;
            if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v32, 0, a4, 0, v41) & 1) != 0)v13 = v34;
            else
              v13 = 0;

            v27 = v32;
          }
          else
          {
            v13 = 0;
          }

          v25 = v49;
          v15 = v27;
LABEL_47:

        }
        else
        {
          v13 = 0;
        }

        v14 = v15;
      }
      else
      {
        v13 = 0;
      }

      v12 = v14;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v39 = v7;
    v13 = 0;
  }

  return v13;
}

- (BOOL)foreignKeyExistsFromTable:(id)a3 column:(id)a4 toTable:(id)a5 column:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, a3, 0, (uint64_t)a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "columns");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "foreignKeyTargetTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", v13))
    {
      objc_msgSend(v18, "foreignKeyTargetColumn");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v14);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)typeOfColumn:(id)a3 inTable:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 940, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, v10, 0, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "columns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v16 = (id)*MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "columns");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v10;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_210F9A000, v16, OS_LOG_TYPE_ERROR, "Table '%{public}@' has no column %{public}@: %{public}@", buf, 0x20u);

      }
      v15 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      -[HDSQLiteDatabase typeOfColumn:inTable:error:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (BOOL)columnIsNullable:(id)a3 inTable:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteDatabase.mm"), 958, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, v10, 0, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "columns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v14, "isNullable");
    }
    else
    {
      _HKInitializeLogging();
      v16 = (id)*MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "columns");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v10;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_210F9A000, v16, OS_LOG_TYPE_ERROR, "Table '%{public}@' has no column %{public}@: %{public}@", buf, 0x20u);

      }
      v15 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      -[HDSQLiteDatabase typeOfColumn:inTable:error:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (BOOL)enableIncrementalAutovacuumForDatabaseWithName:(id)a3 error:(id *)a4
{
  __CFString *v6;
  char v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;

  v6 = (__CFString *)a3;
  v37 = 0;
  if (!-[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, CFSTR("AUTO_VACUUM"), v6, (uint64_t)&v37, (uint64_t)a4))goto LABEL_20;
  if (v37 == 2)
  {
    v7 = 1;
    goto LABEL_21;
  }
  if (!-[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, CFSTR("AUTO_VACUUM"), 2, v6, a4))
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  v35 = 0;
  v36 = 2500;
  v8 = -[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, CFSTR("CACHE_SPILL"), v6, (uint64_t)&v36, (uint64_t)&v35);
  v9 = v35;
  if (!v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      -[HDSQLiteDatabase enableIncrementalAutovacuumForDatabaseWithName:error:].cold.3((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if (v36 >= 625)
    v17 = 625;
  else
    v17 = v36;
  v34 = v9;
  v18 = -[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, CFSTR("CACHE_SPILL"), v17, v6, &v34);
  v19 = v34;

  if ((v18 & 1) == 0)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      -[HDSQLiteDatabase enableIncrementalAutovacuumForDatabaseWithName:error:].cold.2((uint64_t)v19, v17, v20);
  }
  v21 = &stru_24CB19CC0;
  if (v6)
    v21 = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VACUUM %@;"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSQLiteDatabase _executeUncachedSQL:error:]((uint64_t)self, v22, a4);
  v33 = v19;
  v23 = -[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, CFSTR("CACHE_SPILL"), v36, v6, &v33);
  v24 = v33;

  if ((v23 & 1) == 0)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
      -[HDSQLiteDatabase enableIncrementalAutovacuumForDatabaseWithName:error:].cold.1((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31);
  }

LABEL_21:
  return v7;
}

- (BOOL)incrementalVacuumDatabaseIfNeeded:(id)a3 error:(id *)a4
{
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;

  v6 = (__CFString *)a3;
  v12 = 0;
  if (!-[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, CFSTR("FREELIST_COUNT"), v6, (uint64_t)&v12, (uint64_t)a4))goto LABEL_8;
  if (!v12)
  {
LABEL_9:
    v9 = 1;
    goto LABEL_10;
  }
  v11 = 0;
  if (!-[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, CFSTR("PAGE_SIZE"), v6, (uint64_t)&v11, (uint64_t)a4))
  {
LABEL_8:
    v9 = 0;
    goto LABEL_10;
  }
  if (v12 <= 0x200000 / v11)
    goto LABEL_9;
  v7 = CFSTR("main");
  if (v6)
    v7 = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA %@.incremental_vacuum(%lld)"), v7, v12 - 0x200000 / v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDSQLiteDatabase _executeUncachedSQL:error:]((uint64_t)self, v8, a4);

LABEL_10:
  return v9;
}

- (BOOL)performIntegrityCheckOnDatabase:(id)a3 error:(id *)a4 integrityErrorHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA %@.INTEGRITY_CHECK;"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__HDSQLiteDatabase_performIntegrityCheckOnDatabase_error_integrityErrorHandler___block_invoke;
  v13[3] = &unk_24CB18988;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  if (-[HDSQLiteDatabase executeUncachedSQL:error:bindingHandler:enumerationHandler:](self, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v9, a4, 0, v13))
  {
    if (!*((_BYTE *)v17 + 24))
    {
      v11 = 1;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 102, CFSTR("Access error during integrity check."));
  }
  v11 = 0;
LABEL_5:

  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __80__HDSQLiteDatabase_performIntegrityCheckOnDatabase_error_integrityErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  HDSQLiteColumnAsString(a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ok")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("=266")))
  {
    v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = 1;
  }

  return v4;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke(uint64_t a1, HDSQLiteRow *a2)
{
  HDSQLiteDatabaseColumnSchema *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(HDSQLiteDatabaseColumnSchema);
  HDSQLiteColumnWithNameAsString(a2, CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteDatabaseColumnSchema setName:](v4, "setName:", v5);

  HDSQLiteColumnWithNameAsString(a2, CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteDatabaseColumnSchema setType:](v4, "setType:", v6);

  HDSQLiteColumnWithNameAsString(a2, CFSTR("dflt_value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteDatabaseColumnSchema setDefaultValue:](v4, "setDefaultValue:", v7);

  -[HDSQLiteDatabaseColumnSchema setIsNullable:](v4, "setIsNullable:", !HDSQLiteColumnWithNameAsBoolean(a2, CFSTR("notnull")));
  -[HDSQLiteDatabaseColumnSchema setIsPrimaryKey:](v4, "setIsPrimaryKey:", HDSQLiteColumnWithNameAsBoolean(a2, CFSTR("pk")));
  v8 = *(void **)(a1 + 32);
  -[HDSQLiteDatabaseColumnSchema name](v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v9);

  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_2(uint64_t a1, HDSQLiteRow *a2)
{
  void *v3;

  HDSQLiteColumnWithNameAsString(a2, CFSTR("sql"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCreateTableSchema:", v3);

  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_3(uint64_t a1, HDSQLiteRow *a2)
{
  HDSQLiteDatabaseIndexSchema *v4;
  void *v5;

  v4 = objc_alloc_init(HDSQLiteDatabaseIndexSchema);
  -[HDSQLiteDatabaseIndexSchema setIsUnique:](v4, "setIsUnique:", HDSQLiteColumnWithNameAsBoolean(a2, CFSTR("unique")));
  HDSQLiteColumnWithNameAsString(a2, CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteDatabaseIndexSchema setName:](v4, "setName:", v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_4(uint64_t a1, HDSQLiteRow *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  HDSQLiteColumnWithNameAsString(a2, CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

void __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement(a2, 1, *(void **)(a1 + 32));
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_6(uint64_t a1, HDSQLiteRow *a2)
{
  HDSQLiteDatabaseTriggerSchema *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(HDSQLiteDatabaseTriggerSchema);
  HDSQLiteColumnWithNameAsString(a2, CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteDatabaseTriggerSchema setName:](v4, "setName:", v5);

  -[HDSQLiteDatabaseTriggerSchema setTableName:](v4, "setTableName:", *(_QWORD *)(a1 + 32));
  HDSQLiteColumnWithNameAsString(a2, CFSTR("sql"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteDatabaseTriggerSchema setSql:](v4, "setSql:", v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_7(_QWORD *a1, HDSQLiteRow *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;

  v4 = (void *)a1[4];
  HDSQLiteColumnWithNameAsString(a2, CFSTR("from"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HDSQLiteColumnWithNameAsString(a2, CFSTR("table"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForeignKeyTargetTable:", v7);

  HDSQLiteColumnWithNameAsString(a2, CFSTR("to"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForeignKeyTargetColumn:", v8);

  HDSQLiteColumnWithNameAsString(a2, CFSTR("on_delete"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CASCADE")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RESTRICT")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NO ACTION")) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SET NULL")) & 1) != 0)
  {
    v10 = 3;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("SET DEFAULT")))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[5], CFSTR("HDSQLiteDatabase.mm"), 1182, CFSTR("Unable to determine deletion action for %@"), v9);

      goto LABEL_12;
    }
    v10 = 4;
  }
  objc_msgSend(v6, "setDeletionAction:", v10);
LABEL_12:

  return 1;
}

- (HDSQLiteDatabaseSchema)_schemaForDatabaseWithName:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  HDSQLiteDatabaseSchema *v13;
  HDSQLiteDatabaseSchema *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    v15 = objc_alloc_init(HDSQLiteDatabaseSchema);
    -[HDSQLiteDatabase _tableNamesForDatabaseWithName:error:](a1, v5, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v6 = (void *)objc_opt_new();
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v16;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            -[HDSQLiteDatabase _schemaForTableWithName:database:error:](a1, v11, v5, a3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {

              v13 = 0;
              goto LABEL_13;
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v8)
            continue;
          break;
        }
      }

      -[HDSQLiteDatabaseSchema setTables:](v15, "setTables:", v6);
      v13 = v15;
LABEL_13:

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_tableNamesForDatabaseWithName:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT name FROM %@.sqlite_master WHERE type='table';"),
      v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__HDSQLiteDatabase__tableNamesForDatabaseWithName_error___block_invoke;
    v11[3] = &unk_24CB189B0;
    v8 = v6;
    v12 = v8;
    if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v7, 0, a3, 0, v11) & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __57__HDSQLiteDatabase__tableNamesForDatabaseWithName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  HDSQLiteColumnAsString(a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (id)dumpSchemaWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __40__HDSQLiteDatabase_dumpSchemaWithError___block_invoke;
  v20[3] = &unk_24CB189B0;
  v15 = v5;
  v21 = v15;
  if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, CFSTR("PRAGMA database_list;"),
          0,
          (uint64_t)a3,
          0,
          v20) & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v15;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("temp")) & 1) == 0)
          {
            -[HDSQLiteDatabase _schemaForDatabaseWithName:error:](self, v11, (uint64_t)a3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {

              v13 = 0;
              goto LABEL_15;
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v8)
          continue;
        break;
      }
    }

    v13 = v6;
LABEL_15:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __40__HDSQLiteDatabase_dumpSchemaWithError___block_invoke(uint64_t a1, HDSQLiteRow *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  HDSQLiteColumnWithNameAsString(a2, CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (void)unitTest_setCorruptionError:(id)a3
{
  objc_storeStrong((id *)&self->_corruptionError, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)isWriter
{
  return self->_writer;
}

- (void)setWriter:(BOOL)a3
{
  self->_writer = a3;
}

- (NSString)fileProtectionType
{
  return self->_fileProtectionType;
}

- (BOOL)checkpointRequired
{
  return self->_checkpointRequired;
}

- (void)setCheckpointRequired:(BOOL)a3
{
  self->_checkpointRequired = a3;
}

- (HDSQLiteDatabaseDelegate)delegate
{
  return (HDSQLiteDatabaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)cacheScope
{
  return self->_cacheScope;
}

- (void)setCacheScope:(int64_t)a3
{
  self->_cacheScope = a3;
}

- (HDSQLiteStatementCache)statementCache
{
  return self->_statementCache;
}

- (BOOL)encounteredOutOfSpace
{
  return self->_encounteredOutOfSpace;
}

- (void)setEncounteredOutOfSpace:(BOOL)a3
{
  self->_encounteredOutOfSpace = a3;
}

- (NSError)corruptionError
{
  return self->_corruptionError;
}

- (BOOL)permitWritesInReadTransaction
{
  return self->_permitWritesInReadTransaction;
}

- (void)setPermitWritesInReadTransaction:(BOOL)a3
{
  self->_permitWritesInReadTransaction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corruptionError, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileProtectionType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_onRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_onCommitBlocks, 0);
  objc_storeStrong((id *)&self->_beforeCommitBlocks, 0);
}

+ (void)memoryDatabaseFromURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_210F9A000, a1, a3, "Could not backup database on file into in-memory store with result code : %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)memoryDatabaseFromURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_210F9A000, a2, a3, "Could not convert database to in-memory store. Unable to open in-memory database with result code : %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_openForWriting:(uint8_t *)buf additionalFlags:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4;

  v4 = *a2;
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_210F9A000, log, OS_LOG_TYPE_ERROR, "%{public}@: Invalid fileProtectionType \"%{public}@\", buf, 0x16u);
}

- (void)performTransactionWithType:(void *)a1 error:(uint64_t)a2 usingBlock:.cold.1(void *a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_7(a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_4_0(&dword_210F9A000, v3, v4, "%{public}@ beforeCommitLoopLimit limit reached in transaction");

  OUTLINED_FUNCTION_8();
}

- (void)performTransactionWithType:(os_log_t)log error:usingBlock:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_210F9A000, log, OS_LOG_TYPE_FAULT, "Transaction block failed without an error.", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)performTransactionWithType:(uint64_t)a1 error:(uint64_t)a2 usingBlock:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_210F9A000, log, OS_LOG_TYPE_FAULT, "Cannot perform %@ transaction inside an existing %@ transaction", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_executeStatementWithError:(os_log_t)log statementProvider:bindingHandler:enumerationHandler:.cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_210F9A000, log, OS_LOG_TYPE_FAULT, "Unsafe statement in read-only transaction: %s", buf, 0xCu);
}

- (void)_executeStatementWithError:(void *)a1 statementProvider:(uint64_t)a2 bindingHandler:enumerationHandler:.cold.2(void *a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_7(a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_4_0(&dword_210F9A000, v3, v4, "%{public}@ Attempt to execute SQL within a commit or rollback block");

  OUTLINED_FUNCTION_8();
}

- (void)_stepStatement:(uint64_t)a3 hasRow:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_stepStatement:(uint8_t *)buf hasRow:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109634;
  *((_DWORD *)buf + 1) = 19;
  *((_WORD *)buf + 4) = 2082;
  *(_QWORD *)(buf + 10) = a1;
  *((_WORD *)buf + 9) = 2080;
  *(_QWORD *)(buf + 20) = a2;
  _os_log_debug_impl(&dword_210F9A000, log, OS_LOG_TYPE_DEBUG, "Constraint violation during statement step: [%d, %{public}s]  %s", buf, 0x1Cu);
}

- (void)validateForeignKeysForTable:(uint64_t)a3 databaseName:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, a2, a3, "Failed to validate foreign keys: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)typeOfColumn:inTable:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_210F9A000, v0, v1, "Failed to retrieve schema for '%{public}@': %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)enableIncrementalAutovacuumForDatabaseWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, a2, a3, "Failed to reset base value for CACHE_SPILL when enabling incremental autovacuum: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)enableIncrementalAutovacuumForDatabaseWithName:(NSObject *)a3 error:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_4(&dword_210F9A000, a2, a3, "Failed to set %lld for CACHE_SPILL when enabling incremental autovacuum: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)enableIncrementalAutovacuumForDatabaseWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_210F9A000, a2, a3, "Failed to retrieve base value for CACHE_SPILL when enabling incremental autovacuum: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
