@implementation FCAssetManager

id __44__FCAssetManager_interestTokenForAssetURLs___block_invoke(uint64_t a1, void *a2)
{
  return -[FCAssetManager _assetKeyForRemoteURL:](*(_QWORD *)(a1 + 32), a2);
}

- (id)assetHandleForRecordID:(id)a3 field:(int64_t)a4 lifetimeHint:(int64_t)a5 contentDatabase:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(a6, "permanentURLForRecordID:field:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[FCAssetManager assetHandleForURL:lifetimeHint:](self, "assetHandleForURL:lifetimeHint:", v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "holdTokenForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  -[FCAssetManager assetStore](*(_QWORD **)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filePathForKey:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 48));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 40));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (_QWORD)keyValueStore
{
  _QWORD *v1;
  void *v2;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_keyValueStore");
        *(_DWORD *)buf = 136315906;
        v6 = "-[FCAssetManager keyValueStore]";
        v7 = 2080;
        v8 = "FCAssetManager.m";
        v9 = 1024;
        v10 = 872;
        v11 = 2114;
        v12 = v4;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        v2 = (void *)v1[4];
      }
      else
      {
        v2 = 0;
      }
    }
    a1 = v2;
  }
  return a1;
}

void __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_6(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = a1[5];
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  }
  else
  {
    v5 = a1[4];
    if (v5)
      v6 = *(void **)(v5 + 56);
    else
      v6 = 0;
    objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }

}

void __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (_QWORD)assetStore
{
  _QWORD *v1;
  void *v2;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_assetStore");
        *(_DWORD *)buf = 136315906;
        v6 = "-[FCAssetManager assetStore]";
        v7 = 2080;
        v8 = "FCAssetManager.m";
        v9 = 1024;
        v10 = 878;
        v11 = 2114;
        v12 = v4;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        v2 = (void *)v1[5];
      }
      else
      {
        v2 = 0;
      }
    }
    a1 = v2;
  }
  return a1;
}

- (id)_assetHandleForCKAssetURLComponents:(uint64_t)a3 lifetimeHint:
{
  id v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v5 = a2;
    FCUpdateAssetURLHostIfNeeded(v5);
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "assetHandleForURL:lifetimeHint:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)assetHandleForURL:(id)a3 lifetimeHint:(int64_t)a4
{
  id v6;
  void *v7;
  NFUnfairLock *assetHandlesLock;
  NFUnfairLock *v9;
  uint64_t v10;
  id v11;
  void *v12;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NFUnfairLock *v28;
  NFUnfairLock *v29;
  id v30;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  _QWORD v39[8];
  _QWORD v40[4];
  FCCacheCoordinator *v41;
  id v42;
  FCAssetManager *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v6 = a3;
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__74;
  v72 = __Block_byref_object_dispose__74;
  v73 = 0;
  -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    assetHandlesLock = self->_assetHandlesLock;
  else
    assetHandlesLock = 0;
  v9 = assetHandlesLock;
  v10 = MEMORY[0x1E0C809B0];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke;
  v65[3] = &unk_1E463AD58;
  v67 = &v68;
  v65[4] = self;
  v11 = v7;
  v66 = v11;
  -[NFUnfairLock performWithLockSync:](v9, "performWithLockSync:", v65);

  v12 = (void *)v69[5];
  if (!v12)
  {
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__74;
    v63 = __Block_byref_object_dispose__74;
    v64 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__74;
    v57 = __Block_byref_object_dispose__74;
    v58 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__74;
    v51 = __Block_byref_object_dispose__74;
    v52 = 0;
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v40[0] = v10;
    v40[1] = 3221225472;
    v40[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_2;
    v40[3] = &unk_1E4649B08;
    v44 = &v59;
    v14 = cacheCoordinator;
    v41 = v14;
    v15 = v11;
    v42 = v15;
    v43 = self;
    v45 = &v53;
    v46 = &v47;
    -[FCCacheCoordinator performCacheRead:](v14, "performCacheRead:", v40);
    v39[0] = v10;
    v39[1] = 3221225472;
    v39[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_3;
    v39[3] = &unk_1E4649B30;
    v39[6] = &v53;
    v39[7] = &v59;
    v39[4] = self;
    v39[5] = &v47;
    __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_3(v39);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCAssetHandle initWithDataProvider:]([FCAssetHandle alloc], v16);
    v18 = (void *)v69[5];
    v69[5] = (uint64_t)v17;

    v19 = v69[5];
    if (v19)
    {
      objc_storeWeak((id *)(v19 + 80), self);
      v20 = v69[5];
    }
    else
    {
      v20 = 0;
    }
    -[FCAssetHandle setRemoteURL:](v20, v6);
    -[FCAssetHandle setHoldToken:](v69[5], (void *)v60[5]);
    v22 = (void *)v69[5];
    if (v22)
    {
      objc_setProperty_atomic_copy(v22, v21, (id)v54[5], 112);
      v24 = (void *)v69[5];
      if (v24)
      {
        objc_setProperty_atomic(v24, v23, (id)v48[5], 120);
        v26 = (void *)v69[5];
        if (v26)
        {
          objc_setProperty_nonatomic_copy(v26, v25, v15, 96);
          v27 = v69[5];
          if (v27)
            *(_QWORD *)(v27 + 104) = a4;
        }
      }
    }
    if (!v16)
    {
      v32 = (void *)v48[5];
      if (v32)
      {
        if (objc_msgSend(v32, "error") && objc_msgSend((id)v48[5], "error") == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_HTTPErrorWithURL:statusCode:requestUUID:additionalUserInfo:", v6, 404, 0, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)v69[5];
          if (v35)
            objc_setProperty_atomic(v35, v33, v34, 16);

        }
      }
    }
    if (self)
      v28 = self->_assetHandlesLock;
    else
      v28 = 0;
    v29 = v28;
    v36[0] = v10;
    v36[1] = 3221225472;
    v36[2] = __49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_6;
    v36[3] = &unk_1E463AFC0;
    v36[4] = self;
    v37 = v15;
    v38 = &v68;
    -[NFUnfairLock performWithLockSync:](v29, "performWithLockSync:", v36);

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(&v59, 8);
    v12 = (void *)v69[5];
  }
  v30 = v12;

  _Block_object_dispose(&v68, 8);
  return v30;
}

- (id)_assetKeyForRemoteURL:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1A8580B64]();
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("https")))
    {
      objc_msgSend(v3, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "hash"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_prepareForUseIfNeeded
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__FCAssetManager__prepareForUseIfNeeded__block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

FCANEFFileDataProvider *__49__FCAssetManager_assetHandleForURL_lifetimeHint___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  FCANEFFileDataProvider *v10;

  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v2 && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v2, "wrappingKeyID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (_QWORD *)a1[4];
      if (v4)
        v4 = (_QWORD *)v4[11];
      v5 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      v6 = v4;
      objc_msgSend(v5, "wrappingKeyID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachedWrappingKeyWithID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = v8;
        v10 = -[FCANEFFileDataProvider initWithFilePath:wrappingKey:options:holdToken:]([FCANEFFileDataProvider alloc], "initWithFilePath:wrappingKey:options:holdToken:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v9, a1[4] != 0, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = -[FCRawFileDataProvider initWithFilePath:holdToken:]([FCRawFileDataProvider alloc], "initWithFilePath:holdToken:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void __29__FCAssetManager__initStores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "hasSize") & 1) == 0 && (objc_msgSend(v8, "hasError") & 1) == 0)
      objc_msgSend(v8, "setSize:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "sizeOfFileForKey:", v9));

  }
}

