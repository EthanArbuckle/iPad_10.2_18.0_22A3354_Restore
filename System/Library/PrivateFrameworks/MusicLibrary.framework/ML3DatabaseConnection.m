@implementation ML3DatabaseConnection

- (id)executeQuery:(id)a3 withParameters:(id)a4
{
  return -[ML3DatabaseConnection _internalExecuteQuery:withParameters:limitProperty:limitValue:](self, "_internalExecuteQuery:withParameters:limitProperty:limitValue:", a3, a4, 0, 0);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)flush
{
  -[ML3DatabaseConnection popToRootTransactionAndCommit:](self, "popToRootTransactionAndCommit:", 0);
  -[ML3DatabaseConnection _resetUnfinalizedStatements](self, "_resetUnfinalizedStatements");
}

- (BOOL)popToRootTransactionAndCommit:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  BOOL v6;
  int v8;
  ML3DatabaseConnection *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (!-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
    return 0;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ ending transaction", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[ML3DatabaseConnection _internalEndTransactionAndCommit:](self, "_internalEndTransactionAndCommit:", v3);
  os_unfair_lock_lock(&self->_lock);
  self->_transactionLevel = 0;
  self->_nestedTransactionWantsToRollback = 0;
  os_unfair_lock_unlock(&self->_lock);
  -[ML3DatabaseConnection _executeTransactionCommitBlocks:](self, "_executeTransactionCommitBlocks:", v3);
  return v6;
}

- (id)_internalExecuteQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  ML3DatabaseResult *v16;
  ML3DatabaseResult *v17;
  double v18;
  void *v19;
  id WeakRetained;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
  -[ML3DatabaseConnection _internalLogQuery:withParameters:limitProperty:limitValue:](self, "_internalLogQuery:withParameters:limitProperty:limitValue:", v12, v10, v11, a6);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v14 = v13;
  -[ML3DatabaseConnection _prepareStatement:error:](self, "_prepareStatement:error:", v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v10)
      objc_msgSend(v15, "bindValuesInArray:", v10);
    v16 = -[ML3DatabaseResult initWithStatement:connection:]([ML3DatabaseResult alloc], "initWithStatement:connection:", v15, self);
    v17 = v16;
    if (v11)
      -[ML3DatabaseResult setLimitProperty:limitValue:](v16, "setLimitProperty:limitValue:", v11, a6);
  }
  else
  {
    v17 = 0;
  }
  if (-[ML3DatabaseConnection logQueryPlans](self, "logQueryPlans"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Executed in %.1f"), v18 - v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@\n"), v19);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "connectionDidAccessDatabase:", self);

  return v17;
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  id v7;
  ML3DatabaseStatement *v8;
  ML3DatabaseStatement *v9;
  id v10;
  const char *v11;
  int v12;
  NSObject *v13;
  id v14;
  int v15;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  ML3DatabaseStatement *v21;
  ML3DatabaseStatement *v22;
  _BOOL4 v23;
  id v24;
  NSObject *v26;
  const char *Name;
  const char *v28;
  const char *sel;
  unsigned int v30;
  id v31;
  sqlite3_stmt *ppStmt;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
    -[ML3DatabaseStatementCache cachedStatementForSQL:](self->_statementCache, "cachedStatementForSQL:", v7);
    v8 = (ML3DatabaseStatement *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      -[ML3DatabaseStatement reset](v8, "reset");
    }
    else
    {
      sel = a2;
      v10 = objc_retainAutorelease(v7);
      v11 = (const char *)objc_msgSend(v10, "UTF8String");
      v30 = 0;
      ppStmt = 0;
      while (1)
      {
        while (1)
        {
          v12 = sqlite3_prepare_v3(self->_sqlitedb, v11, -1, 1u, &ppStmt, 0);
          if (v12 != 10)
            break;
          v13 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v36 = (const char *)v10;
            _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Disk IO error detected while preparing statement %{public}@", buf, 0xCu);
          }

          if (!-[ML3DatabaseConnection _handleDiskIOError](self, "_handleDiskIOError"))
          {
            ML3DatabaseCreateDiskIOError();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = a4;
            goto LABEL_29;
          }
        }
        v14 = v10;
        if (v12 > 0xAu)
          break;
        if (v12 - 5 >= 2)
        {
          if (!(_BYTE)v12)
          {
            v20 = a4;
            if (ppStmt)
            {
              v19 = 0;
              goto LABEL_30;
            }
LABEL_34:
            v33 = *MEMORY[0x1E0CB2D50];
            v34 = CFSTR("An unknown error occurred while preparing a database statement.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v22 = (ML3DatabaseStatement *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 300, v22);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
          goto LABEL_26;
        }
        v15 = v12;
        if (-[ML3DatabaseConnection _handleBusyLockWithNumberOfRetries:](self, "_handleBusyLockWithNumberOfRetries:", v30))
        {
          -[ML3DatabaseConnection sqliteError](self, "sqliteError");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _ML3LogCategoryDefault();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            Name = sel_getName(sel);
            v28 = "locked";
            *(_DWORD *)buf = 136315906;
            v36 = Name;
            v37 = 2080;
            if (v15 == 5)
              v28 = "busy";
            v38 = v28;
            v39 = 1024;
            v40 = v30;
            v41 = 2114;
            v42 = v19;
            _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_DEFAULT, "(%s) SQLite was %s after %u retries. %{public}@", buf, 0x26u);
          }

          v20 = a4;
          v10 = v14;
          goto LABEL_29;
        }
        ++v30;
      }
      if (v12 != 11 && v12 != 26)
      {
LABEL_26:
        -[ML3DatabaseConnection sqliteError](self, "sqliteError");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = a4;
        if (ppStmt)
        {
          sqlite3_finalize(ppStmt);
          ppStmt = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error preparing statement SQL. \"%@\" %@"), v10, v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3DatabaseException databaseExceptionWithReason:sqliteError:](ML3DatabaseException, "databaseExceptionWithReason:sqliteError:", v17, v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "raise");

        goto LABEL_29;
      }
      v20 = a4;
      if (ppStmt)
      {
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
      }
      -[ML3DatabaseConnection _handleDatabaseCorruption](self, "_handleDatabaseCorruption");
      ML3DatabaseCreateCorruptionError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
      if (!ppStmt)
      {
        if (v19)
        {
          v9 = 0;
          goto LABEL_37;
        }
        goto LABEL_34;
      }
LABEL_30:
      v21 = [ML3DatabaseStatement alloc];
      v22 = -[ML3DatabaseStatement initWithSQLiteStatement:SQL:](v21, "initWithSQLiteStatement:SQL:", ppStmt, v10);
      v31 = v19;
      v23 = -[ML3DatabaseConnection _validatePreparedStatement:error:](self, "_validatePreparedStatement:error:", v22, &v31);
      v24 = v31;

      if (v23)
      {
        v22 = v22;
        -[ML3DatabaseStatementCache cacheStatement:](self->_statementCache, "cacheStatement:", v22);
        v9 = v22;
        goto LABEL_36;
      }
LABEL_35:
      v9 = 0;
LABEL_36:

      v19 = v24;
LABEL_37:
      if (v20 && v19)
        *v20 = objc_retainAutorelease(v19);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_internalLogQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  if (-[ML3DatabaseConnection logQueryPlans](self, "logQueryPlans"))
  {
    -[ML3DatabaseConnection setLogQueryPlans:](self, "setLogQueryPlans:", 0);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("EXPLAIN QUERY PLAN for: %@\n"), v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("EXPLAIN QUERY PLAN "), "stringByAppendingString:", v16);
    v13 = objc_claimAutoreleasedReturnValue();

    -[ML3DatabaseConnection _internalExecuteQuery:withParameters:limitProperty:limitValue:](self, "_internalExecuteQuery:withParameters:limitProperty:limitValue:", v13, v10, v11, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__ML3DatabaseConnection__internalLogQuery_withParameters_limitProperty_limitValue___block_invoke;
    v17[3] = &unk_1E5B65EE0;
    v18 = v12;
    v15 = v12;
    objc_msgSend(v14, "enumerateRowsWithBlock:", v17);
    NSLog(CFSTR("%@\n"), v15);
    -[ML3DatabaseConnection setLogQueryPlans:](self, "setLogQueryPlans:", 1);

    v16 = (id)v13;
  }

}

