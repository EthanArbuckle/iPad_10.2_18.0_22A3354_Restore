@implementation AVTUIStickerRenderer

+ (id)imageEncoder
{
  return objc_alloc_init(AVTStickerImageEncoder);
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AVTInMemoryResourceCache *v6;
  void *v7;
  void *v8;
  AVTPassThroughResourceCache *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (AVTUIStickersCaching())
  {
    if (AVTUIFlushStickersCache())
    {
      objc_msgSend(v3, "stickerImageStoreLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

      AVTUISetFlushStickersCache();
    }
    v6 = [AVTInMemoryResourceCache alloc];
    objc_msgSend(v3, "lockProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTInMemoryResourceCache initWithLockProvider:totalCostLimit:logger:](v6, "initWithLockProvider:totalCostLimit:logger:", v7, 980000, v8);

  }
  else
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v10, v11);

    AVTUISetFlushStickersCache();
    v9 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v9;
}

+ (BOOL)clearStickersForAvatarRecordIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coreEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "clearStickersForAvatarRecordIdentifier:withEnvironment:", v4, v6);

  return (char)a1;
}

+ (BOOL)clearStickersForAvatarRecordIdentifier:(id)a3 withEnvironment:(id)a4
{
  id v5;
  id v6;
  AVTImageStore *v7;
  void *v8;
  AVTImageStore *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = [AVTImageStore alloc];
  objc_msgSend(v5, "stickerImageStoreLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTImageStore initWithEnvironment:validateImages:location:](v7, "initWithEnvironment:validateImages:location:", v5, 0, v8);

  +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:](AVTAvatarRecordCacheableResource, "persistentIdentifierPrefixForRecordWithIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = -[AVTImageStore deleteImagesForItemsWithPersistentIdentifierPrefix:error:](v9, "deleteImagesForItemsWithPersistentIdentifierPrefix:error:", v10, 0);
  return (char)v6;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 stickerGeneratorPool:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AVTUIStickerRenderer *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundRenderingQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundEncodingQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AVTUIStickerRenderer initWithAvatarRecord:cache:renderingScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:environment:](self, "initWithAvatarRecord:cache:renderingScheduler:renderingQueue:encodingQueue:stickerGeneratorPool:environment:", v10, v12, v8, v13, v14, v9, v11);

  return v15;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 stickerGeneratorPool:(id)a4 scheduler:(id)a5 imageStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AVTUIStickerRenderer *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundRenderingQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundEncodingQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AVTUIStickerRenderer initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](self, "initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", v13, 0, v15, v10, v12, v14, v11, v16, v17, MEMORY[0x1E0C80D38]);

  return v18;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 avatar:(id)a4 stickerGeneratorPool:(id)a5 scheduler:(id)a6 imageStore:(id)a7 environment:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  AVTUIStickerRenderer *v23;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundRenderingQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundEncodingQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AVTUIStickerRenderer initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](self, "initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", v19, v18, v20, v15, v17, v14, v16, v21, v22, MEMORY[0x1E0C80D38]);

  return v23;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 cache:(id)a4 renderingScheduler:(id)a5 renderingQueue:(id)a6 encodingQueue:(id)a7 stickerGeneratorPool:(id)a8 environment:(id)a9
{
  id v16;
  id v17;
  void *v18;
  AVTClippableImageStore *v19;
  void *v20;
  void *v21;
  AVTClippableImageStore *v22;
  AVTUIStickerRenderer *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v16 = a9;
  v29 = a8;
  v28 = a7;
  v27 = a6;
  v26 = a5;
  v25 = a4;
  v17 = a3;
  objc_msgSend((id)objc_opt_class(), "imageEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [AVTClippableImageStore alloc];
  objc_msgSend(v16, "coreEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stickerImageStoreLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AVTImageStore initWithEnvironment:validateImages:location:encoder:](v19, "initWithEnvironment:validateImages:location:encoder:", v20, 0, v21, v18);

  v23 = -[AVTUIStickerRenderer initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](self, "initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", v17, 0, v25, v22, v29, v16, v26, v27, v28, MEMORY[0x1E0C80D38]);
  return v23;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 cache:(id)a4 imageStore:(id)a5 stickerGeneratorPool:(id)a6 environment:(id)a7 renderingScheduler:(id)a8 renderingQueue:(id)a9 encodingQueue:(id)a10 callbackQueue:(id)a11
{
  return -[AVTUIStickerRenderer initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](self, "initWithAvatarRecord:avatar:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", a3, 0, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 avatar:(id)a4 cache:(id)a5 imageStore:(id)a6 stickerGeneratorPool:(id)a7 environment:(id)a8 renderingScheduler:(id)a9 renderingQueue:(id)a10 encodingQueue:(id)a11 callbackQueue:(id)a12
{
  id v18;
  id v19;
  id v20;
  AVTUIStickerRenderer *v21;
  AVTUIStickerRenderer *v22;
  uint64_t v23;
  AVTUILogger *logger;
  AVTAvatarRecordCacheableResource *v25;
  AVTCacheableResource *cacheableResourceItem;
  id obj;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  obj = a4;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v29 = a8;
  v18 = a8;
  v32 = a9;
  v31 = a10;
  v19 = a11;
  v20 = a12;
  v38.receiver = self;
  v38.super_class = (Class)AVTUIStickerRenderer;
  v21 = -[AVTUIStickerRenderer init](&v38, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_avatarRecord, a3);
    objc_storeStrong((id *)&v22->_avatar, obj);
    objc_storeStrong((id *)&v22->_cache, a5);
    objc_storeStrong((id *)&v22->_stickerGeneratorPool, a7);
    objc_storeStrong((id *)&v22->_imageStore, a6);
    objc_storeStrong((id *)&v22->_environment, v29);
    objc_msgSend(v18, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    logger = v22->_logger;
    v22->_logger = (AVTUILogger *)v23;

    objc_storeStrong((id *)&v22->_renderingQueue, a10);
    objc_storeStrong((id *)&v22->_encodingQueue, a11);
    objc_storeStrong((id *)&v22->_renderingScheduler, a9);
    objc_storeStrong((id *)&v22->_callbackQueue, a12);
    *(_WORD *)&v22->_parallelizeEncoding = 0;
    v25 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:]([AVTAvatarRecordCacheableResource alloc], "initWithAvatarRecord:includeAvatarData:environment:", v37, objc_msgSend(v37, "isEditable"), v18);
    cacheableResourceItem = v22->_cacheableResourceItem;
    v22->_cacheableResourceItem = (AVTCacheableResource *)v25;

  }
  return v22;
}

- (id)scheduledTaskForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderingHandler:(id)a6 resourceHandler:(id)a7 synchronous:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[AVTUIStickerRenderer cache](self, "cache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v19, v14, v15, 0, v17, 0, 0, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AVTUIStickerRenderer renderingScheduler](self, "renderingScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIStickerRenderer callbackQueue](self, "callbackQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v19, v14, v15, 0, v17, v16, v21, v22, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)providerForResourceForScope:(id)a3 queue:(id)a4 renderingHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTUIStickerRenderer cacheableResourceItem](self, "cacheableResourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStickerRenderer providerForResource:forScope:queue:renderingHandler:](self, "providerForResource:forScope:queue:renderingHandler:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)providerForResourceWithAvatarConfiguration:(id)a3 forScope:(id)a4 queue:(id)a5 renderingHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AVTAggregateCacheableResource *v14;
  void *v15;
  void *v16;
  AVTAggregateCacheableResource *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [AVTAggregateCacheableResource alloc];
  -[AVTUIStickerRenderer cacheableResourceItem](self, "cacheableResourceItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AVTAggregateCacheableResource initWithCacheableResources:](v14, "initWithCacheableResources:", v16);
  -[AVTUIStickerRenderer providerForResource:forScope:queue:renderingHandler:](self, "providerForResource:forScope:queue:renderingHandler:", v17, v12, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)providerForResource:(id)a3 forScope:(id)a4 queue:(id)a5 renderingHandler:(id)a6
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
  v20[2] = __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke;
  v20[3] = &unk_1EA51E380;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = (void *)objc_msgSend(v20, "copy");

  return v18;
}

id __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = a3 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "resourceExistsInCacheForItem:scope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_2;
  v18[3] = &unk_1EA51E358;
  v21 = v9;
  v20 = v5;
  v18[4] = v10;
  v19 = v12;
  v15 = v5;
  objc_msgSend(v10, "scheduledTaskForItem:scope:queue:renderingHandler:resourceHandler:synchronous:", v11, v12, v13, v14, v18, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v5 = 1;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v5 = *(_BYTE *)(a1 + 56) != 0;
    }
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_3;
    v8[3] = &unk_1EA51E330;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "saveImageForResource:forScope:synchronous:completionHandler:", v3, v7, v5, v8);

  }
}

uint64_t __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveImageForResource:(id)a3 forScope:(id)a4 synchronous:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, id);
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  void (**v22)(id, id);
  _QWORD v23[5];
  id v24;
  id v25;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a6;
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke;
  v23[3] = &unk_1EA51D5C0;
  v23[4] = self;
  v14 = v10;
  v24 = v14;
  v15 = v11;
  v25 = v15;
  v16 = MEMORY[0x1DF0D0754](v23);
  v17 = (void *)v16;
  if (v7)
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
    v12[2](v12, v14);
  }
  else
  {
    -[AVTUIStickerRenderer encodingQueue](self, "encodingQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_2;
    block[3] = &unk_1EA51E3A8;
    v21 = v17;
    block[4] = self;
    v22 = v12;
    v20 = v14;
    dispatch_async(v18, block);

  }
}

