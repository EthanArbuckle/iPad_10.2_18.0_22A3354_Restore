@implementation NMSPersistentDictionary

- (NMSPersistentDictionary)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("You must use the -initWithPath:objectClass: initializer for NMSPersistentDictionary"));

  return 0;
}

- (NMSPersistentDictionary)initWithPath:(id)a3 objectClass:(Class)a4 loggingFacility:(__CFString *)a5
{
  id v8;
  NMSPersistentDictionary *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *lock;
  uint64_t v12;
  NSString *path;
  NMSPersistentDictionary *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NMSPersistentDictionary;
  v9 = -[NMSPersistentDictionary init](&v16, sel_init);
  if (v9)
  {
    v10 = dispatch_semaphore_create(1);
    lock = v9->_lock;
    v9->_lock = (OS_dispatch_semaphore *)v10;

    v12 = objc_msgSend(v8, "copy");
    path = v9->_path;
    v9->_path = (NSString *)v12;

    v9->_objectClass = a4;
    if (a5)
      v9->_loggingFacility = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a5);
    -[NMSPersistentDictionary _openDBForceRecreate:](v9, "_openDBForceRecreate:", 0);
    v14 = v9;
  }

  return v9;
}

- (NMSPersistentDictionary)initWithSharedDBForService:(id)a3 objectClass:(Class)a4
{
  id v6;
  NMSPersistentDictionary *v7;
  uint64_t v8;
  _SYSharedServiceDB *sharedDB;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *lock;
  NMSPersistentDictionary *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NMSPersistentDictionary;
  v7 = -[NMSPersistentDictionary init](&v14, sel_init);
  if (v7)
  {
    +[_SYSharedServiceDB sharedInstanceForServiceName:](_SYSharedServiceDB, "sharedInstanceForServiceName:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    sharedDB = v7->_sharedDB;
    v7->_sharedDB = (_SYSharedServiceDB *)v8;

    if (!v7->_sharedDB)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[NMSPersistentDictionary initWithSharedDBForService:objectClass:].cold.1();
    }
    v7->_objectClass = a4;
    v10 = dispatch_semaphore_create(1);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_semaphore *)v10;

    -[NMSPersistentDictionary _ensureDBSchema](v7, "_ensureDBSchema");
    -[NMSPersistentDictionary _prepareStatements](v7, "_prepareStatements");
    v12 = v7;
  }

  return v7;
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
    v6[2] = __34__NMSPersistentDictionary_dealloc__block_invoke;
    v6[3] = &unk_24CC65320;
    v6[4] = self;
    -[NMSPersistentDictionary _withDB:](self, "_withDB:", v6);
    db = self->_db;
    if (db)
      sqlite3_close(db);
  }
  v5.receiver = self;
  v5.super_class = (Class)NMSPersistentDictionary;
  -[NMSPersistentDictionary dealloc](&v5, sel_dealloc);
}

uint64_t __34__NMSPersistentDictionary_dealloc__block_invoke(uint64_t a1)
{
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
  sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
  return sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)lock
{
  if (!self->_sharedDB)
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)unlock
{
  if (!self->_sharedDB)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
}

- (void)_withDB:(id)a3
{
  _SYSharedServiceDB *sharedDB;

  sharedDB = self->_sharedDB;
  if (sharedDB)
    -[_SYSharedServiceDB withDBRef:](sharedDB, "withDBRef:", a3);
  else
    (*((void (**)(id, sqlite3 *))a3 + 2))(a3, self->_db);
}

