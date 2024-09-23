@implementation MSObjectQueue

- (MSObjectQueue)initWithPath:(id)a3
{
  id v4;
  MSObjectQueue *v5;
  void *v6;
  void *v7;
  id v8;
  sqlite3 **p_db;
  int v10;
  int v11;
  char v12;
  MSObjectQueue *v13;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  const unsigned __int8 *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  void *v23;
  objc_super v24;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MSObjectQueue;
  ppStmt = 0;
  v5 = -[MSObjectQueue init](&v24, sel_init);
  if (!v5)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  v8 = objc_retainAutorelease(v4);
  p_db = &v5->_db;
  if (!sqlite3_open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v5->_db))
  {
    v23 = 0;
    if (sqlite3_exec(*p_db, "pragma journal_mode = wal;", 0, 0, (char **)&v23)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      v28 = 2082;
      v29 = v23;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not set journal mode. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (sqlite3_exec(*p_db, "create table if not exists Properties(\n   key             text primary key,\n   value           text\n);\n"
           "create table if not exists Queue (\n"
           "   size            integer,\n"
           "   object          blob,\n"
           "   errorCount      integer\n"
           ");\n"
           "create index if not exists QueueBySize on Queue (size asc);\n",
           0,
           0,
           (char **)&v23))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        sqlite3_free(v23);
LABEL_13:
        v12 = 1;
LABEL_14:
        if (ppStmt)
          sqlite3_finalize(ppStmt);
        if ((v12 & 1) != 0)
          goto LABEL_17;
        v5->_statements = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], &initWithPath__doNothingCallbacks);
LABEL_19:
        v13 = v5;
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446210;
      v27 = v23;
      v17 = MEMORY[0x1E0C81028];
      v18 = "Could not create tables. Error: %{public}s";
LABEL_34:
      _os_log_error_impl(&dword_1D3E94000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
      goto LABEL_10;
    }
    v10 = sqlite3_prepare_v2(*p_db, "select value from Properties where key = 'version';", -1, &ppStmt, 0);
    if (v10)
    {
      v11 = v10;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v11;
      v20 = MEMORY[0x1E0C81028];
      v21 = "SQL operation failed with code %d";
      goto LABEL_37;
    }
    v15 = sqlite3_step(ppStmt);
    if (v15 == 100)
    {
      v19 = sqlite3_column_text(ppStmt, 0);
      if (strcmp((const char *)v19, "0"))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        *(_DWORD *)buf = 136446210;
        v27 = (void *)v19;
        v20 = MEMORY[0x1E0C81028];
        v21 = "Wrong database version. Expected 0. Actual: %{public}s";
        v22 = 12;
LABEL_38:
        _os_log_error_impl(&dword_1D3E94000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
        goto LABEL_13;
      }
    }
    else
    {
      v16 = v15;
      if (v15 != 101)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v16;
        v20 = MEMORY[0x1E0C81028];
        v21 = "Could not retrieve database version. SQLITE error: %d";
LABEL_37:
        v22 = 8;
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Setting version number in queue database", buf, 2u);
      }
      if (sqlite3_exec(*p_db, "insert or replace into Properties (key, value) values ('version', '0');",
             0,
             0,
             (char **)&v23))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_DWORD *)buf = 136446210;
        v27 = v23;
        v17 = MEMORY[0x1E0C81028];
        v18 = "Could not update version number. Error: %{public}s";
        goto LABEL_34;
      }
    }
    v12 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not create sqlite3 object queue at path %@", buf, 0xCu);
  }
LABEL_17:
  v13 = 0;
LABEL_20:

  return v13;
}