void __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "imageStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheableResourceItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "clippingRect");
    v10 = 0;
    objc_msgSend(v4, "saveImage:forItem:scope:clippingRect:error:", v5, v3, v6, &v10);
    v7 = v10;

    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceURLForItem:scope:", v3, *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setURL:", v9);
  }
}

void __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_3;
  v3[3] = &unk_1EA51D058;
  v5 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

uint64_t __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)renderStickerResourceForItem:(id)a3 scope:(id)a4 configuration:(id)a5 correctClipping:(BOOL)a6
{
  return -[AVTUIStickerRenderer renderStickerResourceForItem:scope:stickerConfiguration:avatarConfiguration:correctClipping:](self, "renderStickerResourceForItem:scope:stickerConfiguration:avatarConfiguration:correctClipping:", a3, a4, a5, 0, a6);
}

- (id)renderStickerResourceForItem:(id)a3 scope:(id)a4 stickerConfiguration:(id)a5 avatarConfiguration:(id)a6 correctClipping:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  AVTStickerResource *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  dispatch_semaphore_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  dispatch_time_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  NSObject *v65;
  uint64_t *v66;
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t *v72;
  uint64_t *v73;
  BOOL v74;
  id obj;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;

  v59 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v62 = a6;
  -[AVTUIStickerRenderer imageStore](self, "imageStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resourceURLForItem:scope:", v11, v12);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stickerPack");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0D006D0];
  v17 = v15 == (void *)*MEMORY[0x1E0D006D0];

  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__8;
  v86 = __Block_byref_object_dispose__8;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__8;
  v80 = __Block_byref_object_dispose__8;
  v81 = 0;
  -[AVTUIStickerRenderer imageStore](self, "imageStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id *)(v77 + 5);
  obj = (id)v77[5];
  objc_msgSend(v18, "imageForItem:scope:error:", v11, v12, &obj);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v19, obj);

  if (v20)
  {
    -[AVTUIStickerRenderer imageStore](self, "imageStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resourceClippingRectForItem:scope:", v11, v12);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v30 = -[AVTStickerResource initWithImage:URL:clippingRect:]([AVTStickerResource alloc], "initWithImage:URL:clippingRect:", v20, v63, v23, v25, v27, v29);
    v31 = (void *)v83[5];
    v83[5] = (uint64_t)v30;

    objc_msgSend((id)v83[5], "setPrereleaseSticker:", v15 == v16);
  }
  else
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke;
    v67[3] = &unk_1EA51E3D0;
    v67[4] = self;
    v72 = &v82;
    v74 = v17;
    v68 = v11;
    v69 = v12;
    v73 = &v76;
    v70 = v63;
    v32 = v13;
    v71 = v32;
    v58 = (void *)MEMORY[0x1DF0D0754](v67);
    -[AVTUIStickerRenderer stickerGeneratorPool](self, "stickerGeneratorPool");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIStickerRenderer avatarRecord](self, "avatarRecord");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dequeueStickerGeneratorForAvatarRecord:needAvatar:", v34, objc_msgSend(v32, "preRendered") ^ 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTUIStickerRenderer avatar](self, "avatar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62 && v35)
    {
      -[AVTUIStickerRenderer avatar](self, "avatar");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "applyToAvatar:animated:", v36, 0);

      -[AVTUIStickerRenderer avatar](self, "avatar");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setAvatar:", v37);

    }
    objc_msgSend(v61, "setAsync:", 0);
    if (v61)
    {
      -[AVTUIStickerRenderer logger](self, "logger");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTUIStickerRenderer avatarRecord](self, "avatarRecord");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "description");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "logRenderingStickerStart:forRecord:", v39, v41);

      objc_msgSend(MEMORY[0x1E0D006A0], "defaultOptions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setCorrectClipping:", v59);
      if (-[AVTUIStickerRenderer usingService](self, "usingService"))
      {
        -[AVTUIStickerRenderer environment](self, "environment");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "remoteRenderer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v42;

        v44 = dispatch_semaphore_create(0);
        -[AVTUIStickerRenderer avatarRecord](self, "avatarRecord");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stickerPack");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v83[5];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke_2;
        v64[3] = &unk_1EA51E3F8;
        v66 = &v82;
        v48 = v44;
        v65 = v48;
        objc_msgSend(v57, "getStickerAndCacheForAvatarRecord:withStickerPackName:stickerConfigurationName:resource:withReply:", v60, v45, v46, v47, v64);

        v49 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v48, v49))
        {
          -[AVTUIStickerRenderer logger](self, "logger");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logTimedOutWaitingForSnapshotInService:", v51);

        }
        if (!v83[5])
        {
          -[AVTUIStickerRenderer logger](self, "logger");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "logFailedToGenerateStickerInService:", v53);

        }
        v42 = v56;
      }
      else
      {
        objc_msgSend(v61, "stickerImageWithConfiguration:options:completionHandler:", v32, v42, v58);
      }

    }
  }
  v54 = (id)v83[5];

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  return v54;
}

