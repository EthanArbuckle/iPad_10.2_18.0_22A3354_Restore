@implementation CPLEngineFileStorage

- (id)_markerURLForTrackAllStoresAndDeletes
{
  return -[NSURL URLByAppendingPathComponent:isDirectory:](self->_baseURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("track_storage_marker"), 0);
}

- (void)setTrackAllStoresAndDeletes:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CPLEngineFileStorage _markerURLForTrackAllStoresAndDeletes](self, "_markerURLForTrackAllStoresAndDeletes");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    objc_msgSend(v5, "removeItemAtURL:error:", v11, 0);
    goto LABEL_5;
  }
  objc_msgSend(v11, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeToURL:atomically:encoding:error:", v11, 1, 4, 0);

LABEL_5:
  }
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTrackAllStoresAndDeletes:", v3);

}

- (BOOL)trackAllStoresAndDeletes
{
  void *v2;
  char v3;

  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trackAllStoresAndDeletes");

  return v3;
}

- (void)setTrackAllStoresAndDeletesUntilEndOfTransaction:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (!self->_trackAllStoresAndDeletesUntilEndOfTransaction)
  {
    if (!a3)
      return;
    -[CPLEngineFileStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldResetPlatformTrackAllStoresAndDeletes = objc_msgSend(v6, "trackAllStoresAndDeletes") ^ 1;

    self->_trackAllStoresAndDeletesUntilEndOfTransaction = 1;
    -[CPLEngineFileStorage platformObject](self, "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v5 = 1;
    goto LABEL_7;
  }
  if (!a3)
  {
    self->_trackAllStoresAndDeletesUntilEndOfTransaction = 0;
    if (self->_shouldResetPlatformTrackAllStoresAndDeletes)
    {
      self->_shouldResetPlatformTrackAllStoresAndDeletes = 0;
      -[CPLEngineFileStorage platformObject](self, "platformObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4;
      v5 = 0;
LABEL_7:
      objc_msgSend(v4, "setTrackAllStoresAndDeletes:", v5);

    }
  }
}

- (BOOL)trackAllStoresAndDeletesUntilEndOfTransaction
{
  return self->_trackAllStoresAndDeletesUntilEndOfTransaction;
}

- (CPLEngineFileStorage)initWithBaseURL:(id)a3
{
  id v5;
  CPLEngineFileStorage *v6;
  uint64_t v7;
  NSURL *baseURL;
  dispatch_queue_t v9;
  OS_dispatch_queue *lock;
  NSString *logDomain;
  NSMutableArray *v12;
  NSMutableArray *uncommittedFiles;
  uint64_t v14;
  NSURL *crashMarkerURL;
  void *v16;
  uint64_t v17;
  CPLPlatformObject *platformObject;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CPLEngineFileStorage;
  v6 = -[CPLEngineFileStorage init](&v30, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    baseURL = v6->_baseURL;
    v6->_baseURL = (NSURL *)v7;

    v9 = dispatch_queue_create("com.apple.cpl.filestorage", MEMORY[0x1E0C80D50]);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_queue *)v9;

    logDomain = v6->_logDomain;
    v6->_logDomain = (NSString *)CFSTR("engine.filestorage");

    *(_WORD *)&v6->_keepOriginals = 256;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    uncommittedFiles = v6->_uncommittedFiles;
    v6->_uncommittedFiles = v12;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v6->_baseURL, "URLByAppendingPathComponent:isDirectory:", CFSTR(".fileStorageCrashMarker.plist"), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    crashMarkerURL = v6->_crashMarkerURL;
    v6->_crashMarkerURL = (NSURL *)v14;

    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "newPlatformImplementationForObject:", v6);
    platformObject = v6->_platformObject;
    v6->_platformObject = (CPLPlatformObject *)v17;

    if (!v6->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_1882();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v32 = v26;
          v27 = v26;
          _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, v29, 120, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
    -[CPLEngineFileStorage _markerURLForTrackAllStoresAndDeletes](v6, "_markerURLForTrackAllStoresAndDeletes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fileExistsAtPath:", v21);

    if (v22)
    {
      -[CPLEngineFileStorage platformObject](v6, "platformObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTrackAllStoresAndDeletes:", 1);

    }
  }

  return v6;
}

- (void)doRead:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CPLEngineFileStorage_doRead___block_invoke;
  block[3] = &unk_1E60D71F8;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (BOOL)doWrite:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *lock;
  id v8;
  int v9;
  BOOL v10;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1899;
  v20 = __Block_byref_object_dispose__1900;
  v21 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CPLEngineFileStorage_doWrite_error___block_invoke;
  block[3] = &unk_1E60D7CA8;
  v14 = &v22;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_barrier_sync(lock, block);
  v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = *((unsigned __int8 *)v23 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)_recoverFromCrashWithRecoveryHandler:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, void *);
  void *v7;
  __objc2_meth_list **p_class_meths;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_class **v13;
  uint64_t i;
  void *v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  NSMutableArray *uncommittedFiles;
  uint64_t (**v26)(id, void *);
  uint64_t v27;
  uint64_t v28;
  CPLEngineFileStorage *v29;
  __objc2_class **v30;
  __objc2_meth_list **v31;
  void *v32;
  char v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id *v39;
  void *v40;
  id obj;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfURL:", self->_crashMarkerURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v33 = 1;
    goto LABEL_42;
  }
  p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v49 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Found %lu uncommitted files in storage", buf, 0xCu);
    }

  }
  v39 = a4;
  v40 = v7;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    v13 = off_1E60D5000;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        -[__objc2_class identityFromStoredIdentity:](v13[27], "identityFromStoredIdentity:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v39);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
          goto LABEL_21;
        v16 = v6[2](v6, v15);
        if (v16)
          v17 = *((_BYTE *)p_class_meths + 3376) == 0;
        else
          v17 = 0;
        if (v17)
        {
          __CPLStorageOSLogDomain_1882();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v49 = (uint64_t)v15;
            _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Will keep %@", buf, 0xCu);
          }

        }
        if (v16)
        {
LABEL_21:
          v43 = 0;
          v19 = -[CPLEngineFileStorage deleteFileWithIdentity:error:](self, "deleteFileWithIdentity:error:", v15, &v43);
          v20 = v43;
          if (v19)
          {
            if (!*((_BYTE *)p_class_meths + 3376))
            {
              __CPLStorageOSLogDomain_1882();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v49 = (uint64_t)v15;
                v22 = v21;
                v23 = OS_LOG_TYPE_DEBUG;
                v24 = "Cleaned up %@";
                goto LABEL_28;
              }
              goto LABEL_29;
            }
          }
          else
          {
            uncommittedFiles = self->_uncommittedFiles;
            objc_msgSend(v15, "identityForStorage");
            v42 = v20;
            v26 = v6;
            v27 = v11;
            v28 = v12;
            v29 = self;
            v30 = v13;
            v31 = p_class_meths;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](uncommittedFiles, "addObject:", v32);

            p_class_meths = v31;
            v13 = v30;
            self = v29;
            v12 = v28;
            v11 = v27;
            v6 = v26;
            v20 = v42;
            if (!*((_BYTE *)p_class_meths + 3376))
            {
              __CPLStorageOSLogDomain_1882();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v49 = (uint64_t)v15;
                v22 = v21;
                v23 = OS_LOG_TYPE_ERROR;
                v24 = "Unable to clean up %@";
LABEL_28:
                _os_log_impl(&dword_1B03C2000, v22, v23, v24, buf, 0xCu);
              }