- (unint64_t)_checkSchemaVersion
{
  unint64_t v2;
  int v3;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (!sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", -1, &ppStmt, 0))
  {
    v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        v2 = sqlite3_column_int(ppStmt, 0);
LABEL_15:
        sqlite3_reset(ppStmt);
        sqlite3_finalize(ppStmt);
        return v2;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    v2 = 0;
    goto LABEL_15;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  return 0;
}

- (void)_openDBForceRecreate:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *p_path;
  NSString *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSString *v20;
  sqlite3 **p_db;
  int v22;
  NSObject *v23;
  unint64_t v24;
  id v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v3 = a3;
  v28[3] = *MEMORY[0x24BDAC8D0];
  p_path = (uint64_t *)&self->_path;
  v6 = self->_path;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) == 0)
  {
    -[NSString stringByDeletingLastPathComponent](v6, "stringByDeletingLastPathComponent");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDD0C78];
    v27[0] = *MEMORY[0x24BDD0CB0];
    v27[1] = v14;
    v28[0] = CFSTR("mobile");
    v28[1] = CFSTR("mobile");
    v27[2] = *MEMORY[0x24BDD0CC8];
    v28[2] = &unk_24CC83A50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v17 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, v15, &v26);
    v18 = v26;

    if ((v17 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v19 = (void *)qword_253D84AC8;
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[NMSPersistentDictionary _openDBForceRecreate:].cold.5(v19, v18);
    }

    goto LABEL_18;
  }
  if (v3)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[NMSPersistentDictionary _openDBForceRecreate:].cold.4(v9);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = objc_msgSend(v10, "removeItemAtPath:error:", v6, &v25);
    v12 = v25;

    if ((v11 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = (void *)qword_253D84AC8;
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[NMSPersistentDictionary _openDBForceRecreate:].cold.3(v13, v12);
    }
LABEL_18:

  }
  v20 = objc_retainAutorelease(v6);
  p_db = &self->_db;
  v22 = sqlite3_open_v2(-[NSString fileSystemRepresentation](v20, "fileSystemRepresentation"), &self->_db, 4194310, 0);
  if (!v22 && *p_db)
  {
    ExecuteSQL_1(*p_db, "PRAGMA journal_mode=WAL;");
    sqlite3_busy_timeout(self->_db, 60000);
    sqlite3_extended_result_codes(self->_db, 1);
    ExecuteSQL_1(self->_db, "CREATE TABLE IF NOT EXISTS meta (v INTEGER PRIMARY KEY AUTOINCREMENT, t TEXT)");
    v24 = -[NMSPersistentDictionary _checkSchemaVersion](self, "_checkSchemaVersion");
    if (v24 != 1)
    {
      if (v24)
      {
LABEL_38:
        -[NMSPersistentDictionary _prepareStatements](self, "_prepareStatements");
        goto LABEL_39;
      }
      ExecuteSQL_1(*p_db, "CREATE TABLE kvs (k0 TEXT, d0 REAL, v0 BLOB)");
      ExecuteSQL_1(*p_db, "CREATE UNIQUE INDEX k0 ON kvs (k0)");
      ExecuteSQL_1(*p_db, "CREATE INDEX d0 ON kvs (d0)");
      ExecuteSQL_1(*p_db, "INSERT INTO meta (t) VALUES (datetime('now'))");
    }
    ExecuteSQL_1(*p_db, "ALTER TABLE kvs ADD COLUMN d1 REAL DEFAULT 0");
    ExecuteSQL_1(*p_db, "CREATE INDEX d1 ON kvs (d1)");
    ExecuteSQL_1(*p_db, "INSERT INTO meta (t) VALUES (datetime('now'))");
    goto LABEL_38;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v23 = qword_253D84AC8;
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    -[NMSPersistentDictionary _openDBForceRecreate:].cold.2(p_path, v22, v23);
  if (*p_db)
  {
    sqlite3_close(*p_db);
    *p_db = 0;
  }
  if (v3)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[NMSPersistentDictionary _openDBForceRecreate:].cold.1();
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Could not open DB"));
  }
  else
  {
    -[NMSPersistentDictionary _openDBForceRecreate:](self, "_openDBForceRecreate:", 1);
  }
LABEL_39:

}

- (void)_ensureDBSchema
{
  _SYSharedServiceDB *sharedDB;
  objc_class *v3;
  id v4;

  sharedDB = self->_sharedDB;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_SYSharedServiceDB updateSchemaForClient:usingBlock:](sharedDB, "updateSchemaForClient:usingBlock:", v4, &__block_literal_global_8);

}

uint64_t __42__NMSPersistentDictionary__ensureDBSchema__block_invoke(int a1, sqlite3 *a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
  {
    result = a3;
    if (a3)
      return result;
    ExecuteSQL_1(a2, "CREATE TABLE kvs (k0 TEXT, d0 REAL, v0 BLOB)");
    ExecuteSQL_1(a2, "CREATE UNIQUE INDEX k0 ON kvs (k0)");
    ExecuteSQL_1(a2, "CREATE INDEX d0 ON kvs (d0)");
  }
  ExecuteSQL_1(a2, "ALTER TABLE kvs ADD COLUMN d1 REAL DEFAULT 0");
  ExecuteSQL_1(a2, "CREATE INDEX d1 ON kvs (d1)");
  return 2;
}

- (void)_prepareStatements
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__NMSPersistentDictionary__prepareStatements__block_invoke;
  v2[3] = &unk_24CC65320;
  v2[4] = self;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v2);
}