void __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  void *v15;
  AVTStickerResource *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id obj;

  v13 = a2;
  v14 = a3;
  if (!v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logNilImageReturnedFromAVTUIStickerRenderer");

  }
  v16 = -[AVTStickerResource initWithImage:URL:clippingRect:]([AVTStickerResource alloc], "initWithImage:URL:clippingRect:", v13, 0, a4, a5, a6, a7);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPrereleaseSticker:", *(unsigned __int8 *)(a1 + 88));
  if ((objc_msgSend(*(id *)(a1 + 32), "parallelizeEncoding") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "clippingRect");
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      obj = *(id *)(v23 + 40);
      objc_msgSend(v20, "saveImage:forItem:scope:clippingRect:error:", v13, v21, v22, &obj);
      objc_storeStrong((id *)(v23 + 40), obj);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setURL:", *(_QWORD *)(a1 + 56));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "logRenderingStickerEnd:", v25);

}

void __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3
{
  return -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:correctClipping:](self, "scheduledStickerResourceProviderForStickerConfiguration:correctClipping:", a3, 1);
}

- (id)_scheduledTaskForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderWithCompletionHandler:(id)a6 resourceHandler:(id)a7 synchronous:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[AVTUIStickerRenderer cache](self, "cache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissWithCompletionHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissWithCompletionHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v19, v14, v15, 0, v17, 0, 0, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AVTUIStickerRenderer renderingScheduler](self, "renderingScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIStickerRenderer callbackQueue](self, "callbackQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissWithCompletionHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissWithCompletionHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v19, v14, v15, 0, v17, v16, v21, v22, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)_providerForResource:(id)a3 forScope:(id)a4 queue:(id)a5 renderWithCompletionHandler:(id)a6
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
  v20[2] = __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke;
  v20[3] = &unk_1EA51E380;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = (void *)objc_msgSend(v20, "copy");

  return v18;
}

