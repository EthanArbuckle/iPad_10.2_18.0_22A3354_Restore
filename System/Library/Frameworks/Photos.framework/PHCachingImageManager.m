@implementation PHCachingImageManager

uint64_t __106__PHCachingImageManager_mediaRequestContext_isQueryingCacheForRequest_didWait_didFindImage_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deferredProcessingNeeded");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deferredProcessing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustmentVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (!v3)
      {
        v13 = 1;
        goto LABEL_9;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adjustmentVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10 == 0;
      goto LABEL_8;
    }
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "adjustmentVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adjustmentVersion"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

LABEL_8:
      goto LABEL_9;
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (PHCachingImageManager)init
{
  id v2;
  uint64_t v3;
  void *v4;
  PHImageCache *v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  NSObject *v9;
  dispatch_source_t v10;
  void *v11;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHCachingImageManager;
  v2 = -[PHImageManager init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v3;

    *((_DWORD *)v2 + 12) = 0;
    v5 = objc_alloc_init(PHImageCache);
    v6 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v5;

    objc_msgSend(*((id *)v2 + 7), "setDelegate:", v2);
    v7 = dispatch_queue_create("com.apple.photos.imageManagerCache", 0);
    v8 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v7;

    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, v9);
    v11 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v10;

    objc_initWeak(&location, v2);
    objc_copyWeak(&v13, &location);
    pl_dispatch_source_set_event_handler();
    dispatch_resume(*((dispatch_object_t *)v2 + 10));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (PHCachingImageManager *)v2;
}

- (BOOL)_cacheImageResult:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PHImageCache *imageCache;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  const __CFString *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustmentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v36[0] = CFSTR("adjustmentVersion");
    objc_msgSend(v6, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adjustmentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("deferredProcessing");
    v37[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedShort:", objc_msgSend(v13, "deferredProcessingNeeded"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = CFSTR("deferredProcessing");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithUnsignedShort:", objc_msgSend(v10, "deferredProcessingNeeded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v17 = objc_msgSend(v7, "imageRef");
  imageCache = self->_imageCache;
  v19 = objc_msgSend(v6, "requestID");
  objc_msgSend(v6, "asset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displaySpec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "targetSize");
  v23 = v22;
  v25 = v24;
  objc_msgSend(v6, "displaySpec");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentMode");
  objc_msgSend(v6, "displaySpec");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "normalizedCropRect");
  _buildCacheKey(v20, v23, v25, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = -[PHImageCache populateEntryWithImage:requestID:forKey:additionalInfo:](imageCache, "populateEntryWithImage:requestID:forKey:additionalInfo:", v17, v19, v32, v15);

  return v17;
}

- (void)mediaRequestContext:(id)a3 isQueryingCacheForRequest:(id)a4 didWait:(BOOL *)a5 didFindImage:(BOOL *)a6 resultHandler:(id)a7
{
  id v11;
  id v12;
  NSMutableSet *cachingRequestIDs;
  void *v14;
  PHImageCache *imageCache;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  v11 = a4;
  v12 = a7;
  os_unfair_lock_lock(&self->_cachingLock);
  cachingRequestIDs = self->_cachingRequestIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "requestID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(cachingRequestIDs) = -[NSMutableSet containsObject:](cachingRequestIDs, "containsObject:", v14);

  os_unfair_lock_unlock(&self->_cachingLock);
  if ((cachingRequestIDs & 1) == 0)
  {
    imageCache = self->_imageCache;
    objc_msgSend(v11, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displaySpec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "targetSize");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v11, "displaySpec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentMode");
    objc_msgSend(v11, "displaySpec");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "normalizedCropRect");
    _buildCacheKey(v16, v19, v21, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __106__PHCachingImageManager_mediaRequestContext_isQueryingCacheForRequest_didWait_didFindImage_resultHandler___block_invoke;
    v29[3] = &unk_1E35D76A0;
    v30 = v11;
    -[PHImageCache queryEntryForKey:didWaitForInFlightRequest:didFindImage:entryIsValidBlock:resultHandler:](imageCache, "queryEntryForKey:didWaitForInFlightRequest:didFindImage:entryIsValidBlock:resultHandler:", v28, a5, a6, v29, v12);

  }
}

void __90__PHCachingImageManager_additionalWorkForImageRequestCompletedWithResult_request_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_canPopulateCacheForResult:", *(_QWORD *)(a1 + 40))
    && objc_msgSend(*(id *)(a1 + 32), "_cacheImageResult:forRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    PLImageManagerGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "identifierString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "asset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ request opportunistically stored image in cache for asset: %@", buf, 0x16u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v6 = objc_msgSend(*(id *)(a1 + 48), "requestID");
      objc_msgSend(*(id *)(a1 + 48), "identifierString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v6, CFSTR("[RM][cache]: %@ request opportunistically stored image in cache for asset: %@"), v7, v9);

    }
  }
}

- (BOOL)_canPopulateCacheForResult:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isDegraded") & 1) == 0
    && (objc_msgSend(v3, "isPlaceholder") & 1) == 0
    && (objc_msgSend(v3, "isCancelled") & 1) == 0
    && objc_msgSend(v3, "imageRef") != 0;

  return v4;
}

