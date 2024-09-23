@implementation GEONavdCachePersistenceManager

- (GEONavdCachePersistenceManager)init
{
  GEONavdCachePersistenceManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOSQLiteDB *v15;
  void *v16;
  uint64_t v17;
  GEOSQLiteDB *db;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)GEONavdCachePersistenceManager;
  v2 = -[GEONavdCachePersistenceManager init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/Caches/com.apple.navd"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("navd.cache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v6, 0);

    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("navd.cache-shm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v7, 0);

    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("navd.cache-wal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v8, 0);

    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("navd"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v9, 0);

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/Maps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("navd.cache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v11, 0);

    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("navd.cache-shm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v12, 0);

    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("navd.cache-wal"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v13, 0);

    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("navd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v14, 0);

    v15 = [GEOSQLiteDB alloc];
    GEOGetGEONavdCachePersistenceManagerLog();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:](v15, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:", "com.apple.navd.GEONavdCachePersistenceManager", v16, 0, 128, 0, &__block_literal_global_16);
    db = v2->_db;
    v2->_db = (GEOSQLiteDB *)v17;

  }
  return v2;
}

uint64_t __38__GEONavdCachePersistenceManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  GEOGetGEONavdCachePersistenceManagerLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (objc_msgSend(v4, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS cache(   rowid INTEGER PRIMARY KEY NOT NULL,    hash INT NOT NULL,    key BLOB NOT NULL,    value BLOB NOT NULL,    refresh_timestamp REAL NOT NULL   );",
                       0)
    && objc_msgSend(v4, "prepareStatement:forKey:", "INSERT OR REPLACE INTO cache    (hash, key, value, refresh_timestamp)    VALUES (@hash, @key, @value, @refresh_timestamp);",
                       CFSTR("Insert"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "UPDATE cache    SET hash = @hash, key = @key, value = @value, refresh_timestamp = @refresh_timestamp    WHERE rowid = @rowid;",
                       CFSTR("Update"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT rowid, hash, key, value, refresh_timestamp    FROM cache;",
                       CFSTR("ReadAllRows"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT rowid, hash, key, value, refresh_timestamp    FROM cache    WHERE rowid = @rowid;",
                       CFSTR("ReadRowWithID"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT rowid, hash, key, value, refresh_timestamp    FROM cache    WHERE hash = @hash;",
                       CFSTR("ReadRowWithHash"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "SELECT refresh_timestamp    FROM cache    WHERE refresh_timestamp >= 0    ORDER BY refresh_timestamp    LIMIT 1;",
                       CFSTR("ReadNextTimerTimestamp"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "DELETE FROM cache    WHERE rowid = @rowid;",
                       CFSTR("DeleteRowWithID"))
    && objc_msgSend(v4, "prepareStatement:forKey:", "DELETE FROM cache;", CFSTR("DeleteAllRows")))
  {
    v5 = objc_msgSend(v4, "prepareStatement:forKey:", "SELECT COUNT(*)    FROM cache;", CFSTR("CountRows"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)tearDown
{
  GEOSQLiteDB *db;
  NSObject *v4;
  _QWORD block[5];

  db = self->_db;
  if (db)
  {
    -[GEOSQLiteDB isolationQueue](db, "isolationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__GEONavdCachePersistenceManager_tearDown__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_sync(v4, block);

  }
}

uint64_t __42__GEONavdCachePersistenceManager_tearDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tearDown");
}

- (double)nextTimeStampForRefreshTimer
{
  GEOSQLiteDB *db;
  NSObject *v3;
  uint64_t v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0xBFF0000000000000;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke;
  v7[3] = &unk_1E1BFF920;
  v7[4] = self;
  v7[5] = &v8;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v7);
  GEOGetGEONavdCachePersistenceManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *((_QWORD *)v9 + 3);
    *(_DWORD *)buf = 134217984;
    v13 = v4;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "read next refresh timestamp:%f", buf, 0xCu);
  }

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, double);
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v1 = MEMORY[0x1E0C809B0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke_2;
  v11 = &unk_1E1C023E8;
  v12 = v2;
  v4 = v3;
  v5 = &v8;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__6;
  v17[4] = __Block_byref_object_dispose__6;
  v18 = 0;
  v13[0] = v1;
  v13[1] = 3221225472;
  v13[2] = __ReadNextTimerTimestamp_block_invoke;
  v13[3] = &unk_1E1BFF998;
  v6 = v4;
  v14 = v6;
  v7 = v5;
  v15 = v7;
  v16 = v17;
  objc_msgSend(v6, "statementForKey:statementBlock:", CFSTR("ReadNextTimerTimestamp"), v13, v8, v9, v10, v11, v12);

  _Block_object_dispose(v17, 8);
}

uint64_t __62__GEONavdCachePersistenceManager_nextTimeStampForRefreshTimer__block_invoke_2(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __58__GEONavdCachePersistenceManager__threadUnsafeRowIdOfKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a4;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v8);
  if (v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v10 = v9 ^ 1u;

  return v10;
}

- (id)entryWithRowId:(int64_t)a3
{
  GEOSQLiteDB *db;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  int64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke;
  v9[3] = &unk_1E1C02460;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v9);
  GEOGetGEONavdCachePersistenceManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = v11[5];
    *(_DWORD *)buf = 134218243;
    v17 = a3;
    v18 = 2113;
    v19 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "returning entry for rowId: %lld entry:%{private}@", buf, 0x16u);
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t *v6;
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, void *, void *);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v3 = a1[6];
  v4 = MEMORY[0x1E0C809B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke_2;
  v12 = &unk_1E1C02438;
  v13 = v1;
  v14 = v3;
  v5 = v2;
  v6 = &v9;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__6;
  v20[4] = __Block_byref_object_dispose__6;
  v21 = 0;
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __ReadRowWithID_block_invoke;
  v15[3] = &unk_1E1C019E8;
  v7 = v5;
  v18 = v20;
  v19 = v3;
  v16 = v7;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("ReadRowWithID"), v15, v9, v10, v11, v12, v13, v14);

  _Block_object_dispose(v20, 8);
}

uint64_t __49__GEONavdCachePersistenceManager_entryWithRowId___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v23;
  id v25;
  id v26;
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = a4;
  v26 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v26;
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (v12)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v25);
    v14 = objc_claimAutoreleasedReturnValue();
    v17 = v25;
    v13 = v17;
    if (v14)
      v18 = v17 == 0;
    else
      v18 = 0;
    v16 = v18;
    if (v18)
    {
      -[NSObject setRowId:](v14, "setRowId:", *(_QWORD *)(a1 + 40));
      v27[0] = v10;
      v27[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v21 = *(NSObject **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;
    }
    else
    {
      GEOGetGEONavdCachePersistenceManagerLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v23 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v29 = v10;
        v30 = 2048;
        v31 = v23;
        v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_FAULT, "couldn't find a value for key: %@ for rowId: %lld, error: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v13 = v11;
    GEOGetGEONavdCachePersistenceManagerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v29 = v15;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_FAULT, "couldn't find a key for rowId: %lld, error: %@", buf, 0x16u);
    }
    v16 = 0;
  }

  return v16;
}

- (int64_t)dumpToDiskWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  GEOSQLiteDB *db;
  int64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOGetGEONavdCachePersistenceManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Dump to disk for request:%p", (uint8_t *)&buf, 0xCu);

  }
  if ((objc_msgSend(v7, "canBePersistedToDisk") & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x2020000000;
    v21 = 0;
    v21 = objc_msgSend(v7, "rowId");
    db = self->_db;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__GEONavdCachePersistenceManager_dumpToDiskWithKey_value___block_invoke;
    v15[3] = &unk_1E1C02068;
    p_buf = &buf;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v15);
    v11 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    GEOGetGEONavdCachePersistenceManagerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Not persisting for request:%{private}@", (uint8_t *)&buf, 0xCu);

    }
    -[GEONavdCachePersistenceManager deleteFromDiskWithKey:](self, "deleteFromDiskWithKey:", v6);
    v11 = -1;
  }

  return v11;
}

