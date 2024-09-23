@implementation _MPArtworkDataSourceURLCache

- (void)setRepresentationSize:(CGSize)a3 forRequest:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *accessQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  CGFloat v12;
  CGFloat v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65___MPArtworkDataSourceURLCache_setRepresentationSize_forRequest___block_invoke;
  v10[3] = &unk_1E3162218;
  v12 = width;
  v13 = height;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_barrier_async(accessQueue, v10);

}

- (_MPArtworkDataSourceURLCache)initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4 diskPath:(id)a5
{
  _MPArtworkDataSourceURLCache *v5;
  uint64_t v6;
  NSMapTable *requestSizeMap;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MPArtworkDataSourceURLCache;
  v5 = -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:](&v11, sel_initWithMemoryCapacity_diskCapacity_diskPath_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    requestSizeMap = v5->_requestSizeMap;
    v5->_requestSizeMap = (NSMapTable *)v6;

    v8 = dispatch_queue_create("com.apple.mediaplayer.MPArtworkDataSourceURLCache.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *accessQueue;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__18398;
  v29 = __Block_byref_object_dispose__18399;
  v30 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___MPArtworkDataSourceURLCache_storeCachedResponse_forRequest___block_invoke;
  block[3] = &unk_1E31635A8;
  v24 = &v25;
  block[4] = self;
  v14 = v7;
  v23 = v14;
  dispatch_sync(accessQueue, block);
  if (!objc_msgSend((id)v26[5], "length"))
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v14;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "[MPArtwork] Asked to cache response for %{public}@, but no size was set.", buf, 0xCu);
    }

    v16 = (void *)v26[5];
    v26[5] = (uint64_t)CFSTR("{-1,-1}");

  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v26[5], CFSTR("representationSize"));
  v17 = objc_alloc(MEMORY[0x1E0CB34F0]);
  objc_msgSend(v6, "response");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithResponse:data:userInfo:storagePolicy:", v18, v19, v12, 0);

  v21.receiver = self;
  v21.super_class = (Class)_MPArtworkDataSourceURLCache;
  -[NSURLCache storeCachedResponse:forRequest:](&v21, sel_storeCachedResponse_forRequest_, v20, v14);

  _Block_object_dispose(&v25, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_requestSizeMap, 0);
}

@end