- (void)dealloc
{
  __CFDictionary *statements;
  CFIndex Count;
  uint64_t v5;
  size_t v6;
  const void **v7;
  const void **v8;
  sqlite3_stmt **v9;
  sqlite3_stmt *v10;
  objc_super v11;

  statements = self->_statements;
  if (statements)
  {
    Count = CFDictionaryGetCount(statements);
    if (Count)
    {
      v5 = Count;
      v6 = 8 * Count;
      v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      v8 = (const void **)malloc_type_malloc(v6, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(self->_statements, v7, v8);
      if (v5 >= 1)
      {
        v9 = (sqlite3_stmt **)v8;
        do
        {
          v10 = *v9++;
          sqlite3_finalize(v10);
          --v5;
        }
        while (v5);
      }
      free(v7);
      free(v8);
    }
    CFRelease(self->_statements);
  }
  sqlite3_close(self->_db);
  v11.receiver = self;
  v11.super_class = (Class)MSObjectQueue;
  -[MSObjectQueue dealloc](&v11, sel_dealloc);
}

- (sqlite3_stmt)_statementLabel:(id)a3 query:(const char *)a4
{
  id v6;
  sqlite3_stmt *Value;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (CFDictionaryContainsKey(self->_statements, v6))
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_statements, v6);
  }
  else
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(self->_db, a4, -1, &ppStmt, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v11 = a4;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not compile SQL query: %{public}s", buf, 0xCu);
      }
      __assert_rtn("-[MSObjectQueue _statementLabel:query:]", "MSObjectQueue.m", 141, "0");
    }
    CFDictionarySetValue(self->_statements, v6, ppStmt);
    Value = ppStmt;
  }

  return Value;
}

- (int64_t)count
{
  sqlite3_stmt *v2;
  sqlite3_int64 v3;

  v2 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("count"), "select count(*) from Queue;");
  if (sqlite3_step(v2) == 100)
  {
    v3 = sqlite3_column_int64(v2, 0);
    if (!v2)
      return v3;
    goto LABEL_5;
  }
  v3 = 0;
  if (v2)
LABEL_5:
    sqlite3_reset(v2);
  return v3;
}

- (void)appendObjectWrappers:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  sqlite3_stmt *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  int v28;
  int v29;
  MSObjectQueue *v30;
  id obj;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = self;
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("appendObjectWrappers"), "insert into Queue (size, object) values (?, ?);");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v9 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D8255C20]();
        v13 = *(void **)(v9 + 1784);
        objc_msgSend(v11, "object");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v33;

        if (!v15)
        {
          v32 = v12;
          v17 = v5;
          v18 = v7;
          v19 = v8;
          v20 = v9;
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v16, "userInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("Failed to archive an MSObjectWrapper object. Error: %@ Info: %@"), v16, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v23;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

          v9 = v20;
          v8 = v19;
          v7 = v18;
          v5 = v17;
          v12 = v32;
        }
        v24 = sqlite3_reset(v5);
        if (v24)
        {
          v25 = v24;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
LABEL_23:
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v25;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
          goto LABEL_24;
        }
        v26 = sqlite3_bind_int64(v5, 1, objc_msgSend(v11, "size"));
        if (v26)
        {
          v25 = v26;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          goto LABEL_23;
        }
        v27 = objc_msgSend(v15, "length");
        if (v27 >> 31)
          __assert_rtn("-[MSObjectQueue appendObjectWrappers:]", "MSObjectQueue.m", 175, "objectDataLength <= INT_MAX");
        v28 = sqlite3_bind_blob(v5, 2, (const void *)objc_msgSend(objc_retainAutorelease(v15), "bytes"), v27, 0);
        if (v28)
        {
          v25 = v28;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          goto LABEL_23;
        }
        v29 = sqlite3_step(v5);
        if (v29 == 101)
        {
          objc_msgSend(v11, "setUniqueID:", sqlite3_last_insert_rowid(v30->_db));
          goto LABEL_24;
        }
        v25 = v29;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_23;
LABEL_24:

        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  sqlite3_reset(v5);
}

- (id)_objectWrapperFromQueueQuery:(sqlite3_stmt *)a3 outSize:(int64_t *)a4
{
  sqlite3_int64 v6;
  sqlite3_int64 v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = sqlite3_column_int64(a3, 0);
  v7 = sqlite3_column_int64(a3, 1);
  v8 = sqlite3_column_int(a3, 2);
  v9 = sqlite3_column_blob(a3, 3);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v9, sqlite3_column_bytes(a3, 3), 0);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unarchive object. Error: %{public}@", buf, 0xCu);
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (a4)
LABEL_4:
    *a4 = v7;