- (BOOL)logQueryPlans
{
  return self->_logQueryPlans;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *databasePath;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  id WeakRetained;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  databasePath = self->_databasePath;
  v6 = CFSTR("YES");
  if (-[ML3DatabaseConnection isOpen](self, "isOpen"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[ML3DatabaseConnection isReadOnly](self, "isReadOnly"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[ML3DatabaseConnection _closeConnectionWhenCheckingIn](self, "_closeConnectionWhenCheckingIn"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (!-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
    v6 = CFSTR("NO");
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningPool);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, path=%@, open=%@, readonly=%@, _closeConnectionWhenCheckingIn=%@, in transaction=%@, owning pool=%@>"), v4, self, databasePath, v7, v8, v9, v6, WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_ensureConnectionIsOpen
{
  if (!-[ML3DatabaseConnection isOpen](self, "isOpen"))
  {
    -[ML3DatabaseConnection open](self, "open");
    if (!-[ML3DatabaseConnection isOpen](self, "isOpen"))
      -[ML3DatabaseConnection _raiseConnectionClosedException](self, "_raiseConnectionClosedException");
  }
}

- (BOOL)isOpen
{
  return self->_isOpen && self->_sqlitedb != 0;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (BOOL)isInTransaction
{
  return -[ML3DatabaseConnection transactionLevel](self, "transactionLevel") != 0;
}

- (unint64_t)transactionLevel
{
  os_unfair_lock_s *p_lock;
  unint64_t transactionLevel;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transactionLevel = self->_transactionLevel;
  os_unfair_lock_unlock(p_lock);
  return transactionLevel;
}

- (void)_resetUnfinalizedStatements
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ML3DatabaseStatementCache allStatements](self->_statementCache, "allStatements", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)open
{
  uint64_t v2;

  if (self->_isReadOnly)
    v2 = 1;
  else
    v2 = 2;
  return -[ML3DatabaseConnection _openWithFlags:](self, "_openWithFlags:", v2);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (void)_setOwningPool:(id)a3
{
  objc_storeWeak((id *)&self->_owningPool, a3);
}

- (BOOL)_closeConnectionWhenCheckingIn
{
  ML3DatabaseConnection *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_closeConnectionWhenCheckingIn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 block:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  ML3DatabaseFunctionBlock *v10;
  _BOOL4 v11;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = -[ML3DatabaseFunction initWithName:argumentCount:]([ML3DatabaseFunctionBlock alloc], "initWithName:argumentCount:", v9, v5);

  -[ML3DatabaseFunctionBlock setBlock:](v10, "setBlock:", v8);
  v11 = -[ML3DatabaseFunctionBlock registerWithConnection:](v10, "registerWithConnection:", self);
  if (v11)
    -[NSMutableArray addObject:](self->_registeredFunctions, "addObject:", v10);

  return v11;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5 userData:(void *)a6
{
  uint64_t v8;
  id v10;
  ML3DatabaseFunctionPointer *v11;
  _BOOL4 v12;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = -[ML3DatabaseFunction initWithName:argumentCount:]([ML3DatabaseFunctionPointer alloc], "initWithName:argumentCount:", v10, v8);

  -[ML3DatabaseFunctionPointer setFunctionPointer:](v11, "setFunctionPointer:", a5);
  if (a6)
    -[ML3DatabaseFunctionPointer setUserData:](v11, "setUserData:", a6);
  v12 = -[ML3DatabaseFunctionPointer registerWithConnection:](v11, "registerWithConnection:", self);
  if (v12)
    -[NSMutableArray addObject:](self->_registeredFunctions, "addObject:", v11);

  return v12;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5
{
  return -[ML3DatabaseConnection registerFunctionName:argumentCount:functionPointer:userData:](self, "registerFunctionName:argumentCount:functionPointer:userData:", a3, *(_QWORD *)&a4, a5, 0);
}

- (sqlite3)_sqliteHandle
{
  return self->_sqlitedb;
}

- (BOOL)_validatePreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[ML3DatabaseConnection isReadOnly](self, "isReadOnly") && (objc_msgSend(v6, "isReadOnly") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to write a readonly database with statement %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x1E0CB2D50];
    v21[0] = v8;
    objc_msgSend((id)objc_opt_class(), "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v9;
    -[ML3DatabaseConnection description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 200, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "sql");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Error preparing statement SQL. \"%{public}@\" %{public}@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)executeQuery:(id)a3
{
  return -[ML3DatabaseConnection _internalExecuteQuery:withParameters:limitProperty:limitValue:](self, "_internalExecuteQuery:withParameters:limitProperty:limitValue:", a3, 0, 0, 0);
}

- (BOOL)databasePathExists
{
  void *v4;
  char v5;

  if (ML3IsMemorySQLiteDatabasePath(self->_databasePath))
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", self->_databasePath);

  return v5;
}

- (void)setReadOnly:(BOOL)a3
{
  _BOOL4 v5;

  v5 = -[ML3DatabaseConnection isOpen](self, "isOpen");
  if (-[ML3DatabaseConnection isOpen](self, "isOpen"))
    -[ML3DatabaseConnection close](self, "close");
  self->_isReadOnly = a3;
  if (v5)
    -[ML3DatabaseConnection open](self, "open");
}

- (void)setJournalingMode:(unint64_t)a3
{
  self->_journalingMode = a3;
}

- (ML3DatabaseConnection)initWithDatabasePath:(id)a3
{
  id v4;
  ML3DatabaseConnection *v5;
  ML3DatabaseConnection *v6;
  uint64_t v7;
  NSString *databasePath;
  ML3DatabaseStatementCache *v9;
  ML3DatabaseStatementCache *statementCache;
  NSMutableArray *v11;
  NSMutableArray *enqueuedTransactionCommitBlocks;
  NSMutableArray *v13;
  NSMutableArray *registeredFunctions;
  NSMutableArray *v15;
  NSMutableArray *registeredModules;
  NSUUID *v17;
  NSUUID *uniqueIdentifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ML3DatabaseConnection;
  v5 = -[ML3DatabaseConnection init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    databasePath = v6->_databasePath;
    v6->_databasePath = (NSString *)v7;

    v6->_isOpen = 0;
    v6->_isReadOnly = -[ML3DatabaseConnection _isDeviceMediaLibraryDatabase](v6, "_isDeviceMediaLibraryDatabase");
    *(_OWORD *)&v6->_journalingMode = xmmword_1AC3DCE60;
    v6->_checkpointStatementThreshold = 1000;
    v6->_automaticCheckpointingEnabled = 0;
    *(_WORD *)&v6->_isHandlingIOError = 0;
    v6->_closeConnectionWhenCheckingIn = 0;
    v6->_sqlitedb = 0;
    v9 = -[ML3DatabaseStatementCache initWithCacheSize:]([ML3DatabaseStatementCache alloc], "initWithCacheSize:", 10);
    statementCache = v6->_statementCache;
    v6->_statementCache = v9;

    v6->_statementsSinceLastCheckpoint = 0;
    v6->_transactionLevel = 0;
    v6->_nestedTransactionWantsToRollback = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedTransactionCommitBlocks = v6->_enqueuedTransactionCommitBlocks;
    v6->_enqueuedTransactionCommitBlocks = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredFunctions = v6->_registeredFunctions;
    v6->_registeredFunctions = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredModules = v6->_registeredModules;
    v6->_registeredModules = v15;

    v17 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = v17;

  }
  return v6;
}

- (id)_databaseFilePaths
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (_databaseFilePaths___once != -1)
    dispatch_once(&_databaseFilePaths___once, &__block_literal_global_21139);
  v4 = (void *)_databaseFilePaths___dbfileSuffixesForJournalingMode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_journalingMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != -1)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      -[ML3DatabaseConnection databasePath](self, "databasePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v9)
      {
        objc_msgSend(v6, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      if (objc_msgSend(v8, "fileExistsAtPath:", v11))
        objc_msgSend(v3, "addObject:", v11);

      v9 = v10;
    }
    while (v7 + 1 > (unint64_t)v10++);
  }

  return v3;
}

- (BOOL)_isDeviceMediaLibraryDatabase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_stringByResolvingRealPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3DatabaseConnection databasePath](self, "databasePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", v4) & 1) != 0)
  {
    -[ML3DatabaseConnection databasePath](self, "databasePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("MediaLibrary.sqlitedb"));

    if ((v7 & 1) != 0)
    {
      v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ML3DatabaseConnection databasePath](self, "databasePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Database at path %{public}@, mediaFolderPath %{public}@ is not mediaLibraryDatabase", (uint8_t *)&v12, 0x16u);

  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)_openWithFlags:(int)a3
{
  id WeakRetained;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  BOOL v12;
  _BOOL4 isReadOnly;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSString *databasePath;
  _BOOL4 v21;
  void *v22;
  char v23;
  unint64_t protectionLevel;
  int v25;
  int v26;
  uint64_t v27;
  const char *v28;
  int v29;
  int v30;
  uint64_t v31;
  _BOOL8 v32;
  unint64_t journalingMode;
  NSObject *v34;
  const __CFString *v35;
  NSObject *v36;
  NSString *v37;
  const char *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void *v63;
  int v64;
  id v65;
  id v66;
  int v67;
  int v68;
  NSObject *v69;
  uint64_t v70;
  sqlite3 *sqlitedb;
  NSObject *v72;
  id v73;
  uint64_t v74;
  NSString *v75;
  const char *v76;
  __CFString *v77;
  uint64_t v78;
  uint64_t *v79;
  NSString *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  void *v91;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  void *v98;
  int v99;
  BOOL v100;
  id v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  _BOOL4 v106;
  void *v107;
  void *v108;
  int v109;
  BOOL v110;
  void *v111;
  void *v112;
  void *v113;
  unsigned int v114;
  void *v115;
  dispatch_semaphore_t v116;
  const __CFString *v117;
  void *v118;
  unsigned int v119;
  void *v120;
  BOOL v121;
  void *v122;
  unsigned int v123;
  void *v124;
  unsigned int v125;
  void *v126;
  void *v127;
  void *v128;
  ML3DatabaseConnection *v129;
  _QWORD v130[4];
  NSObject *v131;
  id v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  char value;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  int v143;
  int v144;
  sqlite3 *ppDb;
  char *errmsg;
  _QWORD v147[11];
  _QWORD v148[11];
  void *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  id v152[3];
  _BYTE buf[24];
  __int128 v154;
  __int16 v155;
  int v156;
  __int16 v157;
  int v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  if (self->_databasePath)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "connectionWillOpenDatabase:", self);
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isReadOnly)
        v7 = CFSTR("readonly");
      else
        v7 = CFSTR("readwrite");
      -[ML3DatabaseConnection databasePath](self, "databasePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&v154 = v8;
      WORD4(v154) = 1024;
      *(_DWORD *)((char *)&v154 + 10) = a3;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Trying to open %{public}@ connection %{public}@ to database at path %{public}@ with flags=%d", buf, 0x26u);

    }
    if ((a3 & 2) != 0)
    {
      self->_isReadOnly = 0;
      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        isReadOnly = self->_isReadOnly;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = isReadOnly;
        v11 = "Adjusting connection %{public}@ setting _isReadOnly=%{BOOL}u as the flags are SQLITE_OPEN_READWRITE";
        goto LABEL_16;
      }
    }
    else
    {
      if ((a3 & 1) == 0)
      {
LABEL_18:
        if (-[ML3DatabaseConnection _databaseFilesAreWritable](self, "_databaseFilesAreWritable")
          || self->_journalingMode == 1)
        {
          a3 = a3 & 0xFFFFFFFC | 2;
          v14 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = a3;
            _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Adjusting connection %{public}@ setting openFlags=%d to account for WAL files", buf, 0x12u);
          }

        }
        v15 = __daemonProcessInfo;
        v16 = __daemonProcessInfo != 0;
        if (__daemonProcessInfo)
        {
          a3 |= 0x1000000u;
          v17 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = a3;
            _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "Adjusting connection %{public}@ setting openFlags=%d for medialibrary deamon", buf, 0x12u);
          }

        }
        v18 = -[ML3DatabaseConnection _isDeviceMediaLibraryDatabase](self, "_isDeviceMediaLibraryDatabase");
        if (!v18)
          v16 = !self->_isReadOnly;
        v19 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          databasePath = self->_databasePath;
          v21 = self->_isReadOnly;
          *(_DWORD *)buf = 138544898;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = databasePath;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v154) = v21;
          WORD2(v154) = 1024;
          *(_DWORD *)((char *)&v154 + 6) = v18;
          WORD5(v154) = 1024;
          HIDWORD(v154) = v15 != 0;
          v155 = 1024;
          v156 = v16;
          v157 = 1024;
          v158 = a3;
          _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ attempting to open database at %{public}@ _isReadOnly=%{BOOL}u, isDeviceMediaLibraryDatabase=%{BOOL}u, isMediaLibraryDeamon=%{BOOL}u, canCreateDatabase=%{BOOL}u, openFlags=%d,", buf, 0x34u);
        }

        if ((_DWORD)v16)
        {
          a3 |= 4u;
          -[ML3DatabaseConnection _createDatabaseDirectoryIfNonexistent](self, "_createDatabaseDirectoryIfNonexistent");
        }
        else if (self->_isReadOnly)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "fileExistsAtPath:", self->_databasePath);

          if ((v23 & 1) == 0)
          {
            v36 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = self->_databasePath;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v37;
              _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_ERROR, "Connection %{public}@ is readOnly, creating DB is NOT allowed and database file doesn't exist at %{public}@", buf, 0x16u);
            }

            v12 = 0;
            goto LABEL_141;
          }
        }
        protectionLevel = self->_protectionLevel;
        if (protectionLevel > 3)
          v25 = 7340032;
        else
          v25 = dword_1AC3DCE90[protectionLevel];
        v26 = v25 | a3;
        ppDb = 0;
        errmsg = 0;
        v27 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
        *(_QWORD *)&v154 = &__block_descriptor_33_e5_v8__0l;
        BYTE8(v154) = 1;
        _MLDispatchToSerialQueue(0, buf);
        v28 = -[NSString fileSystemRepresentation](self->_databasePath, "fileSystemRepresentation");
        v29 = sqlite3_open_v2(v28, &ppDb, v26, 0);
        v127 = WeakRetained;
        v129 = self;
        v125 = v26;
        if (v29)
        {
          v30 = v29;
          v31 = v29;
          v32 = v29 == 11 || v29 == 267 || v29 == 26;
          v38 = sqlite3_errstr(v29);
          v39 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = "<nil>";
            *(_DWORD *)buf = 136447234;
            if (v38)
              v40 = v38;
            *(_QWORD *)&buf[4] = v28;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v30;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v31;
            LOWORD(v154) = 1024;
            *(_DWORD *)((char *)&v154 + 2) = v32;
            WORD3(v154) = 2082;
            *((_QWORD *)&v154 + 1) = v40;
            _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_DEFAULT, "SQLite detected while opening database at '%{public}s'. errorCode=%d, minimalCode=%d, corrupted=%{BOOL}u, errorMsg=%{public}s", buf, 0x28u);
          }

          if (v32)
          {
            ML3DatabaseCreateCorruptionError();
            v41 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (((v30 & 0xFB) == 0xA || (_DWORD)v31 == 15)
              && -[ML3DatabaseConnection _handleDiskIOError](self, "_handleDiskIOError"))
            {
              v32 = 0;
              v128 = 0;
LABEL_66:
              v42 = 0;
              v43 = 0;
              v44 = 0;
              goto LABEL_113;
            }
            -[ML3DatabaseConnection sqliteError](self, "sqliteError");
            v41 = objc_claimAutoreleasedReturnValue();
          }
          v128 = (void *)v41;
          goto LABEL_66;
        }
        sqlite3_extended_result_codes(ppDb, 1);
        journalingMode = self->_journalingMode;
        v114 = v16;
        if (journalingMode)
        {
          if (journalingMode != 1)
          {
            v121 = 1;
            v119 = 0;
            v123 = 0;
            v117 = 0;
            goto LABEL_86;
          }
          v144 = 1;
          v123 = sqlite3_file_control(ppDb, 0, 10, &v144);
          if (v123)
          {
            v34 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v123;
              _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ could not enable SQLITE_FCNTL_PERSIST_WAL option, result %d", buf, 0x12u);
            }

            v35 = CFSTR("enable SQLITE_FCNTL_PERSIST_WAL option failed");
            if (!-[ML3DatabaseConnection _handleConnectionErrorWhileOpening:](self, "_handleConnectionErrorWhileOpening:", v123))
            {
              v117 = CFSTR("enable SQLITE_FCNTL_PERSIST_WAL option failed");
              v119 = 0;
LABEL_72:
              v121 = 0;
LABEL_86:
              v152[0] = self->_databasePath;
              objc_msgSend(v152[0], "stringByAppendingString:", CFSTR("-shm"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v152[1] = v54;
              -[NSString stringByAppendingString:](self->_databasePath, "stringByAppendingString:", CFSTR("-wal"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v152[2] = v55;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 3);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              v141 = 0u;
              v142 = 0u;
              v139 = 0u;
              v140 = 0u;
              v57 = v56;
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
              if (v58)
              {
                v59 = v58;
                v60 = *(_QWORD *)v140;
                do
                {
                  for (i = 0; i != v59; ++i)
                  {
                    if (*(_QWORD *)v140 != v60)
                      objc_enumerationMutation(v57);
                    v62 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i);
                    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = objc_msgSend(v63, "fileExistsAtPath:", v62);

                    if (v64)
                    {
                      value = 0;
                      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v62);
                      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                      if (getxattr((const char *)objc_msgSend(v65, "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", 0, 0, 0, 0) == 1)getxattr((const char *)objc_msgSend(objc_retainAutorelease(v65), "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
                      if (!value)
                      {
                        value = -1;
                        v66 = objc_retainAutorelease(v65);
                        v67 = setxattr((const char *)objc_msgSend(v66, "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
                        if (v67)
                        {
                          v68 = v67;
                          v69 = os_log_create("com.apple.amp.medialibrary", "Default");
                          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138543874;
                            *(_QWORD *)&buf[4] = self;
                            *(_WORD *)&buf[12] = 2114;
                            *(_QWORD *)&buf[14] = v66;
                            *(_WORD *)&buf[22] = 1024;
                            LODWORD(v154) = v68;
                            _os_log_impl(&dword_1AC149000, v69, OS_LOG_TYPE_ERROR, "%{public}@ Failed to set can-suspend-locked xattr on file %{public}@. err=%d", buf, 0x1Cu);
                          }

                        }
                      }

                    }
                  }
                  v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
                }
                while (v59);
              }

              if (v121)
              {
                WeakRetained = v127;
                v70 = MEMORY[0x1E0C809B0];
                v43 = v123;
                if (__daemonProcessInfo
                  && !self->_isReadOnly
                  && (v104 = sqlite3_exec(ppDb, "PRAGMA cache_size=500", 0, 0, &errmsg), (_DWORD)v104))
                {
                  v44 = v104;
                  _ML3LogCategoryDefault();
                  v105 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = self;
                    *(_WORD *)&buf[12] = 2082;
                    *(_QWORD *)&buf[14] = errmsg;
                    *(_WORD *)&buf[22] = 1024;
                    LODWORD(v154) = v44;
                    _os_log_impl(&dword_1AC149000, v105, OS_LOG_TYPE_DEFAULT, "Warning: connection %{public}@ could not set cache size. %{public}s, result %d", buf, 0x1Cu);
                  }

                  v106 = -[ML3DatabaseConnection _handleConnectionErrorWhileOpening:](self, "_handleConnectionErrorWhileOpening:", v44);
                  *(_QWORD *)buf = v70;
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
                  *(_QWORD *)&v154 = &__block_descriptor_33_e5_v8__0l;
                  BYTE8(v154) = 0;
                  _MLDispatchToSerialQueue(0, buf);
                  if (!v106)
                  {
                    v32 = 0;
                    v128 = 0;
                    v31 = 0;
                    v42 = CFSTR("set cache size error");
                    v16 = v114;
                    goto LABEL_114;
                  }
                }
                else
                {

                  *(_QWORD *)buf = v70;
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
                  *(_QWORD *)&v154 = &__block_descriptor_33_e5_v8__0l;
                  BYTE8(v154) = 0;
                  _MLDispatchToSerialQueue(0, buf);
                }
                self->_isOpen = 1;
                sqlitedb = ppDb;
                self->_sqlitedb = ppDb;
                if (self->_iTunesExtensions)
                {
                  DestroySQLExtensions((sqlite3 **)self->_iTunesExtensions);
                  sqlitedb = self->_sqlitedb;
                }
                self->_iTunesExtensions = (const void *)CreateSQLExtensionsOnSqliteConnection(sqlitedb);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v127, "connectionDidOpenDatabase:", self);
                if (getuid())
                {
                  v12 = 1;
LABEL_141:

                  return v12;
                }
                -[ML3DatabaseConnection _databaseFilePaths](self, "_databaseFilePaths");
                v134 = 0u;
                v135 = 0u;
                v136 = 0u;
                v137 = 0u;
                v77 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                v93 = -[__CFString countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v134, v150, 16);
                if (v93)
                {
                  v94 = v93;
                  v91 = 0;
                  v95 = *(_QWORD *)v135;
                  do
                  {
                    for (j = 0; j != v94; ++j)
                    {
                      if (*(_QWORD *)v135 != v95)
                        objc_enumerationMutation(v77);
                      v97 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * j);
                      objc_msgSend(v97, "pathComponents");
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      v99 = objc_msgSend(v98, "containsObject:", CFSTR("mobile"));

                      if (v99)
                      {
                        v133 = v91;
                        v100 = ML3RepairFilePermissions(v97, &v133);
                        v101 = v133;

                        if (!v100)
                        {
                          v102 = os_log_create("com.apple.amp.medialibrary", "Default");
                          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                          {
                            objc_msgSend(v97, "lastPathComponent");
                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543618;
                            *(_QWORD *)&buf[4] = v103;
                            *(_WORD *)&buf[12] = 2114;
                            *(_QWORD *)&buf[14] = v101;
                            _os_log_impl(&dword_1AC149000, v102, OS_LOG_TYPE_DEFAULT, "Error repairing permissions for database file %{public}@. %{public}@", buf, 0x16u);

                          }
                        }
                        v91 = v101;
                      }
                    }
                    v94 = -[__CFString countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v134, v150, 16);
                  }
                  while (v94);
                }
                else
                {
                  v91 = 0;
                }

                -[__CFString lastObject](v77, "lastObject");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "stringByDeletingLastPathComponent");
                v88 = objc_claimAutoreleasedReturnValue();

                -[NSObject pathComponents](v88, "pathComponents");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = objc_msgSend(v108, "containsObject:", CFSTR("mobile"));

                if (!v109)
                {
                  v12 = 1;
                  WeakRetained = v127;
                  goto LABEL_140;
                }
                v132 = v91;
                v110 = ML3RepairFilePermissions(v88, &v132);
                v89 = v132;

                WeakRetained = v127;
                if (v110)
                {
                  v12 = 1;
                  goto LABEL_139;
                }
                _ML3LogCategoryDefault();
                v90 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v88;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v89;
                  _os_log_impl(&dword_1AC149000, v90, OS_LOG_TYPE_DEFAULT, "Error repairing permissions for database directory %{public}@. %{public}@", buf, 0x16u);
                }
                v12 = 1;
LABEL_138:

LABEL_139:
                v91 = v89;
LABEL_140:

                goto LABEL_141;
              }

              v32 = 0;
              v128 = 0;
              v31 = 0;
              v16 = v114;
              v27 = MEMORY[0x1E0C809B0];
              v42 = v117;
              v43 = v123;
              v44 = v119;
LABEL_113:
              *(_QWORD *)buf = v27;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
              *(_QWORD *)&v154 = &__block_descriptor_33_e5_v8__0l;
              BYTE8(v154) = 0;
              _MLDispatchToSerialQueue(0, buf);
LABEL_114:
              self->_isOpen = 0;
              v72 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                v73 = (id)objc_opt_class();
                v74 = v44;
                v75 = self->_databasePath;
                v76 = sqlite3_errmsg(ppDb);
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v73;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v75;
                v44 = v74;
                *(_WORD *)&buf[22] = 2082;
                *(_QWORD *)&v154 = v76;
                _os_log_impl(&dword_1AC149000, v72, OS_LOG_TYPE_ERROR, "[%@] Unable to open database connection to path %{public}@. %{public}s", buf, 0x20u);

              }
              if (errmsg)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), errmsg);
                v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v77 = &stru_1E5B66908;
              }
              v116 = dispatch_semaphore_create(0);
              v118 = (void *)MEMORY[0x1E0D4D030];
              v147[0] = CFSTR("corrupted");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              v148[0] = v124;
              v147[1] = CFSTR("openError");
              v78 = (uint64_t)v128;
              if (!v128)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v78 = objc_claimAutoreleasedReturnValue();
              }
              v79 = (uint64_t *)MEMORY[0x1E0D4CE40];
              v111 = (void *)v78;
              v148[1] = v78;
              v147[2] = CFSTR("minimalCode");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v148[2] = v122;
              v147[3] = CFSTR("canCreateDatabase");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v148[3] = v120;
              v147[4] = CFSTR("openFlags");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v125);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              v148[4] = v126;
              v147[5] = CFSTR("isReadOnly");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isReadOnly);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v148[5] = v115;
              v147[6] = CFSTR("sqliteResult");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v148[6] = v113;
              v147[7] = CFSTR("walResult");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v148[7] = v112;
              v147[8] = CFSTR("path");
              v80 = self->_databasePath;
              v81 = v80;
              if (!v80)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v82 = *v79;
              v148[8] = v81;
              v147[9] = CFSTR("context");
              v83 = (void *)v42;
              if (!v42)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v84 = v42;
              v148[9] = v83;
              v147[10] = CFSTR("sqlErrorString");
              v85 = v77;
              if (!v77)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v148[10] = v85;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, v147, 11);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v149 = v86;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v130[0] = MEMORY[0x1E0C809B0];
              v130[1] = 3221225472;
              v130[2] = __40__ML3DatabaseConnection__openWithFlags___block_invoke;
              v130[3] = &unk_1E5B65D80;
              v88 = v116;
              v131 = v88;
              objc_msgSend(v118, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v82, CFSTR("Bug"), CFSTR("Database Validation Bug"), CFSTR("database open error"), 0, v87, v130);

              if (!v77)
              WeakRetained = v127;
              if (!v84)

              if (!v80)
              v89 = v128;
              if (!v128)

              dispatch_semaphore_wait(v88, 0xFFFFFFFFFFFFFFFFLL);
              -[ML3DatabaseConnection _logDatabaseFileDebugInformation](v129, "_logDatabaseFileDebugInformation");
              sqlite3_close(ppDb);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v127, "connection:didFailToOpenDatabaseWithError:", v129, v128);
              v12 = 0;
              v90 = v131;
              goto LABEL_138;
            }
          }
          else
          {
            v35 = 0;
          }
          v49 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, &errmsg);
          if ((_DWORD)v49)
          {
            v50 = v49;
            v51 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = errmsg;
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v154) = v50;
              _os_log_impl(&dword_1AC149000, v51, OS_LOG_TYPE_DEFAULT, "Warning: connection %{public}@ could not enable WAL journal mode. %{public}s, result %d", buf, 0x1Cu);
            }
            v119 = 0;
            v52 = CFSTR("enable WAL journal mode failed");
            v123 = v50;
