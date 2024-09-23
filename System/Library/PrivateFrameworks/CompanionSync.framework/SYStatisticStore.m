@implementation SYStatisticStore

+ (id)sharedInstance
{
  return 0;
}

- (SYStatisticStore)init
{
  void *v3;
  void *v4;
  SYStatisticStore *v5;

  +[SYLogs logFolder](SYLogs, "logFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("statistics.db"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SYStatisticStore initWithPath:](self, "initWithPath:", v4);
  return v5;
}

- (SYStatisticStore)initWithPath:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SYStatisticStore;
  v5 = -[SYStatisticStore init](&v18, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("CSStatisticsQueueCore", v7);
    v9 = (void *)*((_QWORD *)v5 + 17);
    *((_QWORD *)v5 + 17) = v8;

    v10 = dispatch_queue_create_with_target_V2("CSStatisticsQueue", v7, *((dispatch_queue_t *)v5 + 17));
    v11 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v10;

    objc_msgSend(v4, "stringByStandardizingPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    v14 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v13;

    objc_msgSend(v5, "_initializeFilePresentation");
    objc_msgSend(v5, "_openDB");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__letGoForUnitTests_, CFSTR("SYUnitTestTearDown"), 0);

    v16 = v5;
  }

  return (SYStatisticStore *)v5;
}

- (void)dealloc
{
  NSObject *operations_queue;
  void *v4;
  objc_super v5;
  _QWORD block[5];

  operations_queue = self->_operations_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SYStatisticStore_dealloc__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(operations_queue, block);
  objc_msgSend(MEMORY[0x24BDD1570], "removeFilePresenter:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SYStatisticStore;
  -[SYStatisticStore dealloc](&v5, sel_dealloc);
}

uint64_t __27__SYStatisticStore_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDB");
}

- (int)_closeDB
{
  sqlite3 *db;
  int v4;

  db = self->_db;
  if (!db)
    return 0;
  self->_db = 0;
  sqlite3_finalize(self->_insertIncoming);
  self->_insertIncoming = 0;
  sqlite3_finalize(self->_addProcessingTimeIncoming);
  self->_addProcessingTimeIncoming = 0;
  sqlite3_finalize(self->_addErrorIncoming);
  self->_addErrorIncoming = 0;
  sqlite3_finalize(self->_markCompleteIncoming);
  self->_markCompleteIncoming = 0;
  sqlite3_finalize(self->_insertOutgoing);
  self->_insertOutgoing = 0;
  sqlite3_finalize(self->_updateOutgoingIdentifier);
  self->_updateOutgoingIdentifier = 0;
  sqlite3_finalize(self->_updateOutgoing);
  self->_updateOutgoing = 0;
  sqlite3_finalize(self->_timestampForID);
  self->_timestampForID = 0;
  sqlite3_finalize(self->_reserveRowID);
  self->_reserveRowID = 0;
  sqlite3_finalize(self->_responseReceived);
  self->_responseReceived = 0;
  sqlite3_finalize(self->_requestAcked);
  self->_requestAcked = 0;
  sqlite3_finalize(self->_logFileActivity);
  self->_logFileActivity = 0;
  sqlite3_finalize(self->_updateFileOutgoing);
  self->_updateFileOutgoing = 0;
  v4 = sqlite3_close(db);
  objc_msgSend(MEMORY[0x24BDD1570], "removeFilePresenter:", self);
  return v4;
}

- (void)_letGoForUnitTests:(id)a3
{
  NSObject *operations_queue;
  _QWORD block[5];

  operations_queue = self->_operations_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SYStatisticStore__letGoForUnitTests___block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(operations_queue, block);
}

uint64_t __39__SYStatisticStore__letGoForUnitTests___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDB");
}

- (BOOL)_tableEmpty:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  const char *v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v5);

  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = strlen(v8);
  v10 = sqlite3_prepare_v2(self->_db, v8, v9, &ppStmt, 0);
  if (v10)
  {
    if (v10 == 1)
    {
      v11 = 0;
    }
    else
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        -[SYStatisticStore _tableEmpty:].cold.1();
      v11 = 1;
    }
  }
  else
  {
    v12 = sqlite3_step(ppStmt);
    v11 = 1;
    if (v12 && v12 != 101)
    {
      if (v12 == 100)
      {
        v11 = sqlite3_column_int(ppStmt, 0) == 0;
      }
      else
      {
        if (_stats_log_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
          -[SYStatisticStore _tableEmpty:].cold.1();
        v11 = 1;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v11;
}

- (void)_ensureCorrectFileOwnership:(id)a3
{
  id v3;
  id v4;
  void *v5;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  v3 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0), &v6) == -1)
    -[SYStatisticStore _ensureCorrectFileOwnership:].cold.2();
  if (!v6.st_uid && !geteuid())
  {
    v4 = objc_retainAutorelease(v3);
    if (chown((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0x1F5u, 0x1F5u))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v5 = (void *)_stats_log;
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        -[SYStatisticStore _ensureCorrectFileOwnership:].cold.1((uint64_t)v4, v5);
    }
  }
  if ((v6.st_mode & 0x10) == 0)
    chmod((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), 0x1B4u);

}

