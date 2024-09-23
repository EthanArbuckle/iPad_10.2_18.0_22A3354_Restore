@implementation NMSWindowData

- (NMSWindowData)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NMSWindowData *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("sqlitedb"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NMSWindowData initWithPath:logFacility:](self, "initWithPath:logFacility:", v9, CFSTR("com.apple.private.NanoMessagingService"));
  return v10;
}

- (NMSWindowData)initWithPath:(id)a3 logFacility:(__CFString *)a4
{
  id v6;
  NMSWindowData *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *syncQ;
  uint64_t v13;
  NSString *path;
  NMSWindowData *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NMSWindowData;
  v7 = -[NMSWindowData init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NMSWindow<%p> sync queue"), v7));
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    syncQ = v7->_syncQ;
    v7->_syncQ = (OS_dispatch_queue *)v11;

    v13 = objc_msgSend(v6, "copy");
    path = v7->_path;
    v7->_path = (NSString *)v13;

    if (a4)
      v7->_loggingFacility = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a4);
    if (-[NMSWindowData _openDBForceRecreate:](v7, "_openDBForceRecreate:", 0))
    {
      v15 = v7;
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_FAULT))
        -[NMSWindowData initWithPath:logFacility:].cold.1();
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NMSWindowData)initWithSharedDBForServiceName:(id)a3
{
  id v4;
  NMSWindowData *v5;
  uint64_t v6;
  _SYSharedServiceDB *sharedDB;
  NMSWindowData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMSWindowData;
  v5 = -[NMSWindowData init](&v10, sel_init);
  if (!v5)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  +[_SYSharedServiceDB sharedInstanceForServiceName:](_SYSharedServiceDB, "sharedInstanceForServiceName:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  sharedDB = v5->_sharedDB;
  v5->_sharedDB = (_SYSharedServiceDB *)v6;

  if (!v5->_sharedDB)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_FAULT))
      -[NMSWindowData initWithSharedDBForServiceName:].cold.1();
    goto LABEL_8;
  }
  -[NMSWindowData _ensureSchema](v5, "_ensureSchema");
  -[NMSWindowData _prepareStatements](v5, "_prepareStatements");
  v8 = v5;
LABEL_9:

  return v8;
}

- (void)dealloc
{
  __CFString *loggingFacility;
  sqlite3 *db;
  objc_super v5;
  _QWORD v6[5];

  loggingFacility = self->_loggingFacility;
  if (loggingFacility)
    CFRelease(loggingFacility);
  if (self->_db || self->_sharedDB)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __24__NMSWindowData_dealloc__block_invoke;
    v6[3] = &unk_24CC65320;
    v6[4] = self;
    -[NMSWindowData _withDB:](self, "_withDB:", v6);
    db = self->_db;
    if (db)
      sqlite3_close(db);
  }
  v5.receiver = self;
  v5.super_class = (Class)NMSWindowData;
  -[NMSWindowData dealloc](&v5, sel_dealloc);
}

uint64_t __24__NMSWindowData_dealloc__block_invoke(uint64_t a1)
{
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120));
  return sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 128));
}

- (void)_withDB:(id)a3
{
  id v4;
  _SYSharedServiceDB *sharedDB;
  NSObject *syncQ;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  sharedDB = self->_sharedDB;
  v7 = v4;
  if (sharedDB)
  {
    -[_SYSharedServiceDB withDBRef:](sharedDB, "withDBRef:", v4);
  }
  else
  {
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__NMSWindowData__withDB___block_invoke;
    block[3] = &unk_24CC65FE0;
    block[4] = self;
    v9 = v4;
    dispatch_sync(syncQ, block);

  }
}