LABEL_84:
            v117 = v52;

            v121 = -[ML3DatabaseConnection _handleConnectionErrorWhileOpening:](self, "_handleConnectionErrorWhileOpening:", v50);
            goto LABEL_86;
          }
        }
        else
        {
          v143 = 0;
          v45 = sqlite3_file_control(ppDb, 0, 10, &v143);
          if ((_DWORD)v45)
          {
            v46 = v45;
            v47 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v46;
              _os_log_impl(&dword_1AC149000, v47, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ could not disable SQLITE_FCNTL_PERSIST_WAL option, result %d", buf, 0x12u);
            }

            v119 = v46;
            v48 = -[ML3DatabaseConnection _handleConnectionErrorWhileOpening:](self, "_handleConnectionErrorWhileOpening:", v46);
            v35 = CFSTR("disable SQLITE_FCNTL_PERSIST_WAL option failed");
            if (!v48)
            {
              v117 = CFSTR("disable SQLITE_FCNTL_PERSIST_WAL option failed");
              v123 = 0;
              goto LABEL_72;
            }
          }
          else
          {
            v35 = 0;
          }
          v53 = sqlite3_exec(ppDb, "PRAGMA journal_mode=DELETE", 0, 0, &errmsg);
          if ((_DWORD)v53)
          {
            v50 = v53;
            v51 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = errmsg;
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v154) = v50;
              _os_log_impl(&dword_1AC149000, v51, OS_LOG_TYPE_DEFAULT, "Warning: connection %{public}@ could not update journaling mode to DELETE. %{public}s, result %d", buf, 0x1Cu);
            }
            v123 = 0;
            v52 = CFSTR("update journaling mode to DELETE failed");
            v119 = v50;
            goto LABEL_84;
          }
        }
        v117 = v35;
        v119 = 0;
        v123 = 0;
        v121 = 1;
        goto LABEL_86;
      }
      self->_isReadOnly = 1;
      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_isReadOnly;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        v11 = "Adjusting connection %{public}@ setting _isReadOnly=%{BOOL}u as the flags are SQLITE_OPEN_READONLY";