LABEL_29:

            }
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v11);
  }

  if (-[NSMutableArray count](self->_uncommittedFiles, "count"))
  {
    v33 = 1;
    -[NSMutableArray writeToURL:atomically:](self->_uncommittedFiles, "writeToURL:atomically:", self->_crashMarkerURL, 1);
LABEL_35:
    v7 = v40;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v34, "removeItemAtURL:error:", self->_crashMarkerURL, v39);

  if ((v33 & 1) != 0)
    goto LABEL_35;
  v7 = v40;
  if (!*((_BYTE *)p_class_meths + 3376))
  {
    __CPLStorageOSLogDomain_1882();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      -[NSURL path](self->_crashMarkerURL, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *v39;
      *(_DWORD *)buf = 138412546;
      v49 = (uint64_t)v36;
      v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_ERROR, "Unable to delete crash marker at %@. Can't open the database: %@", buf, 0x16u);

    }
    v33 = 0;
  }
LABEL_42:

  return v33;
}

- (BOOL)openWithRecoveryHandler:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSURL *baseURL;
  void *v12;
  char v13;
  _BOOL4 v14;
  NSObject *v15;
  NSURL *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  id v21;
  int v23;
  NSURL *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Opening", (uint8_t *)&v23, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", self->_baseURL, 1, 0, a4);

  if ((v9 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      baseURL = self->_baseURL;
      v23 = 138412290;
      v24 = baseURL;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Unable to create folder %@", (uint8_t *)&v23, 0xCu);
    }

  }
  if (!v9)
    goto LABEL_21;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "openWithError:", a4);

  if ((v13 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[CPLEngineFileStorage platformObject](self, "platformObject");
        v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
        v21 = *a4;
        v23 = 138412546;
        v24 = v16;
        v25 = 2112;
        v26 = v21;
        v17 = "%@ failed to open: %@";
        v18 = v15;
        v19 = OS_LOG_TYPE_ERROR;
        v20 = 22;
        goto LABEL_19;
      }
LABEL_20:

      LOBYTE(v14) = v13;
      goto LABEL_22;
    }