uint64_t __25__NMSWindowData__withDB___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (BOOL)_syncTransaction:(BOOL)a3 block:(id)a4
{
  _BOOL4 v4;
  id v6;
  _SYSharedServiceDB *sharedDB;
  BOOL v8;
  NSObject *syncQ;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v6 = a4;
  sharedDB = self->_sharedDB;
  if (sharedDB)
  {
    if (v4)
      v8 = -[_SYSharedServiceDB inExclusiveTransaction:](sharedDB, "inExclusiveTransaction:", v6);
    else
      v8 = -[_SYSharedServiceDB inTransaction:](sharedDB, "inTransaction:", v6);
    v10 = v8;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    syncQ = self->_syncQ;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __40__NMSWindowData__syncTransaction_block___block_invoke;
    v12[3] = &unk_24CC66008;
    v15 = v4;
    v12[4] = self;
    v14 = &v16;
    v13 = v6;
    dispatch_sync(syncQ, v12);
    v10 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v10;
}

void __40__NMSWindowData__syncTransaction_block___block_invoke(uint64_t a1)
{
  sqlite3 *v2;
  int v3;
  int v4;
  sqlite3 *v5;
  int v6;

  v2 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_BYTE *)(a1 + 56))
    v3 = ExecuteSQL(v2, "BEGIN EXCLUSIVE TRANSACTION");
  else
    v3 = ExecuteSQL(v2, "BEGIN TRANSACTION");
  if (v3)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (!os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_8;
  }
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
  {
    v6 = ExecuteSQL(v5, "COMMIT TRANSACTION");
    if (!v6)
      return;
  }
  else
  {
    v6 = ExecuteSQL(v5, "ROLLBACK TRANSACTION");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (!v6)
      return;
  }
  if (v6 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (!os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
LABEL_8:
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (int)_getSchemaVersion
{
  int v3;
  int v5;
  sqlite3_stmt *ppStmt;

  if (sqlite3_table_column_metadata(self->_db, 0, "meta", "tstamp", 0, 0, 0, 0, 0))
    return 0;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    return 0;
  }
  v5 = sqlite3_step(ppStmt);
  v3 = 0;
  if (v5 && v5 != 101)
  {
    if (v5 == 100)
    {
      v3 = sqlite3_column_int(ppStmt, 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      v3 = 0;
    }
  }
  sqlite3_finalize(ppStmt);
  return v3;
}

- (BOOL)_openDBForceRecreate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void **p_path;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  sqlite3 **p_db;
  void *v24;
  BOOL v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  char v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v3 = a3;
  v33[3] = *MEMORY[0x24BDAC8D0];
  v31 = 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_path = (void **)&self->_path;
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", self->_path, &v31);

  if (v7)
    v8 = v31 == 0;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *p_path;
    v30 = 0;
    v11 = objc_msgSend(v9, "removeItemAtPath:error:", v10, &v30);
    v12 = v30;

    if (!v11)
    {
      _LogInfoForPath(*p_path);
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v24 = (void *)qword_253D84AC8;
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[NMSWindowData _openDBForceRecreate:].cold.5((uint64_t)p_path, v24, v12);
      goto LABEL_44;
    }

  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_15;
  }
  v13 = *MEMORY[0x24BDD0C78];
  v32[0] = *MEMORY[0x24BDD0CB0];
  v32[1] = v13;
  v33[0] = CFSTR("mobile");
  v33[1] = CFSTR("mobile");
  v32[2] = *MEMORY[0x24BDD0CC8];
  v33[2] = &unk_24CC83A20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *p_path;
  v29 = 0;
  v17 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, v14, &v29);
  v18 = v29;

  if ((v17 & 1) == 0)
  {
    _LogInfoForPath(*p_path);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = (void *)qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[NMSWindowData _openDBForceRecreate:].cold.4((uint64_t)&self->_path, v19, v18);
  }

