@implementation GEORequestResponsePersister

- (id)initWritable:(BOOL)a3
{
  _BOOL4 v3;
  GEORequestResponsePersister *v4;
  void *v5;
  void *v6;
  void *v7;
  GEOSQLiteDB *v8;
  void *v9;
  _BOOL8 v10;
  GEORequestResponsePersister *v11;
  uint64_t v12;
  GEOSQLiteDB *db;
  _QWORD v15[4];
  GEORequestResponsePersister *v16;
  BOOL v17;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEORequestResponsePersister;
  v4 = -[GEORequestResponsePersister init](&v18, sel_init);
  if (v4)
  {
    +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      +[GEOSQLiteDB defaultPragmas](GEOSQLiteDB, "defaultPragmas");
    else
      +[GEOSQLiteDB defaultReadOnlyPragmas](GEOSQLiteDB, "defaultReadOnlyPragmas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("normal"), CFSTR("locking_mode"));
    v8 = [GEOSQLiteDB alloc];
    GEOFindOrCreateLog("com.apple.Maps.RequestResponse", "Persister");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = !v3;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__GEORequestResponsePersister_initWritable___block_invoke;
    v15[3] = &unk_1E1C12C58;
    v17 = v3;
    v11 = v4;
    v16 = v11;
    v12 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:](v8, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:", "com.apple.geo.RR.Persister", v9, v5, v10, v7, v15);
    db = v11->_db;
    v11->_db = (GEOSQLiteDB *)v12;

  }
  return v4;
}

uint64_t __44__GEORequestResponsePersister_initWritable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  id v7;
  int function_v2;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  int v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "user_version") == 2)
  {
    v4 = 0;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    v4 = "DROP TABLE logs";
  }
  else
  {
    v4 = 0;
  }
  GEOFindOrCreateLog("com.apple.Maps.RequestResponse", "Persister");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v5;
  function_v2 = sqlite3_create_function_v2((sqlite3 *)objc_msgSend(v6, "sqliteDB"), "logs_ExternalResources_Delete", 1, 1, v6, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_logs_ExternalResources_Delete_sqlite, 0, 0, 0);
  if (function_v2)
  {
    v9 = function_v2;
    v10 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      v18 = v9;
      v19 = 2082;
      v20 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v6, "sqliteDB"));
      _os_log_fault_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "create fn failed %d %{public}s", buf, 0x12u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!objc_msgSend(v6, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS logs(   timestamp INT NOT NULL,    type INT NOT NULL,    appid TEXT NOT NULL,    identifier TEXT NOT NULL,    url TEXT,    size INT NOT NULL,    data TEXT NOT NULL,    errorMessage TEXT   );",
                        v4))
  {
LABEL_14:

    goto LABEL_15;
  }
  v11 = sqlite3_exec((sqlite3 *)objc_msgSend(v6, "sqliteDB"), "CREATE TRIGGER IF NOT EXISTS logs_delete_ext    AFTER DELETE ON logs    FOR EACH ROW WHEN NOT logs_ExternalResources_Delete(OLD.data)    BEGIN        SELECT RAISE(ROLLBACK, 'logs_ExternalResources_Delete returned NO, this should not happen');    END;",
          0,
          0,
          0);
  if (v11)
  {
    v12 = v11;
    v13 = v7;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v18 = v12;
      v19 = 2082;
      v20 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v6, "sqliteDB"));
      _os_log_error_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "create trigger failed: %d %{public}s", buf, 0x12u);
    }
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "prepareStatement:forKey:", "INSERT INTO logs    (timestamp, type, appid, identifier, url, size, data, errorMessage)    VALUES (@timestamp, @type, @appid, @identifier, @url, @size, @data, @errorMessage);",
                        CFSTR("AddValue"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "INSERT INTO logs    (timestamp, type, appid, identifier, url, size, data, errorMessage)    VALUES (@timestamp, @type, @appid, @identifier, @url, @size, @data, @errorMessage);",
                        CFSTR("RestoreValue"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE timestamp >= @begin AND timestamp <= @end    ORDER BY timestamp, type ASC;",
                        CFSTR("FindValuesBetween"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE type = @type    ORDER BY timestamp ASC;",
                        CFSTR("FindValuesOfType"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE type == @type AND timestamp >= @begin AND timestamp <= @end    ORDER BY timestamp ASC;",
                        CFSTR("FindValuesBetweenOfType"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE url NOTNULL AND identifier = @identifier    ORDER BY timestamp ASC;",
                        CFSTR("FindRequestById"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE url ISNULL AND identifier = @identifier    ORDER BY timestamp ASC;",
                        CFSTR("FindResponseById"))
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT SUM(size)    FROM logs;",
                        CFSTR("GetTotalSize"))
    || (objc_msgSend(v6, "prepareStatement:forKey:", "DELETE FROM logs    WHERE timestamp < @timestamp;",
          CFSTR("DeleteOlderThan")) & 1) == 0)
  {
    goto LABEL_14;
  }
  v16 = objc_msgSend(v6, "prepareStatement:forKey:", "SELECT data    FROM logs;",
          CFSTR("logs_ExternalResources_Enumerate"));

  if (v16)
  {
    objc_msgSend(v6, "setUser_version:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_reschedulePruner");
    v14 = 1;
    goto LABEL_16;
  }
LABEL_15:
  v14 = 0;
LABEL_16:

  return v14;
}

- (void)dealloc
{
  NSObject *pruneTimer;
  GEOSQLiteDB *db;
  NSObject *v5;
  objc_super v6;
  _QWORD block[5];

  pruneTimer = self->_pruneTimer;
  if (pruneTimer)
    dispatch_source_cancel(pruneTimer);
  db = self->_db;
  if (db)
  {
    -[GEOSQLiteDB isolationQueue](db, "isolationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__GEORequestResponsePersister_dealloc__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_sync(v5, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)GEORequestResponsePersister;
  -[GEORequestResponsePersister dealloc](&v6, sel_dealloc);
}

uint64_t __38__GEORequestResponsePersister_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tearDown");
}

- (BOOL)_checkDbIsWriteable:(id *)a3
{
  int v4;
  unsigned int v5;

  v4 = -[GEOSQLiteDB sqliteFlags](self->_db, "sqliteFlags");
  v5 = v4;
  if (a3 && (v4 & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("DB was not opened in read/write mode"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (v5 >> 1) & 1;
}

- (void)_reschedulePruner
{
  NSObject *pruneTimer;
  void *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  dispatch_time_t v7;
  id v8;
  id location;

  pruneTimer = self->_pruneTimer;
  if (!pruneTimer)
  {
    objc_initWeak(&location, self);
    -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v8, &location);
    v5 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();
    v6 = self->_pruneTimer;
    self->_pruneTimer = v5;

    dispatch_activate((dispatch_object_t)self->_pruneTimer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    pruneTimer = self->_pruneTimer;
  }
  v7 = dispatch_time(0, 20000000000);
  dispatch_source_set_timer(pruneTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
}

void __48__GEORequestResponsePersister__reschedulePruner__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_runAllPruners:", 0);

}

- (void)_persistEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  GEOSQLiteDB *db;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:", 0))
  {
    if (!objc_msgSend(v4, "hasTimestamp") || !objc_msgSend(v4, "timestamp"))
      objc_msgSend(v4, "setTimestamp:", (unint64_t)CFAbsoluteTimeGetCurrent());
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__GEORequestResponsePersister__persistEvent___block_invoke;
    v15[3] = &unk_1E1C01790;
    v15[4] = self;
    v16 = v4;
    v17 = v5;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __45__GEORequestResponsePersister__persistEvent___block_invoke_2;
    v13[3] = &unk_1E1C0B448;
    v13[4] = self;
    v14 = v17;
    v8 = v17;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v15, v13);
    -[GEORequestResponsePersister _reschedulePruner](self, "_reschedulePruner");

  }
  else
  {
    externalFileBaseURL(self->_db);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[GEOSQLiteDB log](self->_db, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_error_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Failed to write log entry to \"%@\": db is not writable", buf, 0xCu);
    }

  }
}

void __45__GEORequestResponsePersister__persistEvent___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _QWORD v34[5];
  id v35;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v22 = objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v3 = objc_msgSend(*(id *)(a1 + 40), "requestType");
  objc_msgSend(*(id *)(a1 + 40), "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "eventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 48), "length");
  v8 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v15 = v9;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__77;
  v34[4] = __Block_byref_object_dispose__77;
  v35 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __AddValue_block_invoke_0;
  v23[3] = &unk_1E1C12D70;
  v16 = v10;
  v30 = v34;
  v31 = v22;
  v24 = v16;
  v33 = v3;
  v17 = v11;
  v25 = v17;
  v18 = v12;
  v26 = v18;
  v19 = v13;
  v27 = v19;
  v32 = v7;
  v20 = v14;
  v28 = v20;
  v21 = v15;
  v29 = v21;
  objc_msgSend(v16, "executeStatement:statementBlock:", CFSTR("AddValue"), v23);

  _Block_object_dispose(v34, 8);
}

void __45__GEORequestResponsePersister__persistEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  externalFileBaseURL(*(void **)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v10 = 0;
    v7 = objc_msgSend(v6, "writeToURL:options:error:", v5, 0, &v10);
    v8 = v10;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v5;
        v13 = 2112;
        v14 = v8;
        _os_log_error_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Failed to write log entry to \"%@\": %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)persistRequestTask:(id)a3 url:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  GEORRRequestResponseEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(GEORRRequestResponseEvent);
  getMetrics(v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "fetchStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    -[GEORRRequestResponseEvent setTimestamp:](v10, "setTimestamp:", (unint64_t)v14);

  }
  objc_msgSend(v22, "dataTask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestCounterTicket");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appId");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("<unknown>");
  -[GEORRRequestResponseEvent setAppId:](v10, "setAppId:", v19);

  -[GEORRRequestResponseEvent setEventType:](v10, "setEventType:", 1);
  -[GEORRRequestResponseEvent setRequestType:](v10, "setRequestType:", objc_msgSend(v22, "requestTypeCode"));
  objc_msgSend(v9, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORRRequestResponseEvent setUrl:](v10, "setUrl:", v20);
  eventId(v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORRRequestResponseEvent setEventId:](v10, "setEventId:", v21);

  -[GEORRRequestResponseEvent setEncoded:](v10, "setEncoded:", v8);
  -[GEORequestResponsePersister _persistEvent:](self, "_persistEvent:", v10);

}

- (void)persistResponseTask:(id)a3 response:(id)a4
{
  id v6;
  GEORRRequestResponseEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_alloc_init(GEORRRequestResponseEvent);
  getMetrics(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "responseEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    -[GEORRRequestResponseEvent setTimestamp:](v7, "setTimestamp:", (unint64_t)v11);

  }
  objc_msgSend(v18, "dataTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestCounterTicket");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appId");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("<unknown>");
  -[GEORRRequestResponseEvent setAppId:](v7, "setAppId:", v16);

  -[GEORRRequestResponseEvent setEventType:](v7, "setEventType:", 2);
  -[GEORRRequestResponseEvent setRequestType:](v7, "setRequestType:", objc_msgSend(v18, "requestTypeCode"));
  eventId(v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORRRequestResponseEvent setEventId:](v7, "setEventId:", v17);

  -[GEORRRequestResponseEvent setEncoded:](v7, "setEncoded:", v6);
  -[GEORequestResponsePersister _persistEvent:](self, "_persistEvent:", v7);

}

- (void)persistResponseTask:(id)a3 error:(id)a4
{
  id v6;
  GEORRRequestResponseEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = objc_alloc_init(GEORRRequestResponseEvent);
  getMetrics(v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "responseEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    -[GEORRRequestResponseEvent setTimestamp:](v7, "setTimestamp:", (unint64_t)v11);

  }
  objc_msgSend(v19, "dataTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestCounterTicket");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appId");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("<unknown>");
  -[GEORRRequestResponseEvent setAppId:](v7, "setAppId:", v16);

  -[GEORRRequestResponseEvent setEventType:](v7, "setEventType:", 2);
  -[GEORRRequestResponseEvent setRequestType:](v7, "setRequestType:", objc_msgSend(v19, "requestTypeCode"));
  eventId(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORRRequestResponseEvent setEventId:](v7, "setEventId:", v17);

  objc_msgSend(v6, "debugDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORRRequestResponseEvent setError:](v7, "setError:", v18);
  -[GEORequestResponsePersister _persistEvent:](self, "_persistEvent:", v7);

}

- (void)persistResponseTaskCanceled:(id)a3
{
  GEORRRequestResponseEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_alloc_init(GEORRRequestResponseEvent);
  getMetrics(v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "responseEndDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    -[GEORRRequestResponseEvent setTimestamp:](v4, "setTimestamp:", (unint64_t)v8);

  }
  objc_msgSend(v15, "dataTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestCounterTicket");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appId");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("<unknown>");
  -[GEORRRequestResponseEvent setAppId:](v4, "setAppId:", v13);

  -[GEORRRequestResponseEvent setEventType:](v4, "setEventType:", 2);
  -[GEORRRequestResponseEvent setRequestType:](v4, "setRequestType:", objc_msgSend(v15, "requestTypeCode"));
  eventId(v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORRRequestResponseEvent setEventId:](v4, "setEventId:", v14);

  -[GEORRRequestResponseEvent setError:](v4, "setError:", CFSTR("Canceled"));
  -[GEORequestResponsePersister _persistEvent:](self, "_persistEvent:", v4);

}

- (id)enumerateAllEntriesWithBlock:(id)a3
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
  v15 = __Block_byref_object_copy__77;
  v16 = __Block_byref_object_dispose__77;
  v17 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__GEORequestResponsePersister_enumerateAllEntriesWithBlock___block_invoke;
  v9[3] = &unk_1E1C12C80;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__GEORequestResponsePersister_enumerateAllEntriesWithBlock___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  +[GEORequestResponsePersistedEvent enumeratorBlockHelper:](GEORequestResponsePersistedEvent, "enumeratorBlockHelper:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FindValuesBetween(v2, &obj, 0, 0x7FFFFFFFFFFFFFFFLL, v4);
  objc_storeStrong((id *)(v3 + 40), obj);

}

- (id)enumerateEntriesInRange:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  GEOSQLiteDB *db;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__77;
  v21 = __Block_byref_object_dispose__77;
  v22 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__GEORequestResponsePersister_enumerateEntriesInRange_withBlock___block_invoke;
  v13[3] = &unk_1E1C12CA8;
  v13[4] = self;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __65__GEORequestResponsePersister_enumerateEntriesInRange_withBlock___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  char v12;
  double v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = (void *)a1[5];
  v5 = *(void **)(a1[4] + 8);
  v6 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  obj = v8;
  if (v4)
  {
    objc_msgSend(v4, "startDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "timeIntervalSinceReferenceDate");
    v10 = (uint64_t)v9;
    v11 = (void *)a1[5];
    if (v11)
    {
      objc_msgSend(v11, "endDate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "timeIntervalSinceReferenceDate");
      v12 = 0;
      v14 = (uint64_t)v13;
    }
    else
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v12 = 1;
    }
  }
  else
  {
    v10 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 1;
  }
  +[GEORequestResponsePersistedEvent enumeratorBlockHelper:](GEORequestResponsePersistedEvent, "enumeratorBlockHelper:", a1[6]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FindValuesBetween(v5, &obj, v10, v14, v15);
  objc_storeStrong(v7, obj);

  if ((v12 & 1) == 0)
  if (v4)

}

- (id)enumerateEntriesOfType:(int)a3 withBlock:(id)a4
{
  id v6;
  GEOSQLiteDB *db;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__77;
  v19 = __Block_byref_object_dispose__77;
  v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__GEORequestResponsePersister_enumerateEntriesOfType_withBlock___block_invoke;
  v11[3] = &unk_1E1C12CD0;
  v11[4] = self;
  v13 = &v15;
  v14 = a3;
  v8 = v6;
  v12 = v8;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __64__GEORequestResponsePersister_enumerateEntriesOfType_withBlock___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  v6 = *(_DWORD *)(a1 + 56);
  +[GEORequestResponsePersistedEvent enumeratorBlockHelper:](GEORequestResponsePersistedEvent, "enumeratorBlockHelper:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v1;
  v9 = v7;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__77;
  v22 = __Block_byref_object_dispose__77;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __FindValuesOfType_block_invoke;
  v13[3] = &unk_1E1C01BC8;
  v10 = v8;
  v17 = v6;
  v14 = v10;
  v16 = &v18;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v10, "statementForKey:statementBlock:", CFSTR("FindValuesOfType"), v13);
  v12 = (void *)v19[5];
  if (v12)
    v4 = objc_retainAutorelease(v12);

  _Block_object_dispose(&v18, 8);
  objc_storeStrong(v3, v4);

}

- (id)enumerateEntriesOfType:(int)a3 inRange:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  GEOSQLiteDB *db;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__77;
  v24 = __Block_byref_object_dispose__77;
  v25 = 0;
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__GEORequestResponsePersister_enumerateEntriesOfType_inRange_withBlock___block_invoke;
  v15[3] = &unk_1E1C12CF8;
  v15[4] = self;
  v18 = &v20;
  v19 = a3;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __72__GEORequestResponsePersister_enumerateEntriesOfType_inRange_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v8 = *(_DWORD *)(a1 + 64);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v10 = (uint64_t)v9;
    v11 = *(void **)(a1 + 40);
    if (v11)
    {
      objc_msgSend(v11, "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      v22 = 0;
      v13 = (uint64_t)v12;
    }
    else
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      v22 = 1;
    }
  }
  else
  {
    v10 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v22 = 1;
  }
  +[GEORequestResponsePersistedEvent enumeratorBlockHelper:](GEORequestResponsePersistedEvent, "enumeratorBlockHelper:", *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  v16 = v14;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__77;
  v34 = __Block_byref_object_dispose__77;
  v35 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __FindValuesBetweenOfType_block_invoke;
  v23[3] = &unk_1E1C01DE0;
  v17 = v15;
  v29 = v8;
  v24 = v17;
  v26 = &v30;
  v27 = v10;
  v28 = v13;
  v18 = v16;
  v25 = v18;
  objc_msgSend(v17, "statementForKey:statementBlock:", CFSTR("FindValuesBetweenOfType"), v23);
  v19 = (void *)v31[5];
  if (v19)
    v6 = objc_retainAutorelease(v19);

  _Block_object_dispose(&v30, 8);
  objc_storeStrong(v5, v6);

  if ((v22 & 1) == 0)
  if (v2)

}

- (id)findRequest:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  GEOSQLiteDB *db;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__77;
  v21 = __Block_byref_object_dispose__77;
  v22 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__GEORequestResponsePersister_findRequest_withBlock___block_invoke;
  v13[3] = &unk_1E1C12CA8;
  v13[4] = self;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __53__GEORequestResponsePersister_findRequest_withBlock___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v1 = (void *)a1[5];
  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v3 + 40);
  v4 = (id *)(v3 + 40);
  v5 = v6;
  +[GEORequestResponsePersistedEvent enumeratorBlockHelper:](GEORequestResponsePersistedEvent, "enumeratorBlockHelper:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v2;
  v9 = v1;
  v10 = v7;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__77;
  v24 = __Block_byref_object_dispose__77;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __FindRequestById_block_invoke;
  v15[3] = &unk_1E1C01B28;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = &v20;
  v13 = v10;
  v18 = v13;
  objc_msgSend(v11, "statementForKey:statementBlock:", CFSTR("FindRequestById"), v15);
  v14 = (void *)v21[5];
  if (v14)
    v5 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v20, 8);
  objc_storeStrong(v4, v5);

}

