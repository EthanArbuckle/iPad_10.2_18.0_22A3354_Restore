@implementation MNTraceRecorder

- (MNTraceRecorder)init
{
  MNTraceRecorder *v2;
  MNTraceRecorder *v3;
  MNTraceRecorder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNTraceRecorder;
  v2 = -[MNTraceRecorder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastPauseSpokenAudio = 0;
    v2->_lastVoiceGuidanceSetting = -1;
    v2->_lastLaneEventHash = 0;
    v4 = v2;
  }

  return v3;
}

- (void)startWritingTraceToPath:(id)a3 traceType:(int64_t)a4 withErrorHandler:(id)a5
{
  char *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  MNTrace *v14;
  MNTrace *trace;
  NSDate *v16;
  NSDate *recordingStartDate;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  char *v25;
  MNTraceRecorder *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a5;
  if (self->_trace)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startWritingTraceToPath: called when trace was already created"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "_trace == nil";
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v11 = -[MNTraceRecorder _isTracePathValid:](self, "_isTracePathValid:", v9);
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v31 = v9;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Start writing trace to path: %{private}@", buf, 0xCu);
    }

    v14 = objc_alloc_init(MNTrace);
    trace = self->_trace;
    self->_trace = v14;

    objc_storeStrong((id *)&self->_tracePath, a3);
    self->_traceType = a4;
    if (!self->_recordingStartDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
      recordingStartDate = self->_recordingStartDate;
      self->_recordingStartDate = v16;

    }
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, "Setting recording start time to current time", buf, 2u);
    }

    -[MNTrace writeQueue](self->_trace, "writeQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke;
    block[3] = &unk_1E61D2850;
    v25 = v9;
    v26 = self;
    v27 = v10;
    dispatch_async(v19, block);

    v20 = v25;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v31 = v9;
    _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "Error opening trace recorder due to invalid path: %{private}@", buf, 0xCu);
  }

  if (v10)
  {
    v28[0] = *MEMORY[0x1E0CB2D50];
    v28[1] = CFSTR("path");
    v29[0] = CFSTR("Invalid path");
    v29[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNTraceErrorDomain"), 10, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v21);

LABEL_14:
  }

}

void __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      v20 = v5;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "File already exists at path: %{private}@. Attempting to append", buf, 0xCu);
    }

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "startWritingTraceToPath:", *(_QWORD *)(a1 + 32)))
  {
    v6 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v6, "_updateForExistingTrace");
    }
    else
    {
      objc_msgSend(v6, "_initializeTraceDB");
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 56);
      objc_msgSend(*(id *)(v12 + 32), "timeIntervalSinceReferenceDate");
      objc_msgSend(v13, "bindParameter:double:", CFSTR(":recording_start_time"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "execute");
    }
    objc_msgSend(*(id *)(a1 + 40), "_prepareStatements");
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("Failed to begin writing trace to file.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNTraceErrorDomain"), 8, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke_27;
    v14[3] = &unk_1E61D16E0;
    v10 = *(id *)(a1 + 48);
    v15 = v8;
    v16 = v10;
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

uint64_t __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)saveTraceWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *tracePath;
  id v7;
  id errorHandler;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "!_closed";
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    tracePath = self->_tracePath;
    *(_DWORD *)buf = 138477827;
    v14 = (const char *)tracePath;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Closing trace: %{private}@", buf, 0xCu);
  }

  self->_closed = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MNTraceRecorder_saveTraceWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E61D1CE8;
  v11[4] = self;
  v12 = v4;
  v7 = v4;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

}

void __50__MNTraceRecorder_saveTraceWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_closeTraceDB");
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C99928];
    v7 = *MEMORY[0x1E0C99938];
    v16 = 0;
    v8 = -[NSObject setResourceValue:forKey:error:](v5, "setResourceValue:forKey:error:", v6, v7, &v16);
    v9 = v16;
    v10 = v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 0;
    if (!v11)
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        v18 = v10;
        v19 = 2113;
        v20 = v2;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Failed applying file protection to %{public}@, error: %{private}@", buf, 0x16u);
      }

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v2;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Failed applying file protection to %{public}@, error: File not found", buf, 0xCu);
    }
  }

  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138477827;
    v18 = v14;
    _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Finished closing trace: %{private}@", buf, 0xCu);
  }

  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

- (void)saveTraceSynchronously
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "!_closed";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v7, 0x16u);
    }

  }
  -[MNTraceRecorder saveTraceWithCompletionHandler:](self, "saveTraceWithCompletionHandler:", 0);
  -[MNTraceRecorder trace](self, "trace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_dispatchWrite:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[MNTraceRecorder trace](self, "trace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeGroup");
  v6 = objc_claimAutoreleasedReturnValue();
  -[MNTraceRecorder trace](self, "trace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__MNTraceRecorder__dispatchWrite___block_invoke;
  v10[3] = &unk_1E61D1CE8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_group_async(v6, v8, v10);

}

void __34__MNTraceRecorder__dispatchWrite___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "trace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "db");

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_logSqliteErrorWithResult:(int)a3 file:(const char *)a4 line:(int)a5
{
  NSObject *v9;
  void *v10;
  id errorHandler;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[MNTraceRecorder trace](self, "trace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136446978;
    v13 = a4;
    v14 = 1024;
    v15 = a5;
    v16 = 1024;
    v17 = a3;
    v18 = 2082;
    v19 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v10, "db"));
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%d  SQL error: (%d) %{public}s", (uint8_t *)&v12, 0x22u);

  }
  if (!self->_corrupted)
  {
    self->_corrupted = 1;
    errorHandler = self->_errorHandler;
    if (errorHandler)
      dispatch_async(MEMORY[0x1E0C80D38], errorHandler);
  }
}

- (BOOL)_isTracePathValid:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB38E8];
  v4 = a3;
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("[\n\x00\\\\]+"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v6 == 0;
}

- (void)_initializeTraceDB
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  sqlite3_stmt *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  MNTraceRecorder *v25;
  uint64_t v26;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_corrupted)
  {
    +[MNTrace mainSchema](MNTrace, "mainSchema");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Failed to load SQL setup script.", buf, 2u);
      }

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Trace DB successfully initialized.", buf, 2u);
    }

    v6 = objc_retainAutorelease(v3);
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    -[MNTraceRecorder trace](self, "trace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = sqlite3_exec((sqlite3 *)objc_msgSend(v8, "db"), v7, 0, 0, 0);

    if ((_DWORD)v7)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
        *(_DWORD *)buf = 136315138;
        v29 = v10;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error executing trace schema: \"%s\", buf, 0xCu);
      }

    }
    -[MNTraceRecorder trace](self, "trace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_db_config((sqlite3 *)objc_msgSend(v11, "db"), 1002, 1, 0);

    if (-[MNTraceRecorder _recordInfo](self, "_recordInfo"))
    {
      ppStmt = 0;
      -[MNTraceRecorder trace](self, "trace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = sqlite3_prepare_v2((sqlite3 *)objc_msgSend(v12, "db"), "INSERT OR IGNORE INTO navigation_event_types (event_id, event_name) VALUES (?, ?)", 81, &ppStmt, 0);

      if (v13)
      {
        GEOFindOrCreateLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
          *(_DWORD *)buf = 136315138;
          v29 = v15;
        }

LABEL_17:
        sqlite3_finalize(ppStmt);
      }
      else
      {
        v16 = 0;
        while (1)
        {
          MNTraceNavigationEventTypeAsString(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = sqlite3_bind_int(ppStmt, 1, v16);
          if ((_DWORD)v18)
          {
            v24 = v18;
            v25 = self;
            v26 = 284;
            goto LABEL_29;
          }
          v19 = ppStmt;
          v20 = objc_retainAutorelease(v17);
          v21 = sqlite3_bind_text(v19, 2, (const char *)objc_msgSend(v20, "UTF8String"), -1, 0);
          if ((_DWORD)v21)
            break;
          if (sqlite3_step(ppStmt) != 101)
          {
            GEOFindOrCreateLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
              *(_DWORD *)buf = 136315138;
              v29 = v23;
            }

          }
          sqlite3_reset(ppStmt);

          if (++v16 == 30)
            goto LABEL_17;
        }
        v24 = v21;
        v25 = self;
        v26 = 285;
LABEL_29:
        -[MNTraceRecorder _logSqliteErrorWithResult:file:line:](v25, "_logSqliteErrorWithResult:file:line:", v24, "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m", v26);

      }
    }

  }
}

- (void)_updateForExistingTrace
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  NSObject *v6;
  const char *v7;
  sqlite3_stmt *v8;
  NSDate *v9;
  NSDate *recordingStartDate;
  NSObject *v11;
  NSDate *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  sqlite3_stmt *v19;
  sqlite3_stmt *pStmt;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[MNTrace db](self->_trace, "db"), "SELECT cl_timestamp FROM locations ORDER BY db_timestamp ASC LIMIT 1", -1, &ppStmt, 0))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      return;
    }
    v4 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
    *(_DWORD *)buf = 136315138;
    v23 = (void *)v4;
LABEL_4:
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
    goto LABEL_5;
  }
  if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(ppStmt, 0));
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    recordingStartDate = self->_recordingStartDate;
    self->_recordingStartDate = v9;

    sqlite3_finalize(ppStmt);
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_recordingStartDate;
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Trace recorder updating existing trace file. Recording start time set to: %@", buf, 0xCu);
    }

    pStmt = 0;
    if (sqlite3_prepare_v2(-[MNTrace db](self->_trace, "db"), "SELECT id FROM directions ORDER BY id DESC LIMIT 1", -1, &pStmt, 0))
    {
      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v13 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
      *(_DWORD *)buf = 136315138;
      v23 = (void *)v13;
      goto LABEL_4;
    }
    if ((sqlite3_step(pStmt) - 102) > 0xFFFFFFFD)
    {
      self->_routeRequestCount = sqlite3_column_int(pStmt, 0);
      sqlite3_finalize(pStmt);
      v19 = 0;
      if (sqlite3_prepare_v2(-[MNTrace db](self->_trace, "db"), "SELECT id FROM eta_traffic_updates ORDER BY id DESC LIMIT 1", -1, &v19, 0))
      {
        GEOFindOrCreateLog();
        v3 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        v16 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
        *(_DWORD *)buf = 136315138;
        v23 = (void *)v16;
        goto LABEL_4;
      }
      if ((sqlite3_step(v19) - 102) > 0xFFFFFFFD)
      {
        self->_etaTrafficUpdateCount = sqlite3_column_int(v19, 0);
      }
      else
      {
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
          *(_DWORD *)buf = 136315138;
          v23 = (void *)v18;
        }

      }
      v8 = v19;
    }
    else
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
        *(_DWORD *)buf = 136315138;
        v23 = (void *)v15;
      }

      v8 = pStmt;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sqlite3_errmsg(-[MNTrace db](self->_trace, "db"));
      *(_DWORD *)buf = 136315138;
      v23 = (void *)v7;
    }

    v8 = ppStmt;
  }
  sqlite3_finalize(v8);
}