LABEL_21:
    LOBYTE(v14) = 0;
    goto LABEL_22;
  }
  v14 = -[CPLEngineFileStorage _recoverFromCrashWithRecoveryHandler:error:](self, "_recoverFromCrashWithRecoveryHandler:error:", v6, a4);
  if (v14 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[NSURL path](self->_baseURL, "path");
      v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v16;
      v17 = "Opened storage at %@";
      v18 = v15;
      v19 = OS_LOG_TYPE_DEBUG;
      v20 = 12;
LABEL_19:
      _os_log_impl(&dword_1B03C2000, v18, v19, v17, (uint8_t *)&v23, v20);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
LABEL_22:

  return v14;
}

- (BOOL)closeWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Opening", (uint8_t *)&v14, 2u);
    }

  }
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "closeWithError:", a3);

  if ((v7 & 1) != 0)
  {
    if (-[NSMutableArray count](self->_uncommittedFiles, "count") && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = -[NSMutableArray count](self->_uncommittedFiles, "count");
        v14 = 134217984;
        v15 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Storage still has %lu uncommitted files", (uint8_t *)&v14, 0xCu);
      }

    }
    -[NSMutableArray removeAllObjects](self->_uncommittedFiles, "removeAllObjects");
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[NSURL path](self->_baseURL, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = (uint64_t)v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Closed storage at %@", (uint8_t *)&v14, 0xCu);

      }
LABEL_17:

    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *a3;
      v14 = 138412290;
      v15 = (uint64_t)v12;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Error closing: %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_17;
  }
  return v7;
}

- (unint64_t)countOfUncommittedFiles
{
  return -[NSMutableArray count](self->_uncommittedFiles, "count");
}

