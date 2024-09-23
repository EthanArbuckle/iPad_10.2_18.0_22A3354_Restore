@implementation NUPurgeableStorageFactory

- (NUPurgeableStorageFactory)initWithStorageClass:(Class)a3
{
  return -[NUPurgeableStorageFactory initWithStorageClass:storagePool:](self, "initWithStorageClass:storagePool:", a3, 0);
}

- (NUPurgeableStorageFactory)initWithStoragePool:(id)a3
{
  id v4;
  NUPurgeableStorageFactory *v5;

  v4 = a3;
  v5 = -[NUPurgeableStorageFactory initWithStorageClass:storagePool:](self, "initWithStorageClass:storagePool:", objc_msgSend(v4, "storageClass"), v4);

  return v5;
}

- (NUPurgeableStorageFactory)initWithStorageClass:(Class)a3 storagePool:(id)a4
{
  NUPurgeableStoragePool *v6;
  NUPurgeableStorageFactory *v7;
  NUPurgeableStoragePool *storagePool;
  objc_super v10;

  v6 = (NUPurgeableStoragePool *)a4;
  v10.receiver = self;
  v10.super_class = (Class)NUPurgeableStorageFactory;
  v7 = -[NUPurgeableStorageFactory init](&v10, sel_init);
  storagePool = v7->_storagePool;
  v7->_storageClass = a3;
  v7->_storagePool = v6;

  return v7;
}

- (void)returnStorage:(id)a3
{
  -[NUPurgeableStoragePool returnStorage:](self->_storagePool, "returnStorage:", a3);
}

- (id)newStorageWithSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  NUPurgeableStoragePool *storagePool;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  var1 = a3.var1;
  var0 = a3.var0;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    NUAssertLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2114;
        v29 = v21;
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
      v27 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStorageFactory newStorageWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 241, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"pixelFormat");
  }
  storagePool = self->_storagePool;
  if (storagePool)
    v9 = -[NUPurgeableStoragePool newStorageWithSize:format:](storagePool, "newStorageWithSize:format:", var0, var1, v7);
  else
    v9 = objc_msgSend(objc_alloc(self->_storageClass), "initWithSize:format:", var0, var1, v7);
  v10 = (void *)v9;

  return v10;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPurgeableStoragePool debugDescription](self->_storagePool, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: 0x%p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storagePool, 0);
}

@end
