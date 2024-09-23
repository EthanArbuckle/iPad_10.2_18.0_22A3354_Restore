@implementation FCAVAssetCache

void __32__FCAVAssetCache__prepareForUse__block_invoke(uint64_t a1)
{
  id *v1;
  FCKeyValueStoreClassRegistry *v2;
  FCKeyValueStore *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  FCCacheCoordinator *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  const char *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  char v37;
  id v38;
  void *v39;
  FCKeyValueStoreClassRegistry *v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;
  uint8_t v59[4];
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  if (!v1[3])
  {
    v2 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    -[FCKeyValueStoreClassRegistry registerClass:](v2, "registerClass:", objc_opt_class());
    v3 = [FCKeyValueStore alloc];
    v4 = v1[1];
    v40 = v2;
    v5 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:](v3, "initWithName:directory:version:options:classRegistry:", CFSTR("metadata"), v4, 4, 0, v2);
    v6 = v1[3];
    v1[3] = (id)v5;

    v7 = (void *)MEMORY[0x1E0C99E98];
    v8 = v1[1];
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("content"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v1[4];
    v1[4] = (id)v10;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v1[4], 1, 0, 0);

    v13 = objc_alloc_init(FCCacheCoordinator);
    v14 = v1[5];
    v1[5] = v13;

    objc_msgSend(v1[5], "setDelegate:", v1);
    objc_msgSend(v1[3], "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[5], "setupWithInitialKeys:", v15);
    v16 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v15;
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "AV asset cache loaded with cached assets: %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v15;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v1[3], "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTPBAVAsset resolvedCacheURL](v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v17, "addObject:", v24);
          }
          else
          {
            v25 = FCAVAssetLog;
            if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v59 = 138543362;
              v60 = v22;
              _os_log_error_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_ERROR, "AV asset cache will remove missing asset from metadata store: %{public}@", v59, 0xCu);
            }
            objc_msgSend(v1[3], "removeObjectForKey:", v22);
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
      }
      while (v19);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[4], "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "subpathsOfDirectoryAtPath:error:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v28);
          v33 = *(const char **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v1[4], "URLByAppendingPathComponent:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "containsObject:", v34) & 1) == 0)
          {
            v35 = FCAVAssetLog;
            if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v51 = 138543362;
              v52 = v33;
              _os_log_error_impl(&dword_1A1B90000, v35, OS_LOG_TYPE_ERROR, "AV asset cache will remove unknown file from asset store: %{public}@", v51, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0;
            v37 = objc_msgSend(v36, "removeItemAtURL:error:", v34, &v42);
            v38 = v42;

            if ((v37 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AV asset cache failed to remove unknown file with error: %@"), v38);
              *(_DWORD *)v51 = 136315906;
              v52 = "-[FCAVAssetCache _initStores]";
              v53 = 2080;
              v54 = "FCAVAssetCache.m";
              v55 = 1024;
              v56 = 388;
              v57 = 2114;
              v58 = v39;
              _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AVAssetCleanupFailed) : %s %s:%d %{public}@", v51, 0x26u);

            }
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
      }
      while (v30);
    }

  }
}

- (_QWORD)initWithCacheDirectory:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCAVAssetCache;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

      v6 = objc_alloc_init(MEMORY[0x1E0D60B18]);
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

void __51__FCAVAssetCache_contentKeyIdentifiersForAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "allKeys", (_QWORD)v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_opt_class();
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v11 = *(void **)(v10 + 24);
        else
          v11 = 0;
        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;

        v15 = *(void **)(a1 + 40);
        objc_msgSend(v14, "contentKeyIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fc_safelyAddObjects:", v16);

        ++v8;
      }
      while (v6 != v8);
      v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v6 = v17;
    }
    while (v17);
  }

}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  FCCacheCoordinatorFlushPolicy *v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinatorFlushPolicy *v6;

  v4 = -[FCCacheCoordinatorFlushPolicy initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:]([FCCacheCoordinatorFlushPolicy alloc], "initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:", 0, 0, 1);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = v4;
  -[FCCacheCoordinator enableFlushingWithPolicy:](cacheCoordinator, "enableFlushingWithPolicy:", v4);

}

