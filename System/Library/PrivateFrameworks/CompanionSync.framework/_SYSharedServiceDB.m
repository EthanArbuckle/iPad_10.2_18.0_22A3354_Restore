@implementation _SYSharedServiceDB

- (BOOL)_LOCKED_ensureDBExists
{
  BOOL v2;
  NSString *name;
  uint64_t *p_name;
  id v6;
  NSMutableDictionary *schemaSetupCallbacks;
  NSObject *v8;
  _QWORD v10[5];
  id v11;

  if (self->_db)
    return 1;
  p_name = (uint64_t *)&self->_name;
  name = self->_name;
  v11 = 0;
  v2 = -[_SYSharedServiceDB _LOCKED_createOrOpenDBForServiceName:error:](self, "_LOCKED_createOrOpenDBForServiceName:error:", name, &v11);
  v6 = v11;
  if (v2)
  {
    schemaSetupCallbacks = self->_schemaSetupCallbacks;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44___SYSharedServiceDB__LOCKED_ensureDBExists__block_invoke;
    v10[3] = &unk_24CC65348;
    v10[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](schemaSetupCallbacks, "enumerateKeysAndObjectsUsingBlock:", v10);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[_SYSharedServiceDB _LOCKED_ensureDBExists].cold.1(p_name, (uint64_t)v6, v8);
  }

  return v2;
}

- (void)_LOCKED_ensureDBExists
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Failed to open shared DB for service %{public}@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (BOOL)_LOCKED_createOrOpenDBForServiceName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  sqlite3 **p_db;
  int v11;
  NSObject *v12;
  BOOL v13;

  v6 = a3;
  SYServiceDataPath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("db"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[_SYSharedServiceDB _ensureParentExists:error:](self, "_ensureParentExists:error:", v9, a4))
    goto LABEL_11;
  p_db = &self->_db;
  v11 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), &self->_db, 4194310, 0);
  if (!v11 && *p_db)
  {
    sqlite3_exec(*p_db, "PRAGMA journal_mode=WAL;", 0, 0, 0);
    sqlite3_busy_timeout(self->_db, 10000);
    v13 = 1;
    sqlite3_extended_result_codes(self->_db, 1);
    sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
    sqlite3_wal_hook(self->_db, (int (__cdecl *)(void *, sqlite3 *, const char *, int))_SYAutoTruncateHook, 0);
    -[_SYSharedServiceDB _LOCKED_ensureSchemaVersionsTableInDB:](self, "_LOCKED_ensureSchemaVersionsTableInDB:", self->_db);
    goto LABEL_12;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = qword_253D84AC8;
  if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    -[_SYSharedServiceDB _LOCKED_createOrOpenDBForServiceName:error:].cold.1(v11, v12);
  if (*p_db)
  {
    sqlite3_close(*p_db);
    *p_db = 0;
  }
  if (a4)
  {
    NSErrorFromSQLiteError(v11);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v13 = 0;
  }
LABEL_12:

  return v13;
}

- (BOOL)_ensureParentExists:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BDD0C78];
  v21[0] = *MEMORY[0x24BDD0CB0];
  v21[1] = v7;
  v22[0] = CFSTR("mobile");
  v22[1] = CFSTR("mobile");
  v21[2] = *MEMORY[0x24BDD0CC8];
  v22[2] = &unk_24CC839D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = *MEMORY[0x24BDD0B88];
  while (1)
  {

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, v8, &v20);
    v9 = v20;

    if ((v13 & 1) != 0)
    {
LABEL_5:
      if (!v9)
        goto LABEL_9;
LABEL_6:
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      goto LABEL_14;
    }
    objc_msgSend(v9, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqualToString:", v10))
      break;
    v15 = objc_msgSend(v9, "code");

    if (v15 != 516)
      goto LABEL_5;
  }

  if (v9)
    goto LABEL_6;
LABEL_9:
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_SYSharedServiceDB _addSkipBackupAttributeToItemAtPath:error:](self, "_addSkipBackupAttributeToItemAtPath:error:", v16, a4);

  if (!v17)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v18 = (void *)qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[_SYSharedServiceDB _ensureParentExists:error:].cold.1(a4, v18);
  }
LABEL_14:

  return v9 == 0;
}