- (id)assetHandleForCKAssetURLString:(id)a3 lifetimeHint:(int64_t)a4
{
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetManager _assetHandleForCKAssetURLComponents:lifetimeHint:](self, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __40__FCAssetManager__prepareForUseIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  FCKeyValueStoreClassRegistry *v2;
  uint64_t v3;
  void *v4;
  FCKeyValueStore *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCAssetStore *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE v21[24];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 32))
  {
    if (!NSClassFromString(CFSTR("XCTest"))
      && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
      *(_DWORD *)v21 = 136315906;
      *(_QWORD *)&v21[4] = "-[FCAssetManager _initStores]";
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "FCAssetManager.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 731;
      WORD2(v22) = 2114;
      *(_QWORD *)((char *)&v22 + 6) = v20;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);

    }
    v2 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    -[FCKeyValueStoreClassRegistry registerClass:](v2, "registerClass:", objc_opt_class());
    v3 = -[FCKeyValueStoreClassRegistry registerClass:](v2, "registerClass:", objc_opt_class());
    v4 = (void *)MEMORY[0x1A8580B64](v3);
    v5 = [FCKeyValueStore alloc];
    objc_msgSend(*(id *)(v1 + 16), "stringByAppendingString:", CFSTR("-keyvaluestore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:](v5, "initWithName:directory:version:options:classRegistry:", v6, *(_QWORD *)(v1 + 24), 6, 0, v2);
    v8 = *(void **)(v1 + 32);
    *(_QWORD *)(v1 + 32) = v7;

    objc_autoreleasePoolPop(v4);
    v9 = (void *)MEMORY[0x1A8580B64]();
    v10 = [FCAssetStore alloc];
    objc_msgSend(*(id *)(v1 + 104), "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCAssetStore initWithDirectoryAtPath:preferredAssetPathExtension:knownKeys:](v10, "initWithDirectoryAtPath:preferredAssetPathExtension:knownKeys:", v11, 0, v12);
    v14 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = v13;

    objc_autoreleasePoolPop(v9);
    v15 = (void *)MEMORY[0x1A8580B64]();
    v16 = *(void **)(v1 + 32);
    *(_QWORD *)v21 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v21[8] = 3221225472;
    *(_QWORD *)&v21[16] = __29__FCAssetManager__initStores__block_invoke;
    *(_QWORD *)&v22 = &unk_1E4649D38;
    *((_QWORD *)&v22 + 1) = v1;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(v1 + 40), "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v1 + 48);
    objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", CFSTR("cacheHints"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setupWithInitialKeys:persistedHints:", v17, v19);

  }
}

