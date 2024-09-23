@implementation MSASModelBase

- (MSASModelBase)initWithPersonID:(id)a3 databasePath:(id)a4 currentVersion:(int)a5
{
  id v9;
  id v10;
  MSASModelBase *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *statementQueue;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *dbQueue;
  NSObject *v26;
  _QWORD block[4];
  MSASModelBase *v29;
  id v30;
  int v31;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MSASModelBase;
  v11 = -[MSASModelBase init](&v32, sel_init);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("MSASModelBase statement queue - %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_retainAutorelease(v15);
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    statementQueue = v11->_statementQueue;
    v11->_statementQueue = (OS_dispatch_queue *)v17;

    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("MSASModelBase db queue - %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutorelease(v22);
    v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), 0);
    dbQueue = v11->_dbQueue;
    v11->_dbQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v11->_personID, a3);
    v11->_statements = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], &initWithPersonID_databasePath_currentVersion__doNothingCallbacks);
    -[MSASModelBase dbQueue](v11, "dbQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MSASModelBase_initWithPersonID_databasePath_currentVersion___block_invoke;
    block[3] = &unk_1E95BC610;
    v29 = v11;
    v30 = v10;
    v31 = a5;
    dispatch_sync(v26, block);

  }
  return v11;
}

- (sqlite3)db
{
  NSObject *v3;
  sqlite3 *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __19__MSASModelBase_db__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (sqlite3 *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)dbQueueInitializeDatabasePath:(id)a3 currentVersion:(int)a4
{
  uint64_t v4;
  id v6;
  char v7;
  sqlite3 **p_db;
  NSObject *v9;
  __int128 v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  sqlite3 *v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  sqlite3 *db;
  NSObject *v22;
  const char *v23;
  int v24;
  void *v25;
  sqlite3 *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  char *v32;
  char *errmsg;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  MSASModelBase *v36;
  __int16 v37;
  _WORD v38[9];

  v4 = *(_QWORD *)&a4;
  *(_QWORD *)&v38[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 0;
  p_db = &self->_db;
  v9 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v10 = 138543874;
  v31 = v10;
  do
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2112;
      *(_QWORD *)v38 = v6;
      _os_log_debug_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Opening database at %@", buf, 0x16u);
    }
    ppStmt = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v6);

    if (v13
      && sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), &self->_db, 65542, 0))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2112;
        *(_QWORD *)v38 = v6;
        v14 = v9;
        v15 = "%{public}@ Cannot open sqlite3 database at path %@. Recreating database.";
        v16 = 22;
LABEL_71:
        _os_log_error_impl(&dword_1D3E94000, v14, OS_LOG_TYPE_ERROR, v15, buf, v16);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    v17 = *p_db;
    if (!*p_db)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        _os_log_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_INFO, "%{public}@: Creating new database.", buf, 0xCu);
      }
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, 0);

      if (sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), &self->_db, 65542, 0))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = self;
          v37 = 2112;
          *(_QWORD *)v38 = v6;
          _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Cannot create sqlite3 database at path %@. Carrying on.", buf, 0x16u);
        }
        *p_db = 0;
        goto LABEL_28;
      }
      v17 = *p_db;
    }
    errmsg = 0;
    if (sqlite3_exec(v17, "pragma cache_size = -128;", 0, 0, &errmsg) && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2082;
      *(_QWORD *)v38 = errmsg;
      _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not set cache size. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (sqlite3_exec(*p_db, "pragma journal_mode = wal;", 0, 0, &errmsg)
      && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2082;
      *(_QWORD *)v38 = errmsg;
      _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not set journal mode. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (v7 & 1 | ((v13 & 1) == 0))
    {
      v18 = 0xFFFFFFFFLL;
      goto LABEL_17;
    }
    if (sqlite3_prepare_v2(*p_db, "select value from Properties where key = 'version';", -1, &ppStmt, 0))
    {
      MSLogSqliteError(self->_db, (uint64_t)self, 117);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_DWORD *)buf = 138543362;
      v36 = self;
      v14 = v9;
      v15 = "%{public}@: Could not compile version check statement. Deleting database and recreating.";
LABEL_70:
      v16 = 12;
      goto LABEL_71;
    }
    v24 = sqlite3_step(ppStmt);
    if (v24)
    {
      if (v24 != 100)
      {
        MSLogSqliteError(self->_db, (uint64_t)self, 126);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_DWORD *)buf = 138543362;
        v36 = self;
        v14 = v9;
        v15 = "%{public}@: Fatal error: Could not read current version. Deleting database and recreating.";
        goto LABEL_70;
      }
      MSSqliteStringFromStatementColumn(ppStmt, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v25, "intValue");

    }
    else
    {
      v18 = 0xFFFFFFFFLL;
    }
    if ((int)v18 > (int)v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v31;
        v36 = self;
        v37 = 1024;
        *(_DWORD *)v38 = v18;
        v38[2] = 1024;
        *(_DWORD *)&v38[3] = v4;
        v14 = v9;
        v15 = "%{public}@: Fatal error: database version %d is greater than what the model understands (%d). Deleting dat"
              "abase and recreating.";
        v16 = 24;
        goto LABEL_71;
      }
