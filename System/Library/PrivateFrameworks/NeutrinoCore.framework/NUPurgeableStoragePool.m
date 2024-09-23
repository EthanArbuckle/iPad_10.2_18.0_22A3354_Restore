@implementation NUPurgeableStoragePool

- (NUPurgeableStoragePool)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 41, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUPurgeableStoragePool)initWithStorageClass:(Class)a3
{
  NUPurgeableStoragePool *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *stateQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *migrationQueue;
  uint64_t v11;
  NSMutableArray *volatileList;
  uint64_t v13;
  NSMutableArray *nonPurgeableList;
  uint64_t v15;
  NSMutableArray *sharedStoragesToBeReclaimedList;
  NUStoragePoolStats *v17;
  NUStoragePoolStats *stats;
  double v19;
  id v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_1586();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "storageClass != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1586();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v29;
        v41 = 2114;
        v42 = v33;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool initWithStorageClass:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 46, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"storageClass != nil");
  }
  v38.receiver = self;
  v38.super_class = (Class)NUPurgeableStoragePool;
  v4 = -[NUPurgeableStoragePool init](&v38, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("NUPurgeableStoragePool.stateQueue", v5);
  stateQueue = v4->_stateQueue;
  v4->_stateQueue = (OS_dispatch_queue *)v6;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("NUPurgeableStoragePool.migrationQueue", v8);
  migrationQueue = v4->_migrationQueue;
  v4->_migrationQueue = (OS_dispatch_queue *)v9;

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
  volatileList = v4->_volatileList;
  v4->_volatileList = (NSMutableArray *)v11;

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
  nonPurgeableList = v4->_nonPurgeableList;
  v4->_nonPurgeableList = (NSMutableArray *)v13;

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
  sharedStoragesToBeReclaimedList = v4->_sharedStoragesToBeReclaimedList;
  v4->_sharedStoragesToBeReclaimedList = (NSMutableArray *)v15;

  objc_storeStrong((id *)&v4->_storageClass, a3);
  v17 = objc_alloc_init(NUStoragePoolStats);
  stats = v4->_stats;
  v4->_stats = v17;

  v4->_nonPurgeableLimit = +[NUGlobalSettings storagePoolNonPurgeableLimit](NUGlobalSettings, "storagePoolNonPurgeableLimit");
  v4->_purgeableLimit = +[NUGlobalSettings storagePoolPurgeableLimit](NUGlobalSettings, "storagePoolPurgeableLimit");
  +[NUGlobalSettings storagePoolMigrationDelay](NUGlobalSettings, "storagePoolMigrationDelay");
  v4->_migrationDelay = v19;
  v20 = (id)s_pools;
  objc_sync_enter(v20);
  objc_msgSend((id)s_pools, "compact");
  objc_msgSend((id)s_pools, "addPointer:", v4);
  objc_sync_exit(v20);

  return v4;
}

- (id)newStorageWithSize:(id)a3 format:(id)a4
{
  return -[NUPurgeableStoragePool newStorageWithSize:format:exactMatch:](self, "newStorageWithSize:format:exactMatch:", a3.var0, a3.var1, a4, 1);
}

- (id)newStorageWithMinimumSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v8 = NUPixelSizeAlignToGrid(var0, var1, 256, 256, 0);
  v10 = -[NUPurgeableStoragePool newStorageWithSize:format:exactMatch:](self, "newStorageWithSize:format:exactMatch:", v8, v9, v7, 0);

  return v10;
}

- (id)newStorageWithSize:(id)a3 format:(id)a4 exactMatch:(BOOL)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  NSObject *stateQueue;
  id v11;
  id v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD block[5];
  id v40;
  uint64_t *v41;
  int64_t v42;
  int64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  var1 = a3.var1;
  var0 = a3.var0;
  v55 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__1600;
  v49 = __Block_byref_object_dispose__1601;
  v50 = 0;
  if (var1 < 1 || var0 <= 0)
  {
    NUAssertLogger_1586();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "size.height > 0 && size.width > 0");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1586();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v27;
        v53 = 2114;
        v54 = v29;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v30 = "size.height > 0 && size.width > 0";
    v31 = 88;
LABEL_21:

    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool newStorageWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", v31, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)v30);
  }
  if (!v9)
  {
    NUAssertLogger_1586();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelFormat != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1586();
    v17 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v24)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        v53 = 2114;
        v54 = v34;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v26;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v30 = "pixelFormat != nil";
    v31 = 89;
    goto LABEL_21;
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NUPurgeableStoragePool_newStorageWithSize_format_exactMatch___block_invoke;
  block[3] = &unk_1E5060B70;
  v41 = &v45;
  v42 = var0;
  v43 = var1;
  block[4] = self;
  v40 = v9;
  v44 = a5;
  v11 = v9;
  dispatch_sync(stateQueue, block);
  v12 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  return v12;
}

