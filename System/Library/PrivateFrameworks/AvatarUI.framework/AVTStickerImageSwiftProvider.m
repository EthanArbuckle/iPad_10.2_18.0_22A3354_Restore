@implementation AVTStickerImageSwiftProvider

- (AVTStickerImageSwiftProvider)init
{
  AVTStickerImageSwiftProvider *v2;
  uint64_t v3;
  AVTUIEnvironment *environment;
  uint64_t v5;
  AVTClippableImageStore *imageStore;
  AVTAvatarStore *v7;
  AVTAvatarStore *v8;
  AVTUIStickerGeneratorPool *v9;
  void *v10;
  uint64_t v11;
  AVTUIStickerGeneratorPool *generatorPool;
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  OS_dispatch_queue *recentsWorkQueue;
  uint64_t v16;
  OS_dispatch_queue *renderingQueue;
  uint64_t v18;
  OS_dispatch_queue *encodingQueue;
  uint64_t v20;
  AVTResourceCache *cache;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  AVTStickerConfigurationProvider *v27;
  AVTStickerConfigurationProvider *configurationProvider;
  void *v29;
  uint64_t v30;
  AVTSerialTaskScheduler *taskScheduler;
  objc_super v33;
  uint64_t v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)AVTStickerImageSwiftProvider;
  v2 = -[AVTStickerImageSwiftProvider init](&v33, sel_init);
  if (v2)
  {
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v3 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    objc_msgSend((id)objc_opt_class(), "imageStoreWithEnvironment:", v2->_environment);
    v5 = objc_claimAutoreleasedReturnValue();
    imageStore = v2->_imageStore;
    v2->_imageStore = (AVTClippableImageStore *)v5;

    v7 = objc_alloc_init(AVTAvatarStore);
    if ((-[AVTAvatarStore conformsToProtocol:](v7, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v7);
    v8 = v7;
    -[AVTAvatarStore setStickerBackendDelegate:](v8, "setStickerBackendDelegate:", v2);
    objc_storeStrong((id *)&v2->_avatarStore, v7);
    v9 = [AVTUIStickerGeneratorPool alloc];
    -[AVTUIEnvironment logger](v2->_environment, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:logger:](v9, "initWithMaxStickerGeneratorCount:logger:", 2, v10);
    generatorPool = v2->_generatorPool;
    v2->_generatorPool = (AVTUIStickerGeneratorPool *)v11;

    -[AVTUIEnvironment serialQueueProvider](v2->_environment, "serialQueueProvider");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v13)[2](v13, "com.apple.AvatarUI.StickerImageWorkQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    recentsWorkQueue = v2->_recentsWorkQueue;
    v2->_recentsWorkQueue = (OS_dispatch_queue *)v14;

    -[AVTUIEnvironment backgroundRenderingQueue](v2->_environment, "backgroundRenderingQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    renderingQueue = v2->_renderingQueue;
    v2->_renderingQueue = (OS_dispatch_queue *)v16;

    -[AVTUIEnvironment backgroundEncodingQueue](v2->_environment, "backgroundEncodingQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    encodingQueue = v2->_encodingQueue;
    v2->_encodingQueue = (OS_dispatch_queue *)v18;

    objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v2->_environment);
    v20 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (AVTResourceCache *)v20;

    if ((AVTUIShowPrereleaseStickerPack_once() & 1) != 0)
    {
      v22 = *MEMORY[0x1E0D006D0];
      v35[0] = *MEMORY[0x1E0D006B0];
      v35[1] = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v35;
      v25 = 2;
    }
    else
    {
      v34 = *MEMORY[0x1E0D006B0];
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = &v34;
      v25 = 1;
    }
    objc_msgSend(v23, "arrayWithObjects:count:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AVTStickerConfigurationProvider initWithEnvironment:forStickerPacks:stickerConfigurationNames:]([AVTStickerConfigurationProvider alloc], "initWithEnvironment:forStickerPacks:stickerConfigurationNames:", v2->_environment, v26, 0);
    configurationProvider = v2->_configurationProvider;
    v2->_configurationProvider = v27;

    -[AVTUIEnvironment coreEnvironment](v2->_environment, "coreEnvironment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:](AVTSerialTaskScheduler, "fifoSchedulerWithEnvironment:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = (AVTSerialTaskScheduler *)v30;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *avatarStoreChangeObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerImageSwiftProvider;
  -[AVTStickerImageSwiftProvider dealloc](&v5, sel_dealloc);
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AVTPassThroughResourceCache *v6;

  v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

    AVTUISetFlushStickersCache();
  }
  v6 = objc_alloc_init(AVTPassThroughResourceCache);

  return v6;
}

+ (id)imageStoreWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AVTClippableImageStore *v7;
  void *v8;
  void *v9;
  AVTClippableImageStore *v10;

  v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

    AVTUISetFlushStickersCache();
  }
  +[AVTUIStickerRenderer imageEncoder](AVTUIStickerRenderer, "imageEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AVTClippableImageStore alloc];
  objc_msgSend(v3, "coreEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerImageStoreLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTImageStore initWithEnvironment:validateImages:location:encoder:](v7, "initWithEnvironment:validateImages:location:encoder:", v8, 1, v9, v6);

  return v10;
}

- (void)imageForAvatarRecord:(id)a3 poseName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AVTUIStickerRenderer *v12;
  AVTUIStickerRenderer *v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  id v20;
  id location;
  _QWORD v22[3];
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AVTStickerConfigurationProvider stickerConfigurationForAvatarRecord:stickerName:](self->_configurationProvider, "stickerConfigurationForAvatarRecord:stickerName:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [AVTUIStickerRenderer alloc];
  v13 = -[AVTUIStickerRenderer initWithAvatarRecord:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](v12, "initWithAvatarRecord:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", v8, self->_cache, self->_imageStore, self->_generatorPool, self->_environment, self->_taskScheduler, self->_renderingQueue, self->_encodingQueue, MEMORY[0x1E0C80D38]);
  -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:](v13, "scheduledStickerResourceProviderForStickerConfiguration:", v11);
  v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__AVTStickerImageSwiftProvider_imageForAvatarRecord_poseName_completionHandler___block_invoke;
  v17[3] = &unk_1EA51F978;
  objc_copyWeak(&v20, &location);
  v19 = v22;
  v15 = v10;
  v18 = v15;
  v16 = (id)((uint64_t (**)(_QWORD, _QWORD *, _QWORD))v14)[2](v14, v17, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

}

void __80__AVTStickerImageSwiftProvider_imageForAvatarRecord_poseName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, a3);
}

- (BOOL)hasFetchedDefaultMemoji
{
  return self->_hasFetchedDefaultMemoji;
}

- (void)setHasFetchedDefaultMemoji:(BOOL)a3
{
  self->_hasFetchedDefaultMemoji = a3;
}

- (AVTAvatarRecord)defaultMemoji
{
  return self->_defaultMemoji;
}

- (void)setDefaultMemoji:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMemoji, a3);
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTStickerGenerator)stickerGenerator
{
  return self->_stickerGenerator;
}

- (OS_dispatch_queue)recentsWorkQueue
{
  return self->_recentsWorkQueue;
}

- (void)setRecentsWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recentsWorkQueue, a3);
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setRenderingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_renderingQueue, a3);
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (void)setEncodingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_encodingQueue, a3);
}

- (AVTStickerConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_configurationProvider, a3);
}

- (AVTSerialTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_taskScheduler, a3);
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (AVTStickerRecentsLayout)stickerRecentsLayout
{
  return self->_stickerRecentsLayout;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_stickerRecentsLayout, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_recentsWorkQueue, 0);
  objc_storeStrong((id *)&self->_stickerGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_defaultMemoji, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
}

@end
