@implementation NSURLStorageURLCacheDB

- (uint64_t)stepSQLStatement:(void *)a1 toCompletionWithRetry:(sqlite3_stmt *)a2
{
  const char *v3;
  uint64_t v4;
  uint64_t result;

  if (a2)
  {
    v4 = sqlite3_step(a2);
    result = 0;
    if ((v4 - 100) >= 2 && (_DWORD)v4)
    {
      if ((_DWORD)v4 == 19)
      {
        return 19;
      }
      else
      {
        objc_getProperty(a1, v3, 168, 1);
        CFLog();
        return v4;
      }
    }
  }
  else
  {
    CFLog();
    return 1;
  }
  return result;
}

- (uint64_t)openAndPrepareWriteCacheDB_NoLock
{
  uint64_t result;
  uint64_t v4;
  char *v5;
  int v6;
  const char *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  int v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  int v19;
  char *v20;
  int v21;
  char *v22;
  int v23;
  char *v24;
  int v25;
  char *v26;
  int v27;
  char *v28;
  int v29;

  if (*((_QWORD *)self + 2))
    return 1;
  v4 = *((_QWORD *)self + 22);
  if (v4 < 5242880)
  {
    if (v4 >= 1)
    {
      objc_getProperty(self, a2, 160, 1);
      CFLog();
    }
    return 0;
  }
  else
  {
    result = -[NSURLStorageURLCacheDB _openDBWriteConnections]((sqlite3 **)self, a2);
    if ((_DWORD)result)
    {
      if (*((_QWORD *)self + 2))
      {
        if (!*((_QWORD *)self + 5))
        {
          v5 = sqlite3_mprintf("INSERT into cfurl_cache_response (version, hash_value, storage_policy, \t\t\t\t\t\t\t\t\t request_key, partition) VALUES (%q, %q, %q, %q, %q);",
                 "?",
                 "?",
                 "?",
                 "?",
                 "?");
          v6 = strlen(v5);
          if (sqlite3_prepare_v2(*((sqlite3 **)self + 2), v5, v6, (sqlite3_stmt **)self + 5, 0))
          {
            objc_getProperty(self, v7, 168, 1);
            CFLog();
          }
          sqlite3_free(v5);
        }
        if (!*((_QWORD *)self + 6))
        {
          v8 = sqlite3_mprintf("INSERT into cfurl_cache_blob_data (entry_ID, response_object, request_object,\t\t\t\t\t\t\t\t\t proto_props, user_info) \t\t\t\t\t\t\t\t\t VALUES (%q, %q, %q, %q, %q);",
                 "?",
                 "?",
                 "?",
                 "?",
                 "?");
          v9 = strlen(v8);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v8, v9, (sqlite3_stmt **)self + 6, 0);
          sqlite3_free(v8);
        }
        if (!*((_QWORD *)self + 7))
        {
          v10 = sqlite3_mprintf("INSERT into cfurl_cache_receiver_data (entry_ID, isDataOnFS, receiver_data) \t\t\t\t\t\t\t\t\t VALUES (%q, %q, %q);",
                  "?",
                  "?",
                  "?");
          v11 = strlen(v10);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v10, v11, (sqlite3_stmt **)self + 7, 0);
          sqlite3_free(v10);
        }
        if (!*((_QWORD *)self + 8))
        {
          v12 = sqlite3_mprintf("UPDATE cfurl_cache_response SET version=%q, hash_value=%q, storage_policy=%q, partition=%q\t\t\t\t\t\t\t\t\t WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?",
                  "?",
                  "?");
          v13 = strlen(v12);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v12, v13, (sqlite3_stmt **)self + 8, 0);
          sqlite3_free(v12);
        }
        if (!*((_QWORD *)self + 9))
        {
          v14 = sqlite3_mprintf("UPDATE cfurl_cache_blob_data SET response_object=%q, request_object=%q,\t\t\t\t\t\t\t\t\t proto_props=%q, user_info=%q WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?",
                  "?",
                  "?");
          v15 = strlen(v14);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v14, v15, (sqlite3_stmt **)self + 9, 0);
          sqlite3_free(v14);
        }
        if (!*((_QWORD *)self + 4))
        {
          v16 = sqlite3_mprintf("UPDATE cfurl_cache_receiver_data SET receiver_data=%q, isDataOnFS=%q WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?");
          v17 = strlen(v16);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v16, v17, (sqlite3_stmt **)self + 4, 0);
          sqlite3_free(v16);
        }
        if (!*((_QWORD *)self + 11))
        {
          v18 = sqlite3_mprintf("SELECT r.entry_ID, d.receiver_data, d.isDataOnFS FROM cfurl_cache_response r, cfurl_cache_receiver_data d WHERE r.request_key=%q AND d.entry_ID=r.entry_ID", "?");
          v19 = strlen(v18);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v18, v19, (sqlite3_stmt **)self + 11, 0);
          sqlite3_free(v18);
        }
        if (!*((_QWORD *)self + 12))
        {
          v20 = sqlite3_mprintf("SELECT isDataOnFS,receiver_data FROM cfurl_cache_receiver_data WHERE entry_ID=%q", "?");
          v21 = strlen(v20);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v20, v21, (sqlite3_stmt **)self + 12, 0);
          sqlite3_free(v20);
        }
        if (!*((_QWORD *)self + 13))
        {
          v22 = sqlite3_mprintf("SELECT receiver_data from %s WHERE isDataOnFS > 0 AND entry_ID in \t\t\t\t\t\t\t\t\t (SELECT entry_ID from cfurl_cache_response WHERE entry_ID > 0 ORDER BY time_stamp ASC LIMIT %q)", "cfurl_cache_receiver_data", "?");
          v23 = strlen(v22);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v22, v23, (sqlite3_stmt **)self + 13, 0);
          sqlite3_free(v22);
        }
        if (*((_QWORD *)self + 2))
        {
          if (!*((_QWORD *)self + 14))
          {
            v24 = sqlite3_mprintf("DELETE from cfurl_cache_response WHERE entry_ID=%s;", "?");
            v25 = strlen(v24);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v24, v25, (sqlite3_stmt **)self + 14, 0);
            sqlite3_free(v24);
          }
          if (!*((_QWORD *)self + 15))
          {
            v26 = sqlite3_mprintf("DELETE from cfurl_cache_blob_data WHERE entry_ID=%s;", "?");
            v27 = strlen(v26);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v26, v27, (sqlite3_stmt **)self + 15, 0);
            sqlite3_free(v26);
          }
          if (!*((_QWORD *)self + 16))
          {
            v28 = sqlite3_mprintf("DELETE from cfurl_cache_receiver_data WHERE entry_ID=%s;", "?");
            v29 = strlen(v28);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v28, v29, (sqlite3_stmt **)self + 16, 0);
            sqlite3_free(v28);
          }
        }
      }
      return 1;
    }
  }
  return result;
}

