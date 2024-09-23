@implementation MKPlaceCollectionsPublisherIconManager

+ (id)sharedInstance
{
  if (qword_1ECE2DD70 != -1)
    dispatch_once(&qword_1ECE2DD70, &__block_literal_global_93);
  return (id)_MergedGlobals_166;
}

void __56__MKPlaceCollectionsPublisherIconManager_sharedInstance__block_invoke()
{
  MKPlaceCollectionsPublisherIconManager *v0;
  void *v1;

  v0 = objc_alloc_init(MKPlaceCollectionsPublisherIconManager);
  v1 = (void *)_MergedGlobals_166;
  _MergedGlobals_166 = (uint64_t)v0;

}

- (MKPlaceCollectionsPublisherIconManager)init
{
  MKPlaceCollectionsPublisherIconManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *publisherLogoImageQueue;
  NSCache *v6;
  NSCache *publisherIconCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKPlaceCollectionsPublisherIconManager;
  v2 = -[MKPlaceCollectionsPublisherIconManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MapKit.MKPlaceCollectionsPublisherIconManager", v3);
    publisherLogoImageQueue = v2->_publisherLogoImageQueue;
    v2->_publisherLogoImageQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    publisherIconCache = v2->_publisherIconCache;
    v2->_publisherIconCache = v6;

    -[NSCache setDelegate:](v2->_publisherIconCache, "setDelegate:", v2);
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_publisherIconCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setCountLimit:](v2->_publisherIconCache, "setCountLimit:", 50);
  }
  return v2;
}

- (void)iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 contentScale:(double)a5 onCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *publisherLogoImageQueue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  unsigned int v19;
  id location;

  v10 = a3;
  v11 = a6;
  objc_initWeak(&location, self);
  publisherLogoImageQueue = self->_publisherLogoImageQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_contentScale_onCompletion___block_invoke;
  v15[3] = &unk_1E20DF2A8;
  objc_copyWeak(v18, &location);
  v19 = a4;
  v18[1] = *(id *)&a5;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(publisherLogoImageQueue, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __98__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_contentScale_onCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_iconForPublisherNamed:usingId:usingContentScale:usingSizeGroup:isNightMode:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), 1, 0, *(double *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 usingContentScale:(double)a5 usingSizeGroup:(unint64_t)a6 isNightMode:(BOOL)a7
{
  id v12;
  NSObject *publisherLogoImageQueue;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  uint64_t *v19;
  id v20[3];
  unsigned int v21;
  BOOL v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v12 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__21;
  v28 = __Block_byref_object_dispose__21;
  v29 = 0;
  objc_initWeak(&location, self);
  publisherLogoImageQueue = self->_publisherLogoImageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_usingContentScale_usingSizeGroup_isNightMode___block_invoke;
  block[3] = &unk_1E20DF2D0;
  v19 = &v24;
  objc_copyWeak(v20, &location);
  v18 = v12;
  v21 = a4;
  v20[1] = *(id *)&a5;
  v20[2] = (id)a6;
  v22 = a7;
  v14 = v12;
  dispatch_sync(publisherLogoImageQueue, block);
  v15 = (id)v25[5];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __117__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_usingContentScale_usingSizeGroup_isNightMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_iconForPublisherNamed:usingId:usingContentScale:usingSizeGroup:isNightMode:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 76), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 usingContentScale:(double)a5 usingSizeGroup:(unint64_t)a6 isNightMode:(BOOL)a7
{
  uint64_t v9;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v9 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logo: %d. Size:%lu"), v9, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_publisherIconCache, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MKGetCuratedCollectionsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(v13, "publisherImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_DEBUG, "[✔]Publisher Icon Cache Hit. Returning image:%@", buf, 0xCu);

    }
    objc_msgSend(v13, "publisherImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_DEBUG, "[X]Publisher Icon Cache Miss. Fetching image from icon pack.", buf, 2u);
    }

    +[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", v9, a6, 0, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityLabel:", v11);
    v20 = -[MKPublisherIcon initUsingName:andImage:]([MKPublisherIcon alloc], "initUsingName:andImage:", v11, v19);
    MKGetCuratedCollectionsLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v20, "publisherImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_18B0B0000, v21, OS_LOG_TYPE_DEBUG, "[✔]Publisher Icon Cache Updated. Returning image:%@", buf, 0xCu);

    }
    -[MKPlaceCollectionsPublisherIconManager publisherIconCache](self, "publisherIconCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v20, v12);

    objc_msgSend(v20, "publisherImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  MKGetCuratedCollectionsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "[!]Publisher Cache is evicting: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (NSCache)publisherIconCache
{
  return self->_publisherIconCache;
}

- (void)setPublisherIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_publisherIconCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIconCache, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageQueue, 0);
}

@end