LABEL_21:
      v19 = 0;
      v7 = 1;
      goto LABEL_47;
    }
LABEL_17:
    if ((_DWORD)v18 == (_DWORD)v4)
    {
      v7 = 0;
LABEL_28:
      v19 = 1;
      goto LABEL_47;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v31;
      v36 = self;
      v37 = 1024;
      *(_DWORD *)v38 = v18;
      v38[2] = 1024;
      *(_DWORD *)&v38[3] = v4;
      _os_log_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Migrating database from version %d to version %d.", buf, 0x18u);
    }
    v32 = 0;
    if (sqlite3_exec(*p_db, "savepoint migration;", 0, 0, &v32))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2082;
        *(_QWORD *)v38 = v32;
        _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not begin transaction. Error: %{public}s", buf, 0x16u);
      }
      sqlite3_free(v32);
    }
    v19 = -[MSASModelBase dbQueueUpgradeFromDatabaseVersion:currentVersion:](self, "dbQueueUpgradeFromDatabaseVersion:currentVersion:", v18, v4);
    db = self->_db;
    if (v19)
    {
      if (sqlite3_exec(db, "release savepoint migration;", 0, 0, &v32))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = self;
          v37 = 2082;
          *(_QWORD *)v38 = v32;
          v22 = v9;
          v23 = "%{public}@: Could not end transaction. Error: %{public}s";
LABEL_73:
          _os_log_error_impl(&dword_1D3E94000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
          goto LABEL_45;
        }
        goto LABEL_45;
      }
    }
    else if (sqlite3_exec(db, "rollback transaction to savepoint migration;", 0, 0, &v32))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2082;
        *(_QWORD *)v38 = v32;
        v22 = v9;
        v23 = "%{public}@: Could not roll back transaction. Error: %{public}s";
        goto LABEL_73;
      }
LABEL_45:
      sqlite3_free(v32);
    }
    v7 = !v19;
