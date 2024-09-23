@implementation ML3DatabaseDistantConnection

- (BOOL)isOpen
{
  return self->_connectionOpen;
}

- (BOOL)isReadOnly
{
  return 0;
}

- (BOOL)_internalExecuteUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  ML3DatabaseDistantConnection *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  MLMediaLibraryService *mediaLibraryService;
  NSUUID *currentTransactionID;
  BOOL v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  ML3DatabaseDistantConnection *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (ML3DatabaseDistantConnection *)a3;
  v9 = a4;
  v10 = -[ML3DatabaseConnection isInTransaction](self, "isInTransaction");
  if (!v10)
    -[ML3DatabaseConnection pushTransaction](self, "pushTransaction");
  if (!self->_currentTransactionID)
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "No valid transaction ID for connection %{public}@", buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("The media library service failed to return a valid transaction ID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 600, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    v15 = 0;
    if (v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (-[ML3DatabaseConnection transactionMarkedForRollBack](self, "transactionMarkedForRollBack"))
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "failing update request in a transaction marked for rollback. sql=%{public}@", buf, 0xCu);
    }
    v12 = 0;
    goto LABEL_11;
  }
  mediaLibraryService = self->_mediaLibraryService;
  currentTransactionID = self->_currentTransactionID;
  v20 = 0;
  v19 = -[MLMediaLibraryService executeUpdate:withParameters:onTransaction:error:](mediaLibraryService, "executeUpdate:withParameters:onTransaction:error:", v8, v9, currentTransactionID, &v20);
  v12 = v20;
  if (!v19)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "Could not execute update on distant connection: %{public}@. %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  v15 = 1;
  if (!v10)
LABEL_12:
    -[ML3DatabaseConnection popTransactionAndCommit:](self, "popTransactionAndCommit:", 1);
LABEL_13:
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v15;
}

- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3
{
  return -[ML3DatabaseDistantConnection _internalBeginTransactionWithBehaviorType:isRetry:](self, "_internalBeginTransactionWithBehaviorType:isRetry:", a3, 0);
}

- (BOOL)_internalEndTransactionAndCommit:(BOOL)a3
{
  _BOOL8 v3;
  NSUUID *currentTransactionID;
  MLMediaLibraryService *mediaLibraryService;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  ML3DatabaseDistantConnection *v13;
  NSUUID *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  ML3DatabaseDistantConnection *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (!-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseDistantConnection.m"), 203, CFSTR("Attempted to end non-existent distant transaction."));

  }
  -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
  currentTransactionID = self->_currentTransactionID;
  if (currentTransactionID)
  {
    mediaLibraryService = self->_mediaLibraryService;
    v17 = 0;
    v8 = -[MLMediaLibraryService endTransaction:shouldCommit:error:](mediaLibraryService, "endTransaction:shouldCommit:error:", currentTransactionID, v3, &v17);
    v9 = v17;
    -[ML3DatabaseConnection connectionDelegate](self, "connectionDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[NSUUID UUIDString](self->_currentTransactionID, "UUIDString");
        v13 = (ML3DatabaseDistantConnection *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v13;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEBUG, "Successfully ended transaction with ID %{public}@", buf, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "connection:didEndDatabaseTransactionAndCommit:", self, v3);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Could not end transaction on distant connection: %{public}@. %{public}@", buf, 0x16u);
      }

    }
    v14 = self->_currentTransactionID;
    self->_currentTransactionID = 0;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3 isRetry:(BOOL)a4
{
  NSUUID **p_currentTransactionID;
  BOOL v9;
  uint64_t IsFirstPartyMediaApplication;
  uint64_t v11;
  void *v12;
  MLTransactionContext *v13;
  void *v14;
  MLTransactionContext *v15;
  MLMediaLibraryService *mediaLibraryService;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  ML3DatabaseDistantConnection *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  ML3DatabaseDistantConnection *v27;
  void *v29;
  id v30;
  uint8_t buf[4];
  ML3DatabaseDistantConnection *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseDistantConnection.m"), 152, CFSTR("Attempted to begin distant transaction while one is already in process."));

  }
  -[ML3DatabaseConnection _ensureConnectionIsOpen](self, "_ensureConnectionIsOpen");
  p_currentTransactionID = &self->_currentTransactionID;
  if (!self->_currentTransactionID)
  {
    if (ML3IsUIApplication___once != -1)
      dispatch_once(&ML3IsUIApplication___once, &__block_literal_global_17676);
    if (ML3IsUIApplication___isUIApplication)
      IsFirstPartyMediaApplication = ML3IsFirstPartyMediaApplication();
    else
      IsFirstPartyMediaApplication = 1;
    v11 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    -[ML3DatabaseConnection databasePath](self, "databasePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MLTransactionContext alloc];
    -[ML3DatabaseConnection privacyContext](self, "privacyContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MLTransactionContext initWithPrivacyContext:path:priorityLevel:options:](v13, "initWithPrivacyContext:path:priorityLevel:options:", v14, v12, v11, IsFirstPartyMediaApplication);

    mediaLibraryService = self->_mediaLibraryService;
    v30 = 0;
    -[MLMediaLibraryService beginTransactionForDatabaseWithContext:error:](mediaLibraryService, "beginTransactionForDatabaseWithContext:error:", v15, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;
    -[ML3DatabaseConnection connectionDelegate](self, "connectionDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 && v17)
    {
      objc_storeStrong((id *)&self->_currentTransactionID, v17);
      v20 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v17, "UUIDString");
        v21 = (ML3DatabaseDistantConnection *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v21;
        _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEBUG, "Successfully began transaction with ID %{public}@", buf, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "connectionDidBeginDatabaseTransaction:", self);
LABEL_25:
      v9 = 1;
LABEL_30:

      return v9;
    }
    v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "Could not begin transaction on distant connection: %{public}@. %{public}@", buf, 0x16u);
    }

    if (!a4)
    {
      v23 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v23, OS_LOG_TYPE_DEFAULT, "Reattempting to begin transaction with media library service...", buf, 2u);
      }

      v24 = -[ML3DatabaseDistantConnection _internalBeginTransactionWithBehaviorType:isRetry:](self, "_internalBeginTransactionWithBehaviorType:isRetry:", a3, 1);
      v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v26)
        {
          -[NSUUID UUIDString](*p_currentTransactionID, "UUIDString");
          v27 = (ML3DatabaseDistantConnection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v27;
          _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Reattempt to begin transaction succeeded. Proceeding with new transaction ID %{public}@.", buf, 0xCu);

        }
        goto LABEL_25;
      }
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Reattempt to begin transaction failed.", buf, 2u);
      }

    }
    v9 = 0;
    goto LABEL_30;
  }
  return 0;
}