- (id)_allocateStorageWithSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(self->_storageClass), "initWithSize:format:", var0, var1, v7);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_125);
  v9 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109634;
    v11[1] = var0;
    v12 = 1024;
    v13 = var1;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_1A6553000, v9, OS_LOG_TYPE_DEBUG, "Allocating new storage of size: %dx%d, format: %@", (uint8_t *)v11, 0x18u);
  }

  return v8;
}

- (void)_reclaimSharedStorages
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_sharedStoragesToBeReclaimedList, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_sharedStoragesToBeReclaimedList;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (!v4)
    {
      v6 = v3;
      goto LABEL_16;
    }
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isInUse", (_QWORD)v10) & 1) == 0)
        {
          -[NUPurgeableStoragePool _returnStorage:](self, "_returnStorage:", v9);
          if (!v6)
            v6 = (void *)objc_opt_new();
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);

    if (v6)
    {
      -[NSMutableArray removeObjectsInArray:](self->_sharedStoragesToBeReclaimedList, "removeObjectsInArray:", v6);
LABEL_16:

    }
  }
}

- (id)_storageFromPoolWithSize:(id)a3 format:(id)a4 exactMatch:(BOOL)a5
{
  int64_t var1;
  int64_t var0;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *specific;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  char *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v81;
  int v82;
  int v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  id v118;
  NUPurgeableStoragePool *v119;
  NSObject *loga;
  os_log_t log;
  id v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id obj;
  id obja;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t v137[128];
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  void *v141;
  _BYTE v142[128];
  uint64_t v143;

  var1 = a3.var1;
  var0 = a3.var0;
  v143 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[NUPurgeableStoragePool _reclaimSharedStorages](self, "_reclaimSharedStorages");
  v9 = -[NSMutableArray count](self->_nonPurgeableList, "count");
  v123 = v8;
  v119 = self;
  if (!v9)
    goto LABEL_51;
  v10 = v9;
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_nonPurgeableList, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
  if (!v11)
    goto LABEL_33;
  v12 = v11;
  v13 = *(_QWORD *)v134;
  while (2)
  {
    v14 = 0;
    v15 = v10 - 1;
    v124 = v10 - v12;
    do
    {
      if (*(_QWORD *)v134 != v13)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v14);
      if (objc_msgSend(v16, "isInUse"))
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
        v17 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = v17;
          objc_msgSend(v18, "stringWithFormat:", CFSTR("No item in the non purgeable list should be in use"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v139 = v20;
          _os_log_impl(&dword_1A6553000, v19, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v21 = _NULogOnceToken;
        }
        else
        {
          v21 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v21 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v22 = (void *)_NUAssertLogger;
          if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v28 = (void *)MEMORY[0x1E0CB3978];
          v122 = specific;
          loga = v22;
          objc_msgSend(v28, "callStackSymbols");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v139 = specific;
          v140 = 2114;
          v141 = v30;
          v31 = loga;
          _os_log_error_impl(&dword_1A6553000, loga, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
        else
        {
          if (v21 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v32 = (void *)_NUAssertLogger;
          if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          v37 = (void *)MEMORY[0x1E0CB3978];
          v31 = v32;
          objc_msgSend(v37, "callStackSymbols");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v139 = v39;
          _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
LABEL_21:
        _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 164, CFSTR("No item in the non purgeable list should be in use"), v23, v24, v25, v26, v115);
      }
      if (objc_msgSend(v16, "size") == var0 && v33 == var1)
      {
        objc_msgSend(v16, "format");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v123, "isEqualToPixelFormat:", v35);

        if (v36)
        {
          self = v119;
          if (objc_msgSend(v16, "isPurgeable"))
          {
            if (_NULogOnceToken != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
            v41 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
            {
              v42 = (void *)MEMORY[0x1E0CB3940];
              v43 = v41;
              objc_msgSend(v42, "stringWithFormat:", CFSTR("Purgeable storage found in non-purgeable list!"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v139 = v44;
              _os_log_impl(&dword_1A6553000, v43, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

              v45 = _NULogOnceToken;
            }
            else
            {
              v45 = -1;
            }
            if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
            {
              if (v45 != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
              v46 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v52 = (void *)MEMORY[0x1E0CB3978];
                v53 = v51;
                v54 = v46;
                objc_msgSend(v52, "callStackSymbols");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v139 = v51;
                v140 = 2114;
                v141 = v56;
                _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

                self = v119;
              }
            }
            else
            {
              if (v45 != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
              v57 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v107 = (void *)MEMORY[0x1E0CB3978];
                v108 = v57;
                objc_msgSend(v107, "callStackSymbols");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "componentsJoinedByString:", CFSTR("\n"));
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v139 = v110;
                _os_log_error_impl(&dword_1A6553000, v108, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

              }
            }
            _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 167, CFSTR("Purgeable storage found in non-purgeable list!"), v47, v48, v49, v50, v115);
          }
          v58 = v16;
          -[NSMutableArray removeObjectAtIndex:](self->_nonPurgeableList, "removeObjectAtIndex:", v15);
          -[NUStoragePoolStats setNonPurgeableCount:](self->_stats, "setNonPurgeableCount:", -[NUStoragePoolStats nonPurgeableCount](self->_stats, "nonPurgeableCount") - 1);
          -[NUStoragePoolStats setNonPurgeableBytes:](self->_stats, "setNonPurgeableBytes:", -[NUStoragePoolStats nonPurgeableBytes](self->_stats, "nonPurgeableBytes")- objc_msgSend(v58, "sizeInBytes"));
          -[NUStoragePoolStats setReusedNonPurgeableCount:](self->_stats, "setReusedNonPurgeableCount:", -[NUStoragePoolStats reusedNonPurgeableCount](self->_stats, "reusedNonPurgeableCount") + 1);
          -[NUPurgeableStoragePool _resetNonPurgeableStorageMigrationTimer](self, "_resetNonPurgeableStorageMigrationTimer");

          v8 = v123;
          if (v58)
            goto LABEL_106;
          goto LABEL_51;
        }
      }
      ++v14;
      --v15;
    }
    while (v12 != v14);
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
    v12 = v40;
    v10 = v124;
    if (v40)
      continue;
    break;
  }
LABEL_33:

  v8 = v123;
  self = v119;
LABEL_51:
  v58 = (char *)-[NSMutableArray count](self->_volatileList, "count");
  if (!v58)
    goto LABEL_106;
  v59 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_volatileList, "reverseObjectEnumerator");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
  if (!v60)
  {
    v88 = 0;
    v58 = 0;
    goto LABEL_101;
  }
  log = v59;
  v125 = 0;
  v126 = 0;
  v61 = *(_QWORD *)v130;
  v116 = 138543618;
  while (2)
  {
    v62 = 0;
    while (2)
    {
      if (*(_QWORD *)v130 != v61)
        objc_enumerationMutation(obja);
      v63 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v62);
      if (objc_msgSend(v63, "isInUse", v116))
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
        v64 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v65 = (void *)MEMORY[0x1E0CB3940];
          v66 = v64;
          objc_msgSend(v65, "stringWithFormat:", CFSTR("No item in the purgeable list should be in use"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v139 = v67;
          _os_log_impl(&dword_1A6553000, v66, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v68 = _NULogOnceToken;
        }
        else
        {
          v68 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v68 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v69 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v75 = (void *)MEMORY[0x1E0CB3978];
            v118 = v74;
            v117 = v69;
            objc_msgSend(v75, "callStackSymbols");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v116;
            v139 = v74;
            v140 = 2114;
            v141 = v77;
            _os_log_error_impl(&dword_1A6553000, v117, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            v8 = v123;
          }
        }
        else
        {
          if (v68 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v78 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v84 = (void *)MEMORY[0x1E0CB3978];
            v85 = v78;
            objc_msgSend(v84, "callStackSymbols");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "componentsJoinedByString:", CFSTR("\n"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v139 = v87;
            _os_log_error_impl(&dword_1A6553000, v85, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            v8 = v123;
          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 192, CFSTR("No item in the purgeable list should be in use"), v70, v71, v72, v73, v116);
      }
      --v58;
      if (objc_msgSend(v63, "size") == var0 && v79 == var1)
      {
        objc_msgSend(v63, "format");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v8, "isEqualToPixelFormat:", v81);

        if (v82)
        {
          v83 = objc_msgSend(v63, "makeNonPurgeable");
          -[NSObject addIndex:](log, "addIndex:", v58);
          if (!v83)
          {
            v125 += objc_msgSend(v63, "sizeInBytes");
            ++v126;
            goto LABEL_81;
          }
          v58 = v63;
          self = v119;
          -[NUStoragePoolStats setVolatileCount:](v119->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](v119->_stats, "volatileCount") - 1);
          v59 = log;
          v60 = v125;
          v88 = v126;
          if ((-[NUStoragePoolStats volatileCount](v119->_stats, "volatileCount") & 0x8000000000000000) == 0)
            goto LABEL_100;
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v89 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
          {
            v90 = (void *)MEMORY[0x1E0CB3940];
            v91 = v89;
            objc_msgSend(v90, "stringWithFormat:", CFSTR("volatileCount count should not be negative"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v139 = v92;
            _os_log_impl(&dword_1A6553000, v91, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

            v93 = _NULogOnceToken;
            if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
            {
              if (v93 != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
LABEL_93:
              v94 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v99 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v100 = (void *)MEMORY[0x1E0CB3978];
                v101 = v99;
                v102 = v94;
                objc_msgSend(v100, "callStackSymbols");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "componentsJoinedByString:", CFSTR("\n"));
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v116;
                v139 = v99;
                v140 = 2114;
                v141 = v104;
                _os_log_error_impl(&dword_1A6553000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

                v59 = log;
                v88 = v126;

              }
LABEL_99:
              _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _storageFromPoolWithSize:format:exactMatch:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 206, CFSTR("volatileCount count should not be negative"), v95, v96, v97, v98, v116);
LABEL_100:
              -[NUStoragePoolStats setVolatileBytes:](v119->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](v119->_stats, "volatileBytes") - objc_msgSend(v58, "sizeInBytes"));
              -[NUStoragePoolStats setReusedVolatileCount:](v119->_stats, "setReusedVolatileCount:", -[NUStoragePoolStats reusedVolatileCount](v119->_stats, "reusedVolatileCount") + 1);
              goto LABEL_101;
            }
            if (v93 != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          }
          else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            goto LABEL_93;
          }
          v105 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v111 = (void *)MEMORY[0x1E0CB3978];
            v112 = v105;
            objc_msgSend(v111, "callStackSymbols");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "componentsJoinedByString:", CFSTR("\n"));
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v139 = v114;
            _os_log_error_impl(&dword_1A6553000, v112, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
          goto LABEL_99;
        }
      }
LABEL_81:
      if (v60 != ++v62)
        continue;
      break;
    }
    v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
    if (v60)
      continue;
    break;
  }
  v58 = 0;
  self = v119;
  v59 = log;
  v60 = v125;
  v88 = v126;
LABEL_101:

  if (-[NSObject count](v59, "count"))
    -[NSMutableArray removeObjectsAtIndexes:](self->_volatileList, "removeObjectsAtIndexes:", v59);
  if (v88)
  {
    -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") - v88);
    -[NUStoragePoolStats setVolatileBytes:](self->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](self->_stats, "volatileBytes") - v60);
    -[NUStoragePoolStats setPurgedCount:](self->_stats, "setPurgedCount:", -[NUStoragePoolStats purgedCount](self->_stats, "purgedCount") + v88);
    -[NUStoragePoolStats setPurgedBytes:](self->_stats, "setPurgedBytes:", -[NUStoragePoolStats purgedBytes](self->_stats, "purgedBytes") + v60);
  }

LABEL_106:
  return v58;
}

- (void)_returnStorage:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "invalidate");
  if (objc_msgSend(v4, "isPurgeable"))
  {
    if (objc_msgSend(v4, "isPurged"))
      -[NUPurgeableStoragePool _returnPurgedStorage:](self, "_returnPurgedStorage:", v4);
    else
      -[NUPurgeableStoragePool _returnVolatileStorage:](self, "_returnVolatileStorage:", v4);
  }
  else
  {
    -[NUPurgeableStoragePool _returnNonPurgeableStorage:](self, "_returnNonPurgeableStorage:", v4);
  }

}

- (void)returnStorage:(id)a3
{
  id v4;
  NSObject *stateQueue;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD block[4];
  id v24;
  NUPurgeableStoragePool *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((Class)objc_opt_class() != self->_storageClass)
  {
    NUAssertLogger_1586();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "storage.class == _storageClass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1586();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v13;
        v28 = 2114;
        v29 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool returnStorage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 267, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"storage.class == _storageClass");
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NUPurgeableStoragePool_returnStorage___block_invoke;
  block[3] = &unk_1E5063FB8;
  v24 = v4;
  v25 = self;
  v22 = v4;
  dispatch_sync(stateQueue, block);

}

- (void)_enforcePurgableLimit
{
  NSMutableArray *i;
  void *v4;

  for (i = self->_volatileList;
        (unint64_t)-[NSMutableArray count](i, "count") > self->_purgeableLimit;
        i = self->_volatileList)
  {
    -[NSMutableArray firstObject](self->_volatileList, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_volatileList, "removeObjectAtIndex:", 0);
    -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") - 1);
    -[NUStoragePoolStats setVolatileBytes:](self->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](self->_stats, "volatileBytes") - objc_msgSend(v4, "sizeInBytes"));
    -[NUStoragePoolStats setDiscardedCount:](self->_stats, "setDiscardedCount:", -[NUStoragePoolStats discardedCount](self->_stats, "discardedCount") + 1);

  }
}

- (void)_returnVolatileStorage:(id)a3
{
  NSMutableArray *volatileList;
  id v5;
  uint64_t v6;

  volatileList = self->_volatileList;
  v5 = a3;
  -[NSMutableArray addObject:](volatileList, "addObject:", v5);
  v6 = objc_msgSend(v5, "sizeInBytes");

  -[NUStoragePoolStats setUsedCount:](self->_stats, "setUsedCount:", -[NUStoragePoolStats usedCount](self->_stats, "usedCount") - 1);
  -[NUStoragePoolStats setUsedBytes:](self->_stats, "setUsedBytes:", -[NUStoragePoolStats usedBytes](self->_stats, "usedBytes") - v6);
  -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") + 1);
  -[NUStoragePoolStats setVolatileBytes:](self->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](self->_stats, "volatileBytes") + v6);
  -[NUPurgeableStoragePool _enforcePurgableLimit](self, "_enforcePurgableLimit");
}

- (void)_returnPurgedStorage:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "sizeInBytes");
  -[NUStoragePoolStats setUsedCount:](self->_stats, "setUsedCount:", -[NUStoragePoolStats usedCount](self->_stats, "usedCount") - 1);
  -[NUStoragePoolStats setUsedBytes:](self->_stats, "setUsedBytes:", -[NUStoragePoolStats usedBytes](self->_stats, "usedBytes") - v4);
  -[NUStoragePoolStats setPurgedCount:](self->_stats, "setPurgedCount:", -[NUStoragePoolStats purgedCount](self->_stats, "purgedCount") + 1);
  -[NUStoragePoolStats setPurgedBytes:](self->_stats, "setPurgedBytes:", -[NUStoragePoolStats purgedBytes](self->_stats, "purgedBytes") + v4);
}