LABEL_15:
  objc_msgSend(*p_path, "stringByAppendingPathComponent:", CFSTR("meta.db"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v21 = objc_msgSend(v20, "removeItemAtPath:error:", v12, &v28);
    v22 = v28;

    if ((v21 & 1) == 0)
    {
      _LogInfoForPath(v12);
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v26 = (void *)qword_253D84AC8;
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[NMSWindowData _openDBForceRecreate:].cold.3((uint64_t)v12, v26, v22);

      goto LABEL_44;
    }

  }
  v12 = objc_retainAutorelease(v12);
  p_db = &self->_db;
  if (sqlite3_open_v2((const char *)objc_msgSend(v12, "fileSystemRepresentation"), &self->_db, 4194310, 0) || !*p_db)
  {
    _LogInfoForPath(v12);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[NMSWindowData _openDBForceRecreate:].cold.2();
    if (*p_db)
    {
      sqlite3_close(*p_db);
      *p_db = 0;
    }
    if (!v3)
    {
      v25 = -[NMSWindowData _openDBForceRecreate:](self, "_openDBForceRecreate:", 1);
      goto LABEL_45;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[NMSWindowData _openDBForceRecreate:].cold.1();
LABEL_44:
    v25 = 0;
    goto LABEL_45;
  }
  ExecuteSQL(*p_db, "PRAGMA journal_mode=WAL;");
  sqlite3_busy_timeout(self->_db, 60000);
  sqlite3_extended_result_codes(self->_db, 1);
  if (!-[NMSWindowData _getSchemaVersion](self, "_getSchemaVersion"))
  {
    ExecuteSQL(*p_db, "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp TEXT)");
    ExecuteSQL(*p_db, "CREATE TABLE IF NOT EXISTS in_window (expires REAL, msg_id TEXT, num_bytes INTEGER)");
    ExecuteSQL(*p_db, "CREATE TABLE IF NOT EXISTS msg_queue (pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT, tstamp REAL)");
    ExecuteSQL(*p_db, "CREATE UNIQUE INDEX sent_by_uuid ON in_window (msg_id ASC)");
    ExecuteSQL(*p_db, "CREATE INDEX expiry ON in_window (expires ASC, msg_id)");
    ExecuteSQL(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
  }
  -[NMSWindowData _prepareStatements](self, "_prepareStatements");
  v25 = 1;
LABEL_45:

  return v25;
}

- (void)_ensureSchema
{
  _SYSharedServiceDB *sharedDB;
  objc_class *v3;
  id v4;

  sharedDB = self->_sharedDB;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_SYSharedServiceDB updateSchemaForClient:usingBlock:](sharedDB, "updateSchemaForClient:usingBlock:", v4, &__block_literal_global_4);

}

uint64_t __30__NMSWindowData__ensureSchema__block_invoke(int a1, sqlite3 *a2, uint64_t a3)
{
  uint64_t result;

  result = a3;
  if (!a3)
  {
    ExecuteSQL(a2, "CREATE TABLE IF NOT EXISTS in_window (expires REAL, msg_id TEXT, num_bytes INTEGER)");
    ExecuteSQL(a2, "CREATE TABLE IF NOT EXISTS msg_queue (pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT, tstamp REAL)");
    ExecuteSQL(a2, "CREATE UNIQUE INDEX sent_by_uuid ON in_window (msg_id ASC)");
    ExecuteSQL(a2, "CREATE INDEX expiry ON in_window (expires ASC, msg_id)");
    return 1;
  }
  return result;
}

- (void)_prepareStatements
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__NMSWindowData__prepareStatements__block_invoke;
  v2[3] = &unk_24CC65320;
  v2[4] = self;
  -[NMSWindowData _withDB:](self, "_withDB:", v2);
}

void __35__NMSWindowData__prepareStatements__block_invoke(uint64_t a1, sqlite3 *db)
{
  if (sqlite3_prepare_v2(db, "INSERT INTO in_window (expires, msg_id, num_bytes) VALUES (?, ?, ?)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT num_bytes FROM in_window WHERE msg_id=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM in_window WHERE msg_id=?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT expires FROM in_window ORDER BY expires LIMIT 1", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT msg_id FROM in_window WHERE expires < ?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT SUM(num_bytes) FROM in_window", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM in_window", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "INSERT INTO msg_queue (uuid, tstamp) VALUES (?, ?)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT uuid FROM msg_queue ORDER BY pk ASC LIMIT 1", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM msg_queue WHERE pk=(SELECT min(pk) FROM msg_queue)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM msg_queue", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 128), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)removeAllMessages
{
  -[NMSWindowData _syncTransaction:block:](self, "_syncTransaction:block:", 1, &__block_literal_global_46);
}

uint64_t __34__NMSWindowData_removeAllMessages__block_invoke(int a1, sqlite3 *a2)
{
  int v3;
  int v4;

  v3 = ExecuteSQL(a2, "DELETE FROM in_window");
  if (v3 && v3 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  v4 = ExecuteSQL(a2, "DELETE FROM msg_queue");
  if (v4 && v4 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return 1;
}

- (void)addMessageWithID:(id)a3 ofLength:(unint64_t)a4 timeoutTime:(double)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  double v12;
  unint64_t v13;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__NMSWindowData_addMessageWithID_ofLength_timeoutTime___block_invoke;
  v10[3] = &unk_24CC660B0;
  v12 = a5;
  v10[4] = self;
  v11 = v8;
  v13 = a4;
  v9 = v8;
  -[NMSWindowData _withDB:](self, "_withDB:", v10);

}

uint64_t __55__NMSWindowData_addMessageWithID_ofLength_timeoutTime___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  double v4;

  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  sqlite3_bind_double(v2, 1, v4);

  BindString(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48), 2, *(id *)(a1 + 40));
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48), 3, *(_QWORD *)(a1 + 56));
  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48)) != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
}

- (unint64_t)removeAndReturnLengthOfMessageWithID:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__NMSWindowData_removeAndReturnLengthOfMessageWithID___block_invoke;
  v8[3] = &unk_24CC660D8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NMSWindowData _syncTransaction:block:](self, "_syncTransaction:block:", 1, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __54__NMSWindowData_removeAndReturnLengthOfMessageWithID___block_invoke(uint64_t a1)
{
  int v2;

  BindString(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 1, *(id *)(a1 + 40));
  v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  if ((v2 - 102) > 0xFFFFFFFD)
  {
    if (v2 == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 0);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    BindString(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 1, *(id *)(a1 + 40));
    if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64)) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
  }
  return 1;
}