- (BOOL)_recordInfo
{
  MNTrace *trace;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  char v8;
  void *v9;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  trace = self->_trace;
  v13 = 0;
  -[MNTrace prepareStatement:outError:](trace, "prepareStatement:outError:", CFSTR("INSERT INTO info (trace_type, version, original_version, recording_start_time, directions_url) VALUES (:trace_type, :version, :original_version, :recording_start_time, :directions_url)"), &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = "-[MNTraceRecorder _recordInfo]";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
      v18 = 1024;
      v19 = 361;
      v20 = 2080;
      v21 = "NO";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "bindParameter:int:", CFSTR(":trace_type"), LODWORD(self->_traceType));
    objc_msgSend(v4, "bindParameter:int:", CFSTR(":version"), +[MNTrace currentVersion](MNTrace, "currentVersion"));
    objc_msgSend(v4, "bindParameter:int:", CFSTR(":original_version"), +[MNTrace currentVersion](MNTrace, "currentVersion"));
    -[NSDate timeIntervalSinceReferenceDate](self->_recordingStartDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "bindParameter:double:", CFSTR(":recording_start_time"));
    objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "directionsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "absoluteString");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v7, "length"))
      objc_msgSend(v4, "bindParameter:string:", CFSTR(":directions_url"), v7);
    v8 = objc_msgSend(v4, "execute");
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording info statement."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = "-[MNTraceRecorder _recordInfo]";
        v16 = 2080;
        v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
        v18 = 1024;
        v19 = 377;
        v20 = 2080;
        v21 = "success";
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    objc_msgSend(v4, "finalize");
  }

  return v8;
}

