@implementation AVTUIImageRenderService

- (AVTUIImageRenderService)init
{
  AVTUIImageRenderService *v2;
  uint64_t v3;
  AVTUIEnvironment *environment;
  void *v5;
  AVTImageStore *v6;
  void *v7;
  uint64_t v8;
  AVTImageStore *imageStore;
  AVTClippableImageStore *v10;
  void *v11;
  AVTStickerImageEncoder *v12;
  uint64_t v13;
  AVTClippableImageStore *clippableImageStore;
  uint64_t v15;
  AVTUILogger *logger;
  AVTUIStickerGeneratorPool *v17;
  AVTUIStickerGeneratorPool *generatorPool;
  uint64_t v19;
  AVTTaskScheduler *taskScheduler;
  NSLock *v21;
  NSLock *transactionCountLock;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *workQueue;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)AVTUIImageRenderService;
  v2 = -[AVTUIImageRenderService init](&v27, sel_init);
  if (v2)
  {
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v3 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    objc_msgSend(MEMORY[0x1E0D00860], "defaultEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [AVTImageStore alloc];
    objc_msgSend(v5, "imageStoreLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVTImageStore initWithEnvironment:validateImages:location:](v6, "initWithEnvironment:validateImages:location:", v5, 1, v7);
    imageStore = v2->_imageStore;
    v2->_imageStore = (AVTImageStore *)v8;

    v10 = [AVTClippableImageStore alloc];
    objc_msgSend(v5, "stickerImageStoreLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(AVTStickerImageEncoder);
    v13 = -[AVTImageStore initWithEnvironment:validateImages:location:encoder:](v10, "initWithEnvironment:validateImages:location:encoder:", v5, 1, v11, v12);
    clippableImageStore = v2->_clippableImageStore;
    v2->_clippableImageStore = (AVTClippableImageStore *)v13;

    -[AVTUIEnvironment logger](v2->_environment, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (AVTUILogger *)v15;

    v17 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:]([AVTUIStickerGeneratorPool alloc], "initWithMaxStickerGeneratorCount:", 1);
    generatorPool = v2->_generatorPool;
    v2->_generatorPool = v17;

    +[AVTSerialTaskScheduler fifoScheduler](AVTSerialTaskScheduler, "fifoScheduler");
    v19 = objc_claimAutoreleasedReturnValue();
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = (AVTTaskScheduler *)v19;

    v2->_activeTransactionCount = 0;
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    transactionCountLock = v2->_transactionCountLock;
    v2->_transactionCountLock = v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.avatarui.MemojiImageRenderService.work", v23);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v24;

  }
  return v2;
}

- (void)dealloc
{
  OS_os_transaction *transaction;
  objc_super v4;

  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)AVTUIImageRenderService;
  -[AVTUIImageRenderService dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_24);
  return (id)sharedInstance_renderService;
}

void __41__AVTUIImageRenderService_sharedInstance__block_invoke()
{
  AVTUIImageRenderService *v0;
  void *v1;

  v0 = objc_alloc_init(AVTUIImageRenderService);
  v1 = (void *)sharedInstance_renderService;
  sharedInstance_renderService = (uint64_t)v0;

}

- (void)transactionAdded
{
  void *v3;
  int64_t v4;
  void *v5;
  id v6;

  -[AVTUIImageRenderService transactionCountLock](self, "transactionCountLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[AVTUIImageRenderService setActiveTransactionCount:](self, "setActiveTransactionCount:", -[AVTUIImageRenderService activeTransactionCount](self, "activeTransactionCount") + 1);
  v4 = -[AVTUIImageRenderService activeTransactionCount](self, "activeTransactionCount");
  -[AVTUIImageRenderService _lock_invalidateCleanupTimer](self, "_lock_invalidateCleanupTimer");
  -[AVTUIImageRenderService transactionCountLock](self, "transactionCountLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  -[AVTUIImageRenderService logger](self, "logger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logIncrementingRemoteRendererTransactionCount:", v4);

}

- (void)transactionCompleted
{
  void *v3;
  int64_t v4;
  void *v5;
  id v6;

  -[AVTUIImageRenderService transactionCountLock](self, "transactionCountLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[AVTUIImageRenderService setActiveTransactionCount:](self, "setActiveTransactionCount:", -[AVTUIImageRenderService activeTransactionCount](self, "activeTransactionCount") - 1);
  v4 = -[AVTUIImageRenderService activeTransactionCount](self, "activeTransactionCount");
  -[AVTUIImageRenderService logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logDecrementingRemoteRendererTransactionCount:", v4);

  if (!v4)
    -[AVTUIImageRenderService _lock_beginCleanupTimer](self, "_lock_beginCleanupTimer");
  -[AVTUIImageRenderService transactionCountLock](self, "transactionCountLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)_lock_beginCleanupTimer
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  dispatch_block_t v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AVTUIImageRenderService__lock_beginCleanupTimer__block_invoke;
  v7[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v8, &location);
  v5 = dispatch_block_create((dispatch_block_flags_t)0, v7);
  objc_storeWeak(&self->_cleanupBlock, v5);
  v6 = dispatch_time(0, 10000000000);
  dispatch_after(v6, MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__AVTUIImageRenderService__lock_beginCleanupTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "logger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logCleanupTimerComplete");

    objc_msgSend(v6, "transactionCountLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");

    v4 = (void *)v6[9];
    v6[9] = 0;

    objc_msgSend(v6, "transactionCountLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unlock");

    objc_msgSend(v6, "exit");
    WeakRetained = v6;
  }

}

- (void)_lock_invalidateCleanupTimer
{
  OS_os_transaction *transaction;
  id *p_cleanupBlock;
  id WeakRetained;
  void *v6;
  id v7;

  transaction = self->_transaction;
  self->_transaction = 0;

  p_cleanupBlock = &self->_cleanupBlock;
  WeakRetained = objc_loadWeakRetained(&self->_cleanupBlock);

  if (WeakRetained)
  {
    -[AVTUIImageRenderService logger](self, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logCancellingCleanupBlock");

    v7 = objc_loadWeakRetained(p_cleanupBlock);
    dispatch_block_cancel(v7);

  }
}

- (void)_requestImageForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  AVTAvatarImageRenderer *v12;

  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  -[AVTUIImageRenderService transactionAdded](self, "transactionAdded");
  v12 = -[AVTAvatarImageRenderer initWithEnvironment:]([AVTAvatarImageRenderer alloc], "initWithEnvironment:", self->_environment);
  -[AVTAvatarImageRenderer _imageForAvatar:scope:](v12, "_imageForAvatar:scope:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v11);
  -[AVTUIImageRenderService transactionCompleted](self, "transactionCompleted");

}

- (void)_requestImageForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6
{
  void (**v10)(id, void *);
  id v11;
  id v12;
  AVTAvatarImageRenderer *v13;
  AVTAvatarImageRenderer *v14;
  AVTAvatarImageRenderer *v15;
  void *v16;
  id v17;

  v17 = a5;
  v10 = (void (**)(id, void *))a6;
  v11 = a4;
  v12 = a3;
  -[AVTUIImageRenderService transactionAdded](self, "transactionAdded");
  v13 = [AVTAvatarImageRenderer alloc];
  if (v17)
    v14 = -[AVTAvatarImageRenderer initWithSceneNodeModifications:](v13, "initWithSceneNodeModifications:", v17);
  else
    v14 = -[AVTAvatarImageRenderer initWithEnvironment:](v13, "initWithEnvironment:", self->_environment);
  v15 = v14;
  -[AVTAvatarImageRenderer _imageForAvatar:scope:](v14, "_imageForAvatar:scope:", v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v16);
  -[AVTUIImageRenderService transactionCompleted](self, "transactionCompleted");

}

- (void)_generateAndCacheImageForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  AVTAvatarImageRenderer *v11;
  void *v12;
  void *v13;
  AVTAvatarRecordCacheableResource *v14;
  void *v15;
  AVTAvatarRecordCacheableResource *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v21 = (void *)MEMORY[0x1DF0D05A4](-[AVTUIImageRenderService transactionAdded](self, "transactionAdded"));
  objc_msgSend(MEMORY[0x1E0D00858], "avatarForRecord:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTAvatarImageRenderer initWithEnvironment:]([AVTAvatarImageRenderer alloc], "initWithEnvironment:", self->_environment);
  -[AVTAvatarImageRenderer _imageForAvatar:scope:](v11, "_imageForAvatar:scope:", v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[AVTUIImageRenderService logger](self, "logger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logNilImageReturnedFromAVTAvatarRecordImageProvider");

  }
  v14 = [AVTAvatarRecordCacheableResource alloc];
  -[AVTUIImageRenderService environment](self, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:](v14, "initWithAvatarRecord:includeAvatarData:environment:", v22, 0, v15);

  v17 = -[AVTImageStore saveImage:forItem:scope:error:](self->_imageStore, "saveImage:forItem:scope:error:", v12, v16, v8, 0);
  -[AVTUIImageRenderService logger](self, "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v18, "logImageStoreDoneInServiceForPath:", v19);

    -[AVTImageStore resourceURLForItem:scope:](self->_imageStore, "resourceURLForItem:scope:", v16, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v20);

  }
  else
  {
    objc_msgSend(v18, "logImageStoreFailedInServiceForPath:error:", v19, 0);

    v9[2](v9, 0);
  }
  -[AVTUIImageRenderService transactionCompleted](self, "transactionCompleted");

  objc_autoreleasePoolPop(v21);
}

- (void)_requestStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  char isKindOfClass;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  AVTUIStickerRenderer *v23;
  AVTUIStickerRenderer *v24;
  uint64_t (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  AVTUIImageRenderService *v31;
  void (**v32)(id, _QWORD);
  _QWORD *v33;
  _QWORD v34[3];
  int v35;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD))a7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = (void *)MEMORY[0x1E0D00690];
  if ((isKindOfClass & 1) != 0)
  {
    v20 = v13;
    objc_msgSend(v20, "puppetName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stickerConfigurationForAnimojiNamed:inStickerPack:stickerName:", v21, v14, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(v13, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("no sticker configuration found for identifier=%@ stickerPack=%@ stickerName=%@"), v27, v14, v15);

    v17[2](v17, 0);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D00690], "stickerConfigurationForMemojiInStickerPack:stickerName:", v14, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_8;
LABEL_3:
  v28 = v16;
  -[AVTUIImageRenderService transactionAdded](self, "transactionAdded");
  v23 = self->_currentStickerRenderer;
  if (!v23 || (objc_msgSend(v13, "isEqual:", self->_currentAvatarRecord) & 1) == 0)
  {
    v24 = -[AVTUIStickerRenderer initWithAvatarRecord:stickerGeneratorPool:scheduler:]([AVTUIStickerRenderer alloc], "initWithAvatarRecord:stickerGeneratorPool:scheduler:", v13, self->_generatorPool, self->_taskScheduler);

    objc_storeStrong((id *)&self->_currentAvatarRecord, a3);
    objc_storeStrong((id *)&self->_currentStickerRenderer, v24);
    v23 = v24;
  }
  -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:usingService:](v23, "scheduledStickerResourceProviderForStickerConfiguration:usingService:", v22, 0);
  v25 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __127__AVTUIImageRenderService__requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v29[3] = &unk_1EA51F8D8;
  v33 = v34;
  v30 = v22;
  v31 = self;
  v32 = v17;
  v26 = (id)((uint64_t (**)(_QWORD, _QWORD *, uint64_t))v25)[2](v25, v29, 1);

  _Block_object_dispose(v34, 8);
  v16 = v28;
LABEL_9:

}

void __127__AVTUIImageRenderService__requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "unload");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(_DWORD *)(v4 + 24);
  *(_DWORD *)(v4 + 24) = v5 + 1;
  if (!v5)
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "logger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logNilImageReturnedFromAVTUIStickerRenderer");

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logRenderingStickerEnd:", v8);

    objc_msgSend(*(id *)(a1 + 40), "transactionCompleted");
  }

}