- (FCAssetManager)initWithName:(id)a3 directory:(id)a4 keyManager:(id)a5 avAssetFactory:(id)a6 resourceURLGenerator:(id)a7 networkBehaviorMonitor:(id)a8 networkReachability:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FCAssetManager *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSString *parentDirectory;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSURL *directoryURLForCachedAssets;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *initQueue;
  FCCacheCoordinator *v34;
  FCCacheCoordinator *cacheCoordinator;
  uint64_t v36;
  FCMapTable *assetHandles;
  uint64_t v38;
  NFUnfairLock *assetHandlesLock;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  void *v50;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v51 = a8;
  v19 = a9;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v45 = a8;
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "name != nil");
    *(_DWORD *)buf = 136315906;
    v54 = "-[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:"
          "networkReachability:]";
    v55 = 2080;
    v56 = "FCAssetManager.m";
    v57 = 1024;
    v58 = 110;
    v59 = 2114;
    v60 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    a8 = v45;
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v46 = a8;
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "directory != nil");
    *(_DWORD *)buf = 136315906;
    v54 = "-[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:"
          "networkReachability:]";
    v55 = 2080;
    v56 = "FCAssetManager.m";
    v57 = 1024;
    v58 = 111;
    v59 = 2114;
    v60 = v42;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    a8 = v46;
  }
LABEL_6:
  v50 = v19;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v47 = a8;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkReachability != nil");
    *(_DWORD *)buf = 136315906;
    v54 = "-[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:"
          "networkReachability:]";
    v55 = 2080;
    v56 = "FCAssetManager.m";
    v57 = 1024;
    v58 = 112;
    v59 = 2114;
    v60 = v43;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    a8 = v47;
  }
  v52.receiver = self;
  v52.super_class = (Class)FCAssetManager;
  v20 = -[FCAssetManager init](&v52, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    parentDirectory = v20->_parentDirectory;
    v20->_parentDirectory = (NSString *)v23;

    objc_msgSend(v14, "stringByAppendingString:", CFSTR("-assetstore"));
    v49 = v17;
    v44 = a7;
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v26);
    v27 = a8;
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v28, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    directoryURLForCachedAssets = v20->_directoryURLForCachedAssets;
    v20->_directoryURLForCachedAssets = (NSURL *)v29;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.news.assetmanager.init", v31);
    initQueue = v20->_initQueue;
    v20->_initQueue = (OS_dispatch_queue *)v32;

    v16 = v25;
    v34 = objc_alloc_init(FCCacheCoordinator);
    cacheCoordinator = v20->_cacheCoordinator;
    v20->_cacheCoordinator = v34;

    -[FCCacheCoordinator setDelegate:](v20->_cacheCoordinator, "setDelegate:", v20);
    +[FCMapTable strongToWeakObjectsMapTable](FCMapTable, "strongToWeakObjectsMapTable");
    v36 = objc_claimAutoreleasedReturnValue();
    assetHandles = v20->_assetHandles;
    v20->_assetHandles = (FCMapTable *)v36;

    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    assetHandlesLock = v20->_assetHandlesLock;
    v20->_assetHandlesLock = (NFUnfairLock *)v38;

    objc_storeStrong((id *)&v20->_networkBehaviorMonitor, v27);
    objc_storeStrong((id *)&v20->_networkReachability, a9);
    objc_storeStrong((id *)&v20->_keyManager, a5);
    objc_storeStrong((id *)&v20->_avAssetFactory, a6);
    v17 = v49;
    objc_storeStrong((id *)&v20->_resourceURLGenerator, v44);

  }
  return v20;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  id v3;
  uint64_t (**v4)(void *, void *);
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke;
  aBlock[3] = &unk_1E4649D10;
  aBlock[4] = self;
  v3 = a3;
  v4 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v3, "keysWithZeroInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4[2](v4, v5);
  objc_msgSend(v3, "keysWithNonZeroInterest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v4[2](v4, v7);
  v9 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = objc_msgSend(v7, "count");
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2048;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "asset manager contains %lu held assets (size=%{public}@) and %lu non-held assets (size=%{public}@)", buf, 0x2Au);

  }
  return v6;
}

uint64_t __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke_2;
  v7[3] = &unk_1E4649CE8;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsForKeys:usingBlock:", v3, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)interestTokenForAssetURLs:(id)a3
{
  id v4;
  void *v5;
  FCCacheCoordinator *cacheCoordinator;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__FCAssetManager_interestTokenForAssetURLs___block_invoke;
  v9[3] = &unk_1E4649BD0;
  v9[4] = self;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator holdTokenForKeys:](cacheCoordinator, "holdTokenForKeys:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  FCCacheCoordinatorFlushPolicy *v10;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinatorFlushPolicy *v12;

  v4 = 10000000;
  v5 = 5000000;
  v6 = a3 == 0;
  if (a3 == 1)
    v6 = 0;
  else
    v5 = 0;
  if (a3 != 1)
    v4 = 0;
  if (a3 == 2)
    v7 = 200000000;
  else
    v7 = v5;
  v8 = a3 != 2 && v6;
  if (a3 == 2)
    v9 = 300000000;
  else
    v9 = v4;
  v10 = -[FCCacheCoordinatorFlushPolicy initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:]([FCCacheCoordinatorFlushPolicy alloc], "initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:", v7, v9, v8);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v12 = v10;
  -[FCCacheCoordinator enableFlushingWithPolicy:](cacheCoordinator, "enableFlushingWithPolicy:", v10);

}