- (const)createCachedResponseForKey:(uint64_t)a1 cacheDataPath:(void *)a2 cacheDataFile:(_QWORD *)a3 caller:(_QWORD *)a4
{
  id v7;
  const void *v8;
  const __CFString *v9;
  __CFString *v10;
  char *v11;
  os_unfair_lock_s *v12;
  __CFString *v13;
  int v14;
  int v15;
  UInt8 *v16;
  int v17;
  const UInt8 *v18;
  const UInt8 *v19;
  const UInt8 *v20;
  const unsigned __int8 *v21;
  int v22;
  uint64_t v23;
  id v24;
  SEL v25;
  id v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t CachedResponseFromParts;
  uint64_t v32;
  char *v34;
  __CFString *v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  __CFString *v39;
  const UInt8 *v40;
  int v41;
  BOOL v42;

  v7 = a2;
  v42 = 0;
  if ((*(_BYTE *)(a1 + 153) & 1) == 0
    || !*(_QWORD *)(a1 + 80) && !-[NSURLStorageURLCacheDB _prepareDBSelectStatements](a1))
  {
    v8 = 0;
    goto LABEL_36;
  }
  v9 = (const __CFString *)v7;
  v10 = (__CFString *)v9;
  if (!*(_QWORD *)(a1 + 80))
  {
    v13 = 0;
    v8 = 0;
    goto LABEL_34;
  }
  v11 = _ExtractCStringfromCFStringRef(v9, &v42);
  if (!v11)
  {
    v8 = 0;
    goto LABEL_35;
  }
  v12 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 80), 1, v11, -1, 0))
  {
    v8 = 0;
    v13 = 0;
    goto LABEL_32;
  }
  v37 = a4;
  v38 = a3;
  v34 = v11;
  v35 = v10;
  v36 = v7;
  v39 = 0;
  v8 = 0;
  while (1)
  {
    v14 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
    v15 = v14;
    if (v14 > 22)
      break;
    if (v14)
      goto LABEL_29;
LABEL_16:
    sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 0);
    v41 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 1);
    v40 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 2);
    v16 = (UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 3);
    v17 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 4);
    v18 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 5);
    v19 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 6);
    v20 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 7);
    v21 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 80), 8);
    v22 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 5);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
      v23 = objc_claimAutoreleasedReturnValue();

      v39 = (__CFString *)v23;
    }
    if (v17 && v18)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      v26 = objc_getProperty((id)a1, v25, 160, 1);
      *v38 = (id)objc_msgSend(v24, "initWithString:", v26);

      *v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v18, 4);
LABEL_22:
      v27 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 2);
      v28 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 3);
      v29 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 6);
      v30 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 7);
      CachedResponseFromParts = __createCachedResponseFromParts(v41, v40, v27, v16, v28, v18, v22, v19, v29, v20, v30);
      v8 = (const void *)CachedResponseFromParts;
      if (CachedResponseFromParts)
      {
        v32 = *(_QWORD *)(CachedResponseFromParts + 16);
        if (v32)
          *(_BYTE *)(v32 + 24) = 1;
      }
      goto LABEL_26;
    }
    if (v18)
      goto LABEL_22;
    CFLog();
LABEL_26:
    if (v15 != 100)
      goto LABEL_31;
  }
  if (v14 == 100)
    goto LABEL_16;
  if (v14 == 101)
    goto LABEL_31;
LABEL_29:
  if (v8)
  {
    CFRelease(v8);
    v8 = 0;
  }