- (void)_returnNonPurgeableStorage:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  -[NSMutableArray addObject:](self->_nonPurgeableList, "addObject:");
  if ((unint64_t)-[NSMutableArray count](self->_nonPurgeableList, "count") > self->_nonPurgeableLimit)
    -[NUPurgeableStoragePool _migrateOldestNonPurgeableStorageToPurgeable](self, "_migrateOldestNonPurgeableStorageToPurgeable");
  v4 = objc_msgSend(v5, "sizeInBytes");
  -[NUStoragePoolStats setUsedCount:](self->_stats, "setUsedCount:", -[NUStoragePoolStats usedCount](self->_stats, "usedCount") - 1);
  -[NUStoragePoolStats setUsedBytes:](self->_stats, "setUsedBytes:", -[NUStoragePoolStats usedBytes](self->_stats, "usedBytes") - v4);
  -[NUStoragePoolStats setNonPurgeableCount:](self->_stats, "setNonPurgeableCount:", -[NUStoragePoolStats nonPurgeableCount](self->_stats, "nonPurgeableCount") + 1);
  -[NUStoragePoolStats setNonPurgeableBytes:](self->_stats, "setNonPurgeableBytes:", -[NUStoragePoolStats nonPurgeableBytes](self->_stats, "nonPurgeableBytes") + v4);
  -[NUPurgeableStoragePool _resetNonPurgeableStorageMigrationTimer](self, "_resetNonPurgeableStorageMigrationTimer");

}