LABEL_47:
    if (ppStmt)
      sqlite3_finalize(ppStmt);
    ppStmt = 0;
    if ((v7 & 1) != 0)
    {
      v26 = *p_db;
      if (!*p_db)
        goto LABEL_57;
      LODWORD(v32) = 129;
      v27 = sqlite3_file_control(v26, 0, 101, &v32);
      if (v27)
      {
        MSLogSqliteError(self->_db, (uint64_t)self, 174);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = self;
          v37 = 1024;
          *(_DWORD *)v38 = v27;
          _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not truncate sqlite database (%d).", buf, 0x12u);
        }
      }
      if (sqlite3_close(*p_db)
        && (MSLogSqliteError(self->_db, (uint64_t)self, 178), os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not close sqlite database.", buf, 0xCu);
        if (v27)
        {
LABEL_57:
          objc_msgSend(v11, "removeItemAtPath:error:", v6, 0);
          objc_msgSend(v6, "stringByAppendingString:", CFSTR("-shm"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeItemAtPath:error:", v28, 0);

          objc_msgSend(v6, "stringByAppendingString:", CFSTR("-wal"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeItemAtPath:error:", v29, 0);

          objc_msgSend(v6, "stringByAppendingString:", CFSTR("-journal"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeItemAtPath:error:", v30, 0);

        }
      }
      else if (v27)
      {
        goto LABEL_57;
      }
      self->_db = 0;
      self->_dbWasRecreated = 1;
    }

  }
  while (!v19);
  if (*p_db && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Database ready.", buf, 0xCu);
  }

}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  BOOL v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  int v9;
  sqlite3_stmt *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  sqlite3_stmt *ppStmt;
  char *errmsg;
  uint8_t buf[4];
  MSASModelBase *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x80000000) == 0)
    return 1;
  v5 = *(_QWORD *)&a4;
  errmsg = 0;
  if (sqlite3_exec(self->_db, "create table if not exists Properties(\n   key             text unique primary key,\n   value           blob\n);\n",
         0,
         0,
         &errmsg))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2082;
      v21 = errmsg;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not create Properties table. Error: %{public}s", buf, 0x16u);
    }
    sqlite3_free(errmsg);
  }
  ppStmt = 0;
  v7 = sqlite3_prepare_v2(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "insert or replace into Properties (key, value) values ('version', ?);",
         -1,
         &ppStmt,
         0);
  v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8)
  {
    v9 = 216;
  }
  else
  {
    v10 = ppStmt;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v5);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = sqlite3_bind_text(v10, 1, (const char *)objc_msgSend(v11, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    LODWORD(v10) = v12;
    MSSqliteTrapForDBLockError(v12);

    if ((_DWORD)v10)
    {
      v9 = 218;
    }
    else
    {
      v13 = sqlite3_step(ppStmt);
      v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (v14 == 101)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v19 = self;
          v20 = 1024;
          LODWORD(v21) = v5;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Set database version to %d.", buf, 0x12u);
        }
        v4 = 1;
        goto LABEL_19;
      }
      v9 = 219;
    }
  }
  MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, v9);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to create properties table.", buf, 0xCu);
  }
  v4 = 0;
LABEL_19:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v4;
}

- (void)shutDownForDestruction:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  MSASModelBase *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Shutting down. For destruction: %d", buf, 0x12u);
  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke;
  v9[3] = &unk_1E95BCF98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (sqlite3_stmt)statementForString:(id)a3
{
  id v4;
  NSObject *v5;
  sqlite3_stmt *v6;
  _QWORD block[5];
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
  if (v4)
  {
    -[MSASModelBase statementQueue](self, "statementQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__MSASModelBase_statementForString___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);

    v6 = (sqlite3_stmt *)v12[3];
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)persistentStringForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4808;
  v16 = __Block_byref_object_dispose__4809;
  v17 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSASModelBase_persistentStringForKey___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setPersistentString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MSASModelBase_setPersistentString_forKey___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)persistentObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4808;
  v16 = __Block_byref_object_dispose__4809;
  v17 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSASModelBase_persistentObjectForKey___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = v8;
  if (!v7)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to archive an object. Error: %@ Info: %@"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MSASModelBase_setPersistentObject_forKey___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v17 = v7;
  v18 = v6;
  v14 = v6;
  v15 = v7;
  dispatch_async(v13, block);

}