void __58__GEONavdCachePersistenceManager_dumpToDiskWithKey_value___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  id v36;
  __int128 buf;
  void *v38;
  void *v39;
  id v40;
  uint64_t *v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == -1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    v4 = v3;
    if (v2)
    {
      v5 = -1;
      if (v3)
      {
        v31 = 0;
        v32 = &v31;
        v33 = 0x2020000000;
        v34 = -1;
        v6 = *(void **)(v2 + 8);
        v7 = objc_msgSend(v3, "hash", 0);
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v38 = __58__GEONavdCachePersistenceManager__threadUnsafeRowIdOfKey___block_invoke;
        v39 = &unk_1E1C02410;
        v40 = v4;
        v41 = &v31;
        ReadRowWithHash(v6, v7, &buf);
        v5 = v32[3];

        _Block_object_dispose(&v31, 8);
      }
    }
    else
    {
      v5 = 0;
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
    objc_msgSend(*(id *)(a1 + 48), "setRowId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 40), 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 48), 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12 = objc_msgSend(*(id *)(a1 + 40), "hash");
  objc_msgSend(*(id *)(a1 + 48), "valueRefreshTimeStamp");
  v14 = v13;
  if (v10 == -1)
  {
    v24 = v11;
    v25 = v8;
    v26 = v9;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = (uint64_t)__Block_byref_object_copy__6;
    v35 = __Block_byref_object_dispose__6;
    v36 = 0;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v38 = __Insert_block_invoke;
    v39 = &unk_1E1C024F8;
    v27 = v24;
    v43 = &v31;
    v44 = v12;
    v40 = v27;
    v28 = (uint64_t *)v25;
    v41 = v28;
    v29 = v26;
    v42 = v29;
    v45 = v14;
    LODWORD(v25) = objc_msgSend(v27, "executeStatement:statementBlock:", CFSTR("Insert"), &buf);

    _Block_object_dispose(&v31, 8);
    if ((_DWORD)v25)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sqliteDB"));
    GEOGetGEONavdCachePersistenceManagerLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v30;
      v23 = "Created new entry with rowId %lld";
      goto LABEL_13;
    }
  }
  else
  {
    v15 = v11;
    v16 = v8;
    v17 = v9;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = (uint64_t)__Block_byref_object_copy__6;
    v35 = __Block_byref_object_dispose__6;
    v36 = 0;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v38 = __Update_block_invoke;
    v39 = &unk_1E1C02520;
    v18 = v15;
    v40 = v18;
    v43 = &v31;
    v44 = v10;
    v45 = v12;
    v19 = (uint64_t *)v16;
    v41 = v19;
    v20 = v17;
    v42 = v20;
    v46 = v14;
    objc_msgSend(v18, "executeStatement:statementBlock:", CFSTR("Update"), &buf);

    _Block_object_dispose(&v31, 8);
    GEOGetGEONavdCachePersistenceManagerLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v22;
      v23 = "Updated entry with rowId %lld";
LABEL_13:
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&buf, 0xCu);
    }
  }

}

