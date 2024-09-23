@implementation AVTPresetResourceLoader

- (AVTPresetResourceLoader)initWithEnvironment:(id)a3 renderingScheduler:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTInMemoryResourceCache *v11;
  void *v12;
  void *v13;
  AVTInMemoryResourceCache *v14;
  AVTPresetResourceLoader *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [AVTInMemoryResourceCache alloc];
  objc_msgSend(v10, "lockProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTInMemoryResourceCache initWithLockProvider:totalCostLimit:logger:](v11, "initWithLockProvider:totalCostLimit:logger:", v12, 50, v13);

  v15 = -[AVTPresetResourceLoader initWithPresetCache:renderingScheduler:callbackQueue:environment:](self, "initWithPresetCache:renderingScheduler:callbackQueue:environment:", v14, v9, v8, v10);
  return v15;
}

- (AVTPresetResourceLoader)initWithPresetCache:(id)a3 renderingScheduler:(id)a4 callbackQueue:(id)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AVTPresetResourceLoader *v15;
  AVTPresetResourceLoader *v16;
  uint64_t v17;
  AVTImageCache *inMemoryImageCache;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  OS_dispatch_queue *workQueue;
  uint64_t v22;
  AVTUILogger *logger;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)AVTPresetResourceLoader;
  v15 = -[AVTPresetResourceLoader init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a6);
    objc_storeStrong((id *)&v16->_presetCache, a3);
    objc_msgSend(v14, "inMemoryImageCache");
    v17 = objc_claimAutoreleasedReturnValue();
    inMemoryImageCache = v16->_inMemoryImageCache;
    v16->_inMemoryImageCache = (AVTImageCache *)v17;

    objc_msgSend(v14, "serialQueueProvider");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v19)[2](v19, "com.apple.AvatarUI.AVTPresetResourceLoader.workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v20;

    objc_msgSend(v14, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    logger = v16->_logger;
    v16->_logger = (AVTUILogger *)v22;

    objc_storeStrong((id *)&v16->_renderingScheduler, a4);
    objc_storeStrong((id *)&v16->_callbackQueue, a5);
  }

  return v16;
}

- (id)preLoadResourcesForSectionItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  AVTSectionItemLoadingTask *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[AVTSectionItemLoadingTask initWithSectionItem:completionHandler:]([AVTSectionItemLoadingTask alloc], "initWithSectionItem:completionHandler:", v7, v6);

  -[AVTPresetResourceLoader startSectionItemPreloadingTask:](self, "startSectionItemPreloadingTask:", v8);
  return v8;
}

- (void)startSectionItemPreloadingTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AVTPresetResourceLoader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__AVTPresetResourceLoader_startSectionItemPreloadingTask___block_invoke;
  v7[3] = &unk_1EA51D570;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__AVTPresetResourceLoader_startSectionItemPreloadingTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logStartingPreLoadingTask:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "performSectionItemPreloadingTask:", *(_QWORD *)(a1 + 40));
}

- (void)performSectionItemPreloadingTask:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id *v16;
  id *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v4 = a3;
  if ((objc_msgSend(v4, "isCanceled") & 1) == 0)
  {
    objc_msgSend(v4, "sectionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presetResourcesProvider");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPresetResourceLoader performPresetLoadingForPresetResources:task:](self, "performPresetLoadingForPresetResources:task:", v7, v4);

    if ((objc_msgSend(v4, "isCanceled") & 1) == 0)
    {
      -[AVTPresetResourceLoader logger](self, "logger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1DF0D05A4]();
      objc_msgSend(v4, "sectionItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stickerResourceProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "sectionItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = MEMORY[0x1E0C809B0];
      if (v11)
      {
        objc_msgSend(v12, "stickerResourceProvider");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v26[0] = v14;
        v26[1] = 3221225472;
        v26[2] = __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke;
        v26[3] = &unk_1EA51E940;
        v16 = &v27;
        v27 = v8;
        v17 = &v28;
        v28 = v4;
        ((void (**)(_QWORD, _QWORD *, _QWORD))v15)[2](v15, v26, 0);
      }
      else
      {
        objc_msgSend(v12, "thumbnailProvider");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_2;
        v23[3] = &unk_1EA51E968;
        v16 = &v24;
        v24 = v8;
        v17 = &v25;
        v25 = v4;
        ((void (**)(_QWORD, _QWORD *, _QWORD))v15)[2](v15, v23, 0);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTPresetResourceLoader renderingScheduler](self, "renderingScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lowerTaskPriority:", v18);

      objc_autoreleasePoolPop(v9);
      if ((objc_msgSend(v4, "isCanceled") & 1) == 0)
      {
        -[AVTPresetResourceLoader callbackQueue](self, "callbackQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_3;
        block[3] = &unk_1EA51D188;
        v22 = v4;
        dispatch_async(v20, block);

      }
    }
  }

}

void __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "description");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logDonePreLoadingThumbnailForPreLoadingTask:", v2);

}

