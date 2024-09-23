@implementation NNMKSQLiteConnection

- (NNMKSQLiteConnection)initWithPath:(id)a3 errorCode:(int *)a4
{
  id v7;
  NNMKSQLiteConnection *v8;
  NNMKSQLiteConnection *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dbQueue;
  uint64_t v12;
  NSMutableDictionary *cachedPreparedStatementsBySQLPattern;
  NSObject *v14;
  _QWORD block[4];
  NNMKSQLiteConnection *v17;
  id v18;
  int *v19;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NNMKSQLiteConnection;
  v8 = -[NNMKSQLiteConnection init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isInTransaction = 0;
    v10 = dispatch_queue_create("com.apple.nanomail.dbQueue", 0);
    dbQueue = v9->_dbQueue;
    v9->_dbQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_databasePath, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    cachedPreparedStatementsBySQLPattern = v9->_cachedPreparedStatementsBySQLPattern;
    v9->_cachedPreparedStatementsBySQLPattern = (NSMutableDictionary *)v12;

    v14 = v9->_dbQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__NNMKSQLiteConnection_initWithPath_errorCode___block_invoke;
    block[3] = &unk_24F9F6958;
    v17 = v9;
    v18 = v7;
    v19 = a4;
    dispatch_sync(v14, block);

  }
  return v9;
}

uint64_t __47__NNMKSQLiteConnection_initWithPath_errorCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openDatabaseWithPath:errorCode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dealloc
{
  NSObject *dbQueue;
  objc_super v4;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__NNMKSQLiteConnection_dealloc__block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)NNMKSQLiteConnection;
  -[NNMKSQLiteConnection dealloc](&v4, sel_dealloc);
}

uint64_t __31__NNMKSQLiteConnection_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (sqlite3_stmt)preparedStatementForPattern:(id)a3
{
  return -[NNMKSQLiteConnection preparedStatementForPattern:cacheStatement:](self, "preparedStatementForPattern:cacheStatement:", a3, 1);
}

- (sqlite3_stmt)preparedStatementForPattern:(id)a3 cacheStatement:(BOOL)a4
{
  id v6;
  NSObject *dbQueue;
  id v8;
  sqlite3_stmt *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  dbQueue = self->_dbQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__NNMKSQLiteConnection_preparedStatementForPattern_cacheStatement___block_invoke;
  v11[3] = &unk_24F9F6980;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(dbQueue, v11);
  v9 = (sqlite3_stmt *)v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __67__NNMKSQLiteConnection_preparedStatementForPattern_cacheStatement___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_preparedStatementForPattern:cacheStatement:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)stepPreparedStatement:(sqlite3_stmt *)a3
{
  NSObject *dbQueue;
  int v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NNMKSQLiteConnection_stepPreparedStatement___block_invoke;
  block[3] = &unk_24F9F69A8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dbQueue, block);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__NNMKSQLiteConnection_stepPreparedStatement___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_stepPreparedStatement:", *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)executeSQL:(id)a3
{
  id v4;
  NSObject *dbQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__NNMKSQLiteConnection_executeSQL___block_invoke;
  block[3] = &unk_24F9F69D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dbQueue, block);
  LODWORD(dbQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)dbQueue;
}

uint64_t __35__NNMKSQLiteConnection_executeSQL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)beginTransaction
{
  NSObject *dbQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__NNMKSQLiteConnection_beginTransaction__block_invoke;
  v5[3] = &unk_24F9F69F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__NNMKSQLiteConnection_beginTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  sqlite3_stmt *v2;
  int v3;
  void *v4;

  v1 = a1 + 32;
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_preparedStatementForPattern:cacheStatement:", CFSTR("begin exclusive transaction"), 1);
  v3 = objc_msgSend(*(id *)v1, "_stepPreparedStatement:", v2);
  sqlite3_reset(v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 8) + 24) = v3 == 101;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)v1 + 8) = 1;
  }
  else
  {
    v4 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __40__NNMKSQLiteConnection_beginTransaction__block_invoke_cold_1(v1, v4);
  }
}

- (BOOL)commitTransaction
{
  NSObject *dbQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__NNMKSQLiteConnection_commitTransaction__block_invoke;
  v5[3] = &unk_24F9F69F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__NNMKSQLiteConnection_commitTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  sqlite3_stmt *v2;
  int v3;
  void *v4;

  v1 = a1 + 32;
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_preparedStatementForPattern:cacheStatement:", CFSTR("commit transaction"), 1);
  v3 = objc_msgSend(*(id *)v1, "_stepPreparedStatement:", v2);
  sqlite3_reset(v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 8) + 24) = v3 == 101;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)v1 + 8) = 0;
  }
  else
  {
    v4 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __41__NNMKSQLiteConnection_commitTransaction__block_invoke_cold_1(v1, v4);
  }
}