LABEL_16:
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0x12u);
      }
    }

    goto LABEL_18;
  }
  ML3DatabaseConnectionRaiseNilDatabasePath();
  return 0;
}

- (BOOL)_databaseFilesAreWritable
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseConnection _databaseFilePaths](self, "_databaseFilePaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(v3, "isWritableFileAtPath:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9))
        {
          LOBYTE(v5) = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
    LOBYTE(v5) = 1;
  }
LABEL_11:

  return v5;
}

- (void)setPrivacyContext:(id)a3
{
  objc_storeStrong((id *)&self->_privacyContext, a3);
}

- (void)_createDatabaseDirectoryIfNonexistent
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) == 0)
  {
    v7 = 0;
    v5 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v7);
    v6 = v7;
    if ((v5 & 1) == 0)
    {
      ML3DatabaseConnectionCheckDatabasePathAndRaiseIfNecessary(self->_databasePath);
      ML3RaiseExceptionWithError(v6);
    }

  }
}

- (BOOL)pushTransaction
{
  return -[ML3DatabaseConnection pushTransactionUsingBehaviorType:](self, "pushTransactionUsingBehaviorType:", 0);
}

- (BOOL)pushTransactionUsingBehaviorType:(unint64_t)a3
{
  BOOL v5;
  NSObject *v6;
  int v8;
  ML3DatabaseConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
  {
    -[ML3DatabaseConnection setTransactionLevel:](self, "setTransactionLevel:", -[ML3DatabaseConnection transactionLevel](self, "transactionLevel") + 1);
    return 1;
  }
  else if (-[ML3DatabaseConnection _internalBeginTransactionWithBehaviorType:](self, "_internalBeginTransactionWithBehaviorType:", a3))
  {
    os_unfair_lock_lock(&self->_lock);
    self->_nestedTransactionWantsToRollback = 0;
    v5 = 1;
    self->_transactionLevel = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Warning: unable to begin transaction on connection: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
  return v5;
}

- (void)setCurrentTransactionID:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransactionID, a3);
}

- (BOOL)popTransactionAndCommit:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  unint64_t transactionLevel;
  _BOOL4 nestedTransactionWantsToRollback;
  _BOOL8 v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  ML3DatabaseConnection *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transactionLevel = self->_transactionLevel;
  nestedTransactionWantsToRollback = self->_nestedTransactionWantsToRollback;
  os_unfair_lock_unlock(p_lock);
  if (transactionLevel)
  {
    if (transactionLevel == 1)
    {
      v8 = !nestedTransactionWantsToRollback && v3;
      v3 = -[ML3DatabaseConnection _internalEndTransactionAndCommit:](self, "_internalEndTransactionAndCommit:", v8);
      if (v3)
      {
        os_unfair_lock_lock(p_lock);
        self->_transactionLevel = 0;
        self->_nestedTransactionWantsToRollback = 0;
        os_unfair_lock_unlock(p_lock);
      }
      else
      {
        v10 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138543362;
          v13 = self;
          _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Warning: unable to end transaction on connection %{public}@", (uint8_t *)&v12, 0xCu);
        }

      }
      -[ML3DatabaseConnection _executeTransactionCommitBlocks:](self, "_executeTransactionCommitBlocks:", v8);
    }
    else
    {
      os_unfair_lock_lock(p_lock);
      --self->_transactionLevel;
      self->_nestedTransactionWantsToRollback |= !v3;
      os_unfair_lock_unlock(p_lock);
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Warning: attempted to end a non-existent transaction.", (uint8_t *)&v12, 2u);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_executeTransactionCommitBlocks:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  ML3DatabaseConnection *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableArray copy](self->_enqueuedTransactionCommitBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_enqueuedTransactionCommitBlocks, "removeAllObjects");
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 1024;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ running %d transaction commit blocks", buf, 0x12u);
  }

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ML3DatabaseConnection__executeTransactionCommitBlocks___block_invoke;
  v9[3] = &unk_1E5B65BB0;
  v10 = v5;
  v11 = a3;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (BOOL)_internalEndTransactionAndCommit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSUUID *currentTransactionID;
  id v14;
  uint8_t buf[4];
  ML3DatabaseConnection *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "commitTransactionStatement");
  else
    objc_msgSend(v5, "rollbackTranscationStatement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v8 = -[ML3DatabaseConnection _internalExecuteUpdate:withParameters:error:](self, "_internalExecuteUpdate:withParameters:error:", v7, 0, &v14);
  v9 = v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "connection:didEndDatabaseTransactionAndCommit:", self, v3);
  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Error ending transaction on connection: %{public}@. %{public}@", buf, 0x16u);
    }

  }
  currentTransactionID = self->_currentTransactionID;
  self->_currentTransactionID = 0;

  return v8;
}

- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id WeakRetained;
  NSUUID *v10;
  NSUUID *currentTransactionID;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  ML3DatabaseConnection *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginTransactionStatementWithBehaviorType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v7 = -[ML3DatabaseConnection _internalExecuteUpdate:withParameters:error:](self, "_internalExecuteUpdate:withParameters:error:", v6, 0, &v14);
  v8 = v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!self->_currentTransactionID)
      {
        v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
        currentTransactionID = self->_currentTransactionID;
        self->_currentTransactionID = v10;

      }
      objc_msgSend(WeakRetained, "connectionDidBeginDatabaseTransaction:", self);
    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Error beginning transaction on connection: %{public}@. %{public}@", buf, 0x16u);
    }

  }
  return v7;
}

- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[ML3DatabaseConnection transactionMarkedForRollBack](self, "transactionMarkedForRollBack"))
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "failing update request in a transaction marked for rollback. sql=%{public}@", (uint8_t *)&v13, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = -[ML3DatabaseConnection _internalExecuteUpdate:withParameters:error:](self, "_internalExecuteUpdate:withParameters:error:", v8, v9, a5);
  }

  return v11;
}

- (BOOL)transactionMarkedForRollBack
{
  ML3DatabaseConnection *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_nestedTransactionWantsToRollback;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_internalExecuteUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  unint64_t v17;
  double v18;
  void *v19;
  id WeakRetained;
  id v22;
  id v23;

  v8 = a4;
  v9 = a3;
  -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
  -[ML3DatabaseConnection _internalLogQuery:withParameters:limitProperty:limitValue:](self, "_internalLogQuery:withParameters:limitProperty:limitValue:", v9, v8, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = v10;
  v23 = 0;
  -[ML3DatabaseConnection _prepareStatement:error:](self, "_prepareStatement:error:", v9, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v23;
  if (!v12)
  {
    v14 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (v8)
    objc_msgSend(v12, "bindValuesInArray:", v8);
  v22 = v13;
  v14 = -[ML3DatabaseConnection _executeStatement:withError:](self, "_executeStatement:withError:", v12, &v22);
  v15 = v22;

  objc_msgSend(v12, "reset");
  v13 = v15;
  if (a5)
  {
LABEL_7:
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
LABEL_9:
  v16 = self->_automaticCheckpointingEnabled && v14;
  if (v16 && !-[ML3DatabaseConnection isReadOnly](self, "isReadOnly"))
  {
    v17 = self->_statementsSinceLastCheckpoint + 1;
    self->_statementsSinceLastCheckpoint = v17;
    if (v17 >= self->_checkpointStatementThreshold
      && !-[ML3DatabaseConnection checkpointDatabase](self, "checkpointDatabase"))
    {
      self->_statementsSinceLastCheckpoint = 0;
    }
  }
  if (-[ML3DatabaseConnection logQueryPlans](self, "logQueryPlans"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Executed in %.1f"), v18 - v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@\n"), v19);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "connectionDidAccessDatabase:", self);

  return v14;
}

- (BOOL)_executeStatement:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  const char *Name;
  const char *v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  dispatch_semaphore_t v29;
  NSObject *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
  v8 = 0;
  v9 = *MEMORY[0x1E0D4CE30];
  while (1)
  {
    v10 = objc_msgSend(v7, "step");
    if (v10 - 5 >= 2)
      break;
    v11 = v10;
    objc_msgSend(v7, "reset");
    if (-[ML3DatabaseConnection _handleBusyLockWithNumberOfRetries:](self, "_handleBusyLockWithNumberOfRetries:", v8))
    {
      -[ML3DatabaseConnection sqliteError](self, "sqliteError");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        Name = sel_getName(a2);
        v16 = "locked";
        *(_DWORD *)buf = 136315906;
        v32 = Name;
        v33 = 2080;
        if (v11 == 5)
          v16 = "busy";
        v34 = v16;
        v35 = 1024;
        v36 = v8;
        v37 = 2114;
        v38 = v13;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "(%s) SQLite was %s after %u retries. %{public}@", buf, 0x26u);
      }
LABEL_24:

LABEL_25:
      if (a4 && v13)
      {
        v13 = objc_retainAutorelease(v13);
        *a4 = v13;
      }
      goto LABEL_28;
    }
    v8 = (v8 + 1);
  }
  if (v10 <= 0x63u)
  {
    if (v10 == 10)
    {
      v17 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v32 = (const char *)v7;
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Disk IO error detected while executing statement %{public}@", buf, 0xCu);
      }

      ML3DatabaseCreateDiskIOError();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3DatabaseConnection _handleDiskIOError](self, "_handleDiskIOError");
      goto LABEL_25;
    }
    if (v10 == 11 || v10 == 26)
    {
      v12 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = (const char *)v7;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Database corruption detected while executing statement %{public}@", buf, 0xCu);
      }

      -[ML3DatabaseConnection _handleDatabaseCorruption](self, "_handleDatabaseCorruption");
      ML3DatabaseCreateCorruptionError();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_23:
    -[ML3DatabaseConnection sqliteError](self, "sqliteError");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error stepping statement. %@ %@"), v7, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_semaphore_create(0);
    v27 = (void *)MEMORY[0x1E0D4D030];
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Error domain=%@ code=%@"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __53__ML3DatabaseConnection__executeStatement_withError___block_invoke;
    v28[3] = &unk_1E5B65D80;
    v29 = v18;
    v24 = v18;
    objc_msgSend(v27, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v9, CFSTR("Bug"), CFSTR("ML3SQLiteBug"), v22, 0, v23, v28);

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    +[ML3DatabaseException databaseExceptionWithReason:sqliteError:](ML3DatabaseException, "databaseExceptionWithReason:sqliteError:", v14, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise");

    goto LABEL_24;
  }
  if (v10 - 100 > 1)
    goto LABEL_23;
  if (objc_msgSend(v7, "clearBindingsAfterRunning"))
    objc_msgSend(v7, "clearBindings");
  v13 = 0;
LABEL_28:

  return v13 == 0;
}

- (ML3DatabaseConnectionDelegate)connectionDelegate
{
  return (ML3DatabaseConnectionDelegate *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

void __43__ML3DatabaseConnection__databaseFilePaths__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E5BAC4B0;
  v2[1] = &unk_1E5BAC4C8;
  v3[0] = &unk_1E5BAA9C8;
  v3[1] = &unk_1E5BAA9E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_databaseFilePaths___dbfileSuffixesForJournalingMode;
  _databaseFilePaths___dbfileSuffixesForJournalingMode = v0;

}

- (int)_distrustQueriesDuringBlock:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  int v6;
  NSObject *v7;
  sqlite3 *sqlitedb;
  const char *v9;
  int v10;
  BOOL v11;
  int v12;
  sqlite3 *v13;
  int v14;
  int v15;
  NSObject *v16;
  sqlite3 *v17;
  int v18;
  int v19;
  NSObject *v20;
  sqlite3 *v21;
  int v22;
  uint64_t pUserData;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  sqlite3 *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  pUserData = 0;
  v5 = sqlite3_set_authorizer(self->_sqlitedb, (int (__cdecl *)(void *, int, const char *, const char *, const char *, const char *))_databaseAuthorizer, (char *)&pUserData + 4);
  if (v5)
  {
    v6 = v5;
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sqlitedb = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      v26 = v6;
      v27 = 2048;
      v28 = sqlitedb;
      v9 = "Enabling authorizer failed: %d, connection: %p";
LABEL_10:
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v10 = sqlite3_db_config(self->_sqlitedb, 1010, 1, &pUserData);
  if (v10)
    v11 = 0;
  else
    v11 = (_DWORD)pUserData == 1;
  if (!v11)
  {
    v12 = v10;
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      v26 = v12;
      v27 = 2048;
      v28 = v13;
      v9 = "Enabling defensive mode failed: %d, connection: %p";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  v4[2](v4);
LABEL_12:
  v14 = sqlite3_db_config(self->_sqlitedb, 1010, 0, &pUserData);
  if (v14 | pUserData)
  {
    v15 = v14;
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      v26 = v15;
      v27 = 2048;
      v28 = v17;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Disabling defensive mode failed: %d, connection: %p", buf, 0x12u);
    }

  }
  v18 = sqlite3_set_authorizer(self->_sqlitedb, 0, 0);
  if (v18)
  {
    v19 = v18;
    v20 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      v26 = v19;
      v27 = 2048;
      v28 = v21;
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_ERROR, "Disabling authorizer failed: %d, connection: %p", buf, 0x12u);
    }

  }
  v22 = HIDWORD(pUserData);

  return v22;
}

- (NSUUID)currentTransactionID
{
  return self->_currentTransactionID;
}

void __57__ML3DatabaseConnection__executeTransactionCommitBlocks___block_invoke(uint64_t a1)
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

- (BOOL)schemaAddColumnDefinition:(id)a3 toTable:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnDefinition"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = -[ML3DatabaseConnection executeUpdate:withParameters:error:](self, "executeUpdate:withParameters:error:", v10, 0, &v17);
  v12 = v17;
  if (!v11)
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Could not add column to table %{public}@. %{public}@", buf, 0x16u);
    }

  }
  return v11;
}

- (BOOL)schemaInsertColumnDefinition:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[ML3DatabaseConnection schemaInsertColumnDefinitions:intoTable:atIndex:](self, "schemaInsertColumnDefinitions:intoTable:atIndex:", v11, v9, a5, v13, v14);
  return a5;
}

- (BOOL)schemaInsertColumnDefinitions:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD v27[4];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newDefinitions"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__ML3DatabaseConnection_SchemaUtilities__schemaInsertColumnDefinitions_intoTable_atIndex___block_invoke;
  v21[3] = &unk_1E5B61AE0;
  v25 = v27;
  v26 = a5;
  v14 = v12;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  v16 = v13;
  v24 = v16;
  -[ML3DatabaseConnection _enumerateTableColumnNamesAndDefinitionsFromTable:usingBlock:](self, "_enumerateTableColumnNamesAndDefinitionsFromTable:usingBlock:", v11, v21);
  v17 = -[ML3DatabaseConnection _alterTableNamed:withNewColumnDefinitions:newColumnNames:oldColumnNames:](self, "_alterTableNamed:withNewColumnDefinitions:newColumnNames:oldColumnNames:", v11, v14, v16, v16);

  _Block_object_dispose(v27, 8);
  return v17;
}

- (BOOL)schemaRenameColumn:(id)a3 inTable:(id)a4 toNewColumnName:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newName"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__ML3DatabaseConnection_SchemaUtilities__schemaRenameColumn_inTable_toNewColumnName___block_invoke;
  v25[3] = &unk_1E5B61B08;
  v26 = v9;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v9;
  -[ML3DatabaseConnection _enumerateTableColumnNamesAndDefinitionsFromTable:usingBlock:](self, "_enumerateTableColumnNamesAndDefinitionsFromTable:usingBlock:", v10, v25);
  v20 = -[ML3DatabaseConnection _alterTableNamed:withNewColumnDefinitions:newColumnNames:oldColumnNames:](self, "_alterTableNamed:withNewColumnDefinitions:newColumnNames:oldColumnNames:", v10, v17, v15, v16);

  return v20;
}