LABEL_5:
  +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", v11, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUniqueID:", v6);
  objc_msgSend(v13, "setErrorCount:", v8);

  return v13;
}

- (id)allObjectWrappersMaxCount:(int64_t)a3
{
  sqlite3_stmt *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue.", (uint8_t *)&v18, 0xCu);
  }
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("allObjectWrappersMaxCount"), "select rowid, size, errorCount, object from Queue limit ?;");
  v6 = sqlite3_reset(v5);
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v7;
      v8 = MEMORY[0x1E0C81028];
LABEL_22:
      _os_log_error_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)&v18, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = sqlite3_bind_int64(v5, 1, a3);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v10;
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
LABEL_8:
    v11 = 0;
    return v11;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v14 = sqlite3_step(v5);
    if (v14 != 100)
      break;
    -[MSObjectQueue _objectWrapperFromQueueQuery:outSize:](self, "_objectWrapperFromQueueQuery:outSize:", v5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  v16 = v14;
  if (v14 == 101)
  {
    sqlite3_reset(v5);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v13, "count");
      v18 = 134217984;
      v19 = v17;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", (uint8_t *)&v18, 0xCu);
    }
    v11 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v16;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", (uint8_t *)&v18, 8u);
    }
    sqlite3_reset(v5);
    v11 = 0;
  }

  return v11;
}

- (id)objectWrappersWithZeroSizeMaxCount:(int64_t)a3
{
  sqlite3_stmt *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue with zero size.", (uint8_t *)&v18, 0xCu);
  }
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("objectWrappersWithZeroSizeMaxCount"), "select rowid, size, errorCount, object from Queue where size = 0 limit ?;");
  v6 = sqlite3_reset(v5);
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v7;
      v8 = MEMORY[0x1E0C81028];
LABEL_22:
      _os_log_error_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)&v18, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = sqlite3_bind_int64(v5, 1, a3);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v10;
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
LABEL_8:
    v11 = 0;
    return v11;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v14 = sqlite3_step(v5);
    if (v14 != 100)
      break;
    -[MSObjectQueue _objectWrapperFromQueueQuery:outSize:](self, "_objectWrapperFromQueueQuery:outSize:", v5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  v16 = v14;
  if (v14 == 101)
  {
    sqlite3_reset(v5);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v13, "count");
      v18 = 134217984;
      v19 = v17;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", (uint8_t *)&v18, 0xCu);
    }
    v11 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v16;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", (uint8_t *)&v18, 8u);
    }
    sqlite3_reset(v5);
    v11 = 0;
  }

  return v11;
}

- (id)smallestObjectWrappersTargetTotalSize:(int64_t)a3 maxCount:(int64_t)a4
{
  sqlite3_stmt *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  id v13;
  void *v15;
  int64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _BYTE v23[12];
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v23 = 134218240;
    *(_QWORD *)&v23[4] = a4;
    v24 = 2048;
    v25 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue, target size: %lld bytes.", v23, 0x16u);
  }
  v7 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("smallestObjectReferencesTargetTotalSize"), "select rowid, size, errorCount, object from Queue where size != 0 order by size asc limit ?;");
  v8 = sqlite3_reset(v7);
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 67109120;
      *(_DWORD *)&v23[4] = v9;
      v10 = MEMORY[0x1E0C81028];
LABEL_28:
      _os_log_error_impl(&dword_1D3E94000, v10, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", v23, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = sqlite3_bind_int64(v7, 1, a4);
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 67109120;
      *(_DWORD *)&v23[4] = v12;
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_28;
    }
