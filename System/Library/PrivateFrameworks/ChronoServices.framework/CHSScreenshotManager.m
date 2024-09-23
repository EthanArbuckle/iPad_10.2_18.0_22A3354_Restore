@implementation CHSScreenshotManager

+ (NSString)basePath
{
  uint64_t started;
  _BYTE v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  started = sysdir_start_search_path_enumeration_private();
  MEMORY[0x1940096FC](started, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v4, 4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (CHSScreenshotManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CHSScreenshotManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (CHSScreenshotManager *)(id)sharedManager_shared;
}

void __37__CHSScreenshotManager_sharedManager__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CHSScreenshotManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "basePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private%@"), v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.chrono"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("snapshot-cache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

    v7 = [CHSScreenshotManager alloc];
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CHSScreenshotManager initWithDirectory:fileManager:](v7, "initWithDirectory:fileManager:", v5, v8);
    v10 = (void *)sharedManager_shared;
    sharedManager_shared = v9;

  }
  else
  {
    CHSLogClientSnapshots();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "Unable to resolve base directory for snapshots.", buf, 2u);
    }

    v12 = (void *)sharedManager_shared;
    sharedManager_shared = 0;

  }
}

- (CHSScreenshotManager)initWithDirectory:(id)a3 fileManager:(id)a4
{
  id v7;
  id v8;
  CHSScreenshotManager *v9;
  CHSScreenshotManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSScreenshotManager;
  v9 = -[CHSScreenshotManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_threadSafe_fileManager, a4);
    objc_storeStrong((id *)&v10->_baseURL, a3);
  }

  return v10;
}

- (void)deleteAllCachedScreenshots
{
  NSFileManager *threadSafe_fileManager;
  NSURL *baseURL;
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  NSFileManager *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  threadSafe_fileManager = self->_threadSafe_fileManager;
  baseURL = self->_baseURL;
  v10 = 0;
  -[NSFileManager removeItemAtURL:error:](threadSafe_fileManager, "removeItemAtURL:error:", baseURL, &v10);
  v5 = (__CFString *)v10;
  CHSLogClientSnapshots();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("success");
    if (v5)
      v7 = v5;
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "Clearing all cached client-side snapshots: %{public}@", buf, 0xCu);
  }

  v8 = self->_threadSafe_fileManager;
  -[NSURL path](self->_baseURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

}

- (void)deleteCachedScreenshotsMatchingWidget:(id)a3
{
  id v4;
  NSURL *baseURL;
  void *v6;
  void *v7;
  NSFileManager *threadSafe_fileManager;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  NSFileManager *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  baseURL = self->_baseURL;
  v20 = v4;
  -[CHSScreenshotManager indexingDirectoryNameForWidget:]((uint64_t)self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](baseURL, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHSScreenshotManager _baseFileNameFromWidget:]((uint64_t)self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  threadSafe_fileManager = self->_threadSafe_fileManager;
  v29 = 0;
  -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](threadSafe_fileManager, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v23, 0, 0, &v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v29;
  if (v21)
  {
    CHSLogClientSnapshots();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v21, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSScreenshotManager deleteCachedScreenshotsMatchingWidget:].cold.1((uint64_t)v20, v10, buf, v9);
    }
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v22;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16, v20);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasPrefix:", v7);

          if (v16)
          {
            v17 = self->_threadSafe_fileManager;
            v24 = 0;
            -[NSFileManager removeItemAtURL:error:](v17, "removeItemAtURL:error:", v14, &v24);
            v18 = v24;
            CHSLogClientSnapshots();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v32 = v14;
              _os_log_impl(&dword_18FB18000, v19, OS_LOG_TYPE_DEFAULT, "Deleted client snapshot at path: %{public}@", buf, 0xCu);
            }

          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v11);
    }
  }

}

- (id)indexingDirectoryNameForWidget:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "kind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "length");
    if ((int)v8 <= 50)
      v9 = 50;
    else
      v9 = v8;
    v10 = objc_msgSend(v7, "rangeOfComposedCharacterSequencesForRange:", (v9 - 50), v8 - (v9 - 50));
    objc_msgSend(v7, "substringWithRange:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_baseFileNameFromWidget:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    CHSWidgetFamilyDescription(objc_msgSend(v3, "family"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "stableHash"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "intentReference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%lld--"), objc_msgSend(v8, "stableHash"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = &stru_1E2A5F050;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@--%@"), v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)deleteAllCachedScreenshotsExcludingWidgets:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSFileManager *threadSafe_fileManager;
  NSObject *v15;
  void *v16;
  CHSScreenshotManager *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__CHSScreenshotManager_deleteAllCachedScreenshotsExcludingWidgets___block_invoke;
  v27[3] = &unk_1E2A5B4D0;
  v27[4] = self;
  objc_msgSend(a3, "bs_map:", v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSScreenshotManager allCachedSnapshotURLs](self, "allCachedSnapshotURLs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bs_map:", &__block_literal_global_5);
  v17 = self;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v4;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v20;