- (void)_prepareStatements
{
  MNTrace *trace;
  MNTracePreparedStatement *v4;
  id v5;
  MNTracePreparedStatement *updateRecordingStartTimeStatement;
  void *v7;
  NSObject *v8;
  MNTrace *v9;
  MNTracePreparedStatement *v10;
  MNTracePreparedStatement *updateDirectionsStartTimeStatement;
  MNTrace *v12;
  MNTracePreparedStatement *v13;
  MNTracePreparedStatement *updateNavigationStartTimeStatement;
  MNTrace *v15;
  MNTracePreparedStatement *v16;
  MNTracePreparedStatement *updateNavigationEndTimeStatement;
  MNTrace *v18;
  MNTracePreparedStatement *v19;
  MNTracePreparedStatement *recordEnvironmentInfoStatement;
  MNTrace *v21;
  MNTracePreparedStatement *v22;
  MNTracePreparedStatement *recordDebugSettingStatement;
  MNTrace *v24;
  MNTracePreparedStatement *v25;
  MNTracePreparedStatement *recordAudioSettingStatement;
  MNTrace *v27;
  MNTracePreparedStatement *v28;
  MNTracePreparedStatement *recordStylesheetStatement;
  MNTrace *v30;
  MNTracePreparedStatement *v31;
  MNTracePreparedStatement *recordLocationStatement;
  MNTrace *v33;
  MNTracePreparedStatement *v34;
  MNTracePreparedStatement *recordLocationErrorStatement;
  MNTrace *v36;
  MNTracePreparedStatement *v37;
  MNTracePreparedStatement *recordMatchInfoStatement;
  MNTrace *v39;
  MNTracePreparedStatement *v40;
  MNTracePreparedStatement *recordDirectionsStatement;
  MNTrace *v42;
  MNTracePreparedStatement *v43;
  MNTracePreparedStatement *recordETAUStatement;
  MNTrace *v45;
  MNTracePreparedStatement *v46;
  MNTracePreparedStatement *recordRealtimeTransitUpdateRequest;
  MNTrace *v48;
  MNTracePreparedStatement *v49;
  MNTracePreparedStatement *recordRealtimeTransitUpdateResponse;
  MNTrace *v51;
  MNTracePreparedStatement *v52;
  MNTracePreparedStatement *recordRealtimeTransitUpdateResponseError;
  MNTrace *v54;
  MNTracePreparedStatement *v55;
  MNTracePreparedStatement *recordVehicleSpeed;
  MNTrace *v57;
  MNTracePreparedStatement *v58;
  MNTracePreparedStatement *recordVehicleHeading;
  MNTrace *v60;
  MNTracePreparedStatement *v61;
  MNTracePreparedStatement *recordMotionData;
  MNTrace *v63;
  MNTracePreparedStatement *v64;
  MNTracePreparedStatement *recordCompassHeading;
  MNTrace *v66;
  MNTracePreparedStatement *v67;
  MNTracePreparedStatement *recordVirtualGarageVehicleState;
  MNTrace *v69;
  MNTracePreparedStatement *v70;
  MNTracePreparedStatement *recordNavigationEvent;
  MNTrace *v72;
  MNTracePreparedStatement *v73;
  MNTracePreparedStatement *recordNavigationUpdate;
  MNTrace *v75;
  MNTracePreparedStatement *v76;
  MNTracePreparedStatement *updateNavigationEventLocationID;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  if (!self->_corrupted)
  {
    trace = self->_trace;
    v101 = 0;
    -[MNTrace prepareStatement:outError:](trace, "prepareStatement:outError:", CFSTR("UPDATE info SET recording_start_time = :recording_start_time"), &v101);
    v4 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
    v5 = v101;
    updateRecordingStartTimeStatement = self->_updateRecordingStartTimeStatement;
    self->_updateRecordingStartTimeStatement = v4;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v103 = "-[MNTraceRecorder _prepareStatements]";
        v104 = 2080;
        v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
        v106 = 1024;
        v107 = 395;
        v108 = 2080;
        v109 = "NO";
        v110 = 2112;
        v111 = v7;
LABEL_74:
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    else
    {
      v9 = self->_trace;
      v100 = 0;
      -[MNTrace prepareStatement:outError:](v9, "prepareStatement:outError:", CFSTR("UPDATE info SET directions_start_time = :directions_start_time"), &v100);
      v10 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
      v5 = v100;
      updateDirectionsStartTimeStatement = self->_updateDirectionsStartTimeStatement;
      self->_updateDirectionsStartTimeStatement = v10;

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v103 = "-[MNTraceRecorder _prepareStatements]";
          v104 = 2080;
          v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
          v106 = 1024;
          v107 = 396;
          v108 = 2080;
          v109 = "NO";
          v110 = 2112;
          v111 = v7;
          goto LABEL_74;
        }
      }
      else
      {
        v12 = self->_trace;
        v99 = 0;
        -[MNTrace prepareStatement:outError:](v12, "prepareStatement:outError:", CFSTR("UPDATE info SET navigation_start_time = :navigation_start_time"), &v99);
        v13 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
        v5 = v99;
        updateNavigationStartTimeStatement = self->_updateNavigationStartTimeStatement;
        self->_updateNavigationStartTimeStatement = v13;

        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v103 = "-[MNTraceRecorder _prepareStatements]";
            v104 = 2080;
            v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
            v106 = 1024;
            v107 = 397;
            v108 = 2080;
            v109 = "NO";
            v110 = 2112;
            v111 = v7;
            goto LABEL_74;
          }
        }
        else
        {
          v15 = self->_trace;
          v98 = 0;
          -[MNTrace prepareStatement:outError:](v15, "prepareStatement:outError:", CFSTR("UPDATE info SET navigation_end_time = :navigation_end_time"), &v98);
          v16 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
          v5 = v98;
          updateNavigationEndTimeStatement = self->_updateNavigationEndTimeStatement;
          self->_updateNavigationEndTimeStatement = v16;

          if (v5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            GEOFindOrCreateLog();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v103 = "-[MNTraceRecorder _prepareStatements]";
              v104 = 2080;
              v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
              v106 = 1024;
              v107 = 398;
              v108 = 2080;
              v109 = "NO";
              v110 = 2112;
              v111 = v7;
              goto LABEL_74;
            }
          }
          else
          {
            v18 = self->_trace;
            v97 = 0;
            -[MNTrace prepareStatement:outError:](v18, "prepareStatement:outError:", CFSTR("INSERT INTO environment_info (name, value) VALUES (?, ?)"), &v97);
            v19 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
            v5 = v97;
            recordEnvironmentInfoStatement = self->_recordEnvironmentInfoStatement;
            self->_recordEnvironmentInfoStatement = v19;

            if (v5)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              GEOFindOrCreateLog();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v103 = "-[MNTraceRecorder _prepareStatements]";
                v104 = 2080;
                v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                v106 = 1024;
                v107 = 399;
                v108 = 2080;
                v109 = "NO";
                v110 = 2112;
                v111 = v7;
                goto LABEL_74;
              }
            }
            else
            {
              v21 = self->_trace;
              v96 = 0;
              -[MNTrace prepareStatement:outError:](v21, "prepareStatement:outError:", CFSTR("INSERT INTO debug_settings (setting_name, setting_value) VALUES (?, ?)"), &v96);
              v22 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
              v5 = v96;
              recordDebugSettingStatement = self->_recordDebugSettingStatement;
              self->_recordDebugSettingStatement = v22;

              if (v5)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                GEOFindOrCreateLog();
                v8 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  v103 = "-[MNTraceRecorder _prepareStatements]";
                  v104 = 2080;
                  v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                  v106 = 1024;
                  v107 = 400;
                  v108 = 2080;
                  v109 = "NO";
                  v110 = 2112;
                  v111 = v7;
                  goto LABEL_74;
                }
              }
              else
              {
                v24 = self->_trace;
                v95 = 0;
                -[MNTrace prepareStatement:outError:](v24, "prepareStatement:outError:", CFSTR("INSERT INTO audio_settings (db_timestamp, pause_spoken_audio, volume_setting) VALUES (?, ?, ?)"), &v95);
                v25 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                v5 = v95;
                recordAudioSettingStatement = self->_recordAudioSettingStatement;
                self->_recordAudioSettingStatement = v25;

                if (v5)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                  GEOFindOrCreateLog();
                  v8 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v103 = "-[MNTraceRecorder _prepareStatements]";
                    v104 = 2080;
                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                    v106 = 1024;
                    v107 = 401;
                    v108 = 2080;
                    v109 = "NO";
                    v110 = 2112;
                    v111 = v7;
                    goto LABEL_74;
                  }
                }
                else
                {
                  v27 = self->_trace;
                  v94 = 0;
                  -[MNTrace prepareStatement:outError:](v27, "prepareStatement:outError:", CFSTR("INSERT INTO stylesheets (stylesheet_name, stylesheet_data) VALUES (?, ?)"), &v94);
                  v28 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                  v5 = v94;
                  recordStylesheetStatement = self->_recordStylesheetStatement;
                  self->_recordStylesheetStatement = v28;

                  if (v5)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                    v7 = (void *)objc_claimAutoreleasedReturnValue();
                    GEOFindOrCreateLog();
                    v8 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v103 = "-[MNTraceRecorder _prepareStatements]";
                      v104 = 2080;
                      v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                      v106 = 1024;
                      v107 = 402;
                      v108 = 2080;
                      v109 = "NO";
                      v110 = 2112;
                      v111 = v7;
                      goto LABEL_74;
                    }
                  }
                  else
                  {
                    v30 = self->_trace;
                    v93 = 0;
                    -[MNTrace prepareStatement:outError:](v30, "prepareStatement:outError:", CFSTR("INSERT INTO locations (db_timestamp, cl_timestamp, latitude, longitude, raw_latitude, raw_longitude, horizontal_accuracy, vertical_accuracy, altitude, speed, speed_accuracy, course, raw_course, course_accuracy, type, reference_frame, raw_reference_frame, event_type, corrected_latitude, corrected_longitude, corrected_course, match_type, active_transport_type, speed_limit, shield_text, shield_type, match_info_quality, match_info_latitude, match_info_longitude, match_info_course, match_info_form_of_way, match_info_road_class, match_info_shifted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), &v93);
                    v31 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                    v5 = v93;
                    recordLocationStatement = self->_recordLocationStatement;
                    self->_recordLocationStatement = v31;

                    if (v5)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                      v7 = (void *)objc_claimAutoreleasedReturnValue();
                      GEOFindOrCreateLog();
                      v8 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        v103 = "-[MNTraceRecorder _prepareStatements]";
                        v104 = 2080;
                        v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                        v106 = 1024;
                        v107 = 403;
                        v108 = 2080;
                        v109 = "NO";
                        v110 = 2112;
                        v111 = v7;
                        goto LABEL_74;
                      }
                    }
                    else
                    {
                      v33 = self->_trace;
                      v92 = 0;
                      -[MNTrace prepareStatement:outError:](v33, "prepareStatement:outError:", CFSTR("INSERT INTO locations (db_timestamp, error_data) VALUES (?, ?)"), &v92);
                      v34 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                      v5 = v92;
                      recordLocationErrorStatement = self->_recordLocationErrorStatement;
                      self->_recordLocationErrorStatement = v34;

                      if (v5)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                        v7 = (void *)objc_claimAutoreleasedReturnValue();
                        GEOFindOrCreateLog();
                        v8 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136316162;
                          v103 = "-[MNTraceRecorder _prepareStatements]";
                          v104 = 2080;
                          v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                          v106 = 1024;
                          v107 = 404;
                          v108 = 2080;
                          v109 = "NO";
                          v110 = 2112;
                          v111 = v7;
                          goto LABEL_74;
                        }
                      }
                      else
                      {
                        v36 = self->_trace;
                        v91 = 0;
                        -[MNTrace prepareStatement:outError:](v36, "prepareStatement:outError:", CFSTR("INSERT INTO location_match_info (location_id, route_coordinate, step_index, form_of_way, route_match_score, distance_from_route, max_route_distance, route_distance_match_score, route_distance_weight, route_course_delta, max_route_course_delta, route_course_match_score, route_course_weight, road_width_on_route, distance_from_road, road_course_delta, distance_from_nearest_junction) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), &v91);
                        v37 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                        v5 = v91;
                        recordMatchInfoStatement = self->_recordMatchInfoStatement;
                        self->_recordMatchInfoStatement = v37;

                        if (v5)
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                          v7 = (void *)objc_claimAutoreleasedReturnValue();
                          GEOFindOrCreateLog();
                          v8 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 136316162;
                            v103 = "-[MNTraceRecorder _prepareStatements]";
                            v104 = 2080;
                            v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                            v106 = 1024;
                            v107 = 405;
                            v108 = 2080;
                            v109 = "NO";
                            v110 = 2112;
                            v111 = v7;
                            goto LABEL_74;
                          }
                        }
                        else
                        {
                          v39 = self->_trace;
                          v90 = 0;
                          -[MNTrace prepareStatement:outError:](v39, "prepareStatement:outError:", CFSTR("INSERT INTO directions (id, request_timestamp, response_timestamp, request_data, response_data, response_error_data, waypoints_data, selected_route_index) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"), &v90);
                          v40 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                          v5 = v90;
                          recordDirectionsStatement = self->_recordDirectionsStatement;
                          self->_recordDirectionsStatement = v40;

                          if (v5)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                            v7 = (void *)objc_claimAutoreleasedReturnValue();
                            GEOFindOrCreateLog();
                            v8 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 136316162;
                              v103 = "-[MNTraceRecorder _prepareStatements]";
                              v104 = 2080;
                              v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                              v106 = 1024;
                              v107 = 406;
                              v108 = 2080;
                              v109 = "NO";
                              v110 = 2112;
                              v111 = v7;
                              goto LABEL_74;
                            }
                          }
                          else
                          {
                            v42 = self->_trace;
                            v89 = 0;
                            -[MNTrace prepareStatement:outError:](v42, "prepareStatement:outError:", CFSTR("INSERT INTO eta_traffic_updates (request_timestamp, response_timestamp, request_data, response_data, response_error_data, destination_name) VALUES (?, ?, ?, ?, ?, ?)"), &v89);
                            v43 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                            v5 = v89;
                            recordETAUStatement = self->_recordETAUStatement;
                            self->_recordETAUStatement = v43;

                            if (v5)
                            {
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                              v7 = (void *)objc_claimAutoreleasedReturnValue();
                              GEOFindOrCreateLog();
                              v8 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 136316162;
                                v103 = "-[MNTraceRecorder _prepareStatements]";
                                v104 = 2080;
                                v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                v106 = 1024;
                                v107 = 407;
                                v108 = 2080;
                                v109 = "NO";
                                v110 = 2112;
                                v111 = v7;
                                goto LABEL_74;
                              }
                            }
                            else
                            {
                              v45 = self->_trace;
                              v88 = 0;
                              -[MNTrace prepareStatement:outError:](v45, "prepareStatement:outError:", CFSTR("INSERT INTO realtime_transit_updates (timestamp, request_data) VALUES (?, ?)"), &v88);
                              v46 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                              v5 = v88;
                              recordRealtimeTransitUpdateRequest = self->_recordRealtimeTransitUpdateRequest;
                              self->_recordRealtimeTransitUpdateRequest = v46;

                              if (v5)
                              {
                                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                v7 = (void *)objc_claimAutoreleasedReturnValue();
                                GEOFindOrCreateLog();
                                v8 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 136316162;
                                  v103 = "-[MNTraceRecorder _prepareStatements]";
                                  v104 = 2080;
                                  v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                  v106 = 1024;
                                  v107 = 408;
                                  v108 = 2080;
                                  v109 = "NO";
                                  v110 = 2112;
                                  v111 = v7;
                                  goto LABEL_74;
                                }
                              }
                              else
                              {
                                v48 = self->_trace;
                                v87 = 0;
                                -[MNTrace prepareStatement:outError:](v48, "prepareStatement:outError:", CFSTR("INSERT INTO realtime_transit_updates (timestamp, response_data) VALUES (?, ?)"), &v87);
                                v49 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                v5 = v87;
                                recordRealtimeTransitUpdateResponse = self->_recordRealtimeTransitUpdateResponse;
                                self->_recordRealtimeTransitUpdateResponse = v49;

                                if (v5)
                                {
                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                                  GEOFindOrCreateLog();
                                  v8 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)buf = 136316162;
                                    v103 = "-[MNTraceRecorder _prepareStatements]";
                                    v104 = 2080;
                                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                    v106 = 1024;
                                    v107 = 409;
                                    v108 = 2080;
                                    v109 = "NO";
                                    v110 = 2112;
                                    v111 = v7;
                                    goto LABEL_74;
                                  }
                                }
                                else
                                {
                                  v51 = self->_trace;
                                  v86 = 0;
                                  -[MNTrace prepareStatement:outError:](v51, "prepareStatement:outError:", CFSTR("INSERT INTO realtime_transit_updates (timestamp, response_error_data) VALUES (?, ?)"), &v86);
                                  v52 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                  v5 = v86;
                                  recordRealtimeTransitUpdateResponseError = self->_recordRealtimeTransitUpdateResponseError;
                                  self->_recordRealtimeTransitUpdateResponseError = v52;

                                  if (v5)
                                  {
                                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                    v7 = (void *)objc_claimAutoreleasedReturnValue();
                                    GEOFindOrCreateLog();
                                    v8 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_DWORD *)buf = 136316162;
                                      v103 = "-[MNTraceRecorder _prepareStatements]";
                                      v104 = 2080;
                                      v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                      v106 = 1024;
                                      v107 = 410;
                                      v108 = 2080;
                                      v109 = "NO";
                                      v110 = 2112;
                                      v111 = v7;
                                      goto LABEL_74;
                                    }
                                  }
                                  else
                                  {
                                    v54 = self->_trace;
                                    v85 = 0;
                                    -[MNTrace prepareStatement:outError:](v54, "prepareStatement:outError:", CFSTR("INSERT INTO vehicle_speed_data (relative_timestamp, absolute_timestamp, speed) VALUES (?, ?, ?)"), &v85);
                                    v55 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                    v5 = v85;
                                    recordVehicleSpeed = self->_recordVehicleSpeed;
                                    self->_recordVehicleSpeed = v55;

                                    if (v5)
                                    {
                                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                      v7 = (void *)objc_claimAutoreleasedReturnValue();
                                      GEOFindOrCreateLog();
                                      v8 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                      {
                                        *(_DWORD *)buf = 136316162;
                                        v103 = "-[MNTraceRecorder _prepareStatements]";
                                        v104 = 2080;
                                        v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                        v106 = 1024;
                                        v107 = 411;
                                        v108 = 2080;
                                        v109 = "NO";
                                        v110 = 2112;
                                        v111 = v7;
                                        goto LABEL_74;
                                      }
                                    }
                                    else
                                    {
                                      v57 = self->_trace;
                                      v84 = 0;
                                      -[MNTrace prepareStatement:outError:](v57, "prepareStatement:outError:", CFSTR("INSERT INTO vehicle_heading_data (relative_timestamp, absolute_timestamp, heading) VALUES(?, ?, ?)"), &v84);
                                      v58 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                      v5 = v84;
                                      recordVehicleHeading = self->_recordVehicleHeading;
                                      self->_recordVehicleHeading = v58;

                                      if (v5)
                                      {
                                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                        v7 = (void *)objc_claimAutoreleasedReturnValue();
                                        GEOFindOrCreateLog();
                                        v8 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                        {
                                          *(_DWORD *)buf = 136316162;
                                          v103 = "-[MNTraceRecorder _prepareStatements]";
                                          v104 = 2080;
                                          v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                          v106 = 1024;
                                          v107 = 412;
                                          v108 = 2080;
                                          v109 = "NO";
                                          v110 = 2112;
                                          v111 = v7;
                                          goto LABEL_74;
                                        }
                                      }
                                      else
                                      {
                                        v60 = self->_trace;
                                        v83 = 0;
                                        -[MNTrace prepareStatement:outError:](v60, "prepareStatement:outError:", CFSTR("INSERT INTO motion_data (relative_timestamp, absolute_timestamp, type, exit_type, confidence) VALUES(?, ?, ?, ?, ?)"), &v83);
                                        v61 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                        v5 = v83;
                                        recordMotionData = self->_recordMotionData;
                                        self->_recordMotionData = v61;

                                        if (v5)
                                        {
                                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                          v7 = (void *)objc_claimAutoreleasedReturnValue();
                                          GEOFindOrCreateLog();
                                          v8 = objc_claimAutoreleasedReturnValue();
                                          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                          {
                                            *(_DWORD *)buf = 136316162;
                                            v103 = "-[MNTraceRecorder _prepareStatements]";
                                            v104 = 2080;
                                            v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                            v106 = 1024;
                                            v107 = 413;
                                            v108 = 2080;
                                            v109 = "NO";
                                            v110 = 2112;
                                            v111 = v7;
                                            goto LABEL_74;
                                          }
                                        }
                                        else
                                        {
                                          v63 = self->_trace;
                                          v82 = 0;
                                          -[MNTrace prepareStatement:outError:](v63, "prepareStatement:outError:", CFSTR("INSERT INTO compass_heading_data (relative_timestamp, absolute_timestamp, true_heading, magnetic_heading, accuracy) VALUES(?, ?, ?, ?, ?)"), &v82);
                                          v64 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                          v5 = v82;
                                          recordCompassHeading = self->_recordCompassHeading;
                                          self->_recordCompassHeading = v64;

                                          if (v5)
                                          {
                                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                            v7 = (void *)objc_claimAutoreleasedReturnValue();
                                            GEOFindOrCreateLog();
                                            v8 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                            {
                                              *(_DWORD *)buf = 136316162;
                                              v103 = "-[MNTraceRecorder _prepareStatements]";
                                              v104 = 2080;
                                              v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                              v106 = 1024;
                                              v107 = 414;
                                              v108 = 2080;
                                              v109 = "NO";
                                              v110 = 2112;
                                              v111 = v7;
                                              goto LABEL_74;
                                            }
                                          }
                                          else
                                          {
                                            v66 = self->_trace;
                                            v81 = 0;
                                            -[MNTrace prepareStatement:outError:](v66, "prepareStatement:outError:", CFSTR("INSERT INTO ev_data (relative_timestamp, absolute_timestamp, identifier, current_range_m, max_range_m, battery_percentage, min_battery_capacity_kwh, current_battery_capacity_kwh, max_battery_capacity_kwh, consumption_arguments, charging_arguments, is_charging, active_connector, vehicle_state_origin, vehicle_data) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), &v81);
                                            v67 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                            v5 = v81;
                                            recordVirtualGarageVehicleState = self->_recordVirtualGarageVehicleState;
                                            self->_recordVirtualGarageVehicleState = v67;

                                            if (v5)
                                            {
                                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                              v7 = (void *)objc_claimAutoreleasedReturnValue();
                                              GEOFindOrCreateLog();
                                              v8 = objc_claimAutoreleasedReturnValue();
                                              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                              {
                                                *(_DWORD *)buf = 136316162;
                                                v103 = "-[MNTraceRecorder _prepareStatements]";
                                                v104 = 2080;
                                                v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                v106 = 1024;
                                                v107 = 415;
                                                v108 = 2080;
                                                v109 = "NO";
                                                v110 = 2112;
                                                v111 = v7;
                                                goto LABEL_74;
                                              }
                                            }
                                            else
                                            {
                                              v69 = self->_trace;
                                              v80 = 0;
                                              -[MNTrace prepareStatement:outError:](v69, "prepareStatement:outError:", CFSTR("INSERT INTO navigation_events (relative_timestamp, absolute_timestamp, last_location_id, event_id, event_description) VALUES (?, ?, ?, ?, ?)"), &v80);
                                              v70 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                              v5 = v80;
                                              recordNavigationEvent = self->_recordNavigationEvent;
                                              self->_recordNavigationEvent = v70;

                                              if (v5)
                                              {
                                                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                                v7 = (void *)objc_claimAutoreleasedReturnValue();
                                                GEOFindOrCreateLog();
                                                v8 = objc_claimAutoreleasedReturnValue();
                                                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                {
                                                  *(_DWORD *)buf = 136316162;
                                                  v103 = "-[MNTraceRecorder _prepareStatements]";
                                                  v104 = 2080;
                                                  v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                  v106 = 1024;
                                                  v107 = 416;
                                                  v108 = 2080;
                                                  v109 = "NO";
                                                  v110 = 2112;
                                                  v111 = v7;
                                                  goto LABEL_74;
                                                }
                                              }
                                              else
                                              {
                                                v72 = self->_trace;
                                                v79 = 0;
                                                -[MNTrace prepareStatement:outError:](v72, "prepareStatement:outError:", CFSTR("INSERT INTO navigation_updates (timestamp, type, parameters) VALUES (?, ?, ?)"), &v79);
                                                v73 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                                v5 = v79;
                                                recordNavigationUpdate = self->_recordNavigationUpdate;
                                                self->_recordNavigationUpdate = v73;

                                                if (v5)
                                                {
                                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                                                  GEOFindOrCreateLog();
                                                  v8 = objc_claimAutoreleasedReturnValue();
                                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                  {
                                                    *(_DWORD *)buf = 136316162;
                                                    v103 = "-[MNTraceRecorder _prepareStatements]";
                                                    v104 = 2080;
                                                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                    v106 = 1024;
                                                    v107 = 417;
                                                    v108 = 2080;
                                                    v109 = "NO";
                                                    v110 = 2112;
                                                    v111 = v7;
                                                    goto LABEL_74;
                                                  }
                                                }
                                                else
                                                {
                                                  v75 = self->_trace;
                                                  v78 = 0;
                                                  -[MNTrace prepareStatement:outError:](v75, "prepareStatement:outError:", CFSTR("UPDATE navigation_events SET last_location_id = ? WHERE rowid = ?"), &v78);
                                                  v76 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                                  v5 = v78;
                                                  updateNavigationEventLocationID = self->_updateNavigationEventLocationID;
                                                  self->_updateNavigationEventLocationID = v76;

                                                  if (!v5)
                                                  {
LABEL_76:

                                                    return;
                                                  }
                                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
                                                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                                                  GEOFindOrCreateLog();
                                                  v8 = objc_claimAutoreleasedReturnValue();
                                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                  {
                                                    *(_DWORD *)buf = 136316162;
                                                    v103 = "-[MNTraceRecorder _prepareStatements]";
                                                    v104 = 2080;
                                                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                    v106 = 1024;
                                                    v107 = 418;
                                                    v108 = 2080;
                                                    v109 = "NO";
                                                    v110 = 2112;
                                                    v111 = v7;
                                                    goto LABEL_74;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_76;
  }
}

- (void)_closeTraceDB
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  -[MNTraceRecorder trace](self, "trace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "db");

  if (v4)
  {
    -[MNTraceRecorder trace](self, "trace");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "closeTrace");

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "We are trying to close a trace when there is no trace db.", buf, 2u);
    }

  }
}

- (double)timeSinceRecordingBegan
{
  NSDate *recordingStartDate;
  double v3;

  recordingStartDate = self->_recordingStartDate;
  if (!recordingStartDate)
    return 0.0;
  -[NSDate timeIntervalSinceNow](recordingStartDate, "timeIntervalSinceNow");
  return -v3;
}

- (void)setRecordingStartDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    v7 = "Setting recording start time to %@";
    v8 = v6;
    v9 = 12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v7 = "Setting recording start time to current time";
    v8 = v6;
    v9 = 2;
  }
  _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_7:

  objc_storeStrong((id *)&self->_recordingStartDate, v5);
  if (self->_trace)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__MNTraceRecorder_setRecordingStartDate___block_invoke;
    v10[3] = &unk_1E61D1D10;
    v10[4] = self;
    v11 = v5;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v10);

  }
}

uint64_t __41__MNTraceRecorder_setRecordingStartDate___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "bindParameter:double:", CFSTR(":recording_start_time"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "execute");
}

- (void)recordEnvironmentInfo:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__MNTraceRecorder_recordEnvironmentInfo_value___block_invoke;
    v9[3] = &unk_1E61D2878;
    v9[4] = self;
    v10 = v6;
    v11 = v8;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v9);

  }
}