- (ML3DatabaseDistantConnection)initWithDatabasePath:(id)a3
{
  ML3DatabaseDistantConnection *v3;
  uint64_t v4;
  MLMediaLibraryService *mediaLibraryService;
  NSUUID *currentTransactionID;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseDistantConnection;
  v3 = -[ML3DatabaseConnection initWithDatabasePath:](&v9, sel_initWithDatabasePath_, a3);
  if (v3)
  {
    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v4 = objc_claimAutoreleasedReturnValue();
    mediaLibraryService = v3->_mediaLibraryService;
    v3->_mediaLibraryService = (MLMediaLibraryService *)v4;

    currentTransactionID = v3->_currentTransactionID;
    v3->_currentTransactionID = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__serviceTerminatedTransactionNotification_, CFSTR("MLMediaLibraryServiceDidTerminateTransactionNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MLMediaLibraryServiceDidTerminateTransactionNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)ML3DatabaseDistantConnection;
  -[ML3DatabaseConnection dealloc](&v4, sel_dealloc);
}

- (sqlite3)_sqliteHandle
{
  return 0;
}

- (BOOL)shouldCacheStatements
{
  return 0;
}

- (id)currentTransactionID
{
  return self->_currentTransactionID;
}

- (BOOL)_openWithFlags:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL connectionOpen;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseConnection connectionDelegate](self, "connectionDelegate", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "connectionWillOpenDatabase:", self);
  self->_connectionOpen = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "connectionDidOpenDatabase:", 0);
  }
  else if (!self->_connectionOpen && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Distant connection could not open XPC connection to media library service daemon.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ML3DatabaseErrorDomain"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connection:didFailToOpenDatabaseWithError:", self, v6);

  }
  connectionOpen = self->_connectionOpen;

  return connectionOpen;
}

- (BOOL)close
{
  BOOL result;

  if (-[ML3DatabaseConnection isInTransaction](self, "isInTransaction"))
    result = -[ML3DatabaseConnection popToRootTransactionAndCommit:](self, "popToRootTransactionAndCommit:", 0);
  else
    result = 1;
  self->_connectionOpen = 0;
  return result;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 block:(id)a5
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("You cannot register functions on a distant database connection."), a5);
  return 0;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5 userData:(void *)a6
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("You cannot register functions on a distant database connection."), a5, a6);
  return 0;
}

- (BOOL)registerModule:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("You cannot register modules on a distant database connection."));
  return 0;
}

- (id)openBlobInTable:(id)a3 column:(id)a4 row:(int64_t)a5 readOnly:(BOOL)a6
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Incremental I/O using a distant database connection is unsupported."), a5, a6);
  return 0;
}

- (int)checkpointDatabase
{
  return 0;
}

- (id)_internalExecuteQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  if (a3)
  {
    v11 = a4;
    v12 = a3;
    a3 = -[ML3DatabaseDistantResult initWithDistantConnection:sql:parameters:]([ML3DatabaseDistantResult alloc], "initWithDistantConnection:sql:parameters:", self, v12, v11);

    if (v10)
      objc_msgSend(a3, "setLimitProperty:limitValue:", v10, a6);
    -[ML3DatabaseConnection connectionDelegate](self, "connectionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "connectionDidAccessDatabase:", self);

  }
  return a3;
}

- (void)_serviceTerminatedTransactionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSUUID *currentTransactionID;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ML3DatabaseConnection isInTransaction](self, "isInTransaction") && self->_currentTransactionID)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("MLTerminatedTransactionIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSUUID isEqual:](self->_currentTransactionID, "isEqual:", v6))
    {
      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v8;
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Service terminated distant transaction with error: %{public}@", (uint8_t *)&v11, 0xCu);
      }

      currentTransactionID = self->_currentTransactionID;
      self->_currentTransactionID = 0;

      -[ML3DatabaseConnection setTransactionLevel:](self, "setTransactionLevel:", 0);
    }

  }
}

- (ML3DatabaseDistantConnectionDelegate)distantDelegate
{
  return (ML3DatabaseDistantConnectionDelegate *)objc_loadWeakRetained((id *)&self->_distantDelegate);
}

- (void)setDistantDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_distantDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_distantDelegate);
  objc_storeStrong((id *)&self->_currentTransactionID, 0);
  objc_storeStrong((id *)&self->_mediaLibraryService, 0);
}

@end