- (id)findResponse:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  GEOSQLiteDB *db;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__77;
  v21 = __Block_byref_object_dispose__77;
  v22 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__GEORequestResponsePersister_findResponse_withBlock___block_invoke;
  v13[3] = &unk_1E1C12CA8;
  v13[4] = self;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __54__GEORequestResponsePersister_findResponse_withBlock___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v1 = (void *)a1[5];
  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v3 + 40);
  v4 = (id *)(v3 + 40);
  v5 = v6;
  +[GEORequestResponsePersistedEvent enumeratorBlockHelper:](GEORequestResponsePersistedEvent, "enumeratorBlockHelper:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v2;
  v9 = v1;
  v10 = v7;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__77;
  v24 = __Block_byref_object_dispose__77;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __FindResponseById_block_invoke;
  v15[3] = &unk_1E1C01B28;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = &v20;
  v13 = v10;
  v18 = v13;
  objc_msgSend(v11, "statementForKey:statementBlock:", CFSTR("FindResponseById"), v15);
  v14 = (void *)v21[5];
  if (v14)
    v5 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v20, 8);
  objc_storeStrong(v4, v5);

}

- (unint64_t)getTotalSize:(id *)a3
{
  GEOSQLiteDB *db;
  unint64_t v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__77;
  v16 = __Block_byref_object_dispose__77;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__GEORequestResponsePersister_getTotalSize___block_invoke;
  v7[3] = &unk_1E1C00788;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __44__GEORequestResponsePersister_getTotalSize___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t TotalSize;
  id obj;

  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  TotalSize = GetTotalSize(v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = TotalSize;
}

- (BOOL)runAllPruners:(id *)a3
{
  GEOSQLiteDB *db;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__77;
  v13 = __Block_byref_object_dispose__77;
  v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__GEORequestResponsePersister_runAllPruners___block_invoke;
  v8[3] = &unk_1E1BFF920;
  v8[4] = self;
  v8[5] = &v9;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] != 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __45__GEORequestResponsePersister_runAllPruners___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id obj;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend(v1, "_runAllPruners:", &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (BOOL)_runAllPruners:(id *)a3
{
  BOOL v5;

  v5 = -[GEORequestResponsePersister _pruneDBToDefaultAge:](self, "_pruneDBToDefaultAge:");
  return v5 & -[GEORequestResponsePersister _pruneDBToDefaultSize:](self, "_pruneDBToDefaultSize:", a3);
}

- (BOOL)pruneEntriesOlderThan:(id)a3 error:(id *)a4
{
  id v6;
  GEOSQLiteDB *db;
  BOOL v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  if (-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:", a4))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__77;
    v17 = __Block_byref_object_dispose__77;
    v18 = 0;
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__GEORequestResponsePersister_pruneEntriesOlderThan_error___block_invoke;
    v10[3] = &unk_1E1BFF8F8;
    v10[4] = self;
    v11 = v6;
    v12 = &v13;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v10);
    if (a4)
      *a4 = objc_retainAutorelease((id)v14[5]);
    v8 = v14[5] != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __59__GEORequestResponsePersister_pruneEntriesOlderThan_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_pruneEntriesOlderThan:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)pruneDBToDefaultAge:(id *)a3
{
  GEOSQLiteDB *db;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__77;
  v13 = __Block_byref_object_dispose__77;
  v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GEORequestResponsePersister_pruneDBToDefaultAge___block_invoke;
  v8[3] = &unk_1E1BFF920;
  v8[4] = self;
  v8[5] = &v9;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] != 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__GEORequestResponsePersister_pruneDBToDefaultAge___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id obj;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend(v1, "_pruneDBToDefaultAge:", &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (BOOL)_pruneDBToDefaultAge:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -GEOConfigGetDouble(GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitAge, (uint64_t)off_1EDF4D228));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = -[GEORequestResponsePersister _pruneEntriesOlderThan:error:](self, "_pruneEntriesOlderThan:error:", v6, a3);
  return (char)a3;
}

- (BOOL)_pruneEntriesOlderThan:(id)a3 error:(id *)a4
{
  GEOSQLiteDB *db;
  double v6;

  db = self->_db;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return DeleteOlderThan(db, a4, (uint64_t)v6);
}

- (BOOL)pruneDBToDefaultSize:(id *)a3
{
  GEOSQLiteDB *db;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__77;
  v13 = __Block_byref_object_dispose__77;
  v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__GEORequestResponsePersister_pruneDBToDefaultSize___block_invoke;
  v8[3] = &unk_1E1BFF920;
  v8[4] = self;
  v8[5] = &v9;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] != 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__GEORequestResponsePersister_pruneDBToDefaultSize___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id obj;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend(v1, "_pruneDBToDefaultSize:", &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (BOOL)_pruneDBToDefaultSize:(id *)a3
{
  return -[GEORequestResponsePersister _pruneDBToSize:error:](self, "_pruneDBToSize:error:", GEOConfigGetUInteger(GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitBytes, (uint64_t)off_1EDF4D218), a3);
}

- (BOOL)pruneDBToSize:(unint64_t)a3 error:(id *)a4
{
  GEOSQLiteDB *db;
  BOOL v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:", a4))
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__77;
  v15 = __Block_byref_object_dispose__77;
  v16 = 0;
  db = self->_db;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__GEORequestResponsePersister_pruneDBToSize_error___block_invoke;
  v10[3] = &unk_1E1C02460;
  v10[5] = &v11;
  v10[6] = a3;
  v10[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = v12[5] != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __51__GEORequestResponsePersister_pruneDBToSize_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v1 = a1[6];
  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_pruneDBToSize:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)_pruneDBToSize:(unint64_t)a3 error:(id *)a4
{
  GEOSQLiteDB *db;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t TotalSize;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  TotalSize = 0;
  TotalSize = GetTotalSize(self->_db, a4);
  if (v16[3] >= a3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__GEORequestResponsePersister__pruneDBToSize_error___block_invoke;
    v10[3] = &unk_1E1C12D20;
    v10[4] = &v11;
    v10[5] = &v15;
    v10[6] = a3;
    FindValuesBetween(db, a4, 0, 0x7FFFFFFFFFFFFFFFLL, v10);
    v8 = v12[3];
    if (v8 >= 1)
      DeleteOlderThan(self->_db, a4, v8);
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v15, 8);
  return 1;
}

BOOL __52__GEORequestResponsePersister__pruneDBToSize_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v7 = a1[6];
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(_QWORD *)(v8 + 24);
  if (v9 >= v7)
    *(_QWORD *)(v8 + 24) = v9 - a7;
  return v9 >= v7;
}

- (unsigned)restoreOrphanedEntries:(id *)a3
{
  GEOSQLiteDB *db;
  unsigned int v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:"))
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__77;
  v13 = __Block_byref_object_dispose__77;
  v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__GEORequestResponsePersister_restoreOrphanedEntries___block_invoke;
  v8[3] = &unk_1E1C00788;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __54__GEORequestResponsePersister_restoreOrphanedEntries___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_restoreOrphanedEntries:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (unsigned)_restoreOrphanedEntries:(id *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  GEOSQLiteDB *db;
  uint64_t v11;
  id v12;
  GEOSQLiteDB *v13;
  _QWORD *v14;
  GEOSQLiteDB *v15;
  _QWORD *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  GEORRRequestResponseEvent *v24;
  GEORRRequestResponseEvent *v25;
  GEOSQLiteDB *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  GEOSQLiteDB *v32;
  id v33;
  id v34;
  GEOSQLiteDB *v35;
  id v36;
  uint64_t *v37;
  id v38;
  id v39;
  id v40;
  void *v42;
  unsigned int v43;
  id obj;
  id v45;
  id v46;
  id v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];
  uint8_t v73[128];
  __int128 buf;
  void *v75;
  void *v76;
  GEOSQLiteDB *v77;
  id v78;
  uint64_t *v79;
  id v80;
  id v81;
  id v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  externalFileBaseURL(self->_db);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v51, 0, 21, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v5 = v42;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v63 != v7)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "lastPathComponent", v42);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "addObject:", v9);

          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        }
        while (v6);
      }

      if (objc_msgSend(v55, "count"))
      {
        db = self->_db;
        v11 = MEMORY[0x1E0C809B0];
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __55__GEORequestResponsePersister__restoreOrphanedEntries___block_invoke;
        v60[3] = &unk_1E1C12D48;
        v12 = v55;
        v61 = v12;
        v13 = db;
        v14 = v60;
        v66 = 0;
        v67 = &v66;
        v68 = 0x3032000000;
        v69 = __Block_byref_object_copy__77;
        v70 = __Block_byref_object_dispose__77;
        v71 = 0;
        *(_QWORD *)&buf = v11;
        *((_QWORD *)&buf + 1) = 3221225472;
        v75 = __logs_ExternalResources_Enumerate_block_invoke;
        v76 = &unk_1E1BFF998;
        v15 = v13;
        v77 = v15;
        v16 = v14;
        v78 = v16;
        v79 = &v66;
        v17 = -[GEOSQLiteDB statementForKey:statementBlock:](v15, "statementForKey:statementBlock:", CFSTR("logs_ExternalResources_Enumerate"), &buf);
        if (a3)
        {
          v18 = (void *)v67[5];
          if (v18)
            *a3 = objc_retainAutorelease(v18);
        }

        _Block_object_dispose(&v66, 8);
        if (v17 && objc_msgSend(v12, "count"))
        {
          -[GEOSQLiteDB log](self->_db, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = objc_msgSend(v12, "count");
            LODWORD(buf) = 134349056;
            *(_QWORD *)((char *)&buf + 4) = v20;
            _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "Restoring %{public}llu files which were no longer referenced by the database", (uint8_t *)&buf, 0xCu);
          }

          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          obj = v12;
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
          if (v52)
          {
            v43 = 0;
            v50 = *(_QWORD *)v57;
LABEL_20:
            v21 = 0;
            while (1)
            {
              if (*(_QWORD *)v57 != v50)
                objc_enumerationMutation(obj);
              objc_msgSend(v51, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v21), v42);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v22)
                goto LABEL_35;
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v22, 0, 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v23, "length"))
                goto LABEL_29;
              v24 = -[GEORRRequestResponseEvent initWithData:]([GEORRRequestResponseEvent alloc], "initWithData:", v23);
              v25 = v24;
              if (!v24)
                break;
              v26 = self->_db;
              v49 = -[GEORRRequestResponseEvent timestamp](v24, "timestamp");
              v48 = -[GEORRRequestResponseEvent requestType](v25, "requestType");
              -[GEORRRequestResponseEvent appId](v25, "appId");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEORRRequestResponseEvent eventId](v25, "eventId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEORRRequestResponseEvent url](v25, "url");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEORRRequestResponseEvent data](v25, "data");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v53, "length");
              -[GEORRRequestResponseEvent error](v25, "error");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v26;
              v33 = v27;
              v34 = v28;
              v45 = v29;
              v46 = v22;
              v47 = v31;
              v66 = 0;
              v67 = &v66;
              v68 = 0x3032000000;
              v69 = __Block_byref_object_copy__77;
              v70 = __Block_byref_object_dispose__77;
              v71 = 0;
              *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
              *((_QWORD *)&buf + 1) = 3221225472;
              v75 = __RestoreValue_block_invoke;
              v76 = &unk_1E1C12D70;
              v35 = v32;
              v83 = &v66;
              v84 = v49;
              v77 = v35;
              v86 = v48;
              v36 = v33;
              v78 = v36;
              v37 = (uint64_t *)v34;
              v79 = v37;
              v38 = v45;
              v80 = v38;
              v85 = v30;
              v39 = v46;
              v81 = v39;
              v40 = v47;
              v82 = v40;
              LOBYTE(v49) = -[GEOSQLiteDB executeStatement:statementBlock:](v35, "executeStatement:statementBlock:", CFSTR("RestoreValue"), &buf);

              _Block_object_dispose(&v66, 8);
              if ((v49 & 1) == 0)
                break;

              ++v43;
LABEL_30:

              if (v52 == ++v21)
              {
                v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
                if (v52)
                  goto LABEL_20;
                goto LABEL_36;
              }
            }

LABEL_29:
            -[GEOSQLiteDB deleteExternalResourceAtURL:error:](self->_db, "deleteExternalResourceAtURL:error:", v22, 0);
            goto LABEL_30;
          }
LABEL_35:
          v43 = 0;
LABEL_36:

        }
        else
        {
          v43 = 0;
        }

      }
      else
      {
        v43 = 0;
      }

    }
    else
    {
      v43 = 0;
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

uint64_t __55__GEORequestResponsePersister__restoreOrphanedEntries___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruneTimer, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