- (void)additionalWorkForImageRequestCompletedWithResult:(id)a3 request:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  NSObject *serialQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PHCachingImageManager_additionalWorkForImageRequestCompletedWithResult_request_context___block_invoke;
  block[3] = &unk_1E35DFAF8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(serialQueue, block);

}

- (id)_tableFormatsForLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D732F8], "tableThumbnailFormatsForConfigPhase:withPathManager:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_imageTableForPreheatingDegradedOpportunisticRequestsWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHCachingImageManager _tableFormatsForLibrary:](self, "_tableFormatsForLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isSquare") & 1) == 0)
        {
          objc_msgSend(v4, "thumbnailManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "imageTableForFormat:", objc_msgSend(v11, "formatID"));
          v13 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_preheatImageTable:(id)a3 forAssets:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "thumbnailIndex");
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v7, "addIndex:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__PHCachingImageManager__preheatImageTable_forAssets___block_invoke;
  v15[3] = &unk_1E35D7628;
  v16 = v5;
  v14 = v5;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v15);

}

- (void)_handleMemoryWarning
{
  NSObject *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 134217984;
    v5 = -[PHImageManager managerID](self, "managerID");
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[cache] %lu: didReceiveMemoryWarning: flushing all caches", (uint8_t *)&v4, 0xCu);
  }

  -[PHImageCache removeAllEntries](self->_imageCache, "removeAllEntries");
}

- (id)_cacheFailReasonFromInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("PHImageCancelledKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("cancelled");
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("PHImageErrorKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error: %@"), v7);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("other failure");
    }

  }
  return v6;
}

