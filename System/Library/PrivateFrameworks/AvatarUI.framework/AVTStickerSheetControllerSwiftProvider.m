@implementation AVTStickerSheetControllerSwiftProvider

- (AVTStickerSheetControllerSwiftProvider)init
{
  AVTStickerSheetControllerSwiftProvider *v2;
  uint64_t v3;
  AVTUIEnvironment *environment;
  uint64_t v5;
  AVTUILogger *logger;
  AVTAvatarStore *v7;
  AVTAvatarStore *avatarStore;
  AVTUIStickerGeneratorPool *v9;
  AVTUIStickerGeneratorPool *generatorPool;
  uint64_t v11;
  OS_dispatch_queue *renderingQueue;
  uint64_t v13;
  OS_dispatch_queue *encodingQueue;
  uint64_t v15;
  AVTResourceCache *cache;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  AVTStickerConfigurationProvider *v22;
  AVTStickerConfigurationProvider *configurationProvider;
  AVTAvatarRecordDataSource *v24;
  AVTAvatarStore *v25;
  void *v26;
  AVTAvatarRecordDataSource *v27;
  uint64_t v28;
  AVTStickerTaskScheduler *stickerScheduler;
  _AVTAvatarRecordImageProvider *v30;
  _AVTAvatarRecordImageProvider *imageProvider;
  NSMutableDictionary *v32;
  NSMutableDictionary *sheetControllers;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)AVTStickerSheetControllerSwiftProvider;
  v2 = -[AVTStickerSheetControllerSwiftProvider init](&v35, sel_init);
  if (v2)
  {
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v3 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    -[AVTUIEnvironment logger](v2->_environment, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (AVTUILogger *)v5;

    v7 = objc_alloc_init(AVTAvatarStore);
    avatarStore = v2->_avatarStore;
    v2->_avatarStore = v7;

    v9 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:]([AVTUIStickerGeneratorPool alloc], "initWithMaxStickerGeneratorCount:", 2);
    generatorPool = v2->_generatorPool;
    v2->_generatorPool = v9;

    -[AVTUIEnvironment backgroundRenderingQueue](v2->_environment, "backgroundRenderingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    renderingQueue = v2->_renderingQueue;
    v2->_renderingQueue = (OS_dispatch_queue *)v11;

    -[AVTUIEnvironment backgroundEncodingQueue](v2->_environment, "backgroundEncodingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    encodingQueue = v2->_encodingQueue;
    v2->_encodingQueue = (OS_dispatch_queue *)v13;

    objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v2->_environment);
    v15 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (AVTResourceCache *)v15;

    if ((AVTUIShowPrereleaseStickerPack_once() & 1) != 0)
    {
      v17 = *MEMORY[0x1E0D006D0];
      v37[0] = *MEMORY[0x1E0D006B0];
      v37[1] = v17;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = v37;
      v20 = 2;
    }
    else
    {
      v36 = *MEMORY[0x1E0D006B0];
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = &v36;
      v20 = 1;
    }
    objc_msgSend(v18, "arrayWithObjects:count:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AVTStickerConfigurationProvider initWithEnvironment:forStickerPacks:stickerConfigurationNames:]([AVTStickerConfigurationProvider alloc], "initWithEnvironment:forStickerPacks:stickerConfigurationNames:", v2->_environment, v21, 0);
    configurationProvider = v2->_configurationProvider;
    v2->_configurationProvider = v22;

    v24 = [AVTAvatarRecordDataSource alloc];
    v25 = v2->_avatarStore;
    objc_msgSend(MEMORY[0x1E0D00840], "requestForAllAvatars");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AVTAvatarRecordDataSource initWithRecordStore:fetchRequest:environment:](v24, "initWithRecordStore:fetchRequest:environment:", v25, v26, v2->_environment);

    +[AVTStickerTaskScheduler schedulerWithRecordDataSource:](AVTStickerTaskScheduler, "schedulerWithRecordDataSource:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    stickerScheduler = v2->_stickerScheduler;
    v2->_stickerScheduler = (AVTStickerTaskScheduler *)v28;

    v30 = -[_AVTAvatarRecordImageProvider initWithEnvironment:taskScheduler:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:taskScheduler:", v2->_environment, v2->_stickerScheduler);
    imageProvider = v2->_imageProvider;
    v2->_imageProvider = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sheetControllers = v2->_sheetControllers;
    v2->_sheetControllers = v32;

    -[AVTStickerSheetControllerSwiftProvider beginObservingAvatarStoreChanges](v2, "beginObservingAvatarStoreChanges");
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
  v5.super_class = (Class)AVTStickerSheetControllerSwiftProvider;
  -[AVTStickerSheetControllerSwiftProvider dealloc](&v5, sel_dealloc);
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

- (id)stickerSheetControllerForAvatarRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVTStickerSheetController *v8;
  void *v9;
  void *v10;
  AVTStickerSheetController *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[AVTStickerSheetControllerSwiftProvider sheetControllers](self, "sheetControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[AVTStickerConfigurationProvider stickerConfigurationsForAvatarRecord:](self->_configurationProvider, "stickerConfigurationsForAvatarRecord:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTStickerSheetModel sheetModelForAvatarRecord:withConfigurations:cache:taskScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:imageProvider:environment:](AVTStickerSheetModel, "sheetModelForAvatarRecord:withConfigurations:cache:taskScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:imageProvider:environment:", v4, v9, self->_cache, self->_stickerScheduler, self->_renderingQueue, self->_encodingQueue, self->_generatorPool, self->_imageProvider, self->_environment);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTStickerSheetController initWithStickerSheetModel:taskScheduler:allowsPeel:]([AVTStickerSheetController alloc], "initWithStickerSheetModel:taskScheduler:allowsPeel:", v10, self->_stickerScheduler, 1);
    -[AVTStickerSheetControllerSwiftProvider sheetControllers](self, "sheetControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

    v8 = v11;
  }

  return v8;
}

- (id)stickerSheetViewForAvatarRecord:(id)a3
{
  void *v4;
  void *v5;

  -[AVTStickerSheetControllerSwiftProvider stickerSheetControllerForAvatarRecord:](self, "stickerSheetControllerForAvatarRecord:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "sheetWillAppear");
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)stickerSheetController:(id)a3 didFinishRenderingStickersForRecord:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVTStickerSheetControllerSwiftProvider generatorPool](self, "generatorPool");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flushGeneratorForRecord:", v5);

}

- (void)stickerSheetController:(id)a3 didScrollToContentOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  id v9;

  y = a4.y;
  x = a4.x;
  -[AVTStickerSheetControllerSwiftProvider delegate](self, "delegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AVTStickerSheetControllerSwiftProvider delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stickerSheetControllerDidScrollToContentOffset:", x, y);

  }
}