- (BOOL)schemaDeleteColumn:(id)a3 inTable:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName"));

  }
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ML3DatabaseConnection schemaDeleteColumns:inTable:](self, "schemaDeleteColumns:inTable:", v9, v8);

  return v10;
}

- (BOOL)schemaDeleteColumns:(id)a3 inTable:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__ML3DatabaseConnection_SchemaUtilities__schemaDeleteColumns_inTable___block_invoke;
  v18[3] = &unk_1E5B61B30;
  v11 = v7;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  v22 = &v23;
  -[ML3DatabaseConnection _enumerateTableColumnNamesAndDefinitionsFromTable:usingBlock:](self, "_enumerateTableColumnNamesAndDefinitionsFromTable:usingBlock:", v8, v18);
  if (*((_BYTE *)v24 + 24))
  {
    v14 = -[ML3DatabaseConnection _alterTableNamed:withNewColumnDefinitions:newColumnNames:oldColumnNames:](self, "_alterTableNamed:withNewColumnDefinitions:newColumnNames:oldColumnNames:", v8, v12, v13, v13);
  }
  else
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v8;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Could not find columns in table %{public}@", buf, 0xCu);
    }

    v14 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (void)_enumerateTableColumnNamesAndDefinitionsFromTable:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionAdditions.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v41[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnection executeQuery:withParameters:](self, "executeQuery:withParameters:", CFSTR("SELECT sql FROM sqlite_master WHERE type='table' AND name=?"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValueForFirstRowAndColumn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^CREATE( TEMPORARY)* TABLE \"*(\\w+)\"*( IF NOT EXISTS)* \\(([\\w\\s'\",]+)\\)"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\w+)( \\w+)*( \\w+)*"), 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "numberOfRanges") < 5)
  {
    v18 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Unable to parse table schema from sqlite_master.", buf, 2u);
    }
  }
  else
  {
    v31 = v15;
    v32 = v13;
    v34 = v7;
    v16 = objc_msgSend(v15, "rangeAtIndex:", 4);
    v33 = v12;
    objc_msgSend(v12, "substringWithRange:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject componentsSeparatedByString:](v18, "componentsSeparatedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v14, "firstMatchInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          if ((unint64_t)objc_msgSend(v25, "numberOfRanges") >= 2)
          {
            v27 = objc_msgSend(v25, "rangeAtIndex:", 1);
            objc_msgSend(v24, "substringWithRange:", v27, v28);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          ((void (**)(_QWORD, void *, void *))v9)[2](v9, v26, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }

    v12 = v33;
    v7 = v34;
    v15 = v31;
    v13 = v32;
  }

}

- (BOOL)_alterTableNamed:(id)a3 withNewColumnDefinitions:(id)a4 newColumnNames:(id)a5 oldColumnNames:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  ML3DatabaseConnection *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __114__ML3DatabaseConnection_SchemaUtilities___alterTableNamed_withNewColumnDefinitions_newColumnNames_oldColumnNames___block_invoke;
  v19[3] = &unk_1E5B61B58;
  v14 = v11;
  v20 = v14;
  v15 = v10;
  v25 = &v26;
  v21 = v15;
  v22 = self;
  v16 = v12;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  -[ML3DatabaseConnection performTransactionWithBlock:](self, "performTransactionWithBlock:", v19);
  LOBYTE(self) = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)self;
}

uint64_t __114__ML3DatabaseConnection_SchemaUtilities___alterTableNamed_withNewColumnDefinitions_newColumnNames_oldColumnNames___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  id v29[2];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_new"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@)"), v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 48);
  v30 = 0;
  v6 = objc_msgSend(v5, "executeUpdate:withParameters:error:", v4, 0, &v30);
  v7 = v30;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 56), "componentsJoinedByString:", CFSTR(", "));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) SELECT %@ FROM %@"), v3, v8, v9, *(_QWORD *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 48);
    v29[1] = v7;
    v27 = (void *)v10;
    v12 = objc_msgSend(v11, "executeUpdate:withParameters:error:");
    v13 = v7;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v12;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v26 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@"), *(_QWORD *)(a1 + 40));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 48);
      v29[0] = v13;
      v16 = objc_msgSend(v15, "executeUpdate:withParameters:error:", v14, 0, v29);
      v17 = v29[0];

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v16;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@"), v3, *(_QWORD *)(a1 + 40));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 48);
        v28 = v17;
        v20 = objc_msgSend(v19, "executeUpdate:withParameters:error:", v18, 0, &v28);
        v13 = v28;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v20;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v21 = 1;
        }
        else
        {
          v23 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            v32 = v3;
            v33 = 2114;
            v34 = v24;
            v35 = 2114;
            v36 = v13;
            _os_log_impl(&dword_1AC149000, v23, OS_LOG_TYPE_ERROR, "Failed to rename temporary table %{public}@ to permanent name %{public}@. %{public}@", buf, 0x20u);
          }

          v21 = 0;
        }
      }
      else
      {
        v18 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v22 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v32 = v22;
          v33 = 2114;
          v34 = v17;
          _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Failed to drop old %{public}@ table. %{public}@", buf, 0x16u);
        }
        v21 = 0;
        v13 = v17;
      }

      v9 = v26;
    }
    else
    {
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v13;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate data to temporary table for column rename. %{public}@", buf, 0xCu);
      }
      v21 = 0;
    }

    v7 = v13;
  }
  else
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Failed to create temporary table for rename. %{public}@", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

void __70__ML3DatabaseConnection_SchemaUtilities__schemaDeleteColumns_inTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }

}

void __85__ML3DatabaseConnection_SchemaUtilities__schemaRenameColumn_inTable_toNewColumnName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v10 = v5;
  v7 = v6;
  v8 = v10;
  v9 = v7;
  if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v8 = *(id *)(a1 + 40);

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v10, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v8);

}

void __90__ML3DatabaseConnection_SchemaUtilities__schemaInsertColumnDefinitions_intoTable_atIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_QWORD *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

- (ML3DatabaseConnection)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ init] is unsupported. Use -[%@ initWithDatabasePath:] instead."), v4, v4);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (-[ML3DatabaseConnection isOpen](self, "isOpen"))
    -[ML3DatabaseConnection close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseConnection;
  -[ML3DatabaseConnection dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  NSString *databasePath;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  id WeakRetained;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  databasePath = self->_databasePath;
  if (-[ML3DatabaseConnection isOpen](self, "isOpen"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[ML3DatabaseConnection isReadOnly](self, "isReadOnly"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[ML3DatabaseConnection _closeConnectionWhenCheckingIn](self, "_closeConnectionWhenCheckingIn"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningPool);
  objc_msgSend(WeakRetained, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, path=%@, open=%@, readonly=%@, _closeConnectionWhenCheckingIn=%@, in transaction=%@, owning pool=%@>"), v4, self, databasePath, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *uniqueIdentifier;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](uniqueIdentifier, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)close
{
  NSObject *v3;
  int v5;
  ML3DatabaseConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to close", (uint8_t *)&v5, 0xCu);
  }

  return -[ML3DatabaseConnection _closeAndFlushTransactionState:](self, "_closeAndFlushTransactionState:", 1);
}

- (BOOL)_closeAndFlushTransactionState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *WeakRetained;
  NSObject *v6;
  sqlite3 **iTunesExtensions;
  sqlite3 *sqlitedb;
  int v9;
  _BOOL4 v10;
  BOOL v11;
  NSObject *v12;
  sqlite3 *v13;
  _BOOL4 isOpen;
  NSObject *v15;
  int v17;
  ML3DatabaseConnection *v18;
  __int16 v19;
  _BYTE v20[10];
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (!-[ML3DatabaseConnection isOpen](self, "isOpen"))
  {
    WeakRetained = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = self;
      _os_log_impl(&dword_1AC149000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@ is not open", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_16;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSObject connectionWillCloseDatabase:](WeakRetained, "connectionWillCloseDatabase:", self);
  if (v3)
    -[ML3DatabaseConnection flush](self, "flush");
  -[ML3DatabaseConnection setTransactionLevel:](self, "setTransactionLevel:", 0);
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to finalize all statements", (uint8_t *)&v17, 0xCu);
  }

  -[ML3DatabaseConnection _finalizeAllStatements](self, "_finalizeAllStatements");
  iTunesExtensions = (sqlite3 **)self->_iTunesExtensions;
  if (iTunesExtensions)
  {
    DestroySQLExtensions(iTunesExtensions);
    self->_iTunesExtensions = 0;
  }
  sqlitedb = self->_sqlitedb;
  if (!sqlitedb || !self->_isOpen)
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_sqlitedb;
      isOpen = self->_isOpen;
      v17 = 138543874;
      v18 = self;
      v19 = 2048;
      *(_QWORD *)v20 = v13;
      *(_WORD *)&v20[8] = 1024;
      v21 = isOpen;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ not closing _sqlitedb=%p, _isOpen=%{BOOL}u", (uint8_t *)&v17, 0x1Cu);
    }
    goto LABEL_27;
  }
  v9 = sqlite3_close(sqlitedb);
  if (v9)
    v10 = -[ML3DatabaseConnection _handleZombieSQLiteConnection:](self, "_handleZombieSQLiteConnection:", self->_sqlitedb);
  else
    v10 = 1;
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543874;
    v18 = self;
    v19 = 1024;
    *(_DWORD *)v20 = v9;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v10;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ closed with result=%d, status=%{BOOL}u", (uint8_t *)&v17, 0x18u);
  }

  if (!v10)
  {
    -[ML3DatabaseConnection _logCurrentError](self, "_logCurrentError");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_28:
      v11 = 0;
      goto LABEL_29;
    }
    -[ML3DatabaseConnection sqliteError](self, "sqliteError");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject connection:didFailToCloseDatabaseWithError:](WeakRetained, "connection:didFailToCloseDatabaseWithError:", self, v12);
LABEL_27:

    goto LABEL_28;
  }
  self->_sqlitedb = 0;
  self->_isOpen = 0;
  -[NSMutableArray removeAllObjects](self->_registeredFunctions, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_registeredModules, "removeAllObjects");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSObject connectionDidCloseDatabase:](WeakRetained, "connectionDidCloseDatabase:", self);
LABEL_16:
  v11 = 1;
LABEL_29:

  return v11;
}

- (BOOL)tableExists:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name='%@'"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnection executeQuery:](self, "executeQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAtLeastOneRow");

  return v6;
}

