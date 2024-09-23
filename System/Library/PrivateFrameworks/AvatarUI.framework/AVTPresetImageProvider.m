@implementation AVTPresetImageProvider

+ (id)presetImageCacheWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AVTImageStore *v7;
  void *v8;
  void *v9;
  AVTImageStore *v10;
  AVTTwoLevelsImageCache *v11;

  v3 = a3;
  if ((AVTUIThumbnailCaching_once() & 1) != 0)
  {
    if (AVTUIFlushThumbnailCache())
    {
      objc_msgSend(v3, "imageCacheStoreLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

      AVTUISetFlushThumbnailCache();
    }
    objc_msgSend(v3, "inMemoryImageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [AVTImageStore alloc];
    objc_msgSend(v3, "coreEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageCacheStoreLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AVTImageStore initWithEnvironment:validateImages:location:](v7, "initWithEnvironment:validateImages:location:", v8, 0, v9);

    v11 = -[AVTTwoLevelsImageCache initWithFirstLevelCache:secondLevelCache:environment:]([AVTTwoLevelsImageCache alloc], "initWithFirstLevelCache:secondLevelCache:environment:", v6, v10, v3);
  }
  else
  {
    v11 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v11;
}

- (AVTPresetImageProvider)initWithRenderingScheduler:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AVTPresetImageProvider *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "presetImageCacheWithEnvironment:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTPresetImageProvider initWithCache:renderingScheduler:environment:](self, "initWithCache:renderingScheduler:environment:", v8, v7, v6);

  return v9;
}

- (AVTPresetImageProvider)initWithCache:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  AVTImmediateTaskScheduler *v8;
  AVTPresetImageProvider *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(AVTImmediateTaskScheduler);
  v9 = -[AVTPresetImageProvider initWithCache:renderingScheduler:environment:](self, "initWithCache:renderingScheduler:environment:", v7, v8, v6);

  return v9;
}

- (AVTPresetImageProvider)initWithCache:(id)a3 renderingScheduler:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AVTRenderingScope *v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
  AVTRenderingScope *v17;
  void *v18;
  AVTPresetImageProvider *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "renderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [AVTRenderingScope alloc];
  objc_msgSend(v8, "mainScreenScale");
  v14 = v13;
  v15 = +[AVTRenderingScope scopeOptionsForEnvironment:](AVTRenderingScope, "scopeOptionsForEnvironment:", v8);
  objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:](v12, "initWithRenderingType:scale:options:framingMode:pose:", 100, v15, 0, v16, v14);

  objc_msgSend(v8, "serialQueueProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AVTPresetImageProvider initWithCache:renderingScheduler:renderingQueueProvider:callbackQueue:renderer:defaultScope:environment:](self, "initWithCache:renderingScheduler:renderingQueueProvider:callbackQueue:renderer:defaultScope:environment:", v10, v9, v18, MEMORY[0x1E0C80D38], v11, v17, v8);

  return v19;
}

- (AVTPresetImageProvider)initWithCache:(id)a3 renderingScheduler:(id)a4 renderingQueueProvider:(id)a5 callbackQueue:(id)a6 renderer:(id)a7 defaultScope:(id)a8 environment:(id)a9
{
  void (**v16)(id, const char *);
  id v17;
  id v18;
  id v19;
  AVTPresetImageProvider *v20;
  AVTPresetImageProvider *v21;
  uint64_t v22;
  OS_dispatch_queue *presetQueue;
  uint64_t v24;
  OS_dispatch_queue *colorQueue;
  uint64_t v26;
  AVTUILogger *logger;
  AVTRenderingScope *v28;
  uint64_t v29;
  AVTRenderingScope *colorScope;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v16 = (void (**)(id, const char *))a5;
  v32 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)AVTPresetImageProvider;
  v20 = -[AVTPresetImageProvider init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_cache, a3);
    objc_storeStrong((id *)&v21->_renderer, a7);
    v16[2](v16, "com.apple.AvatarUI.AVTPresetImageProvider.presetQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    presetQueue = v21->_presetQueue;
    v21->_presetQueue = (OS_dispatch_queue *)v22;

    v16[2](v16, "com.apple.AvatarUI.AVTPresetImageProvider.colorQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    colorQueue = v21->_colorQueue;
    v21->_colorQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v21->_renderingScheduler, a4);
    objc_storeStrong((id *)&v21->_callbackQueue, a6);
    objc_msgSend(v19, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    logger = v21->_logger;
    v21->_logger = (AVTUILogger *)v26;

    v28 = [AVTRenderingScope alloc];
    objc_msgSend(v19, "mainScreenScale");
    v29 = -[AVTRenderingScope initWithRenderingType:scale:](v28, "initWithRenderingType:scale:", 200);
    colorScope = v21->_colorScope;
    v21->_colorScope = (AVTRenderingScope *)v29;

    objc_storeStrong((id *)&v21->_defaultScope, a8);
  }

  return v21;
}