- (id)stickerSheetController:(id)a3 requestsStickerForFileURL:(id)a4 localizedDescription:(id)a5 forItemWithIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[AVTStickerSheetControllerSwiftProvider delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stickerSheetControllerProvider:requestsStickerForFileURL:localizedDescription:forItemWithIdentifier:", self, v11, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)beginObservingAvatarStoreChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *avatarStoreChangeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D006D8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__AVTStickerSheetControllerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_1EA51DB40;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__AVTStickerSheetControllerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyStoreChanged");

}

- (void)endObservingAvatarStoreChanges
{
  void *v3;
  NSObject *avatarStoreChangeObserver;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

}

- (void)_notifyStoreChanged
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__AVTStickerSheetControllerSwiftProvider__notifyStoreChanged__block_invoke;
  v2[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __61__AVTStickerSheetControllerSwiftProvider__notifyStoreChanged__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  char v4;
  void *v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[12], "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = WeakRetained[12];
  WeakRetained[12] = v1;

  objc_msgSend(WeakRetained[9], "reloadData");
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stickerSheetControllerDidUpdateContent");

  }
}

uint64_t __61__AVTStickerSheetControllerSwiftProvider__notifyStoreChanged__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "sheetDidDisappear");
}

- (AVTStickerSheetControllerSwiftProviderDelegate)delegate
{
  return (AVTStickerSheetControllerSwiftProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTResourceCache)cache
{
  return self->_cache;
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

- (AVTStickerTaskScheduler)stickerScheduler
{
  return self->_stickerScheduler;
}

- (void)setStickerScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_stickerScheduler, a3);
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (NSMutableDictionary)sheetControllers
{
  return self->_sheetControllers;
}

- (void)setSheetControllers:(id)a3
{
  objc_storeStrong((id *)&self->_sheetControllers, a3);
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_sheetControllers, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_stickerScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