- (BOOL)executeUpdate:(id)a3
{
  return -[ML3DatabaseConnection executeUpdate:withParameters:error:](self, "executeUpdate:withParameters:error:", a3, 0, 0);
}

- (BOOL)performTransactionWithBlock:(id)a3
{
  return -[ML3DatabaseConnection performTransactionWithBlock:usingBehaviorType:](self, "performTransactionWithBlock:usingBehaviorType:", a3, 0);
}

- (BOOL)performTransactionWithBlock:(id)a3 usingBehaviorType:(unint64_t)a4
{
  uint64_t (**v6)(_QWORD);
  BOOL v7;

  v6 = (uint64_t (**)(_QWORD))a3;
  if (-[ML3DatabaseConnection pushTransactionUsingBehaviorType:](self, "pushTransactionUsingBehaviorType:", a4))
    v7 = -[ML3DatabaseConnection popTransactionAndCommit:](self, "popTransactionAndCommit:", v6[2](v6));
  else
    v7 = 0;

  return v7;
}

- (void)enqueueBlockForTransactionCommit:(id)a3
{
  NSMutableArray *enqueuedTransactionCommitBlocks;
  id v4;

  enqueuedTransactionCommitBlocks = self->_enqueuedTransactionCommitBlocks;
  v4 = (id)MEMORY[0x1AF43CDE0](a3, a2);
  -[NSMutableArray addObject:](enqueuedTransactionCommitBlocks, "addObject:", v4);

}

- (BOOL)registerModule:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  sqlite3 *sqlitedb;
  id v10;
  int module;
  NSObject *v12;
  void *v13;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_sqlitedb)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnection.m"), 794, CFSTR("Cannot register module. SQLite handle not available, or connection is not open."));

  }
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  sqlitedb = self->_sqlitedb;
  objc_msgSend(v5, "name");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  module = sqlite3_create_module(sqlitedb, (const char *)objc_msgSend(v10, "UTF8String"), (const sqlite3_module *)objc_msgSend(v5, "moduleMethods"), v8);

  if (module)
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[ML3DatabaseConnection sqliteError](self, "sqliteError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Error registering module: %{public}@. %{public}@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    -[NSMutableArray addObject:](self->_registeredModules, "addObject:", v5);
  }

  return module == 0;
}

- (BOOL)registerModuleName:(id)a3 moduleMethods:(sqlite3_module *)a4
{
  id v7;
  ML3DatabaseModule *v8;
  ML3DatabaseModule *v9;
  void *v10;
  int v11;
  sqlite3_module *v12;
  BOOL v13;
  void *v15;

  v7 = a3;
  -[ML3DatabaseConnection _registeredModuleNamed:](self, "_registeredModuleNamed:", v7);
  v8 = (ML3DatabaseModule *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = -[ML3DatabaseModule initWithName:moduleMethods:]([ML3DatabaseModule alloc], "initWithName:moduleMethods:", v7, a4);

    v13 = -[ML3DatabaseConnection registerModule:](self, "registerModule:", v9);
    goto LABEL_6;
  }
  v9 = v8;
  -[ML3DatabaseModule name](v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v7);

  if (!v11)
  {

    goto LABEL_8;
  }
  v12 = -[ML3DatabaseModule moduleMethods](v9, "moduleMethods");

  if (v12 != a4)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnection.m"), 817, CFSTR("modules can only be registered one time"));

  }
  v13 = 1;
LABEL_6:

  return v13;
}

- (BOOL)removeModuleNamed:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  NSMutableArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_registeredModules;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      objc_msgSend(v10, "name", (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (v14)
    {
      -[NSMutableArray removeObject:](self->_registeredModules, "removeObject:", v14);
      v13 = 1;
      v5 = v14;
      goto LABEL_12;
    }
    v13 = 0;
  }
  else
  {
LABEL_9:
    v13 = 0;
LABEL_12:

  }
  return v13;
}

- (id)openBlobInTable:(id)a3 column:(id)a4 row:(int64_t)a5 readOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ML3DatabaseBlob *v16;
  ML3DatabaseBlob *v17;
  sqlite3_blob *ppBlob;
  _QWORD v20[2];

  v6 = a6;
  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
  ppBlob = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE ROWID=?"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnection executeQuery:withParameters:](self, "executeQuery:withParameters:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (objc_msgSend(v15, "hasAtLeastOneRow"))
  {
    if (sqlite3_blob_open(self->_sqlitedb, "main", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), a5, !v6, &ppBlob))
    {
      -[ML3DatabaseConnection _logCurrentError](self, "_logCurrentError");
      v16 = 0;
    }
    else
    {
      v17 = [ML3DatabaseBlob alloc];
      v16 = -[ML3DatabaseBlob initWithSQLiteHandle:](v17, "initWithSQLiteHandle:", ppBlob);
    }
  }

  return v16;
}

- (int64_t)lastInsertionRowID
{
  return sqlite3_last_insert_rowid(self->_sqlitedb);
}

- (id)sqliteError
{
  sqlite3 *sqlitedb;
  int v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  sqlitedb = self->_sqlitedb;
  if (sqlitedb)
  {
    v4 = sqlite3_errcode(sqlitedb);
    v5 = sqlite3_extended_errcode(self->_sqlitedb);
    v17 = 0;
    if (!v4)
    {
      v13 = 0;
      return v13;
    }
    v6 = v5;
    v7 = sqlite3_errmsg(self->_sqlitedb);
    sqlite3_file_control(self->_sqlitedb, "main", 4, &v17);
    MLSQLiteExtendedResultString(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -- extended errcode: %d (%@), last errno = %d"), v7, v6, v8, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x1E0CB2D50];
    v21[0] = v9;
    objc_msgSend((id)objc_opt_class(), "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    -[ML3DatabaseConnection description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18[0] = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Database connection lost or invalid.");
    objc_msgSend((id)objc_opt_class(), "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v14;
    -[ML3DatabaseConnection description](self, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 200, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)deleteDatabase
{
  if (-[ML3DatabaseConnection isReadOnly](self, "isReadOnly"))
    return 0;
  if (-[ML3DatabaseConnection isOpen](self, "isOpen"))
    -[ML3DatabaseConnection close](self, "close");
  return ML3TruncateDatabase(self->_databasePath, self->_journalingMode == 1);
}

- (int)checkpointDatabase
{
  sqlite3 *sqlitedb;
  int v4;
  NSObject *v5;
  char *errmsg;
  uint8_t buf[4];
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[ML3DatabaseConnection isOpen](self, "isOpen"))
    return -1;
  if (-[ML3DatabaseConnection isReadOnly](self, "isReadOnly"))
    return -1;
  sqlitedb = self->_sqlitedb;
  if (!sqlitedb)
    return -1;
  errmsg = 0;
  v4 = sqlite3_exec(sqlitedb, "PRAGMA wal_checkpoint;", 0, 0, &errmsg);
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v9 = errmsg;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Could not checkpoint WAL file. %{public}s", buf, 0xCu);
    }

  }
  return v4;
}

- (id)_owningPool
{
  return objc_loadWeakRetained((id *)&self->_owningPool);
}

- (void)_raiseConnectionClosedException
{
  NSString *databasePath;

  databasePath = self->_databasePath;
  if (!databasePath)
  {
    ML3DatabaseConnectionRaiseNilDatabasePath(0, a2);
    databasePath = self->_databasePath;
  }
  ML3DatabaseConnectionCheckDatabasePathAndRaiseIfNecessary(databasePath);
  ML3DatabaseConnectionRaiseUnknownException();
}

- (void)_handleDatabaseCorruption
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *databasePath;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = (id)objc_opt_class();
    v4 = v14;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] ✘ Database Corruption Detected ✘", buf, 0xCu);

  }
  -[ML3DatabaseConnection _logDatabaseFileDebugInformation](self, "_logDatabaseFileDebugInformation");
  if (-[ML3DatabaseConnection isOpen](self, "isOpen"))
    -[ML3DatabaseConnection close](self, "close");
  if (!+[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries")&& -[ML3DatabaseConnection _isDeviceMediaLibraryDatabase](self, "_isDeviceMediaLibraryDatabase"))
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Attempting database recovery...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    databasePath = self->_databasePath;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__ML3DatabaseConnection__handleDatabaseCorruption__block_invoke;
    v11[3] = &unk_1E5B65B40;
    v11[4] = self;
    v12 = v7;
    v10 = v7;
    objc_msgSend(v8, "attemptDatabaseFileRecoveryAtPath:withCompletionHandler:", databasePath, v11);

  }
}

- (BOOL)_handleBusyLockWithNumberOfRetries:(int)a3
{
  if (a3)
  {
    if (a3 >= 10 && self->_journalingMode == 1)
      return 1;
    usleep(0xF4240u);
  }
  else
  {
    -[ML3DatabaseConnection _resetUnfinalizedStatements](self, "_resetUnfinalizedStatements");
  }
  return 0;
}

- (BOOL)_handleDiskIOError
{
  NSObject *v3;
  BOOL v4;
  unint64_t v5;
  BOOL v6;
  NSObject *v7;
  _BOOL4 v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSString *databasePath;
  BOOL v12;
  BOOL v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  NSObject *v37;
  uint8_t *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  char v42;
  uint8_t v43[4];
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseConnection _logDatabaseFileDebugInformation](self, "_logDatabaseFileDebugInformation");
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "DISK IO ERROR: attempting to close and re-open connection for recovery.", buf, 2u);
  }

  v4 = 0;
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x2020000000;
  v42 = 0;
  if (!self->_isHandlingIOError)
  {
    v5 = -[ML3DatabaseConnection transactionLevel](self, "transactionLevel");
    self->_isHandlingIOError = 1;
    v6 = -[ML3DatabaseConnection _closeAndFlushTransactionState:](self, "_closeAndFlushTransactionState:", 0);
    v40[24] = v6;
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!v6)
    {
      if (v8)
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] failed to close database connection", v43, 2u);
      }
