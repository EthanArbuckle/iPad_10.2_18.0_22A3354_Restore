@implementation MSPerformanceLogger

- (void)_logSqliteErrorLine:(int)a3
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 136446722;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/coremediastream/MSPerformanceLogger.m";
    v7 = 1024;
    v8 = a3;
    v9 = 2082;
    v10 = sqlite3_errmsg(-[MSASModelBase dbQueueDB](self, "dbQueueDB"));
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s:%d: SQL operation failed: %{public}s", (uint8_t *)&v5, 0x1Cu);
  }
}

- (MSPerformanceLogger)init
{
  void *v3;
  MSPerformanceLogger *v4;
  objc_super v6;

  MSPathPerfDB();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MSPerformanceLogger;
  v4 = -[MSASModelBase initWithPersonID:databasePath:currentVersion:](&v6, sel_initWithPersonID_databasePath_currentVersion_, 0, v3, 0);

  return v4;
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  char *errmsg;
  objc_super v12;
  uint8_t buf[4];
  _BYTE v14[10];
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MSPerformanceLogger;
  v7 = -[MSASModelBase dbQueueUpgradeFromDatabaseVersion:currentVersion:](&v12, sel_dbQueueUpgradeFromDatabaseVersion_currentVersion_);
  if (!v7)
    return v7;
  if (a3 < 0)
  {
    errmsg = 0;
    if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "pragma journal_mode = wal;", 0, 0, &errmsg)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v14 = self;
      *(_WORD *)&v14[8] = 2082;
      v15 = errmsg;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not set journal mode. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists PerfLog (\n   rowid       integer primary key asc autoincrement,\n   operation   text,\n   GUID        text,\n   event       text,\n   timestamp   float);",
           0,
           0,
           &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v14 = errmsg;
        v8 = MEMORY[0x1E0C81028];
        v9 = "Could not create performance log. Error: %{public}s";
LABEL_18:
        _os_log_error_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
      }
    }
    else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists PerfLogByGUID on PerfLog (GUID asc, operation asc);",
                0,
                0,
                &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v14 = errmsg;
        v8 = MEMORY[0x1E0C81028];
        v9 = "Could not create performance log index. Error: %{public}s";
        goto LABEL_18;
      }
    }
    else
    {
      if (!sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
        return v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v14 = errmsg;
        v8 = MEMORY[0x1E0C81028];
        v9 = "Could not analyze performance log database. Ignoring. Error: %{public}s";
        goto LABEL_18;
      }
    }
    sqlite3_free(errmsg);
    return v7;
  }
  if (a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v14 = a3;
    *(_WORD *)&v14[4] = 1024;
    *(_DWORD *)&v14[6] = a4;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot migrate performance log database from version %d to %d. Recreating.", buf, 0xEu);
  }
  return v7;
}

- (void)startOperation:(id)a3 itemGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  MSPlatform();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MSPlatform();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPerformanceLoggingEnabled");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASModelBase dbQueue](self, "dbQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__MSPerformanceLogger_startOperation_itemGUID___block_invoke;
      v14[3] = &unk_1E95BCE58;
      v14[4] = self;
      v15 = v6;
      v16 = v7;
      v17 = v11;
      v13 = v11;
      dispatch_async(v12, v14);

    }
  }
  else
  {

  }
}

- (void)stopOperation:(id)a3 itemGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  MSPlatform();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MSPlatform();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPerformanceLoggingEnabled");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASModelBase dbQueue](self, "dbQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__MSPerformanceLogger_stopOperation_itemGUID___block_invoke;
      v14[3] = &unk_1E95BCE58;
      v14[4] = self;
      v15 = v6;
      v16 = v7;
      v17 = v11;
      v13 = v11;
      dispatch_async(v12, v14);

    }
  }
  else
  {

  }
}

- (void)dbQueueDiscardOperation:(id)a3 itemGUID:(id)a4
{
  id v6;
  sqlite3_stmt *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  id v14;

  v14 = a4;
  v6 = a3;
  v7 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from PerfLog where operation = ? and GUID = ?;"));
  v8 = MSSqliteBindStringOrNull(v7, 1, v6);

  MSSqliteTrapForDBLockError(v8);
  if ((_DWORD)v8)
  {
    v9 = 149;
  }
  else
  {
    v10 = MSSqliteBindStringOrNull(v7, 2, v14);
    v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (v11)
    {
      v9 = 150;
    }
    else
    {
      v12 = sqlite3_step(v7);
      v13 = v12;
      MSSqliteTrapForDBLockError(v12);
      if (v13 == 101)
        goto LABEL_8;
      v9 = 151;
    }
  }
  -[MSPerformanceLogger _logSqliteErrorLine:](self, "_logSqliteErrorLine:", v9);
LABEL_8:
  if (v7)
    sqlite3_reset(v7);

}