- (BOOL)_openDBFile:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  void *v31;
  int v32;
  _QWORD v33[5];
  NSObject *v34;
  uint64_t *v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  dispatch_semaphore_t v46;
  _QWORD v47[6];

  v3 = a3;
  v47[4] = *MEMORY[0x24BDAC8D0];
  v32 = 4227074;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", self->_path, 0);
  if (v3)
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", self);
    v6 = objc_alloc(MEMORY[0x24BDBCF48]);
    -[NSString stringByAppendingString:](self->_path, "stringByAppendingString:", CFSTR("-shm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initFileURLWithPath:isDirectory:", v7, 0);

    v9 = objc_alloc(MEMORY[0x24BDBCF48]);
    -[NSString stringByAppendingString:](self->_path, "stringByAppendingString:", CFSTR("-wal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initFileURLWithPath:isDirectory:", v10, 0);

    objc_msgSend(MEMORY[0x24BDD1568], "readingIntentWithURL:options:", v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v12;
    objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", v5, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v13;
    objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", v8, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v14;
    objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", v11, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = dispatch_semaphore_create(0);
    -[SYStatisticStore presentedItemOperationQueue](self, "presentedItemOperationQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __32__SYStatisticStore__openDBFile___block_invoke;
    v42[3] = &unk_24CC671F0;
    v42[4] = self;
    v43 = v5;
    v44 = v8;
    v45 = v11;
    v46 = v17;
    v19 = v17;
    v20 = v11;
    v21 = v8;
    objc_msgSend(v31, "coordinateAccessWithIntents:queue:byAccessor:", v16, v18, v42);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v32 = 4227078;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", self);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x24BDD1568], "readingIntentWithURL:options:", v5, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v24);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", v5, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v25);

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v26 = dispatch_semaphore_create(0);
  -[SYStatisticStore presentedItemOperationQueue](self, "presentedItemOperationQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __32__SYStatisticStore__openDBFile___block_invoke_67;
  v33[3] = &unk_24CC67218;
  v36 = v32;
  v37 = v3;
  v33[4] = self;
  v35 = &v38;
  v28 = v26;
  v34 = v28;
  objc_msgSend(v22, "coordinateAccessWithIntents:queue:byAccessor:", v23, v27, v33);

  dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
  v29 = *((_BYTE *)v39 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  return v29;
}

void __32__SYStatisticStore__openDBFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (v3)
  {
    if (_stats_log_pred != -1)
      _os_once();
    v4 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __32__SYStatisticStore__openDBFile___block_invoke_cold_1((uint64_t)v3, v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

intptr_t __32__SYStatisticStore__openDBFile___block_invoke_67(uint64_t a1)
{
  uint64_t v2;

  if (sqlite3_open_v2((const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fileSystemRepresentation"), (sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), *(_DWORD *)(a1 + 56), 0)|| (v2 = *(_QWORD *)(a1 + 32), !*(_QWORD *)(v2 + 16)))
  {
    if (*(_BYTE *)(a1 + 60))
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        __32__SYStatisticStore__openDBFile___block_invoke_67_cold_1();
    }
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 16))
    {
      sqlite3_close(*(sqlite3 **)(v2 + 16));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend((id)v2, "_ensureCorrectFileOwnership:", *(_QWORD *)(v2 + 8));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)_getSchemaVersion
{
  int v2;
  int v3;
  int v4;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", 25, &ppStmt, 0);
  if (v2)
  {
    if (v2 != 1)
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        -[SYStatisticStore _getSchemaVersion].cold.1();
    }
    return 0;
  }
  else
  {
    v4 = sqlite3_step(ppStmt);
    v3 = 0;
    if (v4 && v4 != 101)
    {
      if (v4 == 100)
      {
        v3 = sqlite3_column_int(ppStmt, 0);
      }
      else
      {
        if (_stats_log_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
          -[SYStatisticStore _getSchemaVersion].cold.1();
        v3 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  return v3;
}

- (void)_onQueueAsync:(id)a3
{
  id v4;
  NSObject *operations_queue;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__15;
  v10[4] = __Block_byref_object_dispose__15;
  v11 = (id)os_transaction_create();
  operations_queue = self->_operations_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SYStatisticStore__onQueueAsync___block_invoke;
  block[3] = &unk_24CC67240;
  block[4] = self;
  v8 = v4;
  v9 = v10;
  v6 = v4;
  dispatch_async(operations_queue, block);

  _Block_object_dispose(v10, 8);
}

void __34__SYStatisticStore__onQueueAsync___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(a1[4] + 16))
  {
    (*(void (**)(void))(a1[5] + 16))();
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  else
  {
    if (_stats_log_pred != -1)
      _os_once();
    v4 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Statistics DB closed before an enqueued async block could run.", v5, 2u);
    }
  }
}

- (void)_onQueueSync:(id)a3
{
  id v4;
  NSObject *preemption_queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v7 = (id)os_transaction_create();
  dispatch_suspend((dispatch_object_t)self->_operations_queue);
  preemption_queue = self->_preemption_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SYStatisticStore__onQueueSync___block_invoke;
  block[3] = &unk_24CC657F0;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(preemption_queue, block);
  dispatch_resume((dispatch_object_t)self->_operations_queue);

}

void __33__SYStatisticStore__onQueueSync___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (_stats_log_pred != -1)
      _os_once();
    v1 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_211704000, v1, OS_LOG_TYPE_DEFAULT, "Statistics DB closed before an enqueued sync block could run.", v2, 2u);
    }
  }
}

- (id)_openDBIfNecessary
{
  SYStatisticStore *v2;

  v2 = self;
  if (!self->_db)
  {
    -[SYStatisticStore _openDB](self, "_openDB");
    if (!v2->_db)
      v2 = 0;
  }
  return v2;
}

- (void)_openDB
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  _SYObfuscate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1(&dword_211704000, v3, v5, "Error creating parent folder: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_4_0();
}

void __27__SYStatisticStore__openDB__block_invoke(uint64_t a1)
{
  sqlite3 *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[16];

  v2 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    sqlite3_busy_timeout(v2, 60000);
    v3 = 1;
    sqlite3_extended_result_codes(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), 1);
    sqlite3_wal_checkpoint_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), 0, 3, 0, 0);
    sqlite3_wal_hook(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), (int (__cdecl *)(void *, sqlite3 *, const char *, int))_SYStatisticsPrune, 0);
    ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "PRAGMA journal_mode=WAL;");
    ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, timestamp REAL)");
    switch(objc_msgSend(*(id *)(a1 + 32), "_getSchemaVersion"))
    {
      case 0u:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE TABLE IF NOT EXISTS message_log (pk INTEGER PRIMARY KEY AUTOINCREMENT, service TEXT, incoming INTEGER, timestamp REAL, delivery_time REAL, type TEXT, identifier TEXT, change_count INTEGER DEFAULT 0, msg_version INTEGER, change_version INTEGER, error TEXT, complete INTEGER DEFAULT 0)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX IF NOT EXISTS msg_by_id ON message_log (identifier ASC, timestamp DESC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        v3 = 0;
        goto LABEL_4;
      case 1u:
LABEL_4:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN is_request INTEGER DEFAULT 1");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN sync_id TEXT DEFAULT ''");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN request_id TEXT DEFAULT ''");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN vector_clock TEXT DEFAULT ''");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN wants_response INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN got_response INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX msg_by_type ON message_log (type ASC, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX response_by_request ON message_log (request_id ASC, timestamp DESC, identifier ASC, type ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_5;
      case 2u:
LABEL_5:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN wants_delivery_ack INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN delivery_acked INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_6;
      case 3u:
LABEL_6:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN proto_version INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN msg_seqno INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_7;
      case 4u:
LABEL_7:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN mach_time REAL DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "DROP INDEX msg_by_id");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX msg_by_id ON message_log (identifier ASC, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_8;
      case 5u:
LABEL_8:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN chunk_index INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_9;
      case 6u:
LABEL_9:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX msg_by_service ON message_log (service, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE VIEW receipt_sequence_info AS SELECT msg_seqno, datetime(timestamp, 'localtime'), mach_time, type, identifier, service FROM message_log WHERE incoming=1 ORDER BY service, timestamp ASC");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE VIEW sent_sequence_info AS SELECT msg_seqno, datetime(timestamp, 'localtime'), mach_time, type, identifier, service FROM message_log WHERE incoming=0 ORDER BY service, timestamp ASC");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_10;
      case 7u:
LABEL_10:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN processing_time_ms INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_11;
      case 8u:
LABEL_11:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE TABLE IF NOT EXISTS file_transfer_log (pk INTEGER PRIMARY KEY AUTOINCREMENT, file_url TEXT, service TEXT, incoming INTEGER, timestamp REAL, delivery_time REAL, identifier TEXT, error TEXT, complete INTEGER DEFAULT 0, delivery_acked INTEGER DEFAULT 0, peer_id TEXT, mach_time REAL DEFAULT 0)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX file_transfer_by_service ON file_transfer_log (service, identifier, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN file_transfer_id TEXT DEFAULT NIL");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX file_transfer_messages ON message_log (service, file_transfer_id, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_12;
      case 9u:
LABEL_12:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN is_reset_session INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN metadata TEXT");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN rollback INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN accepted INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        if (v3)
          goto LABEL_13;
        goto LABEL_14;
      case 0xAu:
LABEL_13:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "DROP INDEX msg_by_id");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX msg_by_id ON message_log (identifier ASC, timestamp DESC)");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "DROP INDEX response_by_request");
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "CREATE INDEX response_by_request ON message_log (request_id ASC, timestamp DESC, identifier ASC, type ASC)");
LABEL_14:
        ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        break;
      default:
        break;
    }
    if (sqlite3_table_column_metadata(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), 0, "file_transfer_log", "mach_time", 0, 0, 0, 0, 0))
    {
      ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ALTER TABLE file_transfer_log ADD COLUMN mach_time REAL DEFAULT 0");
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO message_log (incoming, timestamp, delivery_time, service, type, identifier, change_count, vector_clock, is_request, sync_id, request_id, error, wants_response, proto_version, msg_seqno, mach_time, chunk_index, is_reset_session, metadata, rollback, accepted) VALUES (1, datetime('now'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v4 = (id)_stats_log;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_13();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET processing_time_ms=? WHERE pk=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 32), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v5 = (id)_stats_log;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_12();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET error=? WHERE pk=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 40), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v6 = (id)_stats_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_11();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET complete=1 WHERE pk=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v7 = (id)_stats_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_10();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO message_log (service, mach_time) VALUES ('reserving row id', ?)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v8 = (id)_stats_log;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_9();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET incoming=0, timestamp=datetime('now'), service=?, type=?, change_count=?, vector_clock=?, is_request=?, sync_id=?, request_id=?, wants_response=?, wants_delivery_ack=?, proto_version=?, msg_seqno=?, chunk_index=?, is_reset_session=?, metadata=?, rollback=?, accepted=? WHERE pk=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v9 = (id)_stats_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_8();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET identifier=?, mach_time=? WHERE pk=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v10 = (id)_stats_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_7();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET delivery_time=?, complete=?, got_response=?, error=? WHERE identifier=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v11 = (id)_stats_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_6();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT timestamp FROM message_log WHERE identifier=? ORDER BY timestamp DESC LIMIT 1", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v12 = (id)_stats_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_5();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET got_response=? WHERE identifier=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v13 = (id)_stats_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_4();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET delivery_acked=1 WHERE identifier=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v14 = (id)_stats_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_3();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "INSERT INTO file_transfer_log (incoming, timestamp, file_url, service, identifier, peer_id, mach_time, delivery_time) VALUES (?, datetime('now'), ?, ?, ?, ?, ?, ?)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v15 = (id)_stats_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_2();

    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE file_transfer_log SET delivery_time=?, complete=?, error=? WHERE identifier=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120), 0))
    {
      if (_stats_log_pred != -1)
        _os_once();
      v16 = (id)_stats_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __27__SYStatisticStore__openDB__block_invoke_cold_1();

    }
  }
  else
  {
    if (_stats_log_pred != -1)
      _os_once();
    v17 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_DEFAULT, "Statistics DB closed before an enqueued async block could run.", buf, 2u);
    }
  }
}