- (FCAssetManager)init
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
    v8 = "-[FCAssetManager init]";
    v9 = 2080;
    v10 = "FCAssetManager.m";
    v11 = 1024;
    v12 = 99;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAssetManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)assetHandleForCKAssetURL:(id)a3 lifetimeHint:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetManager _assetHandleForCKAssetURLComponents:lifetimeHint:](self, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)assetHandleForCKAssetURLString:(id)a3 prefetchedData:(id)a4 unzipIfNeeded:(BOOL)a5 lifetimeHint:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  FCAssetManager *v23;
  id v24;
  id v25;
  _QWORD *v26;
  int64_t v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;

  v10 = a3;
  v11 = a4;
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__74;
  v29[4] = __Block_byref_object_dispose__74;
  v30 = 0;
  if (v11)
  {
    -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v15 = cacheCoordinator;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __91__FCAssetManager_assetHandleForCKAssetURLString_prefetchedData_unzipIfNeeded_lifetimeHint___block_invoke;
    v22 = &unk_1E4649B58;
    v23 = self;
    v16 = v13;
    v24 = v16;
    v28 = a5;
    v25 = v11;
    v26 = v29;
    v27 = a6;
    -[FCCacheCoordinator performCacheWrite:](v15, "performCacheWrite:", &v19);

  }
  -[FCAssetManager assetHandleForCKAssetURLString:lifetimeHint:](self, "assetHandleForCKAssetURLString:lifetimeHint:", v10, a6, v19, v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v29, 8);

  return v17;
}

void __91__FCAssetManager_assetHandleForCKAssetURLString_prefetchedData_unzipIfNeeded_lifetimeHint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  if ((objc_msgSend(v3, "cacheContainsKey:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v19 = *(id *)(a1 + 48);
    if (*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 48), "fc_isGzipped"))
    {
      objc_msgSend(*(id *)(a1 + 48), "fc_gzipInflate");
      v4 = objc_claimAutoreleasedReturnValue();

      v19 = (id)v4;
    }
    -[FCAssetManager assetStore](*(_QWORD **)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copyData:withKey:", v19, *(_QWORD *)(a1 + 40));

    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        v8 = *(void **)(v7 + 48);
      else
        v8 = 0;
      objc_msgSend(v8, "didInsertKeyIntoCache:withLifetimeHint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
      v9 = *(_QWORD **)(a1 + 32);
      if (v9)
        v9 = (_QWORD *)v9[6];
      v10 = *(_QWORD *)(a1 + 40);
      v11 = v9;
      objc_msgSend(v11, "holdTokenForKey:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v15 = *(_QWORD *)(a1 + 32);
      if (v15)
        v16 = *(void **)(v15 + 48);
      else
        v16 = 0;
      objc_msgSend(v16, "persistableHints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("cacheHints"));

      }
    }

  }
}

- (id)assetHandleForURL:(id)a3 prefetchedFileURL:(id)a4 importMethod:(int64_t)a5 lifetimeHint:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _BYTE *v26;
  uint64_t *v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE buf[24];
  __int128 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "remoteURL");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCAssetManager assetHandleForURL:prefetchedFileURL:importMethod:lifetimeHint:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = 308;
    WORD2(v37) = 2114;
    *(_QWORD *)((char *)&v37 + 6) = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "prefetchedFileURL");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCAssetManager assetHandleForURL:prefetchedFileURL:importMethod:lifetimeHint:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = 309;
    WORD2(v37) = 2114;
    *(_QWORD *)((char *)&v37 + 6) = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v37 = __Block_byref_object_copy__74;
  *((_QWORD *)&v37 + 1) = __Block_byref_object_dispose__74;
  v38 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__74;
  v34 = __Block_byref_object_dispose__74;
  v35 = 0;
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v14 = cacheCoordinator;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__FCAssetManager_assetHandleForURL_prefetchedFileURL_importMethod_lifetimeHint___block_invoke;
  v23[3] = &unk_1E4649B80;
  v23[4] = self;
  v15 = v11;
  v24 = v15;
  v28 = a5;
  v16 = v12;
  v25 = v16;
  v26 = buf;
  v29 = a6;
  v27 = &v30;
  -[FCCacheCoordinator performCacheWrite:](v14, "performCacheWrite:", v23);

  -[FCAssetManager assetHandleForURL:lifetimeHint:](self, "assetHandleForURL:lifetimeHint:", v10, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  if (v17)
    objc_setProperty_atomic_copy(v17, v18, (id)v31[5], 112);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v19;
}

void __80__FCAssetManager_assetHandleForURL_prefetchedFileURL_importMethod_lifetimeHint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetManager _importFileAtPath:method:key:mimeType:importedMetadata:lifetimeHint:](v2, v3, *(_QWORD *)(a1 + 72), *(void **)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 80));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[6];
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v5;
  objc_msgSend(v7, "holdTokenForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v4;

}