- (void)discardOperation:(id)a3 itemGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %{public}@ Discarding measurements.", buf, 0x16u);
  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSPerformanceLogger_discardOperation_itemGUID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)summarizeOperation:(id)a3 itemGUID:(id)a4 formatBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  MSPlatform();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MSPlatform();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPerformanceLoggingEnabled");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASModelBase dbQueue](self, "dbQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MSPerformanceLogger_summarizeOperation_itemGUID_formatBlock___block_invoke;
      block[3] = &unk_1E95BC900;
      block[4] = self;
      v18 = v8;
      v19 = v9;
      v20 = v14;
      v21 = v10;
      v16 = v14;
      dispatch_async(v15, block);

    }
  }
  else
  {

  }
}

uint64_t __63__MSPerformanceLogger_summarizeOperation_itemGUID_formatBlock___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  sqlite3 *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[24];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select event, timestamp from PerfLog where operation = ? and GUID = ? order by rowid asc;"));
  v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    v5 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 178;
  }
  else
  {
    v8 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    v9 = v8;
    MSSqliteTrapForDBLockError(v8);
    if (!v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v36 = 138543618;
        *(_QWORD *)&v36[4] = v11;
        *(_WORD *)&v36[12] = 2114;
        *(_QWORD *)&v36[14] = v12;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Summarizing %{public}@ - %{public}@", v36, 0x16u);
      }
      v13 = 0;
      v14 = 0;
      v15 = 0.0;
      v16 = 0.0;
      while (1)
      {
        v17 = v13;
        v18 = sqlite3_step(v2);
        if (v18 != 100)
          break;
        MSSqliteStringFromStatementColumn(v2, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        MSSqliteDateFromTimeIntervalStatementColumn(v2, 1);
        v20 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v20;
        if (!v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v32 = *(_QWORD *)(a1 + 40);
            v33 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)v36 = 138543618;
            *(_QWORD *)&v36[4] = v32;
            *(_WORD *)&v36[12] = 2114;
            *(_QWORD *)&v36[14] = v33;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ Perf log entry missing event indicator. Aborting.", v36, 0x16u);
          }

          v19 = 0;
          goto LABEL_44;
        }
        if (!v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v24 = *(_QWORD *)(a1 + 40);
            v25 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)v36 = 138543618;
            *(_QWORD *)&v36[4] = v24;
            *(_WORD *)&v36[12] = 2114;
            *(_QWORD *)&v36[14] = v25;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ Perf log entry missing facility indicator. Aborting.", v36, 0x16u);
          }
          goto LABEL_44;
        }
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("start")))
        {
          if (v14)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v26 = *(_QWORD *)(a1 + 40);
              v27 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)v36 = 138543618;
              *(_QWORD *)&v36[4] = v26;
              *(_WORD *)&v36[12] = 2114;
              *(_QWORD *)&v36[14] = v27;
              v28 = MEMORY[0x1E0C81028];
              v29 = "%{public}@ - %{public}@ Unexpected start event. Aborting.";
              goto LABEL_40;
            }
            goto LABEL_43;
          }
          if (v17)
          {
            objc_msgSend(v13, "timeIntervalSinceDate:", v17);
            v16 = v16 + v21;
          }
          v14 = 1;
        }
        else
        {
          if (!objc_msgSend(v19, "isEqualToString:", CFSTR("stop")))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v34 = *(_QWORD *)(a1 + 40);
              v35 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)v36 = 138543874;
              *(_QWORD *)&v36[4] = v34;
              *(_WORD *)&v36[12] = 2114;
              *(_QWORD *)&v36[14] = v35;
              *(_WORD *)&v36[22] = 2114;
              v37 = v19;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ Unknown event type “%{public}@”. Aborting.", v36, 0x20u);
            }
            goto LABEL_43;
          }
          if (v14 != 1)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v30 = *(_QWORD *)(a1 + 40);
              v31 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)v36 = 138543618;
              *(_QWORD *)&v36[4] = v30;
              *(_WORD *)&v36[12] = 2114;
              *(_QWORD *)&v36[14] = v31;
              v28 = MEMORY[0x1E0C81028];
              v29 = "%{public}@ - %{public}@ Unexpected stop event. Aborting.";
LABEL_40:
              _os_log_impl(&dword_1D3E94000, v28, OS_LOG_TYPE_INFO, v29, v36, 0x16u);
            }
LABEL_43:

LABEL_44:
            goto LABEL_45;
          }
          if (v17)
          {
            objc_msgSend(v13, "timeIntervalSinceDate:", v17);
            v14 = 0;
            v15 = v15 + v22;
          }
          else
          {
            v14 = 0;
          }
        }

      }
      if (v18 == 101)
      {
        if (v14 == 1 && v13)
        {
          objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceDate:", v13);
          v15 = v15 + v23;
        }
        (*(void (**)(double, double))(*(_QWORD *)(a1 + 64) + 16))(v15, v16);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_logSqliteErrorLine:", 232);
      }