- (void)withDBRef:(id)a3
{
  void *v4;
  void (**v5)(id, sqlite3 *);

  v5 = (void (**)(id, sqlite3 *))a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)os_transaction_create();
  if (-[_SYSharedServiceDB _LOCKED_ensureDBExists](self, "_LOCKED_ensureDBExists"))
    v5[2](v5, self->_db);
  os_unfair_lock_unlock(&self->_lock);

}

+ (void)initialize
{
  id v2;
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SYDeviceTargetedNewDeviceNotification"), 0, 0, &__block_literal_global_0);

  }
}

+ (void)pairingStorePathWasReset
{
  void *v2;
  id v3;

  GetServiceInstanceTable();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
  v2 = (void *)MEMORY[0x212BE0D64]();
  objc_msgSend(v3, "removeAllObjects");
  objc_autoreleasePoolPop(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);

}

+ (id)sharedInstanceForServiceName:(id)a3
{
  id v3;
  void *v4;
  _SYWeakServiceDBRef *v5;
  void *v6;

  v3 = a3;
  GetServiceInstanceTable();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (_SYWeakServiceDBRef *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[_SYWeakServiceDBRef initWithServiceName:]([_SYWeakServiceDBRef alloc], "initWithServiceName:", v3);
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
  -[_SYWeakServiceDBRef db](v5, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_SYSharedServiceDB)initWithServiceName:(id)a3
{
  id v5;
  _SYSharedServiceDB *v6;
  _SYSharedServiceDB *v7;
  uint64_t v8;
  NSMutableDictionary *schemaSetupCallbacks;
  _SYSharedServiceDB *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SYSharedServiceDB;
  v6 = -[_SYSharedServiceDB init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = objc_opt_new();
    schemaSetupCallbacks = v7->_schemaSetupCallbacks;
    v7->_schemaSetupCallbacks = (NSMutableDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  sqlite3 *db;
  objc_super v4;

  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SYSharedServiceDB;
  -[_SYSharedServiceDB dealloc](&v4, sel_dealloc);
}

- (BOOL)_addSkipBackupAttributeToItemAtPath:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBCC68], a4);

  return (char)a4;
}

- (BOOL)_LOCKED_hasSchemaVersionForClient:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int v7;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  v5 = sqlite3_prepare_v2(self->_db, "SELECT count(*) FROM _clients WHERE name=?", -1, &ppStmt, 0);
  if (v5)
  {
    if (v5 != 1)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[_SYSharedServiceDB _LOCKED_hasSchemaVersionForClient:].cold.1();
    }
    v6 = 0;
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
    v7 = sqlite3_step(ppStmt);
    v6 = 0;
    if (v7 && v7 != 101)
    {
      if (v7 == 100)
      {
        v6 = sqlite3_column_int(ppStmt, 0) != 0;
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          -[_SYSharedServiceDB _LOCKED_hasSchemaVersionForClient:].cold.1();
        v6 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (int64_t)_LOCKED_getClientVersion:(id)a3
{
  id v4;
  int v5;
  int64_t v6;
  int v7;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  v5 = sqlite3_prepare_v2(self->_db, "SELECT schema_version FROM _clients WHERE name=?", -1, &ppStmt, 0);
  if (v5)
  {
    v6 = 0;
    if (v5 != 1)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[_SYSharedServiceDB _LOCKED_getClientVersion:].cold.1();
      v6 = 0;
    }
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
    v7 = sqlite3_step(ppStmt);
    v6 = 0;
    if (v7 && v7 != 101)
    {
      if (v7 == 100)
      {
        v6 = sqlite3_column_int(ppStmt, 0);
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
          -[_SYSharedServiceDB _LOCKED_getClientVersion:].cold.1();
        v6 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (void)_LOCKED_setVersion:(int64_t)a3 forClient:(id)a4
{
  int v4;
  id v6;
  const char *v7;
  int v8;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  v6 = a4;
  ppStmt = 0;
  if (-[_SYSharedServiceDB _LOCKED_hasSchemaVersionForClient:](self, "_LOCKED_hasSchemaVersionForClient:", v6))
    v7 = "UPDATE _clients SET schema_version=?, tstamp=datetime('now') WHERE name=?";
  else
    v7 = "INSERT INTO _clients (schema_version, name, tstamp) VALUES (?, ?, datetime('now'))";
  if (sqlite3_prepare_v2(self->_db, v7, -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[_SYSharedServiceDB _LOCKED_setVersion:forClient:].cold.1();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, v4);
    sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0);
    v8 = sqlite3_step(ppStmt);
    if (v8 && v8 != 101)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
        -[_SYSharedServiceDB _LOCKED_setVersion:forClient:].cold.1();
    }
    sqlite3_finalize(ppStmt);
  }

}

- (void)_LOCKED_ensureSchemaVersionsTableInDB:(sqlite3 *)a3
{
  int64_t v5;

  v5 = -[_SYSharedServiceDB _LOCKED_getClientVersion:](self, "_LOCKED_getClientVersion:", CFSTR("self"));
  if (!v5)
  {
    sqlite3_exec(a3, "CREATE TABLE IF NOT EXISTS _clients (name TEXT, schema_version TEXT, tstamp TEXT)", 0, 0, 0);
    v5 = 1;
  }
  -[_SYSharedServiceDB _LOCKED_setVersion:forClient:](self, "_LOCKED_setVersion:forClient:", v5, CFSTR("self"));
}

- (void)_ensureSchemaVersionsTable
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48___SYSharedServiceDB__ensureSchemaVersionsTable__block_invoke;
  v2[3] = &unk_24CC65320;
  v2[4] = self;
  -[_SYSharedServiceDB withDBRef:](self, "withDBRef:", v2);
}

- (int64_t)schemaVersionForClient:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  int64_t v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)os_transaction_create();
  if (-[_SYSharedServiceDB _LOCKED_ensureDBExists](self, "_LOCKED_ensureDBExists"))
    v7 = -[_SYSharedServiceDB _LOCKED_getClientVersion:](self, "_LOCKED_getClientVersion:", v4);
  else
    v7 = 0;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setSchemaVersion:(int64_t)a3 forClient:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)os_transaction_create();
  if (-[_SYSharedServiceDB _LOCKED_ensureDBExists](self, "_LOCKED_ensureDBExists"))
    -[_SYSharedServiceDB _LOCKED_setVersion:forClient:](self, "_LOCKED_setVersion:forClient:", a3, v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_LOCKED_runSchemaUpdate:(id)a3 forClientNamed:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t (**v10)(id, sqlite3 *, int64_t);

  v10 = (uint64_t (**)(id, sqlite3 *, int64_t))a3;
  v6 = a4;
  v7 = (void *)os_transaction_create();
  v8 = -[_SYSharedServiceDB _LOCKED_getClientVersion:](self, "_LOCKED_getClientVersion:", v6);
  v9 = v10[2](v10, self->_db, v8);
  if (v9 != v8)
    -[_SYSharedServiceDB _LOCKED_setVersion:forClient:](self, "_LOCKED_setVersion:forClient:", v9, v6);

}

- (void)updateSchemaForClient:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)os_transaction_create();
  if (self->_db)
  {
    -[_SYSharedServiceDB _LOCKED_runSchemaUpdate:forClientNamed:](self, "_LOCKED_runSchemaUpdate:forClientNamed:", v6, v9);
  }
  else
  {
    v8 = (void *)MEMORY[0x212BE0F2C](v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_schemaSetupCallbacks, "setObject:forKeyedSubscript:", v8, v9);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)_runTransactionBlock:(id)a3 exclusive:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int (**v6)(id, sqlite3 *);
  os_unfair_lock_s *p_lock;
  void *v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  char *v19;
  const char *v20;
  char *v21;
  char *errmsg;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, sqlite3 *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)os_transaction_create();
  if (!-[_SYSharedServiceDB _LOCKED_ensureDBExists](self, "_LOCKED_ensureDBExists"))
  {
    os_unfair_lock_unlock(&self->_lock);

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  errmsg = 0;
  if (v4)
    v9 = "BEGIN EXCLUSIVE TRANSACTION";
  else
    v9 = "BEGIN TRANSACTION";
  v10 = sqlite3_exec(self->_db, v9, 0, 0, &errmsg);
  v11 = (_DWORD)v10 == 0;
  if ((_DWORD)v10)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v12 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
      -[_SYSharedServiceDB _runTransactionBlock:exclusive:].cold.1((const char **)&errmsg, v10, v12);
    if (errmsg)
    {
      sqlite3_free(errmsg);
      errmsg = 0;
    }
    goto LABEL_12;
  }
  if (!v6[2](v6, self->_db))
  {
LABEL_23:
    v16 = sqlite3_exec(self->_db, "ROLLBACK TRANSACTION", 0, 0, &errmsg);
    if (!v16)
      goto LABEL_29;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v17 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    {
      v18 = "non-exclusive";
      if (v4)
        v18 = "exclusive";
      *(_DWORD *)buf = 136315650;
      v24 = v18;
      if (errmsg)
        v19 = errmsg;
      else
        v19 = "[nil]";
      v25 = 1024;
      v26 = v16;
      v27 = 2082;
      v28 = v19;
      _os_log_error_impl(&dword_211704000, v17, OS_LOG_TYPE_ERROR, "Failed to rollback %s transaction: %{companionsync:sqlite3err}d (%{public}s)", buf, 0x1Cu);
    }
    if (errmsg)
    {
      sqlite3_free(errmsg);
      errmsg = 0;
      os_unfair_lock_unlock(p_lock);

    }
    else
    {
LABEL_29:
      os_unfair_lock_unlock(p_lock);

    }
    goto LABEL_14;
  }
  v14 = sqlite3_exec(self->_db, "COMMIT TRANSACTION", 0, 0, &errmsg);
  if (v14)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = qword_253D84AC8;
    if (os_log_type_enabled((os_log_t)qword_253D84AC8, OS_LOG_TYPE_ERROR))
    {
      v20 = "non-exclusive";
      if (v4)
        v20 = "exclusive";
      *(_DWORD *)buf = 136315650;
      v24 = v20;
      if (errmsg)
        v21 = errmsg;
      else
        v21 = "[nil]";
      v25 = 1024;
      v26 = v14;
      v27 = 2082;
      v28 = v21;
      _os_log_error_impl(&dword_211704000, v15, OS_LOG_TYPE_ERROR, "Failed to commit %s transaction: %{companionsync:sqlite3err}d (%{public}s)", buf, 0x1Cu);
    }
    if (errmsg)
    {
      sqlite3_free(errmsg);
      errmsg = 0;
    }
    goto LABEL_23;
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_lock);

