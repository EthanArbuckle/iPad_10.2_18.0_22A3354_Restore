@implementation SYPersistentStore

- (NSString)peerID
{
  NSString *peerID;
  _QWORD v5[5];

  peerID = self->_peerID;
  if (!peerID)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __27__SYPersistentStore_peerID__block_invoke;
    v5[3] = &unk_24CC65320;
    v5[4] = self;
    -[SYPersistentStore _withDB:](self, "_withDB:", v5);
    peerID = self->_peerID;
  }
  return peerID;
}

- (void)_withDB:(id)a3
{
  id v4;
  _SYSharedServiceDB *sharedDB;
  void *v6;
  NSObject *syncQ;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  sharedDB = self->_sharedDB;
  v9 = v4;
  if (sharedDB)
  {
    -[_SYSharedServiceDB withDBRef:](sharedDB, "withDBRef:", v4, v4);
  }
  else
  {
    v6 = (void *)os_transaction_create();
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__SYPersistentStore__withDB___block_invoke;
    block[3] = &unk_24CC65E78;
    v11 = v6;
    v12 = v9;
    block[4] = self;
    v8 = v6;
    dispatch_sync(syncQ, block);

  }
}

+ (id)sharedPersistentStoreForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (sharedPersistentStoreForService__onceToken != -1)
    dispatch_once(&sharedPersistentStoreForService__onceToken, &__block_literal_global_5);
  os_unfair_lock_lock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);
  objc_msgSend((id)sharedPersistentStoreForService____map, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[_SYSharedServiceDB sharedInstanceForServiceName:](_SYSharedServiceDB, "sharedInstanceForServiceName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSharedDatabase:", v6);
    objc_msgSend((id)sharedPersistentStoreForService____map, "setObject:forKey:", v5, v4);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);

  return v5;
}

void __53__SYPersistentStore_sharedPersistentStoreForService___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 2);
  v1 = (void *)sharedPersistentStoreForService____map;
  sharedPersistentStoreForService____map = v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SYDeviceTargetedNewDeviceNotification"), 0, 0, &__block_literal_global_4);

}

void __53__SYPersistentStore_sharedPersistentStoreForService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);
  v2 = (void *)MEMORY[0x212BE0D64]();
  objc_msgSend((id)sharedPersistentStoreForService____map, "removeAllObjects");
  objc_autoreleasePoolPop(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedPersistentStoreForService____mapLock);

}

- (SYPersistentStore)init
{

  return 0;
}

- (SYPersistentStore)initWithSharedDatabase:(id)a3
{
  id v5;
  SYPersistentStore *v6;
  SYPersistentStore *v7;
  uint64_t v8;
  NSMutableDictionary *peerSeqnoSets;
  SYPersistentStore *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYPersistentStore;
  v6 = -[SYPersistentStore init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_changeTrackingEnabled = 1;
    objc_storeStrong((id *)&v6->_sharedDB, a3);
    -[SYPersistentStore setUnfinishedSyncTimeout:](v7, "setUnfinishedSyncTimeout:", 30.0);
    v8 = objc_opt_new();
    peerSeqnoSets = v7->_peerSeqnoSets;
    v7->_peerSeqnoSets = (NSMutableDictionary *)v8;

    -[SYPersistentStore _setupSharedDB](v7, "_setupSharedDB");
    -[SYPersistentStore _prepareStatements](v7, "_prepareStatements");
    v10 = v7;
  }

  return v7;
}

