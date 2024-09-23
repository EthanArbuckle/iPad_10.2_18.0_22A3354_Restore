@implementation AutoBugCaptureCacheDelete

uint64_t __47__AutoBugCaptureCacheDelete_registerCallbacks___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cacheDeletePeriodicWithInfo:");
  return objc_claimAutoreleasedReturnValue();
}

- (AutoBugCaptureCacheDelete)initWithStorageManager:(id)a3
{
  id v5;
  AutoBugCaptureCacheDelete *v6;
  AutoBugCaptureCacheDelete *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *logArchivePath;
  uint64_t v12;
  NSString *v13;
  NSMutableArray *v14;
  NSMutableArray *purgedFilePaths;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AutoBugCaptureCacheDelete;
  v6 = -[AutoBugCaptureCacheDelete init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storageManager, a3);
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logArchivePath");
    v10 = objc_claimAutoreleasedReturnValue();
    logArchivePath = v7->logArchivePath;
    v7->logArchivePath = (NSString *)v10;

    if (-[NSString hasPrefix:](v7->logArchivePath, "hasPrefix:", CFSTR("/var/")))
    {
      objc_msgSend(CFSTR("/private"), "stringByAppendingPathComponent:", v7->logArchivePath);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v7->logArchivePath;
      v7->logArchivePath = (NSString *)v12;

    }
    -[AutoBugCaptureCacheDelete registerCallbacks:](v7, "registerCallbacks:", "com.apple.symptomsd-diag.CacheDelete");
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    purgedFilePaths = v7->purgedFilePaths;
    v7->purgedFilePaths = v14;

  }
  return v7;
}

- (id)replyCacheDeleteDictionaryWithCDInfo:(id)a3 amount:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  NSString *logArchivePath;
  int v17;
  __CFString *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = (__CFString *)objc_alloc_init(v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = CFSTR("/private/var");
  if (-[NSString hasPrefix:](self->logArchivePath, "hasPrefix:", v10))
  {
    -[__CFString setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, CFSTR("CACHE_DELETE_VOLUME"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, CFSTR("CACHE_DELETE_AMOUNT"));

    storageLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "CacheDelete given back: %@", (uint8_t *)&v17, 0xCu);
    }

    v13 = v8;
  }
  else
  {
    storageLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      logArchivePath = self->logArchivePath;
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = logArchivePath;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "CacheDelete volume %@ and target path incompatible: %@", (uint8_t *)&v17, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)cacheDeletePeriodicWithInfo:(__CFDictionary *)a3
{
  NSObject *v5;
  DiagnosticStorageManager *storageManager;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  storageLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "CacheDelete cacheDeletePERIODICWithInfo", buf, 2u);
  }

  storageManager = self->_storageManager;
  if (storageManager)
  {
    v7 = -[DiagnosticStorageManager performPeriodicPurge](storageManager, "performPeriodicPurge");
  }
  else
  {
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "autoBugCaptureEnabled");

    if (v10)
    {
      storageLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "CacheDelete cacheDeletePERIODICWithInfo. ABC is enabled but storageManager is nil", v13, 2u);
      }

    }
    v7 = 0;
  }
  -[AutoBugCaptureCacheDelete replyCacheDeleteDictionaryWithCDInfo:amount:](self, "replyCacheDeleteDictionaryWithCDInfo:amount:", a3, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerCallbacks:(const char *)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  uint8_t buf[4];
  AutoBugCaptureCacheDelete *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CacheDeleteRegisterInfoCallbacks();
  if (v5 < 0)
  {
    v6 = v5;
    storageLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v9 = self;
      v10 = 1024;
      v11 = v6;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Failed to register with CacheDelete: %p, %d", buf, 0x12u);
    }

  }
}

- (void)initCacheDeletePurgeMonitor
{
  int v3;
  int v4;
  NSObject *v5;
  uint8_t buf[4];
  AutoBugCaptureCacheDelete *v7;
  __int16 v8;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  CacheDeleteInitPurgeMarker();
  CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[NSString fileSystemRepresentation](self->logArchivePath, "fileSystemRepresentation"), 0x8000100u);
  v10[0] = self->logArchivePath;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = CacheDeleteRegisterPurgeNotification();
  if (v3)
  {
    v4 = v3;
    storageLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v4;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "Failed to register Purge Notification CacheDelete: %p, %d", buf, 0x12u);
    }

  }
  else
  {
    CacheDeleteEnumerateRemovedFiles();
  }
}

uint64_t __56__AutoBugCaptureCacheDelete_initCacheDeletePurgeMonitor__block_invoke()
{
  return CacheDeleteEnumerateRemovedFiles();
}

uint64_t __56__AutoBugCaptureCacheDelete_initCacheDeletePurgeMonitor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPurgedFilesForCDEvents:", a2);
}

uint64_t __56__AutoBugCaptureCacheDelete_initCacheDeletePurgeMonitor__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPurgedFilesForCDEvents:", a2);
}

- (void)processPurgedFilesForCDEvents:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_20;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v6)
    goto LABEL_19;
  v7 = v6;
  v8 = *(_QWORD *)v21;
  v19 = v4;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rescan"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[DiagnosticStorageManager cleanupCasesAfterACentralizedCacheDeletePurgeEvent:](self->_storageManager, "cleanupCasesAfterACentralizedCacheDeletePurgeEvent:", 0);
LABEL_18:
        CacheDeleteSyncDone();
        v4 = v19;
        goto LABEL_19;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("historyDone"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[DiagnosticStorageManager cleanupCasesAfterACentralizedCacheDeletePurgeEvent:](self->_storageManager, "cleanupCasesAfterACentralizedCacheDeletePurgeEvent:", self->purgedFilePaths);
        -[NSMutableArray removeAllObjects](self->purgedFilePaths, "removeAllObjects");
        goto LABEL_18;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("path"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v14, "pathComponents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);

        if (objc_msgSend(v17, "containsObject:", CFSTR("private")))
        {
          objc_msgSend(v17, "removeObject:", CFSTR("private"));
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v18;
        }
        -[NSMutableArray addObject:](self->purgedFilePaths, "addObject:", v14);

      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v4 = v19;
    if (v7)
      continue;
    break;
  }
LABEL_19:

LABEL_20:
}

- (DiagnosticStorageManager)storageManager
{
  return self->_storageManager;
}

- (void)setStorageManager:(id)a3
{
  objc_storeStrong((id *)&self->_storageManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManager, 0);
  objc_storeStrong((id *)&self->purgedFilePaths, 0);
  objc_storeStrong((id *)&self->logArchivePath, 0);
}

@end
