@implementation _AVTAvatarRecordImageProvider

+ (void)makePersistentImageCache:(id *)a3 volatileImageCache:(id *)a4 withEnvironment:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTImageStore *v12;
  void *v13;
  void *v14;
  AVTImageStore *v15;
  AVTTwoLevelsImageCache *v16;
  AVTImageStore *v17;
  void *v18;
  void *v19;
  AVTImageStore *v20;
  AVTTwoLevelsImageCache *v21;
  AVTPassThroughResourceCache *v22;
  id v23;

  v23 = a5;
  if ((AVTUIThumbnailCaching_once() & 1) != 0)
  {
    if (AVTUIFlushThumbnailCache())
    {
      objc_msgSend(v23, "imageStoreLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v7, v8);

      objc_msgSend(v23, "imageCacheStoreLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v9, v10);

      AVTUISetFlushThumbnailCache();
    }
    objc_msgSend(v23, "inMemoryImageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [AVTImageStore alloc];
    objc_msgSend(v23, "coreEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageStoreLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AVTImageStore initWithEnvironment:validateImages:location:](v12, "initWithEnvironment:validateImages:location:", v13, 1, v14);

    v16 = objc_retainAutorelease(-[AVTTwoLevelsImageCache initWithFirstLevelCache:secondLevelCache:environment:]([AVTTwoLevelsImageCache alloc], "initWithFirstLevelCache:secondLevelCache:environment:", v11, v15, v23));
    *a3 = v16;
    v17 = [AVTImageStore alloc];
    objc_msgSend(v23, "coreEnvironment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageCacheStoreLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[AVTImageStore initWithEnvironment:validateImages:location:](v17, "initWithEnvironment:validateImages:location:", v18, 1, v19);

    v21 = objc_retainAutorelease(-[AVTTwoLevelsImageCache initWithFirstLevelCache:secondLevelCache:environment:]([AVTTwoLevelsImageCache alloc], "initWithFirstLevelCache:secondLevelCache:environment:", v11, v20, v23));
    *a4 = v21;

  }
  else
  {
    v22 = objc_alloc_init(AVTPassThroughResourceCache);
    *a3 = v22;
    *a4 = objc_retainAutorelease(v22);
  }

}

- (id)_providerForAvatar:(id)a3 forRecord:(id)a4 scope:(id)a5 usingCache:(BOOL)a6
{
  return -[_AVTAvatarRecordImageProvider _providerForAvatar:forRecord:scope:usingCache:usingService:](self, "_providerForAvatar:forRecord:scope:usingCache:usingService:", a3, a4, a5, a6, 0);
}

- (_AVTAvatarRecordImageProvider)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  AVTImmediateTaskScheduler *v8;
  _AVTAvatarRecordImageProvider *v9;
  id v11;
  void *v12;

  v4 = a3;
  v11 = 0;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "makePersistentImageCache:volatileImageCache:withEnvironment:", &v12, &v11, v4);
  v5 = v12;
  v6 = v11;
  v7 = v5;
  v8 = objc_alloc_init(AVTImmediateTaskScheduler);
  v9 = -[_AVTAvatarRecordImageProvider initWithPersistentCache:volatileCache:allowPreFlight:taskScheduler:environment:](self, "initWithPersistentCache:volatileCache:allowPreFlight:taskScheduler:environment:", v7, v6, 1, v8, v4);

  return v9;
}

- (_AVTAvatarRecordImageProvider)initWithEnvironment:(id)a3 taskScheduler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _AVTAvatarRecordImageProvider *v10;
  uint64_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v12 = 0;
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "makePersistentImageCache:volatileImageCache:withEnvironment:", &v13, &v12, v7);
  v8 = v12;
  v9 = v13;
  v10 = -[_AVTAvatarRecordImageProvider initWithPersistentCache:volatileCache:allowPreFlight:taskScheduler:environment:](self, "initWithPersistentCache:volatileCache:allowPreFlight:taskScheduler:environment:", v9, v8, 1, v6, v7);

  return v10;
}

- (_AVTAvatarRecordImageProvider)initWithPersistentCache:(id)a3 volatileCache:(id)a4 allowPreFlight:(BOOL)a5 taskScheduler:(id)a6 environment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AVTAvatarImageRenderer *v16;
  void *v17;
  _AVTAvatarRecordImageProvider *v18;
  uint64_t v20;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = -[AVTAvatarImageRenderer initWithEnvironment:]([AVTAvatarImageRenderer alloc], "initWithEnvironment:", v12);
  objc_msgSend(v12, "backgroundRenderingQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = a5;
  v18 = -[_AVTAvatarRecordImageProvider initWithPersistentCache:volatileCache:renderingQueue:callbackQueue:configurationRenderer:avatarRenderer:taskScheduler:allowPreFlight:environment:](self, "initWithPersistentCache:volatileCache:renderingQueue:callbackQueue:configurationRenderer:avatarRenderer:taskScheduler:allowPreFlight:environment:", v15, v14, v17, MEMORY[0x1E0C80D38], 0, v16, v13, v20, v12);

  return v18;
}