- (double)_getMachTimestamp
{
  if (_getMachTimestamp_onceToken != -1)
    dispatch_once(&_getMachTimestamp_onceToken, &__block_literal_global_17);
  return *(double *)&_getMachTimestamp___scale * (double)mach_absolute_time();
}

double __37__SYStatisticStore__getMachTimestamp__block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 * 0.000000001 / (double)v1;
  _getMachTimestamp___scale = *(_QWORD *)&result;
  return result;
}

- (id)_keySetForMessageLogTable
{
  if (_keySetForMessageLogTable_onceToken != -1)
    dispatch_once(&_keySetForMessageLogTable_onceToken, &__block_literal_global_139);
  return (id)_keySetForMessageLogTable___keyset;
}

void __45__SYStatisticStore__keySetForMessageLogTable__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[21];

  v4[20] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCE70];
  v4[0] = CFSTR("Duration");
  v4[1] = CFSTR("Service");
  v4[2] = CFSTR("Type");
  v4[3] = CFSTR("Identifier");
  v4[4] = CFSTR("ChangeCount");
  v4[5] = CFSTR("VectorClock");
  v4[6] = CFSTR("IsRequest");
  v4[7] = CFSTR("SyncID");
  v4[8] = CFSTR("RequestIdentifier");
  v4[9] = CFSTR("Error");
  v4[10] = CFSTR("WantsResponse");
  v4[11] = CFSTR("GotResponse");
  v4[12] = CFSTR("ChunkIndex");
  v4[13] = CFSTR("WantsDeliveryAck");
  v4[14] = CFSTR("ProtocolVersion");
  v4[15] = CFSTR("MessageSequenceNumber");
  v4[16] = CFSTR("IsResetSyncSession");
  v4[17] = CFSTR("SessionMetadata");
  v4[18] = CFSTR("WantsRollback");
  v4[19] = CFSTR("RequestAccepted");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 20);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sharedKeySetForKeys:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_keySetForMessageLogTable___keyset;
  _keySetForMessageLogTable___keyset = v2;

}