LABEL_31:
  v7 = v36;
  v12 = (os_unfair_lock_s *)(a1 + 24);
  v13 = v39;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 80));
  v11 = v34;
  v10 = v35;
LABEL_32:
  os_unfair_lock_unlock(v12);
  if (v42)
    MEMORY[0x186DB7474](v11, 0x1000C8077774924);
LABEL_34:

  v10 = v13;
LABEL_35:

LABEL_36:
  return v8;
}

- (uint64_t)execSQLStatement:(uint64_t)a1 onConnection:(char *)sql toCompletionWithRetry:(sqlite3 *)a3 writeLockHeld:(int)a4
{
  uint64_t v4;
  unint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  char v12;
  const char *v13;
  int v16;
  char *errmsg;

  errmsg = 0;
  v4 = 1;
  if (sql && a3)
  {
    v9 = 0;
    v10 = (os_unfair_lock_s *)(a1 + 28);
    while (1)
    {
      v11 = sqlite3_exec(a3, sql, 0, 0, &errmsg);
      v4 = v11;
      v12 = 1;
      if ((int)v11 > 18)
      {
        if ((v11 - 100) < 2)
          goto LABEL_20;
        if ((_DWORD)v11 == 19)
          goto LABEL_22;
      }
      else if ((_DWORD)v11 == 11)
      {
        if (a4)
          os_unfair_lock_unlock(v10);
        v16 = 141;
        v4 = sqlite3_file_control(a3, 0, 101, &v16);
        -[NSURLStorageURLCacheDB updateToCurrentSchema](a1, v13);
        if (a4)
          os_unfair_lock_lock(v10);
        v12 = 0;
      }
      else if (!(_DWORD)v11)
      {
LABEL_20:
        v4 = 0;
        goto LABEL_22;
      }
      if (errmsg)
        break;
      if (v9++ >= 9)
        v12 = 0;
      if ((v12 & 1) == 0)
        return v4;
    }
    CFLog();
LABEL_22:
    if (errmsg)
      sqlite3_free(errmsg);
  }
  return v4;
}

- (_BYTE)getEntryIDandReceiverDataForRequestKey:(sqlite3_stmt *)a1
{
  int v4;
  _BYTE *v5;
  int v6;
  int v8;
  int v9;
  int v10;
  _QWORD *v11;
  int v12;
  const unsigned __int8 *v13;
  int v14;
  char *v15;

  if (!-[NSURLStorageURLCacheDB openAndPrepareWriteCacheDB_NoLock](a1, a2))
    return 0;
  v4 = sqlite3_bind_text(a1[11], 1, a2, -1, 0);
  v5 = 0;
  if (!v4)
  {
    v6 = sqlite3_step(a1[11]);
    if (v6 == 100 || v6 == 0)
    {
      v8 = sqlite3_column_count(a1[11]);
      v9 = v8 - 1;
      if (v8 >= 1)
      {
        v10 = v8;
        v11 = malloc_type_malloc(0x18uLL, 0x1010040760DC88DuLL);
        v5 = v11;
        if (!v11)
          goto LABEL_20;
        *v11 = 0;
        v11[1] = 0;
        *(_QWORD *)((char *)v11 + 13) = 0;
        if (sqlite3_column_type(a1[11], v10 - 3) == 1)
          *(_QWORD *)v5 = sqlite3_column_int64(a1[11], v10 - 3);
        if (sqlite3_column_type(a1[11], v9) != 1)
          goto LABEL_20;
        if (!sqlite3_column_int64(a1[11], v9))
          goto LABEL_20;
        v5[20] = 1;
        v12 = v10 - 2;
        if ((sqlite3_column_type(a1[11], v10 - 2) - 3) > 1)
          goto LABEL_20;
        v13 = sqlite3_column_text(a1[11], v10 - 2);
        v14 = sqlite3_column_bytes(a1[11], v12);
        v15 = (char *)malloc_type_malloc(v14 + 1, 0x921F41FBuLL);
        *((_QWORD *)v5 + 1) = v15;
        if (v15)
        {
          *((_DWORD *)v5 + 4) = v14;
          strncpy(v15, (const char *)v13, v14);
          *(_BYTE *)(*((_QWORD *)v5 + 1) + *((int *)v5 + 4)) = 0;
LABEL_20:
          sqlite3_reset(a1[11]);
          return v5;
        }
        CFLog();
        free(v5);
      }
    }
    v5 = 0;
    goto LABEL_20;
  }
  return v5;
}