void __45__NMSPersistentDictionary__prepareStatements__block_invoke(uint64_t a1, sqlite3 *db)
{
  if (sqlite3_prepare_v2(db, "INSERT OR REPLACE INTO kvs (k0, d0, v0, d1) VALUES (?, ?, ?, ?)", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "UPDATE kvs SET v0 = ? WHERE k0 = ?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT v0 FROM kvs WHERE k0 = ?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM kvs WHERE k0 = ?", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM kvs", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT k0, d0, v0 FROM kvs ORDER BY d0 ASC", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  if (sqlite3_prepare_v2(db, "SELECT k0, d0, v0, d1 FROM kvs ORDER BY d1 ASC", -1, (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (id)_objectFromData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1620];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, 0);

    v7 = (void *)objc_msgSend(objc_alloc(self->_objectClass), "initWithCoder:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_dataFromObject:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1618];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeWithCoder:", v5);

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4 expires:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__NMSPersistentDictionary_setObject_forKey_expires___block_invoke;
  v16[3] = &unk_24CC66940;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  v20 = v11;
  v12 = v11;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v16);

}

void __52__NMSPersistentDictionary_setObject_forKey_expires___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  double v3;
  void *v4;
  sqlite3_stmt *v5;
  double v6;
  int v7;

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 1, *(id *)(a1 + 40));
  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(v2, 2, v3);
  objc_msgSend(*(id *)(a1 + 32), "_dataFromObject:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BindData_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64), 3, v4);
  v5 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(v5, 4, v6);
  v7 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
  if (v7 && v7 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 64));

}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__NMSPersistentDictionary_objectForKey___block_invoke;
  v8[3] = &unk_24CC66440;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v8);
  -[NMSPersistentDictionary _objectFromData:](self, "_objectFromData:", v12[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __40__NMSPersistentDictionary_objectForKey___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 1, *(id *)(a1 + 40));
  v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  if (v2 != 101)
  {
    if (v2 == 100)
    {
      ReadData_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56), 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__NMSPersistentDictionary_removeObjectForKey___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v6);

}

uint64_t __46__NMSPersistentDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 1, *(id *)(a1 + 40));
  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80)) != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)resetObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  -[NMSPersistentDictionary _dataFromObject:](self, "_dataFromObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__NMSPersistentDictionary_resetObject_forKey___block_invoke;
  v10[3] = &unk_24CC66298;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v10);

}

uint64_t __46__NMSPersistentDictionary_resetObject_forKey___block_invoke(uint64_t a1)
{
  BindData_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 1, *(id *)(a1 + 40));
  BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 2, *(id *)(a1 + 48));
  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72)) != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)removeAllObjects
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__NMSPersistentDictionary_removeAllObjects__block_invoke;
  v2[3] = &unk_24CC65320;
  v2[4] = self;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v2);
}

uint64_t __43__NMSPersistentDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88)) != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)enumerateObjectsSortedByExpirationDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__NMSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke;
  v6[3] = &unk_24CC66968;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v6);

}

uint64_t __66__NMSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  while (1)
  {
    v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
    if (v2 != 100)
      break;
    ReadString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ReadDate_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ReadData_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_objectFromData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  if (v2 && v2 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
}

- (id)objectWithOldestExpirationDate:(id *)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__NMSPersistentDictionary_objectWithOldestExpirationDate___block_invoke;
  v6[3] = &unk_24CC66990;
  v6[4] = &v13;
  v6[5] = &v7;
  -[NMSPersistentDictionary enumerateObjectsSortedByExpirationDate:](self, "enumerateObjectsSortedByExpirationDate:", v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v8[5]);
  v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __58__NMSPersistentDictionary_objectWithOldestExpirationDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v12 = v8;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;

  *a5 = 1;
}

- (void)enumerateObjectsSortedByEnqueueDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__NMSPersistentDictionary_enumerateObjectsSortedByEnqueueDate___block_invoke;
  v6[3] = &unk_24CC66968;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NMSPersistentDictionary _withDB:](self, "_withDB:", v6);

}

uint64_t __63__NMSPersistentDictionary_enumerateObjectsSortedByEnqueueDate___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  while (1)
  {
    v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
    if (v2 != 100)
      break;
    ReadString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ReadDate_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ReadData_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ReadDate_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_objectFromData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  if (v2 && v2 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDB, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithSharedDBForService:objectClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Failed to get shared DB for service %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_openDBForceRecreate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Database %@ open has failed after second try.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_openDBForceRecreate:(os_log_t)log .cold.2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Could not open database (%@): %{companionsync:sqlite3err}d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_openDBForceRecreate:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  _SYObfuscate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v3, v5, "Error removing existing DB: %{public}@", v6);

  OUTLINED_FUNCTION_4_0();
}

- (void)_openDBForceRecreate:(os_log_t)log .cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "First open attempt failed, removing & recreating DB", v1, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)_openDBForceRecreate:(void *)a1 .cold.5(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  _SYObfuscate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v3, v5, "Error creating parent directory: %{public}@", v6);

  OUTLINED_FUNCTION_4_0();
}

@end