- (id)_unpackMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SYSession unarchiveMetadata:](SYSession, "unarchiveMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);

  }
  else
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_unpackPBRequest:(id)a3 forMessageID:(unsigned __int16)a4 intoDictionary:(id)a5
{
  int v6;
  id v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double Current;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v6 = a4;
  v49 = a3;
  v8 = a5;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("Type"));

  switch(v6)
  {
    case 1:
    case 5:
      v11 = v49;
      objc_msgSend(v11, "syncID");
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v24 = (void *)v17;
      v25 = CFSTR("SyncID");
LABEL_13:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, v25);

      goto LABEL_19;
    case 2:
      v11 = v49;
      objc_msgSend(v11, "syncID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("SyncID"));

      v30 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "allObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("ChangeCount"));

LABEL_19:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsResponse"));
      goto LABEL_27;
    case 3:
      v11 = v49;
      objc_msgSend(v11, "syncID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("SyncID"));

      if (!objc_msgSend(v11, "hasEstimatedChangeCount"))
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v11, "estimatedChangeCount"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("ChangeCount");
LABEL_24:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, v35);

LABEL_27:
      objc_msgSend(v11, "header");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
LABEL_28:
        v41 = (void *)MEMORY[0x24BDD16E0];
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v18, "timestamp");
        objc_msgSend(v41, "numberWithDouble:", Current - v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("Duration"));

        objc_msgSend(v18, "state");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "jsonRepresentation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v46, CFSTR("VectorClock"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v18, "version"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("ProtocolVersion"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v18, "sequenceNumber"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("MessageSequenceNumber"));

      }
LABEL_29:

      return;
    case 4:
      v11 = v49;
      objc_msgSend(v11, "syncID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("SyncID"));

      v37 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "objects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("ChangeCount"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsResponse"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v11, "chunkIndex"));
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v34 = (void *)v23;
      v35 = CFSTR("ChunkIndex");
      goto LABEL_24;
    case 6:
      v40 = (void *)MEMORY[0x24BDD16E0];
      v11 = v49;
      objc_msgSend(v11, "changes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("ChangeCount");
LABEL_26:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      goto LABEL_27;
    default:
      switch(v6)
      {
        case 'e':
          goto LABEL_8;
        case 'f':
          v11 = v49;
          objc_msgSend(v11, "sessionID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("SyncID"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isResetSync"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("IsResetSyncSession"));

          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsResponse"));
          if (!objc_msgSend(v11, "hasMetadata"))
            goto LABEL_27;
          objc_msgSend(v11, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SYStatisticStore _unpackMetadata:](self, "_unpackMetadata:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("SessionMetadata");
          goto LABEL_26;
        case 'g':
          v11 = v49;
          objc_msgSend(v11, "sessionID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("SyncID"));

          v20 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v11, "changes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("ChangeCount"));

          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsResponse"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "index"));
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 'h':
          v11 = v49;
          objc_msgSend(v11, "sessionID");
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 'i':
          v11 = v49;
          objc_msgSend(v11, "sessionID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("SyncID"));

          if (objc_msgSend(v11, "hasError"))
          {
            objc_msgSend(v11, "error");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "description");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("Error"));

          }
          if (!objc_msgSend(v11, "hasRollback"))
            goto LABEL_19;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "rollback"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = CFSTR("WantsRollback");
          goto LABEL_13;
        default:
          if (v6 != 0x7FFF)
            goto LABEL_29;
LABEL_8:
          objc_msgSend(v49, "header");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_29;
          goto LABEL_28;
      }
  }
}