- (void)deletePersistentValueWithKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MSASModelBase_deletePersistentValueWithKey___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)dbQueuePersistentDataForKey:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  char v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  int v13;
  int v14;
  const void *v15;
  int v16;
  MSASModelBase *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v16 = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving persistent value for key: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select value from Properties where key = ?"));
  v6 = objc_retainAutorelease(v4);
  v7 = 1;
  v8 = sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v9 = v8;
  MSSqliteTrapForDBLockError(v8);
  if (v9)
  {
LABEL_4:
    v10 = 0;
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v13 = sqlite3_step(v5);
  if (v13 == 101)
  {
    v10 = 0;
  }
  else
  {
    v14 = v13;
    if (v13 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = 138543874;
        v17 = self;
        v18 = 2114;
        v19 = v6;
        v20 = 1024;
        v21 = v14;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot retrieve persistent value for key %{public}@. sqlite status: %d", (uint8_t *)&v16, 0x1Cu);
      }
      goto LABEL_4;
    }
    v15 = sqlite3_column_blob(v5, 0);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, sqlite3_column_bytes(v5, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 0;
  if (v5)
LABEL_5:
    sqlite3_reset(v5);
LABEL_6:
  if ((v7 & 1) != 0)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (id)dbQueuePersistentStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v8;
  MSASModelBase *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSASModelBase dbQueuePersistentDataForKey:](self, "dbQueuePersistentDataForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  else
    v6 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = 138543874;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v4;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved persistent string %{public}@ for key %{public}@.", (uint8_t *)&v8, 0x20u);
  }

  return v6;
}

- (id)dbQueuePersistentObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  MSASModelBase *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSASModelBase dbQueuePersistentDataForKey:](self, "dbQueuePersistentDataForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v5, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        v11 = self;
        v12 = 2114;
        v13 = v6;
        v14 = 2114;
        v15 = v4;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved persistent object %{public}@ for key %{public}@.", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not unarchive persistent object for key %{public}@: %@", buf, 0x20u);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dbQueueSetPersistentData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  MSASModelBase *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v20 = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v7;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Setting persistent value for key %{public}@.", (uint8_t *)&v20, 0x16u);
    if (v6)
    {
LABEL_3:
      v8 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into Properties (key, value) values (?, ?);"));
      v9 = sqlite3_reset(v8);
      v10 = v9;
      MSSqliteTrapForDBLockError(v9);
      if (v10)
        goto LABEL_11;
      v11 = sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      v12 = v11;
      MSSqliteTrapForDBLockError(v11);
      if (v12)
        goto LABEL_11;
      v13 = objc_msgSend(v6, "length");
      if (v13 >> 31)
        __assert_rtn("-[MSASModelBase dbQueueSetPersistentData:forKey:]", "MSASModelBase.m", 384, "dataLength <= INT_MAX");
      v14 = sqlite3_bind_blob(v8, 2, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_10;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  v8 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from Properties where key = ?;"));
  v15 = sqlite3_reset(v8);
  v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16)
    goto LABEL_11;
  v14 = sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
  v17 = v14;
  MSSqliteTrapForDBLockError(v14);
  if (!v17)
  {
    v18 = sqlite3_step(v8);
    v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    sqlite3_reset(v8);
    if (v19 == 101)
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_11:
  sqlite3_reset(v8);
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not set persistent value for key %{public}@.", (uint8_t *)&v20, 0x16u);
  }
LABEL_14:

}

- (void)dbQueueSetPersistentString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASModelBase dbQueueSetPersistentData:forKey:](self, "dbQueueSetPersistentData:forKey:", v7, v6);

}

- (void)dbQueueSetPersistentObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (!v7)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to archive an object. Error: %@ Info: %@"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

  }
  -[MSASModelBase dbQueueSetPersistentData:forKey:](self, "dbQueueSetPersistentData:forKey:", v7, v6);

}

- (void)dbQueueDeletePersistentValueWithKey:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  MSASModelBase *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Deleting persistent value for key %{public}@.", (uint8_t *)&v12, 0x16u);
  }
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from Properties where key = ?;"));
  v6 = sqlite3_reset(v5);
  v7 = v6;
  MSSqliteTrapForDBLockError(v6);
  if (v7
    || (v8 = sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), v9 = v8, MSSqliteTrapForDBLockError(v8), v9)|| (v10 = sqlite3_step(v5), v11 = v10, MSSqliteTrapForDBLockError(v10), v11 != 101))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not delete persistent value for key %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }

}

- (void)beginTransaction
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MSASModelBase_beginTransaction__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dbQueueBeginTransaction
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  MSASModelBase *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Beginning transaction.", (uint8_t *)&v7, 0xCu);
  }
  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("savepoint save;"));
  v4 = sqlite3_reset(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (!v5)
  {
    v6 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v6);
  }
  sqlite3_reset(v3);
}