- (SYPersistentStore)initWithPath:(id)a3 loggingFacility:(__CFString *)a4 changeTrackingEnabled:(BOOL)a5
{
  id v8;
  SYPersistentStore *v9;
  SYPersistentStore *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *syncQ;
  void *v14;
  _BOOL4 v15;
  SYPersistentStore *v16;
  uint64_t v17;
  NSMutableDictionary *peerSeqnoSets;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SYPersistentStore;
  v9 = -[SYPersistentStore init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_changeTrackingEnabled = a5;
    if (a4)
      v9->_loggingFacility = (__CFString *)CFRetain(a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("SYPersistentStore.SynqQ", v11);
    syncQ = v10->_syncQ;
    v10->_syncQ = (OS_dispatch_queue *)v12;

    objc_msgSend(v8, "stringByStandardizingPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SYPersistentStore _openDBAtPath:](v10, "_openDBAtPath:", v14);

    v16 = 0;
    if (v15)
    {
      -[SYPersistentStore setUnfinishedSyncTimeout:](v10, "setUnfinishedSyncTimeout:", 30.0);
      v17 = objc_opt_new();
      peerSeqnoSets = v10->_peerSeqnoSets;
      v10->_peerSeqnoSets = (NSMutableDictionary *)v17;

      v16 = v10;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
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
    v6[2] = __28__SYPersistentStore_dealloc__block_invoke;
    v6[3] = &unk_24CC65320;
    v6[4] = self;
    -[SYPersistentStore _withDB:](self, "_withDB:", v6);
    db = self->_db;
    if (db)
      sqlite3_close(db);
  }
  v5.receiver = self;
  v5.super_class = (Class)SYPersistentStore;
  -[SYPersistentStore dealloc](&v5, sel_dealloc);
}

sqlite3_stmt *__28__SYPersistentStore_dealloc__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  sqlite3_stmt *v11;
  sqlite3_stmt *v12;
  sqlite3_stmt *v13;
  sqlite3_stmt *v14;
  sqlite3_stmt *v15;
  sqlite3_stmt *v16;
  sqlite3_stmt *v17;
  sqlite3_stmt *v18;
  sqlite3_stmt *v19;
  sqlite3_stmt *v20;
  sqlite3_stmt *v21;
  sqlite3_stmt *v22;
  sqlite3_stmt *v23;
  sqlite3_stmt *v24;
  sqlite3_stmt *v25;
  sqlite3_stmt *v26;
  sqlite3_stmt *v27;
  sqlite3_stmt *v28;
  sqlite3_stmt *v29;
  sqlite3_stmt *v30;
  sqlite3_stmt *v31;
  sqlite3_stmt *result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (sqlite3_stmt *)v2[11];
  if (v3)
  {
    sqlite3_finalize(v3);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v4 = (sqlite3_stmt *)v2[12];
  if (v4)
  {
    sqlite3_finalize(v4);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v5 = (sqlite3_stmt *)v2[13];
  if (v5)
  {
    sqlite3_finalize(v5);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v6 = (sqlite3_stmt *)v2[14];
  if (v6)
  {
    sqlite3_finalize(v6);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v7 = (sqlite3_stmt *)v2[15];
  if (v7)
  {
    sqlite3_finalize(v7);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v8 = (sqlite3_stmt *)v2[16];
  if (v8)
  {
    sqlite3_finalize(v8);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v9 = (sqlite3_stmt *)v2[17];
  if (v9)
  {
    sqlite3_finalize(v9);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v10 = (sqlite3_stmt *)v2[18];
  if (v10)
  {
    sqlite3_finalize(v10);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v11 = (sqlite3_stmt *)v2[19];
  if (v11)
  {
    sqlite3_finalize(v11);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v12 = (sqlite3_stmt *)v2[20];
  if (v12)
  {
    sqlite3_finalize(v12);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v13 = (sqlite3_stmt *)v2[21];
  if (v13)
  {
    sqlite3_finalize(v13);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v14 = (sqlite3_stmt *)v2[22];
  if (v14)
  {
    sqlite3_finalize(v14);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v15 = (sqlite3_stmt *)v2[23];
  if (v15)
  {
    sqlite3_finalize(v15);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v16 = (sqlite3_stmt *)v2[24];
  if (v16)
  {
    sqlite3_finalize(v16);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v17 = (sqlite3_stmt *)v2[25];
  if (v17)
  {
    sqlite3_finalize(v17);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v18 = (sqlite3_stmt *)v2[26];
  if (v18)
  {
    sqlite3_finalize(v18);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v19 = (sqlite3_stmt *)v2[27];
  if (v19)
  {
    sqlite3_finalize(v19);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v20 = (sqlite3_stmt *)v2[28];
  if (v20)
  {
    sqlite3_finalize(v20);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v21 = (sqlite3_stmt *)v2[29];
  if (v21)
  {
    sqlite3_finalize(v21);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v22 = (sqlite3_stmt *)v2[30];
  if (v22)
  {
    sqlite3_finalize(v22);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v23 = (sqlite3_stmt *)v2[31];
  if (v23)
  {
    sqlite3_finalize(v23);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v24 = (sqlite3_stmt *)v2[32];
  if (v24)
  {
    sqlite3_finalize(v24);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v25 = (sqlite3_stmt *)v2[33];
  if (v25)
  {
    sqlite3_finalize(v25);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v26 = (sqlite3_stmt *)v2[34];
  if (v26)
  {
    sqlite3_finalize(v26);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v27 = (sqlite3_stmt *)v2[35];
  if (v27)
  {
    sqlite3_finalize(v27);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v28 = (sqlite3_stmt *)v2[36];
  if (v28)
  {
    sqlite3_finalize(v28);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v29 = (sqlite3_stmt *)v2[38];
  if (v29)
  {
    sqlite3_finalize(v29);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v30 = (sqlite3_stmt *)v2[37];
  if (v30)
  {
    sqlite3_finalize(v30);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v31 = (sqlite3_stmt *)v2[40];
  if (v31)
  {
    sqlite3_finalize(v31);
    v2 = *(_QWORD **)(a1 + 32);
  }
  result = (sqlite3_stmt *)v2[39];
  if (result)
    return (sqlite3_stmt *)sqlite3_finalize(result);
  return result;
}

- (sqlite3)_dbRef
{
  return self->_db;
}

+ (BOOL)_tableEmpty:(id)a3 db:(sqlite3 *)a4
{
  id v5;
  id v6;
  const char *v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  sqlite3_stmt *ppStmt;

  v5 = a3;
  ppStmt = 0;
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v5));
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  v8 = strlen(v7);
  v9 = sqlite3_prepare_v2(a4, v7, v8, &ppStmt, 0);
  if (v9)
  {
    v10 = v9;
    if (v9 != 1)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        +[SYPersistentStore _tableEmpty:db:].cold.1((uint64_t)v5);
      v10 = 1;
    }
  }
  else
  {
    v11 = sqlite3_step(ppStmt);
    v10 = 1;
    if (v11 && v11 != 101)
    {
      if (v11 == 100)
      {
        v10 = sqlite3_column_int(ppStmt, 0) == 0;
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          +[SYPersistentStore _tableEmpty:db:].cold.1((uint64_t)v5);
        v10 = 1;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v10;
}

+ (id)_loadOrCreatePeerIDForDB:(sqlite3 *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *ppStmt;

  if (objc_msgSend(a1, "_tableEmpty:db:", CFSTR("syncstate"), a3))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    objc_msgSend(v6, "UTF8String");
    ExecuteSQL_0(a3, "INSERT INTO syncstate (remoteversion, tstamp, peer_id) VALUES (0, datetime('now'), '%s')");
  }
  else
  {
    ppStmt = 0;
    sqlite3_prepare_v2(a3, "SELECT peer_id FROM syncstate LIMIT 1", 37, &ppStmt, 0);
    sqlite3_step(ppStmt);
    ReadString(ppStmt);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
    if (!objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_retainAutorelease(v8);
      objc_msgSend(v6, "UTF8String");
      ExecuteSQL_0(a3, "UPDATE syncstate SET peer_id='%s'");
    }
  }
  return v6;
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
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[SYPersistentStore _getSchemaVersion].cold.1();
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
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          -[SYPersistentStore _getSchemaVersion].cold.1();
        v3 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  return v3;
}

- (BOOL)_openDBAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  sqlite3 **p_db;
  BOOL v13;
  NSString *v14;
  NSString *path;
  int v16;
  unsigned int v17;
  unsigned int v18;
  sqlite3 *v19;
  int v20;
  NSString *v21;
  NSString *peerID;
  sqlite3_stmt *pStmt;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = *MEMORY[0x24BDD0C78];
    v25[0] = *MEMORY[0x24BDD0CB0];
    v25[1] = v8;
    v26[0] = CFSTR("mobile");
    v26[1] = CFSTR("mobile");
    v25[2] = *MEMORY[0x24BDD0CC8];
    v26[2] = &unk_24CC83A38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, v9, 0);

  }
  v11 = objc_retainAutorelease(v4);
  p_db = &self->_db;
  if (sqlite3_open_v2((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &self->_db, 4194310, 0) || !*p_db)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[SYPersistentStore _openDBAtPath:].cold.1((uint64_t)v11);
    if (*p_db)
    {
      sqlite3_close(*p_db);
      v13 = 0;
      *p_db = 0;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v14 = (NSString *)objc_msgSend(v11, "copy");
    path = self->_path;
    self->_path = v14;

    ExecuteSQL_0(self->_db, "PRAGMA journal_mode=WAL;");
    sqlite3_busy_timeout(self->_db, 60000);
    sqlite3_extended_result_codes(self->_db, 1);
    sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
    v16 = -[SYPersistentStore _getSchemaVersion](self, "_getSchemaVersion");
    v17 = v16 - 1;
    v18 = v16;
    switch(v16)
    {
      case 0:
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp REAL)");
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS syncstate (remoteversion INTEGER, tstamp INTEGER, fullsync_sent INTEGER DEFAULT 0, in_full_sync INTEGER DEFAULT 0, ttl INTEGER DEFAULT 1209600)");
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS changes (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp INTEGER, type INTEGER, syncid TEXT, object BLOB)");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_13;
      case 1:
LABEL_13:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN vector_clock TEXT DEFAULT ''");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN peer_id TEXT DEFAULT ''");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_14;
      case 2:
LABEL_14:
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_15;
      case 3:
LABEL_15:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN msg_seqno INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_16;
      case 4:
LABEL_16:
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS peer_info (peerID TEXT, last_seqno INTEGER, tstamp REAL)");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_17;
      case 5:
LABEL_17:
        ExecuteSQL_0(*p_db, "CREATE TABLE IF NOT EXISTS full_sync_info (syncID TEXT, active INTEGER DEFAULT 1, time_started REAL, time_ended REAL, duration REAL)");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN waiting_for_sync_id TEXT");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN sync_user_info BLOB");
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN sync_ids_options BLOB");
        ExecuteSQL_0(*p_db, "CREATE INDEX sync_by_uuid ON full_sync_info (syncID ASC, active)");
        ExecuteSQL_0(*p_db, "CREATE INDEX sync_by_start_time ON full_sync_info (time_started ASC, time_ended, syncID)");
        ExecuteSQL_0(*p_db, "CREATE INDEX sync_by_duration ON full_sync_info (duration ASC, syncID, time_started, time_ended)");
        ExecuteSQL_0(*p_db, "CREATE INDEX changes_by_time ON changes (tstamp ASC, version)");
        ExecuteSQL_0(*p_db, "CREATE INDEX changes_by_syncid ON changes (syncid ASC, tstamp ASC, version)");
        ExecuteSQL_0(*p_db, "CREATE TRIGGER remove_prior_changes BEFORE INSERT ON changes BEGIN DELETE FROM changes WHERE syncid = new.syncid; END");
        ExecuteSQL_0(*p_db, "CREATE TRIGGER remove_old_syncs BEFORE INSERT ON full_sync_info BEGIN DELETE FROM full_sync_info WHERE syncID NOT IN (SELECT syncID FROM full_sync_info ORDER BY syncID DESC LIMIT 1) AND active=0; END");
        ExecuteSQL_0(*p_db, "CREATE TRIGGER compute_duration AFTER UPDATE OF time_ended ON full_sync_info BEGIN UPDATE full_sync_info SET duration = new.time_ended - old.time_started WHERE syncID = old.syncID; END");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_18;
      case 6:
LABEL_18:
        ExecuteSQL_0(*p_db, "ALTER TABLE full_sync_info ADD COLUMN send_complete INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "ALTER TABLE full_sync_info ADD COLUMN failed INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "ALTER TABLE full_sync_info ADD COLUMN error BLOB");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_19;
      case 7:
LABEL_19:
        ExecuteSQL_0(*p_db, "ALTER TABLE peer_info ADD COLUMN seqno_set TEXT DEFAULT NIL");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_20;
      case 8:
LABEL_20:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN overflow_timeout REAL DEFAULT NIL");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_21;
      case 9:
LABEL_21:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN last_message_time REAL DEFAULT NIL");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_22;
      case 10:
LABEL_22:
        ExecuteSQL_0(*p_db, "ALTER TABLE syncstate ADD COLUMN in_delta_sync INTEGER DEFAULT 0");
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        if (!v18)
          goto LABEL_41;
        v19 = *p_db;
        if (v18 <= 3)
          goto LABEL_40;
LABEL_27:
        pStmt = 0;
        if (sqlite3_prepare_v2(v19, "SELECT COUNT(*) FROM peer_info WHERE last_seqno IS NOT NULL AND last_seqno > 0", -1, &pStmt, 0))
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
            __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
        }
        else if (sqlite3_step(pStmt) == 100)
        {
          v20 = sqlite3_column_int(pStmt, 0);
          sqlite3_reset(pStmt);
          sqlite3_finalize(pStmt);
          if (v20 <= 0)
            goto LABEL_41;
        }
        else
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
            __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
          sqlite3_reset(pStmt);
          sqlite3_finalize(pStmt);
        }
LABEL_40:
        ExecuteSQL_0(v19, "UPDATE syncstate SET fullsync_sent=1");
LABEL_41:
        ExecuteSQL_0(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
LABEL_42:
        +[SYPersistentStore _loadOrCreatePeerIDForDB:](SYPersistentStore, "_loadOrCreatePeerIDForDB:", self->_db);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        peerID = self->_peerID;
        self->_peerID = v21;

        if (v17 <= 1)
          -[SYPersistentStore _convertTimestamps](self, "_convertTimestamps");
        -[SYPersistentStore _fixPeerInfo](self, "_fixPeerInfo");
        -[SYPersistentStore _prepareStatements](self, "_prepareStatements");
        v13 = 1;
        break;
      case 11:
        v19 = *p_db;
        goto LABEL_27;
      default:
        goto LABEL_42;
    }
  }

  return v13;
}

void __27__SYPersistentStore_peerID__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[SYPersistentStore _loadOrCreatePeerIDForDB:](SYPersistentStore, "_loadOrCreatePeerIDForDB:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v3;

}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (void)_setupSharedDB
{
  _SYSharedServiceDB *sharedDB;
  objc_class *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  sharedDB = self->_sharedDB;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__SYPersistentStore__setupSharedDB__block_invoke;
  v6[3] = &unk_24CC661C0;
  objc_copyWeak(&v7, &location);
  -[_SYSharedServiceDB updateSchemaForClient:usingBlock:](sharedDB, "updateSchemaForClient:usingBlock:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __35__SYPersistentStore__setupSharedDB__block_invoke(uint64_t a1, sqlite3 *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id *WeakRetained;
  id *v8;

  if (a3 != 1)
  {
    v5 = a3;
    if (a3)
      goto LABEL_5;
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS syncstate (remoteversion INTEGER, tstamp INTEGER, fullsync_sent INTEGER DEFAULT 0, in_full_sync INTEGER DEFAULT 0, ttl INTEGER DEFAULT 86400, vector_clock TEXT DEFAULT '', peer_id TEXT DEFAULT '', msg_seqno INTEGER DEFAULT 0, waiting_for_sync_id TEXT, sync_user_info BLOB, sync_ids_options BLOB, overflow_timeout REAL DEFAULT NIL, last_message_time REAL DEFAULT NIL, in_delta_sync INTEGER DEFAULT 0)");
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS changes (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp INTEGER, type INTEGER, syncid TEXT, object BLOB)");
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS peer_info (peerID TEXT, last_seqno INTEGER, tstamp REAL, seqno_set TEXT DEFAULT NIL)");
    ExecuteSQL_0(a2, "CREATE TABLE IF NOT EXISTS full_sync_info (syncID TEXT, active INTEGER DEFAULT 1, time_started REAL, time_ended REAL, duration REAL, send_complete INTEGER DEFAULT 0, failed INTEGER DEFAULT 0, error BLOB)");
    ExecuteSQL_0(a2, "CREATE INDEX sync_by_uuid ON full_sync_info (syncID ASC, active)");
    ExecuteSQL_0(a2, "CREATE INDEX sync_by_start_time ON full_sync_info (time_started ASC, time_ended, syncID)");
    ExecuteSQL_0(a2, "CREATE INDEX sync_by_duration ON full_sync_info (duration ASC, syncID, time_started, time_ended)");
    ExecuteSQL_0(a2, "CREATE INDEX changes_by_time ON changes (tstamp ASC, version)");
    ExecuteSQL_0(a2, "CREATE INDEX changes_by_syncid ON changes (syncid ASC, tstamp ASC, version)");
    ExecuteSQL_0(a2, "CREATE TRIGGER remove_prior_changes BEFORE INSERT ON changes BEGIN DELETE FROM changes WHERE syncid = new.syncid; END");
    ExecuteSQL_0(a2, "CREATE TRIGGER remove_old_syncs BEFORE INSERT ON full_sync_info BEGIN DELETE FROM full_sync_info WHERE syncID NOT IN (SELECT syncID FROM full_sync_info ORDER BY syncID DESC LIMIT 1) AND active=0; END");
    ExecuteSQL_0(a2, "CREATE TRIGGER compute_duration AFTER UPDATE OF time_ended ON full_sync_info BEGIN UPDATE full_sync_info SET duration = new.time_ended - old.time_started WHERE syncID = old.syncID; END");
  }
  ExecuteSQL_0(a2, "ALTER TABLE syncstate ADD COLUMN ignored_message_id_set TEXT DEFAULT ''");
  v5 = 2;
LABEL_5:
  +[SYPersistentStore _loadOrCreatePeerIDForDB:](SYPersistentStore, "_loadOrCreatePeerIDForDB:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 6, v6);

  return v5;
}

- (void)_convertTimestamps
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Failed to update timestamp format: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

uint64_t __29__SYPersistentStore__withDB___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (BOOL)_inTransaction:(BOOL)a3 do:(id)a4
{
  _BOOL4 v4;
  id v6;
  _SYSharedServiceDB *sharedDB;
  BOOL v8;
  void *v9;
  NSObject *syncQ;
  id v11;
  BOOL v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v6 = a4;
  sharedDB = self->_sharedDB;
  if (sharedDB)
  {
    if (v4)
      v8 = -[_SYSharedServiceDB inExclusiveTransaction:](sharedDB, "inExclusiveTransaction:", v6);
    else
      v8 = -[_SYSharedServiceDB inTransaction:](sharedDB, "inTransaction:", v6);
    v12 = v8;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v9 = (void *)os_transaction_create();
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SYPersistentStore__inTransaction_do___block_invoke;
    block[3] = &unk_24CC661E8;
    v18 = v4;
    block[4] = self;
    v17 = &v19;
    v15 = v9;
    v16 = v6;
    v11 = v9;
    dispatch_sync(syncQ, block);
    v12 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v12;
}

void __39__SYPersistentStore__inTransaction_do___block_invoke(uint64_t a1)
{
  int v2;
  sqlite3 *v3;
  int v4;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
    v4 = ExecuteSQL_0(v3, "BEGIN TRANSACTION");
  else
    v4 = ExecuteSQL_0(v3, "BEGIN EXCLUSIVE TRANSACTION");
  if (v4)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __39__SYPersistentStore__inTransaction_do___block_invoke_cold_3();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      && ExecuteSQL_0(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 80), "COMMIT TRANSACTION"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __39__SYPersistentStore__inTransaction_do___block_invoke_cold_2();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      && ExecuteSQL_0(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 80), "ROLLBACK TRANSACTION"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __39__SYPersistentStore__inTransaction_do___block_invoke_cold_1();
    }
  }
}

- (void)_fixPeerInfo
{
  if (!-[SYPersistentStore _inTransaction:do:](self, "_inTransaction:do:", 0, &__block_literal_global_71))
    -[SYPersistentStore _withDB:](self, "_withDB:", &__block_literal_global_76);
}

uint64_t __33__SYPersistentStore__fixPeerInfo__block_invoke(int a1, sqlite3 *db)
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  sqlite3_stmt *ppStmt;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  ppStmt = 0;
  if (!sqlite3_prepare_v2(db, "SELECT DISTINCT peerID FROM peer_info", -1, &ppStmt, 0))
  {
    v4 = (void *)objc_opt_new();
    v5 = sqlite3_step(ppStmt);
    if (v5 == 100)
    {
      do
      {
        ReadString(ppStmt);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v4, "addObject:", v6);

        v7 = sqlite3_step(ppStmt);
      }
      while (v7 == 100);
      v5 = v7;
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
    if (!v5 || v5 == 101)
    {
      if (objc_msgSend(v4, "count"))
      {
        if (sqlite3_prepare_v2(db, "DELETE FROM peer_info WHERE peerID=? AND last_seqno < (SELECT max(last_seqno) FROM peer_info WHERE peerID=?)", -1, &ppStmt, 0))
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (!os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          goto LABEL_23;
        }
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = v4;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
LABEL_27:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
            BindString_0(ppStmt, 1, v13);
            BindString_0(ppStmt, 2, v13);
            v14 = sqlite3_step(ppStmt);
            sqlite3_reset(ppStmt);
            sqlite3_clear_bindings(ppStmt);
            if (v14 != 101 && v14 != 0)
              break;
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
              if (v10)
                goto LABEL_27;
              break;
            }
          }

          sqlite3_finalize(ppStmt);
          v3 = 1;
          if (!v14 || v14 == 101)
            goto LABEL_45;
          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
            __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
          goto LABEL_24;
        }

        sqlite3_finalize(ppStmt);
      }
      v3 = 1;
      goto LABEL_45;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (!os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
LABEL_23:
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
LABEL_24:
    v3 = 0;
LABEL_45:

    return v3;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  return 0;
}

uint64_t __33__SYPersistentStore__fixPeerInfo__block_invoke_75(int a1, sqlite3 *a2)
{
  return ExecuteSQL_0(a2, "DELETE FROM peer_info");
}

- (id)_encodeIndexSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SYPersistentStore__encodeIndexSet___block_invoke;
  v8[3] = &unk_24CC66270;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateRangesUsingBlock:", v8);

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __37__SYPersistentStore__encodeIndexSet___block_invoke(uint64_t a1, NSRange range)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  NSStringFromRange(range);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_decodeIndexSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  NSRange v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "length"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(NSString **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (-[NSString length](v10, "length"))
          {
            v11 = NSRangeFromString(v10);
            objc_msgSend(v4, "addIndexesInRange:", v11.location, v11.length);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (id)_sequenceNumberSetForPeerID:(id)a3 inDB:(sqlite3 *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_peerSeqnoSets, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    ppStmt = 0;
    if (sqlite3_prepare_v2(a4, "SELECT seqno_set FROM peer_info WHERE peerID=?", -1, &ppStmt, 0))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    else
    {
      BindString_0(ppStmt, 1, v6);
      if (sqlite3_step(ppStmt) == 100)
      {
        ReadString(ppStmt);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYPersistentStore _decodeIndexSet:](self, "_decodeIndexSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addIndexes:", v11);

      }
      sqlite3_finalize(ppStmt);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerSeqnoSets, "setObject:forKeyedSubscript:", v9, v6);
    }
    v8 = v9;
  }
  v12 = v8;

  return v12;
}

- (BOOL)_LOCKED_storeSequenceNumberSet:(id)a3 forPeerID:(id)a4 db:(sqlite3 *)a5 error:(id *)a6
{
  id v10;
  id v11;
  sqlite3_stmt **p_setPeerSeqNoSet;
  __CFString *v13;
  BOOL v14;
  int v15;
  BOOL v16;
  int v19;

  v10 = a3;
  v11 = a4;
  p_setPeerSeqNoSet = &self->_setPeerSeqNoSet;
  if (!self->_setPeerSeqNoSet
    && sqlite3_prepare_v2(a5, "UPDATE peer_info SET seqno_set=? WHERE peerID=?", -1, &self->_setPeerSeqNoSet, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    v14 = 0;
    goto LABEL_25;
  }
  if (v10)
  {
    -[SYPersistentStore _encodeIndexSet:](self, "_encodeIndexSet:", v10);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_24CC69060;
  }
  BindString_0(*p_setPeerSeqNoSet, 1, v13);
  BindString_0(*p_setPeerSeqNoSet, 2, v11);
  v15 = sqlite3_step(*p_setPeerSeqNoSet);
  if (v15)
    v16 = (v15 & 0xFFFFFFFE) == 100;
  else
    v16 = 1;
  v14 = v16;
  if ((v15 - 100) >= 2 && v15 != 0)
  {
    v19 = v15;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      if (!a6)
        goto LABEL_22;
      goto LABEL_30;
    }
    if (a6)
    {
LABEL_30:
      NSErrorFromSQLiteError(v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_22:
  sqlite3_reset(*p_setPeerSeqNoSet);
  sqlite3_clear_bindings(*p_setPeerSeqNoSet);
  if (!v10)
    -[NSMutableDictionary removeObjectForKey:](self->_peerSeqnoSets, "removeObjectForKey:", v11);

LABEL_25:
  return v14;
}

- (void)_storeSequenceNumberSet:(id)a3 forPeerID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__SYPersistentStore__storeSequenceNumberSet_forPeerID___block_invoke;
  v10[3] = &unk_24CC66298;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SYPersistentStore _withDB:](self, "_withDB:", v10);

}

uint64_t __55__SYPersistentStore__storeSequenceNumberSet_forPeerID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_LOCKED_storeSequenceNumberSet:forPeerID:db:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, 0);
}

- (void)_cacheTTL
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__SYPersistentStore__cacheTTL__block_invoke;
  v2[3] = &unk_24CC65320;
  v2[4] = self;
  -[SYPersistentStore _withDB:](self, "_withDB:", v2);
}

uint64_t __30__SYPersistentStore__cacheTTL__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  sqlite3_prepare_v2(db, "SELECT MAX(ttl) FROM syncstate", 30, &ppStmt, 0);
  if (sqlite3_step(ppStmt) == 100)
    *(double *)(*(_QWORD *)(a1 + 32) + 24) = (double)sqlite3_column_int(ppStmt, 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v3 + 24) == 0.0)
    *(_QWORD *)(v3 + 24) = 0x4132750000000000;
  return sqlite3_finalize(ppStmt);
}

- (void)resetSequenceNumber:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__SYPersistentStore_resetSequenceNumber___block_invoke;
  v3[3] = &__block_descriptor_40_e18_v16__0__sqlite3__8l;
  v3[4] = a3;
  -[SYPersistentStore _withDB:](self, "_withDB:", v3);
}

void __41__SYPersistentStore_resetSequenceNumber___block_invoke(uint64_t a1, sqlite3 *a2)
{
  if (ExecuteSQL_0(a2, "UPDATE syncstate SET msg_seqno=%llu", *(_QWORD *)(a1 + 32)))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (unint64_t)nextSequenceNumber
{
  NSObject *v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__SYPersistentStore_nextSequenceNumber__block_invoke;
  v6[3] = &unk_24CC65370;
  v6[4] = &v7;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AC8;
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_INFO))
  {
    v3 = v8[3];
    *(_DWORD *)buf = 134217984;
    v12 = v3;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Returning next sequence number: %llu", buf, 0xCu);
  }
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__SYPersistentStore_nextSequenceNumber__block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t result;
  sqlite3_stmt *ppStmt;

  result = ExecuteSQL_0(a2, "UPDATE syncstate SET msg_seqno=(msg_seqno+1)");
  if (!(_DWORD)result)
  {
    ppStmt = 0;
    result = sqlite3_prepare_v2(a2, "SELECT msg_seqno FROM syncstate LIMIT 1", -1, &ppStmt, 0);
    if (!(_DWORD)result)
    {
      if ((sqlite3_step(ppStmt) & 0xFFFFFFFE) == 0x64)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __39__SYPersistentStore_nextSequenceNumber__block_invoke_cold_1();
      }
      return sqlite3_finalize(ppStmt);
    }
  }
  return result;
}

- (BOOL)setLastSequenceNumber:(unint64_t)a3 fromPeer:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  if (a3)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v24 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke;
    v14[3] = &unk_24CC662E0;
    v14[4] = self;
    v15 = v8;
    v16 = &v19;
    v17 = &v25;
    v18 = a3;
    -[SYPersistentStore _withDB:](self, "_withDB:", v14);
    if (a5)
    {
      v10 = (void *)v20[5];
      if (v10)
        *a5 = objc_retainAutorelease(v10);
    }
    LOBYTE(a5) = *((_BYTE *)v26 + 24) != 0;

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[SYPersistentStore setLastSequenceNumber:fromPeer:error:].cold.1();
    if (a5)
    {
      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      v29 = *MEMORY[0x24BDD0FC8];
      v30[0] = CFSTR("Cannot store sequence number == 0; that value is invalid");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v12);

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke(uint64_t a1, sqlite3 *db)
{
  sqlite3_stmt **v4;
  void *v5;
  sqlite3_stmt *v6;
  CFAbsoluteTime Current;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  sqlite3_stmt *v22;
  CFAbsoluteTime v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id obj;
  void *v31;
  sqlite3_stmt *ppStmt;

  v4 = *(sqlite3_stmt ***)(a1 + 32);
  if (v4[23])
  {
LABEL_2:
    objc_msgSend(v4, "_sequenceNumberSetForPeerID:inDB:", *(_QWORD *)(a1 + 40), db);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIndex:", *(_QWORD *)(a1 + 64));
    if (objc_msgSend(*(id *)(a1 + 32), "_lastSequenceNumberForPeerID_LOCKED:db:", *(_QWORD *)(a1 + 40), db))
    {
      sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 184), 1, *(_QWORD *)(a1 + 64));
      v6 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 184);
      Current = CFAbsoluteTimeGetCurrent();
      sqlite3_bind_double(v6, 2, Current + *MEMORY[0x24BDBD238]);
      BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 184), 3, *(id *)(a1 + 40));
      v8 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 184));
      if (v8)
      {
        v9 = v8;
        if (v8 != 101)
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
            __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_3();
          NSErrorFromSQLiteError(v9);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        }
      }
      sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 184));
      sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 184));
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      obj = 0;
      v15 = objc_msgSend(v13, "_LOCKED_storeSequenceNumberSet:forPeerID:db:error:", v5, v14, db, &obj);
      v16 = obj;
    }
    else
    {
      ppStmt = 0;
      v17 = sqlite3_prepare_v2(db, "INSERT INTO peer_info (peerID, last_seqno, tstamp) VALUES (?, ?, ?)", -1, &ppStmt, 0);
      if (v17)
      {
        v18 = v17;
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_2();
        NSErrorFromSQLiteError(v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_23;
      }
      BindString_0(ppStmt, 1, *(id *)(a1 + 40));
      sqlite3_bind_int64(ppStmt, 2, *(_QWORD *)(a1 + 64));
      v22 = ppStmt;
      v23 = CFAbsoluteTimeGetCurrent();
      sqlite3_bind_double(v22, 3, v23 + *MEMORY[0x24BDBD238]);
      v24 = sqlite3_step(ppStmt);
      sqlite3_finalize(ppStmt);
      if (v24 && v24 != 101)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_1();
        NSErrorFromSQLiteError(v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
      v28 = *(void **)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 40);
      v31 = 0;
      v15 = objc_msgSend(v28, "_LOCKED_storeSequenceNumberSet:forPeerID:db:error:", v5, v29, db, &v31);
      v16 = v31;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v16);
LABEL_23:

    return;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE peer_info SET last_seqno=?, tstamp=? WHERE peerID=?", -1, v4 + 23, 0))
  {
    v4 = *(sqlite3_stmt ***)(a1 + 32);
    goto LABEL_2;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)setLastSequenceNumber:(unint64_t)a3 fromPeer:(id)a4
{
  -[SYPersistentStore setLastSequenceNumber:fromPeer:error:](self, "setLastSequenceNumber:fromPeer:error:", a3, a4, 0);
}

- (unint64_t)_lastSequenceNumberForPeerID_LOCKED:(id)a3 db:(sqlite3 *)a4
{
  id v6;
  sqlite3_stmt *v7;
  sqlite3_stmt **p_getPeerSeqNo;
  sqlite3_stmt *getPeerSeqNo;
  int v10;
  sqlite3_int64 v11;
  NSObject *v12;
  uint8_t v14[16];

  v6 = a3;
  if (self->_db)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQ);
  getPeerSeqNo = self->_getPeerSeqNo;
  p_getPeerSeqNo = &self->_getPeerSeqNo;
  v7 = getPeerSeqNo;
  if (getPeerSeqNo)
  {
LABEL_4:
    BindString_0(v7, 1, v6);
    v10 = sqlite3_step(*p_getPeerSeqNo);
    if (v10 == 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v12 = qword_253D84AC8;
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "No peer seqno recorded, returning special value zero", v14, 2u);
      }
    }
    else
    {
      if (v10 == 100)
      {
        v11 = sqlite3_column_int64(*p_getPeerSeqNo, 0);
LABEL_22:
        sqlite3_reset(*p_getPeerSeqNo);
        goto LABEL_23;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[SYPersistentStore _lastSequenceNumberForPeerID_LOCKED:db:].cold.1();
    }
    v11 = 0;
    goto LABEL_22;
  }
  if (!sqlite3_prepare_v2(a4, "SELECT last_seqno FROM peer_info WHERE peerID=?", -1, p_getPeerSeqNo, 0))
  {
    v7 = *p_getPeerSeqNo;
    goto LABEL_4;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  v11 = 0;
LABEL_23:

  return v11;
}

- (unint64_t)lastSequenceNumberForPeerID:(id)a3
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
  v8[2] = __49__SYPersistentStore_lastSequenceNumberForPeerID___block_invoke;
  v8[3] = &unk_24CC66308;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __49__SYPersistentStore_lastSequenceNumberForPeerID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lastSequenceNumberForPeerID_LOCKED:db:", *(_QWORD *)(a1 + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)sequenceNumberIsDuplicate:(unint64_t)a3 forPeer:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__SYPersistentStore_sequenceNumberIsDuplicate_forPeer___block_invoke;
  v9[3] = &unk_24CC66330;
  v9[4] = self;
  v7 = v6;
  v11 = &v13;
  v12 = a3;
  v10 = v7;
  -[SYPersistentStore _withDB:](self, "_withDB:", v9);
  LOBYTE(a3) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a3;
}

void __55__SYPersistentStore_sequenceNumberIsDuplicate_forPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sequenceNumberSetForPeerID:inDB:", *(_QWORD *)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsIndex:", *(_QWORD *)(a1 + 56)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

- (void)resetSequenceNumbersForPeer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SYPersistentStore_resetSequenceNumbersForPeer___block_invoke;
  v6[3] = &unk_24CC65320;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

uint64_t __49__SYPersistentStore_resetSequenceNumbersForPeer___block_invoke(uint64_t a1, sqlite3 *a2)
{
  return ExecuteSQL_0(a2, "DELETE FROM peer_info WHERE peerID='%s'", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
}

- (BOOL)isPerformingDeltaSync
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SYPersistentStore_isPerformingDeltaSync__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__SYPersistentStore_isPerformingDeltaSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  int v3;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT in_delta_sync FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int(ppStmt, 0) != 0;
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setPerformingDeltaSync:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SYPersistentStore_setPerformingDeltaSync___block_invoke;
  v3[3] = &__block_descriptor_33_e18_v16__0__sqlite3__8l;
  v4 = a3;
  -[SYPersistentStore _withDB:](self, "_withDB:", v3);
}

void __44__SYPersistentStore_setPerformingDeltaSync___block_invoke(uint64_t a1, sqlite3 *a2)
{
  int v2;

  v2 = ExecuteSQL_0(a2, "UPDATE syncstate SET in_delta_sync=%d", *(unsigned __int8 *)(a1 + 32));
  if (v2 && v2 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)_loadIgnoreList_LOCKED:(sqlite3 *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *ignoringMessageIDs;
  sqlite3_stmt *ppStmt;

  v5 = (void *)MEMORY[0x212BE0D64](self, a2);
  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, "SELECT ignored_message_id_set FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    v6 = sqlite3_step(ppStmt);
    if (v6 != 101)
    {
      if (v6 == 100)
      {
        ReadString(ppStmt);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v8);
        ignoringMessageIDs = self->_ignoringMessageIDs;
        self->_ignoringMessageIDs = v9;

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)_saveIgnoreList_LOCKED:(sqlite3 *)a3
{
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  int v9;

  v5 = (void *)MEMORY[0x212BE0D64](self, a2);
  if (-[NSMutableSet count](self->_ignoringMessageIDs, "count"))
  {
    -[NSMutableSet allObjects](self->_ignoringMessageIDs, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));

    v8 = 0;
  }
  else
  {
    v8 = &stru_24CC69060;
  }
  v9 = ExecuteSQL_0(a3, "UPDATE syncstate SET ignored_message_id_set=%s", (const char *)-[__CFString UTF8String](v8, "UTF8String"));
  if (v9 && v9 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  objc_autoreleasePoolPop(v5);
}

- (void)addMessageIDsToIgnore:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SYPersistentStore_addMessageIDsToIgnore___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

uint64_t __43__SYPersistentStore_addMessageIDsToIgnore___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[8];
  if (!v5)
  {
    objc_msgSend(v4, "_loadIgnoreList_LOCKED:", a2);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "unionSet:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  if (v6 != result)
    return objc_msgSend(*(id *)(a1 + 32), "_saveIgnoreList_LOCKED:", a2);
  return result;
}

- (BOOL)shouldIgnoreMessageID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SYPersistentStore_shouldIgnoreMessageID___block_invoke;
  v7[3] = &unk_24CC66378;
  v7[4] = self;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__SYPersistentStore_shouldIgnoreMessageID___block_invoke(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t result;

  v3 = (_QWORD *)a1[4];
  v4 = (void *)v3[8];
  if (!v4)
  {
    objc_msgSend(v3, "_loadIgnoreList_LOCKED:", a2);
    v4 = *(void **)(a1[4] + 64);
  }
  result = objc_msgSend(v4, "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)removeMessageIDFromIgnoreList:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__SYPersistentStore_removeMessageIDFromIgnoreList___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

uint64_t __51__SYPersistentStore_removeMessageIDFromIgnoreList___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[8];
  if (!v5)
  {
    objc_msgSend(v4, "_loadIgnoreList_LOCKED:", a2);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  if (v6 != result)
    return objc_msgSend(*(id *)(a1 + 32), "_saveIgnoreList_LOCKED:", a2);
  return result;
}

- (NSString)path
{
  return self->_path;
}

- (double)timeToLive
{
  return self->_timeToLiveCache;
}

- (void)setTimeToLive:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__SYPersistentStore_setTimeToLive___block_invoke;
  v3[3] = &unk_24CC663A0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[SYPersistentStore _withDB:](self, "_withDB:", v3);
}

void __35__SYPersistentStore_setTimeToLive___block_invoke(uint64_t a1, sqlite3 *a2)
{
  _QWORD *v2;

  v2 = (_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
  if (ExecuteSQL_0(a2, "UPDATE syncstate SET ttl=%d", (int)*(double *)(a1 + 40)))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __35__SYPersistentStore_setTimeToLive___block_invoke_cold_1(v2);
  }
}

- (unint64_t)changeCount
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
  v4[2] = __32__SYPersistentStore_changeCount__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__SYPersistentStore_changeCount__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 96);
  v5 = (sqlite3_stmt **)(v3 + 96);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM changes", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (NSString)vectorClockJSON
{
  __CFString *v2;
  __CFString *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SYPersistentStore_vectorClockJSON__block_invoke;
  v5[3] = &unk_24CC65370;
  v5[4] = &v6;
  -[SYPersistentStore _withDB:](self, "_withDB:", v5);
  v2 = (__CFString *)v7[5];
  if (!v2)
    v2 = CFSTR("{}");
  v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__SYPersistentStore_vectorClockJSON__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT vector_clock FROM syncstate LIMIT 1", 42, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
    {
      ReadString(ppStmt);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
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
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setVectorClockJSON:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SYPersistentStore_setVectorClockJSON___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __40__SYPersistentStore_setVectorClockJSON___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 176);
  v5 = (sqlite3_stmt **)(v3 + 176);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET vector_clock=?", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 176);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 176)) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 176));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 176));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (NSDate)overflowResyncTime
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SYPersistentStore_overflowResyncTime__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __39__SYPersistentStore_overflowResyncTime__block_invoke(uint64_t a1, sqlite3 *db)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT overflow_timeout FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        ReadDate(ppStmt);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setOverflowResyncTime:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SYPersistentStore_setOverflowResyncTime___block_invoke;
  v6[3] = &unk_24CC65320;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __43__SYPersistentStore_setOverflowResyncTime___block_invoke(uint64_t a1, sqlite3 *db)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "UPDATE syncstate SET overflow_timeout=?", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    BindDate(ppStmt, *(void **)(a1 + 32));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (NSDate)lastMessageReceived
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SYPersistentStore_lastMessageReceived__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __40__SYPersistentStore_lastMessageReceived__block_invoke(uint64_t a1, sqlite3 *db)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "SELECT last_message_time FROM syncstate LIMIT 1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        ReadDate(ppStmt);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (void)setLastMessageReceived:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SYPersistentStore_setLastMessageReceived___block_invoke;
  v6[3] = &unk_24CC65320;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __44__SYPersistentStore_setLastMessageReceived___block_invoke(uint64_t a1, sqlite3 *db)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "UPDATE syncstate SET last_message_time=?", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  else
  {
    BindDate(ppStmt, *(void **)(a1 + 32));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (BOOL)canStartNewSyncSession
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SYPersistentStore_canStartNewSyncSession__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __43__SYPersistentStore_canStartNewSyncSession__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  void *v7;
  double v8;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 240);
  v5 = (sqlite3_stmt **)(v3 + 240);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT time_started FROM full_sync_info WHERE time_ended IS NULL ORDER BY time_started DESC LIMIT 1", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 240);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      ReadDate(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 240));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceNow");
      if (v8 <= -30.0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 240));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)enterFullSyncWithID:(id)a3 ignoring:(BOOL)a4
{
  id v6;
  OS_os_transaction *v7;
  OS_os_transaction *transaction;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a3;
  if (!self->_transaction)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AD0, OS_LOG_TYPE_DEBUG))
      -[SYPersistentStore enterFullSyncWithID:ignoring:].cold.1();
    v7 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v7;

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SYPersistentStore_enterFullSyncWithID_ignoring___block_invoke;
  v10[3] = &unk_24CC663C8;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[SYPersistentStore _withDB:](self, "_withDB:", v10);

}

void __50__SYPersistentStore_enterFullSyncWithID_ignoring___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 208);
  v5 = (sqlite3_stmt **)(v3 + 208);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "INSERT INTO full_sync_info (syncID, active, time_started) VALUES (?, ?, (julianday('now') - 2440587.5)*86400.0)", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 208);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 208), 2, *(_BYTE *)(a1 + 48) == 0);
    if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 208)) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 208));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 208));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)exitFullSyncWithID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  OS_os_transaction *transaction;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__SYPersistentStore_exitFullSyncWithID_error___block_invoke;
  v13[3] = &unk_24CC663F0;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v11 = v6;
  v16 = v11;
  -[SYPersistentStore _withDB:](self, "_withDB:", v13);
  if (self->_transaction)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AD0, OS_LOG_TYPE_DEBUG))
      -[SYPersistentStore exitFullSyncWithID:error:].cold.2();
    transaction = self->_transaction;
    self->_transaction = 0;

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AD0, OS_LOG_TYPE_ERROR))
      -[SYPersistentStore exitFullSyncWithID:error:].cold.1();
  }

}