- (void)_handleCachingImageRequestResult:(id)a3 request:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSMutableSet *cachingRequestIDs;
  void *v13;
  NSMutableSet *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  PHImageCache *imageCache;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "requestID");
  os_unfair_lock_lock(&self->_cachingLock);
  cachingRequestIDs = self->_cachingRequestIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(cachingRequestIDs) = -[NSMutableSet containsObject:](cachingRequestIDs, "containsObject:", v13);

  os_unfair_lock_unlock(&self->_cachingLock);
  if (!(_DWORD)cachingRequestIDs)
    goto LABEL_23;
  os_unfair_lock_lock(&self->_cachingLock);
  v14 = self->_cachingRequestIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](v14, "removeObject:", v15);

  os_unfair_lock_unlock(&self->_cachingLock);
  if (!-[PHCachingImageManager _canPopulateCacheForResult:](self, "_canPopulateCacheForResult:", v8))
  {
    if ((objc_msgSend(v8, "isDegraded") & 1) == 0)
    {
      PLImageManagerGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "identifierString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "info");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHCachingImageManager _cacheFailReasonFromInfo:](self, "_cacheFailReasonFromInfo:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v24;
        v54 = 2112;
        v55 = v26;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request failed, removing entry, reason: %@", buf, 0x16u);

      }
      if (PHImageManagerRecordEnabled())
      {
        objc_msgSend(v9, "identifierString");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "info");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHCachingImageManager _cacheFailReasonFromInfo:](self, "_cacheFailReasonFromInfo:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v11, CFSTR("[RM][cache]: %@ cache request failed, removing entry, reason: %@"), v49, v51);

      }
    }
    imageCache = self->_imageCache;
    objc_msgSend(v9, "asset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displaySpec");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "targetSize");
    v31 = v30;
    v33 = v32;
    objc_msgSend(v9, "displaySpec");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contentMode");
    objc_msgSend(v9, "displaySpec");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "normalizedCropRect");
    _buildCacheKey(v28, v31, v33, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageCache populateEntryWithImage:requestID:forKey:additionalInfo:](imageCache, "populateEntryWithImage:requestID:forKey:additionalInfo:", 0, v11, v40, 0);

LABEL_14:
    v22 = 0;
LABEL_15:

    goto LABEL_20;
  }
  v16 = -[PHCachingImageManager _cacheImageResult:forRequest:](self, "_cacheImageResult:forRequest:", v8, v9);
  PLImageManagerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (!v16)
  {
    if (v18)
    {
      objc_msgSend(v9, "identifierString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "asset");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "uuid");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v41;
      v54 = 2112;
      v55 = v43;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request finished but request is stale, for asset: %@", buf, 0x16u);

    }
    if (!PHImageManagerRecordEnabled())
    {
      v22 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v9, "identifierString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uuid");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v11, CFSTR("[RM][cache]: %@ cache request finished but request is stale, for asset: %@"), v28, v34);
    goto LABEL_14;
  }
  if (v18)
  {
    objc_msgSend(v9, "identifierString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v19;
    v54 = 2112;
    v55 = v21;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request stored image in cache for asset: %@", buf, 0x16u);

  }
  if (PHImageManagerRecordEnabled())
  {
    objc_msgSend(v9, "identifierString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uuid");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v11, CFSTR("[RM][cache]: %@ cache request stored image in cache for asset: %@"), v28, v34);
    v22 = 1;
    goto LABEL_15;
  }
  v22 = 1;
LABEL_20:
  objc_msgSend(v10, "imageOptions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "cachingCompleteHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v44, "cachingCompleteHandler");
    v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v46)[2](v46, v48, v22);

  }
LABEL_23:

}

- (void)_commitCacheChanges
{
  NSObject *v3;
  uint8_t v4[16];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    self->_imageCacheCommitScheduled = 0;
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[RM][cache]: Committing image caching changes", v4, 2u);
  }

  -[PHImageCache commitChangesWithQueueToProcessDeletes:](self->_imageCache, "commitChangesWithQueueToProcessDeletes:", self->_serialQueue);
}

- (void)_scheduleOrCommitCacheChangesIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (!self->_imageCacheCommitScheduled)
    {
      self->_imageCacheCommitScheduled = 1;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "performSelector:target:argument:order:modes:", sel__commitCacheChanges, self, 0, 0, v4);

    }
  }
  else
  {
    -[PHCachingImageManager _commitCacheChanges](self, "_commitCacheChanges");
  }
}