- (id)readValueWithKey:(id)a3
{
  id v4;
  GEOSQLiteDB *db;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke;
  v9[3] = &unk_1E1BFF8F8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(*(id *)(a1 + 40), "hash");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke_2;
  v6[3] = &unk_1E1C02410;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  ReadRowWithHash(v2, v3, v6);

}

uint64_t __51__GEONavdCachePersistenceManager_readValueWithKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v18;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = a4;
  v18 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v18;
  if (v12 || !objc_msgSend(*(id *)(a1 + 32), "isEqual:", v11))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRowId:", a2);
    v16 = 1;
  }

  return v16;
}

- (void)deleteFromDiskWithKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOGetGEONavdCachePersistenceManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v12 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Delete from disk for request:%{private}@", buf, 0xCu);

  }
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke;
  v9[3] = &unk_1E1C00738;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

}

void __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(*(id *)(a1 + 40), "hash");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke_2;
  v17[3] = &unk_1E1C02488;
  v18 = *(id *)(a1 + 40);
  v5 = v2;
  v19 = v5;
  ReadRowWithHash(v3, v4, v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "integerValue");
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x3032000000;
        v24[3] = __Block_byref_object_copy__6;
        v24[4] = __Block_byref_object_dispose__6;
        v25 = 0;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __DeleteRowWithID_block_invoke;
        v20[3] = &unk_1E1BFF770;
        v11 = v10;
        v22 = v24;
        v23 = v9;
        v21 = v11;
        objc_msgSend(v11, "executeStatement:statementBlock:", CFSTR("DeleteRowWithID"), v20);

        _Block_object_dispose(v24, 8);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
    }
    while (v6);
  }

}