- (BOOL)rollbackTransaction
{
  NSObject *dbQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke;
  v5[3] = &unk_24F9F69F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  sqlite3_stmt *v2;
  int v3;
  void *v4;

  v1 = a1 + 32;
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_preparedStatementForPattern:cacheStatement:", CFSTR("rollback transaction"), 1);
  v3 = objc_msgSend(*(id *)v1, "_stepPreparedStatement:", v2);
  sqlite3_reset(v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 8) + 24) = v3 == 101;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)v1 + 8) = 0;
  }
  else
  {
    v4 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke_cold_1(v1, v4);
  }
}

- (int)lastErrorCode
{
  NSObject *dbQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__NNMKSQLiteConnection_lastErrorCode__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__NNMKSQLiteConnection_lastErrorCode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lastErrorCode");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)lastErrorMessage
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__NNMKSQLiteConnection_lastErrorMessage__block_invoke;
  v5[3] = &unk_24F9F6A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__NNMKSQLiteConnection_lastErrorMessage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lastErrorMessage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)tableExists:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  NSObject *dbQueue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NNMKSQLiteConnection *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  dbQueue = self->_dbQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__NNMKSQLiteConnection_tableExists_inDatabase___block_invoke;
  v12[3] = &unk_24F9F6A48;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(dbQueue, v12);
  LOBYTE(v6) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

void __47__NNMKSQLiteConnection_tableExists_inDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  sqlite3_stmt *v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("select [sql] from %@sqlite_master where [type] = 'table' and lower(name) = ?"), v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select [sql] from %@sqlite_master where [type] = 'table' and lower(name) = ?"), &stru_24F9F9D80);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 40), "_preparedStatementForPattern:cacheStatement:", v7, 1);
  objc_msgSend(*(id *)(a1 + 48), "lowercaseString");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_stepPreparedStatement:", v5) == 100;
  sqlite3_reset(v5);

}

+ (BOOL)errorCodeMeansCorruptedDatabase:(int)a3
{
  return (a3 < 0x1B) & (0x4806D08u >> a3);
}

- (BOOL)_openDatabaseWithPath:(id)a3 errorCode:(int *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  id v12;
  int v13;
  void *v14;
  _BOOL4 v15;
  BOOL v16;
  void *v17;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v23);
    v12 = v23;

    if ((v11 & 1) == 0)
    {
      v17 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        -[NNMKSQLiteConnection _openDatabaseWithPath:errorCode:].cold.2(v7, (uint64_t)v12, v17);
      v16 = 0;
      goto LABEL_20;
    }

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file:%@"), v6);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = sqlite3_open_v2((const char *)objc_msgSend(v12, "UTF8String"), &self->_db, 4194310, 0);
  if (v13)
    goto LABEL_10;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__NNMKSQLiteConnection__openDatabaseWithPath_errorCode___block_invoke;
  v22[3] = &unk_24F9F6A70;
  v22[4] = self;
  v13 = -[NNMKSQLiteConnection _runRetryingIfNeeded:](self, "_runRetryingIfNeeded:", v22);
  if (v13
    || (v13 = -[NNMKSQLiteConnection _executeSQL:](self, "_executeSQL:", CFSTR("PRAGMA page_size = 4096;"))) != 0
    || (v13 = -[NNMKSQLiteConnection _executeSQL:](self, "_executeSQL:", CFSTR("PRAGMA auto_vacuum = 1;"))) != 0
    || (v13 = -[NNMKSQLiteConnection _executeSQL:](self, "_executeSQL:", CFSTR("PRAGMA cache_size = 100;"))) != 0
    || (v13 = -[NNMKSQLiteConnection _executeSQL:](self, "_executeSQL:", CFSTR("PRAGMA journal_mode = WAL;"))) != 0)
  {
LABEL_10:
    v14 = (void *)qword_253E87A90;
    v15 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_FAULT);
    if (v13 == 14)
    {
      if (v15)
        -[NNMKSQLiteConnection _openDatabaseWithPath:errorCode:].cold.1((uint64_t)v6, v14, self);
    }
    else if (v15)
    {
      v19 = v14;
      -[NNMKSQLiteConnection _lastErrorMessage](self, "_lastErrorMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v6;
      v26 = 1024;
      *(_DWORD *)v27 = v13;
      v27[2] = 2114;
      *(_QWORD *)&v27[3] = v20;
      _os_log_fault_impl(&dword_22E161000, v19, OS_LOG_TYPE_FAULT, "Error opening database (Path: %{public}@, Error Code: %d, Error Message: %{public}@). Closing... and retrying", buf, 0x1Cu);

    }
    -[NNMKSQLiteConnection _closeDatabase](self, "_closeDatabase");
    v16 = 0;
    if (a4)
      goto LABEL_16;
  }
  else
  {
    v21 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      v26 = 2114;
      *(_QWORD *)v27 = self;
      _os_log_impl(&dword_22E161000, v21, OS_LOG_TYPE_DEFAULT, "Database opened (%{public}@, %{public}@).", buf, 0x16u);
    }
    v16 = 1;
    if (a4)
    {
      v13 = 0;
LABEL_16:
      *a4 = v13;
    }
  }