void __47__MNTraceRecorder_recordEnvironmentInfo_value___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 88), "bind:string:", 1, a1[5]);
  objc_msgSend(*(id *)(a1[4] + 88), "bind:string:", 2, a1[6]);
  if ((objc_msgSend(*(id *)(a1[4] + 88), "execute") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording environment info"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "result";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)recordDebugSetting:(id)a3 settingValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MNTraceRecorder_recordDebugSetting_settingValue___block_invoke;
    v9[3] = &unk_1E61D2878;
    v9[4] = self;
    v10 = v6;
    v11 = v8;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v9);

  }
}

void __51__MNTraceRecorder_recordDebugSetting_settingValue___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 96), "bind:string:", 1, a1[5]);
  objc_msgSend(*(id *)(a1[4] + 96), "bind:string:", 2, a1[6]);
  if ((objc_msgSend(*(id *)(a1[4] + 96), "execute") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording debug setting"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "result";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)recordAudioSetting:(BOOL)a3 voiceGuidance:(int64_t)a4
{
  _QWORD v4[6];
  BOOL v5;

  if (self->_lastPauseSpokenAudio != a3 || self->_lastVoiceGuidanceSetting != a4)
  {
    self->_lastPauseSpokenAudio = a3;
    self->_lastVoiceGuidanceSetting = a4;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__MNTraceRecorder_recordAudioSetting_voiceGuidance___block_invoke;
    v4[3] = &unk_1E61D28A0;
    v5 = a3;
    v4[4] = self;
    v4[5] = a4;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v4);
  }
}

void __52__MNTraceRecorder_recordAudioSetting_voiceGuidance___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[13];
  objc_msgSend(v2, "timeSinceRecordingBegan");
  objc_msgSend(v3, "bind:double:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "bind:int:", 2, *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "bind:int:", 3, *(unsigned int *)(a1 + 40));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "execute") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording audio setting"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "result";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)recordStylesheet:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__MNTraceRecorder_recordStylesheet_data___block_invoke;
    v8[3] = &unk_1E61D2878;
    v8[4] = self;
    v9 = v6;
    v10 = v7;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v8);

  }
}

void __41__MNTraceRecorder_recordStylesheet_data___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 112), "bind:string:", 1, a1[5]);
  objc_msgSend(*(id *)(a1[4] + 112), "bind:data:", 2, a1[6]);
  if ((objc_msgSend(*(id *)(a1[4] + 112), "execute") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording debug setting"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "result";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)recordMiscInfo:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  MNTraceRecorder *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__MNTraceRecorder_recordMiscInfo_value___block_invoke;
    v9[3] = &unk_1E61D28C8;
    v10 = v7;
    v11 = v6;
    v12 = self;
    -[MNTraceRecorder _executeStatementForQuery:handler:](self, "_executeStatementForQuery:handler:", CFSTR("INSERT INTO misc_info (key, value) VALUES (?, ?)"), v9);

  }
}

void __40__MNTraceRecorder_recordMiscInfo_value___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = *(id *)(a1 + 32);
    v4 = sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    if ((_DWORD)v4)
    {
      v5 = v4;
      v6 = *(void **)(a1 + 48);
      v7 = 530;
LABEL_17:
      objc_msgSend(v6, "_logSqliteErrorWithResult:file:line:", v5, "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m", v7);
      goto LABEL_18;
    }
    v12 = objc_retainAutorelease(v17);
    v13 = sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v12, "length"), 0);
    if ((_DWORD)v13)
    {
      v5 = v13;
      v6 = *(void **)(a1 + 48);
      v7 = 531;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = *(id *)(a1 + 32);
    v8 = sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    if ((_DWORD)v8)
    {
      v5 = v8;
      v6 = *(void **)(a1 + 48);
      v7 = 534;
      goto LABEL_17;
    }
    if (CFNumberIsFloatType((CFNumberRef)v17))
    {
      objc_msgSend(v17, "doubleValue");
      v15 = sqlite3_bind_double(a2, 2, v14);
      if ((_DWORD)v15)
      {
        v5 = v15;
        v6 = *(void **)(a1 + 48);
        v7 = 536;
        goto LABEL_17;
      }
    }
    else
    {
      v16 = sqlite3_bind_int(a2, 2, objc_msgSend(v17, "intValue"));
      if ((_DWORD)v16)
      {
        v5 = v16;
        v6 = *(void **)(a1 + 48);
        v7 = 538;
        goto LABEL_17;
      }
    }
LABEL_18:

    return;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error recording \"%@\" to misc_info: Invalid type: %@", buf, 0x16u);
  }

}