id __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = a3 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "resourceExistsInCacheForItem:scope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1EA51E358;
  v21 = v9;
  v20 = v5;
  v18[4] = v10;
  v19 = v12;
  v15 = v5;
  objc_msgSend(v10, "_scheduledTaskForItem:scope:queue:renderWithCompletionHandler:resourceHandler:synchronous:", v11, v12, v13, v14, v18, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "image"), (v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = (void *)v5,
        objc_msgSend(v4, "URL"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v8 = 1;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v8 = *(_BYTE *)(a1 + 56) != 0;
    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1EA51E330;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "saveImageForResource:forScope:synchronous:completionHandler:", v4, v10, v8, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_providerForResourceForScope:(id)a3 queue:(id)a4 renderWithCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTUIStickerRenderer cacheableResourceItem](self, "cacheableResourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStickerRenderer _providerForResource:forScope:queue:renderWithCompletionHandler:](self, "_providerForResource:forScope:queue:renderWithCompletionHandler:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_scheduledRemoteImageRendererProviderForStickerConfiguration:(id)a3 correctClipping:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  AVTUIStickerRenderer *v12;

  v5 = a3;
  -[AVTUIStickerRenderer renderingQueue](self, "renderingQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke;
  v10[3] = &unk_1EA51E448;
  v11 = v5;
  v12 = self;
  v7 = v5;
  -[AVTUIStickerRenderer _providerForResourceForScope:queue:renderWithCompletionHandler:](self, "_providerForResourceForScope:queue:renderWithCompletionHandler:", v7, v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  AVTStickerResource *v27;
  _BOOL8 v28;
  AVTStickerResource *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  int8x16_t v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  int8x16_t v40;
  id v41;
  id v42;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "stickerPack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D006D0];

  objc_msgSend(*(id *)(a1 + 40), "imageStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceURLForItem:scope:", v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "imageStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v14, "imageForItem:scope:error:", v7, v8, &v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v42;

  if (!v15 || v16)
  {
    v28 = v10 == v11;
    v29 = [AVTStickerResource alloc];
    v27 = -[AVTStickerResource initWithImage:URL:clippingRect:](v29, "initWithImage:URL:clippingRect:", 0, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[AVTStickerResource setPrereleaseSticker:](v27, "setPrereleaseSticker:", v28);
    objc_msgSend(*(id *)(a1 + 40), "environment");
    v38 = v13;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "remoteRenderer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "avatarRecord");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stickerPack");
    v32 = v9;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke_2;
    v39[3] = &unk_1EA51E420;
    v36 = *(int8x16_t *)(a1 + 32);
    v35 = (id)v36.i64[0];
    v40 = vextq_s8(v36, v36, 8uLL);
    v41 = v32;
    objc_msgSend(v37, "getStickerAndCacheForAvatarRecord:withStickerPackName:stickerConfigurationName:resource:withReply:", v31, v33, v34, v27, v39);

    v9 = v32;
    v13 = v38;

    v16 = v37;
  }
  else
  {
    v17 = v10 == v11;
    objc_msgSend(*(id *)(a1 + 40), "imageStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resourceClippingRectForItem:scope:", v7, v8);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27 = -[AVTStickerResource initWithImage:URL:clippingRect:]([AVTStickerResource alloc], "initWithImage:URL:clippingRect:", v15, v13, v20, v22, v24, v26);
    -[AVTStickerResource setPrereleaseSticker:](v27, "setPrereleaseSticker:", v17);
    (*((void (**)(id, AVTStickerResource *))v9 + 2))(v9, v27);
  }

}

void __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logFailedToGenerateStickerInService:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3 usingService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[AVTUIStickerRenderer setUsingService:](self, "setUsingService:", v4);
  if (v4)
    -[AVTUIStickerRenderer _scheduledRemoteImageRendererProviderForStickerConfiguration:correctClipping:](self, "_scheduledRemoteImageRendererProviderForStickerConfiguration:correctClipping:", v6, 1);
  else
    -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:correctClipping:](self, "scheduledStickerResourceProviderForStickerConfiguration:correctClipping:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3 correctClipping:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[AVTUIStickerRenderer renderingQueue](self, "renderingQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__AVTUIStickerRenderer_scheduledStickerResourceProviderForStickerConfiguration_correctClipping___block_invoke;
  v11[3] = &unk_1EA51E470;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  -[AVTUIStickerRenderer providerForResourceForScope:queue:renderingHandler:](self, "providerForResourceForScope:queue:renderingHandler:", v8, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __96__AVTUIStickerRenderer_scheduledStickerResourceProviderForStickerConfiguration_correctClipping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderStickerResourceForItem:scope:configuration:correctClipping:", a2, a3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (id)scheduledStickerResourceProviderForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 avatarConfiguration:(id)a5 stickerConfiguration:(id)a6
{
  return -[AVTUIStickerRenderer scheduledStickerResourceProviderForThumbnailForModelPreset:presetOverrides:avatarConfiguration:stickerConfiguration:correctClipping:](self, "scheduledStickerResourceProviderForThumbnailForModelPreset:presetOverrides:avatarConfiguration:stickerConfiguration:correctClipping:", a3, a4, a5, a6, 1);
}

- (id)scheduledStickerResourceProviderForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 avatarConfiguration:(id)a5 stickerConfiguration:(id)a6 correctClipping:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  BOOL v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[AVTUIStickerRenderer avatar](self, "avatar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[AVTPresetImageProvider configurationToRenderForPreset:overrides:baseConfiguration:](AVTPresetImageProvider, "configurationToRenderForPreset:overrides:baseConfiguration:", v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIStickerRenderer renderingQueue](self, "renderingQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __156__AVTUIStickerRenderer_scheduledStickerResourceProviderForThumbnailForModelPreset_presetOverrides_avatarConfiguration_stickerConfiguration_correctClipping___block_invoke;
    v22[3] = &unk_1EA51E498;
    v22[4] = self;
    v23 = v15;
    v24 = v17;
    v25 = a7;
    v19 = v17;
    -[AVTUIStickerRenderer providerForResourceWithAvatarConfiguration:forScope:queue:renderingHandler:](self, "providerForResourceWithAvatarConfiguration:forScope:queue:renderingHandler:", v19, v23, v18, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __156__AVTUIStickerRenderer_scheduledStickerResourceProviderForThumbnailForModelPreset_presetOverrides_avatarConfiguration_stickerConfiguration_correctClipping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderStickerResourceForItem:scope:stickerConfiguration:avatarConfiguration:correctClipping:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)stopUsingResources
{
  void *v3;
  id v4;

  -[AVTUIStickerRenderer stickerGeneratorPool](self, "stickerGeneratorPool");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTUIStickerRenderer avatarRecord](self, "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStopUsingStickerGeneratorForRecord:", v3);

}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTStickerTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTMemoji)avatar
{
  return self->_avatar;
}

- (AVTCacheableResource)cacheableResourceItem
{
  return self->_cacheableResourceItem;
}

- (AVTUIStickerGeneratorPool)stickerGeneratorPool
{
  return self->_stickerGeneratorPool;
}

- (BOOL)parallelizeEncoding
{
  return self->_parallelizeEncoding;
}

- (void)setParallelizeEncoding:(BOOL)a3
{
  self->_parallelizeEncoding = a3;
}

- (BOOL)usingService
{
  return self->_usingService;
}

- (void)setUsingService:(BOOL)a3
{
  self->_usingService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerGeneratorPool, 0);
  objc_storeStrong((id *)&self->_cacheableResourceItem, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