- (id)_importFileAtPath:(uint64_t)a3 method:(void *)a4 key:(void *)a5 mimeType:(void *)a6 importedMetadata:(uint64_t)a7 lifetimeHint:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t v40;

  v13 = a2;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (a1)
  {
    -[FCAssetManager assetStore]((_QWORD *)a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filePathForKey:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = v18;
    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2;
      v37[3] = &unk_1E4649D60;
      v40 = a3;
      v37[4] = a1;
      v38 = v13;
      v21 = v14;
      v39 = v21;
      __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2((uint64_t)v37);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v29 = v13;
        v31[0] = v20;
        v31[1] = 3221225472;
        v31[2] = __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_4;
        v31[3] = &unk_1E4649D88;
        v32 = v16;
        v33 = a1;
        v22 = v21;
        v34 = v22;
        v35 = v15;
        v30 = v19;
        v36 = v30;
        __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_4((uint64_t)v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCAssetManager keyValueStore]((_QWORD *)a1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v23, v22);

        objc_msgSend(*(id *)(a1 + 48), "didInsertKeyIntoCache:withLifetimeHint:", v22, a7);
        objc_msgSend(*(id *)(a1 + 48), "persistableHints");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[FCAssetManager keyValueStore]((_QWORD *)a1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("cacheHints"));

        }
        v27 = v30;

        v13 = v29;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)importAsset:(id)a3 remoteURL:(id)a4 fileURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  FCCacheCoordinator *cacheCoordinator;
  void *v13;
  NFUnfairLock *assetHandlesLock;
  NFUnfairLock *v15;
  uint64_t v16;
  id v17;
  FCCacheCoordinator *v18;
  FCCacheCoordinator *v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  _QWORD v32[5];
  id v33;
  _BYTE *v34;
  _BYTE buf[24];
  __int128 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetMetadata");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCAssetManager importAsset:remoteURL:fileURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v36) = 345;
    WORD2(v36) = 2114;
    *(_QWORD *)((char *)&v36 + 6) = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "remoteURL");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCAssetManager importAsset:remoteURL:fileURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v36) = 346;
    WORD2(v36) = 2114;
    *(_QWORD *)((char *)&v36 + 6) = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCAssetManager importAsset:remoteURL:fileURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCAssetManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v36) = 347;
    WORD2(v36) = 2114;
    *(_QWORD *)((char *)&v36 + 6) = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator holdTokenForKey:](cacheCoordinator, "holdTokenForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v36 = __Block_byref_object_copy__74;
  *((_QWORD *)&v36 + 1) = __Block_byref_object_dispose__74;
  v37 = 0;
  if (self)
    assetHandlesLock = self->_assetHandlesLock;
  else
    assetHandlesLock = 0;
  v15 = assetHandlesLock;
  v16 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke;
  v32[3] = &unk_1E463AD58;
  v34 = buf;
  v32[4] = self;
  v17 = v11;
  v33 = v17;
  -[NFUnfairLock performWithLockSync:](v15, "performWithLockSync:", v32);

  if (self)
    v18 = self->_cacheCoordinator;
  else
    v18 = 0;
  v19 = v18;
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke_2;
  v27[3] = &unk_1E4649BA8;
  v27[4] = self;
  v20 = v10;
  v28 = v20;
  v21 = v17;
  v29 = v21;
  v22 = v8;
  v30 = v22;
  v31 = buf;
  -[FCCacheCoordinator performCacheWrite:](v19, "performCacheWrite:", v27);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __48__FCAssetManager_importAsset_remoteURL_fileURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  id newValue;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetManager _importFileAtPath:method:key:mimeType:importedMetadata:lifetimeHint:](v2, v3, 0, *(void **)(a1 + 48), 0, *(void **)(a1 + 56), 0);
  newValue = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v5)
    objc_setProperty_atomic_copy(v5, v4, newValue, 112);
  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v9)
    objc_setProperty_atomic(v9, v7, v8, 120);

}

- (id)operationToFetchDataProviderForAssetHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  const char *v10;
  _QWORD *v11;
  id Property;
  id v13;
  FCAssetDownloadOperation *v14;
  FCAssetManager *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id location;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  FCAssetManager *v34;
  FCAssetManager *v35;
  _QWORD *v36;
  _QWORD *v37;
  id v38;
  id from[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v6);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __72__FCAssetManager_operationToFetchDataProviderForAssetHandle_completion___block_invoke;
  v26[3] = &unk_1E4649BF8;
  v8 = v7;
  v27 = v8;
  objc_copyWeak(&v28, &location);
  v26[4] = self;
  v9 = v6;
  v11 = v26;
  if (!self)
  {
    v14 = 0;
    goto LABEL_16;
  }
  if (v9)
    Property = objc_getProperty(v9, v10, 112, 1);
  else
    Property = 0;
  v13 = Property;

  if (!v13)
  {
    if (v9)
      v16 = (void *)v9[12];
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend(v9, "remoteURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("news-record"));

    if ((v20 & 1) != 0)
      goto LABEL_9;
    objc_msgSend(v18, "scheme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("http")))
    {

    }
    else
    {
      objc_msgSend(v18, "scheme");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("https"));

      if (!v24)
      {
LABEL_9:
        v21 = 0;
LABEL_14:
        v14 = -[FCAssetDownloadOperation initWithNetworkReachability:]([FCAssetDownloadOperation alloc], "initWithNetworkReachability:", self->_networkReachability);
        -[FCAssetDownloadOperation setURL:](v14, "setURL:", v18);
        -[FCAssetDownloadOperation setLoggingKey:](v14, "setLoggingKey:", v17);
        -[FCAssetDownloadOperation setNetworkEventType:](v14, "setNetworkEventType:", v21);
        -[FCAssetDownloadOperation setNetworkBehaviorMonitor:](v14, "setNetworkBehaviorMonitor:", self->_networkBehaviorMonitor);
        objc_initWeak(from, v9);
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_3;
        v33 = &unk_1E4649C70;
        v34 = self;
        v15 = (FCAssetManager *)v17;
        v35 = v15;
        objc_copyWeak(&v38, from);
        v36 = v9;
        v37 = v11;
        -[FCAssetDownloadOperation setFileDownloadCompletionHandler:](v14, "setFileDownloadCompletionHandler:", &v30);

        objc_destroyWeak(&v38);
        objc_destroyWeak(from);

        goto LABEL_15;
      }
    }
    v21 = 15;
    goto LABEL_14;
  }
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke;
  v33 = &unk_1E4649C20;
  v34 = v11;
  __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke((uint64_t)&v30);
  v14 = (FCAssetDownloadOperation *)objc_claimAutoreleasedReturnValue();
  v15 = v34;
LABEL_15:

LABEL_16:
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  return v14;
}