- (void)updateFSBackedCacheUsageOnDisk
{
  const __CFString *v3;
  const char *v4;
  __CFString *v5;
  CFURLCacheFS *FS2;
  CFURLCacheFS *v7;
  char *v8;
  int v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  _BYTE buf[18];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (const __CFString *)objc_getProperty(a1, a2, 160, 1);
    if (v3)
    {
      v5 = (__CFString *)v3;
      FS2 = _CFURLCacheCreateFS2(v3);
      if (FS2)
      {
        v7 = FS2;
        v14 = 0;
        v8 = _ExtractCStringfromCFStringRef(*((const __CFString **)FS2 + 10), &v14);
        if (v8)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          v9 = dirstat_np();
          v10 = *(_QWORD *)buf;
          if (v9 == -1)
            v11 = *__error();
          else
            v11 = 0;
          if (v14)
            MEMORY[0x186DB7474](v8, 0x1000C8077774924);
          if ((v11 & 0xFFFFFFFD) != 0)
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v12 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              v13 = *((_QWORD *)v7 + 10);
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v11;
              _os_log_error_impl(&dword_183ECA000, v12, OS_LOG_TYPE_ERROR, "ERROR: unable to determine file-system usage for FS-backed cache at %@. Errno=%{errno}d", buf, 0x12u);
            }
          }
        }
        else
        {
          v10 = 0;
        }
        a1[23] = v10;
        (*(void (**)(CFURLCacheFS *))(*(_QWORD *)v7 + 8))(v7);
      }

    }
    else
    {
      objc_getProperty(a1, v4, 160, 1);
      CFLog();
    }
    a1[25] = a1[23] + a1[24];
  }
}

- (void)updateSQLiteDBCacheUsageOnDisk
{
  const char *v2;
  void *v3;
  id v4;
  SEL v5;
  void *v6;
  SEL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_getProperty(a1, v2, 168, 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), objc_getProperty(a1, v5, 168, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), objc_getProperty(a1, v7, 168, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, &v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v23;
      v11 = v10;
      if (v9 || !v10)
      {
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        a1[24] = objc_msgSend(v12, "integerValue");

      }
      else
      {
        v19 = v4;
        CFLog();
      }
      v22 = v11;
      objc_msgSend(v3, "attributesOfItemAtPath:error:", v6, &v22, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;

      if (v13 || !v14)
      {
        objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        a1[24] += objc_msgSend(v15, "integerValue");

      }
      else
      {
        v20 = v6;
        CFLog();
      }
      v21 = v14;
      objc_msgSend(v3, "attributesOfItemAtPath:error:", v8, &v21, v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;

      if (v16 || !v17)
      {
        objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        a1[24] += objc_msgSend(v18, "integerValue");

      }
      else
      {
        CFLog();
      }

    }
    a1[25] = a1[23] + a1[24];

  }
}

- (uint64_t)isSchemaCurrent
{
  const char *v3;
  int v4;
  sqlite3_stmt *ppStmt;

  if (-[NSURLStorageURLCacheDB _openDBReadConnections]((uint64_t)a1, a2))
  {
    ppStmt = 0;
    if (!sqlite3_prepare_v2(a1[1], "PRAGMA user_version", -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v4 = sqlite3_column_int(ppStmt, 0);
        sqlite3_finalize(ppStmt);
        if (v4 == 203)
          return 1;
      }
      else
      {
        sqlite3_finalize(ppStmt);
      }
    }
    -[NSURLStorageURLCacheDB _closeDBReadConnections]((uint64_t)a1);
  }
  else
  {
    objc_getProperty(a1, v3, 168, 1);
    CFLog();
  }
  return 0;
}

- (uint64_t)_openDBReadConnections
{
  uint64_t v3;
  const char *v4;
  int v5;
  int v6;
  sqlite3 *v7;

  v3 = 1;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(objc_getProperty((id)a1, a2, 168, 1)), "cStringUsingEncoding:", 4);
  if (volumeSupportsFileProtection(v4))
    v5 = 3211270;
  else
    v5 = 65542;
  if ((*(_BYTE *)(a1 + 153) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    if (!*(_QWORD *)(a1 + 8))
    {
      v6 = sqlite3_open_v2(v4, (sqlite3 **)(a1 + 8), v5, 0);
      v7 = *(sqlite3 **)(a1 + 8);
      if (!v6)
      {
        sqlite3_db_config(v7, 1001, 0, 1200, 32);
        sqlite3_busy_timeout(*(sqlite3 **)(a1 + 8), 1000);
        v3 = 1;
        *(_BYTE *)(a1 + 153) = 1;
        goto LABEL_9;
      }
      sqlite3_errmsg(v7);
      CFLog();
    }
    v3 = 0;
LABEL_9:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  return v3;
}

- (_QWORD)initWithDBPath:(uint64_t)a3 maxSize:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SEL v9;
  SEL v10;
  void *v11;
  SEL v12;
  objc_super v14;

  v5 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)NSURLStorageURLCacheDB;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    a1[1] = 0;
    a1[2] = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    v7 = (void *)a1[17];
    a1[17] = v6;

    a1[22] = a3;
    a1[26] = 4096;
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_setProperty_atomic(a1, v9, v8, 160);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/Cache.db"), objc_getProperty(a1, v10, 160, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v12, v11, 168);

    a1[3] = 0;
  }

  return a1;
}

- (BOOL)_prepareDBSelectStatements
{
  os_unfair_lock_s *v2;
  _BOOL8 v3;
  char *v4;
  int v5;

  if (!*(_QWORD *)(a1 + 8))
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*(_QWORD *)(a1 + 80))
  {
    v3 = 1;
  }
  else
  {
    v4 = sqlite3_mprintf("SELECT r.version, r.storage_policy, b.response_object, b.proto_props, d.isDataOnFS, d.receiver_data, b.request_object, b.user_info, r.time_stamp FROM cfurl_cache_response r, cfurl_cache_blob_data b, cfurl_cache_receiver_data d WHERE r.request_key=%q AND b.entry_ID=r.entry_ID AND b.entry_ID=d.entry_ID;",
           "?");
    v5 = strlen(v4);
    v3 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 8), v4, v5, (sqlite3_stmt **)(a1 + 80), 0) == 0;
    sqlite3_free(v4);
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