- (void)recordNavigationEvent:(int64_t)a3 forLocation:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "!_closed";
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__MNTraceRecorder_recordNavigationEvent_forLocation_description___block_invoke;
  v19[3] = &unk_1E61D28F0;
  v22 = v11;
  v23 = v14;
  v19[4] = self;
  v20 = v8;
  v24 = a3;
  v21 = v9;
  v15 = v9;
  v16 = v8;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v19);

}

void __65__MNTraceRecorder_recordNavigationEvent_forLocation_description___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 224), "bind:double:", 1, *(double *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "bind:double:", 2, *(double *)(a1 + 64));
    v3 = *(void **)(a1 + 40);
    if (v3 && objc_msgSend(v3, "traceIndex") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "bind:int:", 3, objc_msgSend(*(id *)(a1 + 40), "traceIndex"));
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "bindNull:", 3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "bind:int:", 4, *(unsigned int *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "bind:string:", 5, *(_QWORD *)(a1 + 48));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording navigation event"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "result";
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v13, 0x16u);
      }

    }
    v4 = *(void **)(a1 + 40);
    if (v4 && objc_msgSend(v4, "traceIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 272);
        *(_QWORD *)(v7 + 272) = v6;

        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
      }
      objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setObject:forKey:", v9, *(_QWORD *)(a1 + 40));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db")));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }
}

- (void)_recordLocationMatchInfoOnWriteQueue:(id)a3 forLocationID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MNTracePreparedStatement *recordMatchInfoStatement;
  MNTracePreparedStatement *v15;
  MNTracePreparedStatement *v16;
  MNTracePreparedStatement *v17;
  MNTracePreparedStatement *v18;
  MNTracePreparedStatement *v19;
  MNTracePreparedStatement *v20;
  MNTracePreparedStatement *v21;
  MNTracePreparedStatement *v22;
  MNTracePreparedStatement *v23;
  MNTracePreparedStatement *v24;
  MNTracePreparedStatement *v25;
  MNTracePreparedStatement *v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v4 = *(_QWORD *)&a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "_navigation_detailedMatchInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v30 = 136315906;
      v31 = "-[MNTraceRecorder _recordLocationMatchInfoOnWriteQueue:forLocationID:]";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
      v34 = 1024;
      v35 = 591;
      v36 = 2080;
      v37 = "correctedLocation.detailedMatchInfo != nil";
      _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v30, 0x26u);
    }

  }
  objc_msgSend(v6, "_navigation_detailedMatchInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "_navigation_routeMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_navigation_detailedMatchInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTracePreparedStatement bind:int:](self->_recordMatchInfoStatement, "bind:int:", 1, v4);
    -[MNTracePreparedStatement bind:double:](self->_recordMatchInfoStatement, "bind:double:", 2, (double)objc_msgSend(v9, "routeCoordinate")+ COERCE_FLOAT((unint64_t)objc_msgSend(v9, "routeCoordinate") >> 32));
    -[MNTracePreparedStatement bind:int:](self->_recordMatchInfoStatement, "bind:int:", 3, objc_msgSend(v9, "stepIndex"));
    objc_msgSend(v9, "road");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "road");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "formOfWay");

    }
    else
    {
      v13 = 0;
    }

    -[MNTracePreparedStatement bind:int:](self->_recordMatchInfoStatement, "bind:int:", 4, v13);
    recordMatchInfoStatement = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "routeMatchScore");
    -[MNTracePreparedStatement bind:double:](recordMatchInfoStatement, "bind:double:", 5);
    v15 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "distanceFromRoute");
    -[MNTracePreparedStatement bind:double:](v15, "bind:double:", 6);
    v16 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "maxDistance");
    -[MNTracePreparedStatement bind:double:](v16, "bind:double:", 7);
    v17 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "distanceMatchScore");
    -[MNTracePreparedStatement bind:double:](v17, "bind:double:", 8);
    v18 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "distanceWeight");
    -[MNTracePreparedStatement bind:double:](v18, "bind:double:", 9);
    v19 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "courseDelta");
    -[MNTracePreparedStatement bind:double:](v19, "bind:double:", 10);
    v20 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "maxCourseDelta");
    -[MNTracePreparedStatement bind:double:](v20, "bind:double:", 11);
    v21 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "courseMatchScore");
    -[MNTracePreparedStatement bind:double:](v21, "bind:double:", 12);
    v22 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "courseWeight");
    -[MNTracePreparedStatement bind:double:](v22, "bind:double:", 13);
    v23 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "roadWidthOnRoute");
    -[MNTracePreparedStatement bind:double:](v23, "bind:double:", 14);
    v24 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "distanceFromRoad");
    -[MNTracePreparedStatement bind:double:](v24, "bind:double:", 15);
    v25 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "roadCourseDelta");
    -[MNTracePreparedStatement bind:double:](v25, "bind:double:", 16);
    v26 = self->_recordMatchInfoStatement;
    objc_msgSend(v10, "distanceFromNearestJunction");
    -[MNTracePreparedStatement bind:double:](v26, "bind:double:", 17);
    if (!-[MNTracePreparedStatement execute](self->_recordMatchInfoStatement, "execute"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording location"));
      v28 = (char *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = 136315394;
        v31 = "result";
        v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v30, 0x16u);
      }

    }
  }

}

- (void)recordLocation:(id)a3 rawLocation:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  -[MNTraceRecorder recordLocation:rawLocation:timestamp:](self, "recordLocation:rawLocation:timestamp:", v7, v6);

}

- (void)recordLocation:(id)a3 rawLocation:(id)a4 timestamp:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "!_closed";
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__MNTraceRecorder_recordLocation_rawLocation_timestamp___block_invoke;
  v14[3] = &unk_1E61D2918;
  v17 = a5;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v14);

}

void __56__MNTraceRecorder_recordLocation_rawLocation_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  sqlite3_int64 insert_rowid;
  void *v34;
  void *v35;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 120), "bind:double:", 1, *(double *)(a1 + 56));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "bind:double:", 2);

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "coordinate");
    objc_msgSend(v5, "bind:double:", 3);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "coordinate");
    objc_msgSend(v6, "bind:double:", 4, v7);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "rawCoordinate");
    objc_msgSend(v8, "bind:double:", 5);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "rawCoordinate");
    objc_msgSend(v9, "bind:double:", 6, v10);
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "horizontalAccuracy");
    objc_msgSend(v11, "bind:double:", 7);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "verticalAccuracy");
    objc_msgSend(v12, "bind:double:", 8);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "altitude");
    objc_msgSend(v13, "bind:double:", 9);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "speed");
    objc_msgSend(v14, "bind:double:", 10);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "speedAccuracy");
    objc_msgSend(v15, "bind:double:", 11);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "course");
    objc_msgSend(v16, "bind:double:", 12);
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "rawCourse");
    objc_msgSend(v17, "bind:double:", 13);
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "courseAccuracy");
    objc_msgSend(v18, "bind:double:", 14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 15, objc_msgSend(*(id *)(a1 + 48), "type"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 16, objc_msgSend(*(id *)(a1 + 48), "referenceFrame"));
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v20 = *(void **)(a1 + 48);
    if (v20)
    {
      objc_msgSend(v20, "clientLocation");
      v21 = DWORD2(v45);
    }
    else
    {
      v21 = 0;
      *(__int128 *)((char *)&v46 - 4) = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v37 = 0u;
    }
    objc_msgSend(v19, "bind:int:", 17, v21, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 18, 0);
    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    objc_msgSend(v22, "bind:double:", 19);
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    objc_msgSend(v23, "bind:double:", 20, v24);
    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 40), "course");
    objc_msgSend(v25, "bind:double:", 21);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 22, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "state"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 23, 4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 24, objc_msgSend(*(id *)(a1 + 40), "speedLimit"));
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 40), "shieldText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bind:string:", 25, v27);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 26, objc_msgSend(*(id *)(a1 + 40), "shieldType"));
    objc_msgSend(*(id *)(a1 + 48), "matchInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 27, objc_msgSend(v28, "matchQuality"));
    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(v28, "matchCoordinate");
    objc_msgSend(v29, "bind:double:", 28);
    v30 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(v28, "matchCoordinate");
    objc_msgSend(v30, "bind:double:", 29, v31);
    v32 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(v28, "matchCourse");
    objc_msgSend(v32, "bind:double:", 30);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 31, objc_msgSend(v28, "matchFormOfWay"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 32, objc_msgSend(v28, "matchRoadClass"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 33, objc_msgSend(v28, "isMatchShifted"));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording location"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "result";
        v49 = 2112;
        v50 = v35;
        _os_log_impl(&dword_1B0AD7000, v36, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

    }
    insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db"));
    objc_msgSend(*(id *)(a1 + 40), "setTraceIndex:", insert_rowid);
    objc_msgSend(*(id *)(a1 + 40), "detailedMatchInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      objc_msgSend(*(id *)(a1 + 32), "_recordLocationMatchInfoOnWriteQueue:forLocationID:", *(_QWORD *)(a1 + 40), insert_rowid);
    objc_msgSend(*(id *)(a1 + 32), "_updateNavigationEventsWithLocationReference:", *(_QWORD *)(a1 + 40));

  }
}

- (void)_recordLocationEvent:(int64_t)a3 recordingTimestamp:(double)a4 coordinate:(CLLocationCoordinate2D)a5 rawCoordinate:(CLLocationCoordinate2D)a6 timestamp:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 altitude:(double)a10 speed:(double)a11 speedAccuracy:(double)a12 course:(double)a13 rawCourse:(double)a14 type:(int)a15 courseAccuracy:(double)a16 correctedCoordinate:(CLLocationCoordinate2D)a17 correctedCourse:(double)a18 matchType:(int)a19 activeTransportType:(int)a20 matchInfo:(id)a21 correctedLocation:(id)a22 speedLimit:(int)a23 shieldText:(id)a24 shieldType:(int)a25
{
  void *v25;
  int longitude_low;
  int latitude_low;
  double v31;
  int v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v38;
  double v39;
  double v40;
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  int v49;
  int v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  int v56;
  NSObject *v57;
  void *v58;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  double v69;
  double v70;
  CLLocationDegrees v71;
  CLLocationDegrees v72;
  CLLocationCoordinate2D v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  int64_t v82;
  double v83;
  id v84;
  id v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v25 = *(void **)&a20;
  longitude_low = LODWORD(a17.longitude);
  latitude_low = LODWORD(a17.latitude);
  v31 = a16;
  v32 = a23;
  v33 = a11;
  v34 = a12;
  v35 = a10;
  v95 = *MEMORY[0x1E0C80C00];
  v36 = *(id *)&a19;
  v37 = v25;
  v38 = a24;
  v39 = a13;
  v40 = a14;
  longitude = a5.longitude;
  latitude = a5.latitude;
  v43 = a22;
  v44 = a21;
  v45 = a7;
  v46 = a18;
  v47 = a8;
  v48 = a9;
  v49 = latitude_low;
  v50 = longitude_low;
  v51 = v38;
  if (self->_closed)
  {
    v55 = v49;
    v56 = v50;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "!_closed";
      v93 = 2112;
      v94 = v58;
      _os_log_impl(&dword_1B0AD7000, v57, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

    v50 = v56;
    v49 = v55;
    v48 = a9;
    v44 = a21;
    v47 = a8;
    v43 = a22;
    v46 = a18;
    v32 = a23;
    v45 = a7;
    latitude = a5.latitude;
    longitude = a5.longitude;
    v40 = a14;
    v31 = a16;
    v34 = a12;
    v39 = a13;
    v35 = a10;
    v33 = a11;
  }
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __323__MNTraceRecorder__recordLocationEvent_recordingTimestamp_coordinate_rawCoordinate_timestamp_horizontalAccuracy_verticalAccuracy_altitude_speed_speedAccuracy_course_rawCourse_type_courseAccuracy_correctedCoordinate_correctedCourse_matchType_activeTransportType_matchInfo_correctedLocation_speedLimit_shieldText_shieldType___block_invoke;
  v65[3] = &unk_1E61D2940;
  v69 = a4;
  v70 = v45;
  v71 = latitude;
  v72 = longitude;
  v73 = a6;
  v74 = v47;
  v75 = v48;
  v76 = v35;
  v77 = v33;
  v78 = v34;
  v79 = v39;
  v80 = v40;
  v81 = v31;
  v82 = a3;
  v83 = v46;
  v84 = v44;
  v85 = v43;
  v86 = a15;
  v87 = v49;
  v88 = v50;
  v89 = v32;
  v65[4] = self;
  v66 = v51;
  v90 = a25;
  v67 = v36;
  v68 = v37;
  v52 = v37;
  v53 = v36;
  v54 = v51;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v65);

}

void __323__MNTraceRecorder__recordLocationEvent_recordingTimestamp_coordinate_rawCoordinate_timestamp_horizontalAccuracy_verticalAccuracy_altitude_speed_speedAccuracy_course_rawCourse_type_courseAccuracy_correctedCoordinate_correctedCourse_matchType_activeTransportType_matchInfo_correctedLocation_speedLimit_shieldText_shieldType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 120), "bind:double:", 1, *(double *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 2, *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 3, *(double *)(a1 + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 4, *(double *)(a1 + 88));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 5, *(double *)(a1 + 96));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 6, *(double *)(a1 + 104));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 7, *(double *)(a1 + 112));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 8, *(double *)(a1 + 120));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 9, *(double *)(a1 + 128));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 10, *(double *)(a1 + 136));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 11, *(double *)(a1 + 144));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 12, *(double *)(a1 + 152));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 13, *(double *)(a1 + 160));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 14, *(double *)(a1 + 168));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 15, *(unsigned int *)(a1 + 208));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 16, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 17, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 18, *(unsigned int *)(a1 + 176));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 19, *(double *)(a1 + 184));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 20, *(double *)(a1 + 192));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 21, *(double *)(a1 + 200));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:double:", 22, (double)*(int *)(a1 + 212));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 23, *(unsigned int *)(a1 + 216));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 24, *(unsigned int *)(a1 + 220));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:string:", 25, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 26, *(unsigned int *)(a1 + 224));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 27, objc_msgSend(*(id *)(a1 + 48), "matchQuality"));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "matchCoordinate");
    objc_msgSend(v3, "bind:double:", 28);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "matchCoordinate");
    objc_msgSend(v4, "bind:double:", 29, v5);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 48), "matchCourse");
    objc_msgSend(v6, "bind:double:", 30);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 31, objc_msgSend(*(id *)(a1 + 48), "matchFormOfWay"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 32, objc_msgSend(*(id *)(a1 + 48), "matchRoadClass"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "bind:int:", 33, objc_msgSend(*(id *)(a1 + 48), "isMatchShifted"));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording location"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315394;
        v11 = "result";
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v10, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "_navigation_detailedMatchInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "_recordLocationMatchInfoOnWriteQueue:forLocationID:", *(_QWORD *)(a1 + 56), sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db")));
  }
}