void __46__SYPersistentStore_exitFullSyncWithID_error___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 216);
  v5 = (sqlite3_stmt **)(v3 + 216);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "UPDATE full_sync_info SET active=0, failed=?, error=?, time_ended=(julianday('now')-2440587.5)*86400.0 WHERE syncID=?", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 216);
LABEL_2:
    sqlite3_bind_int(v4, 1, *(_QWORD *)(a1 + 40) != 0);
    BindData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 216), 2, *(void **)(a1 + 48));
    BindString_0(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 216), 3, *(id *)(a1 + 56));
    if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 216)) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 216));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 216));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (BOOL)reassignCurrentSyncID:(id)a3
{
  id v4;
  NSObject *v5;
  OS_os_transaction *v6;
  OS_os_transaction *transaction;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  if (!self->_transaction)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v5 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Reassigning sync id, starting XPC transaction to stop us being Jetsammed until it's done.", buf, 2u);
    }
    v6 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v6;

  }
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__SYPersistentStore_reassignCurrentSyncID___block_invoke;
  v10[3] = &unk_24CC66418;
  v12 = buf;
  v8 = v4;
  v11 = v8;
  -[SYPersistentStore _withDB:](self, "_withDB:", v10);

  _Block_object_dispose(buf, 8);
  return 1;
}