- (BOOL)hasCrashMarker
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_crashMarkerURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (void)_addIdentityToUncommittedFiles:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identityForStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Adding %@ to the list of uncommitted files", (uint8_t *)&v9, 0xCu);
    }

  }
  -[NSMutableArray addObject:](self->_uncommittedFiles, "addObject:", v5);
  if ((-[NSMutableArray writeToURL:atomically:](self->_uncommittedFiles, "writeToURL:atomically:", self->_crashMarkerURL, 1) & 1) == 0&& !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[NSURL path](self->_crashMarkerURL, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Unable to store the crash recovery file to %@", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)_removeIdentityFromUncommittedFiles:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  NSURL *crashMarkerURL;
  char v15;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSObject identityForStorage](v4, "identityForStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray indexOfObject:](self->_uncommittedFiles, "indexOfObject:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Removing %@ from the list of uncommitted files", buf, 0xCu);
      }

    }
    -[NSMutableArray removeObjectAtIndex:](self->_uncommittedFiles, "removeObjectAtIndex:", v7);
    if (!-[NSMutableArray count](self->_uncommittedFiles, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      crashMarkerURL = self->_crashMarkerURL;
      v16 = 0;
      v15 = objc_msgSend(v13, "removeItemAtURL:error:", crashMarkerURL, &v16);
      v9 = v16;

      if ((v15 & 1) != 0 || _CPLSilentLogging)
        goto LABEL_17;
      __CPLStorageOSLogDomain_1882();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      v11 = "Unable to remove crash recovery file: %@";
      v12 = v10;
LABEL_15:
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
LABEL_16:

      goto LABEL_17;
    }
    if ((-[NSMutableArray writeToURL:atomically:](self->_uncommittedFiles, "writeToURL:atomically:", self->_crashMarkerURL, 1) & 1) == 0&& !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        goto LABEL_18;
      }
      -[NSURL path](self->_crashMarkerURL, "path");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      v11 = "Unable to store the crash recovery file to %@";
      v12 = v9;
      goto LABEL_15;
    }
  }
LABEL_18:

}

- (BOOL)_fixupIdentity:(id)a3 fileURL:(id)a4 data:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "fileUTI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
    {
      objc_msgSend(v8, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathExtension");
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    +[CPLResourceIdentity fileUTIForExtension:](CPLResourceIdentity, "fileUTIForExtension:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileUTI:", v14);

  }
  objc_msgSend(v8, "fingerPrint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("fingerprint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a6)
      *a6 = objc_retainAutorelease(v16);

  }
  return v15 != 0;
}

- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  NSObject *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  char v27;
  uint64_t v28;

  v10 = a6;
  v11 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEBUG, "Storing %@ with identity %@", buf, 0x16u);
    }

  }
  if (!-[CPLEngineFileStorage _fixupIdentity:fileURL:data:error:](self, "_fixupIdentity:fileURL:data:error:", v15, v14, 0, a8))
  {
    LOBYTE(v19) = 0;
LABEL_12:
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *a8;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Error storing file: %@", buf, 0xCu);
      }

    }
    goto LABEL_16;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27 = 0;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__CPLEngineFileStorage_storeFileAtURL_identity_isOriginal_moveIfPossible_needsCommit_error___block_invoke;
  v23[3] = &unk_1E60DDB30;
  v25 = buf;
  v23[4] = self;
  v18 = v15;
  v24 = v18;
  v19 = objc_msgSend(v17, "storeFileAtURL:identity:isOriginal:moveIfPossible:needsCommit:onNewFile:error:", v14, v18, v11, v10, a7, v23, a8);

  if (v19)
  {
    objc_msgSend(v18, "setAvailable:", 1);
    objc_msgSend(v18, "setFileURL:", 0);
  }
  else if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[CPLEngineFileStorage _removeIdentityFromUncommittedFiles:](self, "_removeIdentityFromUncommittedFiles:", v18);
  }

  _Block_object_dispose(buf, 8);
  if ((v19 & 1) == 0)
    goto LABEL_12;
LABEL_16:

  return v19;
}

- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  NSObject *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  _BYTE *v23;
  _BYTE buf[24];
  char v25;
  uint64_t v26;

  v9 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = objc_msgSend(v12, "length");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Storing %lu bytes with identity %@", buf, 0x16u);
    }

  }
  if (!-[CPLEngineFileStorage _fixupIdentity:fileURL:data:error:](self, "_fixupIdentity:fileURL:data:error:", v13, 0, v12, a7))
  {
    LOBYTE(v17) = 0;
LABEL_12:
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *a7;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Error storing data: %@", buf, 0xCu);
      }

    }
    goto LABEL_16;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v25 = 0;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__CPLEngineFileStorage_storeData_identity_isOriginal_needsCommit_error___block_invoke;
  v21[3] = &unk_1E60DDB30;
  v23 = buf;
  v21[4] = self;
  v16 = v13;
  v22 = v16;
  v17 = objc_msgSend(v15, "storeData:identity:isOriginal:needsCommit:onNewFile:error:", v12, v16, v9, a6, v21, a7);

  if (v17)
  {
    objc_msgSend(v16, "setAvailable:", 1);
    objc_msgSend(v16, "setFileURL:", 0);
  }
  else if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[CPLEngineFileStorage _removeIdentityFromUncommittedFiles:](self, "_removeIdentityFromUncommittedFiles:", v16);
  }

  _Block_object_dispose(buf, 8);
  if ((v17 & 1) == 0)
    goto LABEL_12;
LABEL_16:

  return v17;
}

- (BOOL)commitFileWithIdentity:(id)a3 error:(id *)a4
{
  -[CPLEngineFileStorage _removeIdentityFromUncommittedFiles:](self, "_removeIdentityFromUncommittedFiles:", a3, a4);
  return 1;
}

- (BOOL)discardUncommittedFileWithIdentity:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a3;
  v7 = -[CPLEngineFileStorage deleteFileWithIdentity:error:](self, "deleteFileWithIdentity:error:", v6, a4);
  if (v7)
    -[CPLEngineFileStorage _removeIdentityFromUncommittedFiles:](self, "_removeIdentityFromUncommittedFiles:", v6);

  return v7;
}

- (BOOL)deleteFileWithIdentity:(id)a3 error:(id *)a4
{
  return -[CPLEngineFileStorage deleteFileWithIdentity:includingOriginal:error:](self, "deleteFileWithIdentity:includingOriginal:error:", a3, !self->_keepOriginals, a4);
}

- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_deleteImmediately)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v19 = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Deleting %@", (uint8_t *)&v19, 0xCu);
      }

    }
    -[CPLEngineFileStorage platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "deleteFileWithIdentity:includingOriginal:error:", v8, v6, a5);

    if ((v11 & 1) == 0 && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *a5;
        v19 = 138412290;
        v20 = v13;
        v14 = "Unable to delete: %@";
LABEL_18:
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v19 = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEBUG, "Marking %@ for deletion", (uint8_t *)&v19, 0xCu);
      }

    }
    -[CPLEngineFileStorage platformObject](self, "platformObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v16, "markForDeleteFileWithIdentity:error:", v8, a5);

    if ((v11 & 1) == 0 && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = *a5;
        v19 = 138412290;
        v20 = v17;
        v14 = "Unable to mark for delete: %@";
        goto LABEL_18;
      }
LABEL_19:

      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "storeUnretainedFileAtURL:identity:isOriginal:error:", v11, v10, v7, a6);

  return (char)a6;
}

- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "storeUnretainedData:identity:isOriginal:error:", v11, v10, v7, a6);

  return (char)a6;
}

- (BOOL)hasFileWithIdentity:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasFileWithIdentity:", v4);

  return v6;
}

- (void)checkFileSizeForIdentity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkFileSizeForIdentity:", v4);

}

- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Retaining URL for %@ (%@)", (uint8_t *)&v16, 0x16u);

    }
  }
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "retainFileURLForIdentity:resourceType:error:", v8, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "Retained URL: %@", (uint8_t *)&v16, 0xCu);

    }
  }

  return v12;
}

- (BOOL)releaseFileURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Releasing %@", (uint8_t *)&v18, 0xCu);

    }
  }
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "releaseFileURL:error:", v6, a4);

  if ((v10 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v18) = 0;
        v12 = "URL was released successfully";
        v13 = v11;
        v14 = OS_LOG_TYPE_DEBUG;
        v15 = 2;
LABEL_12:
        _os_log_impl(&dword_1B03C2000, v13, v14, v12, (uint8_t *)&v18, v15);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = *a4;
      v18 = 138412290;
      v19 = v16;
      v12 = "Unable to release URL: %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 12;
      goto LABEL_12;
    }