- (void)_unpackPBResponse:(id)a3 forMessageID:(unsigned __int16)a4 intoDictionary:(id)a5
{
  int v6;
  id v8;
  objc_class *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double Current;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v6 = a4;
  v46 = a3;
  v8 = a5;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("Type"));

  switch(v6)
  {
    case 'e':
      v11 = v46;
      v12 = v11;
      v13 = (void *)MEMORY[0x24BDD16E0];
      goto LABEL_17;
    case 'f':
      v25 = v46;
      objc_msgSend(v25, "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("SyncID"));

      if (objc_msgSend(v25, "hasMetadata"))
      {
        objc_msgSend(v25, "metadata");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYStatisticStore _unpackMetadata:](self, "_unpackMetadata:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("SessionMetadata"));

      }
      if (!objc_msgSend(v25, "hasError"))
        goto LABEL_27;
      v29 = v25;
      goto LABEL_20;
    case 'g':
      v12 = v46;
      objc_msgSend(v12, "sessionID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("SyncID"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "index"));
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v14 = (void *)v17;
      v15 = CFSTR("ChunkIndex");
      goto LABEL_18;
    case 'h':
      v12 = v46;
      objc_msgSend(v12, "sessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("SyncID"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsResponse"));
      v13 = (void *)MEMORY[0x24BDD16E0];
      v11 = v12;
LABEL_17:
      objc_msgSend(v13, "numberWithBool:", objc_msgSend(v11, "accepted"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("RequestAccepted");
LABEL_18:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      if (!objc_msgSend(v12, "hasError"))
        goto LABEL_27;
      v29 = v12;
LABEL_20:
      objc_msgSend(v29, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("Error"));

      break;
    case 'i':
      v33 = v46;
      objc_msgSend(v33, "sessionID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("SyncID"));

      if (objc_msgSend(v33, "hasError"))
      {
        objc_msgSend(v33, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "description");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("Error"));

      }
      if (!objc_msgSend(v33, "hasDidRollback"))
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v33, "didRollback"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("WantsRollback");
LABEL_25:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v24);
      break;
    default:
      switch(v6)
      {
        case 1:
          v18 = v46;
          objc_msgSend(v18, "requestSyncID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("SyncID"));

          if (!objc_msgSend(v18, "hasError"))
            goto LABEL_27;
          objc_msgSend(v18, "error");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "hasInProgressSyncID"))
          {
            objc_msgSend(v18, "inProgressSyncID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(" InProgressSyncID=%@"), v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v23;
          }
          v24 = CFSTR("Error");
          goto LABEL_25;
        case 2:
        case 5:
          v12 = v46;
          objc_msgSend(v12, "syncID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = CFSTR("SyncID");
          goto LABEL_18;
        case 4:
          v12 = v46;
          objc_msgSend(v12, "syncID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("SyncID"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v12, "chunkIndex"));
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        default:
          goto LABEL_29;
      }
  }

LABEL_27:
  objc_msgSend(v46, "header");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = (void *)MEMORY[0x24BDD16E0];
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v37, "timestamp");
    objc_msgSend(v38, "numberWithDouble:", Current - v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("Duration"));

    objc_msgSend(v37, "state");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "jsonRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, CFSTR("VectorClock"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v37, "version"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("ProtocolVersion"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v37, "sequenceNumber"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, CFSTR("MessageSequenceNumber"));

  }
LABEL_29:

}

- (id)_unpackMessageData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  -[SYStatisticStore _keySetForMessageLogTable](self, "_keySetForMessageLogTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithSharedKeySet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IsRequest"));
    objc_msgSend(v8, "idsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "idsIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("Identifier"));

    }
    objc_msgSend(v8, "pbRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "pbRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYStatisticStore _unpackPBRequest:forMessageID:intoDictionary:](self, "_unpackPBRequest:forMessageID:intoDictionary:", v12, objc_msgSend(v8, "messageID"), v7);

    }
    objc_msgSend(v8, "extraIDSOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE4FB48]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsDeliveryAck"));
LABEL_29:

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v4;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IsRequest"));
    objc_msgSend(v16, "idsIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v16, "idsIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("Identifier"));

    }
    objc_msgSend(v16, "pbRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v16, "pbRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYStatisticStore _unpackPBRequest:forMessageID:intoDictionary:](self, "_unpackPBRequest:forMessageID:intoDictionary:", v20, objc_msgSend(v16, "messageID"), v7);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "expectsResponse"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("WantsResponse"));

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v4;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("IsRequest"));
    objc_msgSend(v22, "request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "idsIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v23, "idsIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("RequestIdentifier"));

    }
    objc_msgSend(v22, "pbResponse");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v22, "pbResponse");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYStatisticStore _unpackPBResponse:forMessageID:intoDictionary:](self, "_unpackPBResponse:forMessageID:intoDictionary:", v27, objc_msgSend(v23, "messageID"), v7);

    }
    objc_msgSend(v22, "extraIDSOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BE4FB48]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if (v30)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WantsDeliveryAck"));

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v4;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("IsRequest"));
    objc_msgSend(v31, "idsIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v31, "idsIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("Identifier"));

    }
    objc_msgSend(v31, "requestIDSIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v31, "requestIDSIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("RequestIdentifier"));

    }
    objc_msgSend(v31, "pbResponse");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v31, "pbResponse");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYStatisticStore _unpackPBResponse:forMessageID:intoDictionary:](self, "_unpackPBResponse:forMessageID:intoDictionary:", v37, objc_msgSend(v31, "messageID"), v7);

    }
    goto LABEL_29;
  }
LABEL_30:

  return v7;
}

- (void)recordIncomingMessage:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  -[SYStatisticStore _unpackMessageData:](self, "_unpackMessageData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYStatisticStore updateOutgoingMessageWithIdentifier:didReceiveResponse:error:](self, "updateOutgoingMessageWithIdentifier:didReceiveResponse:error:", v9, 1, 0);

  }
  -[SYStatisticStore _getMachTimestamp](self, "_getMachTimestamp");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke;
  v13[3] = &unk_24CC672A8;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = v10;
  v11 = v6;
  v12 = v7;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v13);

}