void __43__SYPersistentStore_reassignCurrentSyncID___block_invoke(uint64_t a1, sqlite3 *db)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(db, "UPDATE full_sync_info SET syncID=? WHERE active=1", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    BindString_0(ppStmt, 1, *(id *)(a1 + 32));
    if (sqlite3_step(ppStmt) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (BOOL)ignoringFullSyncWithID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SYPersistentStore_ignoringFullSyncWithID___block_invoke;
  v7[3] = &unk_24CC66440;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SYPersistentStore _withDB:](self, "_withDB:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__SYPersistentStore_ignoringFullSyncWithID___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 224);
  v5 = (sqlite3_stmt **)(v3 + 224);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM full_sync_info WHERE active=0 AND time_ended IS NULL AND syncID=?", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 224);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 224)) - 102) > 0xFFFFFFFD)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 224), 0) != 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 224));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 224));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)sendCompletedForSyncWithID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SYPersistentStore_sendCompletedForSyncWithID___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __48__SYPersistentStore_sendCompletedForSyncWithID___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 272);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "UPDATE full_sync_info SET send_complete=1 WHERE syncID=?", -1, (sqlite3_stmt **)(v3 + 272), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 272);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 272)) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 272));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 272));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (BOOL)currentSyncSendComplete
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SYPersistentStore_currentSyncSendComplete__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __44__SYPersistentStore_currentSyncSendComplete__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 280);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM full_sync_info WHERE time_ended IS NULL AND send_complete=1 LIMIT 1", -1, (sqlite3_stmt **)(v3 + 280), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 280);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 280), 0) != 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 280));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (BOOL)lastSyncFailed
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SYPersistentStore_lastSyncFailed__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__SYPersistentStore_lastSyncFailed__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  int v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 288);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT error FROM full_sync_info WHERE time_ended IS NOT NULL ORDER BY time_started DESC LIMIT 1", -1, (sqlite3_stmt **)(v3 + 288), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 288);
LABEL_2:
    v5 = sqlite3_step(v4);
    if ((v5 - 102) > 0xFFFFFFFD)
    {
      if (v5 != 101)
      {
        ReadData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 288));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6 != 0;

      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 288));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (NSError)lastSyncError
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
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SYPersistentStore_lastSyncError__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