- (NUStoragePoolStats)stats
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1600;
  v10 = __Block_byref_object_dispose__1601;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__NUPurgeableStoragePool_stats__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NUStoragePoolStats *)v3;
}

- (void)purge:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[NUPurgeableStoragePool migrateAllNonPurgeableStorage](self, "migrateAllNonPurgeableStorage");
  if (v3)
    v5 = -[NUPurgeableStoragePool reapVolatile](self, "reapVolatile");
}

- (id)reapPurged
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1600;
  v10 = __Block_byref_object_dispose__1601;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NUPurgeableStoragePool_reapPurged__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)reapVolatile
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1600;
  v10 = __Block_byref_object_dispose__1601;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__NUPurgeableStoragePool_reapVolatile__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_reapPurged
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v3 = 0;
  if (-[NSMutableArray count](self->_volatileList, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_volatileList, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isPurged"))
      {
        v3 += objc_msgSend(v5, "sizeInBytes");
        objc_msgSend(v6, "addIndex:", v4);
      }

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_volatileList, "count"));
  }
  if (objc_msgSend(v6, "count"))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_volatileList, "removeObjectsAtIndexes:", v6);
    -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") - objc_msgSend(v6, "count"));
    -[NUStoragePoolStats setVolatileBytes:](self->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](self->_stats, "volatileBytes") - v3);
    -[NUStoragePoolStats setPurgedCount:](self->_stats, "setPurgedCount:", -[NUStoragePoolStats purgedCount](self->_stats, "purgedCount") + objc_msgSend(v6, "count"));
    -[NUStoragePoolStats setPurgedBytes:](self->_stats, "setPurgedBytes:", -[NUStoragePoolStats purgedBytes](self->_stats, "purgedBytes") + v3);
  }

}