sqlite3_int64 __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  double v4;
  sqlite3_stmt *v5;
  void *v6;
  sqlite3_stmt *v7;
  void *v8;
  sqlite3_stmt *v9;
  void *v10;
  sqlite3_stmt *v11;
  void *v12;
  sqlite3_stmt *v13;
  void *v14;
  sqlite3_stmt *v15;
  void *v16;
  sqlite3_stmt *v17;
  void *v18;
  sqlite3_stmt *v19;
  void *v20;
  sqlite3_stmt *v21;
  void *v22;
  sqlite3_stmt *v23;
  void *v24;
  sqlite3_stmt *v25;
  void *v26;
  sqlite3_stmt *v27;
  void *v28;
  sqlite3_stmt *v29;
  void *v30;
  sqlite3_stmt *v31;
  void *v32;
  void *v33;
  sqlite3_stmt *v34;
  void *v35;
  sqlite3_stmt *v36;
  void *v37;
  sqlite3_int64 result;

  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Duration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  sqlite3_bind_double(v2, 1, v4);

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24), 2, *(id *)(a1 + 48));
  v5 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v5, 3, v6);

  v7 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v7, 4, v8);

  v9 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ChangeCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v9, 5, objc_msgSend(v10, "intValue"));

  v11 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("VectorClock"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v11, 6, v12);

  v13 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("IsRequest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v13, 7, objc_msgSend(v14, "BOOLValue"));

  v15 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SyncID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v15, 8, v16);

  v17 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v17, 9, v18);

  v19 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Error"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v19, 10, v20);

  v21 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("WantsResponse"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v21, 11, objc_msgSend(v22, "BOOLValue"));

  v23 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ProtocolVersion"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v23, 12, objc_msgSend(v24, "intValue"));

  v25 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("MessageSequenceNumber"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(v25, 13, objc_msgSend(v26, "longLongValue"));

  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24), 14, *(double *)(a1 + 56));
  v27 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ChunkIndex"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v27, 15, objc_msgSend(v28, "intValue"));

  v29 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("IsResetSyncSession"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v29, 16, objc_msgSend(v30, "BOOLValue"));

  v31 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SessionMetadata"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "description");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v31, 17, v33);

  v34 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("WantsRollback"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v34, 18, objc_msgSend(v35, "BOOLValue"));

  v36 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("RequestAccepted"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v36, 19, objc_msgSend(v37, "BOOLValue"));

  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24));
  result = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

- (void)updateLastIncomingMessageWithProcessingTime:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke;
  v3[3] = &unk_24CC653F0;
  *(double *)&v3[5] = a3;
  v3[4] = self;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v3);
}

uint64_t __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke(uint64_t a1)
{
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 32), 1, llround(*(double *)(a1 + 40) * 1000.0));
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 32), 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 32)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 32));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)updateLastIncomingMessageWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke;
  v6[3] = &unk_24CC652B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v6);

}

uint64_t __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 40), 1, *(id *)(a1 + 40));
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 40), 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 40)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 40));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)markLastIncomingMessageComplete
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke;
  v2[3] = &unk_24CC65418;
  v2[4] = self;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v2);
}

uint64_t __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke(uint64_t a1)
{
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48), 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)recordOutgoingMessage:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = -1;
    -[SYStatisticStore _getMachTimestamp](self, "_getMachTimestamp");
    v8 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke;
    v17[3] = &unk_24CC67088;
    v17[6] = v9;
    v17[4] = self;
    v17[5] = &v18;
    -[SYStatisticStore _onQueueSync:](self, "_onQueueSync:", v17);
    if (v19[3] != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v6, "CompanionSync.StatisticStore.ReservedRowID", v10, (void *)1);

      -[SYStatisticStore _unpackMessageData:](self, "_unpackMessageData:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_151;
      v13[3] = &unk_24CC672D0;
      v13[4] = self;
      v14 = v7;
      v12 = v11;
      v15 = v12;
      v16 = &v18;
      -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v13);

    }
    _Block_object_dispose(&v18, 8);
  }

}

uint64_t __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke(uint64_t a1)
{
  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88), 1, *(double *)(a1 + 48));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88)) - 102) > 0xFFFFFFFD)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
}

uint64_t __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_151(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  sqlite3_stmt *v4;
  void *v5;
  sqlite3_stmt *v6;
  void *v7;
  sqlite3_stmt *v8;
  void *v9;
  sqlite3_stmt *v10;
  void *v11;
  sqlite3_stmt *v12;
  void *v13;
  sqlite3_stmt *v14;
  void *v15;
  sqlite3_stmt *v16;
  void *v17;
  sqlite3_stmt *v18;
  void *v19;
  sqlite3_stmt *v20;
  void *v21;
  sqlite3_stmt *v22;
  void *v23;
  sqlite3_stmt *v24;
  void *v25;
  sqlite3_stmt *v26;
  void *v27;
  void *v28;
  sqlite3_stmt *v29;
  void *v30;
  sqlite3_stmt *v31;
  void *v32;

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 1, *(id *)(a1 + 40));
  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("Type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v2, 2, v3);

  v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ChangeCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v4, 3, objc_msgSend(v5, "intValue"));

  v6 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VectorClock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v6, 4, v7);

  v8 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("IsRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v8, 5, objc_msgSend(v9, "BOOLValue"));

  v10 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SyncID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v10, 6, v11);

  v12 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v12, 7, v13);

  v14 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("WantsResponse"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v14, 8, objc_msgSend(v15, "BOOLValue"));

  v16 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("WantsDeliveryAck"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v16, 9, objc_msgSend(v17, "BOOLValue"));

  v18 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ProtocolVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v18, 10, objc_msgSend(v19, "intValue"));

  v20 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("MessageSequenceNumber"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(v20, 11, objc_msgSend(v21, "longLongValue"));

  v22 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ChunkIndex"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v22, 12, objc_msgSend(v23, "intValue"));

  v24 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("IsResetSyncSession"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v24, 13, objc_msgSend(v25, "BOOLValue"));

  v26 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("SessionMetadata"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v26, 14, v28);

  v29 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("WantsRollback"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v29, 15, objc_msgSend(v30, "BOOLValue"));

  v31 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("RequestAccepted"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v31, 16, objc_msgSend(v32, "BOOLValue"));

  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_151_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)assignIdentifier:(id)a3 toOutgoingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  objc_getAssociatedObject(v7, "CompanionSync.StatisticStore.ReservedRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[SYStatisticStore recordOutgoingMessage:forService:](self, "recordOutgoingMessage:forService:", v7, CFSTR("<unknown>")), objc_getAssociatedObject(v7, "CompanionSync.StatisticStore.ReservedRowID"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = objc_msgSend(v8, "longLongValue");
    -[SYStatisticStore _getMachTimestamp](self, "_getMachTimestamp");
    v11 = v10;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke;
    v12[3] = &unk_24CC672F8;
    v12[4] = self;
    v13 = v6;
    v14 = v11;
    v15 = v9;
    -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v12);

  }
}

