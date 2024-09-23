@implementation NUFactory

- (void)start
{
  NUSchemaRegistry *v3;
  NUSchemaRegistry *schemaRegistry;
  NURenderPipelineRegistry *v5;
  NURenderPipelineRegistry *renderPipelineRegistry;
  void *v7;
  __CFString *v8;
  NSString *defaultNamespace;
  NUScheduler *v10;
  NUScheduler *scheduler;
  NUPurgeableStoragePool *v12;
  NUPurgeableStoragePool *bufferStoragePool;
  NUPurgeableStoragePool *v14;
  NUPurgeableStoragePool *surfaceStoragePool;
  _BOOL4 v16;
  NUPurgeableStorageFactory *v17;
  NUStorageFactory *v18;
  NUStorageFactory *bufferFactory;
  _BOOL4 v20;
  NUPurgeableStorageFactory *v21;
  NUStorageFactory *v22;
  NUStorageFactory *surfaceFactory;
  NURenderNodeCache *v24;
  NURenderNodeCache *renderNodeCache;
  NURenderResultCache *v26;
  NURenderResultCache *renderResultCache;
  NUPlatform_iOS *v28;
  NUPlatform *platform;
  NUCacheNodeRegistry *v30;
  NUCacheNodeRegistry *cacheNodeRegistry;
  VNSession *v32;
  VNSession *visionSession;
  NURenderResourcePool *v34;
  NURenderResourcePool *renderResourcePool;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!self->_schemaRegistry)
  {
    v3 = objc_alloc_init(NUSchemaRegistry);
    schemaRegistry = self->_schemaRegistry;
    self->_schemaRegistry = v3;

  }
  if (!self->_renderPipelineRegistry)
  {
    v5 = objc_alloc_init(NURenderPipelineRegistry);
    renderPipelineRegistry = self->_renderPipelineRegistry;
    self->_renderPipelineRegistry = v5;

  }
  if (!self->_defaultNamespace)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if (NSClassFromString(CFSTR("XCTestProbe")))
        v8 = CFSTR("com.apple.test");
      else
        v8 = CFSTR("com.apple.Photos");
    }
    defaultNamespace = self->_defaultNamespace;
    self->_defaultNamespace = &v8->isa;

  }
  if (!self->_scheduler)
  {
    v10 = -[NUScheduler initWithName:]([NUScheduler alloc], "initWithName:", CFSTR("shared"));
    scheduler = self->_scheduler;
    self->_scheduler = v10;

  }
  if (!self->_bufferStoragePool)
  {
    v12 = -[NUPurgeableStoragePool initWithStorageClass:]([NUPurgeableStoragePool alloc], "initWithStorageClass:", objc_opt_class());
    bufferStoragePool = self->_bufferStoragePool;
    self->_bufferStoragePool = v12;

  }
  if (!self->_surfaceStoragePool)
  {
    v14 = -[NUPurgeableStoragePool initWithStorageClass:]([NUPurgeableStoragePool alloc], "initWithStorageClass:", objc_opt_class());
    surfaceStoragePool = self->_surfaceStoragePool;
    self->_surfaceStoragePool = v14;

  }
  if (!self->_bufferFactory)
  {
    v16 = +[NUGlobalSettings bufferStorageFactoryUsePool](NUGlobalSettings, "bufferStorageFactoryUsePool");
    v17 = [NUPurgeableStorageFactory alloc];
    if (v16)
      v18 = -[NUPurgeableStorageFactory initWithStoragePool:](v17, "initWithStoragePool:", self->_bufferStoragePool);
    else
      v18 = -[NUPurgeableStorageFactory initWithStorageClass:](v17, "initWithStorageClass:", objc_opt_class());
    bufferFactory = self->_bufferFactory;
    self->_bufferFactory = v18;

  }
  if (!self->_surfaceFactory)
  {
    v20 = +[NUGlobalSettings surfaceStorageFactoryUsePool](NUGlobalSettings, "surfaceStorageFactoryUsePool");
    v21 = [NUPurgeableStorageFactory alloc];
    if (v20)
      v22 = -[NUPurgeableStorageFactory initWithStoragePool:](v21, "initWithStoragePool:", self->_surfaceStoragePool);
    else
      v22 = -[NUPurgeableStorageFactory initWithStorageClass:](v21, "initWithStorageClass:", objc_opt_class());
    surfaceFactory = self->_surfaceFactory;
    self->_surfaceFactory = v22;

  }
  if (!self->_renderNodeCache)
  {
    v24 = objc_alloc_init(NURenderNodeCache);
    renderNodeCache = self->_renderNodeCache;
    self->_renderNodeCache = v24;

  }
  if (!self->_renderResultCache)
  {
    v26 = objc_alloc_init(NURenderResultCache);
    renderResultCache = self->_renderResultCache;
    self->_renderResultCache = v26;

  }
  if (!self->_platform)
  {
    v28 = objc_alloc_init(NUPlatform_iOS);
    platform = self->_platform;
    self->_platform = &v28->super;

  }
  if (!self->_cacheNodeRegistry)
  {
    v30 = objc_alloc_init(NUCacheNodeRegistry);
    cacheNodeRegistry = self->_cacheNodeRegistry;
    self->_cacheNodeRegistry = v30;

  }
  if (!self->_visionSession)
  {
    v32 = (VNSession *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE040]), "initWithCachingBehavior:", 1);
    visionSession = self->_visionSession;
    self->_visionSession = v32;

  }
  if (!self->_renderResourcePool)
  {
    v34 = objc_alloc_init(NURenderResourcePool);
    renderResourcePool = self->_renderResourcePool;
    self->_renderResourcePool = v34;

  }
  v36 = +[NUGlobalSettings debugSoftMemoryLimit](NUGlobalSettings, "debugSoftMemoryLimit");
  if (v36 >= 1)
  {
    v37 = v36;
    getpid();
    v38 = memorystatus_control();
    if (v38)
    {
      v39 = v38;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_136_2555);
      v40 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v39;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Failed to set soft memory limit (%d)", buf, 8u);
      }
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_136_2555);
      v41 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v43 = v37;
        _os_log_impl(&dword_1A6553000, v41, OS_LOG_TYPE_DEFAULT, "Successfully set soft memory limit to %ld MB", buf, 0xCu);
      }
    }
  }
}