- (_AVTAvatarRecordImageProvider)initWithPersistentCache:(id)a3 volatileCache:(id)a4 renderingQueue:(id)a5 callbackQueue:(id)a6 configurationRenderer:(id)a7 avatarRenderer:(id)a8 taskScheduler:(id)a9 allowPreFlight:(BOOL)a10 environment:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  _AVTAvatarRecordImageProvider *v22;
  _AVTAvatarRecordImageProvider *v23;
  uint64_t v24;
  AVTUILogger *logger;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v31 = a3;
  v30 = a4;
  v28 = a5;
  v18 = a5;
  v29 = a6;
  v19 = a6;
  v33 = a7;
  v27 = a8;
  v32 = a8;
  v20 = a9;
  v21 = a11;
  v34.receiver = self;
  v34.super_class = (Class)_AVTAvatarRecordImageProvider;
  v22 = -[_AVTAvatarRecordImageProvider init](&v34, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_peristentCache, a3);
    objc_storeStrong((id *)&v23->_volatileCache, a4);
    objc_storeStrong((id *)&v23->_configurationRenderer, a7);
    objc_storeStrong((id *)&v23->_avatarRenderer, v27);
    v23->_allowPreFlight = a10;
    objc_storeStrong((id *)&v23->_environment, a11);
    objc_storeStrong((id *)&v23->_workQueue, v28);
    objc_storeStrong((id *)&v23->_callbackQueue, v29);
    objc_storeStrong((id *)&v23->_renderingScheduler, a9);
    objc_msgSend(v21, "logger");
    v24 = objc_claimAutoreleasedReturnValue();
    logger = v23->_logger;
    v23->_logger = (AVTUILogger *)v24;

  }
  return v23;
}

- (id)providerForRecord:(id)a3 scope:(id)a4
{
  return -[_AVTAvatarRecordImageProvider providerForRecord:scope:usingService:](self, "providerForRecord:scope:usingService:", a3, a4, 0);
}

- (id)providerForRecord:(id)a3 scope:(id)a4 usingService:(BOOL)a5
{
  return -[_AVTAvatarRecordImageProvider _providerForAvatar:forRecord:scope:usingCache:usingService:](self, "_providerForAvatar:forRecord:scope:usingCache:usingService:", 0, a3, a4, 1, a5);
}

- (id)_providerForRecord:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AVTAvatarRecordCacheableResource *v9;
  void *v10;
  AVTAvatarRecordCacheableResource *v11;
  AVTAvatarRecordCacheableResource *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  AVTAvatarRecordCacheableResource *v25;

  v6 = a3;
  v7 = a4;
  -[_AVTAvatarRecordImageProvider configurationRenderer](self, "configurationRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't render without a configuration renderer"));
  v9 = [AVTAvatarRecordCacheableResource alloc];
  -[_AVTAvatarRecordImageProvider environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v9, "initWithAvatarRecord:includeAvatarData:environment:", v6, 0, v10);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke;
  v22[3] = &unk_1EA51F740;
  v22[4] = self;
  v23 = v6;
  v24 = v7;
  v25 = v11;
  v12 = v11;
  v13 = v7;
  v14 = v6;
  v15 = (void *)objc_msgSend(v22, "copy");
  v20 = (void *)MEMORY[0x1DF0D0754](v15, v16, v17, v18, v19);

  return v20;
}

- (id)_providerForAvatar:(id)a3 forRecord:(id)a4 scope:(id)a5 usingCache:(BOOL)a6 usingService:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  AVTAvatarRecordCacheableResource *v15;
  void *v16;
  AVTAvatarRecordCacheableResource *v17;
  id v18;
  AVTAvatarRecordCacheableResource *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  AVTAvatarRecordCacheableResource *v32;
  id v33;
  BOOL v34;
  BOOL v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = [AVTAvatarRecordCacheableResource alloc];
  -[_AVTAvatarRecordImageProvider environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v15, "initWithAvatarRecord:includeAvatarData:environment:", v13, 0, v16);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke;
  v29[3] = &unk_1EA51F7B8;
  v29[4] = self;
  v30 = v13;
  v34 = a7;
  v31 = v14;
  v32 = v17;
  v33 = v12;
  v35 = a6;
  v18 = v12;
  v19 = v17;
  v20 = v14;
  v21 = v13;
  v22 = (void *)objc_msgSend(v29, "copy");
  v27 = (void *)MEMORY[0x1DF0D0754](v22, v23, v24, v25, v26);

  return v27;
}

- (AVTImageCache)peristentCache
{
  return self->_peristentCache;
}

- (AVTImageCache)volatileCache
{
  return self->_volatileCache;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarConfigurationImageRenderer)configurationRenderer
{
  return self->_configurationRenderer;
}

- (AVTAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (BOOL)allowPreFlight
{
  return self->_allowPreFlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_configurationRenderer, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_volatileCache, 0);
  objc_storeStrong((id *)&self->_peristentCache, 0);
}

@end