LABEL_13:

  }
  return v10;
}

- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Discarding all URLs for upload", (uint8_t *)&v15, 2u);
    }

  }
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "discardAllRetainedFileURLsWithError:", a3);

  if ((v7 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        v9 = "All URLs were discarded successfully";
        v10 = v8;
        v11 = OS_LOG_TYPE_DEBUG;
        v12 = 2;
LABEL_12:
        _os_log_impl(&dword_1B03C2000, v10, v11, v9, (uint8_t *)&v15, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = *a3;
      v15 = 138412290;
      v16 = v13;
      v9 = "Unable to discard all URLs: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_12;
    }
LABEL_13:

  }
  return v7;
}

- (BOOL)compactStorage:(id *)a3
{
  return -[CPLEngineFileStorage compactStorageIncludeOriginals:error:](self, "compactStorageIncludeOriginals:error:", !self->_keepOriginals, a3);
}

- (BOOL)resetWithError:(id *)a3
{
  void *v4;

  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "resetWithError:", a3);

  return (char)a3;
}

- (BOOL)tryToFreeDiskSpace:(unint64_t)a3 actuallyFreedSpace:(unint64_t *)a4 error:(id *)a5
{
  return -[CPLEngineFileStorage tryToFreeDiskSpace:actuallyFreedSpace:includeOriginals:error:](self, "tryToFreeDiskSpace:actuallyFreedSpace:includeOriginals:error:", a3, a4, !self->_keepOriginals, a5);
}

- (BOOL)_compactStorageIncludeOriginals:(BOOL)a3 desiredFreeSpace:(unint64_t *)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  id v16;
  void *v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  uint64_t v27;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v6 = a3;
  v47[1] = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1899;
  v40 = __Block_byref_object_dispose__1900;
  v41 = 0;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0C99998];
  v47[0] = *MEMORY[0x1E0C99998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __79__CPLEngineFileStorage__compactStorageIncludeOriginals_desiredFreeSpace_error___block_invoke;
  v35[3] = &unk_1E60D7CD0;
  v35[4] = &v36;
  v35[5] = &v42;
  objc_msgSend(v7, "fileEnumeratorIncludingPropertiesForKeys:errorHandler:", v8, v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (!v11)
    goto LABEL_27;
  v12 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      if (!v6 && (objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "isOriginal") & 1) != 0)
        continue;
      if ((objc_msgSend(v14, "isMarkedForDelete") & 1) == 0)
      {
        v19 = *((unsigned __int8 *)v43 + 24);
LABEL_22:
        if (!v19)
          goto LABEL_27;
        continue;
      }
      if (a4)
      {
        v30 = 0;
        v15 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v30, v27, a5);
        v16 = v30;
        v17 = v16;
        *((_BYTE *)v43 + 24) = v15;
        if (v15)
          v18 = objc_msgSend(v16, "unsignedLongLongValue");
        else
          v18 = 0;

      }
      else
      {
        v18 = 0;
      }
      if (!*((_BYTE *)v43 + 24))
        goto LABEL_27;
      -[CPLEngineFileStorage platformObject](self, "platformObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "deleteFileWithIdentity:includingOriginal:error:", v21, v6, a5);
      *((_BYTE *)v43 + 24) = v22;

      v19 = *((unsigned __int8 *)v43 + 24);
      v23 = a4 == 0;
      if (!*((_BYTE *)v43 + 24))
        v23 = 1;
      if (v23)
        goto LABEL_22;
      if (*a4 <= v18)
      {
        *a4 = 0;
        goto LABEL_27;
      }
      *a4 -= v18;
    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
    if (v11)
      continue;
    break;
  }
LABEL_27:

  if (*((_BYTE *)v43 + 24))
  {
    v24 = 1;
  }
  else
  {
    v24 = 0;
    if (a5)
    {
      v25 = (void *)v37[5];
      if (v25)
      {
        *a5 = objc_retainAutorelease(v25);
        v24 = *((_BYTE *)v43 + 24) != 0;
      }
    }
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  return v24;
}