uint64_t __56__GEONavdCachePersistenceManager_deleteFromDiskWithKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a4;
  v13 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (!v9 && objc_msgSend(*(id *)(a1 + 32), "isEqual:", v8))
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  return 1;
}

- (void)enumerateAllEntriesWithHandler:(id)a3
{
  id v4;
  void *v5;
  GEOSQLiteDB *db;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke;
    v7[3] = &unk_1E1BFFBF0;
    v7[4] = self;
    v8 = v4;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);

  }
}

void __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke_2;
  v3[3] = &unk_1E1C024B0;
  v4 = v1;
  ReadAllRows(v2, v3);

}

BOOL __65__GEONavdCachePersistenceManager_enumerateAllEntriesWithHandler___block_invoke_2(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v18;
  _BOOL8 v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB3710];
  v12 = a5;
  v23 = 0;
  objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v23;
  if (v13)
    v15 = v14 == 0;
  else
    v15 = 0;
  if (!v15)
  {
    v16 = v14;
    GEOGetGEONavdCachePersistenceManagerLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = a2;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, "couldn't find a key for rowId: %lld, error: %@", buf, 0x16u);
    }
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v22);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v22;
  v16 = v18;
  if (!v17 || v18)
  {
    GEOGetGEONavdCachePersistenceManagerLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v13;
      v26 = 2048;
      v27 = a2;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_FAULT, "couldn't find a value for key: %@ for rowId: %lld, error: %@", buf, 0x20u);
    }

    goto LABEL_13;
  }
  -[NSObject setRowId:](v17, "setRowId:", a2);
  buf[0] = 0;
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
  v19 = buf[0] == 0;
LABEL_14:

  return v19;
}

- (void)enumerateAllForCacheEntriesWithHandler:(id)a3
{
  id v4;
  void *v5;
  GEOSQLiteDB *db;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke;
    v7[3] = &unk_1E1BFFBF0;
    v7[4] = self;
    v8 = v4;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);

  }
}

void __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke_2;
  v3[3] = &unk_1E1C024B0;
  v4 = v1;
  ReadAllRows(v2, v3);

}

uint64_t __73__GEONavdCachePersistenceManager_enumerateAllForCacheEntriesWithHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (int64_t)numberOfEntries
{
  GEOSQLiteDB *db;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__GEONavdCachePersistenceManager_numberOfEntries__block_invoke;
  v5[3] = &unk_1E1C00760;
  v5[4] = self;
  v5[5] = &v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__GEONavdCachePersistenceManager_numberOfEntries__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__6;
  v13[4] = __Block_byref_object_dispose__6;
  v14 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CountRows_block_invoke;
  v5[3] = &unk_1E1C019C0;
  v7 = &v9;
  v3 = v2;
  v6 = v3;
  v8 = v13;
  objc_msgSend(v3, "statementForKey:statementBlock:", CFSTR("CountRows"), v5);
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
}

- (void)removeAllEntries
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__GEONavdCachePersistenceManager_removeAllEntries__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v3);
}

uint64_t __50__GEONavdCachePersistenceManager_removeAllEntries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("DeleteAllRows"), &__block_literal_global_86);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