- (uint64_t)_openDBWriteConnections
{
  const char *v3;
  int v4;
  sqlite3 **v5;
  sqlite3 *v6;
  int v7;
  NSObject *v9;
  int v10;
  char value;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(objc_getProperty(a1, a2, 168, 1)), "fileSystemRepresentation");
  v4 = volumeSupportsFileProtection(v3);
  v6 = a1[2];
  v5 = a1 + 2;
  if (v6)
    return 0;
  if (v4)
    v7 = 3211270;
  else
    v7 = 65542;
  if (sqlite3_open_v2(v3, v5, v7, 0))
  {
    sqlite3_errmsg(*v5);
    CFLog();
    return 0;
  }
  value = -1;
  if (setxattr(v3, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v9 = (id)CFNLog::logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *__error();
      *(_DWORD *)buf = 136315394;
      v13 = v3;
      v14 = 1024;
      v15 = v10;
      _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, "Failed to set can-suspend-locked at %s: %{errno}d", buf, 0x12u);
    }

  }
  sqlite3_db_config(*v5, 1001, 0, 1200, 32);
  sqlite3_busy_timeout(*v5, 1000);
  return 1;
}

- (void)dealloc
{
  sqlite3_stmt *sqlSelectStmt;
  objc_super v4;

  if (self)
  {
    os_unfair_lock_lock(&self->_dbWriteConnectionLock);
    sqlSelectStmt = self->_sqlSelectStmt;
    if (sqlSelectStmt)
    {
      sqlite3_reset(sqlSelectStmt);
      sqlite3_finalize(self->_sqlSelectStmt);
      self->_sqlSelectStmt = 0;
    }
    -[NSURLStorageURLCacheDB _finalizeDBInsertUpdateStatements](&self->super.isa);
    -[NSURLStorageURLCacheDB _finalizeDBDeleteStatements](&self->super.isa);
    -[NSURLStorageURLCacheDB _closeDBReadConnections]((uint64_t)self);
    -[NSURLStorageURLCacheDB _closeDBWriteConnections]((uint64_t)self);
    os_unfair_lock_unlock(&self->_dbWriteConnectionLock);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLStorageURLCacheDB;
  -[NSURLStorageURLCacheDB dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbPathFile, 0);
  objc_storeStrong((id *)&self->_dbPathDirectory, 0);
  objc_storeStrong((id *)&self->_entryIDsToDelete, 0);
}

- (void)_closeDBReadConnections
{
  os_unfair_lock_s *v2;
  sqlite3 *v3;

  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v3 = *(sqlite3 **)(a1 + 8);
  if (v3)
  {
    if (sqlite3_close(v3))
      CFLog();
    else
      *(_QWORD *)(a1 + 8) = 0;
  }
  *(_BYTE *)(a1 + 153) = 0;
  os_unfair_lock_unlock(v2);
}

- (uint64_t)_closeDBWriteConnections
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 16);
  if (result)
  {
    result = sqlite3_close((sqlite3 *)result);
    if ((_DWORD)result)
      return CFLog();
    else
      *(_QWORD *)(a1 + 16) = 0;
  }
  return result;
}

- (sqlite3_stmt)_finalizeDBInsertUpdateStatements
{
  sqlite3_stmt *v2;
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *result;

  v2 = a1[5];
  if (v2)
  {
    sqlite3_reset(v2);
    sqlite3_finalize(a1[5]);
    a1[5] = 0;
  }
  v3 = a1[6];
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_finalize(a1[6]);
    a1[6] = 0;
  }
  v4 = a1[7];
  if (v4)
  {
    sqlite3_reset(v4);
    sqlite3_finalize(a1[7]);
    a1[7] = 0;
  }
  v5 = a1[9];
  if (v5)
  {
    sqlite3_reset(v5);
    sqlite3_finalize(a1[9]);
    a1[9] = 0;
  }
  v6 = a1[4];
  if (v6)
  {
    sqlite3_reset(v6);
    sqlite3_finalize(a1[4]);
    a1[4] = 0;
  }
  result = a1[8];
  if (result)
  {
    sqlite3_reset(result);
    result = (sqlite3_stmt *)sqlite3_finalize(a1[8]);
    a1[8] = 0;
  }
  return result;
}

- (sqlite3_stmt)_finalizeDBDeleteStatements
{
  sqlite3_stmt *v2;
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *result;

  v2 = a1[15];
  if (v2)
  {
    sqlite3_reset(v2);
    sqlite3_finalize(a1[15]);
    a1[15] = 0;
  }
  v3 = a1[16];
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_finalize(a1[16]);
    a1[16] = 0;
  }
  v4 = a1[14];
  if (v4)
  {
    sqlite3_reset(v4);
    sqlite3_finalize(a1[14]);
    a1[14] = 0;
  }
  v5 = a1[11];
  if (v5)
  {
    sqlite3_reset(v5);
    sqlite3_finalize(a1[11]);
    a1[11] = 0;
  }
  v6 = a1[12];
  if (v6)
  {
    sqlite3_reset(v6);
    sqlite3_finalize(a1[12]);
    a1[12] = 0;
  }
  result = a1[13];
  if (result)
  {
    sqlite3_reset(result);
    result = (sqlite3_stmt *)sqlite3_finalize(a1[13]);
    a1[13] = 0;
  }
  return result;
}

