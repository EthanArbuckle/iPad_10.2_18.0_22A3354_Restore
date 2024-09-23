@implementation MPTiledArtworkDataSource

- (MPTiledArtworkDataSource)init
{
  MPTiledArtworkDataSource *v2;
  NSOperationQueue *v3;
  NSOperationQueue *tilingArtworkCatalogOperationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *loadingTiledArtworkRequestsAccessQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *renderingTiledArtworkRequestsQueue;
  NSCache *v9;
  NSCache *tiledArtworkRepresentationFallbackCache;
  NSCountedSet *v11;
  NSCountedSet *loadingTiledArtworkRequests;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPTiledArtworkDataSource;
  v2 = -[MPTiledArtworkDataSource init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    tilingArtworkCatalogOperationQueue = v2->_tilingArtworkCatalogOperationQueue;
    v2->_tilingArtworkCatalogOperationQueue = v3;

    -[NSOperationQueue setName:](v2->_tilingArtworkCatalogOperationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPTiledArtworkDataSource.TilingArtworkCatalogOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_tilingArtworkCatalogOperationQueue, "setMaxConcurrentOperationCount:", 5);
    v5 = dispatch_queue_create("com.apple.MediaPlayer.MPTiledArtworkDataSource.LoadingTiledArtworkRequestsQueue", 0);
    loadingTiledArtworkRequestsAccessQueue = v2->_loadingTiledArtworkRequestsAccessQueue;
    v2->_loadingTiledArtworkRequestsAccessQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPTiledArtworkDataSource.RenderingTiledArtworkRequestsQueue", 0);
    renderingTiledArtworkRequestsQueue = v2->_renderingTiledArtworkRequestsQueue;
    v2->_renderingTiledArtworkRequestsQueue = (OS_dispatch_queue *)v7;

    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    tiledArtworkRepresentationFallbackCache = v2->_tiledArtworkRepresentationFallbackCache;
    v2->_tiledArtworkRepresentationFallbackCache = v9;

    -[NSCache setCountLimit:](v2->_tiledArtworkRepresentationFallbackCache, "setCountLimit:", 50);
    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    loadingTiledArtworkRequests = v2->_loadingTiledArtworkRequests;
    v2->_loadingTiledArtworkRequests = v11;

  }
  return v2;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "representationSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "scaledFittingSize");
  v12 = v11;
  v14 = v13;
  MSVGetMaximumScreenSize();
  if (v15 < v16)
    v15 = v16;
  v17 = (double)(unint64_t)(uint64_t)v15;
  if (v12 >= v17)
    v18 = v17;
  else
    v18 = v12;
  if (vabdd_f64(v8, v18) >= 0.00000011920929)
    goto LABEL_12;
  if (v14 < v17)
    v17 = v14;
  if (vabdd_f64(v10, v17) >= 0.00000011920929)
  {
LABEL_12:
    v23 = 0;
  }
  else
  {
    objc_msgSend(v6, "token");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "revisionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v5, "representationToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "revisionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqual:", v20);

    }
    else
    {
      v23 = 1;
    }

  }
  return v23;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  NSCache *v5;
  NSCache *tiledArtworkRepresentationFallbackCache;
  NSCache *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "cache");
  v5 = (NSCache *)objc_claimAutoreleasedReturnValue();
  tiledArtworkRepresentationFallbackCache = v5;
  if (!v5)
    tiledArtworkRepresentationFallbackCache = self->_tiledArtworkRepresentationFallbackCache;
  v7 = tiledArtworkRepresentationFallbackCache;

  objc_msgSend((id)objc_opt_class(), "_representationCacheKeyForArtworkCatalog:forAnyRevision:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[NSCache objectForKey:](v7, "objectForKey:", v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "_representationCacheKeyForArtworkCatalog:forAnyRevision:", v4, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](v7, "objectForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__MPTiledArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MPTiledArtworkDataSource _performSyncBlock:](self, "_performSyncBlock:", v6);

}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSOperationQueue *tilingArtworkCatalogOperationQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v41 = objc_msgSend(v8, "numberOfRows");
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v37 = objc_msgSend(v8, "numberOfColumns");
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v33 = v35[3] * v39[3];
  objc_msgSend(v8, "revisionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tileSpacing");
  v11 = v10;
  if (!v31[3])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Tiled artwork count cannot be 0."));
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v28[3] = &unk_1E31635F8;
  v28[4] = self;
  v13 = v6;
  v29 = v13;
  -[MPTiledArtworkDataSource _performSyncBlock:](self, "_performSyncBlock:", v28);
  tilingArtworkCatalogOperationQueue = self->_tilingArtworkCatalogOperationQueue;
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  v19[3] = &unk_1E3153910;
  v19[4] = self;
  v15 = v13;
  v20 = v15;
  v16 = v7;
  v23 = v16;
  v17 = v8;
  v21 = v17;
  v24 = &v30;
  v25 = &v38;
  v26 = &v34;
  v18 = v9;
  v22 = v18;
  v27 = v11;
  -[NSOperationQueue addOperationWithBlock:](tilingArtworkCatalogOperationQueue, "addOperationWithBlock:", v19);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  void *v3;
  MPTiledArtworkRepresentationCacheKey *v4;
  MPTiledArtworkRepresentationCacheKey *v5;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MPTiledArtworkRepresentationCacheKey alloc];
  v5 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:](v4, "initWithTiledArtworkRequest:scaledFittingSize:", v3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  return v5;
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  if (a3 == 1)
  {
    objc_msgSend(a4, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasExistingArtworkCatalogsWithCount:", 1))
    {
      objc_msgSend(v8, "existingArtworkCatalogsWithCount:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "existingArtworkEffectResultForEffectType:catalog:options:", 1, v10, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSOperationQueue *tilingArtworkCatalogOperationQueue;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (a3 == 1)
  {
    objc_msgSend(v12, "token");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke;
    v31[3] = &unk_1E31635F8;
    v31[4] = self;
    v19 = v12;
    v32 = v19;
    -[MPTiledArtworkDataSource _performSyncBlock:](self, "_performSyncBlock:", v31);
    tilingArtworkCatalogOperationQueue = self->_tilingArtworkCatalogOperationQueue;
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_2;
    v24[3] = &unk_1E3153938;
    v24[4] = self;
    v25 = v19;
    v26 = v17;
    v30 = 1;
    v27 = v13;
    v28 = v14;
    v29 = v16;
    v21 = v17;
    -[NSOperationQueue addOperationWithBlock:](tilingArtworkCatalogOperationQueue, "addOperationWithBlock:", v24);

  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_5;
    v22[3] = &unk_1E3155A68;
    v23 = v15;
    (*((void (**)(id, _QWORD *))v14 + 2))(v14, v22);
    v21 = v23;
  }

}

- (void)_addLoadingRequestForArtworkCatalog:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_loadingRequestForArtworkCatalog:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[NSCountedSet addObject:](self->_loadingTiledArtworkRequests, "addObject:", v5);
}

- (BOOL)_hasLoadingRequestForArtworkCatalog:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_loadingRequestForArtworkCatalog:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[NSCountedSet containsObject:](self->_loadingTiledArtworkRequests, "containsObject:", v5);
  return (char)self;
}

- (void)_performAsyncBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_loadingTiledArtworkRequestsAccessQueue, a3);
}