LABEL_18:

      v15 = v40[24];
      v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEBUG, "[_handleDiskIOError] successfully recovered from disk IO error", v43, 2u);
        }
        goto LABEL_44;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] FAILED TO HANDLE DISK IO ERROR", v43, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = objc_claimAutoreleasedReturnValue();
      -[ML3DatabaseConnection _databaseFilePaths](self, "_databaseFilePaths");
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v33;
LABEL_25:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v21);
          if ((objc_msgSend(v22, "containsString:", CFSTR("-shm"), (_QWORD)v32) & 1) != 0)
            break;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
            if (v19)
              goto LABEL_25;
            goto LABEL_31;
          }
        }
        v23 = v22;

        if (!v23 || !-[NSObject fileExistsAtPath:](v17, "fileExistsAtPath:", v23))
          goto LABEL_39;
        v23 = objc_retainAutorelease(v23);
        if (unlink((const char *)objc_msgSend(v23, "fileSystemRepresentation")) == -1)
        {
          _ML3LogCategoryDefault();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            goto LABEL_43;
          v31 = *__error();
          *(_DWORD *)v43 = 67109120;
          v44 = v31;
          v27 = "[_handleDiskIOError] failed to delete SHM file from disk (errno = %d)";
          v28 = v25;
          v29 = 8;
          goto LABEL_42;
        }
        v24 = -[ML3DatabaseConnection _isDeviceMediaLibraryDatabase](self, "_isDeviceMediaLibraryDatabase");
        _ML3LogCategoryDefault();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        if (v24)
        {
          if (v26)
          {
            *(_WORD *)v43 = 0;
            _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] unlink successful. performing coordinated termination.", v43, 2u);
          }

          +[ML3TerminationCoordinator sharedCoordinator](ML3TerminationCoordinator, "sharedCoordinator");
          v25 = objc_claimAutoreleasedReturnValue();
          -[NSObject execute](v25, "execute");
          goto LABEL_43;
        }
        if (!v26)
          goto LABEL_43;
        *(_WORD *)v43 = 0;
        v27 = "[_handleDiskIOError] unlink successful.";
      }
      else
      {
LABEL_31:

        v23 = 0;
LABEL_39:
        v25 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_WORD *)v43 = 0;
        v27 = "[_handleDiskIOError] SHM file not found—unable to unlink";
      }
      v28 = v25;
      v29 = 2;
LABEL_42:
      _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_ERROR, v27, v43, v29);
LABEL_43:

LABEL_44:
      self->_isHandlingIOError = 0;
      v4 = v40[24] != 0;
      goto LABEL_45;
    }
    if (v8)
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] checking database consistency", v43, 2u);
    }

    v9 = dispatch_semaphore_create(0);
    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    databasePath = self->_databasePath;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __43__ML3DatabaseConnection__handleDiskIOError__block_invoke;
    v36[3] = &unk_1E5B65B68;
    v38 = buf;
    v36[4] = self;
    v7 = v9;
    v37 = v7;
    objc_msgSend(v10, "checkIntegrityOfDatabaseAtPath:repairFaults:withCompletionHandler:", databasePath, 1, v36);

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (v40[24] && (v12 = -[ML3DatabaseConnection open](self, "open"), (v40[24] = v12) != 0))
    {
      if (!v5)
      {
LABEL_17:

        goto LABEL_18;
      }
      v13 = -[ML3DatabaseConnection _internalBeginTransactionWithBehaviorType:](self, "_internalBeginTransactionWithBehaviorType:", 0);
      v40[24] = v13;
      if (v13)
      {
        os_unfair_lock_lock(&self->_lock);
        self->_transactionLevel = v5;
        self->_nestedTransactionWantsToRollback = 1;
        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_17;
      }
      _ML3LogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] failed to restart transaction after re-opening database connection", v43, 2u);
      }
    }
    else
    {
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] failed to re-open database connection", v43, 2u);
      }
    }

    goto LABEL_17;
  }
LABEL_45:
  _Block_object_dispose(buf, 8);
  return v4;
}

- (void)setTransactionLevel:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_transactionLevel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_alreadyAttemptedCorruptionRecovery
{
  return self->_alreadyAttemptedCorruptionRecovery;
}

- (void)_setAlreadyAttemptedCorruptionRecovery:(BOOL)a3
{
  self->_alreadyAttemptedCorruptionRecovery = a3;
}

- (void)_setCloseConnectionWhenCheckingIn
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_closeConnectionWhenCheckingIn = 1;
  os_unfair_lock_unlock(p_lock);
}

- (id)_shortDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseConnection;
  -[ML3DatabaseConnection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_registeredModuleNamed:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_registeredModules;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_databaseFileExists
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v4))
    v5 = objc_msgSend(v3, "fileExistsAtPath:", self->_databasePath);
  else
    v5 = 0;

  return v5;
}

- (void)_createDatabaseFileIfNonexistent
{
  void *v3;
  char v4;

  if (!-[ML3DatabaseConnection _databaseFileExists](self, "_databaseFileExists"))
  {
    -[ML3DatabaseConnection _createDatabaseDirectoryIfNonexistent](self, "_createDatabaseDirectoryIfNonexistent");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", self->_databasePath, 0, 0);

    if ((v4 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Could not create database file at %@, error = %@"), self->_databasePath, 0);
  }
}

- (void)_logCurrentErrorWhilePerformingStatementOperation:(id)a3 statementSQL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ML3DatabaseConnection sqliteError](self, "sqliteError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138544130;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v7;
      v10 = v12;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database error while %{public}@ statement '%{public}@': %{public}@", (uint8_t *)&v11, 0x2Au);

    }
  }

}

- (void)_logCurrentErrorWhilePerformingStatementOperation:(id)a3 statement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ML3DatabaseConnection sqliteError](self, "sqliteError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138544130;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v7;
      v10 = v12;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database error while %{public}@ statement '%{public}@': %{public}@", (uint8_t *)&v11, 0x2Au);

    }
  }

}

- (void)_logCurrentError
{
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseConnection sqliteError](self, "sqliteError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543618;
      v6 = (id)objc_opt_class();
      v7 = 2114;
      v8 = v2;
      v4 = v6;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database error: %{public}@", (uint8_t *)&v5, 0x16u);

    }
  }

}

- (void)_logDatabaseFileDebugInformation
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  const char *v15;
  __int128 v16;
  uint64_t v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ML3DatabaseConnection _databaseFilePaths](self, "_databaseFilePaths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138543362;
    v16 = v5;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v19 = 0;
        objc_msgSend(v3, "attributesOfItemAtPath:error:", v9, &v19, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v19;
        if (v10)
        {
          v12 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            -[ML3DatabaseConnection sqliteError](self, "sqliteError");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[ML3DatabaseConnection _databaseFilesAreWritable](self, "_databaseFilesAreWritable");
            *(_DWORD *)buf = 138544130;
            v15 = "false";
            if (v14)
              v15 = "true";
            v25 = v9;
            v26 = 2114;
            v27 = v13;
            v28 = 2082;
            v29 = v15;
            v30 = 2114;
            v31 = v10;
            _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "** Information about database file at path %{public}@\nlastError = %{public}@\nwritable = %{public}s\nattributes = %{public}@", buf, 0x2Au);

            v7 = v17;
          }
        }
        else
        {
          v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v25 = v11;
            _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Error fetching attributes from database file. %{public}@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v6);
  }

}

- (void)_finalizeAllStatements
{
  -[ML3DatabaseStatementCache clearCache](self->_statementCache, "clearCache");
}

- (BOOL)_handleConnectionErrorWhileOpening:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 11)
  {
    -[ML3DatabaseConnection _handleDatabaseCorruption](self, "_handleDatabaseCorruption", v3, v4);
    return 0;
  }
  else
  {
    return a3 != 10 || -[ML3DatabaseConnection _handleDiskIOError](self, "_handleDiskIOError");
  }
}

- (BOOL)_handleZombieSQLiteConnection:(sqlite3 *)a3
{
  NSObject *v5;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint8_t buf[4];
  sqlite3 *v22;
  __int16 v23;
  ML3DatabaseConnection *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v22 = a3;
    v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Database connection was unable to close SQLite handle %p. Attempting to clean up remaining resources and close again. (connection = %{public}@)", buf, 0x16u);
  }

  if (!a3)
    return 0;
  stmt = sqlite3_next_stmt(a3, 0);
  if (stmt)
  {
    v7 = stmt;
    do
    {
      v8 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v22 = v7;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up unfinalized statement %p.", buf, 0xCu);
      }

      v9 = sqlite3_finalize(v7);
      if (v9)
      {
        v10 = v9;
        v11 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = sqlite3_errmsg(a3);
          *(_DWORD *)buf = 134218498;
          v22 = a3;
          v23 = 2080;
          v24 = (ML3DatabaseConnection *)v12;
          v25 = 1024;
          v26 = v10;
          _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Failed to finalize statement %p. %s (%d)", buf, 0x1Cu);
        }

      }
      v7 = sqlite3_next_stmt(a3, v7);
    }
    while (v7);
  }
  v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Reattempting close of connection...", buf, 2u);
  }

  v14 = sqlite3_close(a3);
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Failed to close connection.", buf, 2u);
    }

    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = sqlite3_errmsg(a3);
    objc_msgSend(v17, "raise:format:", v18, CFSTR("Failed to close connection for database. %s (errno = %d)"), v19, *__error());
    return 0;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Successfully closed connection.", buf, 2u);
  }

  return 1;
}

- (unint64_t)journalingMode
{
  return self->_journalingMode;
}

- (unint64_t)protectionLevel
{
  return self->_protectionLevel;
}

- (void)setProtectionLevel:(unint64_t)a3
{
  self->_protectionLevel = a3;
}

- (BOOL)automaticCheckpointingEnabled
{
  return self->_automaticCheckpointingEnabled;
}

- (void)setAutomaticCheckpointingEnabled:(BOOL)a3
{
  self->_automaticCheckpointingEnabled = a3;
}

- (unint64_t)checkpointStatementThreshold
{
  return self->_checkpointStatementThreshold;
}

- (void)setCheckpointStatementThreshold:(unint64_t)a3
{
  self->_checkpointStatementThreshold = a3;
}

- (void)setLogQueryPlans:(BOOL)a3
{
  self->_logQueryPlans = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentTransactionID, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_registeredModules, 0);
  objc_storeStrong((id *)&self->_registeredFunctions, 0);
  objc_destroyWeak((id *)&self->_owningPool);
  objc_storeStrong((id *)&self->_enqueuedTransactionCommitBlocks, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);
}

void __83__ML3DatabaseConnection__internalLogQuery_withParameters_limitProperty_limitValue___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "columnCount"))
  {
    v3 = 0;
    do
    {
      if (v3)
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v7, "valueForColumnIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v6);

      ++v3;
    }
    while (objc_msgSend(v7, "columnCount") > v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

}

intptr_t __53__ML3DatabaseConnection__executeStatement_withError___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __43__ML3DatabaseConnection__handleDiskIOError__block_invoke(uint64_t a1, char a2)
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[_handleDiskIOError] Database integrity check passed.", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[_handleDiskIOError] Database integrity check failed - treating as corrupted", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_handleDatabaseCorruption");
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __50__ML3DatabaseConnection__handleDatabaseCorruption__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Database recovery was reported to be successful.", buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Database recovery failed. %{public}@", buf, 0xCu);
    }

    if (MSVDeviceOSIsInternalInstall() && !__daemonProcessInfo)
      +[MLException raise:format:](MLException, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Database at path %@ is corrupted. (Detected on connection %@) backtrace: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

intptr_t __40__ML3DatabaseConnection__openWithFlags___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