- (void)startCachingImagesForAssets:(NSArray *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options
{
  double height;
  double width;
  NSArray *v11;
  PHImageRequestOptions *v12;
  PHImageRequestOptions *v13;
  PHImageRequestOptions *v14;
  PHImageRequestOptions *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  PHImageContentMode v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  PHImageDisplaySpec *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  PHImageDisplaySpec *v46;
  PHImageCache *imageCache;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  PHImageRequestOptions *v53;
  NSMutableSet *cachingRequestIDs;
  void *v55;
  NSObject *v56;
  unint64_t v57;
  OS_dispatch_queue *serialQueue;
  uint64_t v59;
  _QWORD *v60;
  NSObject *v61;
  dispatch_block_t v62;
  void *v63;
  PHImageRequestOptions *v64;
  NSArray *v65;
  PHImageContentMode v66;
  NSArray *obj;
  uint64_t v68;
  _QWORD v69[6];
  PHImageRequestOptions *v70;
  PHImageDisplaySpec *v71;
  int v72;
  int v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  _BYTE buf[24];
  void *v80;
  id v81;
  uint64_t v82;

  height = targetSize.height;
  width = targetSize.width;
  v82 = *MEMORY[0x1E0C80C00];
  v11 = assets;
  v12 = options;
  v13 = v12;
  if (v12)
    v14 = (PHImageRequestOptions *)-[PHImageRequestOptions copy](v12, "copy");
  else
    v14 = objc_alloc_init(PHImageRequestOptions);
  v15 = v14;
  if (-[NSArray count](v11, "count"))
  {
    v16 = ceil(width);
    v17 = ceil(height);
    -[NSArray firstObject](v11, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_opt_class();
    objc_msgSend(v19, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHCachingImageManager _tableFormatsForLibrary:](self, "_tableFormatsForLibrary:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_chooseImageTableFormatForPreheatingFromFormats:targetSize:contentMode:returnBestTableRegardlessOfFit:", v22, contentMode, -[PHImageRequestOptions deliveryMode](v15, "deliveryMode") == PHImageRequestOptionsDeliveryModeFastFormat, v16, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    PLImageManagerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v25)
      {
        -[NSArray valueForKey:](v11, "valueForKey:", CFSTR("uuid"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "[RM][cache]: preheating image table for assets: %@", buf, 0xCu);

      }
      objc_msgSend(v19, "photoLibrary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "thumbnailManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "imageTableForFormat:", objc_msgSend(v23, "formatID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHCachingImageManager _preheatImageTable:forAssets:](self, "_preheatImageTable:forAssets:", v29, v11);
    }
    else
    {
      v66 = contentMode;
      if (v25)
      {
        DCIM_NSStringFromCGSize();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray valueForKey:](v11, "valueForKey:", CFSTR("uuid"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "[RM][cache]: start caching images for size: %@, assets: %@", buf, 0x16u);

      }
      if (-[PHImageRequestOptions deliveryMode](v15, "deliveryMode") == PHImageRequestOptionsDeliveryModeOpportunistic)
      {
        -[PHImageRequestOptions setDeliveryMode:](v15, "setDeliveryMode:", 1);
        PLImageManagerGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_DEBUG, "[RM][cache]: preheating image table for opportunistic request", buf, 2u);
        }

        objc_msgSend(v19, "photoLibrary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHCachingImageManager _imageTableForPreheatingDegradedOpportunisticRequestsWithPhotoLibrary:](self, "_imageTableForPreheatingDegradedOpportunisticRequestsWithPhotoLibrary:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[PHCachingImageManager _preheatImageTable:forAssets:](self, "_preheatImageTable:forAssets:", v34, v11);
      }
      v63 = v19;
      v64 = v13;
      -[PHImageRequestOptions setSynchronous:](v15, "setSynchronous:", 0);
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v65 = v11;
      obj = v11;
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
      v36 = contentMode;
      if (v35)
      {
        v37 = v35;
        v68 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v75 != v68)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            v40 = -[PHImageManager nextID](self, "nextID");
            v41 = [PHImageDisplaySpec alloc];
            -[PHImageRequestOptions normalizedCropRect](v15, "normalizedCropRect");
            v46 = -[PHImageDisplaySpec initWithTargetSize:contentMode:normalizedCropRect:](v41, "initWithTargetSize:contentMode:normalizedCropRect:", v36, v16, v17, v42, v43, v44, v45);
            v73 = 0;
            imageCache = self->_imageCache;
            -[PHImageDisplaySpec normalizedCropRect](v46, "normalizedCropRect");
            _buildCacheKey(v39, v16, v17, v48, v49, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(imageCache) = -[PHImageCache pinEntryForKey:requestID:inFlightRequestID:](imageCache, "pinEntryForKey:requestID:inFlightRequestID:", v52, v40, &v73);

            if ((imageCache & 1) != 0 || !v73)
            {
              v53 = v15;
              os_unfair_lock_lock(&self->_cachingLock);
              cachingRequestIDs = self->_cachingRequestIDs;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableSet addObject:](cachingRequestIDs, "addObject:", v55);

              os_unfair_lock_unlock(&self->_cachingLock);
              PLImageManagerGetLog();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                v57 = -[PHImageManager managerID](self, "managerID");
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v57;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = (int)v40;
                _os_log_impl(&dword_1991EC000, v56, OS_LOG_TYPE_DEBUG, "[RM][cache]: %ld-%ld image request being run to populate cache", buf, 0x16u);
              }

              v15 = v53;
              if (PHImageManagerRecordEnabled())
                +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v40, CFSTR("[RM][cache]: %ld-%ld image request being run to populate cache"), -[PHImageManager managerID](self, "managerID"), (int)v40);
              serialQueue = self->_serialQueue;
              v59 = MEMORY[0x1E0C809B0];
              v69[0] = MEMORY[0x1E0C809B0];
              v69[1] = 3221225472;
              v69[2] = __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
              v69[3] = &unk_1E35D7678;
              v72 = v40;
              v69[4] = self;
              v69[5] = v39;
              v70 = v15;
              v71 = v46;
              v60 = v69;
              *(_QWORD *)buf = v59;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke;
              v80 = &unk_1E35DF948;
              v81 = v60;
              v61 = serialQueue;
              v62 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
              dispatch_async(v61, v62);

              v36 = v66;
            }

          }
          v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
        }
        while (v37);
      }

      v13 = v64;
      v11 = v65;
      v23 = 0;
      v19 = v63;
      if (-[NSArray count](obj, "count"))
        -[PHCachingImageManager _scheduleOrCommitCacheChangesIfNeeded](self, "_scheduleOrCommitCacheChangesIfNeeded");
    }

  }
}