- (sqlite3)openReadWriteConnection
{
  const char *v2;
  int v3;
  int v4;
  sqlite3 *ppDb;

  v2 = (const char *)objc_msgSend(objc_retainAutorelease(objc_getProperty(a1, a2, 168, 1)), "cStringUsingEncoding:", 4);
  ppDb = 0;
  if (volumeSupportsFileProtection(v2))
    v3 = 3211270;
  else
    v3 = 65542;
  v4 = sqlite3_open_v2(v2, &ppDb, v3, 0);
  if (v4)
  {
    if (v4 != 14)
    {
      sqlite3_errmsg(ppDb);
      CFLog();
    }
  }
  else
  {
    sqlite3_busy_timeout(ppDb, 1000);
  }
  return ppDb;
}

- (uint64_t)updateToCurrentSchema
{
  uint64_t v2;
  const __CFString *v3;
  const char *v4;
  __CFString *v5;
  CFURLCacheFS *FS2;
  CFURLCacheFS *v7;
  const __CFAllocator *v8;
  CFStringRef Copy;
  const __CFString *v10;
  CFStringRef v11;
  const __CFString *v12;
  const std::__fs::filesystem::path *CStringfromCFStringRef;
  std::__fs::filesystem::path *v14;
  std::error_code *v15;
  NSObject *v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const __CFString *v20;
  __CFString *MutableCopy;
  const __CFString *v22;
  std::error_code *v23;
  std::__fs::filesystem::path *v24;
  const char *v25;
  int v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  int v35;
  const char *v36;
  const char *v37;
  int v38;
  const char *v39;
  sqlite3 *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  std::__fs::filesystem::path *__from;
  const __CFUUID *uuid;
  CFUUIDRef uuida;
  stat v76;
  BOOL v77[2];
  BOOL v78[2];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  int v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v2 = self;
    if (!*(_BYTE *)(self + 152))
    {
      *(_BYTE *)(self + 152) = 1;
      if (!*(_QWORD *)(self + 16))
      {
        v28 = *(_QWORD *)(self + 176);
        if (v28 < 5242880)
        {
          if (v28 >= 1)
          {
            objc_getProperty((id)self, a2, 160, 1);
            self = CFLog();
          }
          goto LABEL_102;
        }
        self = -[NSURLStorageURLCacheDB _openDBWriteConnections]((sqlite3 **)self, a2);
        if (!(_DWORD)self)
        {
LABEL_102:
          *(_BYTE *)(v2 + 152) = 0;
          return self;
        }
      }
      v3 = (const __CFString *)objc_getProperty((id)v2, a2, 160, 1);
      if (v3)
      {
        v5 = (__CFString *)v3;
        FS2 = _CFURLCacheCreateFS2(v3);
        if (FS2)
        {
          v7 = FS2;
          *(_WORD *)v77 = 0;
          v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *((CFStringRef *)FS2 + 10));
          if (Copy)
          {
            v10 = Copy;
            v11 = CFStringCreateWithFormat(v8, 0, CFSTR("%@/%s_remove"), *((_QWORD *)v7 + 9), "fsCachedData");
            if (v11)
            {
              v12 = v11;
              CStringfromCFStringRef = (const std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v10, &v77[1]);
              v14 = (std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v12, v77);
              if (!stat((const char *)v14, &v76) && v76.st_size && removefile((const char *)v14, 0, 1u))
              {
                if (CFNLog::onceToken != -1)
                  dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                v16 = CFNLog::logger;
                if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                {
                  if (v14)
                    v34 = (const char *)v14;
                  else
                    v34 = "NULL";
                  v35 = *__error();
                  *(_DWORD *)buf = 136315394;
                  v80 = (void *)v34;
                  v81 = 1024;
                  LODWORD(v82) = v35;
                  _os_log_error_impl(&dword_183ECA000, v16, OS_LOG_TYPE_ERROR, "purgeEntireFileSystemStore - failed to remove existing target dir %s.  Errno=%{errno}d", buf, 0x12u);
                }
              }
              rename(CStringfromCFStringRef, v14, v15);
              if (v18)
              {
                if (*__error() != 2)
                {
                  if (CFNLog::onceToken != -1)
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                  v19 = CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                  {
                    v36 = "NULL";
                    if (CStringfromCFStringRef)
                      v37 = (const char *)CStringfromCFStringRef;
                    else
                      v37 = "NULL";
                    if (v14)
                      v36 = (const char *)v14;
                    uuida = (CFUUIDRef)v36;
                    v38 = *__error();
                    *(_DWORD *)buf = 136315650;
                    v80 = (void *)v37;
                    v81 = 2080;
                    v82 = uuida;
                    v83 = 1024;
                    v84 = v38;
                    _os_log_error_impl(&dword_183ECA000, v19, OS_LOG_TYPE_ERROR, "purgeEntireFileSystemStore - failed to rename the current cache dir %s to new cache dir %s.  Errno=%{errno}d", buf, 0x1Cu);
                  }
                  *(_WORD *)v78 = 0;
                  __from = (std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v10, v78);
                  uuid = CFUUIDCreate(v8);
                  if (uuid)
                  {
                    v20 = CFUUIDCreateString(v8, uuid);
                    if (v20)
                    {
                      MutableCopy = CFStringCreateMutableCopy(v8, 0, v10);
                      v22 = MutableCopy;
                      if (MutableCopy)
                      {
                        CFStringAppend(MutableCopy, v20);
                        v24 = (std::__fs::filesystem::path *)_ExtractCStringfromCFStringRef(v22, &v78[1]);
                        if (v24)
                        {
                          rename(__from, v24, v23);
                          if (v26)
                          {
                            if (CFNLog::onceToken != -1)
                              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                            v72 = CFNLog::logger;
                            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                            {
                              v27 = *__error();
                              *(_DWORD *)buf = 136315650;
                              v80 = __from;
                              v81 = 2080;
                              v82 = v24;
                              v83 = 1024;
                              v84 = v27;
                              _os_log_error_impl(&dword_183ECA000, v72, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure path cleanup also failed to rename the current cache dir %s to new cache dir %s.  Errno=%{errno}d", buf, 0x1Cu);
                            }
                          }
                          else
                          {
                            CFURLCacheFS::asyncCacheDirectoryRemove((CFURLCacheFS *)v24, v25);
                          }
                          if (v78[1])
                            MEMORY[0x186DB7474](v24, 0x1000C8077774924);
                        }
                        else
                        {
                          if (CFNLog::onceToken != -1)
                            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                          v33 = CFNLog::logger;
                          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v80 = (void *)v22;
                            _os_log_error_impl(&dword_183ECA000, v33, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure extract char string from CFStringRef:%@", buf, 0xCu);
                          }
                        }
                        CFRelease(v22);
                      }
                      else
                      {
                        if (CFNLog::onceToken != -1)
                          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                        v32 = CFNLog::logger;
                        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v80 = (void *)v10;
                          _os_log_error_impl(&dword_183ECA000, v32, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure to create a mutable string from CFStringRef:%@", buf, 0xCu);
                        }
                      }
                      CFRelease(v20);
                    }
                    else
                    {
                      if (CFNLog::onceToken != -1)
                        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                      v31 = CFNLog::logger;
                      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_183ECA000, v31, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure to create a string from a UUID.", buf, 2u);
                      }
                    }
                    CFRelease(uuid);
                  }
                  else
                  {
                    if (CFNLog::onceToken != -1)
                      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                    v30 = CFNLog::logger;
                    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_183ECA000, v30, OS_LOG_TYPE_ERROR, "fallbackPurgeEntireFileSystemStore - failure to create a UUID.", buf, 2u);
                    }
                  }
                  if (v78[0] && __from)
                    MEMORY[0x186DB7474](__from, 0x1000C8077774924);
                }
              }
              else
              {
                CFURLCacheFS::asyncCacheDirectoryRemove((CFURLCacheFS *)v14, v17);
              }
              if (v77[1] && CStringfromCFStringRef)
                MEMORY[0x186DB7474](CStringfromCFStringRef, 0x1000C8077774924);
              if (v14 && v77[0])
                MEMORY[0x186DB7474](v14, 0x1000C8077774924);
              CFRelease(v12);
            }
            else
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v29 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v76.st_dev) = 0;
                _os_log_error_impl(&dword_183ECA000, v29, OS_LOG_TYPE_ERROR, "purgeEntireFileSystemStore - unable to allocate string for new path.", (uint8_t *)&v76, 2u);
              }
            }
            CFRelease(v10);
          }
          (*(void (**)(CFURLCacheFS *))(*(_QWORD *)v7 + 8))(v7);
        }

      }
      else
      {
        objc_getProperty((id)v2, v4, 160, 1);
        CFLog();
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v2 + 28));
      v40 = *(sqlite3 **)(v2 + 16);
      if (!v40)
      {
        v40 = -[NSURLStorageURLCacheDB openReadWriteConnection]((void *)v2, v39);
        if (!v40)
        {
LABEL_101:
          self = -[NSURLStorageURLCacheDB _closeDBWriteConnections](v2);
          *(_QWORD *)(v2 + 200) = 0;
          goto LABEL_102;
        }
      }
      if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "PRAGMA auto_vacuum = 2;",
                           v40))
      {
        v42 = objc_getProperty((id)v2, v41, 168, 1);
        v43 = sqlite3_errmsg(v40);
        v44 = sqlite3_errcode(v40);
        NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: _dbWriteConnection=%p DB=%@ pragma auto vacuum - %s. ErrCode: %d."), v40, v42, v43, v44);
      }
      else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "PRAGMA journal_mode=WAL;",
                                v40))
      {
        v42 = objc_getProperty((id)v2, v45, 168, 1);
        v46 = sqlite3_errmsg(v40);
        v47 = sqlite3_errcode(v40);
        NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ pragma wal enable - %s. ErrCode: %d."), v42, v46, v47);
      }
      else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "DROP table IF EXISTS cfurl_cache_schema_version;",
                                v40))
      {
        v42 = objc_getProperty((id)v2, v48, 168, 1);
        v49 = sqlite3_errmsg(v40);
        v50 = sqlite3_errcode(v40);
        NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: _dbWriteConnection=%p DB=%@ drop schema table - %s. ErrCode: %d."), v40, v42, v49, v50);
      }
      else
      {
        -[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "DROP table IF EXISTS cfurl_cache_response;",
          v40);
        if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "CREATE table cfurl_cache_response(entry_ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, \t version INTEGER, hash_value INTEGER, storage_policy INTEGER, request_key TEXT UNIQUE, \t time_stamp NOT NULL DEFAULT CURRENT_TIMESTAMP, partition TEXT);",
                             v40))
        {
          v42 = objc_getProperty((id)v2, v51, 168, 1);
          v52 = sqlite3_errmsg(v40);
          v53 = sqlite3_errcode(v40);
          NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ response create - %s. ErrCode: %d."), v42, v52, v53);
        }
        else
        {
          -[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "DROP table IF EXISTS cfurl_cache_blob_data;",
            v40);
          if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "CREATE table cfurl_cache_blob_data(entry_ID INTEGER PRIMARY KEY, response_object BLOB, request_object BLOB, \t\t\t  proto_props BLOB, user_info BLOB);",
                               v40))
          {
            v42 = objc_getProperty((id)v2, v54, 168, 1);
            v55 = sqlite3_errmsg(v40);
            v56 = sqlite3_errcode(v40);
            NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ blob_data create - %s. ErrCode: %d."), v42, v55, v56);
          }
          else if (sqlite3_exec(v40, "DROP table IF EXISTS cfurl_cache_receiver_data;", 0, 0, 0)
                 || sqlite3_exec(v40, "CREATE table cfurl_cache_receiver_data(entry_ID INTEGER PRIMARY KEY, isDataOnFS INTEGER, receiver_data BLOB);",
                      0,
                      0,
                      0))
          {
            v42 = objc_getProperty((id)v2, v57, 168, 1);
            v58 = sqlite3_errmsg(v40);
            v59 = sqlite3_errcode(v40);
            NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ receiver_data recreate - %s. ErrCode: %d."), v42, v58, v59);
          }
          else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "CREATE INDEX request_key_index ON cfurl_cache_response(request_key);",
                                    v40))
          {
            v42 = objc_getProperty((id)v2, v60, 168, 1);
            v61 = sqlite3_errmsg(v40);
            v62 = sqlite3_errcode(v40);
            NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ index on request_key - %s. ErrCode: %d."), v42, v61, v62);
          }
          else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "CREATE INDEX time_stamp_index ON cfurl_cache_response(time_stamp);",
                                    v40))
          {
            v42 = objc_getProperty((id)v2, v63, 168, 1);
            v64 = sqlite3_errmsg(v40);
            v65 = sqlite3_errcode(v40);
            NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ table index on time_stamp - %s. ErrCode: %d."), v42, v64, v65);
          }
          else if (-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "CREATE INDEX proto_props_index ON cfurl_cache_blob_data(entry_ID);",
                                    v40))
          {
            v42 = objc_getProperty((id)v2, v66, 168, 1);
            v67 = sqlite3_errmsg(v40);
            v68 = sqlite3_errcode(v40);
            NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ table index on blob_data - %s. ErrCode: %d.\n"), v42, v67, v68);
          }
          else
          {
            if (!-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "CREATE INDEX receiver_data_index ON cfurl_cache_receiver_data(entry_ID);",
                                  v40)
              && !-[NSURLStorageURLCacheDB execSQLStatement:onConnection:toCompletionWithRetry:writeLockHeld:](v2, "PRAGMA user_version=203", v40))
            {
              goto LABEL_100;
            }
            v42 = objc_getProperty((id)v2, v69, 168, 1);
            v70 = sqlite3_errmsg(v40);
            v71 = sqlite3_errcode(v40);
            NSLog(CFSTR("ERROR: NSURLStorageURLCacheDB _setDBSchema: DB=%@ table index on receiver_data - %s. ErrCode: %d."), v42, v70, v71);
          }
        }
      }

LABEL_100:
      -[NSURLStorageURLCacheDB _finalizeDBDeleteStatements]((sqlite3_stmt **)v2);
      -[NSURLStorageURLCacheDB _finalizeDBInsertUpdateStatements]((sqlite3_stmt **)v2);
      -[NSURLStorageURLCacheDB _closeDBWriteConnections](v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 28));
      goto LABEL_101;
    }
  }
  return self;
}

void __44__NSURLStorageURLCacheDB_deleteAllResponses__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 28));
}

sqlite3 *__44__NSURLStorageURLCacheDB_deleteAllResponses__block_invoke_2(uint64_t a1)
{
  sqlite3 *result;
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(sqlite3 **)(a1 + 40);
  if (v2)
    v3 = result == 0;
  else
    v3 = 1;
  if (!v3)
    return (sqlite3 *)sqlite3_close(result);
  return result;
}

@end