uint64_t __34__SYPersistentStore_lastSyncError__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 288)) == 100)
  {
    ReadData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 288));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "sy_unarchivedObjectFromData:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 288));
}

- (void)_verifyInTransactionForFullSync
{
  NSObject *v3;
  OS_os_transaction *v4;
  OS_os_transaction *transaction;
  uint8_t v6[16];

  if (!self->_transaction)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Current sync ID is non-nil but we're not in a transaction. Must be left-over from a dead process? Either way, I'm entering a new transaction now. Yes, it's hacky. Hackiness is inversely proportional to the amount of coffee ingested.", v6, 2u);
    }
    v4 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v4;

  }
}

- (NSString)currentFullSyncID
{
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SYPersistentStore_currentFullSyncID__block_invoke;
  v5[3] = &unk_24CC66150;
  v5[4] = self;
  v5[5] = &v6;
  -[SYPersistentStore _withDB:](self, "_withDB:", v5);
  if (objc_msgSend((id)v7[5], "length"))
    -[SYPersistentStore _verifyInTransactionForFullSync](self, "_verifyInTransactionForFullSync");
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__SYPersistentStore_currentFullSyncID__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 232);
  v5 = (sqlite3_stmt **)(v3 + 232);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT syncID FROM full_sync_info WHERE time_ended IS NULL ORDER BY time_started DESC LIMIT 1", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 232);