LABEL_8:
    v13 = 0;
    return v13;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") >= (unint64_t)a4 || a3 < 1)
    goto LABEL_20;
  v17 = 0;
  while (1)
  {
    v18 = sqlite3_step(v7);
    if (v18 != 100)
      break;
    *(_QWORD *)v23 = 0;
    -[MSObjectQueue _objectWrapperFromQueueQuery:outSize:](self, "_objectWrapperFromQueueQuery:outSize:", v7, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    v20 = *(_QWORD *)v23;
    if (objc_msgSend(v15, "count") < (unint64_t)a4)
    {
      v17 += v20;
      if (v17 < a3)
        continue;
    }
    goto LABEL_20;
  }
  v21 = v18;
  if (v18 == 101)
  {
LABEL_20:
    sqlite3_reset(v7);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_msgSend(v15, "count");
      *(_DWORD *)v23 = 134217984;
      *(_QWORD *)&v23[4] = v22;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", v23, 0xCu);
    }
    v13 = v15;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 67109120;
      *(_DWORD *)&v23[4] = v21;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", v23, 8u);
    }
    sqlite3_reset(v7);
    v13 = 0;
  }

  return v13;
}

- (id)allObjectWrappersOrderedByDescendingErrorCountMaxCount:(int64_t)a3
{
  sqlite3_stmt *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue ordered by errorCount.", (uint8_t *)&v18, 0xCu);
  }
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("allObjectsWrapperOrderedByDescendingErrorCountMaxCount"), "select rowid, size, errorCount, object from Queue order by errorCount desc limit ?;");
  v6 = sqlite3_reset(v5);
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v7;
      v8 = MEMORY[0x1E0C81028];
LABEL_22:
      _os_log_error_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)&v18, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = sqlite3_bind_int64(v5, 1, a3);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v10;
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
LABEL_8:
    v11 = 0;
    return v11;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v14 = sqlite3_step(v5);
    if (v14 != 100)
      break;
    -[MSObjectQueue _objectWrapperFromQueueQuery:outSize:](self, "_objectWrapperFromQueueQuery:outSize:", v5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  v16 = v14;
  if (v14 == 101)
  {
    sqlite3_reset(v5);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v13, "count");
      v18 = 134217984;
      v19 = v17;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", (uint8_t *)&v18, 0xCu);
    }
    v11 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v16;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", (uint8_t *)&v18, 8u);
    }
    sqlite3_reset(v5);
    v11 = 0;
  }

  return v11;
}

- (void)removeObjectWrappersFromQueue:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v25 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Removing %ld entries from the queue.", buf, 0xCu);
  }
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("removeObjectWrappersFromQueue"), "delete from Queue where rowid = ?;");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
    goto LABEL_19;
  v8 = v7;
  v9 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      v12 = sqlite3_reset(v5);
      if (v12)
      {
        v15 = v12;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v15;
        v16 = MEMORY[0x1E0C81028];
LABEL_21:
        _os_log_error_impl(&dword_1D3E94000, v16, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
        goto LABEL_19;
      }
      v13 = sqlite3_bind_int64(v5, 1, objc_msgSend(v11, "uniqueID", (_QWORD)v19));
      if (v13)
      {
        v17 = v13;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v17;
        v16 = MEMORY[0x1E0C81028];
        goto LABEL_21;
      }
      v14 = sqlite3_step(v5);
      if (v14 != 101)
      {
        v18 = v14;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v18;
        v16 = MEMORY[0x1E0C81028];
        goto LABEL_21;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
      continue;
    break;
  }
LABEL_19:

  sqlite3_reset(v5);
}

- (void)removeAllObjectWrappersFromQueue
{
  sqlite3_stmt *v3;
  int v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6[0]) = 0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Removing all entries from the queue.", (uint8_t *)v6, 2u);
  }
  v3 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("removeAllObjectWrappersFromQueue"), "delete from Queue;");
  v4 = sqlite3_step(v3);
  if (v4 != 101)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)v6, 8u);
    }
  }
  sqlite3_reset(v3);
}