- (void)requestImageForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVTUIImageRenderService_requestImageForAvatar_scope_withReply___block_invoke;
  block[3] = &unk_1EA51F900;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(workQueue, block);

}

uint64_t __65__AVTUIImageRenderService_requestImageForAvatar_scope_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestImageForAvatar:scope:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)requestImageForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__AVTUIImageRenderService_requestImageForAvatar_scope_withModifications_withReply___block_invoke;
  block[3] = &unk_1EA51F928;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(workQueue, block);

}

uint64_t __83__AVTUIImageRenderService_requestImageForAvatar_scope_withModifications_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestImageForAvatar:scope:withModifications:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)generateAndCacheImageForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AVTUIImageRenderService_generateAndCacheImageForAvatarRecord_scope_withReply___block_invoke;
  block[3] = &unk_1EA51F900;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(workQueue, block);

}

uint64_t __80__AVTUIImageRenderService_generateAndCacheImageForAvatarRecord_scope_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateAndCacheImageForAvatarRecord:scope:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)requestStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *workQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __126__AVTUIImageRenderService_requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v23[3] = &unk_1EA51F950;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(workQueue, v23);

}

uint64_t __126__AVTUIImageRenderService_requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestStickerImageForAvatarRecord:withStickerPackName:stickerConfigurationName:resource:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)requestAnimojiStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *workQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __133__AVTUIImageRenderService_requestAnimojiStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v23[3] = &unk_1EA51F950;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(workQueue, v23);

}