LABEL_20:

  return v16;
}

uint64_t __56__NNMKSQLiteConnection__openDatabaseWithPath_errorCode___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = sqlite3_busy_timeout(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), 0x7FFFFFFF);
  *a2 = result;
  return result;
}

- (void)_closeDatabase
{
  void *v9;

  if ((a1 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_0(&dword_22E161000, a2, a3, "Error closing database. File no longer exists. (Path: %{public}@).", a5, a6, a7, a8, 2u);
  if ((a1 & 1) == 0)

}

uint64_t __38__NNMKSQLiteConnection__closeDatabase__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = sqlite3_close_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16));
  *a2 = result;
  return result;
}

- (sqlite3_stmt)_preparedStatementForPattern:(id)a3 cacheStatement:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  sqlite3_stmt *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSMutableDictionary *cachedPreparedStatementsBySQLPattern;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[24];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_db)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    -[NSMutableDictionary objectForKey:](self->_cachedPreparedStatementsBySQLPattern, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pointerValue");

    v21 = v8;
    v9 = (sqlite3_stmt *)v19[3];
    if (v9)
    {
LABEL_13:
      _Block_object_dispose(&v18, 8);
      goto LABEL_14;
    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__NNMKSQLiteConnection__preparedStatementForPattern_cacheStatement___block_invoke;
    v15[3] = &unk_24F9F6A98;
    v15[4] = self;
    v10 = v6;
    v16 = v10;
    v17 = &v18;
    if (-[NNMKSQLiteConnection _runRetryingIfNeeded:](self, "_runRetryingIfNeeded:", v15))
    {
      sqlite3_finalize((sqlite3_stmt *)v19[3]);
      v19[3] = 0;
      v11 = (id)qword_253E87A90;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[NNMKSQLiteConnection _lastErrorMessage](self, "_lastErrorMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSQLiteConnection _preparedStatementForPattern:cacheStatement:].cold.2((uint64_t)v10, v12, buf, v11);
      }
    }
    else
    {
      if (!v4)
      {
LABEL_12:

        v9 = (sqlite3_stmt *)v19[3];
        goto LABEL_13;
      }
      cachedPreparedStatementsBySQLPattern = self->_cachedPreparedStatementsBySQLPattern;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v19[3]);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](cachedPreparedStatementsBySQLPattern, "setObject:forKey:", v11, v10);
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    -[NNMKSQLiteConnection _preparedStatementForPattern:cacheStatement:].cold.1();
  v9 = 0;
LABEL_14:

  return v9;
}

uint64_t __68__NNMKSQLiteConnection__preparedStatementForPattern_cacheStatement___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (sqlite3_stmt **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0);
  *a2 = result;
  return result;
}

- (int)_stepPreparedStatement:(sqlite3_stmt *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NNMKSQLiteConnection__stepPreparedStatement___block_invoke;
  v4[3] = &__block_descriptor_40_e9_v16__0_i8l;
  v4[4] = a3;
  return -[NNMKSQLiteConnection _runRetryingIfNeeded:](self, "_runRetryingIfNeeded:", v4);
}

uint64_t __47__NNMKSQLiteConnection__stepPreparedStatement___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = sqlite3_step(*(sqlite3_stmt **)(a1 + 32));
  *a2 = result;
  return result;
}

- (int)_executeSQL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = v4;
  if (self->_db)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__NNMKSQLiteConnection__executeSQL___block_invoke;
    v11[3] = &unk_24F9F6AE0;
    v11[4] = self;
    v12 = v4;
    v6 = -[NNMKSQLiteConnection _runRetryingIfNeeded:](self, "_runRetryingIfNeeded:", v11);

  }
  else
  {
    v7 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSQLiteConnection _executeSQL:].cold.1(v7, v8, v9);
    v6 = 1;
  }

  return v6;
}

uint64_t __36__NNMKSQLiteConnection__executeSQL___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = sqlite3_exec(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), 0, 0, 0);
  *a2 = result;
  return result;
}

- (int)_lastErrorCode
{
  sqlite3 *db;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  db = self->_db;
  if (db)
    return sqlite3_errcode(db);
  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    -[NNMKSQLiteConnection _lastErrorCode].cold.1(v4, v5, v6);
  return 1;
}