- (void)commitErrorCountsForObjectWrappers:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Commiting error counts for %ld items.", buf, 0xCu);
  }
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("commitErrorCountsForObjectWrappers"), "update or ignore Queue set errorCount = ? where rowid = ?;");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v7)
    goto LABEL_24;
  v8 = v7;
  v9 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      v12 = sqlite3_reset(v5);
      if (v12)
      {
        v16 = v12;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v16;
        v17 = MEMORY[0x1E0C81028];
LABEL_23:
        _os_log_error_impl(&dword_1D3E94000, v17, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
        goto LABEL_24;
      }
      v13 = sqlite3_bind_int(v5, 1, objc_msgSend(v11, "errorCount", (_QWORD)v21));
      if (v13)
      {
        v18 = v13;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v18;
        v17 = MEMORY[0x1E0C81028];
        goto LABEL_23;
      }
      v14 = sqlite3_bind_int64(v5, 2, objc_msgSend(v11, "uniqueID"));
      if (v14)
      {
        v19 = v14;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v19;
        v17 = MEMORY[0x1E0C81028];
        goto LABEL_23;
      }
      v15 = sqlite3_step(v5);
      if (v15 != 101)
      {
        v20 = v15;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v20;
        v17 = MEMORY[0x1E0C81028];
        goto LABEL_23;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
      continue;
    break;
  }
LABEL_24:

  sqlite3_reset(v5);
}

- (void)commitObjectsWrappers:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int v24;
  id v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v40 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Updating objects for %ld items.", buf, 0xCu);
  }
  v5 = -[MSObjectQueue _statementLabel:query:](self, "_statementLabel:query:", CFSTR("commitObjectWrappers"), "update or ignore Queue set size = ?, object = ?, errorCount = ? where rowid = ?;");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v10 = MEMORY[0x1E0C81028];
    v31 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1D8255C20]();
        v14 = sqlite3_reset(v5);
        if (v14)
        {
          v15 = v14;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            goto LABEL_32;
LABEL_13:
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v15;
          _os_log_error_impl(&dword_1D3E94000, v10, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
          goto LABEL_32;
        }
        v16 = sqlite3_bind_int64(v5, 1, objc_msgSend(v12, "size"));
        if (v16)
        {
          v15 = v16;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            goto LABEL_32;
          goto LABEL_13;
        }
        v17 = (void *)MEMORY[0x1E0CB36F8];
        objc_msgSend(v12, "object");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v33);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v33;

        if (!v19)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v32, "userInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to archive an MSObjectWrapper object. Error: %@ Info: %@"), v32, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v40 = (uint64_t)v22;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

        }
        v23 = objc_msgSend(v19, "length");
        if (v23 >> 31)
          __assert_rtn("-[MSObjectQueue commitObjectsWrappers:]", "MSObjectQueue.m", 429, "objectDataLength <= INT_MAX");
        v24 = v23;
        v25 = objc_retainAutorelease(v19);
        v26 = sqlite3_bind_blob(v5, 2, (const void *)objc_msgSend(v25, "bytes"), v24, 0);
        if (v26)
        {
          v27 = v26;
          v10 = MEMORY[0x1E0C81028];
          v6 = v31;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_30;
        }
        else
        {
          v28 = sqlite3_bind_int(v5, 3, objc_msgSend(v12, "errorCount"));
          v6 = v31;
          if (v28)
          {
            v27 = v28;
            v10 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_30;
          }
          else
          {
            v29 = sqlite3_bind_int64(v5, 4, objc_msgSend(v12, "uniqueID"));
            v10 = MEMORY[0x1E0C81028];
            if (!v29)
            {
              v30 = sqlite3_step(v5);
              if (v30 == 101)
                goto LABEL_31;
              v27 = v30;
              if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                goto LABEL_31;
LABEL_30:
              *(_DWORD *)buf = 67109120;
              LODWORD(v40) = v27;
              _os_log_error_impl(&dword_1D3E94000, v10, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
              goto LABEL_31;
            }
            v27 = v29;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_30;
          }
        }
LABEL_31:

LABEL_32:
        objc_autoreleasePoolPop(v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }

  sqlite3_reset(v5);
}

@end