- (BOOL)compactStorageIncludeOriginals:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  uint64_t v14;

  v5 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Compacting", (uint8_t *)&v12, 2u);
    }

  }
  v8 = -[CPLEngineFileStorage _compactStorageIncludeOriginals:desiredFreeSpace:error:](self, "_compactStorageIncludeOriginals:desiredFreeSpace:error:", v5, 0, a4);
  if (!v8 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *a4;
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Error compacting: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v8;
}

- (BOOL)tryToFreeDiskSpace:(unint64_t)a3 actuallyFreedSpace:(unint64_t *)a4 includeOriginals:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  unint64_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  NSObject *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v26 = a3;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Trying to free %llu bytes on disk", buf, 0xCu);
    }

  }
  v13 = -[CPLEngineFileStorage _compactStorageIncludeOriginals:desiredFreeSpace:error:](self, "_compactStorageIncludeOriginals:desiredFreeSpace:error:", v7, &v24, a6);
  if (v13)
  {
    if (a3 < v24)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_1882();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "We should not have less space on disk after compaction", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v23, 563, CFSTR("We should not have less space on disk after compaction"));

      abort();
    }
    *a4 = a3 - v24;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = *a4;
        *(_DWORD *)buf = 134217984;
        v26 = v15;
        v16 = "Actually freed %llu bytes";
        v17 = v14;
        v18 = OS_LOG_TYPE_DEBUG;
LABEL_13:
        _os_log_impl(&dword_1B03C2000, v17, v18, v16, buf, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_1882();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = *a6;
      *(_DWORD *)buf = 138412290;
      v26 = (unint64_t)v19;
      v16 = "Unable to free space on disk: %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
LABEL_14:

  }
  return v13;
}

- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileEnumeratorIncludingPropertiesForKeys:errorHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fileEnumerator
{
  return -[CPLEngineFileStorage fileEnumeratorIncludingPropertiesForKeys:errorHandler:](self, "fileEnumeratorIncludingPropertiesForKeys:errorHandler:", MEMORY[0x1E0C9AA60], 0);
}

- (BOOL)checkIsEmpty
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _OWORD v7[4];
  uint8_t buf[4];
  uint64_t v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  -[CPLEngineFileStorage fileEnumerator](self, "fileEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", v7, v10, 16);
  if (v3 && !_CPLSilentLogging)
  {
    v4 = **((_QWORD **)&v7[0] + 1);
    __CPLStorageOSLogDomain_1882();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Resource cache contains at least one item: %@", buf, 0xCu);
    }

  }
  return v3 == 0;
}

- (void)writeTransactionDidFail
{
  id v2;

  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeTransactionDidFail");

}

- (void)writeTransactionDidSucceed
{
  id v2;

  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeTransactionDidSucceed");

}

- (BOOL)addDeleteFlagToFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineFileStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "addDeleteFlagToFileAtURL:error:", v6, a4);

  return (char)a4;
}

- (BOOL)openWithFileRecoveryHandler:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CPLEngineFileStorage_openWithFileRecoveryHandler_error___block_invoke;
  v9[3] = &unk_1E60D7CF8;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[CPLEngineFileStorage openWithRecoveryHandler:error:](self, "openWithRecoveryHandler:error:", v9, a4);

  return (char)a4;
}

- (id)_identityForIdentifier:(id)a3
{
  id v3;
  CPLResourceIdentity *v4;

  v3 = a3;
  v4 = objc_alloc_init(CPLResourceIdentity);
  -[CPLResourceIdentity setFingerPrint:](v4, "setFingerPrint:", v3);

  -[CPLResourceIdentity setFileUTI:](v4, "setFileUTI:", CFSTR("public.data"));
  return v4;
}

- (BOOL)storeFileAtURL:(id)a3 identifier:(id)a4 moveIfPossible:(BOOL)a5 needsCommit:(BOOL *)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;

  v9 = a5;
  v12 = a3;
  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = -[CPLEngineFileStorage storeFileAtURL:identity:isOriginal:moveIfPossible:needsCommit:error:](self, "storeFileAtURL:identity:isOriginal:moveIfPossible:needsCommit:error:", v12, v13, 0, v9, a6, a7);

  return (char)a7;
}