- (void)_reapVolatile
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  __objc2_class **p_superclass;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *specific;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v4 = 0;
  if (-[NSMutableArray count](self->_volatileList, "count"))
  {
    v5 = 0;
    p_superclass = &OBJC_METACLASS___NUSetting.superclass;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_volatileList, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isInUse"))
      {
        if (p_superclass[401] != (__objc2_class *)-1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
        v8 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = v8;
          objc_msgSend(v9, "stringWithFormat:", CFSTR("Volatile storage is still in use"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v11;
          _os_log_impl(&dword_1A6553000, v10, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v12 = (uint64_t)p_superclass[401];
        }
        else
        {
          v12 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v12 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v13 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v19 = (void *)MEMORY[0x1E0CB3978];
            v29 = specific;
            v20 = v13;
            objc_msgSend(v19, "callStackSymbols");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = specific;
            v32 = 2114;
            v33 = v22;
            _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            p_superclass = (__objc2_class **)(&OBJC_METACLASS___NUSetting + 8);
          }
        }
        else
        {
          if (v12 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_124_1598);
          v23 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v24 = (void *)MEMORY[0x1E0CB3978];
            v25 = v23;
            objc_msgSend(v24, "callStackSymbols");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v31 = v27;
            _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUPurgeableStoragePool _reapVolatile]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 488, CFSTR("Volatile storage is still in use"), v14, v15, v16, v17, v28);
      }
      if ((objc_msgSend(v7, "isInUse") & 1) == 0)
      {
        v4 += objc_msgSend(v7, "sizeInBytes");
        objc_msgSend(v3, "addIndex:", v5);
      }

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_volatileList, "count"));
  }
  if (objc_msgSend(v3, "count"))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_volatileList, "removeObjectsAtIndexes:", v3);
    -[NUStoragePoolStats setVolatileCount:](self->_stats, "setVolatileCount:", -[NUStoragePoolStats volatileCount](self->_stats, "volatileCount") - objc_msgSend(v3, "count"));
    -[NUStoragePoolStats setVolatileBytes:](self->_stats, "setVolatileBytes:", -[NUStoragePoolStats volatileBytes](self->_stats, "volatileBytes") - v4);
    -[NUStoragePoolStats setPurgedCount:](self->_stats, "setPurgedCount:", -[NUStoragePoolStats purgedCount](self->_stats, "purgedCount") + objc_msgSend(v3, "count"));
    -[NUStoragePoolStats setPurgedBytes:](self->_stats, "setPurgedBytes:", -[NUStoragePoolStats purgedBytes](self->_stats, "purgedBytes") + v4);
  }

}