- (id)contentKeyIdentifiersForAllAssets
{
  void *v3;
  FCCacheCoordinator *cacheCoordinator;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  FCAVAssetCache *v12;
  id v13;

  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __51__FCAVAssetCache_contentKeyIdentifiersForAllAssets__block_invoke;
  v11 = &unk_1E463AD10;
  v12 = self;
  v13 = v3;
  v5 = v3;
  -[FCCacheCoordinator performCacheRead:](cacheCoordinator, "performCacheRead:", &v8);
  objc_msgSend(v5, "allObjects", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)interestTokenForAssetIdentifiers:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  void *v6;

  v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator holdTokenForKeys:](cacheCoordinator, "holdTokenForKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_prepareForUse
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 16);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __32__FCAVAssetCache__prepareForUse__block_invoke;
    v2[3] = &unk_1E463AB18;
    v2[4] = result;
    return objc_msgSend(v1, "performWithLockSync:", v2);
  }
  return result;
}

- (FCAVAssetCache)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAssetCache init]";
    v9 = 2080;
    v10 = "FCAVAssetCache.m";
    v11 = 1024;
    v12 = 46;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAssetCache init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)interestTokenForAssetIdentifier:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  void *v6;

  v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator holdTokenForKey:](cacheCoordinator, "holdTokenForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)containsAssetWithIdentifier:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__FCAVAssetCache_containsAssetWithIdentifier___block_invoke;
  v10[3] = &unk_1E463AD58;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  -[FCCacheCoordinator performCacheRead:](v6, "performCacheRead:", v10);

  v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__FCAVAssetCache_containsAssetWithIdentifier___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = a1[5];
  v4 = v2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "containsObjectForKey:", v3);

}

- (id)cachedFileURLForAssetIdentifier:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__83;
  v17 = __Block_byref_object_dispose__83;
  v18 = 0;
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__FCAVAssetCache_cachedFileURLForAssetIdentifier___block_invoke;
  v10[3] = &unk_1E463AFC0;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[FCCacheCoordinator performCacheRead:](v6, "performCacheRead:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __50__FCAVAssetCache_cachedFileURLForAssetIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[NTPBAVAsset resolvedCacheURL](v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = v8;
  }

}

- (void)adoptFileAtURL:(id)a3 forAssetIdentifier:(id)a4 remoteURL:(id)a5 contentKeyIdentifiers:(id)a6 extension:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  FCCacheCoordinator *cacheCoordinator;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[6];
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28 = 0;
  objc_msgSend(v11, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v28;
  v17 = v16;
  if (v15)
  {
    v18 = v15;
    -[FCAVAssetCache _prepareForUse]((uint64_t)self);
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke_13;
    v21[3] = &unk_1E46403F0;
    v21[4] = self;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v18;
    v26 = v11;
    v20 = v18;
    -[FCCacheCoordinator performCacheWrite:](cacheCoordinator, "performCacheWrite:", v21);

  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke;
    v27[3] = &unk_1E463AD10;
    v27[4] = v12;
    v27[5] = v16;
    v20 = v12;
    __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke((uint64_t)v27);
  }

}

void __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset cache failed to generate bookmark for asset %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __94__FCAVAssetCache_adoptFileAtURL_forAssetIdentifier_remoteURL_contentKeyIdentifiers_extension___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0D62608]);
  v15 = v7;

  objc_msgSend(v15, "setIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRemoteURL:", v8);

  v9 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  objc_msgSend(v15, "setContentKeyIdentifiers:", v9);

  objc_msgSend(v15, "setBookmark:", *(_QWORD *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSize:", objc_msgSend(v10, "fc_sizeOfItemAtURL:error:", *(_QWORD *)(a1 + 72), 0));

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 24);
  else
    v12 = 0;
  objc_msgSend(v12, "setObject:forKey:", v15, *(_QWORD *)(a1 + 40));
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    v14 = *(void **)(v13 + 40);
  else
    v14 = 0;
  objc_msgSend(v14, "didInsertKeyIntoCache:withLifetimeHint:", *(_QWORD *)(a1 + 40), 0);

}

- (id)contentKeyIdentifiersForAssetIdentifier:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__83;
  v18 = __Block_byref_object_dispose__83;
  v19 = 0;
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = cacheCoordinator;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__FCAVAssetCache_contentKeyIdentifiersForAssetIdentifier___block_invoke;
  v11[3] = &unk_1E463AFC0;
  v11[4] = self;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  -[FCCacheCoordinator performCacheRead:](v6, "performCacheRead:", v11);

  v8 = (void *)v15[5];
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __58__FCAVAssetCache_contentKeyIdentifiersForAssetIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "contentKeyIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v4 = v9;
  }

}