LABEL_15:
  return v11;
}

- (BOOL)inTransaction:(id)a3
{
  return -[_SYSharedServiceDB _runTransactionBlock:exclusive:](self, "_runTransactionBlock:exclusive:", a3, 0);
}

- (BOOL)inExclusiveTransaction:(id)a3
{
  return -[_SYSharedServiceDB _runTransactionBlock:exclusive:](self, "_runTransactionBlock:exclusive:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaSetupCallbacks, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)_releaseSharedInstanceForServiceName:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  GetServiceInstanceTable();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
  v4 = (void *)MEMORY[0x212BE0D64]();
  objc_msgSend(v3, "removeObjectForKey:", v5);
  objc_autoreleasePoolPop(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);

}

- (NSString)_dbPath
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46___SYSharedServiceDB_UnitTestHelpers___dbPath__block_invoke;
  v4[3] = &unk_24CC65370;
  v4[4] = &v5;
  -[_SYSharedServiceDB withDBRef:](self, "withDBRef:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)_ensureParentExists:(void *)a1 error:(void *)a2 .cold.1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  _SYObfuscate(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_211704000, v3, OS_LOG_TYPE_ERROR, "Failed to set do-not-backup property on persistent data folder: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_LOCKED_hasSchemaVersionForClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Error checking inclusion of client %{public}@: %{companionsync:sqlite3err}d");
  OUTLINED_FUNCTION_2();
}

- (void)_LOCKED_getClientVersion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Error fetching schema version for %{public}@: %{companionsync:sqlite3err}d");
  OUTLINED_FUNCTION_2();
}

- (void)_LOCKED_setVersion:forClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Error setting schema version for %{public}@: %{companionsync:sqlite3err}d");
  OUTLINED_FUNCTION_2();
}

- (void)_LOCKED_createOrOpenDBForServiceName:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_211704000, a2, OS_LOG_TYPE_ERROR, "Failed to open SQLite DB: %{companionsync:sqlite3err}d", (uint8_t *)v2, 8u);
}

- (void)_runTransactionBlock:(NSObject *)a3 exclusive:.cold.1(const char **a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  uint64_t v4;
  __int128 v5;

  v3 = *a1;
  if (!*a1)
    v3 = "[nil]";
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a2;
  LOWORD(v5) = 2082;
  *(_QWORD *)((char *)&v5 + 2) = v3;
  OUTLINED_FUNCTION_0(&dword_211704000, a2, a3, "Failure to begin transaction: %{companionsync:sqlite3err}d (%{public}s)", v4, (_QWORD)v5, WORD4(v5));
  OUTLINED_FUNCTION_2();
}

@end