- (BOOL)storeData:(id)a3 identifier:(id)a4 needsCommit:(BOOL *)a5 error:(id *)a6
{
  id v10;
  void *v11;

  v10 = a3;
  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[CPLEngineFileStorage storeData:identity:isOriginal:needsCommit:error:](self, "storeData:identity:isOriginal:needsCommit:error:", v10, v11, 0, a5, a6);

  return (char)a6;
}

- (BOOL)commitFileWithIdentifier:(id)a3 error:(id *)a4
{
  void *v6;

  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CPLEngineFileStorage commitFileWithIdentity:error:](self, "commitFileWithIdentity:error:", v6, a4);

  return (char)a4;
}

- (BOOL)discardUncommittedFileWithIdentifier:(id)a3 error:(id *)a4
{
  void *v6;

  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CPLEngineFileStorage discardUncommittedFileWithIdentity:error:](self, "discardUncommittedFileWithIdentity:error:", v6, a4);

  return (char)a4;
}

- (BOOL)deleteFileWithIdentifier:(id)a3 error:(id *)a4
{
  void *v6;

  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CPLEngineFileStorage deleteFileWithIdentity:error:](self, "deleteFileWithIdentity:error:", v6, a4);

  return (char)a4;
}

- (BOOL)storeUnretainedFileAtURL:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[CPLEngineFileStorage storeUnretainedFileAtURL:identity:isOriginal:error:](self, "storeUnretainedFileAtURL:identity:isOriginal:error:", v8, v9, 0, a5);

  return (char)a5;
}

- (BOOL)storeUnretainedData:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[CPLEngineFileStorage storeUnretainedData:identity:isOriginal:error:](self, "storeUnretainedData:identity:isOriginal:error:", v8, v9, 0, a5);

  return (char)a5;
}

- (BOOL)hasFileWithIdentifier:(id)a3
{
  CPLEngineFileStorage *v3;
  void *v4;

  v3 = self;
  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CPLEngineFileStorage hasFileWithIdentity:](v3, "hasFileWithIdentity:", v4);

  return (char)v3;
}

- (id)retainFileURLForIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[CPLEngineFileStorage _identityForIdentifier:](self, "_identityForIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineFileStorage retainFileURLForIdentity:resourceType:error:](self, "retainFileURLForIdentity:resourceType:error:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (BOOL)keepOriginals
{
  return self->_keepOriginals;
}

- (void)setKeepOriginals:(BOOL)a3
{
  self->_keepOriginals = a3;
}

- (BOOL)deleteImmediately
{
  return self->_deleteImmediately;
}

- (void)setDeleteImmediately:(BOOL)a3
{
  self->_deleteImmediately = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_uncommittedFiles, 0);
  objc_storeStrong((id *)&self->_crashMarkerURL, 0);
  objc_storeStrong((id *)&self->_logDomain, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __58__CPLEngineFileStorage_openWithFileRecoveryHandler_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fingerPrint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __79__CPLEngineFileStorage__compactStorageIncludeOriginals_desiredFreeSpace_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_1882();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412546;
        v11 = v5;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Error accessing %@ file: %@", (uint8_t *)&v10, 0x16u);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v8;
}

uint64_t __72__CPLEngineFileStorage_storeData_identity_isOriginal_needsCommit_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_addIdentityToUncommittedFiles:", *(_QWORD *)(a1 + 40));
  return 1;
}

uint64_t __92__CPLEngineFileStorage_storeFileAtURL_identity_isOriginal_moveIfPossible_needsCommit_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_addIdentityToUncommittedFiles:", *(_QWORD *)(a1 + 40));
  return 1;
}

void __38__CPLEngineFileStorage_doWrite_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = (*(uint64_t (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

void __31__CPLEngineFileStorage_doRead___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

+ (id)platformImplementationProtocol
{
  void *v2;
  NSString *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Implementation"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
