@implementation NUBufferStorage

- (NUBufferStorage)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  NUBufferStorage *v9;
  uint64_t v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  var1 = a3.var1;
  var0 = a3.var0;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    NUAssertLogger_8104();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelFormat != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        v48 = 2114;
        v49 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 51, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"pixelFormat != nil");
  }
  v8 = v7;
  v45.receiver = self;
  v45.super_class = (Class)NUBufferStorage;
  v9 = -[_NUAbstractStorage init](&v45, sel_init);
  v10 = objc_msgSend(v8, "alignedRowBytesForWidth:", var0);
  v9->_rowBytes = v10;
  v9->_length = var1 * v10;
  if ((unsigned __int128)(var1 * (__int128)v10) >> 64 != (var1 * v10) >> 63)
  {
    NUAssertLogger_8104();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("integer overflow detected"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 59, CFSTR("integer overflow detected"), v40, v41, v42, v43, v44);
  }
  v9->_bytes = -[NUBufferStorage _allocateMemory:](v9, "_allocateMemory:");
  v9->_purgeLevel = 1;
  atomic_store(0, (unsigned int *)&v9->_useCount);
  -[_NUAbstractStorage _resetSize:format:](v9, "_resetSize:format:", var0, var1, v8);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NUBufferStorage _deallocateMemory](self, "_deallocateMemory");
  v3.receiver = self;
  v3.super_class = (Class)NUBufferStorage;
  -[NUBufferStorage dealloc](&v3, sel_dealloc);
}

- (int64_t)sizeInBytes
{
  return (self->_length + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
}

- (void)_allocateMemory:(int64_t)a3
{
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  vm_address_t address;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  address = 0;
  v4 = vm_allocate(*MEMORY[0x1E0C83DA0], &address, (a3 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], -117440509);
  if ((_DWORD)v4)
  {
    v6 = v4;
    NUAssertLogger_8104();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failed to vm_allocate: %d"), self, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage _allocateMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 88, CFSTR("%@ failed to vm_allocate: %d"), v19, v20, v21, v22, (uint64_t)self);
  }
  return (void *)address;
}

- (void)_deallocateMemory
{
  MEMORY[0x1A85C1834](*MEMORY[0x1E0C83DA0], self->_bytes, (self->_length + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8]);
  self->_bytes = 0;
}

- (BOOL)isPurged
{
  int v4;

  v4 = 0;
  return !-[NUBufferStorage _fetchPurgeState:](self, "_fetchPurgeState:", &v4) && v4 == 2;
}

- (BOOL)isPurgeable
{
  return self->_purgeable;
}

- (BOOL)isShared
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_useCount);
  return v2 > 1;
}

- (BOOL)isInUse
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_useCount);
  return v2 > 0;
}

- (void)incrementUseCount
{
  int *p_useCount;
  unsigned int v3;

  p_useCount = &self->_useCount;
  do
    v3 = __ldaxr((unsigned int *)p_useCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_useCount));
}

- (BOOL)decrementUseCount
{
  int *p_useCount;
  int v3;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[12];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_useCount = &self->_useCount;
  do
    v3 = __ldaxr((unsigned int *)p_useCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_useCount));
  if (v3 <= 0)
  {
    NUAssertLogger_8104();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("over released use count on buffer storage"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 138543362;
      *(_QWORD *)&v21[4] = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v21, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E0CB3978];
        v14 = v12;
        objc_msgSend(v13, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v21 = 138543618;
        *(_QWORD *)&v21[4] = v12;
        v22 = 2114;
        v23 = v16;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v21, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 138543362;
      *(_QWORD *)&v21[4] = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v21, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferStorage decrementUseCount]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 126, CFSTR("over released use count on buffer storage"), v17, v18, v19, v20, *(uint64_t *)v21);
  }
  return v3 == 1;
}

- (int)useCount
{
  return atomic_load((unsigned int *)&self->_useCount);
}

- (int)_fetchPurgeState:(int *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *specific;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1A85C1840](*MEMORY[0x1E0C83DA0], self->_bytes, 1, a3);
  if ((_DWORD)v4)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
    v5 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ failed to read vm_purgable_control: %d"), self, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_1A6553000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v9 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v9 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
LABEL_9:
        v10 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = specific;
          v18 = v10;
          objc_msgSend(v16, "callStackSymbols");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = specific;
          v28 = 2114;
          v29 = v20;
          _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v9 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v21 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E0CB3978];
      v18 = v21;
      objc_msgSend(v23, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v25;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage _fetchPurgeState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 138, CFSTR("%@ failed to read vm_purgable_control: %d"), v11, v12, v13, v14, (uint64_t)self);
  }
  return v4;
}