void __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "description");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logDonePreLoadingThumbnailForPreLoadingTask:", v2);

}

void __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_3(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v2[2](v2, *(_QWORD *)(a1 + 32));

  }
}

- (id)preLoadResourcesForPresetResourcesProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  AVTPresetResourcesLoadingTask *v8;
  void *v9;
  AVTPresetResourcesLoadingTask *v10;

  v6 = a4;
  v7 = a3;
  v8 = [AVTPresetResourcesLoadingTask alloc];
  objc_msgSend(v7, "representedAVTPresetResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AVTPresetResourcesLoadingTask initWithPresetResources:completionHandler:](v8, "initWithPresetResources:completionHandler:", v9, v6);
  -[AVTPresetResourceLoader startPresetPreloadingTask:](self, "startPresetPreloadingTask:", v10);
  return v10;
}

- (void)startPresetPreloadingTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[AVTPresetResourceLoader logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logStartingPreLoadingTask:", v6);

  -[AVTPresetResourceLoader workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__AVTPresetResourceLoader_startPresetPreloadingTask___block_invoke;
  v9[3] = &unk_1EA51D570;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __53__AVTPresetResourceLoader_startPresetPreloadingTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPresetResourcesPreloadingTask:", *(_QWORD *)(a1 + 40));
}

- (void)performPresetResourcesPreloadingTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isCanceled") & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "presetResources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[AVTPresetResourceLoader performPresetLoadingForPresetResources:task:](self, "performPresetLoadingForPresetResources:task:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), v4);
        if ((objc_msgSend(v4, "isCanceled") & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[AVTPresetResourceLoader callbackQueue](self, "callbackQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__AVTPresetResourceLoader_performPresetResourcesPreloadingTask___block_invoke;
      block[3] = &unk_1EA51D188;
      v12 = v4;
      dispatch_async(v10, block);

      v5 = v12;
    }

  }
}

void __64__AVTPresetResourceLoader_performPresetResourcesPreloadingTask___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v2[2](v2, *(_QWORD *)(a1 + 32));

  }
}

- (void)performPresetLoadingForPresetResources:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1DF0D05A4]();
  -[AVTPresetResourceLoader logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "volatileIdentifierForScope:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logLookingUpPreLoadedPreset:task:", v10, v11);

  -[AVTPresetResourceLoader presetCache](self, "presetCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__AVTPresetResourceLoader_performPresetLoadingForPresetResources_task___block_invoke;
  v16[3] = &unk_1EA51E990;
  v16[4] = self;
  v13 = v6;
  v17 = v13;
  v14 = v7;
  v18 = v14;
  v15 = (id)objc_msgSend(v12, "resourceForItem:scope:cacheMissHandler:", v13, 0, v16);

  objc_autoreleasePoolPop(v8);
}

id __71__AVTPresetResourceLoader_performPresetLoadingForPresetResources_task___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1[4], "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "volatileIdentifierForScope:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logPreLoadingPreset:task:", v3, v4);

  objc_msgSend(a1[5], "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "volatileIdentifierForScope:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logDonePreLoadingPreset:task:", v7, v8);

  return v5;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTInMemoryResourceCache)presetCache
{
  return self->_presetCache;
}

- (AVTImageCache)inMemoryImageCache
{
  return self->_inMemoryImageCache;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_presetCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