void __72__FCAssetManager_operationToFetchDataProviderForAssetHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  const char *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  id v16;
  void (**v17)(void *, void *);
  id v18;
  void *v19;
  id v20;
  SEL v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  void (**v30)(void *, void *);
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  _QWORD aBlock[4];
  id v39;
  id v40;

  v27 = a2;
  if (v27)
  {
    v3 = *(id *)(a1 + 40);
    v4 = v3;
    if (v3)
      (*((void (**)(id, _QWORD, id))v3 + 2))(v3, 0, v27);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v4 = WeakRetained;
      v9 = v6;
      if (v7)
      {
        v10 = objc_getProperty(v4, v8, 112, 1);

        if (v10)
        {
          v11 = MEMORY[0x1E0C809B0];
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_53;
          aBlock[3] = &unk_1E463B790;
          v12 = v4;
          v39 = v12;
          v13 = v9;
          v40 = v13;
          v14 = (void (**)(_QWORD))_Block_copy(aBlock);
          v31 = v11;
          v32 = 3221225472;
          v33 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_2;
          v34 = &unk_1E4649C98;
          v15 = v12;
          v35 = v15;
          v36 = v7;
          v16 = v13;
          v37 = v16;
          v17 = (void (**)(void *, void *))_Block_copy(&v31);
          v18 = *(id *)(v7 + 88);
          v19 = v18;
          if (v18)
          {
            v20 = v18;
            v22 = objc_getProperty(v15, v21, 120, 1);
            objc_msgSend(v22, "wrappingKeyID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v24 = v23;
              objc_msgSend(v20, "cachedWrappingKeyWithID:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                v17[2](v17, v25);
              }
              else
              {
                v28[0] = MEMORY[0x1E0C809B0];
                v28[1] = 3221225472;
                v28[2] = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_5;
                v28[3] = &unk_1E4649CC0;
                v29 = v16;
                v30 = v17;
                objc_msgSend(v20, "fetchWrappingKeyWithID:completionHandler:", v24, v28);

              }
            }
            else
            {
              v14[2](v14);
            }

          }
          else
          {
            v14[2](v14);
          }

        }
        else
        {
          v31 = MEMORY[0x1E0C809B0];
          v32 = 3221225472;
          v33 = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke;
          v34 = &unk_1E463B598;
          v35 = v9;
          __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke((uint64_t)&v31);
        }
      }

    }
    else
    {
      v26 = *(_QWORD *)(a1 + 40);
      if (v26)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v26 + 16))(v26, 0, 0);
      v4 = 0;
    }
  }

}

- (id)contentArchiveForAssetHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  FCAssetManager *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__FCAssetManager_contentArchiveForAssetHandle___block_invoke;
  v13 = &unk_1E463EFB0;
  v14 = v4;
  v15 = self;
  v6 = v4;
  objc_msgSend(v5, "fc_array:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __47__FCAssetManager_contentArchiveForAssetHandle___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id Property;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 120, 1);
  v5 = Property;
  objc_msgSend(*(id *)(a1 + 32), "remoteURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)(a1 + 32);
  if (v8)
    v8 = objc_getProperty(v8, v6, 112, 1);
  v9 = v8;
  +[FCContentArchive archiveWithAsset:remoteURL:filePath:](FCContentArchive, "archiveWithAsset:remoteURL:filePath:", v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fc_safelyAddObject:", v10);

  v12 = *(id *)(a1 + 32);
  if (v12)
    v12 = objc_getProperty(v12, v11, 120, 1);
  v13 = v12;
  objc_msgSend(v13, "wrappingKeyID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      v16 = *(void **)(v15 + 88);
    else
      v16 = 0;
    objc_msgSend(v16, "cachedWrappingKeyWithID:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[FCContentArchive archiveWithAssetWrappingKey:wrappingKeyID:](FCContentArchive, "archiveWithAssetWrappingKey:wrappingKeyID:", v17, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fc_safelyAddObject:", v18);

    }
  }

}

uint64_t __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    dispatch_get_global_queue(17, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2;
    block[3] = &unk_1E463B598;
    v5 = v1;
    dispatch_async(v2, block);

  }
  return 0;
}