- (id)contentArchiveForAssetIdentifier:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__83;
  v17 = __Block_byref_object_dispose__83;
  v18 = 0;
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__FCAVAssetCache_contentArchiveForAssetIdentifier___block_invoke;
  v10[3] = &unk_1E463AD58;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  -[FCCacheCoordinator performCacheRead:](v6, "performCacheRead:", v10);

  +[FCContentArchive archiveWithAVAsset:](FCContentArchive, "archiveWithAVAsset:", v14[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __51__FCAVAssetCache_contentArchiveForAssetIdentifier___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)importAVAsset:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__83;
  v17 = __Block_byref_object_dispose__83;
  v18 = 0;
  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = cacheCoordinator;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__FCAVAssetCache_importAVAsset___block_invoke;
  v10[3] = &unk_1E463AD58;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  -[FCCacheCoordinator performCacheWrite:](v6, "performCacheWrite:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __32__FCAVAssetCache_importAVAsset___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[5];
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "holdTokenForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
    v9 = (_QWORD *)v9[3];
  v10 = *(void **)(a1 + 40);
  v11 = v9;
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObjectForKey:", v12);

  if (v13)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_2;
    v50[3] = &unk_1E463AB18;
    v50[4] = *(_QWORD *)(a1 + 40);
    __32__FCAVAssetCache_importAVAsset___block_invoke_2((uint64_t)v50);
  }
  else
  {
    -[NTPBAVAsset resolvedCacheURL](*(id *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
      v17 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 40);
        v19 = v17;
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v20;
        v53 = 2114;
        v54 = v21;
        _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "AV asset cache will copy external AV asset %{public}@, path=%{public}@", buf, 0x16u);

      }
      v22 = *(_QWORD **)(a1 + 32);
      if (v22)
        v22 = (_QWORD *)v22[4];
      v23 = v22;
      objc_msgSend(v16, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v27 = objc_msgSend(v26, "copyItemAtURL:toURL:error:", v16, v25, &v48);
      v28 = v48;

      if ((v27 & 1) != 0)
      {
        v46 = 0;
        objc_msgSend(v25, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v46);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v46;
        v31 = v30;
        if (v29)
        {
          v32 = v29;
          v33 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
          objc_msgSend(v33, "setBookmark:", v32);
          v34 = *(_QWORD **)(a1 + 32);
          v42 = v31;
          if (v34)
            v34 = (_QWORD *)v34[3];
          v35 = *(void **)(a1 + 40);
          v36 = v34;
          objc_msgSend(v35, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKey:", v33, v37);

          v38 = *(_QWORD **)(a1 + 32);
          if (v38)
            v38 = (_QWORD *)v38[5];
          v39 = *(void **)(a1 + 40);
          v40 = v38;
          objc_msgSend(v39, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "didInsertKeyIntoCache:withLifetimeHint:", v41, 0);

          v31 = v42;
        }
        else
        {
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_19;
          v43[3] = &unk_1E463AD10;
          v44 = *(id *)(a1 + 40);
          v45 = v30;
          v32 = v44;
          __32__FCAVAssetCache_importAVAsset___block_invoke_19((uint64_t)v43);
        }

      }
      else
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_18;
        v47[3] = &unk_1E463AB18;
        v47[4] = v28;
        __32__FCAVAssetCache_importAVAsset___block_invoke_18((uint64_t)v47);
      }

    }
    else
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __32__FCAVAssetCache_importAVAsset___block_invoke_17;
      v49[3] = &unk_1E463AB18;
      v49[4] = *(_QWORD *)(a1 + 40);
      __32__FCAVAssetCache_importAVAsset___block_invoke_17((uint64_t)v49);
    }

  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "skipping AV asset import because the asset already lives in the cache, identifier=%{public}@", (uint8_t *)&v6, 0xCu);

  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "skipping AV asset import because the asset URL could not be resolved, identifier=%{public}@", (uint8_t *)&v6, 0xCu);

  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset cache failed to copy external AV asset with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __32__FCAVAssetCache_importAVAsset___block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "AV asset cache failed to generate bookmark for copied asset %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (int64_t)storageSize
{
  uint64_t v3;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[FCAVAssetCache _prepareForUse]((uint64_t)self);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (self)
  {
    v3 = -[FCKeyValueStore storeSize](self->_metadataStore, "storeSize");
    cacheCoordinator = self->_cacheCoordinator;
  }
  else
  {
    v3 = objc_msgSend(0, "storeSize");
    cacheCoordinator = 0;
  }
  v12 = v3;
  v5 = cacheCoordinator;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__FCAVAssetCache_storageSize__block_invoke;
  v8[3] = &unk_1E463DF90;
  v8[4] = self;
  v8[5] = &v9;
  -[FCCacheCoordinator performCacheRead:](v5, "performCacheRead:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __29__FCAVAssetCache_storageSize__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD v3[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[3];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__FCAVAssetCache_storageSize__block_invoke_2;
  v3[3] = &unk_1E464AFF8;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __29__FCAVAssetCache_storageSize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "size");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  void *v4;
  FCKeyValueStore *metadataStore;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FCKeyValueStore *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "keysWithZeroInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (self)
    metadataStore = self->_metadataStore;
  else
    metadataStore = 0;
  -[FCKeyValueStore allKeys](metadataStore, "allKeys", (_QWORD)v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
        if (self)
          v14 = self->_metadataStore;
        else
          v14 = 0;
        -[FCKeyValueStore objectForKey:](v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v4, "containsObject:", v13);
        v17 = objc_msgSend(v15, "size");
        if (v16)
          v18 = 0;
        else
          v18 = v17;
        v9 += v18;
        if (v16)
          v19 = v17;
        else
          v19 = 0;
        v10 += v19;

        ++v12;
      }
      while (v8 != v12);
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      v8 = v20;
    }
    while (v20);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  v21 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)MEMORY[0x1E0CB34E8];
    v23 = v21;
    objc_msgSend(v22, "stringFromByteCount:countStyle:", v9, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v10, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v24;
    v33 = 2114;
    v34 = v25;
    _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "AV asset cache contains %{public}@ of held assets and %{public}@ of non-held assets", buf, 0x16u);

  }
  return v10;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FCKeyValueStore *metadataStore;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  FCKeyValueStore *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  v7 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 134218242;
    v31 = (const char *)objc_msgSend(v6, "count");
    v32 = 2114;
    v33 = (char *)v6;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "AV asset cache is flushing %lu assets, identifiers=%{public}@", buf, 0x16u);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12);
        if (self)
          metadataStore = self->_metadataStore;
        else
          metadataStore = 0;
        -[FCKeyValueStore objectForKey:](metadataStore, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTPBAVAsset resolvedCacheURL](v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v18 = objc_msgSend(v17, "removeItemAtURL:error:", v16, &v25);
          v19 = v25;

          if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AV asset cache failed to remove asset %@ with error: %@"), v13, v19);
            *(_DWORD *)buf = 136315906;
            v31 = "-[FCAVAssetCache cacheCoordinator:flushKeysWithWriteLock:]";
            v32 = 2080;
            v33 = "FCAVAssetCache.m";
            v34 = 1024;
            v35 = 318;
            v36 = 2114;
            v37 = v21;
            _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AVAssetFlushFailed) : %s %s:%d %{public}@", buf, 0x26u);

          }
          goto LABEL_14;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AV asset cache failed to resolve cache URL for asset %@"), v13);
          *(_DWORD *)buf = 136315906;
          v31 = "-[FCAVAssetCache cacheCoordinator:flushKeysWithWriteLock:]";
          v32 = 2080;
          v33 = "FCAVAssetCache.m";
          v34 = 1024;
          v35 = 311;
          v36 = 2114;
          v37 = v19;
          _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: AVAssetFlushNoURL) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_14:

        }
        if (self)
          v20 = self->_metadataStore;
        else
          v20 = 0;
        -[FCKeyValueStore removeObjectForKey:](v20, "removeObjectForKey:", v13);

        ++v12;
      }
      while (v10 != v12);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      v10 = v22;
    }
    while (v22);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_contentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_metadataStore, 0);
  objc_storeStrong((id *)&self->_initializationLock, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
}

@end