uint64_t __133__AVTUIImageRenderService_requestAnimojiStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestAnimojiStickerImageForAvatarRecord:withStickerPackName:stickerConfigurationName:resource:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTClippableImageStore)clippableImageStore
{
  return self->_clippableImageStore;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (AVTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (int64_t)activeTransactionCount
{
  return self->_activeTransactionCount;
}

- (void)setActiveTransactionCount:(int64_t)a3
{
  self->_activeTransactionCount = a3;
}

- (NSLock)transactionCountLock
{
  return self->_transactionCountLock;
}

- (void)setTransactionCountLock:(id)a3
{
  objc_storeStrong((id *)&self->_transactionCountLock, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (id)cleanupBlock
{
  return objc_loadWeakRetained(&self->_cleanupBlock);
}

- (void)setCleanupBlock:(id)a3
{
  objc_storeWeak(&self->_cleanupBlock, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (AVTAvatarRecord)currentAvatarRecord
{
  return self->_currentAvatarRecord;
}

- (void)setCurrentAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_currentAvatarRecord, a3);
}

- (AVTUIStickerRenderer)currentStickerRenderer
{
  return self->_currentStickerRenderer;
}

- (void)setCurrentStickerRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_currentStickerRenderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStickerRenderer, 0);
  objc_storeStrong((id *)&self->_currentAvatarRecord, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak(&self->_cleanupBlock);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transactionCountLock, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_clippableImageStore, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