- (id)_lastErrorMessage
{
  sqlite3 *db;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  db = self->_db;
  if (db)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_errmsg(db));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSQLiteConnection _lastErrorMessage].cold.1(v4, v5, v6);
    v3 = 0;
  }
  return v3;
}

- (int)_runRetryingIfNeeded:(id)a3
{
  void (**v3)(id, _DWORD *);
  int v4;
  unsigned int v5;
  useconds_t v6;
  NSObject *v7;
  NSObject *v9;
  uint8_t v11;
  _BYTE v12[15];
  uint8_t buf[12];
  int v14;

  v3 = (void (**)(id, _DWORD *))a3;
  v14 = 0;
  v3[2](v3, &v14);
  v4 = v14;
  if ((v14 - 5) <= 2)
  {
    v5 = 0;
    v6 = 20;
    do
    {
      v7 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E161000, v7, OS_LOG_TYPE_DEFAULT, "Database busy/locked for running statement or Low memory condition. Will re-try...", buf, 2u);
      }
      usleep(v6);
      if (v14 == 7 && v5 >= 8)
      {
        v9 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
          -[NNMKSQLiteConnection _runRetryingIfNeeded:].cold.1(&v11, v12, v9);
      }
      v6 *= 5;
      v3[2](v3, &v14);
      v4 = v14;
      ++v5;
    }
    while ((v14 - 5) < 3);
  }

  return v4;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (BOOL)isInTransaction
{
  return self->_isInTransaction;
}

- (void)setIsInTransaction:(BOOL)a3
{
  self->_isInTransaction = a3;
}

- (OS_dispatch_queue)dbQueue
{
  return self->_dbQueue;
}

- (void)setDbQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dbQueue, a3);
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
  objc_storeStrong((id *)&self->_databasePath, a3);
}

- (NSMutableDictionary)cachedPreparedStatementsBySQLPattern
{
  return self->_cachedPreparedStatementsBySQLPattern;
}

- (void)setCachedPreparedStatementsBySQLPattern:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPreparedStatementsBySQLPattern, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPreparedStatementsBySQLPattern, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
}

void __40__NNMKSQLiteConnection_beginTransaction__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend(v2, "_lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v5, v6, "Failed to begin transaction. (%{public}@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __41__NNMKSQLiteConnection_commitTransaction__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend(v2, "_lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v5, v6, "Failed to commit transaction. (%{public}@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __43__NNMKSQLiteConnection_rollbackTransaction__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend(v2, "_lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v5, v6, "Failed to rollback transaction. (%{public}@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)_openDatabaseWithPath:(void *)a3 errorCode:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "_lastErrorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 1024;
  v10 = 14;
  v11 = 2114;
  v12 = v6;
  _os_log_fault_impl(&dword_22E161000, v5, OS_LOG_TYPE_FAULT, "Error opening database. Check sandbox permissions. Closing... (Path: %{public}@, Error Code: %d, Error Message: %{public}@).", (uint8_t *)&v7, 0x1Cu);

}

- (void)_openDatabaseWithPath:(void *)a3 errorCode:.cold.2(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = a1;
  v11 = 2114;
  v12 = a2;
  v13 = 1024;
  v14 = objc_msgSend(v7, "fileExistsAtPath:", v8) ^ 1;
  _os_log_error_impl(&dword_22E161000, v6, OS_LOG_TYPE_ERROR, "Error creating database directory. (Path: %{public}@, Error: %{public}@, Parent Exists: %d)", (uint8_t *)&v9, 0x1Cu);

}

- (void)_preparedStatementForPattern:cacheStatement:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_22E161000, v0, OS_LOG_TYPE_ERROR, "Error preparing statement - db doesn't seem to be open (pattern: %{public}@).", v1, 0xCu);
}

- (void)_preparedStatementForPattern:(uint8_t *)buf cacheStatement:(os_log_t)log .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Error preparing statement for pattern: %{public}@. (%{public}@)", buf, 0x16u);

}

- (void)_executeSQL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_22E161000, a1, a3, "Error executing SQL - db doesn't seem to be open.", v3);
  OUTLINED_FUNCTION_19();
}

- (void)_lastErrorCode
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_22E161000, a1, a3, "Error retrieving last error code - db doesn't seem to be open.", v3);
  OUTLINED_FUNCTION_19();
}

- (void)_lastErrorMessage
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_22E161000, a1, a3, "Error retrieving last error message - db doesn't seem to be open.", v3);
  OUTLINED_FUNCTION_19();
}

- (void)_runRetryingIfNeeded:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_0(&dword_22E161000, a3, (uint64_t)a3, "Tried to execute database operation multiple times and received NOMEM. Crashing intentionally so we the process can restart and memory can be freed up...", a1);
}

@end
