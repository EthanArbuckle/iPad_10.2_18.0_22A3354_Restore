@implementation MURouteSnapshotManager

+ (id)cacheDirectory
{
  if (_MergedGlobals_119 != -1)
    dispatch_once(&_MergedGlobals_119, &__block_literal_global_14);
  return (id)qword_1ED01B578;
}

void __40__MURouteSnapshotManager_cacheDirectory__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 13, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("RouteSnapshots"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteURL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED01B578;
  qword_1ED01B578 = v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED01B578, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", qword_1ED01B578, 0, 0, 0);

  }
}

+ (id)sharedInstance
{
  if (qword_1ED01B580 != -1)
    dispatch_once(&qword_1ED01B580, &__block_literal_global_8);
  return (id)qword_1ED01B588;
}

void __40__MURouteSnapshotManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED01B588;
  qword_1ED01B588 = v0;

}

- (MURouteSnapshotManager)init
{
  MURouteSnapshotManager *v2;
  uint64_t v3;
  NSCache *cache;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  uint64_t v8;
  NSMutableArray *pendingSnapshotters;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MURouteSnapshotManager;
  v2 = -[MURouteSnapshotManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.MapsUI.MURouteSnapshotManager.work", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    pendingSnapshotters = v2->_pendingSnapshotters;
    v2->_pendingSnapshotters = (NSMutableArray *)v8;

  }
  return v2;
}

- (void)getSnapshotForKey:(id)a3 route:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *workQueue;
  _QWORD block[4];
  id v13;
  MURouteSnapshotManager *v14;
  id v15;
  void (**v16)(id, _QWORD);
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v19[5])
  {
    v10[2](v10, 0);
  }
  else
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke;
    block[3] = &unk_1E2E025A8;
    v17 = &v18;
    v13 = v8;
    v14 = self;
    v16 = v10;
    v15 = v9;
    dispatch_async(workQueue, block);

  }
  _Block_object_dispose(&v18, 8);

}

void __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint64_t v25;

  +[MURouteSnapshotManager cacheDirectory](MURouteSnapshotManager, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsAtPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  v8 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v8, "imageWithData:scale:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v12, *(_QWORD *)(a1 + 32));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_2;
    block[3] = &unk_1E2E02530;
    v13 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    v24 = v13;
    v25 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v15 = v24;
  }
  else
  {
LABEL_4:
    v17 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_3;
    v19[3] = &unk_1E2E02580;
    v19[4] = v17;
    v20 = v18;
    v21 = v4;
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v17, "_generateSnapshotForRoute:key:completion:", v16, v20, v19);

    v15 = v20;
  }

}

uint64_t __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  UIImage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  UIImage *v20;
  id v21;
  _QWORD block[4];
  id v23;
  UIImage *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v6)
  {
    objc_msgSend(v7, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createFileAtPath:contents:attributes:", v9, v10, 0);

    MUGetMURouteSnapshotManagerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      v13 = "got snapshot for key: %@";
      v14 = v11;
      v15 = OS_LOG_TYPE_INFO;
      v16 = 12;
LABEL_6:
      _os_log_impl(&dword_191DB8000, v14, v15, v13, buf, v16);
    }
  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

    MUGetMURouteSnapshotManagerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v27 = v18;
      v28 = 2114;
      v29 = v5;
      v13 = "Failed to generate image for key: %@, with error %{public}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 22;
      goto LABEL_6;
    }
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_14;
  block[3] = &unk_1E2E02558;
  v19 = *(id *)(a1 + 56);
  v24 = v6;
  v25 = v19;
  v23 = v5;
  v20 = v6;
  v21 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_14(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_optionsFromKey:(id)a3 route:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[3];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v5 = a4;
  v6 = a3;
  _MKCartographicConfigurationForMapType();
  memset(v31, 0, sizeof(v31));
  v32 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1A10]), "initWithCartographicConfiguration:", v31);
  objc_msgSend(v7, "setShowsHiking:", 1);
  objc_msgSend(v7, "setShowsTopographicFeatures:", 1);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPreferredConfiguration:", v7);
  objc_msgSend(v6, "width");
  v10 = v9;
  objc_msgSend(v6, "height");
  objc_msgSend(v8, "setSize:", v10, v11);
  objc_msgSend(v8, "_setComposedRouteForRouteLine:", v5);
  objc_msgSend(v5, "boundingMapRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  GEOMapRectForMapRegion();
  objc_msgSend(v8, "size");
  objc_msgSend(v6, "padding");
  v29 = v13;
  v30 = v14;
  v27 = v15;
  v28 = v16;
  _MKMapRectThatFits();
  objc_msgSend(v8, "setMapRect:", v27, v28, v29, v30);

  objc_msgSend(MEMORY[0x1E0CC1910], "filterExcludingAllCategories");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPointOfInterestFilter:", v17);

  objc_msgSend(v8, "_setShowsPointLabels:", 0);
  objc_msgSend(v8, "_setShowsAppleLogo:", 0);
  if (objc_msgSend(v6, "darkMode"))
    v18 = 2;
  else
    v18 = 1;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v19;
  v20 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(v6, "scale");
  v22 = v21;

  objc_msgSend(v20, "traitCollectionWithDisplayScale:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraitsFromCollections:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTraitCollection:", v25);

  return v8;
}

- (void)_generateSnapshotForRoute:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke;
  v14[3] = &unk_1E2E02620;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_optionsFromKey:route:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v3);
  MUGetMURouteSnapshotManagerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_INFO, "starting snapshot request for key: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_22;
  v8[3] = &unk_1E2E025F8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v7, "startWithCompletionHandler:", v8);

}

void __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_2;
  block[3] = &unk_1E2E025D0;
  v8 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v18 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, block);

}

void __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_3;
  v7[3] = &unk_1E2E01730;
  v6 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)checkCacheForKey:(id)a3
{
  return -[NSCache objectForKey:](self->_cache, "objectForKey:", a3);
}

- (void)purgeSnapshotsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  MUGetMURouteSnapshotManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "purging snapshots!", buf, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableArray removeAllObjects](self->_pendingSnapshotters, "removeAllObjects");
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MURouteSnapshotManager_purgeSnapshotsWithCompletionBlock___block_invoke;
  v8[3] = &unk_1E2E02648;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_barrier_async(workQueue, v8);

}

void __60__MURouteSnapshotManager_purgeSnapshotsWithCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MUGetMURouteSnapshotManagerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_INFO, "removing in-memory snapshots", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  MUGetMURouteSnapshotManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_INFO, "removing on-disk snapshots", buf, 2u);
  }

  +[MURouteSnapshotManager cacheDirectory](MURouteSnapshotManager, "cacheDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "removeItemAtURL:error:", v4, &v14);
  v6 = v14;

  MUGetMURouteSnapshotManagerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "re-creating on-disk snapshots directory, deleteError: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 0, 0, &v13);
  v9 = v13;

  MUGetMURouteSnapshotManagerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_INFO, "completed snapshot purge, createError: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("MURouteSnapshotManagerDidPurgeNotification"), *(_QWORD *)(a1 + 32));

  v12 = *(void **)(a1 + 40);
  if (v12)
    dispatch_async(MEMORY[0x1E0C80D38], v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSnapshotters, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