LABEL_2:
    v7 = sqlite3_step(v4);
    if (v7 != 101)
    {
      if (v7 == 100)
      {
        ReadString(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 232));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 232));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (BOOL)inFullSync
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SYPersistentStore_inFullSync__block_invoke;
  v5[3] = &unk_24CC66150;
  v5[4] = self;
  v5[5] = &v6;
  -[SYPersistentStore _withDB:](self, "_withDB:", v5);
  if (*((_BYTE *)v7 + 24))
  {
    -[SYPersistentStore _verifyInTransactionForFullSync](self, "_verifyInTransactionForFullSync");
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__SYPersistentStore_inFullSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 88);
  v5 = (sqlite3_stmt **)(v3 + 88);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM full_sync_info WHERE time_ended IS NULL", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88), 0) != 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __31__SYPersistentStore_inFullSync__block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (NSString)lastSyncEndID
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
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SYPersistentStore_lastSyncEndID__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __34__SYPersistentStore_lastSyncEndID__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 248);
  v5 = (sqlite3_stmt **)(v3 + 248);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT syncID FROM full_sync_info WHERE time_ended IS NOT NULL ORDER BY time_ended DESC LIMIT 1", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 248);
LABEL_2:
    v7 = sqlite3_step(v4);
    if (v7 != 101)
    {
      if (v7 == 100)
      {
        ReadString(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 248));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 248));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (NSString)waitingForSyncEndID
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
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SYPersistentStore_waitingForSyncEndID__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__SYPersistentStore_waitingForSyncEndID__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 256);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT waiting_for_sync_id FROM syncstate LIMIT 1", -1, (sqlite3_stmt **)(v3 + 256), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 256);
LABEL_2:
    v5 = sqlite3_step(v4);
    if (v5 != 101)
    {
      if (v5 == 100)
      {
        ReadString(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 256));
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 256));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)setWaitingForSyncEndID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SYPersistentStore_setWaitingForSyncEndID___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __44__SYPersistentStore_setWaitingForSyncEndID___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 264);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET waiting_for_sync_id=?", -1, (sqlite3_stmt **)(v3 + 264), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 264);
LABEL_2:
    BindString_0(v4, 1, *(id *)(a1 + 40));
    if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 264)) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 264));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 264));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (NSDictionary)fullSyncUserInfo
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
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__SYPersistentStore_fullSyncUserInfo__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __37__SYPersistentStore_fullSyncUserInfo__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 304);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT sync_user_info FROM syncstate LIMIT 1", -1, (sqlite3_stmt **)(v3 + 304), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 304);
LABEL_2:
    if (sqlite3_step(v4) == 100)
    {
      ReadData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 304));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        _DictionaryFromData(v5);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 304));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)setFullSyncUserInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SYPersistentStore_setFullSyncUserInfo___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __41__SYPersistentStore_setFullSyncUserInfo___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 296)
    || !sqlite3_prepare_v2(db, "UPDATE syncstate SET sync_user_info=?", -1, (sqlite3_stmt **)(v3 + 296), 0))
  {
    _DataFromDictionary(*(void **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BindData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 296), 1, v4);
    if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 296)) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 296));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 296));

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (NSDictionary)fullSyncIDSOptions
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
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SYPersistentStore_fullSyncIDSOptions__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __39__SYPersistentStore_fullSyncIDSOptions__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(v3 + 320);
  if (v4)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT sync_ids_options FROM syncstate LIMIT 1", -1, (sqlite3_stmt **)(v3 + 320), 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 320);