- (id)_purgeStateDescription
{
  unsigned int v3;

  if (!self->_purgeable)
    return CFSTR("Not Purgeable");
  v3 = 0;
  if (-[NUBufferStorage _fetchPurgeState:](self, "_fetchPurgeState:", &v3))
    return 0;
  if (v3 > 3)
    return CFSTR("Purgeable (Unknown)");
  return off_1E50617D0[v3];
}

- (int)_purgeLevelToOSValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 33;
  else
    return dword_1A671A4F0[a3 - 1];
}

- (int64_t)purgeLevel
{
  return self->_purgeLevel;
}

- (void)adjustPurgeLevel:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_purgeLevel != a3)
  {
    self->_purgeLevel = a3;
    if (self->_purgeable)
    {
      v26 = -[NUBufferStorage _purgeLevelToOSValue:](self, "_purgeLevelToOSValue:");
      v4 = MEMORY[0x1A85C1840](*MEMORY[0x1E0C83DA0], self->_bytes, 0, &v26);
      if ((_DWORD)v4)
      {
        v5 = v4;
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
        v6 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = v6;
          objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ failed to reset vm_purgable_control: %d"), self, v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v9;
          _os_log_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v10 = _NULogOnceToken;
          if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            if (v10 != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
LABEL_11:
            v11 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            {
              specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v17 = (void *)MEMORY[0x1E0CB3978];
              v18 = specific;
              v19 = v11;
              objc_msgSend(v17, "callStackSymbols");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v28 = specific;
              v29 = 2114;
              v30 = v21;
              _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_19:
              goto LABEL_16;
            }
            goto LABEL_16;
          }
          if (v10 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
        }
        else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          goto LABEL_11;
        }
        v22 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)MEMORY[0x1E0CB3978];
          v19 = v22;
          objc_msgSend(v23, "callStackSymbols");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v25;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          goto LABEL_19;
        }
LABEL_16:
        _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage adjustPurgeLevel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 216, CFSTR("%@ failed to reset vm_purgable_control: %d"), v12, v13, v14, v15, (uint64_t)self);
      }
    }
  }
}

- (void)makePurgeable
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *specific;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_purgeable)
  {
    self->_purgeable = 1;
    v25 = -[NUBufferStorage _purgeLevelToOSValue:](self, "_purgeLevelToOSValue:", self->_purgeLevel);
    v3 = MEMORY[0x1A85C1840](*MEMORY[0x1E0C83DA0], self->_bytes, 0, &v25);
    if ((_DWORD)v3)
    {
      v4 = v3;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
      v5 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = v5;
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ failed to set purgeable: %d"), self, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v8;
        _os_log_impl(&dword_1A6553000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        v9 = _NULogOnceToken;
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v9 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
LABEL_10:
          v10 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v16 = (void *)MEMORY[0x1E0CB3978];
            v17 = specific;
            v18 = v10;
            objc_msgSend(v16, "callStackSymbols");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = specific;
            v28 = 2114;
            v29 = v20;
            _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_18:
            goto LABEL_15;
          }
          goto LABEL_15;
        }
        if (v9 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
      }
      else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        goto LABEL_10;
      }
      v21 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)MEMORY[0x1E0CB3978];
        v18 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v24;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        goto LABEL_18;
      }
LABEL_15:
      _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage makePurgeable]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 233, CFSTR("%@ failed to set purgeable: %d"), v11, v12, v13, v14, (uint64_t)self);
    }
  }
}

- (BOOL)makeNonPurgeable
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BOOL result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *specific;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_purgeable)
    return 1;
  v28 = 0;
  v3 = MEMORY[0x1A85C1840](*MEMORY[0x1E0C83DA0], self->_bytes, 0, &v28);
  if (v28 == 2 && (_DWORD)v3 == 0)
  {
    result = 0;
    self->_purgeable = 0;
    return result;
  }
  v5 = v3;
  if (!(_DWORD)v3)
  {
    self->_purgeable = 0;
    return 1;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
  v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v6;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ failed to make non purgeable: %d"), self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
LABEL_17:
      v12 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = specific;
        v20 = v12;
        objc_msgSend(v18, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = specific;
        v31 = 2114;
        v32 = v22;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_24:
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
  }
  else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    goto LABEL_17;
  }
  v23 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)MEMORY[0x1E0CB3978];
    v20 = v23;
    objc_msgSend(v25, "callStackSymbols");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v27;
    _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_24;
  }