- (void)stopCachingImagesForAssets:(NSArray *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options
{
  double height;
  double width;
  NSArray *v10;
  PHImageRequestOptions *v11;
  NSObject *v12;
  void *v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  height = targetSize.height;
  width = targetSize.width;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = assets;
  v11 = options;
  if (-[NSArray count](v10, "count"))
  {
    PLImageManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[NSArray valueForKey:](v10, "valueForKey:", CFSTR("uuid"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "[RM][cache]: stop caching images for assets: %@", buf, 0xCu);

    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PHImageRequestOptions normalizedCropRect](v11, "normalizedCropRect");
    v19 = PHSanitizeNormalizedCropRect(0, v15, v16, v17, v18);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v26 = v10;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v27)
    {
      v28 = v27;
      v29 = ceil(width);
      v30 = ceil(height);
      v31 = *(_QWORD *)v35;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(v26);
          _buildCacheKey(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v32), v29, v30, v19, v21, v23, v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v33, (_QWORD)v34);

          ++v32;
        }
        while (v28 != v32);
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v28);
    }

    -[PHImageCache removeEntriesForKeys:](self->_imageCache, "removeEntriesForKeys:", v14);
    -[PHCachingImageManager _scheduleOrCommitCacheChangesIfNeeded](self, "_scheduleOrCommitCacheChangesIfNeeded");

  }
}