LABEL_8:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v10);
            if ((objc_msgSend(v9, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13)) & 1) != 0)
              break;
            if (v11 == ++v13)
            {
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
              if (v11)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          threadSafe_fileManager = v17->_threadSafe_fileManager;
          v18 = 0;
          -[NSFileManager removeItemAtPath:error:](threadSafe_fileManager, "removeItemAtPath:error:", v9, &v18);
          v10 = v18;
          if (v10)
          {
            CHSLogClientSnapshots();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v9;
              v30 = 2114;
              v31 = v10;
              _os_log_error_impl(&dword_18FB18000, v15, OS_LOG_TYPE_ERROR, "Error removing client snapshot for %{public}@: error = %{public}@", buf, 0x16u);
            }
          }
          else
          {
            CHSLogClientSnapshots();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v29 = v9;
              _os_log_impl(&dword_18FB18000, v15, OS_LOG_TYPE_DEFAULT, "Deleted client snapshot at path: %{public}@", buf, 0xCu);
            }
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v6);
  }

}

id __67__CHSScreenshotManager_deleteAllCachedScreenshotsExcludingWidgets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  -[CHSScreenshotManager indexingDirectoryNameForWidget:](v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHSScreenshotManager _baseFileNameFromWidget:](*(_QWORD *)(a1 + 32), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CHSLogClientSnapshots();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "filePathURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2114;
    v18 = v14;
    _os_log_debug_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEBUG, "Prefix to keep: %{public}@ (%{public}@)", (uint8_t *)&v15, 0x16u);

  }
  return v10;
}

id __67__CHSScreenshotManager_deleteAllCachedScreenshotsExcludingWidgets___block_invoke_12(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "path");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allCachedSnapshotURLs
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self->_threadSafe_fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", self->_baseURL, 0, 0, &__block_literal_global_15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v13;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x1E0C999D0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v14 = 0;
        objc_msgSend(v8, "getResourceValue:forKey:error:", &v14, v6, 0);
        v9 = v14;
        if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
        {
          CHSLogClientSnapshots();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "path");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[CHSScreenshotManager allCachedSnapshotURLs].cold.1(v11, buf, &v20, v10);
          }

          objc_msgSend(v2, "addObject:", v8);
        }

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v4);
  }

  return v2;
}

uint64_t __45__CHSScreenshotManager_allCachedSnapshotURLs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  CHSLogClientSnapshots();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CHSScreenshotManager_allCachedSnapshotURLs__block_invoke_cold_1((uint64_t)v3, v4);

  return 1;
}

- (id)snapshotContextForWidget:(id)a3 metrics:(id)a4 attributes:(id)a5
{
  id v8;
  void *v9;
  CHSSnapshotContext *v10;

  v8 = a5;
  -[CHSScreenshotManager URLForWidget:metrics:attributes:createIntermediateDirectories:](self, "URLForWidget:metrics:attributes:createIntermediateDirectories:", a3, a4, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CHSSnapshotContext initWithURL:attributes:fileManager:]([CHSSnapshotContext alloc], "initWithURL:attributes:fileManager:", v9, v8, self->_threadSafe_fileManager);

  return v10;
}

- (id)URLForWidget:(id)a3 metrics:(id)a4 attributes:(id)a5 createIntermediateDirectories:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSURL *baseURL;
  void *v14;
  void *v15;
  NSFileManager *threadSafe_fileManager;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  baseURL = self->_baseURL;
  -[CHSScreenshotManager indexingDirectoryNameForWidget:]((uint64_t)self, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](baseURL, "URLByAppendingPathComponent:isDirectory:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    threadSafe_fileManager = self->_threadSafe_fileManager;
    objc_msgSend(v15, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](threadSafe_fileManager, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v22);

  }
  -[CHSScreenshotManager finalFileNameForWidget:metrics:attributes:]((uint64_t)self, v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByAppendingPathExtension:", CFSTR("snapshot"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)finalFileNameForWidget:(void *)a3 metrics:(void *)a4 attributes:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v22 = v8;
  v23 = v7;
  if (a1)
  {
    -[CHSScreenshotManager _baseFileNameFromWidget:](a1, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_stringKeyRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CHSScreenshotColorSchemeDescription(objc_msgSend(v9, "colorScheme"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "allowsPrivacySensitiveContent"))
    {
      v13 = objc_msgSend(v9, "userWantsWidgetDataWhenPasscodeLocked");
      v14 = CFSTR(".private");
      if (v13)
        v14 = CFSTR(".private-exception");
      v15 = v14;
    }
    else
    {
      v15 = &stru_1E2A5F050;
    }
    objc_msgSend(v9, "additionalSettingsContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--%@"), v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E2A5F050;
    }
    objc_msgSend(v9, "tintParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hash");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@--%lu.%@%@"), v10, v11, v17, v19, v12, v15, v8, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafe_fileManager, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)deleteCachedScreenshotsMatchingWidget:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_18FB18000, log, OS_LOG_TYPE_DEBUG, "Error fetching snapshot list for widget: %{public}@, error = %{public}@", buf, 0x16u);

}

- (void)allCachedSnapshotURLs
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_debug_impl(&dword_18FB18000, log, OS_LOG_TYPE_DEBUG, "Existing client snapshot path: %{public}@", buf, 0xCu);

}

void __45__CHSScreenshotManager_allCachedSnapshotURLs__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18FB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected error iterating directories for client snapshots: error = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