- (void)_recordLocationEvent:(int64_t)a3 recordingTimestamp:(double)a4 location:(id)a5 correctedLocation:(id)a6
{
  id v9;
  char isKindOfClass;
  double v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  CLLocationCoordinate2D v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  CLLocationDegrees v34;
  double v35;
  CLLocationDegrees v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  CLLocationCoordinate2D v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double longitude;
  double latitude;
  id v55;

  v55 = a5;
  v9 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v55)
  {
    objc_msgSend(v55, "coordinate");
    longitude = v12;
    latitude = v11;
    objc_msgSend(v55, "rawCoordinate");
  }
  else
  {
    v15 = CLLocationCoordinate2DMake(0.0, 0.0);
    longitude = v15.longitude;
    latitude = v15.latitude;
    v16 = CLLocationCoordinate2DMake(0.0, 0.0);
    v14 = v16.longitude;
    v13 = v16.latitude;
  }
  v50 = v14;
  v51 = v13;
  objc_msgSend(v55, "timestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v49 = v18;
  if (v55)
  {
    objc_msgSend(v55, "horizontalAccuracy");
    v48 = v19;
    objc_msgSend(v55, "verticalAccuracy");
    v47 = v20;
    objc_msgSend(v55, "altitude");
    v46 = v21;
    objc_msgSend(v55, "speed");
    v23 = v22;
    objc_msgSend(v55, "_navigation_speedAccuracy");
    v25 = v24;
    objc_msgSend(v55, "course");
    v27 = v26;
    objc_msgSend(v55, "rawCourse");
    v29 = v28;
    v30 = objc_msgSend(v55, "type");
    objc_msgSend(v55, "courseAccuracy");
    v32 = v31;
    if (v9)
      goto LABEL_6;
LABEL_9:
    v38 = 0;
    v43 = CLLocationCoordinate2DMake(0.0, 0.0);
    v34 = v43.latitude;
    v36 = v43.longitude;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_7;
LABEL_10:
    objc_msgSend(v55, "matchInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = -1;
    LODWORD(v44) = -1;
    -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:](self, "_recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:", a3, v30, 0xFFFFFFFFLL, 4, v40, v9, a4, latitude, longitude, v51, v50, v49, v48, v47, v46,
      v23,
      v25,
      v27,
      v29,
      v32,
      *(_QWORD *)&v34,
      *(_QWORD *)&v36,
      v38,
      v44,
      0,
      v45);
    goto LABEL_11;
  }
  v30 = objc_msgSend(0, "type");
  v29 = 0;
  v25 = 0;
  v46 = 0;
  v47 = 0.0;
  v48 = 0.0;
  v23 = 0;
  v27 = 0;
  v32 = 0;
  if (!v9)
    goto LABEL_9;
LABEL_6:
  objc_msgSend(v9, "coordinate");
  v34 = v33;
  v36 = v35;
  objc_msgSend(v9, "course");
  v38 = v37;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v39 = objc_msgSend(v9, "state");
  objc_msgSend(v55, "matchInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v9, "speedLimit");
  objc_msgSend(v9, "shieldText");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = objc_msgSend(v9, "shieldType");
  LODWORD(v44) = v41;
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:](self, "_recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:", a3, v30, v39, 4, v40, v9, a4, latitude, longitude, v51, v50, v49, v48, v47, v46,
    v23,
    v25,
    v27,
    v29,
    v32,
    *(_QWORD *)&v34,
    *(_QWORD *)&v36,
    v38,
    v44,
    v42,
    v45);

LABEL_11:
}

- (void)recordLocation:(id)a3 timestamp:(double)a4
{
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 0, a3, 0, a4);
}

- (void)recordSimulatedCoordinate:(CLLocationCoordinate2D)a3 course:(double)a4 altitude:(double)a5 speed:(double)a6 timestamp:(double)a7 activeTransportType:(int)a8
{
  uint64_t v8;
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  uint64_t v15;
  uint64_t v16;

  v8 = *(_QWORD *)&a8;
  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  LODWORD(v16) = -1;
  LODWORD(v15) = -1;
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:](self, "_recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:", 0, 1, 0xFFFFFFFFLL, v8, 0, 0, *(_QWORD *)&a5, *(_QWORD *)&a6, 0, *(_QWORD *)&a4, *(_QWORD *)&a4, 0x4024000000000000, *(_QWORD *)&latitude, *(_QWORD *)&longitude, *(_QWORD *)&a4,
    v15,
    0,
    v16);
}

- (void)recordLocation:(id)a3 correctedLocation:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 0, v7, v6);

}

- (void)recordLocationUpdatePause
{
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 1, 0, 0);
}

- (void)recordLocationUpdateResume
{
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 2, 0, 0);
}

- (void)recordError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "!_closed";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__MNTraceRecorder_recordError___block_invoke;
  v9[3] = &unk_1E61D2968;
  v11 = v5;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v9);

}

void __31__MNTraceRecorder_recordError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 128), "bind:double:", 1, *(double *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 40), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "bind:data:", 2, v3);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording location error."));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "result";
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }

    }
  }
}

- (void)setIsSimulation:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "!_closed";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MNTraceRecorder_setIsSimulation___block_invoke;
  v7[3] = &unk_1E61D2538;
  v7[4] = self;
  v8 = a3;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v7);
}

void __35__MNTraceRecorder_setIsSimulation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    v3 = *(_QWORD *)(v1 + 8);
    v6 = 0;
    +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", v3, CFSTR("UPDATE info SET simulation = ?"), &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v6)
    {
      objc_msgSend(v4, "bind:int:", 1, *(unsigned __int8 *)(a1 + 40));
      objc_msgSend(v5, "execute");
      objc_msgSend(v5, "finalize");
    }

  }
}

- (void)setRouteGenius:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "!_closed";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__MNTraceRecorder_setRouteGenius___block_invoke;
  v7[3] = &unk_1E61D2538;
  v7[4] = self;
  v8 = a3;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v7);
}

void __34__MNTraceRecorder_setRouteGenius___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  sqlite3 *v4;
  const char *v5;
  id v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[48])
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(v2, "trace");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (sqlite3 *)objc_msgSend(v6, "db");
    if (v3)
      v5 = "UPDATE info SET route_genius = 1;";
    else
      v5 = "UPDATE info SET route_genius = 0;";
    sqlite3_exec(v4, v5, 0, 0, 0);

  }
}

- (void)resetLocationsForSimulation
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "!_closed";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__MNTraceRecorder_resetLocationsForSimulation__block_invoke;
  v5[3] = &unk_1E61D23C8;
  v5[4] = self;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v5);
}

void __46__MNTraceRecorder_resetLocationsForSimulation__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[48])
  {
    objc_msgSend(v2, "trace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_exec((sqlite3 *)objc_msgSend(v3, "db"), "DELETE FROM locations;", 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "trace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_exec((sqlite3 *)objc_msgSend(v4, "db"), "UPDATE info SET simulation = 1;", 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "trace");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_exec((sqlite3 *)objc_msgSend(v5, "db"), "UPDATE info SET cl_mapmatch = 0;", 0, 0, 0);

  }
}