uint64_t __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 1, *(id *)(a1 + 40));
  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 2, *(double *)(a1 + 48));
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 3, *(_QWORD *)(a1 + 56));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)updateOutgoingMessageWithIdentifier:(id)a3 forService:(id)a4 sentSuccessfully:(BOOL)a5 sendError:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v9 = a3;
  v10 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke;
  v13[3] = &unk_24CC67320;
  v13[4] = self;
  v14 = v9;
  v16 = a5;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v13);

}

uint64_t __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  sqlite3_stmt *v4;
  void *v5;

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 1, *(id *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_2();
  }
  v2 = sqlite3_column_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 0);
  v3 = 0.0;
  if (v2 > 0.0)
    v3 = CFAbsoluteTimeGetCurrent() - v2;
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 1, v3);
  sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 2, *(unsigned __int8 *)(a1 + 56));
  sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 3, 0);
  v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 48), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v4, 4, v5);

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 5, *(id *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)updateOutgoingMessageWithIdentifier:(id)a3 didReceiveResponse:(BOOL)a4 error:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v7 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke;
  v9[3] = &unk_24CC65268;
  v11 = a4;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v9);

}

uint64_t __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke(uint64_t a1)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 1, *(unsigned __int8 *)(a1 + 48));
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 2, *(id *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)confirmDeliveryOfOutgoingMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke;
  v6[3] = &unk_24CC652B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v6);

}

uint64_t __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 1, *(id *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)recordIncomingFileTransferAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 forService:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SYStatisticStore _getMachTimestamp](self, "_getMachTimestamp");
  v15 = v14;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EnqueuedAt"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "timeIntervalSinceDate:", v16);
    v19 = v18;

  }
  else
  {
    v19 = 0;
  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke;
  v24[3] = &unk_24CC67348;
  v24[4] = self;
  v25 = v10;
  v26 = v13;
  v27 = v12;
  v28 = v11;
  v29 = v15;
  v30 = v19;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v10;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v24);

}

uint64_t __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  sqlite3_stmt *v4;
  void *v5;

  sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 1, 1);
  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v2, 2, v3);

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 3, *(id *)(a1 + 48));
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 4, *(id *)(a1 + 56));
  v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("PeerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v4, 5, v5);

  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 6, *(double *)(a1 + 72));
  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 7, *(double *)(a1 + 80));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)recordOutgoingFileTransferAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 error:(id)a6 forService:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[SYStatisticStore _getMachTimestamp](self, "_getMachTimestamp");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke;
  v20[3] = &unk_24CC67370;
  v20[4] = self;
  v21 = v11;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = v15;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v11;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v20);

}

uint64_t __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  sqlite3_stmt *v4;
  void *v5;

  sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 1, 0);
  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v2, 2, v3);

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 3, *(id *)(a1 + 48));
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 4, *(id *)(a1 + 56));
  v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("PeerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BindString_0(v4, 5, v5);

  sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 6, *(double *)(a1 + 72));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)updateOutgoingFileTransferWithIdentifier:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke;
  v12[3] = &unk_24CC67320;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v12);

}

void __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  sqlite3_stmt *v4;
  void *v5;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT timestamp FROM file_transfer_log WHERE identifier=? ORDER BY timestamp DESC LIMIT 1", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke_cold_3();
  }
  else
  {
    BindString_0(ppStmt, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_2();
    }
    v2 = sqlite3_column_double(ppStmt, 0);
    v3 = 0.0;
    if (v2 > 0.0)
      v3 = CFAbsoluteTimeGetCurrent() - v2;
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
    sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 1, v3);
    sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 2, *(unsigned __int8 *)(a1 + 56));
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 48), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BindString_0(v4, 3, v5);

    BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 4, *(id *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72)) - 102) <= 0xFFFFFFFD)
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
  }
}

- (void)confirmDeliveryOfOutgoingFileTransfer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__SYStatisticStore_confirmDeliveryOfOutgoingFileTransfer___block_invoke;
  v6[3] = &unk_24CC652B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v6);

}

void __58__SYStatisticStore_confirmDeliveryOfOutgoingFileTransfer___block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "UPDATE message_log SET delivery_acked=1 WHERE identifier=?", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1();
  }
  else
  {
    BindString_0(ppStmt, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1();
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)rowIDForPartialMessage:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_getAssociatedObject(a3, "CompanionSync.StatisticStore.ReservedRowID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)setFileTransferIdentifier:(id)a3 forOutgoingMessagesWithRowIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SYStatisticStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke;
  v10[3] = &unk_24CC65560;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v10);

}

void __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  sqlite3 *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x24BDD16A8]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_getMachTimestamp");
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("UPDATE message_log SET identifier='FileTransfer:%@', file_transfer_id='%@', mach_time='%f' WHERE pk IN ("), v3, v3, v4);
  v6 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_2;
  v10[3] = &unk_24CC67398;
  v7 = v5;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);
  objc_msgSend(v7, "appendString:", CFSTR(")"));
  v8 = *(sqlite3 **)(*(_QWORD *)(a1 + 40) + 16);
  v9 = objc_retainAutorelease(v7);
  if (ExecuteSQL_2(v8, (char *)objc_msgSend(v9, "UTF8String")))
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_cold_1();
  }

}