LABEL_22:
  _NUAssertContinueHandler((uint64_t)"-[NUBufferStorage makeNonPurgeable]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 257, CFSTR("%@ failed to make non purgeable: %d"), v13, v14, v15, v16, (uint64_t)self);
  -[NUBufferStorage _deallocateMemory](self, "_deallocateMemory");
  v24 = -[NUBufferStorage _allocateMemory:](self, "_allocateMemory:", self->_length);
  result = 0;
  self->_bytes = v24;
  return result;
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  void (**v6)(id, NUBufferAdapter *);
  NUBufferAdapter *v7;

  v6 = (void (**)(id, NUBufferAdapter *))a4;
  -[_NUAbstractStorage assertIsValidInRegion:](self, "assertIsValidInRegion:", a3);
  v7 = -[NUBufferAdapter initWithBuffer:]([NUBufferAdapter alloc], "initWithBuffer:", self);
  v6[2](v6, v7);

  -[NUBufferAdapter invalidate](v7, "invalidate");
  return 1;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  void (**v6)(id, NUMutableBufferAdapter *);
  id v7;
  NUMutableBufferAdapter *v8;

  v6 = (void (**)(id, NUMutableBufferAdapter *))a4;
  v7 = a3;
  v8 = -[NUMutableBufferAdapter initWithMutableBuffer:]([NUMutableBufferAdapter alloc], "initWithMutableBuffer:", self);
  v6[2](v6, v8);

  -[NUBufferAdapter invalidate](v8, "invalidate");
  -[_NUAbstractStorage validateRegion:](self, "validateRegion:", v7);

  return 1;
}

- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _BYTE v30[12];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
  v10 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v10;
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Not implemented"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v30 = 138543362;
    *(_QWORD *)&v30[4] = v13;
    _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v30, 0xCu);

    v14 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v14 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
      goto LABEL_8;
    }
    if (v14 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8059);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v15 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB3978];
    v21 = v15;
    objc_msgSend(v20, "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v30 = 138543362;
    *(_QWORD *)&v30[4] = v23;
    _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v30, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E0CB3978];
  v27 = specific;
  v21 = v24;
  objc_msgSend(v26, "callStackSymbols");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v30 = 138543618;
  *(_QWORD *)&v30[4] = specific;
  v31 = 2114;
  v32 = v29;
  _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v30, 0x16u);

LABEL_14:
LABEL_15:
  _NUAssertFailHandler((uint64_t)"-[NUBufferStorage useAsCIImageWithOptions:renderer:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 290, CFSTR("Not implemented"), v16, v17, v18, v19, *(uint64_t *)v30);
}

- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];

  v5 = a4;
  v13[0] = 0;
  v13[1] = 0;
  v13[2] = -[_NUAbstractStorage size](self, "size");
  v13[3] = v6;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__NUBufferStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke;
  v11[3] = &unk_1E5062CC8;
  v12 = v5;
  v8 = v5;
  v9 = -[NUBufferStorage writeBufferInRegion:block:](self, "writeBufferInRegion:block:", v7, v11);

  return v9;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (id)newRenderDestination
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C9DDE8]);
  v4 = -[NUBufferStorage mutableBytes](self, "mutableBytes");
  v5 = -[_NUAbstractStorage size](self, "size");
  -[_NUAbstractStorage size](self, "size");
  v7 = v6;
  v8 = -[NUBufferStorage rowBytes](self, "rowBytes");
  -[_NUAbstractStorage format](self, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithBitmapData:width:height:bytesPerRow:format:", v4, v5, v7, v8, objc_msgSend(v9, "CIFormat"));

  objc_msgSend(v10, "setLabel:", CFSTR("NUBufferStorage-new"));
  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *bytes;
  int64_t length;
  int64_t purgeLevel;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  bytes = self->_bytes;
  length = self->_length;
  purgeLevel = self->_purgeLevel;
  -[NUBufferStorage _purgeStateDescription](self, "_purgeStateDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> bytes=%p length=%ld priority=%ld %@"), v4, self, bytes, length, purgeLevel, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (const)bytes
{
  return self->_bytes;
}

- (int64_t)rowBytes
{
  return self->_rowBytes;
}

void __62__NUBufferStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "newRenderDestination");
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