- (void)_performSyncBlock:(id)a3
{
  void (**block)(void);

  block = (void (**)(void))a3;
  if (dispatch_get_specific((const void *)_MPTiledArtworkDataSourceQueueSpecificIsAccessQueue))
  {
    if (block)
      block[2]();
  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_loadingTiledArtworkRequestsAccessQueue, block);
  }

}

- (void)_removeLoadingRequestForArtworkCatalog:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_loadingRequestForArtworkCatalog:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[NSCountedSet removeObject:](self->_loadingTiledArtworkRequests, "removeObject:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilingArtworkCatalogOperationQueue, 0);
  objc_storeStrong((id *)&self->_tiledArtworkRepresentationFallbackCache, 0);
  objc_storeStrong((id *)&self->_renderingTiledArtworkRequestsQueue, 0);
  objc_storeStrong((id *)&self->_loadingTiledArtworkRequestsAccessQueue, 0);
  objc_storeStrong((id *)&self->_loadingTiledArtworkRequests, 0);
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
}

void __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_3;
  v10[3] = &unk_1E31635A8;
  v3 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v13 = &v14;
  objc_msgSend(v11, "_performSyncBlock:", v10);
  if (!*((_BYTE *)v15 + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "artworkCatalogsWithCount:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "loadArtworkEffectResultForEffectType:catalog:options:systemEffectHandler:completionHandler:", *(_QWORD *)(a1 + 80), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    }
    else
    {
      v8[0] = v2;
      v8[1] = 3221225472;
      v8[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_4;
      v8[3] = &unk_1E3155A68;
      v7 = *(_QWORD *)(a1 + 64);
      v9 = *(id *)(a1 + 72);
      (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);

    }
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hasLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result ^ 1;
  if (((result ^ 1) & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_removeLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  MPTiledArtworkRepresentationToken *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  char *v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  NSObject *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  _QWORD v81[4];
  NSObject *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86[2];
  id location;
  _QWORD block[4];
  id v89;
  id v90;
  uint64_t v91;
  _QWORD v92[4];
  id v93;
  id v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;

  v96 = 0;
  v97 = &v96;
  v98 = 0x2020000000;
  v99 = 0;
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3;
  v92[3] = &unk_1E31635A8;
  v2 = *(void **)(a1 + 40);
  v93 = *(id *)(a1 + 32);
  v94 = v2;
  v95 = &v96;
  objc_msgSend(v93, "_performSyncBlock:", v92);
  if (!*((_BYTE *)v97 + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "artworkCatalogsWithCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    if (v4 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      if (!v4)
      {
        objc_msgSend((id)objc_opt_class(), "_errorWithDescription:", CFSTR("No artwork catalogs were found"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_39:

        goto LABEL_40;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 40), "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v7 = v6;

    objc_msgSend((id)objc_opt_class(), "_representationCacheKeyForArtworkCatalog:forAnyRevision:", *(_QWORD *)(a1 + 40), 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v8;
    if (v8)
    {
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject representationToken](v9, "representationToken");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "tileArtworkVisualIdenticalityIdentifiers");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v12 = 0;
          while (1)
          {
            objc_msgSend(v3, "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setRenderHint:", objc_msgSend(*(id *)(a1 + 40), "renderHint"));
            objc_msgSend(v13, "visualIdenticalityIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
              break;
            objc_msgSend(v11, "addObject:", v14);

            if ((unint64_t)++v12 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
              goto LABEL_17;
          }

          v11 = 0;
        }
LABEL_17:
        if (objc_msgSend(v11, "isEqualToArray:", v10))
        {
          objc_msgSend(*(id *)(a1 + 40), "visualIdenticalityIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject representationSize](v9, "representationSize");
          v17 = v16;
          v19 = v18;
          -[NSObject image](v9, "image");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v15, v20, v17, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v61;
          v23 = objc_alloc_init(MPTiledArtworkRepresentationToken);
          -[MPTiledArtworkRepresentationToken setTileArtworkVisualIdenticalityIdentifiers:](v23, "setTileArtworkVisualIdenticalityIdentifiers:", v10);
          -[MPTiledArtworkRepresentationToken setRevisionIdentifier:](v23, "setRevisionIdentifier:", *(_QWORD *)(a1 + 56));
          objc_msgSend(v21, "setRepresentationToken:", v23);
          objc_msgSend((id)objc_opt_class(), "_representationCacheKeyForArtworkCatalog:forAnyRevision:", *(_QWORD *)(a1 + 40), 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v7, "setObject:forKey:", v21, v24);
          objc_msgSend(v7, "setObject:forKey:", v21, v60);
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

          v25 = v60;
LABEL_38:

          goto LABEL_39;
        }

      }
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v28 = dispatch_queue_create("com.apple.MediaPlayer.MPTiledArtworkDataSource.loadingTileDataAccessQueue", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4;
    block[3] = &unk_1E31635A8;
    v91 = *(_QWORD *)(a1 + 72);
    v29 = v26;
    v89 = v29;
    v30 = v27;
    v90 = v30;
    dispatch_sync(v28, block);
    v31 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 40), "destinationScale");
    if (v32 <= 0.00000011920929)
      v33 = 1.0;
    else
      v33 = v32;
    objc_msgSend(*(id *)(a1 + 40), "scaledFittingSize");
    v35 = v34;
    v37 = v36;
    MSVGetMaximumScreenSize();
    if (v38 < v39)
      v38 = v39;
    v40 = (double)(unint64_t)(uint64_t)v38;
    if (v35 >= v40)
      v41 = v40;
    else
      v41 = v35;
    if (v37 >= v40)
      v42 = v40;
    else
      v42 = v37;
    v43 = v41 / v33;
    v44 = v42 / v33;
    objc_msgSend((id)objc_opt_class(), "_tileSizeForFittingSize:rows:columns:spacing:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), v41 / v33, v42 / v33, *(double *)(a1 + 96));
    v47 = v45;
    v48 = v46;
    v58 = v42;
    v59 = v41;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v49 = 0;
      v50 = ceil(v45 * 1.77777778);
      v51 = ceil(v46 * 1.77777778);
      do
      {
        dispatch_group_enter(v31);
        objc_msgSend(v3, "objectAtIndexedSubscript:", v49);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setRenderHint:", objc_msgSend(*(id *)(a1 + 40), "renderHint"));
        objc_msgSend(v52, "setFittingSize:", v50, v51);
        objc_msgSend(v52, "setDestinationScale:", v33);
        objc_initWeak(&location, v52);
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_5;
        v81[3] = &unk_1E3153870;
        objc_copyWeak(v86, &location);
        v82 = v28;
        v83 = v29;
        v86[1] = v49;
        v84 = v30;
        v85 = v31;
        objc_msgSend(v52, "requestImageWithCompletion:", v81);

        objc_destroyWeak(v86);
        objc_destroyWeak(&location);

        ++v49;
      }
      while ((unint64_t)v49 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    }
    v53 = *(_QWORD *)(a1 + 32);
    v54 = *(NSObject **)(v53 + 24);
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_7;
    v62[3] = &unk_1E31538E8;
    v63 = v28;
    v64 = v29;
    v65 = v30;
    v66 = v53;
    v55 = *(id *)(a1 + 64);
    v73 = v33;
    v74 = v43;
    v56 = *(_QWORD *)(a1 + 72);
    v71 = v55;
    v72 = v56;
    v75 = v44;
    v76 = v47;
    v57 = *(_QWORD *)(a1 + 96);
    v77 = v48;
    v78 = v57;
    v67 = *(id *)(a1 + 40);
    v79 = v59;
    v80 = v58;
    v68 = *(id *)(a1 + 56);
    v69 = v7;
    v25 = v60;
    v70 = v60;
    v10 = v30;
    v22 = v29;
    v9 = v28;
    dispatch_group_notify(v31, v54, v62);

    v11 = v89;
    goto LABEL_38;
  }
  objc_msgSend((id)objc_opt_class(), "_errorWithDescription:", CFSTR("Tiling artwork request was cancelled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_40:

  _Block_object_dispose(&v96, 8);
}

uint64_t __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hasLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result ^ 1;
  if (((result ^ 1) & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_removeLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
  return result;
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4(_QWORD *a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v2 = 0;
    do
    {
      v3 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

      v5 = (void *)a1[5];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      ++v2;
    }
    while (v2 < *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  }
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MPTiledArtworkRepresentationToken *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[6];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  _QWORD block[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2337;
  v45 = __Block_byref_object_dispose__2338;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2337;
  v39 = __Block_byref_object_dispose__2338;
  v40 = 0;
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_20;
  block[3] = &unk_1E3158C68;
  v33 = &v41;
  v3 = *(NSObject **)(a1 + 32);
  v31 = *(id *)(a1 + 40);
  v34 = &v35;
  v32 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);
  v4 = (void *)v42[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend((id)objc_opt_class(), "_errorWithDescription:", CFSTR("Artwork catalogs found, but at least one had an empty image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOpaque:", 0);
    objc_msgSend(v7, "setScale:", *(double *)(a1 + 112));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v7, *(double *)(a1 + 120), *(double *)(a1 + 128));
    v25[0] = v2;
    v25[1] = 3221225472;
    v25[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2_25;
    v25[3] = &unk_1E3153898;
    v9 = *(_QWORD *)(a1 + 104);
    v26 = *(_OWORD *)(a1 + 136);
    v25[4] = v9;
    v25[5] = &v41;
    v10 = *(_QWORD *)(a1 + 152);
    v27 = *(_QWORD *)(a1 + 112);
    v28 = v10;
    v29 = *(_OWORD *)(a1 + 120);
    objc_msgSend(v8, "imageWithActions:", v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 64), "visualIdenticalityIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v12, v6, *(double *)(a1 + 160), *(double *)(a1 + 168));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc_init(MPTiledArtworkRepresentationToken);
      v15 = (void *)v36[5];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v15, "containsObject:", v16);

      if ((v15 & 1) == 0)
        -[MPTiledArtworkRepresentationToken setTileArtworkVisualIdenticalityIdentifiers:](v14, "setTileArtworkVisualIdenticalityIdentifiers:", v36[5]);
      -[MPTiledArtworkRepresentationToken setRevisionIdentifier:](v14, "setRevisionIdentifier:", *(_QWORD *)(a1 + 72));
      objc_msgSend(v13, "setRepresentationToken:", v14);
      objc_msgSend((id)objc_opt_class(), "_representationCacheKeyForArtworkCatalog:forAnyRevision:", *(_QWORD *)(a1 + 64), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v13, v17);
      if (*(_QWORD *)(a1 + 88))
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v13);
      v20[0] = v2;
      v20[1] = 3221225472;
      v20[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3_27;
      v20[3] = &unk_1E31538C0;
      v18 = v13;
      v21 = v18;
      v19 = v17;
      v22 = v19;
      v23 = *(id *)(a1 + 88);
      v24 = *(id *)(a1 + 80);
      objc_msgSend(v6, "prepareForDisplayWithCompletionHandler:", v20);

    }
    else
    {
      v18 = 0;
    }
    (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 96) + 16))(*(_QWORD *)(a1 + 96), v18, 0, v11);

  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "visualIdenticalityIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v8 | v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_6;
    block[3] = &unk_1E3157DA0;
    v10 = (id)v8;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 72);
    v11 = v6;
    v14 = v7;
    v12 = (id)v4;
    v13 = *(id *)(a1 + 48);
    dispatch_sync(v5, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_6(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 32))
    result = objc_msgSend(*(id *)(result + 40), "replaceObjectAtIndex:withObject:", *(_QWORD *)(result + 64));
  if (*(_QWORD *)(v1 + 48))
    return objc_msgSend(*(id *)(v1 + 56), "replaceObjectAtIndex:withObject:", *(_QWORD *)(v1 + 64));
  return result;
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2_25(uint64_t a1)
{
  unint64_t v2;
  double v3;
  double v4;
  CGContext *CurrentContext;
  void *v6;
  double v7;
  CGContext *v8;
  CGRect v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v2 = 0;
    v4 = *MEMORY[0x1E0C9D538];
    v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      v9.origin.x = v4;
      v9.origin.y = v3;
      v9.size.width = *(CGFloat *)(a1 + 48);
      v9.size.height = *(CGFloat *)(a1 + 56);
      UIRectClip(v9);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndex:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      objc_msgSend(v6, "size");
      objc_msgSend(v6, "size");
      objc_msgSend(v6, "size");
      UIRectGetCenter();
      UIRectCenteredAboutPointScale();
      objc_msgSend(v6, "drawInRect:");
      v7 = *(double *)(a1 + 72);
      v4 = v4 + *(double *)(a1 + 48) + v7;
      if (v4 >= *(double *)(a1 + 80))
      {
        v3 = v7 + v3 + *(double *)(a1 + 56);
        v4 = 0.0;
      }
      v8 = UIGraphicsGetCurrentContext();
      CGContextRestoreGState(v8);

      ++v2;
    }
    while (v2 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3_27(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "representationWithPreparedImage:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      v4 = *(id *)(a1 + 48);
      v5 = v6;
      if (!v4)
      {
LABEL_7:

        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v6, v4);

    v5 = v6;
    goto LABEL_7;
  }
}

uint64_t __73__MPTiledArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLoadingRequestForArtworkCatalog:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedDataSource
{
  if (sharedDataSource_sOnceToken != -1)
    dispatch_once(&sharedDataSource_sOnceToken, &__block_literal_global_2366);
  return (id)sharedDataSource_sSharedDataSource;
}

+ (id)_representationCacheKeyForArtworkCatalog:(id)a3 forAnyRevision:(BOOL)a4
{
  id v5;
  void *v6;
  MPTiledArtworkRepresentationCacheKey *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v5 = a3;
  objc_msgSend(v5, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityIdentifier");
  v7 = (MPTiledArtworkRepresentationCacheKey *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "namespaceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "scaledFittingSize");
      v10 = v9;
      v12 = v11;
      MSVGetMaximumScreenSize();
      if (v13 < v14)
        v13 = v14;
      v15 = (double)(unint64_t)(uint64_t)v13;
      if (v10 >= v15)
        v10 = v15;
      if (v12 >= v15)
        v12 = v15;
      if (a4)
      {
        objc_msgSend(v6, "revisionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (id)objc_msgSend(v6, "copy");
          objc_msgSend(v17, "setRevisionIdentifier:", 0);
        }
        else
        {
          v17 = v6;
        }
        v7 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:]([MPTiledArtworkRepresentationCacheKey alloc], "initWithTiledArtworkRequest:scaledFittingSize:", v17, v10, v12);

      }
      else
      {
        v7 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:]([MPTiledArtworkRepresentationCacheKey alloc], "initWithTiledArtworkRequest:scaledFittingSize:", v6, v10, v12);
      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)_errorWithDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPTiledArtworkError"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_loadingRequestForArtworkCatalog:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MPTiledArtworkRepresentationCacheKey *v12;

  v3 = a3;
  objc_msgSend(v3, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledFittingSize");
  v6 = v5;
  v8 = v7;

  MSVGetMaximumScreenSize();
  if (v9 < v10)
    v9 = v10;
  v11 = (double)(unint64_t)(uint64_t)v9;
  if (v6 >= v11)
    v6 = v11;
  if (v8 >= v11)
    v8 = v11;
  v12 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:]([MPTiledArtworkRepresentationCacheKey alloc], "initWithTiledArtworkRequest:scaledFittingSize:", v4, v6, v8);

  return v12;
}

+ (CGSize)_tileSizeForFittingSize:(CGSize)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 spacing:(double)a6
{
  double v6;
  double v7;
  CGSize result;

  v6 = (a3.width - (double)(a5 - 1) * a6) / (double)a5;
  v7 = (a3.height - (double)(a4 - 1) * a6) / (double)a4;
  result.height = v7;
  result.width = v6;
  return result;
}

void __44__MPTiledArtworkDataSource_sharedDataSource__block_invoke()
{
  MPTiledArtworkDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(MPTiledArtworkDataSource);
  v1 = (void *)sharedDataSource_sSharedDataSource;
  sharedDataSource_sSharedDataSource = (uint64_t)v0;

}

@end