- (void)_resetNonPurgeableStorageMigrationTimer
{
  ++self->_nonPurgeableActivityCounter;
  if (!self->_migrationTimerScheduled)
    -[NUPurgeableStoragePool _scheduleMigrationTimer](self, "_scheduleMigrationTimer");
}

- (void)_scheduleMigrationTimer
{
  unint64_t nonPurgeableActivityCounter;
  dispatch_time_t v4;
  NSObject *stateQueue;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[6];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_migrationTimerScheduled)
  {
    NUAssertLogger_1586();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("migration timer already scheduled!"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1586();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool _scheduleMigrationTimer]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 528, CFSTR("migration timer already scheduled!"), v18, v19, v20, v21, v22[0]);
  }
  nonPurgeableActivityCounter = self->_nonPurgeableActivityCounter;
  v4 = NUDispatchSeconds(self->_migrationDelay);
  stateQueue = self->_stateQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__49__NUPurgeableStoragePool__scheduleMigrationTimer__block_invoke;
  v22[3] = (uint64_t)&unk_1E50631C0;
  v22[4] = (uint64_t)self;
  v22[5] = nonPurgeableActivityCounter;
  dispatch_after(v4, stateQueue, v22);
  self->_migrationTimerScheduled = 1;
}

- (void)_migrationTimer:(unint64_t)a3
{
  NSObject *migrationQueue;
  _QWORD v6[6];

  self->_migrationTimerScheduled = 0;
  if (self->_nonPurgeableActivityCounter == a3)
  {
    -[NUPurgeableStoragePool _reclaimSharedStorages](self, "_reclaimSharedStorages");
    migrationQueue = self->_migrationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__NUPurgeableStoragePool__migrationTimer___block_invoke;
    v6[3] = &unk_1E50631C0;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(migrationQueue, v6);
  }
  else
  {
    -[NUPurgeableStoragePool _scheduleMigrationTimer](self, "_scheduleMigrationTimer");
  }
}