LABEL_2:
    if (sqlite3_step(v4) == 100)
    {
      ReadData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 320));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        _DictionaryFromData(v5);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 320));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)setFullSyncIDSOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SYPersistentStore_setFullSyncIDSOptions___block_invoke;
  v6[3] = &unk_24CC66128;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SYPersistentStore _withDB:](self, "_withDB:", v6);

}

void __43__SYPersistentStore_setFullSyncIDSOptions___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 312)
    || !sqlite3_prepare_v2(db, "UPDATE syncstate SET sync_ids_options=?", -1, (sqlite3_stmt **)(v3 + 312), 0))
  {
    _DataFromDictionary(*(void **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BindData(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 312), 1, v4);
    if (sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 312)) != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 312));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 312));

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (BOOL)completedSync
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SYPersistentStore_completedSync__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__SYPersistentStore_completedSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 128);
  v5 = (sqlite3_stmt **)(v3 + 128);
  v4 = v6;
  if (v6)
  {
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 128), 0) != 0;
      sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 128));
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    return;
  }
  if (!sqlite3_prepare_v2(db, "SELECT MAX(fullsync_sent) FROM syncstate", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 128);
    goto LABEL_2;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)setCompletedSync:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__SYPersistentStore_setCompletedSync___block_invoke;
  v3[3] = &unk_24CC66468;
  v3[4] = self;
  v4 = a3;
  -[SYPersistentStore _withDB:](self, "_withDB:", v3);
}

void __38__SYPersistentStore_setCompletedSync___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 136);
  v5 = (sqlite3_stmt **)(v3 + 136);
  v4 = v6;
  if (v6)
  {
LABEL_2:
    sqlite3_bind_int(v4, 1, *(unsigned __int8 *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 136)) - 102) > 0xFFFFFFFD)
    {
      sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 136));
      sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 136));
      return;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    return;
  }
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET fullsync_sent=?", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 136);
    goto LABEL_2;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
LABEL_12:
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (double)durationOfLastFullSync
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SYPersistentStore_durationOfLastFullSync__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

sqlite3_stmt *__43__SYPersistentStore_durationOfLastFullSync__block_invoke(uint64_t a1, sqlite3 *db)
{
  sqlite3_stmt *result;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (!sqlite3_prepare_v2(db, "SELECT duration FROM full_sync_info ORDER BY time_ended DESC LIMIT 1", -1, &ppStmt, 0))
  {
    if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_double(ppStmt, 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    result = ppStmt;
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  result = ppStmt;
  if (ppStmt)
    return (sqlite3_stmt *)sqlite3_finalize(result);
  return result;
}

- (unint64_t)currentLocalVersion
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
  v4[2] = __40__SYPersistentStore_currentLocalVersion__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__SYPersistentStore_currentLocalVersion__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 160);
  v5 = (sqlite3_stmt **)(v3 + 160);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT seq FROM sqlite_sequence WHERE name='changes'", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 160);
LABEL_2:
    if ((sqlite3_step(v4) - 102) > 0xFFFFFFFD)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 160), 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 160));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (unint64_t)lastSeenRemoteVersion
{
  unint64_t v2;
  _QWORD v4[5];
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
  v4[2] = __42__SYPersistentStore_lastSeenRemoteVersion__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

sqlite3_stmt *__42__SYPersistentStore_lastSeenRemoteVersion__block_invoke(uint64_t a1, sqlite3 *db)
{
  sqlite3_stmt *result;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (!sqlite3_prepare_v2(db, "SELECT MAX(remoteversion) FROM syncstate", 40, &ppStmt, 0))
  {
    if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    result = ppStmt;
    return (sqlite3_stmt *)sqlite3_finalize(result);
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  result = ppStmt;
  if (ppStmt)
    return (sqlite3_stmt *)sqlite3_finalize(result);
  return result;
}

- (BOOL)logChanges:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[5];
  id v11;
  id *v12;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__SYPersistentStore_logChanges_error___block_invoke;
  v10[3] = &unk_24CC66490;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  v8 = -[SYPersistentStore _inTransaction:do:](self, "_inTransaction:do:", 1, v10);
  -[SYPersistentStore setCachedChangedSyncIDsVersion:](self, "setCachedChangedSyncIDsVersion:", 0);

  return v8;
}

uint64_t __38__SYPersistentStore_logChanges_error___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v4;
  sqlite3_stmt **v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  sqlite3_stmt *v14;
  CFAbsoluteTime Current;
  sqlite3_stmt *v16;
  void *v17;
  int v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 120);
  v5 = (sqlite3_stmt **)(v4 + 120);
  if (v6 || !sqlite3_prepare_v2(db, "INSERT INTO changes (tstamp, type, syncid) VALUES (?, ?, ?)", -1, v5, 0))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      v11 = *MEMORY[0x24BDBD238];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v14 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120);
          Current = CFAbsoluteTimeGetCurrent();
          sqlite3_bind_double(v14, 1, Current + v11);
          sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120), 2, objc_msgSend(v13, "type", (_QWORD)v26));
          v16 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120);
          objc_msgSend(v13, "objectId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          BindString_0(v16, 3, v17);

          v18 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120));
          sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120));
          sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 120));
          if ((v18 & 0xFFFFFFFE) != 0x64)
          {
            v20 = sqlite3_errmsg(db);
            if (*(_QWORD *)(a1 + 48))
            {
              v21 = (void *)MEMORY[0x24BDD1540];
              v22 = v18;
              v30 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v23;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("SYPersistentStoreErrorDomain"), v22, v24);
              **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

            }
            v19 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v13, "setVersion:", sqlite3_last_insert_rowid(db));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v9)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_14:

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    return 0;
  }
  return v19;
}