unint64_t __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'%lu'"), a2);
  result = objc_msgSend(*(id *)(a1 + 40), "lastIndex");
  if (result > a2)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterOperationQueue, 0);
  objc_storeStrong((id *)&self->_operations_queue, 0);
  objc_storeStrong((id *)&self->_preemption_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_initializeFilePresentation
{
  NSOperationQueue *v3;
  NSOperationQueue *presenterOperationQueue;

  v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
  presenterOperationQueue = self->_presenterOperationQueue;
  self->_presenterOperationQueue = v3;

  -[NSOperationQueue setUnderlyingQueue:](self->_presenterOperationQueue, "setUnderlyingQueue:", self->_operations_queue);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", self->_path, 0);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presenterOperationQueue;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (self->_db)
  {
    if (-[SYStatisticStore _closeDB](self, "_closeDB"))
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        -[SYStatisticStore(NSFilePresentation) accommodatePresentedItemDeletionWithCompletionHandler:].cold.1();
    }
    self->_db = 0;
  }
  v4[2](v4, 0);

}

- (void)presentedItemDidMoveToURL:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *path;
  id v7;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("statistics.db"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v5;

}

- (sqlite3)dbRef
{
  return self->_db;
}

- (id)operationQ
{
  return self->_preemption_queue;
}

+ (id)unpackMessageData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unpackMessageData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_LOCKED_allServiceNames
{
  void *v3;
  int v4;
  const unsigned __int8 *v5;
  uint64_t v6;
  void *v7;
  id v8;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "SELECT DISTINCT service FROM message_log", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      -[SYStatisticStore(DatabaseTidying) _LOCKED_allServiceNames].cold.2();
    return 0;
  }
  else
  {
    v3 = (void *)objc_opt_new();
    while (1)
    {
      v4 = sqlite3_step(ppStmt);
      if (v4 != 100)
        break;
      v5 = sqlite3_column_text(ppStmt, 0);
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          objc_msgSend(v3, "addObject:", v6);

        }
      }
    }
    if (!v4 || v4 == 101)
      goto LABEL_19;
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      -[SYStatisticStore(DatabaseTidying) _LOCKED_allServiceNames].cold.1();
    if (objc_msgSend(v3, "count"))
    {
LABEL_19:
      sqlite3_finalize(ppStmt);
      v8 = v3;
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
}

- (BOOL)_LOCKED_pruneMessageLogForServices:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  sqlite3_stmt *ppStmt;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "DELETE FROM message_log WHERE service=? ORDER BY pk DESC LIMIT -1 OFFSET 250", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:].cold.2();
    ExecuteSQL_2(self->_db, "ROLLBACK");
    v5 = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
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
          BindString_0(ppStmt, 1, *(id *)(*((_QWORD *)&v13 + 1) + 8 * i));
          v11 = sqlite3_step(ppStmt);
          if (v11 && v11 != 101)
          {
            if (_stats_log_pred != -1)
              _os_once();
            if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
              -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:].cold.1();
            v5 = 0;
            goto LABEL_22;
          }
          sqlite3_reset(ppStmt);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 1;
LABEL_22:

    sqlite3_finalize(ppStmt);
  }

  return v5;
}

- (BOOL)_LOCKED_pruneFileTransferLogForServices:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  sqlite3_stmt *ppStmt;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "DELETE FROM file_transfer_log WHERE service=? ORDER BY pk DESC LIMIT -1 OFFSET 250", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
      -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:].cold.2();
    ExecuteSQL_2(self->_db, "ROLLBACK");
    v5 = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
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
          BindString_0(ppStmt, 1, *(id *)(*((_QWORD *)&v13 + 1) + 8 * i));
          v11 = sqlite3_step(ppStmt);
          if (v11 && v11 != 101)
          {
            if (_stats_log_pred != -1)
              _os_once();
            if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
              -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:].cold.1();
            v5 = 0;
            goto LABEL_22;
          }
          sqlite3_reset(ppStmt);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 1;
LABEL_22:

    sqlite3_finalize(ppStmt);
  }

  return v5;
}

- (void)_pruneOldData
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke;
  v2[3] = &unk_24CC65418;
  v2[4] = self;
  -[SYStatisticStore _onQueueAsync:](self, "_onQueueAsync:", v2);
}

void __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_LOCKED_allServiceNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "BEGIN EXCLUSIVE TRANSACTION"))
    {
      if (_stats_log_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
        __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_2();
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "_LOCKED_pruneMessageLogForServices:", v2)
           && objc_msgSend(*(id *)(a1 + 32), "_LOCKED_pruneFileTransferLogForServices:", v2))
    {
      if (ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "COMMIT"))
      {
        if (_stats_log_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR))
          __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_1();
      }
    }
    else
    {
      ExecuteSQL_2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "ROLLBACK");
    }
  }

}

- (void)_tableEmpty:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error checking for empty table - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_ensureCorrectFileOwnership:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *__error();
  v6 = 138543618;
  v7 = a1;
  v8 = 1024;
  v9 = v4;
  OUTLINED_FUNCTION_4_5(&dword_211704000, v3, v5, "Error chowning path %{public}@, error: %d", (uint8_t *)&v6);

  OUTLINED_FUNCTION_4_0();
}

- (uint64_t)_ensureCorrectFileOwnership:.cold.2()
{
  __error();
  return _os_assumes_log();
}

void __32__SYStatisticStore__openDBFile___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_211704000, a2, a3, "Error coordinating deletion of existing DB: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __32__SYStatisticStore__openDBFile___block_invoke_67_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Failed to open statistics DB - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_getSchemaVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error fetching schema version - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __27__SYStatisticStore__openDB__block_invoke_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_211704000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error inserting incoming message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error adding processing time to incoming message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Failed to add error to incoming message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error marking incoming message as complete - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error reserving db row for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_151_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error inserting outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error recording identifier for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error updating outgoing message for ID - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error finding timestamp for ID - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error while updating response state for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error while recording delivery confirmation for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error while recording incoming file transfer - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error while recording outgoing file transfer - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error while updating outgoing file transfer for send-success notification - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_5(&dword_211704000, v0, (uint64_t)v0, "Error bulk-updating identifiers (statement = \"%{public}@\") - %{companionsync:sqlite3err, public}d", v1);
  OUTLINED_FUNCTION_2();
}

void __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Prune transaction failed to commit - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Failed to create transaction for DB prune - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