- (void)endTransaction
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MSASModelBase_endTransaction__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dbQueueEndTransaction
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  MSASModelBase *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Ending transaction.", (uint8_t *)&v7, 0xCu);
  }
  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("release savepoint save;"));
  v4 = sqlite3_reset(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (!v5)
  {
    v6 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v6);
  }
  sqlite3_reset(v3);
}

- (void)dbQueueRollbackTransaction
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  MSASModelBase *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Rolling back transaction.", (uint8_t *)&v7, 0xCu);
  }
  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("rollback transaction;"));
  v4 = sqlite3_reset(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (!v5)
  {
    v6 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v6);
  }
  sqlite3_reset(v3);
}

- (sqlite3)dbQueueDB
{
  return self->_db;
}

- (NSString)personID
{
  return self->_personID;
}

- (__CFDictionary)statements
{
  return self->_statements;
}

- (void)setStatements:(__CFDictionary *)a3
{
  self->_statements = a3;
}

- (OS_dispatch_queue)statementQueue
{
  return self->_statementQueue;
}

- (void)setStatementQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statementQueue, a3);
}

- (OS_dispatch_queue)dbQueue
{
  return self->_dbQueue;
}

- (BOOL)dbWasRecreated
{
  return self->_dbWasRecreated;
}

- (void)setDbWasRecreated:(BOOL)a3
{
  self->_dbWasRecreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbQueue, 0);
  objc_storeStrong((id *)&self->_statementQueue, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

uint64_t __31__MSASModelBase_endTransaction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
}

uint64_t __33__MSASModelBase_beginTransaction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
}

uint64_t __46__MSASModelBase_deletePersistentValueWithKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueDeletePersistentValueWithKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__MSASModelBase_setPersistentObject_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueSetPersistentData:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__MSASModelBase_persistentObjectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dbQueuePersistentObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__MSASModelBase_setPersistentString_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueSetPersistentString:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__MSASModelBase_persistentStringForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dbQueuePersistentStringForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__MSASModelBase_statementForString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  const void *Value;
  sqlite3_stmt *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const __CFDictionary **)(v2 + 32);
  if (v3)
  {
    Value = CFDictionaryGetValue(v3, *(const void **)(a1 + 40));
    if (Value)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = Value;
      return;
    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(v2 + 16), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, &ppStmt, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = sqlite3_errmsg(*(sqlite3 **)(v6 + 16));
      *(_DWORD *)buf = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2082;
      v15 = v8;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not compile SQL query: %{public}@. sqlite error: %{public}s", buf, 0x20u);
    }
  }
  else if (ppStmt)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 32), *(const void **)(a1 + 40), ppStmt);
    v5 = ppStmt;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_11:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
}

void __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  sqlite3 *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "statementQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BCED0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

  v3 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16);
  if (v3)
  {
    if (sqlite3_close(v3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = sqlite3_errmsg(*(sqlite3 **)(v6 + 16));
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2082;
      v12 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Can't shut down. sqlite error: %{public}s. Ignoring.", buf, 0x16u);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, v4);

  }
}

void __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke_2(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex Count;
  uint64_t v4;
  size_t v5;
  const void **v6;
  const void **v7;
  sqlite3_stmt **v8;
  sqlite3_stmt *v9;

  v2 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    Count = CFDictionaryGetCount(v2);
    if (Count)
    {
      v4 = Count;
      v5 = 8 * Count;
      v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      v7 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 32), v6, v7);
      if (v4 >= 1)
      {
        v8 = (sqlite3_stmt **)v7;
        do
        {
          v9 = *v8++;
          sqlite3_finalize(v9);
          --v4;
        }
        while (v4);
      }
      free(v6);
      free(v7);
    }
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
}

uint64_t __19__MSASModelBase_db__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __62__MSASModelBase_initWithPersonID_databasePath_currentVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueInitializeDatabasePath:currentVersion:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

@end