- (id)providerForThumbnailForModelColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[AVTPresetImageProvider colorScope](self, "colorScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPresetImageProvider colorQueue](self, "colorQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke;
  v15[3] = &unk_1EA51CE38;
  v15[4] = self;
  v16 = v4;
  v8 = v4;
  -[AVTPresetImageProvider providerForImageForItem:scope:queue:renderingHandler:](self, "providerForImageForItem:scope:queue:renderingHandler:", v8, v5, v6, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke_2;
  v13[3] = &unk_1EA51CE60;
  v14 = v9;
  v10 = v9;
  v11 = (void *)objc_msgSend(v13, "copy");

  return v11;
}

uint64_t __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderThumbnailForModelColor:", *(_QWORD *)(a1 + 40));
}

id __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke_2(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)renderThumbnailForModelColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AVTPresetImageProvider logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logRenderingModelColor:", v6);

  objc_msgSend(v4, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)providerForImageForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderingHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__AVTPresetImageProvider_providerForImageForItem_scope_queue_renderingHandler___block_invoke;
  v20[3] = &unk_1EA51CE88;
  v20[4] = self;
  v21 = v10;
  v23 = v12;
  v24 = v13;
  v22 = v11;
  v14 = v12;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = (void *)objc_msgSend(v20, "copy");

  return v18;
}

id __79__AVTPresetImageProvider_providerForImageForItem_scope_queue_renderingHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  if (a3)
  {
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v6, v7, v8, 0, v9, 0, 0, 0, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "renderingScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v6, v7, v8, 0, v9, v11, v12, v13, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)providerForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 poseOverride:(id)a5 avatarConfiguration:(id)a6 framingMode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  -[AVTPresetImageProvider defaultScope](self, "defaultScope");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
  {
    v19 = objc_msgSend(v17, "copyWithFramingMode:", v14);

    v18 = (void *)v19;
  }
  if (v13)
  {
    v20 = objc_msgSend(v18, "copyApplyingPoseOverride:", v13);

    v18 = (void *)v20;
  }
  objc_msgSend((id)objc_opt_class(), "configurationToRenderForPreset:overrides:baseConfiguration:", v12, v16, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTPresetImageProvider presetQueue](self, "presetQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __122__AVTPresetImageProvider_providerForThumbnailForModelPreset_presetOverrides_poseOverride_avatarConfiguration_framingMode___block_invoke;
  v28[3] = &unk_1EA51CEB0;
  v28[4] = self;
  v29 = v12;
  v30 = v21;
  v31 = v18;
  v23 = v18;
  v24 = v21;
  v25 = v12;
  -[AVTPresetImageProvider providerForImageForItem:scope:queue:renderingHandler:](self, "providerForImageForItem:scope:queue:renderingHandler:", v24, v23, v22, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

id __122__AVTPresetImageProvider_providerForThumbnailForModelPreset_presetOverrides_poseOverride_avatarConfiguration_framingMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logRenderingModelPreset:", v3);

  objc_msgSend(*(id *)(a1 + 32), "consumerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consumer:willConsumeRenderingResourceForEstimatedDuration:", *(_QWORD *)(a1 + 32), 0.5);

  objc_msgSend(*(id *)(a1 + 32), "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForAvatarConfiguration:scope:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)configurationToRenderForPreset:(id)a3 overrides:(id)a4 baseConfiguration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(a5, "copy");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__AVTPresetImageProvider_configurationToRenderForPreset_overrides_baseConfiguration___block_invoke;
  v12[3] = &unk_1EA51CED8;
  v10 = v9;
  v13 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend(v10, "addPreset:", v8);
  return v10;
}

uint64_t __85__AVTPresetImageProvider_configurationToRenderForPreset_overrides_baseConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addPreset:", a2);
}

- (AVTDeviceResourceConsumerDelegate)consumerDelegate
{
  return (AVTDeviceResourceConsumerDelegate *)objc_loadWeakRetained((id *)&self->_consumerDelegate);
}

- (void)setConsumerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_consumerDelegate, a3);
}

- (AVTImageCache)cache
{
  return self->_cache;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarConfigurationImageRenderer)renderer
{
  return self->_renderer;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (OS_dispatch_queue)presetQueue
{
  return self->_presetQueue;
}

- (OS_dispatch_queue)colorQueue
{
  return self->_colorQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTRenderingScope)colorScope
{
  return self->_colorScope;
}

- (AVTRenderingScope)defaultScope
{
  return self->_defaultScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultScope, 0);
  objc_storeStrong((id *)&self->_colorScope, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_colorQueue, 0);
  objc_storeStrong((id *)&self->_presetQueue, 0);
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_consumerDelegate);
}

@end