- (NUSchemaRegistry)schemaRegistry
{
  return self->_schemaRegistry;
}

- (void)setSchemaRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_schemaRegistry, a3);
}

- (NURenderPipelineRegistry)renderPipelineRegistry
{
  return self->_renderPipelineRegistry;
}

- (void)setRenderPipelineRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_renderPipelineRegistry, a3);
}

- (NSString)defaultNamespace
{
  return self->_defaultNamespace;
}

- (void)setDefaultNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NUScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (NUPurgeableStoragePool)bufferStoragePool
{
  return self->_bufferStoragePool;
}

- (void)setBufferStoragePool:(id)a3
{
  objc_storeStrong((id *)&self->_bufferStoragePool, a3);
}

- (NUPurgeableStoragePool)surfaceStoragePool
{
  return self->_surfaceStoragePool;
}

- (void)setSurfaceStoragePool:(id)a3
{
  objc_storeStrong((id *)&self->_surfaceStoragePool, a3);
}

- (NUStorageFactory)bufferFactory
{
  return self->_bufferFactory;
}

- (void)setBufferFactory:(id)a3
{
  objc_storeStrong((id *)&self->_bufferFactory, a3);
}

- (NUStorageFactory)surfaceFactory
{
  return self->_surfaceFactory;
}

- (void)setSurfaceFactory:(id)a3
{
  objc_storeStrong((id *)&self->_surfaceFactory, a3);
}

- (NURenderNodeCache)renderNodeCache
{
  return self->_renderNodeCache;
}

- (void)setRenderNodeCache:(id)a3
{
  objc_storeStrong((id *)&self->_renderNodeCache, a3);
}

- (NURenderResultCache)renderResultCache
{
  return self->_renderResultCache;
}

- (void)setRenderResultCache:(id)a3
{
  objc_storeStrong((id *)&self->_renderResultCache, a3);
}

- (NURenderResourcePool)renderResourcePool
{
  return self->_renderResourcePool;
}