- (unint64_t)removeAndReturnLengthOfMessagesWithIDs:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__NMSWindowData_removeAndReturnLengthOfMessagesWithIDs___block_invoke;
  v8[3] = &unk_24CC66100;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NMSWindowData _syncTransaction:block:](self, "_syncTransaction:block:", 1, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __56__NMSWindowData_removeAndReturnLengthOfMessagesWithIDs___block_invoke(uint64_t a1, sqlite3 *a2)
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR("', '"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT SUM(num_bytes) FROM in_window WHERE msg_id IN ('%@')"), v4));
  if (!sqlite3_prepare_v2(a2, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0))
  {
    v6 = sqlite3_step(ppStmt);
    if ((v6 - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      goto LABEL_25;
    }
    if (v6 == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(ppStmt, 0);
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("DELETE FROM in_window WHERE msg_id IN ('%@')"), v4);

    v5 = objc_retainAutorelease(v7);
    if (sqlite3_prepare_v2(a2, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (!os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
    }
    else
    {
      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_reset(ppStmt);
        sqlite3_clear_bindings(ppStmt);
        sqlite3_finalize(ppStmt);
        goto LABEL_25;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (!os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        goto LABEL_25;
      }
    }
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    goto LABEL_24;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
LABEL_5:
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
LABEL_25:

  return 1;
}

- (NSArray)expiredMessageIDs
{
  void *v3;
  id v4;
  void *v5;
  NSArray *v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__NMSWindowData_expiredMessageIDs__block_invoke;
  v8[3] = &unk_24CC66128;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[NMSWindowData _withDB:](self, "_withDB:", v8);
  v5 = v9;
  v6 = (NSArray *)v4;

  return v6;
}

uint64_t __34__NMSWindowData_expiredMessageIDs__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  double v4;
  int v5;
  void *v6;

  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  sqlite3_bind_double(v2, 1, v4);

  while (1)
  {
    v5 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
    if (v5 != 100)
      break;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 0));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
  if (v5 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
}

- (unint64_t)lengthOfAllMessagesInFlight
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__NMSWindowData_lengthOfAllMessagesInFlight__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[NMSWindowData _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__NMSWindowData_lengthOfAllMessagesInFlight__block_invoke(uint64_t a1)
{
  sqlite3_int64 v2;

  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88)) == 100)
  {
    v2 = sqlite3_column_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88), 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 & ~(v2 >> 63);
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
}

- (unint64_t)countOfAllMessagesInFlight
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__NMSWindowData_countOfAllMessagesInFlight__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[NMSWindowData _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__NMSWindowData_countOfAllMessagesInFlight__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96)) == 100)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 0);
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
}

- (NSDate)dateOfNextMessageExpiry
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__6;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__NMSWindowData_dateOfNextMessageExpiry__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[NMSWindowData _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

uint64_t __40__NMSWindowData_dateOfNextMessageExpiry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72)) == 100)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 0));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
}

- (id)popPendingMessage
{
  return 0;
}

- (unint64_t)countOfPendingMessages
{
  return 0;
}

- (sqlite3)dbRef
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDB, 0);
  objc_storeStrong((id *)&self->_syncQ, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithPath:logFacility:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_211704000, v0, v1, "NMSWindowData: unable to create db file via path '%@', returning nil from -init, message windowing will FAIL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSharedDBForServiceName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_211704000, v0, v1, "NMSWindowData: unable to connect to shared DB for service %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQL Error: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_openDBForceRecreate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Database '%@' failed to open after second try.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_openDBForceRecreate:.cold.2()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_211704000, v1, OS_LOG_TYPE_ERROR, "Could not open database: (%@): %{companionsync:sqlite3err}d", v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_openDBForceRecreate:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  _SYObfuscate(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_24(&dword_211704000, v5, v7, "NMSWindowData: Failed to remove un-openable DB file at '%@': %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_12();
}

- (void)_openDBForceRecreate:(void *)a3 .cold.4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_10_0(a1, a2);
  _SYObfuscate(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v3;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_24(&dword_211704000, v5, v7, "Failed to create parent folder for messaging transmission window data at '%@'. Error = %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_12();
}

- (void)_openDBForceRecreate:(void *)a3 .cold.5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_10_0(a1, a2);
  _SYObfuscate(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v3;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_24(&dword_211704000, v5, v7, "Unable to remove obstructing file at path '%@'. Error = %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_12();
}

@end
