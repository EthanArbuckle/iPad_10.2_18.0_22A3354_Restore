@implementation ML3StatementAccumulator

- (ML3StatementAccumulator)initWithConnection:(id)a3
{
  id v5;
  ML3StatementAccumulator *v6;
  ML3StatementAccumulator *v7;
  uint64_t v8;
  NSMutableArray *statementQueue;
  void *v10;
  uint64_t v11;
  NSString *databasePath;
  NSUUID *existingTransactionIdentifier;
  uint64_t v14;
  MLMediaLibraryService *xpcService;
  dispatch_queue_t v16;
  OS_dispatch_queue *serialQueue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ML3StatementAccumulator;
  v6 = -[ML3StatementAccumulator init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_statementThreshold = 20;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6->_statementThreshold);
    statementQueue = v7->_statementQueue;
    v7->_statementQueue = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_connection, a3);
    objc_msgSend(v5, "databasePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    databasePath = v7->_databasePath;
    v7->_databasePath = (NSString *)v11;

    existingTransactionIdentifier = v7->_existingTransactionIdentifier;
    v7->_existingTransactionIdentifier = 0;

    v7->_priorityLevel = 0;
    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v14 = objc_claimAutoreleasedReturnValue();
    xpcService = v7->_xpcService;
    v7->_xpcService = (MLMediaLibraryService *)v14;

    v16 = dispatch_queue_create("com.apple.MusicLibrary.ML3StatementAccumulator", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v16;

  }
  return v7;
}

- (ML3StatementAccumulator)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-init is invalid. Use -initWithDatabasePath: instead."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[ML3StatementAccumulator flushAndWait:](self, "flushAndWait:", 1);
  v3.receiver = self;
  v3.super_class = (Class)ML3StatementAccumulator;
  -[ML3StatementAccumulator dealloc](&v3, sel_dealloc);
}

- (BOOL)enqueueStatement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *serialQueue;
  BOOL v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  if (-[ML3DatabaseConnection transactionMarkedForRollBack](self->_connection, "transactionMarkedForRollBack"))
  {
    *((_BYTE *)v14 + 24) = 0;
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "sql");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "failing to enque statement inside a transaction marked for rollback. sql=%{public}@", buf, 0xCu);

    }
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__ML3StatementAccumulator_enqueueStatement___block_invoke;
    block[3] = &unk_1E5B65CF0;
    block[4] = self;
    v11 = v4;
    v12 = &v13;
    dispatch_sync(serialQueue, block);

  }
  v8 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)flushAndWait:(BOOL)a3
{
  NSObject *serialQueue;
  char v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ML3StatementAccumulator_flushAndWait___block_invoke;
  block[3] = &unk_1E5B65D18;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(serialQueue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)_onQueueFlushAndWait:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;
  void *v7;
  NSString *databasePath;
  void *v9;
  void *v10;
  void *v11;
  NSUUID *existingTransactionIdentifier;
  dispatch_semaphore_t v13;
  MLMediaLibraryService *xpcService;
  NSObject *v15;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  _QWORD v30[2];

  v3 = a3;
  v30[1] = *MEMORY[0x1E0C80C00];
  if (!self->_databasePath)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3StatementAccumulator.m"), 84, CFSTR("Attempted to flush database statements without a specified database path."));

  }
  v5 = 1;
  if (-[NSMutableArray count](self->_statementQueue, "count"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v6 = (void *)-[NSMutableArray copy](self->_statementQueue, "copy");
    -[NSMutableArray removeAllObjects](self->_statementQueue, "removeAllObjects");
    v29 = CFSTR("MLDatabaseOperationAttributeStatementsKey");
    v30[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    databasePath = self->_databasePath;
    v27[1] = CFSTR("MLDatabaseOperationOptionPriorityLevelKey");
    v28[0] = databasePath;
    v27[0] = CFSTR("MLDatabaseOperationOptionDatabasePathKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_priorityLevel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    existingTransactionIdentifier = self->_existingTransactionIdentifier;
    if (existingTransactionIdentifier)
      objc_msgSend(v11, "setObject:forKey:", existingTransactionIdentifier, CFSTR("MLDatabaseOperationOptionTransactionIdentifierKey"));
    v13 = 0;
    if (v3)
      v13 = dispatch_semaphore_create(0);
    xpcService = self->_xpcService;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__ML3StatementAccumulator__onQueueFlushAndWait___block_invoke;
    v19[3] = &unk_1E5B65D58;
    v21 = &v23;
    v22 = v3;
    v15 = v13;
    v20 = v15;
    -[MLMediaLibraryService performDatabaseOperation:withAttributes:options:completionHandler:](xpcService, "performDatabaseOperation:withAttributes:options:completionHandler:", 2, v7, v11, v19);
    if (v3)
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v5 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }
  return v5;
}

- (unint64_t)statementThreshold
{
  return self->_statementThreshold;
}

- (void)setStatementThreshold:(unint64_t)a3
{
  self->_statementThreshold = a3;
}

- (NSMutableArray)statementQueue
{
  return self->_statementQueue;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (ML3DatabaseConnection)connection
{
  return self->_connection;
}

- (NSUUID)existingTransactionIdentifier
{
  return self->_existingTransactionIdentifier;
}

- (void)setExistingTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_existingTransactionIdentifier, a3);
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (void)setPriorityLevel:(unint64_t)a3
{
  self->_priorityLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_statementQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_xpcService, 0);
}

void __48__ML3StatementAccumulator__onQueueFlushAndWait___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Error flushing statements in accumulator: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(a1 + 48))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __40__ML3StatementAccumulator_flushAndWait___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueueFlushAndWait:", *(unsigned __int8 *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

_QWORD *__44__ML3StatementAccumulator_enqueueStatement___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  _QWORD *result;

  objc_msgSend(*(id *)(a1[4] + 32), "addObject:", a1[5]);
  v2 = objc_msgSend(*(id *)(a1[4] + 32), "count");
  result = (_QWORD *)a1[4];
  if (v2 >= result[3])
  {
    result = (_QWORD *)objc_msgSend(result, "_onQueueFlushAndWait:", 1);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)result;
  }
  return result;
}

@end