- (void)migrateAllNonPurgeableStorage
{
  NSObject *stateQueue;
  uint64_t v4;
  NSObject *migrationQueue;
  _QWORD v6[6];
  _QWORD block[6];
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  stateQueue = self->_stateQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke;
  block[3] = &unk_1E5063FE0;
  block[4] = self;
  block[5] = v8;
  dispatch_sync(stateQueue, block);
  migrationQueue = self->_migrationQueue;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke_2;
  v6[3] = &unk_1E5063FE0;
  v6[4] = self;
  v6[5] = v8;
  dispatch_sync(migrationQueue, v6);
  _Block_object_dispose(v8, 8);
}

- (void)_migrateAllNonPurgeableStorageIfNoRecentActivity:(unint64_t)a3
{
  void *v5;
  id *v6;
  uint64_t v7;
  NSObject *stateQueue;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = 0;
  v6 = &v15;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1600;
  v14 = __Block_byref_object_dispose__1601;
  v15 = 0;
  v7 = MEMORY[0x1E0C809B0];
  do
  {
    *v6 = 0;

    stateQueue = self->_stateQueue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __75__NUPurgeableStoragePool__migrateAllNonPurgeableStorageIfNoRecentActivity___block_invoke;
    block[3] = &unk_1E5063750;
    block[5] = &v10;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(stateQueue, block);
    if (v11[5])
      -[NUPurgeableStoragePool _migrateStorageToPurgeable:](self, "_migrateStorageToPurgeable:");
    v6 = (id *)(v11 + 5);
    v5 = (void *)v11[5];
  }
  while (v5);
  _Block_object_dispose(&v10, 8);

}

- (void)_migrateOldestNonPurgeableStorageToPurgeable
{
  void *v3;
  void *v4;
  NSObject *migrationQueue;
  _QWORD v6[5];
  id v7;

  -[NUPurgeableStoragePool _popOldestNonPurgeableStorage](self, "_popOldestNonPurgeableStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    migrationQueue = self->_migrationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__NUPurgeableStoragePool__migrateOldestNonPurgeableStorageToPurgeable__block_invoke;
    v6[3] = &unk_1E5063FB8;
    v6[4] = self;
    v7 = v3;
    dispatch_async(migrationQueue, v6);

  }
}