- (void)setRenderResourcePool:(id)a3
{
  objc_storeStrong((id *)&self->_renderResourcePool, a3);
}

- (NUPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NUCacheNodeRegistry)cacheNodeRegistry
{
  return self->_cacheNodeRegistry;
}

- (void)setCacheNodeRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_cacheNodeRegistry, a3);
}

- (CIFilter)repairMLFilter
{
  return self->_repairMLFilter;
}

- (void)setRepairMLFilter:(id)a3
{
  objc_storeStrong((id *)&self->_repairMLFilter, a3);
}

- (VNSession)visionSession
{
  return self->_visionSession;
}

- (void)setVisionSession:(id)a3
{
  objc_storeStrong((id *)&self->_visionSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionSession, 0);
  objc_storeStrong((id *)&self->_repairMLFilter, 0);
  objc_storeStrong((id *)&self->_cacheNodeRegistry, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_renderResourcePool, 0);
  objc_storeStrong((id *)&self->_renderResultCache, 0);
  objc_storeStrong((id *)&self->_renderNodeCache, 0);
  objc_storeStrong((id *)&self->_surfaceFactory, 0);
  objc_storeStrong((id *)&self->_bufferFactory, 0);
  objc_storeStrong((id *)&self->_surfaceStoragePool, 0);
  objc_storeStrong((id *)&self->_bufferStoragePool, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_defaultNamespace, 0);
  objc_storeStrong((id *)&self->_renderPipelineRegistry, 0);
  objc_storeStrong((id *)&self->_schemaRegistry, 0);
}

+ (id)sharedFactory
{
  void *v2;
  void *v3;
  NUFactory *v4;
  void *v5;
  id v6;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (void *)sCurrentFactory;
  if (!sCurrentFactory)
  {
    v4 = objc_alloc_init(NUFactory);
    v5 = (void *)sCurrentFactory;
    sCurrentFactory = (uint64_t)v4;

    objc_msgSend((id)sCurrentFactory, "start");
    v3 = (void *)sCurrentFactory;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (void)shutdownSharedFactory
{
  void *v2;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)sCurrentFactory;
  sCurrentFactory = 0;

  objc_sync_exit(obj);
}

+ (void)setSharedFactory:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  if (!v36)
  {
    NUAssertLogger_2574();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "factory != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2574();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v20;
        v39 = 2114;
        v40 = v24;
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
      v38 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUFactory setSharedFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUFactory.m", 70, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"factory != nil");
  }
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if ((id)sCurrentFactory == v36)
  {
    NUAssertLogger_2574();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot call [NUFactory setSharedFactory:] with itself. self:%@"), a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2574();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        v39 = 2114;
        v40 = v31;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUFactory setSharedFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUFactory.m", 72, CFSTR("Cannot call [NUFactory setSharedFactory:] with itself. self:%@"), v32, v33, v34, v35, (uint64_t)a1);
  }
  objc_storeStrong((id *)&sCurrentFactory, a3);
  objc_msgSend((id)sCurrentFactory, "start");
  objc_sync_exit(v5);

}

+ (void)reset
{
  NUFactory *v3;

  v3 = objc_alloc_init(NUFactory);
  objc_msgSend(a1, "setSharedFactory:", v3);

}

+ (void)reapAllStoragePools
{
  +[NUPurgeableStoragePool reapAllPurged](NUPurgeableStoragePool, "reapAllPurged");
  +[NUPurgeableStoragePool reapAllVolatile](NUPurgeableStoragePool, "reapAllVolatile");
}

+ (BOOL)hasSharedFactory
{
  id v2;
  BOOL v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = sCurrentFactory != 0;
  objc_sync_exit(v2);

  return v3;
}

+ (void)freeAllResources:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (objc_msgSend(a1, "hasSharedFactory"))
  {
    +[NUPurgeableStoragePool purge:](NUPurgeableStoragePool, "purge:", 0);
    +[NUPlatform currentPlatform](NUPlatform, "currentPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearCaches");

    if (v3)
      objc_msgSend(a1, "shutdownSharedFactory");
  }
}

@end