- (void)beginTransaction
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "!_closed";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MNTraceRecorder_beginTransaction__block_invoke;
  v5[3] = &unk_1E61D23C8;
  v5[4] = self;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v5);
}

void __35__MNTraceRecorder_beginTransaction__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[48])
  {
    objc_msgSend(v1, "trace");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_exec((sqlite3 *)objc_msgSend(v2, "db"), "BEGIN TRANSACTION;", 0, 0, 0);

  }
}

- (void)endTransaction
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "!_closed";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MNTraceRecorder_endTransaction__block_invoke;
  v5[3] = &unk_1E61D23C8;
  v5[4] = self;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v5);
}

void __33__MNTraceRecorder_endTransaction__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[48])
  {
    objc_msgSend(v1, "trace");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_exec((sqlite3 *)objc_msgSend(v2, "db"), "COMMIT;", 0, 0, 0);

  }
}

- (void)setNavigationStartDate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__MNTraceRecorder_setNavigationStartDate___block_invoke;
    v6[3] = &unk_1E61D1D10;
    v6[4] = self;
    v7 = v4;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v6);

  }
}

uint64_t __42__MNTraceRecorder_setNavigationStartDate___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "bindParameter:double:", CFSTR(":navigation_start_time"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "execute");
}

- (void)setNavigationEndDate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__MNTraceRecorder_setNavigationEndDate___block_invoke;
    v6[3] = &unk_1E61D1D10;
    v6[4] = self;
    v7 = v4;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v6);

  }
}

uint64_t __40__MNTraceRecorder_setNavigationEndDate___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "bindParameter:double:", CFSTR(":navigation_end_time"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "execute");
}

- (void)recordRouteChangeWithIndex:(unint64_t)a3 directionsResponseID:(id)a4 etauResponseID:(id)a5 rerouteReason:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v14)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("directionsResponseID"));
  if (v10)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("etauResponseID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("routeIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("reason"));

  -[MNTraceRecorder _recordNavigationUpdate:parameters:](self, "_recordNavigationUpdate:parameters:", 1, v11);
}

- (void)recordDepartWaypoint:(id)a3 legIndex:(unint64_t)a4 departureReason:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v14[0] = a3;
  v13[0] = CFSTR("waypoint");
  v13[1] = CFSTR("legIndex");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v13[2] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNTraceRecorder _recordNavigationUpdate:parameters:](self, "_recordNavigationUpdate:parameters:", 2, v12);
}

- (void)recordDirectionsRequest:(id)a3 response:(id)a4 error:(id)a5 waypoints:(id)a6 selectedRouteIndex:(unint64_t)a7 requestTimestamp:(double)a8 responseTimestamp:(double)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t routeRequestCount;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  unint64_t v34;
  BOOL v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "!_closed";
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  routeRequestCount = self->_routeRequestCount;
  self->_routeRequestCount = routeRequestCount + 1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __122__MNTraceRecorder_recordDirectionsRequest_response_error_waypoints_selectedRouteIndex_requestTimestamp_responseTimestamp___block_invoke;
  v27[3] = &unk_1E61D2990;
  v32 = a8;
  v33 = a9;
  v27[4] = self;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v34 = a7;
  v35 = routeRequestCount == 0;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v27);

}

void __122__MNTraceRecorder_recordDirectionsRequest_response_error_waypoints_selectedRouteIndex_requestTimestamp_responseTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 144), "bind:int:", 1, *(unsigned int *)(v1 + 256));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:double:", 2, *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:double:", 3, *(double *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 40), "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:data:", 4, v3);
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      v5 = (void *)objc_msgSend(v4, "copy");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v5, "routes", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10++), "setUnpackedLatLngVertices:", 0);
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v8);
      }

      objc_msgSend(v5, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:data:", 5, v11);

    }
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:data:", 6, v13);

    }
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 64), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:data:", 7, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "bind:int:", 8, *(unsigned int *)(a1 + 88));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording directions request"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "result";
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

    }
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "timeIntervalSinceReferenceDate");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "bindParameter:double:", CFSTR(":directions_start_time"), v15 + *(double *)(a1 + 72));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "execute");
    }

  }
}

- (void)recordInitialCourse:(double)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "!_closed";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MNTraceRecorder_recordInitialCourse___block_invoke;
  v7[3] = &unk_1E61D23F0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v7);
}

_BYTE *__39__MNTraceRecorder_recordInitialCourse___block_invoke(uint64_t a1)
{
  _BYTE *result;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = *(_BYTE **)(a1 + 32);
  if (!result[48])
  {
    ppStmt = 0;
    objc_msgSend(result, "trace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = sqlite3_prepare_v2((sqlite3 *)objc_msgSend(v3, "db"), "UPDATE info SET initial_course = ?", 34, &ppStmt, 0);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error preparing statement to record initial course"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "result == SQLITE_OK";
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

    }
    v5 = sqlite3_bind_double(ppStmt, 1, *(double *)(a1 + 40));
    if ((_DWORD)v5)
    {
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_logSqliteErrorWithResult:file:line:", v5, "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m", 1053);
    }
    else
    {
      if (sqlite3_step(ppStmt) != 101)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording initial course"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v12 = "result == SQLITE_DONE";
          v13 = 2112;
          v14 = v8;
          _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
        }

      }
      return (_BYTE *)sqlite3_finalize(ppStmt);
    }
  }
  return result;
}

- (void)recordETAURequest:(id)a3 response:(id)a4 error:(id)a5 destinationName:(id)a6 requestTimestamp:(double)a7 responseTimestamp:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "!_closed";
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__MNTraceRecorder_recordETAURequest_response_error_destinationName_requestTimestamp_responseTimestamp___block_invoke;
  v24[3] = &unk_1E61D29B8;
  v29 = a7;
  v30 = a8;
  v24[4] = self;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v24);

}

void __103__MNTraceRecorder_recordETAURequest_response_error_destinationName_requestTimestamp_responseTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 152), "bind:double:", 1, *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "bind:double:", 2, *(double *)(a1 + 80));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bind:data:", 3, v4);

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    objc_msgSend(*(id *)(a1 + 48), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bind:data:", 4, v6);

    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "bind:data:", 5, v8);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "bind:string:", 6, *(_QWORD *)(a1 + 64));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording ETA update"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "result";
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v11, 0x16u);
      }

    }
  }
}

- (void)recordTransitUpdateRequest:(id)a3 withTimestamp:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  double v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "!_closed";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MNTraceRecorder_recordTransitUpdateRequest_withTimestamp___block_invoke;
  v11[3] = &unk_1E61D2968;
  v13 = a4;
  v11[4] = self;
  v12 = v7;
  v8 = v7;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);

}

void __60__MNTraceRecorder_recordTransitUpdateRequest_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 160), "bind:double:", 1, *(double *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "bind:data:", 2, *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording realtime transit update request"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "result";
        v7 = 2112;
        v8 = v3;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v5, 0x16u);
      }

    }
  }
}

- (void)recordTransitUpdateResponse:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "!_closed";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v6 = v5;
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MNTraceRecorder_recordTransitUpdateResponse___block_invoke;
  v11[3] = &unk_1E61D2968;
  v13 = v6;
  v11[4] = self;
  v12 = v7;
  v8 = v7;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);

}

void __47__MNTraceRecorder_recordTransitUpdateResponse___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 168), "bind:double:", 1, *(double *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "bind:data:", 2, *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording realtime transit update response"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "result";
        v7 = 2112;
        v8 = v3;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v5, 0x16u);
      }

    }
  }
}

- (void)recordTransitUpdateError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "!_closed";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MNTraceRecorder_recordTransitUpdateError___block_invoke;
  v9[3] = &unk_1E61D2968;
  v11 = v5;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v9);

}

void __44__MNTraceRecorder_recordTransitUpdateError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 176), "bind:double:", 1, *(double *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 40), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "bind:data:", 2, v3);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording realtime transit update error"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "result";
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }

    }
  }
}

- (void)recordVehicleSpeed:(double)a3 timestamp:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  double v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "!_closed";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__MNTraceRecorder_recordVehicleSpeed_timestamp___block_invoke;
  v11[3] = &unk_1E61D29E0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v14 = a3;
  v8 = v6;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);

}

void __48__MNTraceRecorder_recordVehicleSpeed_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 184), "bind:double:", 1, *(double *)(a1 + 48));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "bind:double:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "bind:double:", 3, *(double *)(a1 + 56));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording vehicle speed"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "result";
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }

    }
  }
}

- (void)recordVehicleHeading:(double)a3 timestamp:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  double v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "!_closed";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MNTraceRecorder_recordVehicleHeading_timestamp___block_invoke;
  v11[3] = &unk_1E61D29E0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v14 = a3;
  v8 = v6;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);

}

void __50__MNTraceRecorder_recordVehicleHeading_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 192), "bind:double:", 1, *(double *)(a1 + 48));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "bind:double:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "bind:double:", 3, *(double *)(a1 + 56));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording vehicle heading"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "result";
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }

    }
  }
}

- (void)recordMotionUpdate:(unint64_t)a3 exitType:(unint64_t)a4 confidence:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[10];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "!_closed";
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__MNTraceRecorder_recordMotionUpdate_exitType_confidence___block_invoke;
  v16[3] = &unk_1E61D2A08;
  v16[4] = self;
  v16[5] = v10;
  v16[6] = v13;
  v16[7] = a3;
  v16[8] = a4;
  v16[9] = a5;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v16);
}

void __58__MNTraceRecorder_recordMotionUpdate_exitType_confidence___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 200), "bind:double:", 1, *(double *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "bind:double:", 2, *(double *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "bind:int:", 3, *(unsigned int *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "bind:int:", 4, *(unsigned int *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "bind:int:", 5, *(unsigned int *)(a1 + 72));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording motion update"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "result";
        v7 = 2112;
        v8 = v3;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v5, 0x16u);
      }

    }
  }
}

- (void)recordCompassHeading:(double)a3 magneticHeading:(double)a4 accuracy:(double)a5 timestamp:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "!_closed";
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!self->_recordingCompassHeadingLastDate || (objc_msgSend(v11, "timeIntervalSinceDate:"), v13 >= 1.0))
  {
    objc_storeStrong((id *)&self->_recordingCompassHeadingLastDate, v12);
    -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__MNTraceRecorder_recordCompassHeading_magneticHeading_accuracy_timestamp___block_invoke;
    v17[3] = &unk_1E61D2A30;
    v17[4] = self;
    v19 = v14;
    v18 = v10;
    v20 = a3;
    v21 = a4;
    v22 = a5;
    -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v17);

  }
}

void __75__MNTraceRecorder_recordCompassHeading_magneticHeading_accuracy_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 208), "bind:double:", 1, *(double *)(a1 + 48));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "bind:double:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "bind:double:", 3, *(double *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "bind:double:", 4, *(double *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "bind:double:", 5, *(double *)(a1 + 72));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording compass heading"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "result";
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }

    }
  }
}

- (void)recordVirtualGarageVehicleState:(id)a3 isDifferentVehicle:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  MNTraceRecorder *v13;
  uint64_t v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "!_closed";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__MNTraceRecorder_recordVirtualGarageVehicleState_isDifferentVehicle___block_invoke;
  v11[3] = &unk_1E61D2A58;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v15 = a4;
  v8 = v6;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);

}