- (id)_popOldestNonPurgeableStorage
{
  void *v3;

  if (-[NSMutableArray count](self->_nonPurgeableList, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_nonPurgeableList, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_nonPurgeableList, "removeObjectAtIndex:", 0);
    -[NUStoragePoolStats setNonPurgeableCount:](self->_stats, "setNonPurgeableCount:", -[NUStoragePoolStats nonPurgeableCount](self->_stats, "nonPurgeableCount") - 1);
    -[NUStoragePoolStats setNonPurgeableBytes:](self->_stats, "setNonPurgeableBytes:", -[NUStoragePoolStats nonPurgeableBytes](self->_stats, "nonPurgeableBytes") - objc_msgSend(v3, "sizeInBytes"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_migrateStorageToPurgeable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *stateQueue;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD block[5];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_1586();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "storage != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1586();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2114;
        v31 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStoragePool _migrateStorageToPurgeable:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPurgeableStoragePool.m", 639, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"storage != nil");
  }
  v5 = v4;
  objc_msgSend(v4, "makePurgeable");
  v6 = objc_msgSend(v5, "sizeInBytes");
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NUPurgeableStoragePool__migrateStorageToPurgeable___block_invoke;
  block[3] = &unk_1E5063C48;
  block[4] = self;
  v26 = v5;
  v27 = v6;
  v24 = v5;
  dispatch_sync(stateQueue, block);

}

- (void)waitForMigration
{
  dispatch_sync((dispatch_queue_t)self->_migrationQueue, &__block_literal_global_32);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;

  -[NUPurgeableStoragePool reapPurged](self, "reapPurged");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = -[NUPurgeableStoragePool storageClass](self, "storageClass");
  objc_msgSend(v3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%@>:%p stats:\n%@"), v5, v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)nonPurgeableLimit
{
  return self->_nonPurgeableLimit;
}

- (int64_t)purgeableLimit
{
  return self->_purgeableLimit;
}

- (double)migrationDelay
{
  return self->_migrationDelay;
}

- (NSMutableArray)volatileList
{
  return self->_volatileList;
}

- (NSMutableArray)nonPurgeableList
{
  return self->_nonPurgeableList;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (Class)storageClass
{
  return self->_storageClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageClass, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_nonPurgeableList, 0);
  objc_storeStrong((id *)&self->_volatileList, 0);
  objc_storeStrong((id *)&self->_sharedStoragesToBeReclaimedList, 0);
  objc_storeStrong((id *)&self->_stats, 0);
}

uint64_t __53__NUPurgeableStoragePool__migrateStorageToPurgeable___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setVolatileCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "volatileCount") + 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setVolatileBytes:", *(_QWORD *)(a1 + 48) + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "volatileBytes"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMigrationCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "migrationCount") + 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMigrationBytes:", *(_QWORD *)(a1 + 48) + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "migrationBytes"));
  return objc_msgSend(*(id *)(a1 + 32), "_enforcePurgableLimit");
}

uint64_t __70__NUPurgeableStoragePool__migrateOldestNonPurgeableStorageToPurgeable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateStorageToPurgeable:", *(_QWORD *)(a1 + 40));
}

void __75__NUPurgeableStoragePool__migrateAllNonPurgeableStorageIfNoRecentActivity___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[6];
  v3 = (_QWORD *)a1[4];
  if (v2 == v3[2])
  {
    objc_msgSend(v3, "_popOldestNonPurgeableStorage");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __55__NUPurgeableStoragePool_migrateAllNonPurgeableStorage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateAllNonPurgeableStorageIfNoRecentActivity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __42__NUPurgeableStoragePool__migrationTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateAllNonPurgeableStorageIfNoRecentActivity:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__NUPurgeableStoragePool__scheduleMigrationTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrationTimer:", *(_QWORD *)(a1 + 40));
}

void __38__NUPurgeableStoragePool_reapVolatile__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_reapVolatile");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__NUPurgeableStoragePool_reapPurged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_reapPurged");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __31__NUPurgeableStoragePool_stats__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40__NUPurgeableStoragePool_returnStorage___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  id *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "decrementUseCount");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", *(_QWORD *)(a1 + 32));
  v4 = *(id **)(a1 + 40);
  if (v3)
  {
    if (v2)
    {
      objc_msgSend(v4[4], "removeObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_reclaimSharedStorages");
      return objc_msgSend(*(id *)(a1 + 40), "_returnStorage:", *(_QWORD *)(a1 + 32));
    }
    return objc_msgSend(v4, "_resetNonPurgeableStorageMigrationTimer");
  }
  else
  {
    objc_msgSend(v4, "_reclaimSharedStorages");
    if (v2)
      return objc_msgSend(*(id *)(a1 + 40), "_returnStorage:", *(_QWORD *)(a1 + 32));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __63__NUPurgeableStoragePool_newStorageWithSize_format_exactMatch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_storageFromPoolWithSize:format:exactMatch:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_allocateStorageWithSize:format:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v5, "incrementUseCount");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setUsedCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "usedCount") + 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setUsedBytes:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "usedBytes")+ objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sizeInBytes"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRequestCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestCount") + 1);
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_1665);
}

+ (void)reapAllPurged
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id)s_pools;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)s_pools;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (v7)
          v8 = (id)objc_msgSend(v7, "reapPurged", (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

+ (void)reapAllVolatile
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id)s_pools;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)s_pools;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (v7)
          v8 = (id)objc_msgSend(v7, "reapVolatile", (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

+ (void)purge:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = (id)s_pools;
  objc_sync_enter(v4);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)s_pools;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "purge:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

void __36__NUPurgeableStoragePool_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)s_pools;
  s_pools = v0;

}

@end