uint64_t __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  id v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  __CFString *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v37 = a4;
  objc_msgSend(v8, "responseMIMEType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  v14 = v9;
  v15 = 0;
  if (v11 && v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "fc_isGzippedWithMIMETypeHint:", v14))
    {
      +[FCGzipAssetTransformer sharedInstance](FCGzipAssetTransformer, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  if (v13 && v15)
  {
    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0;
    LODWORD(v19) = objc_msgSend(v15, "transformAssetDataFromFilePath:toFilePath:error:", v13, v20, &v46);
    v21 = (char *)v46;
    if ((_DWORD)v19)
    {
      v22 = v20;

      v23 = CFSTR("application/octet-stream");
      v13 = v22;
      v14 = v23;
    }
    else
    {

      v24 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        v36 = *(const char **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v48 = v36;
        v49 = 2114;
        v50 = v21;
        _os_log_error_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_ERROR, "failed to transform asset %{public}@ with error: %{public}@", buf, 0x16u);
      }
      v13 = 0;
    }

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCAssetDownloadOperation sharedURLSession](FCAssetDownloadOperation, "sharedURLSession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "delegateQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v25 == v27;

    if (!v28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("successful asset downloads must be handled on URL session queue"));
      *(_DWORD *)buf = 136315906;
      v48 = "-[FCAssetManager _populateRawFilePathForAssetHandle:completion:]_block_invoke";
      v49 = 2080;
      v50 = "FCAssetManager.m";
      v51 = 1024;
      v52 = 488;
      v53 = 2114;
      v54 = v35;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v29 = *(_QWORD **)(a1 + 32);
    if (v29)
      v29 = (_QWORD *)v29[6];
    v30 = v29;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_47;
    v40[3] = &unk_1E4649C48;
    v40[4] = *(_QWORD *)(a1 + 32);
    v41 = v13;
    v42 = *(id *)(a1 + 40);
    v43 = v14;
    objc_copyWeak(&v45, (id *)(a1 + 64));
    v44 = *(id *)(a1 + 48);
    objc_msgSend(v30, "performCacheWrite:", v40);

    v31 = *(_QWORD *)(a1 + 56);
    if (v31)
      (*(void (**)(uint64_t, _QWORD))(v31 + 16))(v31, 0);

    objc_destroyWeak(&v45);
  }
  else
  {
    if (v37 && objc_msgSend(v37, "fc_isHTTPNotFoundError"))
    {
      v32 = *(_QWORD *)(a1 + 32);
      if (v32)
        v33 = *(void **)(v32 + 48);
      else
        v33 = 0;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2_48;
      v38[3] = &unk_1E463AD10;
      v38[4] = v32;
      v39 = *(id *)(a1 + 40);
      objc_msgSend(v33, "performCacheWrite:", v38);

    }
    v34 = *(_QWORD *)(a1 + 56);
    if (v34)
      (*(void (**)(uint64_t, id))(v34 + 16))(v34, v37);
  }

}

void __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_47(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t *WeakRetained;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  id newValue;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = WeakRetained[13];
  else
    v8 = 0;
  -[FCAssetManager _importFileAtPath:method:key:mimeType:importedMetadata:lifetimeHint:](v2, v3, 1, v4, v5, 0, v8);
  newValue = (id)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 64);
  if (v10)
    objc_setProperty_atomic_copy(v10, v9, newValue, 112);
  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 64);
  if (v14)
    objc_setProperty_atomic(v14, v12, v13, 120);

}

void __64__FCAssetManager__populateRawFilePathForAssetHandle_completion___block_invoke_2_48(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D62640]);
  objc_msgSend(v3, "setError:", 1);
  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must fetch asset's raw file before fetching the data provider"));
    v4 = 136315906;
    v5 = "-[FCAssetManager _fetchDataProviderForAssetHandle:completion:]_block_invoke";
    v6 = 2080;
    v7 = "FCAssetManager.m";
    v8 = 1024;
    v9 = 529;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_53(uint64_t a1)
{
  const char *v2;
  FCRawFileDataProvider *v3;
  id Property;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  FCRawFileDataProvider *v9;

  v3 = [FCRawFileDataProvider alloc];
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v2, 112, 1);
  v5 = Property;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[11];
  v7 = v6;
  v9 = -[FCRawFileDataProvider initWithFilePath:holdToken:](v3, "initWithFilePath:holdToken:", v5, v7);

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, FCRawFileDataProvider *, _QWORD))(v8 + 16))(v8, v9, 0);

}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  FCANEFFileDataProvider *v5;
  id Property;
  id v7;
  _QWORD *v8;
  _BOOL8 v9;
  _QWORD *v10;
  uint64_t v11;
  FCANEFFileDataProvider *v12;

  v3 = a2;
  v5 = [FCANEFFileDataProvider alloc];
  Property = (id)a1[4];
  if (Property)
    Property = objc_getProperty(Property, v4, 112, 1);
  v7 = Property;
  v8 = (_QWORD *)a1[4];
  v9 = a1[5] != 0;
  if (v8)
    v8 = (_QWORD *)v8[11];
  v10 = v8;
  v12 = -[FCANEFFileDataProvider initWithFilePath:wrappingKey:options:holdToken:](v5, "initWithFilePath:wrappingKey:options:holdToken:", v7, v3, v9, v10);

  v11 = a1[6];
  if (v11)
    (*(void (**)(uint64_t, FCANEFFileDataProvider *, _QWORD))(v11 + 16))(v11, v12, 0);

}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }
  else if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_7;
    v8[3] = &unk_1E463B598;
    v8[4] = *(_QWORD *)(a1 + 32);
    __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_7((uint64_t)v8);
  }

}