- (void)stopCachingImagesForAllAssets
{
  NSObject *v3;
  uint8_t v4[16];

  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[RM][cache]: Stop caching images for all assets", v4, 2u);
  }

  -[PHImageCache removeAllEntries](self->_imageCache, "removeAllEntries");
  -[PHCachingImageManager _scheduleOrCommitCacheChangesIfNeeded](self, "_scheduleOrCommitCacheChangesIfNeeded");
}

- (void)imageCache:(id)a3 didEvictCacheEntry:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "imageRequestIDForPopulatingCache", a3);
  if ((_DWORD)v5)
  {
    v6 = v5;
    PLImageManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v9 = -[PHImageManager managerID](self, "managerID");
      v10 = 2048;
      v11 = (int)v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "[RM][cache]: %ld-%ld cache entry was evicted with inflight request ID, cancelling now", buf, 0x16u);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v6, CFSTR("[RM][cache]: %ld-%ld cache entry was evicted with inflight request ID, cancelling now"), -[PHImageManager managerID](self, "managerID"), (int)v6);
    -[PHImageManager cancelImageRequest:](self, "cancelImageRequest:", v6);
  }
}

- (BOOL)allowsCachingHighQualityImages
{
  return self->_allowsCachingHighQualityImages;
}

- (void)setAllowsCachingHighQualityImages:(BOOL)allowsCachingHighQualityImages
{
  self->_allowsCachingHighQualityImages = allowsCachingHighQualityImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryEventSource, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_cachingRequestIDs, 0);
}

void __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(unsigned int *)(a1 + 64);
  v3 = objc_msgSend(*(id *)(a1 + 32), "managerID");
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
  v8[3] = &unk_1E35D7650;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  +[PHMediaRequestContext imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:](PHMediaRequestContext, "imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:", v2, v3, v6, v4, v5, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "runRequestWithContext:", v7);

}

uint64_t __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCachingImageRequestResult:request:context:", a2, a3, a4);
}

uint64_t __54__PHCachingImageManager__preheatImageTable_forAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchEntriesInRange:", a2, a3);
}

void __29__PHCachingImageManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMemoryWarning");

}

+ (id)_chooseImageTableFormatForPreheatingFromFormats:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 returnBestTableRegardlessOfFit:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t j;
  void *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (width == height)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (objc_msgSend(v18, "isSquare"))
          {
            if (!v15 || (objc_msgSend(v15, "dimension"), v20 = v19, objc_msgSend(v18, "dimension"), v20 < v21))
            {
              v22 = v18;

              v15 = v22;
            }
            objc_msgSend(v18, "dimension");
            if (v23 >= width && v14 == 0)
              v14 = v18;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v13);
      goto LABEL_43;
    }
LABEL_42:
    v14 = 0;
    v15 = 0;
    goto LABEL_43;
  }
  if (a5 && !v6)
    goto LABEL_42;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (!v25)
    goto LABEL_42;
  v26 = v25;
  v14 = 0;
  v15 = 0;
  v27 = *(_QWORD *)v39;
  if (width >= height)
    v28 = width;
  else
    v28 = height;
  do
  {
    for (j = 0; j != v26; ++j)
    {
      if (*(_QWORD *)v39 != v27)
        objc_enumerationMutation(v11);
      v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
      if (objc_msgSend(v30, "formatMode") == 2)
      {
        if (!v15 || (objc_msgSend(v15, "dimension"), v32 = v31, objc_msgSend(v30, "dimension"), v32 < v33))
        {
          v34 = v30;

          v15 = v34;
        }
        objc_msgSend(v30, "dimension");
        if (v35 >= v28 && v14 == 0)
          v14 = v30;
      }
    }
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  }
  while (v26);
LABEL_43:
  if (width <= 0.0 || height <= 0.0)
  {

    v14 = 0;
  }
  if (!v14 && v6)
    v14 = v15;

  return v14;
}

@end