LABEL_45:

      if (v2)
        goto LABEL_6;
      return objc_msgSend(*(id *)(a1 + 32), "dbQueueDiscardOperation:itemGUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_OWORD *)v36, *(_QWORD *)&v36[16]);
    }
    v5 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 179;
  }
  MSLogSqliteError(v5, v6, v7);
  if (v2)
LABEL_6:
    sqlite3_reset(v2);
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueDiscardOperation:itemGUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_OWORD *)v36, *(_QWORD *)&v36[16]);
}

uint64_t __49__MSPerformanceLogger_discardOperation_itemGUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueDiscardOperation:itemGUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __46__MSPerformanceLogger_stopOperation_itemGUID___block_invoke(id *a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  double v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(a1[4], "statementForString:", CFSTR("insert into PerfLog (operation, GUID, event, timestamp) values (?, ?, ?, ?);"));
  v3 = MSSqliteBindStringOrNull(v2, 1, a1[5]);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    v5 = a1[4];
    v6 = 134;
LABEL_13:
    objc_msgSend(v5, "_logSqliteErrorLine:", v6);
    goto LABEL_14;
  }
  v7 = MSSqliteBindStringOrNull(v2, 2, a1[6]);
  v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8)
  {
    v5 = a1[4];
    v6 = 135;
    goto LABEL_13;
  }
  v9 = sqlite3_bind_text(v2, 3, "stop", -1, 0);
  v10 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (v10)
  {
    v5 = a1[4];
    v6 = 136;
    goto LABEL_13;
  }
  objc_msgSend(a1[7], "timeIntervalSinceReferenceDate");
  v12 = sqlite3_bind_double(v2, 4, v11);
  v13 = v12;
  MSSqliteTrapForDBLockError(v12);
  if (v13)
  {
    v5 = a1[4];
    v6 = 137;
    goto LABEL_13;
  }
  v14 = sqlite3_step(v2);
  v15 = v14;
  MSSqliteTrapForDBLockError(v14);
  if (v15 != 101)
  {
    v5 = a1[4];
    v6 = 138;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v16 = a1[5];
    v17 = a1[6];
    v18 = 138543618;
    v19 = v16;
    v20 = 2114;
    v21 = v17;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Stop %{public}@ - %{public}@", (uint8_t *)&v18, 0x16u);
  }
LABEL_14:
  if (v2)
    sqlite3_reset(v2);
}

void __47__MSPerformanceLogger_startOperation_itemGUID___block_invoke(id *a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  double v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(a1[4], "statementForString:", CFSTR("insert into PerfLog (operation, GUID, event, timestamp) values (?, ?, ?, ?);"));
  v3 = MSSqliteBindStringOrNull(v2, 1, a1[5]);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
    goto LABEL_8;
  v5 = MSSqliteBindStringOrNull(v2, 2, a1[6]);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
    goto LABEL_8;
  v7 = sqlite3_bind_text(v2, 3, "start", -1, 0);
  v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8
    || (objc_msgSend(a1[7], "timeIntervalSinceReferenceDate"),
        v10 = sqlite3_bind_double(v2, 4, v9),
        v11 = v10,
        MSSqliteTrapForDBLockError(v10),
        v11)
    || (v12 = sqlite3_step(v2), v13 = v12, MSSqliteTrapForDBLockError(v12), v13 != 101))
  {
LABEL_8:
    objc_msgSend(a1[4], "_logSqliteErrorLine:", 122);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v14 = a1[5];
    v15 = a1[6];
    v16 = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Start %{public}@ - %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (v2)
    sqlite3_reset(v2);
}

+ (id)sharedLogger
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  MSPerformanceLogger *v6;

  MSPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  MSPlatform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPerformanceLoggingEnabled");

  v5 = (void *)logger;
  if (v4 && !logger)
  {
    v6 = objc_alloc_init(MSPerformanceLogger);
    v2 = (void *)logger;
    logger = (uint64_t)v6;
LABEL_5:

    v5 = (void *)logger;
  }
  return v5;
}

+ (void)nukeCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = v3;
  v5 = (void *)logger;
  if (logger)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__MSPerformanceLogger_nukeCompletionBlock___block_invoke;
    v9[3] = &unk_1E95BC8D8;
    v10 = v3;
    objc_msgSend(v5, "shutDownForDestruction:completionBlock:", 1, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathPerfDB();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtPath:error:", v7, 0);

    if (v4)
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, v4);

    }
  }

}

void __43__MSPerformanceLogger_nukeCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = (void *)logger;
  logger = 0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathPerfDB();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, v5);

  }
}

@end