void __62__FCAssetManager__fetchDataProviderForAssetHandle_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_missingAssetKeyError");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __58__FCAssetManager_cacheCoordinatorCurrentSizeWithReadLock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "size");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134218242;
    v26 = objc_msgSend(v7, "count");
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "asset manager is flushing %lu files with keys: %@", buf, 0x16u);

  }
  -[FCAssetManager keyValueStore](self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsForKeys:", v11);

  objc_msgSend(v6, "persistableHints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("cacheHints"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17);
        -[FCAssetManager assetStore](self);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeFileWithKey:", v18, (_QWORD)v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)saveWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *initQueue;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(_QWORD))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__74;
  v12 = __Block_byref_object_dispose__74;
  v13 = 0;
  initQueue = self->_initQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__FCAssetManager_saveWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(initQueue, v7);
  if (v9[5])
  {
    -[FCAssetManager keyValueStore](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveWithCompletionHandler:", v4);

  }
  else
  {
    v4[2](v4);
  }
  _Block_object_dispose(&v8, 8);

}

void __44__FCAssetManager_saveWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)save
{
  NSObject *initQueue;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__74;
  v8 = __Block_byref_object_dispose__74;
  v9 = 0;
  initQueue = self->_initQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__FCAssetManager_save__block_invoke;
  v3[3] = &unk_1E463AD80;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(initQueue, v3);
  objc_msgSend((id)v5[5], "save");
  _Block_object_dispose(&v4, 8);

}

void __22__FCAssetManager_save__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (int64_t)storageSize
{
  void *v3;
  uint64_t v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  int64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  -[FCAssetManager _prepareForUseIfNeeded]((uint64_t)self);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[FCAssetManager keyValueStore](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "storeSize");

  v13 = v4;
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v6 = cacheCoordinator;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__FCAssetManager_storageSize__block_invoke;
  v9[3] = &unk_1E463DF90;
  v9[4] = self;
  v9[5] = &v10;
  -[FCCacheCoordinator performCacheRead:](v6, "performCacheRead:", v9);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __29__FCAssetManager_storageSize__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = v2;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__FCAssetManager_storageSize__block_invoke_2;
  v7[3] = &unk_1E4649CE8;
  v5 = *(_QWORD *)(a1 + 40);

  v7[4] = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsForKeys:usingBlock:", v4, v7);

}

uint64_t __29__FCAssetManager_storageSize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "size");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)d_resetAssetHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCCacheCoordinator *cacheCoordinator;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "remoteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetManager _assetKeyForRemoteURL:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__FCAssetManager_d_resetAssetHandle___block_invoke;
  v10[3] = &unk_1E463B228;
  v10[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  -[FCCacheCoordinator performCacheWrite:](cacheCoordinator, "performCacheWrite:", v10);

}

void __37__FCAssetManager_d_resetAssetHandle___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[FCAssetManager assetStore](*(_QWORD **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFileWithKey:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[6];
  v10 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = v3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didRemoveKeysFromCache:", v6, v10, v11);

  -[FCAssetManager keyValueStore](*(_QWORD **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  v9 = *(void **)(a1 + 48);
  if (v9)
    objc_setProperty_atomic_copy(v9, v8, 0, 112);
}

id __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 56);
  if (v3 == 1)
  {
    -[FCAssetManager assetStore](*(_QWORD **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveFileAtPath:withKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v3)
  {
    -[FCAssetManager assetStore](*(_QWORD **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copyFileAtPath:withKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_5:
    v1 = (void *)v5;

  }
  return v1;
}

id __86__FCAssetManager__importFileAtPath_method_key_mimeType_importedMetadata_lifetimeHint___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D62640]);
    -[FCAssetManager assetStore](*(_QWORD **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSize:", objc_msgSend(v4, "sizeOfFileForKey:", *(_QWORD *)(a1 + 48)));

    v6 = *(void **)(a1 + 56);
    if (!v6 || FCMIMETypeIsANEF(v6, v5))
    {
      v7 = -[FCANEFHeader initWithFilePath:]([FCANEFHeader alloc], *(_QWORD *)(a1 + 64));
      v8 = v7;
      if (v7)
      {
        v9 = (id)v7[1];
        objc_msgSend(v2, "setWrappingKeyID:", v9);

      }
    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURLGenerator, 0);
  objc_storeStrong((id *)&self->_avAssetFactory, 0);
  objc_storeStrong((id *)&self->_directoryURLForCachedAssets, 0);
  objc_storeStrong((id *)&self->_initQueue, 0);
  objc_storeStrong((id *)&self->_keyManager, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_assetHandlesLock, 0);
  objc_storeStrong((id *)&self->_assetHandles, 0);
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_assetStore, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_parentDirectory, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)t_save
{
  id v2;

  -[FCAssetManager keyValueStore](self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

- (id)assetHandleForResourceID:(id)a3 contentContext:(id)a4
{
  return -[FCAssetManager assetHandleForResourceID:lifetimeHint:contentContext:](self, "assetHandleForResourceID:lifetimeHint:contentContext:", a3, 0, a4);
}

- (id)assetHandleForResourceID:(id)a3 lifetimeHint:(int64_t)a4 contentContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a5, "internalContentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetManager assetHandleForRecordID:field:lifetimeHint:contentDatabase:](self, "assetHandleForRecordID:field:lifetimeHint:contentDatabase:", v8, 3, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