- (BOOL)logSyncCompletionToRemoteVersion:(unint64_t)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__SYPersistentStore_logSyncCompletionToRemoteVersion___block_invoke;
  v5[3] = &unk_24CC664B8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[SYPersistentStore _withDB:](self, "_withDB:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__SYPersistentStore_logSyncCompletionToRemoteVersion___block_invoke(_QWORD *a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = a1[4];
  v6 = *(sqlite3_stmt **)(v3 + 144);
  v5 = (sqlite3_stmt **)(v3 + 144);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "UPDATE syncstate SET tstamp=(julianday('now')-2440587.5)*86400.0, remoteversion=?", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(a1[4] + 144);
LABEL_2:
    sqlite3_bind_int64(v4, 1, a1[6]);
    if ((sqlite3_step(*(sqlite3_stmt **)(a1[4] + 144)) - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    }
    sqlite3_reset(*(sqlite3_stmt **)(a1[4] + 144));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1[4] + 144));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (unint64_t)_oldestVersion
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
  v4[2] = __35__SYPersistentStore__oldestVersion__block_invoke;
  v4[3] = &unk_24CC66150;
  v4[4] = self;
  v4[5] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__SYPersistentStore__oldestVersion__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *(sqlite3_stmt **)(v3 + 168);
  v5 = (sqlite3_stmt **)(v3 + 168);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT MIN(version) FROM changes", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 168);
LABEL_2:
    sqlite3_step(v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 168), 0);
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 168));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (BOOL)objectChanged:(id)a3 sinceVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL8 v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  unint64_t v19;

  v6 = a3;
  if (-[SYPersistentStore cachedChangedSyncIDsVersion](self, "cachedChangedSyncIDsVersion") != a4
    || (-[SYPersistentStore cachedChangedSyncIDs](self, "cachedChangedSyncIDs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v8 = -[SYPersistentStore currentLocalVersion](self, "currentLocalVersion");
    v9 = -[SYPersistentStore _oldestVersion](self, "_oldestVersion");
    v11 = v8 < a4 && v9 > a4 + 1;
    -[SYPersistentStore setCachedVersionStale:](self, "setCachedVersionStale:", v11);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    if (!-[SYPersistentStore cachedVersionStale](self, "cachedVersionStale"))
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __48__SYPersistentStore_objectChanged_sinceVersion___block_invoke;
      v17[3] = &unk_24CC664E0;
      v17[4] = self;
      v19 = a4;
      v18 = v12;
      -[SYPersistentStore _withDB:](self, "_withDB:", v17);

    }
    -[SYPersistentStore setCachedChangedSyncIDs:](self, "setCachedChangedSyncIDs:", v12);
    -[SYPersistentStore setCachedChangedSyncIDsVersion:](self, "setCachedChangedSyncIDsVersion:", a4);

  }
  if (-[SYPersistentStore cachedVersionStale](self, "cachedVersionStale"))
  {
    v13 = 1;
  }
  else
  {
    -[SYPersistentStore cachedChangedSyncIDs](self, "cachedChangedSyncIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "containsObject:", v15);

  }
  return v13;
}

void __48__SYPersistentStore_objectChanged_sinceVersion___block_invoke(_QWORD *a1, sqlite3 *db)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  void *v7;
  void *v8;

  v3 = a1[4];
  v6 = *(sqlite3_stmt **)(v3 + 152);
  v5 = (sqlite3_stmt **)(v3 + 152);
  v4 = v6;
  if (v6)
    goto LABEL_2;
  if (!sqlite3_prepare_v2(db, "SELECT DISTINCT syncid FROM changes WHERE version > ?", -1, v5, 0))
  {
    v4 = *(sqlite3_stmt **)(a1[4] + 152);
LABEL_2:
    sqlite3_bind_int64(v4, 1, a1[6]);
    while (sqlite3_step(*(sqlite3_stmt **)(a1[4] + 152)) == 100)
    {
      v7 = (void *)a1[5];
      ReadString(*(sqlite3_stmt **)(a1[4] + 152));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
    sqlite3_reset(*(sqlite3_stmt **)(a1[4] + 152));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1[4] + 152));
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
}

- (void)clearAllChanges
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__SYPersistentStore_clearAllChanges__block_invoke;
  v2[3] = &unk_24CC65320;
  v2[4] = self;
  -[SYPersistentStore _withDB:](self, "_withDB:", v2);
}

void __36__SYPersistentStore_clearAllChanges__block_invoke(uint64_t a1, sqlite3 *a2)
{
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "setCachedChangedSyncIDs:", 0);
  v3 = ExecuteSQL_0(a2, "DELETE FROM changes");
  if (v3 && v3 != 101)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
}

- (void)changeTrackingToggled:(BOOL)a3
{
  if (self->_changeTrackingEnabled != a3)
  {
    self->_changeTrackingEnabled = a3;
    if (!a3)
      -[SYPersistentStore _withDB:](self, "_withDB:", &__block_literal_global_142);
  }
}

uint64_t __43__SYPersistentStore_changeTrackingToggled___block_invoke(int a1, sqlite3 *a2)
{
  return ExecuteSQL_0(a2, "DELETE FROM changes");
}

- (double)unfinishedSyncTimeout
{
  return self->_unfinishedSyncTimeout;
}

- (void)setUnfinishedSyncTimeout:(double)a3
{
  self->_unfinishedSyncTimeout = a3;
}

- (NSSet)cachedChangedSyncIDs
{
  return self->_cachedChangedSyncIDs;
}

- (void)setCachedChangedSyncIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedChangedSyncIDs, a3);
}

- (unint64_t)cachedChangedSyncIDsVersion
{
  return self->_cachedChangedSyncIDsVersion;
}

- (void)setCachedChangedSyncIDsVersion:(unint64_t)a3
{
  self->_cachedChangedSyncIDsVersion = a3;
}

- (BOOL)cachedVersionStale
{
  return self->_cachedVersionStale;
}

- (void)setCachedVersionStale:(BOOL)a3
{
  self->_cachedVersionStale = a3;
}

- (_SYSharedServiceDB)sharedDB
{
  return self->_sharedDB;
}

- (void)setSharedDB:(id)a3
{
  objc_storeStrong((id *)&self->_sharedDB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDB, 0);
  objc_storeStrong((id *)&self->_cachedChangedSyncIDs, 0);
  objc_storeStrong((id *)&self->_syncQ, 0);
  objc_storeStrong((id *)&self->_ignoringMessageIDs, 0);
  objc_storeStrong((id *)&self->_peerSeqnoSets, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)lastDBErrorInfo
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SYPersistentStore_UnitTestHelper__lastDBErrorInfo__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[SYPersistentStore _withDB:](self, "_withDB:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __52__SYPersistentStore_UnitTestHelper__lastDBErrorInfo__block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = sqlite3_errcode(db);
  v5 = sqlite3_errmsg(db);
  if (v5)
  {
    if ((_DWORD)v4)
    {
      v6 = v5;
      v12[0] = CFSTR("code");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = CFSTR("message");
      v13[0] = v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

- (id)dbPath
{
  id v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (self->_sharedDB)
  {
    -[_SYSharedServiceDB _dbPath](self->_sharedDB, "_dbPath");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__7;
    v9 = __Block_byref_object_dispose__7;
    v10 = 0;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __43__SYPersistentStore_UnitTestHelper__dbPath__block_invoke;
    v4[3] = &unk_24CC65370;
    v4[4] = &v5;
    -[SYPersistentStore _withDB:](self, "_withDB:", v4);
    v3 = (id)v6[5];
    _Block_object_dispose(&v5, 8);

    return v3;
  }
}

void __43__SYPersistentStore_UnitTestHelper__dbPath__block_invoke(uint64_t a1, sqlite3 *db)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sqlite3_db_filename(db, "main");
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

+ (void)_tableEmpty:(uint64_t)a1 db:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0(&dword_211704000, v1, v2, "Error checking for empty table %{public}@: %{companionsync:sqlite3err}d", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "Error fetching schema version: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_openDBAtPath:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0(&dword_211704000, v1, v2, "Error opening SQLite3 DB at (%@): %{companionsync:sqlite3err}d", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __39__SYPersistentStore__inTransaction_do___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Failed to rollback %s transaction: %{companionsync:sqlite3err}d");
  OUTLINED_FUNCTION_2();
}

void __39__SYPersistentStore__inTransaction_do___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Failed to commit %s transaction: %{companionsync:sqlite3err}d");
  OUTLINED_FUNCTION_2();
}

void __39__SYPersistentStore__inTransaction_do___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Failed to begin %s transaction: %{companionsync:sqlite3err}d");
  OUTLINED_FUNCTION_2();
}

void __39__SYPersistentStore_nextSequenceNumber__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQLite error fetching incremented sequence number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)setLastSequenceNumber:fromPeer:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "SYPersistentStore asked to store a seqno == 0, which is INVALID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQLite error inserting new Peer Sequence Number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQLite error creating peer_info insert statement: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __58__SYPersistentStore_setLastSequenceNumber_fromPeer_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQLite error updating peer message sequence number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_lastSequenceNumberForPeerID_LOCKED:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQLite error fetching peer message sequence number: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __35__SYPersistentStore_setTimeToLive___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0(&dword_211704000, v1, v2, "SQLite error while storing new TTL value %f: %{companionsync:sqlite3err}d", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)enterFullSyncWithID:ignoring:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Beginning XPC transaction for full-sync, to stop us being Jetsammed until it's done.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)exitFullSyncWithID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Did not end full-sync xpc transaction as it was never opened.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)exitFullSyncWithID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Ending XPC transaction for full-sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __31__SYPersistentStore_inFullSync__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_211704000, v0, v1, "SQLite error: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