void __70__MNTraceRecorder_recordVirtualGarageVehicleState_isDifferentVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  int v42;
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentVehicleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "bind:double:", 1, *(double *)(a1 + 48));
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(*(id *)(a1 + 32), "lastStateUpdateDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bind:double:", 2);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("(unknown)");
  objc_msgSend(v5, "bind:string:", 3, v8);

  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "currentEVRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "measurementByConvertingToUnit:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v9, "bind:double:", 4);

  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "maxEVRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "measurementByConvertingToUnit:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v13, "bind:double:", 5);

  v17 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "batteryPercentage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v17, "bind:double:", 6);

  v19 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "minBatteryCapacity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "measurementByConvertingToUnit:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v19, "bind:double:", 7);

  v23 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "currentBatteryCapacity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "measurementByConvertingToUnit:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v23, "bind:double:", 8);

  v27 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "maxBatteryCapacity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "measurementByConvertingToUnit:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v27, "bind:double:", 9);

  v31 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "consumptionArguments");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = (const __CFString *)v32;
  else
    v34 = CFSTR("(unknown)");
  objc_msgSend(v31, "bind:string:", 10, v34);

  v35 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  objc_msgSend(v2, "chargingArguments");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    v38 = (const __CFString *)v36;
  else
    v38 = CFSTR("(unknown)");
  objc_msgSend(v35, "bind:string:", 11, v38);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "bind:int:", 12, objc_msgSend(v2, "isCharging"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "bind:int:", 13, objc_msgSend(v2, "activeConnector"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "bind:int:", 14, objc_msgSend(v2, "origin"));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "bind:data:", 15, v39);

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "execute") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording EV data"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = 136315394;
      v43 = "result";
      v44 = 2112;
      v45 = v40;
      _os_log_impl(&dword_1B0AD7000, v41, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v42, 0x16u);
    }

  }
}

- (void)_logError:(id)a3 resultCode:(int)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 != 101)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543618;
      v8 = v5;
      v9 = 1024;
      v10 = a4;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "%{public}@: %d", (uint8_t *)&v7, 0x12u);
    }

  }
}

- (void)recordRouteCreationAction:(unint64_t)a3 request:(id)a4 response:(id)a5 error:(id)a6 anchorPoints:(id)a7 requestDate:(id)a8 responseDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  char *v30;
  NSObject *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (self->_traceType != 2)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v41 = "-[MNTraceRecorder recordRouteCreationAction:request:response:error:anchorPoints:requestDate:responseDate:]";
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
      v44 = 1024;
      v45 = 1258;
      v46 = 2080;
      v47 = "_traceType == MNTraceTypeCustomRouteCreation";
      v48 = 2112;
      v49 = v28;
      _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "!_closed";
      v42 = 2112;
      v43 = v30;
      _os_log_impl(&dword_1B0AD7000, v31, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  objc_msgSend(v19, "timeIntervalSinceDate:", self->_recordingStartDate);
  v22 = v21;
  objc_msgSend(v20, "timeIntervalSinceDate:", self->_recordingStartDate);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __106__MNTraceRecorder_recordRouteCreationAction_request_response_error_anchorPoints_requestDate_responseDate___block_invoke;
  v32[3] = &unk_1E61D2A80;
  v37 = v22;
  v38 = v23;
  v32[4] = self;
  v33 = v15;
  v39 = a3;
  v34 = v16;
  v35 = v18;
  v36 = v17;
  v24 = v17;
  v25 = v18;
  v26 = v16;
  v27 = v15;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v32);

}

void __106__MNTraceRecorder_recordRouteCreationAction_request_response_error_anchorPoints_requestDate_responseDate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    v3 = *(void **)(v1 + 248);
    if (!v3)
    {
      v4 = *(void **)(v1 + 8);
      v22 = 0;
      objc_msgSend(v4, "prepareStatement:outError:", CFSTR("INSERT INTO custom_route_creation_actions (request_timestamp, response_timestamp, request_data, response_data, response_error_data, anchor_points_data, action) VALUES (:request_time, :response_time, :request, :response, :error, :anchor_points, :action)"), &v22);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v22;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 248);
      *(_QWORD *)(v7 + 248) = v5;

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating record route creation action statement: %@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v24 = "-[MNTraceRecorder recordRouteCreationAction:request:response:error:anchorPoints:requestDate:responseDate:]_block_invoke";
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
          v27 = 1024;
          v28 = 1273;
          v29 = 2080;
          v30 = "NO";
          v31 = 2112;
          v32 = v9;
          _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
        }

        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 248);
        *(_QWORD *)(v11 + 248) = 0;

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
      }

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    }
    objc_msgSend(v3, "bindParameter:double:", CFSTR(":request_time"), *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "bindParameter:double:", CFSTR(":response_time"), *(double *)(a1 + 80));
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bindParameter:data:", CFSTR(":request"), v14);

    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    objc_msgSend(*(id *)(a1 + 48), "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bindParameter:data:", CFSTR(":response"), v16);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "bindParameter:int:", CFSTR(":action"), *(unsigned int *)(a1 + 88));
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 56), 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "bindParameter:data:", CFSTR(":anchor_points"), v17);
    v18 = *(_QWORD *)(a1 + 64);
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "bindParameter:data:", CFSTR(":error"), v19);

    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording route creation action."));
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "result";
        v25 = 2112;
        v26 = v20;
        _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

    }
  }
}

- (void)_recordNavigationUpdate:(int64_t)a3 parameters:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  int64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_closed)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot complete operation on closed trace."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "!_closed";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[MNTraceRecorder timeSinceRecordingBegan](self, "timeSinceRecordingBegan");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__MNTraceRecorder__recordNavigationUpdate_parameters___block_invoke;
  v11[3] = &unk_1E61D29E0;
  v13 = v7;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v11);

}

void __54__MNTraceRecorder__recordNavigationUpdate_parameters___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 232), "bind:double:", 1, *(double *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "bind:int:", 2, *(unsigned int *)(a1 + 56));
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 232);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bind:data:", 3, v6);

    }
    else
    {
      objc_msgSend(*(id *)(v4 + 232), "bindNull:", 3);
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "execute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error recording navigation update"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "result";
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v9, 0x16u);
      }

    }
  }
}

- (void)_updateNavigationEventsWithLocationReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "traceIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location does not have ID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "location.traceIndex != NSNotFound";
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  -[NSMapTable objectForKey:](self->_eventsPendingLocationReference, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v20;
      *(_QWORD *)&v8 = 136315394;
      v18 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v6);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "intValue", v18);
          -[MNTracePreparedStatement bind:int:](self->_updateNavigationEventLocationID, "bind:int:", 1, objc_msgSend(v4, "traceIndex"));
          -[MNTracePreparedStatement bind:int:](self->_updateNavigationEventLocationID, "bind:int:", 2, v12);
          if (!-[MNTracePreparedStatement execute](self->_updateNavigationEventLocationID, "execute"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error updating location ID for navigation event"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            GEOFindOrCreateLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v25 = "result";
              v26 = 2112;
              v27 = v13;
              _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
            }

          }
          ++v11;
        }
        while (v9 != v11);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v9 = v15;
      }
      while (v15);
    }
    -[NSMapTable removeObjectForKey:](self->_eventsPendingLocationReference, "removeObjectForKey:", v4);
  }

}

- (void)_executeStatementForQuery:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__MNTraceRecorder__executeStatementForQuery_handler___block_invoke;
      v9[3] = &unk_1E61D2850;
      v9[4] = self;
      v10 = v6;
      v11 = v7;
      -[MNTraceRecorder _dispatchWrite:](self, "_dispatchWrite:", v9);

    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "_prepareStatementForQuery was called with a nil query.", buf, 2u);
      }

    }
  }

}

void __53__MNTraceRecorder__executeStatementForQuery_handler___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db"), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), objc_msgSend(*(id *)(a1 + 40), "length"), &ppStmt, 0);
  if (v2)
  {
    v3 = v2;
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = sqlite3_errmsg((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db"));
      *(_DWORD *)buf = 138412802;
      v14 = v5;
      v15 = 1024;
      v16 = v3;
      v17 = 2080;
      v18 = v6;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Error preparing statement for query \"%@\": %d | \"%s\", buf, 0x1Cu);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v7 = sqlite3_step(ppStmt);
    if (v7 != 101)
    {
      v8 = v7;
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = sqlite3_errmsg((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db"));
        *(_DWORD *)buf = 138412802;
        v14 = v10;
        v15 = 1024;
        v16 = v8;
        v17 = 2080;
        v18 = v11;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error executing statement for query \"%@\": %d | \"%s\", buf, 0x1Cu);
      }

    }
    sqlite3_finalize(ppStmt);
  }
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (MNTrace)trace
{
  return self->_trace;
}

- (NSDate)recordingStartDate
{
  return self->_recordingStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_eventsPendingLocationReference, 0);
  objc_storeStrong((id *)&self->_recordRouteCreationActionStatement, 0);
  objc_storeStrong((id *)&self->_updateNavigationEventLocationID, 0);
  objc_storeStrong((id *)&self->_recordNavigationUpdate, 0);
  objc_storeStrong((id *)&self->_recordNavigationEvent, 0);
  objc_storeStrong((id *)&self->_recordVirtualGarageVehicleState, 0);
  objc_storeStrong((id *)&self->_recordCompassHeading, 0);
  objc_storeStrong((id *)&self->_recordMotionData, 0);
  objc_storeStrong((id *)&self->_recordVehicleHeading, 0);
  objc_storeStrong((id *)&self->_recordVehicleSpeed, 0);
  objc_storeStrong((id *)&self->_recordRealtimeTransitUpdateResponseError, 0);
  objc_storeStrong((id *)&self->_recordRealtimeTransitUpdateResponse, 0);
  objc_storeStrong((id *)&self->_recordRealtimeTransitUpdateRequest, 0);
  objc_storeStrong((id *)&self->_recordETAUStatement, 0);
  objc_storeStrong((id *)&self->_recordDirectionsStatement, 0);
  objc_storeStrong((id *)&self->_recordMatchInfoStatement, 0);
  objc_storeStrong((id *)&self->_recordLocationErrorStatement, 0);
  objc_storeStrong((id *)&self->_recordLocationStatement, 0);
  objc_storeStrong((id *)&self->_recordStylesheetStatement, 0);
  objc_storeStrong((id *)&self->_recordAudioSettingStatement, 0);
  objc_storeStrong((id *)&self->_recordDebugSettingStatement, 0);
  objc_storeStrong((id *)&self->_recordEnvironmentInfoStatement, 0);
  objc_storeStrong((id *)&self->_updateNavigationEndTimeStatement, 0);
  objc_storeStrong((id *)&self->_updateNavigationStartTimeStatement, 0);
  objc_storeStrong((id *)&self->_updateDirectionsStartTimeStatement, 0);
  objc_storeStrong((id *)&self->_updateRecordingStartTimeStatement, 0);
  objc_storeStrong((id *)&self->_recordingCompassHeadingLastDate, 0);
  objc_storeStrong((id *)&self->_recordingStartDate, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_trace, 0);
}

@end
