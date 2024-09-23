@implementation PHImageManager

- (PHImageManager)init
{
  PHImageManager *v2;
  PHImageManager *v3;
  uint64_t v4;
  NSMapTable *requestContextsByID;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHImageManager;
  v2 = -[PHImageManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(1u, (unsigned int *)&v2->_nextRequestID);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    requestContextsByID = v3->_requestContextsByID;
    v3->_requestContextsByID = (NSMapTable *)v4;

    v3->_lock._os_unfair_lock_opaque = 0;
    if (PHNextImageAndAssetResourceManagerID_onceToken != -1)
      dispatch_once(&PHNextImageAndAssetResourceManagerID_onceToken, &__block_literal_global_20522);
    do
      v6 = __ldaxr(&PHNextImageAndAssetResourceManagerID_managerID);
    while (__stlxr(v6 + 1, &PHNextImageAndAssetResourceManagerID_managerID));
    v3->_managerID = v6;
  }
  return v3;
}

- (void)mediaRequestContextDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t managerID;
  os_unfair_lock_s *p_lock;
  NSMapTable *requestContextsByID;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    managerID = self->_managerID;
    *(_DWORD *)buf = 134218498;
    v15 = managerID;
    v16 = 2048;
    v17 = (int)objc_msgSend(v4, "requestID");
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld image request %@ finished, removing from map table", buf, 0x20u);
  }

  if (PHImageManagerRecordEnabled())
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", objc_msgSend(v4, "requestID"), CFSTR("[RM]: %ld-%ld image request %@ finished, removing from map table"), self->_managerID, (int)objc_msgSend(v4, "requestID"), v4);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestContextsByID = self->_requestContextsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "requestID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](requestContextsByID, "removeObjectForKey:", v9);

  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "signpostID");
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      v13 = objc_msgSend(v4, "signpostLayoutID");
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_END, v12, "ContextEvent", "Context end", buf, 2u);
      }
      if (v13 != 101)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        objc_msgSend((id)s_availableLayoutIDs, "addIndex:", v13);
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      }
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (int)runRequestWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t managerID;
  os_unfair_lock_s *p_lock;
  NSMapTable *requestContextsByID;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "requestID");
  objc_msgSend(v4, "setDelegate:", self);
  PLImageManagerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    managerID = self->_managerID;
    *(_DWORD *)buf = 134218498;
    v20 = managerID;
    v21 = 2048;
    v22 = (int)objc_msgSend(v4, "requestID");
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld run image request for %@; store in map table",
      buf,
      0x20u);
  }

  if (PHImageManagerRecordEnabled())
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", objc_msgSend(v4, "requestID"), CFSTR("[RM]: %ld-%ld run image request for %@; store in map table"),
      self->_managerID,
      (int)objc_msgSend(v4, "requestID"),
      v4);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestContextsByID = self->_requestContextsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](requestContextsByID, "setObject:forKey:", v4, v10);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "start");
  if (PHImageManagerRecordEnabled())
  {
    objc_msgSend(v4, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer registerRequestID:withAssetUUID:](PHImageManagerRequestTracer, "registerRequestID:withAssetUUID:", v5, v13);

    objc_msgSend(v4, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      PLImageManagerGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "asset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = (unint64_t)v17;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "[RM]: request for image for asset with no UUID (asset: %@)", buf, 0xCu);

      }
      if (PHImageManagerRecordEnabled())
      {
        objc_msgSend(v4, "asset");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v5, CFSTR("[RM]: request for image for asset with no UUID (asset: %@)"), v18);

      }
    }
  }

  return v5;
}

void __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CGImageRef v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  CGImage *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  CGImage *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  CGImageRef v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  CGImageRef v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = CGImageRetain((CGImageRef)objc_msgSend(v7, "imageRef"));
  v11 = objc_msgSend(a1[4], "isNetworkAccessAllowed");
  v12 = v7;
  if ((objc_msgSend(v12, "containsValidData") & 1) != 0)
  {

    if (v10)
    {
      PLImageManagerGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "identifierString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "info");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v50 = v14;
        v51 = 2112;
        v52 = v10;
        v53 = 2112;
        v54 = v15;
        _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image result received with UIImage: %@, info: %@", buf, 0x20u);

      }
      if (PHImageManagerRecordEnabled())
      {
        v16 = objc_msgSend(v8, "requestID");
        objc_msgSend(v8, "identifierString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "info");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v16, CFSTR("[RM]: %@ Image result received with UIImage: %@, info: %@"), v17, v10, v18);
LABEL_32:

        goto LABEL_33;
      }
      goto LABEL_30;
    }
    objc_msgSend(v12, "adjustmentData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    PLImageManagerGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
    if (!v28)
    {
      if (v30)
      {
        objc_msgSend(v8, "identifierString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "info");
        v36 = (CGImage *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v35;
        v51 = 2112;
        v52 = v36;
        _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image result received with info: %@", buf, 0x16u);

      }
      if (PHImageManagerRecordEnabled())
      {
        v42 = objc_msgSend(v8, "requestID");
        objc_msgSend(v8, "identifierString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "info");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v42, CFSTR("[RM]: %@ Image result received with info: %@"), v17, v18, v43);
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    if (v30)
    {
      objc_msgSend(v8, "identifierString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v31;
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEBUG, "[RM]: %@ Adjustment data received", buf, 0xCu);

    }
    if (!PHImageManagerRecordEnabled())
      goto LABEL_30;
    v32 = objc_msgSend(v8, "requestID");
    objc_msgSend(v8, "identifierString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v32, CFSTR("[RM]: %@ Adjustment data received"), v17);
LABEL_33:

    goto LABEL_30;
  }
  if ((objc_msgSend(v12, "isCancelled") & 1) != 0)
  {

    PLImageManagerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "identifierString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v20;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request was cancelled", buf, 0xCu);

    }
    if (!PHImageManagerRecordEnabled())
      goto LABEL_30;
    v21 = objc_msgSend(v8, "requestID");
    objc_msgSend(v8, "identifierString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v21, CFSTR("[RM]: %@ Image request was cancelled"), v17);
    goto LABEL_33;
  }
  v22 = v11 | objc_msgSend(v12, "isInCloud") ^ 1;

  PLImageManagerGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((v22 & 1) != 0)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "identifierString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "error");
      v26 = (CGImage *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = v25;
      v51 = 2112;
      v52 = v26;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "[RM]: %@ Image request failed with error: %@", buf, 0x16u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v27 = objc_msgSend(v8, "requestID");
      objc_msgSend(v8, "identifierString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v27, CFSTR("[RM]: %@ Image request failed with error: %@"), v17, v18, v43);
      goto LABEL_32;
    }
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "identifierString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v33;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request found result in cloud, but network access not allowed", buf, 0xCu);

    }
    if (PHImageManagerRecordEnabled())
    {
      v34 = objc_msgSend(v8, "requestID");
      objc_msgSend(v8, "identifierString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v34, CFSTR("[RM]: %@ Image request found result in cloud, but network access not allowed"), v17);
      goto LABEL_33;
    }
  }
LABEL_30:
  v38 = a1[4];
  v37 = a1[5];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_573;
  v44[3] = &unk_1E35DF638;
  v39 = a1[6];
  v45 = v12;
  v46 = v8;
  v47 = v39;
  v48 = v10;
  v40 = v8;
  v41 = v12;
  objc_msgSend(v37, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v40, v38, v44);
  objc_msgSend(a1[5], "additionalWorkForImageRequestCompletedWithResult:request:context:", v41, v40, v9);

}

- (void)_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:(id)a3 options:(id)a4 block:(id)a5
{
  void (**v7)(_QWORD);
  NSObject *v8;
  id v9;
  id v10;

  v10 = a4;
  v7 = (void (**)(_QWORD))a5;
  if (objc_msgSend(a3, "isSynchronous"))
  {
    v7[2](v7);
  }
  else
  {
    objc_msgSend(v10, "resultHandlerQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }
    dispatch_async(v8, v7);

  }
}

void __84__PHImageManager_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (a2)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PHImageResultIsPlaceholderKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
      v8 = DCIM_newResizablePLImageWithCGImage();
    else
      v8 = DCIM_newPLImageWithCGImage();
    v9 = (void *)v8;
    CGImageRelease(a2);
  }
  else
  {
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v9, v11);

}

- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler
{
  double height;
  double width;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  height = targetSize.height;
  width = targetSize.width;
  v13 = resultHandler;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PHImageManager_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v16[3] = &unk_1E35DF318;
  v17 = v13;
  v14 = v13;
  LODWORD(options) = -[PHImageManager requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", asset, contentMode, options, v16, width, height);

  return (int)options;
}

- (int)requestNewCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  PHImageRequestOptions *v16;
  PHImageRequestOptions *v17;
  void *v18;
  void *v19;
  PHImageDisplaySpec *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  PHImageDisplaySpec *v25;
  uint64_t v26;
  unint64_t managerID;
  PHImageRequestOptions *v28;
  id v29;
  void *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  os_signpost_id_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  int v39;
  uint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  PHImageRequestOptions *v49;
  PHImageManager *v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  height = a4.height;
  width = a4.width;
  v64 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (v14)
    v16 = (PHImageRequestOptions *)objc_msgSend(v14, "copy");
  else
    v16 = objc_alloc_init(PHImageRequestOptions);
  v17 = v16;
  if (-[PHImageRequestOptions version](v16, "version") == 16 || -[PHImageRequestOptions version](v17, "version") == 17)
  {
    -[PHImageRequestOptions resultHandlerQueue](v17, "resultHandlerQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      dispatch_get_global_queue(33, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImageRequestOptions setResultHandlerQueue:](v17, "setResultHandlerQueue:", v19);

    }
  }
  v20 = [PHImageDisplaySpec alloc];
  -[PHImageRequestOptions normalizedCropRect](v17, "normalizedCropRect");
  v25 = -[PHImageDisplaySpec initWithTargetSize:contentMode:normalizedCropRect:](v20, "initWithTargetSize:contentMode:normalizedCropRect:", a5, ceil(width), ceil(height), v21, v22, v23, v24);
  -[PHImageRequestOptions fallbackTargetSizeIfRequestedSizeNotLocallyAvailable](v17, "fallbackTargetSizeIfRequestedSizeNotLocallyAvailable");
  -[PHImageDisplaySpec setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:](v25, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  v26 = -[PHImageManager nextID](self, "nextID");
  managerID = self->_managerID;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v48[3] = &unk_1E35DF5E8;
  v28 = v17;
  v49 = v28;
  v50 = self;
  v29 = v15;
  v51 = v29;
  +[PHMediaRequestContext imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:](PHMediaRequestContext, "imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:", v26, managerID, v13, v28, v25, v48);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_signpost_id_generate(v31);
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v33 = v32;
      v34 = objc_msgSend(v30, "managerID");
      v42 = objc_msgSend(v30, "requestID");
      v44 = objc_msgSend(v30, "type");
      v45 = v34;
      v46 = v13;
      if (_getNextLayoutID_onceToken != -1)
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      v35 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
      if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v36 = 101;
      }
      else
      {
        v36 = v35;
        objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v35);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      objc_msgSend(v30, "asset");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "uuid");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "setSignpostID:", v33);
      objc_msgSend(v30, "setSignpostLayoutID:", v36);
      v38 = v31;
      if (os_signpost_enabled(v38))
      {
        v41 = v42;
        DCIM_NSStringFromCGSize();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v53 = v45;
        v54 = 2048;
        v55 = v41;
        v56 = 2112;
        v57 = v43;
        v58 = 2048;
        v59 = v44;
        v60 = 2112;
        v61 = v47;
        v62 = 2048;
        v63 = v36;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v33, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

      }
      v13 = v46;
    }

  }
  v39 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v30);

  return v39;
}

- (int)nextID
{
  int *p_nextRequestID;
  int result;

  p_nextRequestID = &self->_nextRequestID;
  do
    result = __ldaxr((unsigned int *)p_nextRequestID);
  while (__stlxr(result + 1, (unsigned int *)p_nextRequestID));
  return result;
}

- (int)_requestImagePropertiesFromFileForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PHImageManager_Properties___requestImagePropertiesFromFileForAsset_options_resultHandler___block_invoke;
  v11[3] = &unk_1E35DB5C0;
  v12 = v8;
  v9 = v8;
  LODWORD(a4) = -[PHImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", a3, 0, a4, v11, -1.0, -1.0);

  return (int)a4;
}

- (int)requestImagePropertiesForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHImageRequestOptions *v11;
  NSObject *v12;
  int v13;
  PHImageRequestOptions *v14;
  uint8_t v16[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isPhoto") & 1) != 0)
  {
    if (v9)
      v11 = (PHImageRequestOptions *)objc_msgSend(v9, "copy");
    else
      v11 = objc_alloc_init(PHImageRequestOptions);
    v14 = v11;
    if (-[PHImageRequestOptions loadingMode](v11, "loadingMode") != 0x10000)
      -[PHImageRequestOptions setLoadingMode:](v14, "setLoadingMode:", 0x10000);
    v13 = -[PHImageManager _requestImagePropertiesFromFileForAsset:options:resultHandler:](self, "_requestImagePropertiesFromFileForAsset:options:resultHandler:", v8, v14, v10);

  }
  else
  {
    PLImageManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Requesting image properties from a non-photo asset is invalid", v16, 2u);
    }

    v13 = 0;
  }

  return v13;
}

void __92__PHImageManager_Properties___requestImagePropertiesFromFileForAsset_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  CGImageSourceRef v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("PHImageFileURLKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

    v8 = 0;
    if (v7)
    {
      v9 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0D71880], "newImagePropertiesFromImageSource:", v9);
      CFRelease(v9);
    }
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)_videoAVObjectBuilderFromVideoURL:(id)a3 info:(id)a4 options:(id)a5 playbackOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6 && (objc_msgSend(v10, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8ADB0]);
    objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0C8AD70]);
    objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0C8AD78]);
    objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0C8AD98]);
    objc_msgSend(a1, "configureAssetCacheInAssetCreationOptionsDictionary:", v13);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHAdjustmentDataKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D75308]);
    objc_msgSend(v16, "formatIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "formatVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v18, v19, v20, 0, 0, 0);

  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v15, v21);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHApplyTimeRangeKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
  {
    if (v12)
    {
      objc_msgSend(v12, "timeRange");
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v27 = 0u;
    }
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    objc_msgSend(v22, "setTimeRange:", v26);
  }

  return v22;
}

+ (void)configureAssetCacheInAssetCreationOptionsDictionary:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D719E0], "debugAlwaysStreamSharedVideos") & 1) == 0
    && objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit"))
  {
    objc_msgSend(MEMORY[0x1E0D719E0], "streamdVideoCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, *MEMORY[0x1E0C8AD50]);

  }
}

+ (void)buildAVPlayerItemFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileSandboxExtensionTokenKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSandboxExtensionWrapper wrapperWithToken:](PHSandboxExtensionWrapper, "wrapperWithToken:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_videoAVObjectBuilderFromVideoURL:info:options:playbackOnly:", v13, v12, v11, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__PHImageManager_VideoUtilities__buildAVPlayerItemFromVideoURL_infoDictionary_options_completion___block_invoke;
  v20[3] = &unk_1E35DB798;
  v22 = v16;
  v23 = v10;
  v21 = v15;
  v17 = v16;
  v18 = v10;
  v19 = v15;
  objc_msgSend(v17, "requestAsynchronousPlayerItemWithResultHandler:", v20);

}

+ (void)buildAVAssetFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileSandboxExtensionTokenKey"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  +[PHSandboxExtensionWrapper wrapperWithToken:](PHSandboxExtensionWrapper, "wrapperWithToken:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_videoAVObjectBuilderFromVideoURL:info:options:playbackOnly:", v13, v12, v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__PHImageManager_VideoUtilities__buildAVAssetFromVideoURL_infoDictionary_options_completion___block_invoke;
  v19[3] = &unk_1E35DB7C0;
  v20 = v14;
  v21 = v10;
  v16 = v10;
  v17 = v14;
  objc_msgSend(v15, "requestAVAssetWithResultHandler:", v19);

}

+ (void)buildAVPlayerItemFromRemoteStreamVideoURL:(id)a3 infoDictionary:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  objc_msgSend(a1, "_videoAVObjectBuilderFromVideoURL:info:options:playbackOnly:", a3, a4, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__PHImageManager_VideoUtilities__buildAVPlayerItemFromRemoteStreamVideoURL_infoDictionary_completion___block_invoke;
  v11[3] = &unk_1E35DB7E8;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "requestAsynchronousPlayerItemWithResultHandler:", v11);

}

+ (void)buildExportSessionFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 exportPreset:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHImageFileSandboxExtensionTokenKey"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  +[PHSandboxExtensionWrapper wrapperWithToken:](PHSandboxExtensionWrapper, "wrapperWithToken:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_videoAVObjectBuilderFromVideoURL:info:options:playbackOnly:", v16, v15, v14, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __112__PHImageManager_VideoUtilities__buildExportSessionFromVideoURL_infoDictionary_options_exportPreset_completion___block_invoke;
  v22[3] = &unk_1E35DB810;
  v23 = v17;
  v24 = v12;
  v19 = v12;
  v20 = v17;
  objc_msgSend(v18, "requestExportSessionWithExportPreset:resultHandler:", v13, v22);

}

+ (id)playerItemFromVideoMediaItemMakerDataInMediaResult:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "videoMediaItemMakerData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fingerPrint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", CFSTR("PHImageResultAVAssetOutOfBandPresentationHintsKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "playerItemFromVideoMediaItemMakerData:forAssetUuid:fingerPrint:outOfBandPresentationHints:", v8, v12, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)playerItemFromVideoMediaItemMakerData:(id)a3 forAssetUuid:(id)a4 fingerPrint:(id)a5 outOfBandPresentationHints:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v21 = 0;
  v14 = (void *)objc_msgSend(objc_alloc((Class)getCKMediaItemMakerClass()), "initWithData:error:", v13, &v21);

  v15 = v21;
  if (v14)
  {
    objc_msgSend(a1, "mediaItemURLForAssetUuid:fingerPrint:outOfBandPresentationHints:", v10, v11, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configureAssetCacheInAssetCreationOptionsDictionary:", v17);
    objc_msgSend(v14, "makeAVPlayerItemWithURL:options:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      PLImageManagerGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Media item maker %@ failed to create player item for asset %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLImageManagerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Unable to deserialize media item maker for asset %@: %@", buf, 0x16u);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)mediaItemURLForAssetUuid:(id)a3 fingerPrint:(id)a4 outOfBandPresentationHints:(id)a5
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

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setScheme:", CFSTR("photos-avasset"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "removeCharactersInString:", CFSTR("/"));
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("/%@"), v14);

  }
  objc_msgSend(v10, "setPath:", v11);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v10, "setFragment:", v8);
  objc_msgSend(v10, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)exportVideoFileForTimeRange:(id *)a3 fromVideoMediaItemMakerData:(id)a4 forAssetUuid:(id)a5 toOutputFileURL:(id)a6 fingerPrint:(id)a7 signpostId:(unint64_t)a8 options:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  void (**v23)(void *, _QWORD, void *);
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  __int128 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v54;
  _OWORD v55[3];
  id v56;
  _QWORD aBlock[4];
  id v58;
  unint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  _QWORD v66[2];
  _QWORD v67[5];

  v67[2] = *MEMORY[0x1E0C80C00];
  v52 = a4;
  v54 = a5;
  v16 = a6;
  v51 = a7;
  v50 = a9;
  v17 = a10;
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManager+VideoUtilities.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CMTIMERANGE_IS_VALID(timeRange)"));

  }
  v19 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManager+VideoUtilities.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoMediaItemMakerData"));

  }
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManager+VideoUtilities.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUuid"));

  }
  if ((objc_msgSend(v16, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManager+VideoUtilities.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[outputURL isFileURL]"));

    if (v17)
      goto LABEL_11;
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManager+VideoUtilities.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalCompletion"));

    goto LABEL_11;
  }
  if (!v17)
    goto LABEL_35;
LABEL_11:
  v49 = v16;
  PLImageManagerGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = a8 - 1;
  if (a8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v21, OS_SIGNPOST_INTERVAL_BEGIN, a8, "com.apple.photos.backend.adpExportVideoTimeRange", ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __161__PHImageManager_VideoUtilities__exportVideoFileForTimeRange_fromVideoMediaItemMakerData_forAssetUuid_toOutputFileURL_fingerPrint_signpostId_options_completion___block_invoke;
  aBlock[3] = &unk_1E35DB838;
  v59 = a8;
  v48 = v17;
  v58 = v48;
  v23 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  v56 = 0;
  v24 = (void *)objc_msgSend(objc_alloc((Class)getCKMediaItemMakerClass()), "initWithData:error:", v52, &v56);
  v25 = v56;
  v26 = v25;
  if (v24)
  {
    objc_msgSend(a1, "mediaItemURLForAssetUuid:fingerPrint:outOfBandPresentationHints:", v54, v51, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKey:", CFSTR("PHVideoExportOmitFromAssetCacheKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if ((v30 & 1) == 0)
      objc_msgSend(a1, "configureAssetCacheInAssetCreationOptionsDictionary:", v28);
    PLImageManagerGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v32, OS_SIGNPOST_INTERVAL_BEGIN, a8, "com.apple.photos.backend.adpExportVideoTimeRange.makeExportSession", ", buf, 2u);
    }

    objc_msgSend(v24, "makeAVAssetExportSession:options:presetName:", v27, v28, *MEMORY[0x1E0C89E98]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v35, OS_SIGNPOST_INTERVAL_END, a8, "com.apple.photos.backend.adpExportVideoTimeRange.makeExportSession", ", buf, 2u);
    }

    if (v33)
    {
      v36 = *(_OWORD *)&a3->var0.var3;
      v55[0] = *(_OWORD *)&a3->var0.var0;
      v55[1] = v36;
      v55[2] = *(_OWORD *)&a3->var1.var1;
      objc_msgSend(v33, "setTimeRange:", v55);
      objc_msgSend(v33, "setOutputURL:", v49);
      objc_msgSend(a1, "startExportSession:assetUuid:signpostId:completion:", v33, v54, a8, v23);
    }
    else
    {
      PLImageManagerGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v63 = v24;
        v64 = 2112;
        v65 = v54;
        _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_ERROR, "Media item maker %@ failed to create export session for asset %@", buf, 0x16u);
      }

      v41 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2938];
      v61 = CFSTR("Unable to perform ADP video partial time range export, media item maker failed to create export session");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v23[2](v23, 0, v43);
    }

    v19 = v52;
  }
  else
  {
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB3388];
    v66[0] = *MEMORY[0x1E0CB2938];
    v66[1] = v38;
    v67[0] = CFSTR("Unable to perform ADP video partial time range export, failed to deserialize media item maker");
    v67[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v23[2](v23, 0, v33);
    PLImageManagerGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v63 = v54;
      v64 = 2112;
      v65 = v26;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "Unable to deserialize media item maker for asset %@ to create export session: %@", buf, 0x16u);
    }
  }

}

+ (void)startExportSession:(id)a3 assetUuid:(id)a4 signpostId:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "outputURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileTypeForOutputURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOutputFileType:", v14);

  PLImageManagerGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v16, OS_SIGNPOST_INTERVAL_BEGIN, a5, "com.apple.photos.backend.adpExportVideoFileTimeRange.exportSession", ", buf, 2u);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__PHImageManager_VideoUtilities__startExportSession_assetUuid_signpostId_completion___block_invoke;
  v20[3] = &unk_1E35DF638;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = a5;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v19, "exportAsynchronouslyWithCompletionHandler:", v20);

}

+ (id)fileTypeForOutputURL:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "typeForFilenameExtensionOrLastPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    PLImageManagerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unable to map path extension %{public}@ to AVFileType: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v9 = (id)*MEMORY[0x1E0C8A2E8];
    v6 = v9;
  }

  return v6;
}

void __85__PHImageManager_VideoUtilities__startExportSession_assetUuid_signpostId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v3, OS_SIGNPOST_INTERVAL_END, v4, "com.apple.photos.backend.adpExportVideoFileTimeRange.exportSession", ", (uint8_t *)&v10, 2u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v5 == 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v9;
      v12 = 2048;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "ADP time range export session completed unsuccessfully for asset %@: status=%td, error: %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __161__PHImageManager_VideoUtilities__exportVideoFileForTimeRange_fromVideoMediaItemMakerData_forAssetUuid_toOutputFileURL_fingerPrint_signpostId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v4 = a3;
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_END, v7, "com.apple.photos.backend.adpExportVideoTimeRange", ", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__PHImageManager_VideoUtilities__buildExportSessionFromVideoURL_infoDictionary_options_exportPreset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id object;

  object = a2;
  v5 = a3;
  if (object)
    objc_setAssociatedObject(object, "PHSandboxExtensionWrapperKey", *(id *)(a1 + 32), (void *)0x301);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __102__PHImageManager_VideoUtilities__buildAVPlayerItemFromRemoteStreamVideoURL_infoDictionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__PHImageManager_VideoUtilities__buildAVAssetFromVideoURL_infoDictionary_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id object;

  object = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (object)
    objc_setAssociatedObject(object, "PHSandboxExtensionWrapperKey", *(id *)(a1 + 32), (void *)0x301);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __98__PHImageManager_VideoUtilities__buildAVPlayerItemFromVideoURL_infoDictionary_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id object;

  object = a2;
  v5 = a3;
  if (object)
    objc_setAssociatedObject(object, "PHSandboxExtensionWrapperKey", *(id *)(a1 + 32), (void *)0x301);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "playbackTimeRangeMapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id))(v6 + 16))(v6, object, v7, v5);

}

- (BOOL)_canStreamVideoForAsset:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isStreamedVideo") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else if (objc_msgSend(v3, "isVideo"))
  {
    v4 = objc_msgSend(v3, "isLoopingVideo") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)cancelImageRequest:(PHImageRequestID)requestID
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMapTable *requestContextsByID;
  void *v7;
  void *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  unint64_t managerID;
  NSObject *v16;
  unint64_t v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v3 = *(_QWORD *)&requestID;
  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestContextsByID = self->_requestContextsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](requestContextsByID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      v9 = objc_msgSend(v8, "signpostID");
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        PLImageManagerGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "managerID");
        v13 = objc_msgSend(v8, "requestID");
        if (os_signpost_enabled(v11))
        {
          *(_DWORD *)buf = 134218752;
          v19 = v12;
          v20 = 2048;
          v21 = v13;
          v22 = 2048;
          v23 = 0;
          v24 = 2048;
          v25 = 2;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v11, OS_SIGNPOST_EVENT, v10, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
        }

      }
    }
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      managerID = self->_managerID;
      *(_DWORD *)buf = 134218240;
      v19 = managerID;
      v20 = 2048;
      v21 = (int)v3;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld Cancelling image request", buf, 0x16u);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v3, CFSTR("[RM]: %ld-%ld Cancelling image request"), self->_managerID, (int)v3);
    objc_msgSend(v8, "cancel");
  }
  else if ((_DWORD)v3)
  {
    PLImageManagerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_managerID;
      *(_DWORD *)buf = 134218240;
      v19 = v17;
      v20 = 2048;
      v21 = (int)v3;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "[RM]: Did not find image request with ID %ld-%ld to cancel", buf, 0x16u);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v3, CFSTR("[RM]: Did not find image request with ID %ld-%ld to cancel"), self->_managerID, (int)v3);
  }

}

- (PHImageRequestID)requestImageDataForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  char v13;

  v8 = resultHandler;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PHImageManager_requestImageDataForAsset_options_resultHandler___block_invoke;
  v11[3] = &unk_1E35DF340;
  v12 = v8;
  v13 = 1;
  v9 = v8;
  LODWORD(options) = -[PHImageManager requestImageDataAndOrientationForAsset:options:resultHandler:](self, "requestImageDataAndOrientationForAsset:options:resultHandler:", asset, options, v11);

  return (int)options;
}

- (PHImageRequestID)requestImageDataAndOrientationForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler
{
  PHAsset *v8;
  void *v9;
  PHImageRequestOptions *v10;
  PHImageRequestOptions *v11;
  uint64_t v12;
  PHImageRequestOptions *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t managerID;
  PHImageRequestOptions *v17;
  id v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  PHImageRequestID v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  PHImageRequestOptions *v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = asset;
  v9 = resultHandler;
  v10 = (PHImageRequestOptions *)-[PHImageRequestOptions copy](options, "copy");
  if (v10)
  {
    v11 = v10;
    v12 = -[PHImageRequestOptions loadingMode](v10, "loadingMode") | 1;
    v13 = v11;
  }
  else
  {
    v13 = objc_alloc_init(PHImageRequestOptions);
    v11 = v13;
    v12 = 1;
  }
  -[PHImageRequestOptions setLoadingMode:](v13, "setLoadingMode:", v12);
  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[PHImageRequestOptions setLoadingMode:](v11, "setLoadingMode:", -[PHImageRequestOptions loadingMode](v11, "loadingMode") | 0x10000);
  if (-[PHAsset isAnimatedGIF](v8, "isAnimatedGIF"))
    v14 = 3;
  else
    v14 = 1;
  -[PHImageRequestOptions setDeliveryMode:](v11, "setDeliveryMode:", v14);
  -[PHImageRequestOptions setCannotReturnSmallerImage:](v11, "setCannotReturnSmallerImage:", 1);
  -[PHImageRequestOptions setIgnoreProcessWideRepairLimits:](v11, "setIgnoreProcessWideRepairLimits:", 1);
  v15 = -[PHImageManager nextID](self, "nextID");
  managerID = self->_managerID;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke;
  v34[3] = &unk_1E35DF5E8;
  v34[4] = self;
  v17 = v11;
  v35 = v17;
  v18 = v9;
  v36 = v18;
  +[PHMediaRequestContext imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:](PHMediaRequestContext, "imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:", v15, managerID, v8, v17, 0, v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v22 = v21;
      v23 = objc_msgSend(v19, "managerID");
      v24 = objc_msgSend(v19, "requestID");
      v32 = objc_msgSend(v19, "type");
      v33 = v23;
      v31 = v24;
      if (_getNextLayoutID_onceToken != -1)
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      v25 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = 101;
      }
      else
      {
        v26 = v25;
        objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v25);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      objc_msgSend(v19, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setSignpostID:", v22);
      objc_msgSend(v19, "setSignpostLayoutID:", v26);
      if (os_signpost_enabled(v20))
      {
        *(_DWORD *)buf = 134219266;
        v38 = v33;
        v39 = 2048;
        v40 = (int)v31;
        v41 = 2112;
        v42 = CFSTR("Data");
        v43 = 2048;
        v44 = v32;
        v45 = 2112;
        v46 = v28;
        v47 = 2048;
        v48 = v26;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }

    }
  }
  v29 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v19, v31);

  return v29;
}

- (void)_prepareLivePhotoResultWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 shouldIncludeVideo:(BOOL)a5 videoURL:(id)a6 info:(id)a7 photoTime:(id *)a8 asset:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  PHLivePhoto *v20;
  PHLivePhoto *v21;
  _QWORD v22[4];
  PHLivePhoto *v23;
  id v24;
  CGImage *v25;
  int64_t v26;
  __int128 v27;
  int64_t var3;
  __int128 v29;
  int64_t v30;

  v15 = a6;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  if (a5)
  {
    v19 = (void *)objc_opt_class();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __125__PHImageManager__prepareLivePhotoResultWithImage_uiOrientation_shouldIncludeVideo_videoURL_info_photoTime_asset_completion___block_invoke;
    v22[3] = &unk_1E35DF390;
    v25 = a3;
    v26 = a4;
    v27 = *(_OWORD *)&a8->var0;
    var3 = a8->var3;
    v23 = (PHLivePhoto *)v17;
    v24 = v18;
    objc_msgSend(v19, "buildAVAssetFromVideoURL:infoDictionary:options:completion:", v15, v16, 0, v22);

    v20 = v23;
  }
  else
  {
    v21 = [PHLivePhoto alloc];
    v29 = *(_OWORD *)&a8->var0;
    v30 = a8->var3;
    v20 = -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:](v21, "initWithImage:uiOrientation:videoAsset:photoTime:asset:", a3, a4, 0, &v29, v17);
    (*((void (**)(id, PHLivePhoto *, _QWORD))v18 + 2))(v18, v20, 0);
  }

}

- (PHImageRequestID)requestLivePhotoForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHLivePhotoRequestOptions *)options resultHandler:(void *)resultHandler
{
  double height;
  double width;
  PHAsset *v13;
  PHLivePhotoRequestOptions *v14;
  void *v15;
  PHLivePhotoRequestOptions *v16;
  _BOOL4 v17;
  uint64_t v18;
  unint64_t managerID;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  int v23;
  NSObject *v24;
  os_signpost_id_t v25;
  os_signpost_id_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  PHImageDisplaySpec *v31;
  void *v32;
  PHImageRequestID v33;
  PHLivePhotoRequestOptions *v34;
  PHLivePhotoRequestOptions *v35;
  uint64_t v36;
  unint64_t v37;
  PHLivePhotoRequestOptions *v38;
  void *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  os_signpost_id_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  PHLivePhotoRequestOptions *v61;
  PHLivePhotoRequestOptions *v62;
  uint64_t v63;
  void *v64;
  _QWORD v65[4];
  PHLivePhotoRequestOptions *v66;
  PHAsset *v67;
  PHImageManager *v68;
  id v69;
  _QWORD v70[4];
  PHLivePhotoRequestOptions *v71;
  PHAsset *v72;
  PHImageDisplaySpec *v73;
  uint8_t buf[4];
  unint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  uint64_t v85;
  const __CFString *v86;
  _QWORD v87[4];

  height = targetSize.height;
  width = targetSize.width;
  v87[1] = *MEMORY[0x1E0C80C00];
  v13 = asset;
  v14 = options;
  v15 = resultHandler;
  if (-[PHAsset canPlayPhotoIris](v13, "canPlayPhotoIris"))
  {
    v16 = v14;
    if (-[PHAsset deferredProcessingNeeded](v13, "deferredProcessingNeeded") == 2
      && -[PHLivePhotoRequestOptions liveRenderVideoIfNeeded](v16, "liveRenderVideoIfNeeded"))
    {
      v17 = -[PHLivePhotoRequestOptions isCurrentVersion](v16, "isCurrentVersion");

      if (v17)
      {
        v18 = -[PHImageManager nextID](self, "nextID");
        managerID = self->_managerID;
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v70[3] = &unk_1E35DF3E0;
        v73 = v15;
        v71 = v16;
        v72 = v13;
        +[PHLiveRenderEditingInputRequestContext videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:contentMode:renderedVideoHandler:](PHLiveRenderEditingInputRequestContext, "videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:contentMode:renderedVideoHandler:", v18, managerID, v72, v71, contentMode, v70, width, height);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PLImageManagerGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = self->_managerID;
          v23 = objc_msgSend(v20, "requestID");
          *(_DWORD *)buf = 134218240;
          v75 = v22;
          v76 = 2048;
          v77 = v23;
          _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEFAULT, "%ld-%ld - Making edit request in preparation for live rendering live photo's video complement", buf, 0x16u);
        }

        if (PHSignpostEventsEnabled_onceToken != -1)
          dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
        if (PHSignpostEventsEnabled_eventsEnabled)
        {
          PLImageManagerGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = os_signpost_id_generate(v24);
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v26 = v25;
            v61 = v14;
            v27 = objc_msgSend(v20, "managerID");
            v28 = objc_msgSend(v20, "requestID");
            v63 = v27;
            v59 = objc_msgSend(v20, "type");
            if (_getNextLayoutID_onceToken != -1)
              dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
            os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
            v29 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
            if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v30 = 101;
            }
            else
            {
              v30 = v29;
              objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v29);
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
            objc_msgSend(v20, "asset");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "uuid");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "setSignpostID:", v26);
            objc_msgSend(v20, "setSignpostLayoutID:", v30);
            v51 = v24;
            if (os_signpost_enabled(v51))
            {
              v58 = v50;
              v52 = v28;
              DCIM_NSStringFromCGSize();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134219266;
              v75 = v63;
              v76 = 2048;
              v77 = v52;
              v50 = v58;
              v78 = 2112;
              v79 = v53;
              v80 = 2048;
              v81 = v59;
              v82 = 2112;
              v83 = v58;
              v84 = 2048;
              v85 = v30;
              _os_signpost_emit_with_name_impl(&dword_1991EC000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v26, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

            }
            v14 = v61;
          }

        }
        v33 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v20);

        v31 = v73;
        goto LABEL_36;
      }
    }
    else
    {

    }
    v31 = -[PHImageDisplaySpec initWithTargetSize:contentMode:]([PHImageDisplaySpec alloc], "initWithTargetSize:contentMode:", contentMode, width, height);
    if (v16)
      v34 = v16;
    else
      v34 = objc_alloc_init(PHLivePhotoRequestOptions);
    v35 = v34;
    v36 = -[PHImageManager nextID](self, "nextID");
    v37 = self->_managerID;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_530;
    v65[3] = &unk_1E35DF6D8;
    v38 = v35;
    v66 = v38;
    v69 = v15;
    v67 = v13;
    v68 = self;
    +[PHMediaRequestContext livePhotoRequestContextWithRequestID:managerID:asset:livePhotoRequestOptions:displaySpec:resultHandler:](PHMediaRequestContext, "livePhotoRequestContextWithRequestID:managerID:asset:livePhotoRequestOptions:displaySpec:resultHandler:", v36, v37, v67, v38, v31, v65);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      PLImageManagerGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_signpost_id_generate(v40);
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v42 = v41;
        v43 = objc_msgSend(v39, "managerID");
        v55 = objc_msgSend(v39, "requestID");
        v57 = objc_msgSend(v39, "type");
        v60 = v43;
        v62 = v14;
        if (_getNextLayoutID_onceToken != -1)
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        v44 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
        if (v44 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v45 = 101;
        }
        else
        {
          v45 = v44;
          objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v44);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        objc_msgSend(v39, "asset");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "uuid");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "setSignpostID:", v42);
        objc_msgSend(v39, "setSignpostLayoutID:", v45);
        v47 = v40;
        if (os_signpost_enabled(v47))
        {
          v54 = v55;
          DCIM_NSStringFromCGSize();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v75 = v60;
          v76 = 2048;
          v77 = v54;
          v78 = 2112;
          v79 = v56;
          v80 = 2048;
          v81 = v57;
          v82 = 2112;
          v83 = v64;
          v84 = 2048;
          v85 = v45;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v42, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

        }
        v14 = v62;
      }

    }
    v33 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v39);

    goto LABEL_36;
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3306, CFSTR("Not a playable live photo asset"));
    v31 = (PHImageDisplaySpec *)objc_claimAutoreleasedReturnValue();
    v86 = CFSTR("PHImageErrorKey");
    v87[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v15 + 2))(v15, 0, v32);

    v33 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v33 = 0;
LABEL_37:

  return v33;
}

- (PHImageRequestID)requestAVAssetForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void *)resultHandler
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = resultHandler;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PHImageManager_requestAVAssetForVideo_options_resultHandler___block_invoke;
  v11[3] = &unk_1E35DF458;
  v12 = v8;
  v9 = v8;
  LODWORD(options) = -[PHImageManager requestAVAssetForAsset:options:resultHandler:](self, "requestAVAssetForAsset:options:resultHandler:", asset, options, v11);

  return (int)options;
}

- (PHImageRequestID)requestExportSessionForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options exportPreset:(NSString *)exportPreset resultHandler:(void *)resultHandler
{
  PHAsset *v10;
  PHVideoRequestOptions *v11;
  NSString *v12;
  void *v13;
  PHVideoRequestOptions *v14;
  PHVideoRequestOptions *v15;
  void *v16;
  PHImageRequestID v17;
  PHVideoRequestOptions *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t managerID;
  NSString *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  void *v35;
  os_signpost_id_t v36;
  _QWORD v37[5];
  PHVideoRequestOptions *v38;
  NSString *v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  const __CFString *v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v10 = asset;
  v11 = options;
  v12 = exportPreset;
  v13 = resultHandler;
  if ((objc_msgSend((id)objc_opt_class(), "_allowVideoAccessForAsset:options:", v10, v11) & 1) != 0)
  {
    if (v11)
      v14 = (PHVideoRequestOptions *)-[PHVideoRequestOptions copy](v11, "copy");
    else
      v14 = objc_alloc_init(PHVideoRequestOptions);
    v18 = v14;
    if (-[PHVideoRequestOptions deliveryMode](v14, "deliveryMode") != PHVideoRequestOptionsDeliveryModeHighQualityFormat)
    {
      PLImageManagerGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v42 = -[PHVideoRequestOptions deliveryMode](v18, "deliveryMode");
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "Request for video export session with delivery mode of %ld is not allowed, request will require 'high quality' delivery mode", buf, 0xCu);
      }

      -[PHVideoRequestOptions setDeliveryMode:](v18, "setDeliveryMode:", 1);
    }
    if (!-[PHVideoRequestOptions restrictToPlayableOnCurrentDevice](v18, "restrictToPlayableOnCurrentDevice"))
    {
      PLImageManagerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, "Request for video export session without restricting to playable not allowed, request will restrict to playable", buf, 2u);
      }

      -[PHVideoRequestOptions setRestrictToPlayableOnCurrentDevice:](v18, "setRestrictToPlayableOnCurrentDevice:", 1);
    }
    v21 = -[PHImageManager nextID](self, "nextID");
    managerID = self->_managerID;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke;
    v37[3] = &unk_1E35DF6D8;
    v40 = v13;
    v37[4] = self;
    v15 = v18;
    v38 = v15;
    v23 = v12;
    v39 = v23;
    +[PHMediaRequestContext videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:](PHMediaRequestContext, "videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:", v21, managerID, v10, v15, 2, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      PLImageManagerGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v36 = os_signpost_id_generate(v25);
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v26 = objc_msgSend(v24, "managerID");
        v31 = objc_msgSend(v24, "requestID");
        v32 = objc_msgSend(v24, "type");
        v33 = v26;
        v34 = v12;
        if (_getNextLayoutID_onceToken != -1)
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        v27 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v28 = 101;
        }
        else
        {
          v28 = v27;
          objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v27);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        objc_msgSend(v24, "asset");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setSignpostID:", v36);
        objc_msgSend(v24, "setSignpostLayoutID:", v28);
        if (os_signpost_enabled(v25))
        {
          *(_DWORD *)buf = 134219266;
          v42 = v33;
          v43 = 2048;
          v44 = v31;
          v45 = 2112;
          v46 = v23;
          v47 = 2048;
          v48 = v32;
          v49 = 2112;
          v50 = v35;
          v51 = 2048;
          v52 = v28;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v36, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
        }

        v12 = v34;
      }

    }
    v17 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v24);

    v16 = v40;
    goto LABEL_30;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3306, 0);
    v15 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    v53 = CFSTR("PHImageErrorKey");
    v54[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v13 + 2))(v13, 0, v16);
    v17 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v17 = 0;
LABEL_31:

  return v17;
}

- (PHImageRequestID)requestPlayerItemForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void *)resultHandler
{
  PHAsset *v8;
  PHVideoRequestOptions *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  PHVideoRequestOptions *v19;
  PHVideoRequestOptions *v20;
  void *v21;
  PHImageRequestID v22;
  PHVideoRequestOptions *v23;
  _BOOL4 v24;
  void **v25;
  uint64_t v26;
  unint64_t managerID;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  void *v37;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  PHVideoRequestOptions *v44;
  NSObject *v45;
  _QWORD v46[5];
  PHAsset *v47;
  PHVideoRequestOptions *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD aBlock[4];
  NSObject *v53;
  id v54;
  os_signpost_id_t v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  const __CFString *v68;
  _QWORD v69[4];

  v69[1] = *MEMORY[0x1E0C80C00];
  v8 = asset;
  v9 = options;
  v10 = resultHandler;
  PLAvailabilityRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v8);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v57 = (uint64_t)v8;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "com.apple.photos.backend.requestPlayerItemForVideo", "requestPlayerItemForVideo %@", buf, 0xCu);
  }

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E35DF4A8;
  v16 = v14;
  v53 = v16;
  v55 = v12;
  v17 = v10;
  v54 = v17;
  v18 = _Block_copy(aBlock);
  if ((objc_msgSend((id)objc_opt_class(), "_allowVideoAccessForAsset:options:", v8, v9) & 1) != 0)
  {
    if (v9)
      v19 = (PHVideoRequestOptions *)-[PHVideoRequestOptions copy](v9, "copy");
    else
      v19 = objc_alloc_init(PHVideoRequestOptions);
    v23 = v19;
    if (-[PHVideoRequestOptions isNetworkAccessAllowed](v19, "isNetworkAccessAllowed")
      && -[PHImageManager _canStreamVideoForAsset:](self, "_canStreamVideoForAsset:", v8)
      && !-[PHVideoRequestOptions hasValidTimeRange](v23, "hasValidTimeRange")
      && !-[PHVideoRequestOptions downloadIntent](v23, "downloadIntent"))
    {
      -[PHVideoRequestOptions setStreamingAllowed:](v23, "setStreamingAllowed:", 1);
    }
    v45 = v16;
    v20 = v23;
    if (-[PHAsset deferredProcessingNeeded](v8, "deferredProcessingNeeded") == 2
      && -[PHVideoRequestOptions liveRenderVideoIfNeeded](v20, "liveRenderVideoIfNeeded"))
    {
      v24 = -[PHVideoRequestOptions isCurrentVersion](v20, "isCurrentVersion");

      if (v24)
      {
        v50[0] = v15;
        v50[1] = 3221225472;
        v50[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_546;
        v50[3] = &unk_1E35DF458;
        v25 = &v51;
        v51 = v18;
        v22 = -[PHImageManager _requestLiveRenderAVAssetForAsset:options:resultHandler:](self, "_requestLiveRenderAVAssetForAsset:options:resultHandler:", v8, v20, v50);
LABEL_35:
        v21 = *v25;
        goto LABEL_36;
      }
    }
    else
    {

    }
    v44 = v9;
    v26 = -[PHImageManager nextID](self, "nextID");
    managerID = self->_managerID;
    v46[0] = v15;
    v46[1] = 3221225472;
    v46[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
    v46[3] = &unk_1E35DF6D8;
    v49 = v18;
    v46[4] = self;
    v47 = v8;
    v48 = v20;
    +[PHMediaRequestContext videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:](PHMediaRequestContext, "videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:", v26, managerID, v47, v48, 0, v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    v25 = &v49;
    v9 = v44;
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      PLImageManagerGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_signpost_id_generate(v29);
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v31 = v30;
        v41 = objc_msgSend(v28, "managerID");
        v39 = objc_msgSend(v28, "requestID");
        v40 = objc_msgSend(v28, "type");
        v43 = v29;
        if (_getNextLayoutID_onceToken != -1)
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        v32 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
        if (v32 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v33 = 101;
        }
        else
        {
          v33 = v32;
          objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v32);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        objc_msgSend(v28, "asset");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "uuid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v31;
        objc_msgSend(v28, "setSignpostID:", v31);
        objc_msgSend(v28, "setSignpostLayoutID:", v33);
        v36 = v43;
        if (os_signpost_enabled(v36))
        {
          -[PHVideoRequestOptions targetSize](v44, "targetSize");
          DCIM_NSStringFromCGSize();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v57 = v41;
          v58 = 2048;
          v59 = v39;
          v60 = 2112;
          v61 = v37;
          v62 = 2048;
          v63 = v40;
          v64 = 2112;
          v65 = v42;
          v66 = 2048;
          v67 = v33;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v35, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

        }
        v9 = v44;
        v16 = v45;
        v25 = &v49;
        v29 = v43;
      }

    }
    v22 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v28);

    goto LABEL_35;
  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3306, 0);
    v20 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    v68 = CFSTR("PHImageErrorKey");
    v69[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *, uint64_t))v18 + 2))(v18, 0, v21, 1);
    v22 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v22 = 0;
LABEL_37:

  return v22;
}

- (int)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void (**v18)(void *, id);
  PHVideoRequestOptions *v19;
  PHVideoRequestOptions *v20;
  BOOL v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  int v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  unint64_t managerID;
  uint64_t NextLayoutID;
  unsigned int v38;
  void *v39;
  os_signpost_id_t spid;
  _QWORD v42[5];
  PHVideoRequestOptions *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD aBlock[4];
  NSObject *v49;
  id v50;
  os_signpost_id_t v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  PLAvailabilityRequestGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, v7);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    v53 = (uint64_t)v7;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "com.apple.photos.backend.requestPlayerItemForVideo", "requestPlayerItemForVideo %@", buf, 0xCu);
  }

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E35DF570;
  v15 = v13;
  v49 = v15;
  v51 = v11;
  v16 = v9;
  v50 = v16;
  v46[0] = v14;
  v46[1] = 3221225472;
  v46[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_557;
  v46[3] = &unk_1E35DF598;
  v17 = _Block_copy(aBlock);
  v47 = v17;
  v18 = (void (**)(void *, id))_Block_copy(v46);
  if (v8)
    v19 = (PHVideoRequestOptions *)objc_msgSend(v8, "copy");
  else
    v19 = objc_alloc_init(PHVideoRequestOptions);
  v20 = v19;
  v45 = 0;
  v21 = -[PHVideoRequestOptions isValidConfigurationWithError:](v19, "isValidConfigurationWithError:", &v45);
  v22 = v45;
  if (!v21)
  {
    v18[2](v18, v22);
LABEL_22:
    v28 = 0;
    goto LABEL_23;
  }
  if (!-[PHVideoRequestOptions restrictToStreamable](v20, "restrictToStreamable")
    || !objc_msgSend((id)objc_opt_class(), "_allowVideoAccessForAsset:options:", v7, v8)
    || !-[PHImageManager _canStreamVideoForAsset:](self, "_canStreamVideoForAsset:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3306, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v29);

    goto LABEL_22;
  }
  v38 = -[PHImageManager nextID](self, "nextID");
  managerID = self->_managerID;
  v42[0] = v14;
  v42[1] = 3221225472;
  v42[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_2;
  v42[3] = &unk_1E35DF5E8;
  v44 = v17;
  v42[4] = self;
  v43 = v20;
  +[PHMediaRequestContext videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:](PHMediaRequestContext, "videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:", v38, managerID, v7, v43, 0, v42);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v24);
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v33 = objc_msgSend(v23, "managerID");
      v31 = objc_msgSend(v23, "requestID");
      v32 = objc_msgSend(v23, "type");
      NextLayoutID = _getNextLayoutID();
      objc_msgSend(v23, "asset");
      v39 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v39;
      objc_msgSend(v39, "setSignpostID:", spid);
      objc_msgSend(v39, "setSignpostLayoutID:", NextLayoutID);
      v34 = v24;
      v26 = v24;
      if (os_signpost_enabled(v26))
      {
        objc_msgSend(v8, "targetSize");
        DCIM_NSStringFromCGSize();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v53 = v33;
        v54 = 2048;
        v55 = v31;
        v56 = 2112;
        v57 = v27;
        v58 = 2048;
        v59 = v32;
        v60 = 2112;
        v61 = v35;
        v62 = 2048;
        v63 = NextLayoutID;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

        v23 = v39;
      }

      v24 = v34;
    }

  }
  v28 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v23);

LABEL_23:
  return v28;
}

- (id)synchronousImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  PHImageRequestOptions *v13;
  PHImageRequestOptions *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (v11)
    v13 = (PHImageRequestOptions *)objc_msgSend(v11, "copy");
  else
    v13 = objc_alloc_init(PHImageRequestOptions);
  v14 = v13;
  -[PHImageRequestOptions setSynchronous:](v13, "setSynchronous:", 1);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__42840;
  v23 = __Block_byref_object_dispose__42841;
  v24 = 0;
  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__PHImageManager_synchronousImageForAsset_targetSize_contentMode_options___block_invoke;
  v18[3] = &unk_1E35DF610;
  v18[4] = &v19;
  objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, a5, v14, v18, width, height);

  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t managerID;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[PHImageManager nextID](self, "nextID");
  managerID = self->_managerID;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke;
  v32[3] = &unk_1E35DF660;
  v13 = v9;
  v34 = v13;
  v14 = v8;
  v33 = v14;
  +[PHMediaRequestContext videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:](PHMediaRequestContext, "videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:", v11, managerID, v10, v14, 3, v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v18 = v17;
      v19 = objc_msgSend(v15, "managerID");
      v20 = objc_msgSend(v15, "requestID");
      v30 = objc_msgSend(v15, "type");
      v31 = v19;
      if (_getNextLayoutID_onceToken != -1)
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      v21 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = 101;
      }
      else
      {
        v22 = v21;
        objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v21);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      objc_msgSend(v15, "asset");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setSignpostID:", v18);
      objc_msgSend(v15, "setSignpostLayoutID:", v22);
      v25 = v16;
      if (os_signpost_enabled(v25))
      {
        v29 = v20;
        objc_msgSend(v14, "targetSize");
        DCIM_NSStringFromCGSize();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v36 = v31;
        v37 = 2048;
        v38 = v29;
        v39 = 2112;
        v40 = v26;
        v41 = 2048;
        v42 = v30;
        v43 = 2112;
        v44 = v24;
        v45 = 2048;
        v46 = v22;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v18, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

      }
    }

  }
  v27 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v15);

  return v27;
}

- (int)_requestLiveRenderAVAssetForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t managerID;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  int v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[PHImageManager nextID](self, "nextID");
  managerID = self->_managerID;
  objc_msgSend(v8, "targetSize");
  v14 = v13;
  v16 = v15;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke;
  v36[3] = &unk_1E35DF3E0;
  v17 = v9;
  v38 = v17;
  v36[4] = self;
  v18 = v8;
  v37 = v18;
  +[PHLiveRenderEditingInputRequestContext videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:renderedVideoHandler:](PHLiveRenderEditingInputRequestContext, "videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:renderedVideoHandler:", v11, managerID, v10, v18, v36, v14, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  PLImageManagerGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_managerID;
    v22 = objc_msgSend(v19, "requestID");
    *(_DWORD *)buf = 134218240;
    v40 = v21;
    v41 = 2048;
    v42 = v22;
    _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEFAULT, "%ld-%ld - Making edit request in preparation for live rendering video", buf, 0x16u);
  }

  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_signpost_id_generate(v23);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v25 = v24;
      v26 = objc_msgSend(v19, "managerID");
      v27 = objc_msgSend(v19, "requestID");
      v34 = v26;
      v35 = objc_msgSend(v19, "type");
      if (_getNextLayoutID_onceToken != -1)
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      v28 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = 101;
      }
      else
      {
        v29 = v28;
        objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v28);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      objc_msgSend(v19, "asset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setSignpostID:", v25);
      objc_msgSend(v19, "setSignpostLayoutID:", v29);
      if (os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 134219266;
        v40 = v34;
        v41 = 2048;
        v42 = v27;
        v43 = 2112;
        v44 = &stru_1E35DFFF8;
        v45 = 2048;
        v46 = v35;
        v47 = 2112;
        v48 = v31;
        v49 = 2048;
        v50 = v29;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }

    }
  }
  v32 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v19);

  return v32;
}

- (int)requestAVAssetForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHVideoRequestOptions *v11;
  PHVideoRequestOptions *v12;
  NSObject *v13;
  int v14;
  PHVideoRequestOptions *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  _BOOL4 v18;
  id *v19;
  uint64_t v20;
  unint64_t managerID;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  os_signpost_id_t v37;
  _QWORD v38[5];
  PHVideoRequestOptions *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  const __CFString *v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "_allowVideoAccessForAsset:options:", v8, v9) & 1) != 0)
  {
    if (v9)
      v11 = (PHVideoRequestOptions *)objc_msgSend(v9, "copy");
    else
      v11 = objc_alloc_init(PHVideoRequestOptions);
    v15 = v11;
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_DEFAULT, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.photos.requestAVAsset", v13);
    -[PHVideoRequestOptions setResultHandlerQueue:](v15, "setResultHandlerQueue:", v17);

    v12 = v15;
    if (objc_msgSend(v8, "deferredProcessingNeeded") == 2
      && -[PHVideoRequestOptions liveRenderVideoIfNeeded](v12, "liveRenderVideoIfNeeded"))
    {
      v18 = -[PHVideoRequestOptions isCurrentVersion](v12, "isCurrentVersion");

      if (v18)
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke;
        v41[3] = &unk_1E35DF458;
        v19 = &v42;
        v42 = v10;
        v14 = -[PHImageManager _requestLiveRenderAVAssetForAsset:options:resultHandler:](self, "_requestLiveRenderAVAssetForAsset:options:resultHandler:", v8, v12, v41);
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {

    }
    v20 = -[PHImageManager nextID](self, "nextID");
    managerID = self->_managerID;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_2;
    v38[3] = &unk_1E35DF5E8;
    v40 = v10;
    v38[4] = self;
    v39 = v12;
    +[PHMediaRequestContext videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:](PHMediaRequestContext, "videoRequestContextWithRequestID:managerID:asset:videoRequestOptions:intent:resultHandler:", v20, managerID, v8, v39, 1, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    v19 = &v40;
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      PLImageManagerGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_generate(v23);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v24;
        v35 = objc_msgSend(v22, "managerID");
        v32 = objc_msgSend(v22, "requestID");
        v34 = objc_msgSend(v22, "type");
        v37 = v25;
        if (_getNextLayoutID_onceToken != -1)
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        v26 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = 101;
        }
        else
        {
          v27 = v26;
          objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v26);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        objc_msgSend(v22, "asset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setSignpostID:", v37);
        objc_msgSend(v22, "setSignpostLayoutID:", v27);
        v29 = v23;
        if (os_signpost_enabled(v29))
        {
          v31 = v32;
          objc_msgSend(v9, "targetSize");
          DCIM_NSStringFromCGSize();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v44 = v35;
          v45 = 2048;
          v46 = v31;
          v47 = 2112;
          v48 = v33;
          v49 = 2048;
          v50 = v34;
          v51 = 2112;
          v52 = v36;
          v53 = 2048;
          v54 = v27;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v37, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

        }
        v19 = &v40;
      }

    }
    v14 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v22);

    goto LABEL_27;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3306, 0);
    v12 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    v55 = CFSTR("PHImageErrorKey");
    v56[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, NSObject *))v10 + 2))(v10, 0, 0, 0, v13);
    v14 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v14 = 0;
LABEL_29:

  return v14;
}

- (void)_handleResultForContentEditingInput:(id)a3 request:(id)a4 options:(id)a5 asset:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PHContentEditingInput *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char v31;
  void *v32;
  PHContentEditingInput *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  PHContentEditingInput *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v72[4];
  id v73;
  id v74;
  PHContentEditingInput *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  _QWORD v87[2];
  _QWORD v88[4];

  v88[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v11, "videoURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isPhoto") && v17
    || (v18 = 0, objc_msgSend(v14, "isVideo")) && v16)
  {
    objc_msgSend(v11, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v18 = 0;
      goto LABEL_31;
    }
    v67 = v16;
    v20 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v11, "uniformTypeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "typeWithIdentifier:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

    if (!objc_msgSend(v14, "shouldUseRAWResourceWithOriginalResourceChoice:", objc_msgSend(v14, "originalResourceChoice")))goto LABEL_11;
    if ((v23 & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v11, "baseVersionNeeded");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_11;
    v25 = (void *)v24;
    objc_msgSend(v11, "baseVersionNeeded");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    if (!v27)
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v29 = objc_msgSend(v14, "originalChoiceToFallbackForUnsupportRAW");
    }
    else
    {
LABEL_11:
      if (!objc_msgSend(v13, "shouldForceOriginalChoice"))
      {
        v68 = 0;
        goto LABEL_16;
      }
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v29 = objc_msgSend(v13, "originalChoice");
    }
    objc_msgSend(v28, "numberWithUnsignedInteger:", v29);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    objc_msgSend(v11, "uniformTypeIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "imageRef"))
      v69 = (void *)DCIM_newPLImageWithCGImage();
    else
      v69 = 0;
    objc_msgSend(v11, "exifOrientation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v30, "intValue");

    v31 = objc_msgSend(v11, "canHandleAdjustmentData");
    objc_msgSend(v11, "baseVersionNeeded");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v32, "integerValue");

    v33 = [PHContentEditingInput alloc];
    objc_msgSend(v14, "photoLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "photoLibraryURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PHContentEditingInput initWithAppropriateURL:](v33, "initWithAppropriateURL:", v35);

    -[PHContentEditingInput setMediaType:](v18, "setMediaType:", objc_msgSend(v14, "mediaType"));
    -[PHContentEditingInput setMediaSubtypes:](v18, "setMediaSubtypes:", objc_msgSend(v14, "mediaSubtypes"));
    -[PHContentEditingInput setPlaybackStyle:](v18, "setPlaybackStyle:", objc_msgSend(v14, "playbackStyle"));
    objc_msgSend(v14, "creationDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInput setCreationDate:](v18, "setCreationDate:", v36);

    objc_msgSend(v14, "location");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInput setLocation:](v18, "setLocation:", v37);

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v11, "adjustmentData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setAdjustmentData:](v18, "setAdjustmentData:", v38);

      objc_msgSend(v11, "adjustmentSecondaryDataURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setAdjustmentSecondaryDataURL:](v18, "setAdjustmentSecondaryDataURL:", v39);

    }
    else
    {
      -[PHContentEditingInput setAdjustmentData:](v18, "setAdjustmentData:", 0);
      -[PHContentEditingInput setAdjustmentSecondaryDataURL:](v18, "setAdjustmentSecondaryDataURL:", 0);
    }
    -[PHContentEditingInput setBaseVersion:](v18, "setBaseVersion:", v63);
    -[PHContentEditingInput setDisplaySizeImage:](v18, "setDisplaySizeImage:", v69);
    -[PHContentEditingInput setFullSizeImageURL:](v18, "setFullSizeImageURL:", v17);
    -[PHContentEditingInput setUniformTypeIdentifier:](v18, "setUniformTypeIdentifier:", v70);
    -[PHContentEditingInput setFullSizeImageOrientation:](v18, "setFullSizeImageOrientation:", v65);
    objc_msgSend(v11, "imageSandboxExtensionToken");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInput consumeSandboxExtensionToken:](v18, "consumeSandboxExtensionToken:", v40);

    -[PHContentEditingInput setOriginalResourceChoice:](v18, "setOriginalResourceChoice:", v68);
    v16 = v67;
    if (v67 && v17)
    {
      objc_msgSend(v11, "videoSandboxExtensionToken");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput consumeSandboxExtensionToken:](v18, "consumeSandboxExtensionToken:", v41);

      if ((objc_msgSend(v13, "forceReturnFullLivePhoto") & 1) != 0 || (objc_msgSend(v14, "mediaSubtypes") & 8) != 0)
      {
        if (objc_msgSend(v14, "playbackStyle") == 5)
        {
          v88[0] = v67;
          v88[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0;
          v43 = (id *)&v78;
          +[PHLivePhoto loopingLivePhotoWithResourceFileURLs:skipInstantiatingImageAndAVAsset:error:](PHLivePhoto, "loopingLivePhotoWithResourceFileURLs:skipInstantiatingImageAndAVAsset:error:", v42, objc_msgSend(v13, "skipLivePhotoImageAndAVAsset"), &v78);
          v44 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v87[0] = v67;
          v87[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v13, "skipLivePhotoImageAndAVAsset");
          v77 = 0;
          v43 = (id *)&v77;
          +[PHLivePhoto livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:error:](PHLivePhoto, "livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:error:", v42, 1, v57, &v77, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          v44 = objc_claimAutoreleasedReturnValue();
        }
        v58 = (void *)v44;
        v59 = *v43;

        if (!v58)
        {
          PLImageManagerGetLog();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "localIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v59, "code");
            objc_msgSend(v59, "domain");
            v66 = v59;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v80 = v64;
            v81 = 2112;
            v82 = v66;
            v83 = 2048;
            v84 = v62;
            v85 = 2114;
            v86 = v61;
            _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_ERROR, "Unable to create PHLivePhoto object for asset with localIdentifier: %{public}@, error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

            v59 = v66;
          }

        }
        -[PHContentEditingInput setLivePhoto:](v18, "setLivePhoto:", v58);

        v16 = v67;
      }
      if (objc_msgSend(v14, "playbackStyle") != 5)
        goto LABEL_30;
    }
    else if (!v67)
    {
LABEL_30:
      v45 = v11;
      objc_msgSend(v45, "overCapturePhotoURL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setOverCapturePhotoURL:](v18, "setOverCapturePhotoURL:", v46);

      objc_msgSend(v45, "overCaptureVideoURL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setOverCaptureVideoURL:](v18, "setOverCaptureVideoURL:", v47);

      objc_msgSend(v45, "frontSwappingImageRenderURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setFrontSwappingImageRenderURL:](v18, "setFrontSwappingImageRenderURL:", v48);

      objc_msgSend(v45, "backSwappingImageRenderURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setBackSwappingImageRenderURL:](v18, "setBackSwappingImageRenderURL:", v49);

      objc_msgSend(v45, "frontSwappingVideoRenderURL");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setFrontSwappingVideoRenderURL:](v18, "setFrontSwappingVideoRenderURL:", v50);

      objc_msgSend(v45, "backSwappingVideoRenderURL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInput setBackSwappingVideoRenderURL:](v18, "setBackSwappingVideoRenderURL:", v51);

      objc_msgSend(v45, "originalAdjustmentData");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHContentEditingInput setOriginalAdjustmentData:](v18, "setOriginalAdjustmentData:", v52);
      goto LABEL_31;
    }
    -[PHContentEditingInput setVideoURL:](v18, "setVideoURL:", v16);
    goto LABEL_30;
  }
LABEL_31:
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __94__PHImageManager__handleResultForContentEditingInput_request_options_asset_completionHandler___block_invoke;
  v72[3] = &unk_1E35DF520;
  v73 = v11;
  v74 = v12;
  v75 = v18;
  v76 = v15;
  v53 = v18;
  v54 = v12;
  v55 = v11;
  v56 = v15;
  -[PHImageManager _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:](self, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v54, v13, v72);

}

- (int)requestContentEditingInputForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  unint64_t managerID;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(a4, "copy");
  v11 = +[PHContentEditingInputRequestContext shouldUseRAWResourceAsUnadjustedBaseForAsset:options:](PHContentEditingInputRequestContext, "shouldUseRAWResourceAsUnadjustedBaseForAsset:options:", v8, v10);
  v12 = -[PHImageManager nextID](self, "nextID");
  managerID = self->_managerID;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __83__PHImageManager_requestContentEditingInputForAsset_withOptions_completionHandler___block_invoke;
  v32[3] = &unk_1E35DF6D8;
  v32[4] = self;
  v14 = v10;
  v33 = v14;
  v15 = v8;
  v34 = v15;
  v16 = v9;
  v35 = v16;
  +[PHMediaRequestContext contentEditingInputRequestContextWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:](PHMediaRequestContext, "contentEditingInputRequestContextWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:", v12, managerID, v15, v14, v11, v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_generate(v18);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      v21 = objc_msgSend(v17, "managerID");
      v22 = objc_msgSend(v17, "requestID");
      v30 = objc_msgSend(v17, "type");
      v31 = v21;
      v29 = v22;
      if (_getNextLayoutID_onceToken != -1)
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      v23 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = 101;
      }
      else
      {
        v24 = v23;
        objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v23);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      objc_msgSend(v17, "asset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setSignpostID:", v20);
      objc_msgSend(v17, "setSignpostLayoutID:", v24);
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134219266;
        v37 = v31;
        v38 = 2048;
        v39 = v29;
        v40 = 2112;
        v41 = &stru_1E35DFFF8;
        v42 = 2048;
        v43 = v30;
        v44 = 2112;
        v45 = v26;
        v46 = 2048;
        v47 = v24;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }

    }
  }
  v27 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v17);

  return v27;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHImageRequestOptions *v11;
  PHImageRequestOptions *v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t managerID;
  PHImageRequestOptions *v16;
  id v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  PHImageRequestOptions *v33;
  PHImageManager *v34;
  id v35;
  int v36;
  uint8_t buf[4];
  PHImageRequestOptions *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    v11 = (PHImageRequestOptions *)objc_msgSend(v9, "copy");
  else
    v11 = objc_alloc_init(PHImageRequestOptions);
  v12 = v11;
  -[PHImageRequestOptions setLoadingMode:](v11, "setLoadingMode:", 0x10000);
  -[PHImageRequestOptions setDeliveryMode:](v12, "setDeliveryMode:", 1);
  v13 = -[PHImageManager nextID](self, "nextID");
  PLImageManagerGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "(animated image) options: %@", buf, 0xCu);
  }

  if (PHImageManagerRecordEnabled())
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v13, CFSTR("(animated image) options: %@"), v12);
  managerID = self->_managerID;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v32[3] = &unk_1E35DF728;
  v16 = v12;
  v33 = v16;
  v34 = self;
  v17 = v10;
  v35 = v17;
  v36 = v13;
  +[PHMediaRequestContext imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:](PHMediaRequestContext, "imageRequestContextWithRequestID:managerID:asset:imageRequestOptions:displaySpec:resultHandler:", v13, managerID, v8, v16, 0, v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    PLImageManagerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v21 = v20;
      v30 = objc_msgSend(v18, "managerID");
      v31 = v8;
      v28 = objc_msgSend(v18, "requestID");
      v29 = objc_msgSend(v18, "type");
      if (_getNextLayoutID_onceToken != -1)
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      v22 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = 101;
      }
      else
      {
        v23 = v22;
        objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v22);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      objc_msgSend(v18, "asset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setSignpostID:", v21);
      objc_msgSend(v18, "setSignpostLayoutID:", v23);
      if (os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 134219266;
        v38 = (PHImageRequestOptions *)v30;
        v39 = 2048;
        v40 = v28;
        v41 = 2112;
        v42 = &stru_1E35DFFF8;
        v43 = 2048;
        v44 = v29;
        v45 = 2112;
        v46 = v25;
        v47 = 2048;
        v48 = v23;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }

      v8 = v31;
    }

  }
  v26 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v18);

  return v26;
}

- (int)requestAVProxyForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  NSObject *v21;
  PHImageManager *v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isVideo") & 1) != 0)
  {
    v11 = -[PHImageManager nextID](self, "nextID");
    v12 = -[PHImageManager managerID](self, "managerID");
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke;
    v20 = &unk_1E35DF6D8;
    v21 = v8;
    v22 = self;
    v23 = v9;
    v24 = v10;
    +[PHSingleMediaRequestContext avProxyRequestContextWithRequestID:managerID:asset:options:resultHandler:](PHSingleMediaRequestContext, "avProxyRequestContextWithRequestID:managerID:asset:options:resultHandler:", v11, v12, v21, v23, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v13, v17, v18, v19, v20);

    v15 = v21;
  }
  else
  {
    PLImageManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Requesting avproxy from a non-video asset is invalid", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (void)mediaRequestContext:(id)a3 isQueryingCacheForRequest:(id)a4 didWait:(BOOL *)a5 didFindImage:(BOOL *)a6 resultHandler:(id)a7
{
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_requestContextsByID, 0);
}

void __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMediaMetadataTypeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("AVAssetProxy"))
      && (objc_msgSend(v5, "mediaMetadata"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      v10 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v5, "mediaMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v10, "propertyListWithData:options:format:error:", v11, 0, 0, &v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v35;

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v14)
        goto LABEL_19;
    }
    else
    {
      PLImageManagerGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mediaMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v16;
        v40 = 2114;
        v41 = v8;
        v42 = 2048;
        v43 = objc_msgSend(v17, "length");
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Failed to create avproxy for asset %{public}@ with metadata type %{public}@, data length: %ld", buf, 0x20u);

      }
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2938];
      v37 = CFSTR("Unable to create avproxy, wrong type or nonexistent data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v19);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v5, "videoURL");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v20 = (void *)MEMORY[0x1E0C8AF90];
      objc_msgSend(v5, "videoURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "assetWithURL:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      if (v14)
        goto LABEL_19;
    }
  }
  objc_msgSend(v5, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v22 && !v13)
  {
    PLImageManagerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Failed to create avproxy for asset %{public}@, error: %@", buf, 0x16u);

    }
    objc_msgSend(v5, "error");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
LABEL_19:
  objc_msgSend(v5, "setErrorIfNone:", v13);
  v26 = *(void **)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 48);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke_594;
  v31[3] = &unk_1E35DF3B8;
  v28 = *(id *)(a1 + 56);
  v33 = v5;
  v34 = v28;
  v32 = v14;
  v29 = v5;
  v30 = v14;
  objc_msgSend(v26, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, v27, v31);

}

void __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke_594(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sanitizedInfoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

void __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  PHAnimatedImage *v9;
  uint64_t v10;
  uint64_t v11;
  PHAnimatedImage *v12;
  PHAnimatedImage *v13;
  void *v14;
  uint64_t v15;
  id v16;
  PHAnimatedImage *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  PHAnimatedImage *v21;
  id v22;
  int v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(id *)(a1 + 32);
      v9 = [PHAnimatedImage alloc];
      if (objc_msgSend(v8, "allowPreCaching"))
        v10 = 2;
      else
        v10 = 0;
      v11 = objc_msgSend(v8, "useSharedImageDecoding");

      v12 = -[PHAnimatedImage initWithURL:cachingStrategy:useSharedDecoding:](v9, "initWithURL:cachingStrategy:useSharedDecoding:", v7, v10, v11);
    }
    else
    {
      v12 = -[PHAnimatedImage initWithURL:]([PHAnimatedImage alloc], "initWithURL:", v7);
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v15 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2;
  v19[3] = &unk_1E35DF700;
  v16 = *(id *)(a1 + 48);
  v21 = v13;
  v22 = v16;
  v23 = *(_DWORD *)(a1 + 56);
  v20 = v5;
  v17 = v13;
  v18 = v5;
  objc_msgSend(v14, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, v15, v19);

}

void __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "(animated image) called resultHandler with info: %@", buf, 0xCu);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", *(unsigned int *)(a1 + 56), CFSTR("(animated image) called resultHandler with info: %@"), v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __83__PHImageManager_requestContentEditingInputForAsset_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultForContentEditingInput:request:options:asset:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __94__PHImageManager__handleResultForContentEditingInput_request_options_asset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifierString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543874;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ content editing input request finished with %@, info: %@", (uint8_t *)&v6, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  dispatch_block_t v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[2];
  id v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "videoURL");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = a1[6];
  if (v9)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_5;
    block[3] = &unk_1E35DF368;
    v15 = &v23;
    v16 = &v22;
    v22 = v5;
    v23 = v9;
    v11 = v5;
    v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    objc_msgSend(a1[4], "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, a1[5], v12);

  }
  else
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(v5, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_3;
    v24[3] = &unk_1E35DF6B0;
    v15 = (id *)v25;
    v25[0] = v5;
    v16 = &v28;
    v17 = a1[5];
    v18 = a1[6];
    v19 = a1[4];
    v28 = v18;
    v25[1] = v19;
    v26 = v6;
    v27 = a1[5];
    v20 = v5;
    objc_msgSend(v13, "buildAVAssetFromVideoURL:infoDictionary:options:completion:", v8, v14, v17, v24);

  }
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setErrorIfNone:", a5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_4;
  block[3] = &unk_1E35DF688;
  v12 = *(id *)(a1 + 64);
  v18 = v9;
  v19 = v10;
  v22 = v12;
  v20 = v11;
  v21 = *(id *)(a1 + 32);
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend(*(id *)(a1 + 40), "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v16);

}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

  }
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 56), "sanitizedInfoDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v1, v2, v3, v5);

}

void __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)a1[6];
  if (v15)
  {
    v17 = (void *)a1[4];
    v16 = a1[5];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke_2;
    v18[3] = &unk_1E35DF688;
    v23 = v15;
    v19 = v11;
    v20 = v13;
    v21 = v12;
    v22 = v14;
    objc_msgSend(v17, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", 0, v16, v18);

  }
}

uint64_t __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

void __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "videoURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resultHandlerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultHandlerQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke_2;
      block[3] = &unk_1E35DF3B8;
      v13 = *(id *)(a1 + 40);
      v11 = v5;
      v12 = v4;
      dispatch_async(v7, block);

    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "sanitizedInfoDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v5, v9);

    }
  }

}

void __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sanitizedInfoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

void __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_573(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PHImageResultClientShouldRetryKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    if (v4)
    {
      PLImageManagerGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "identifierString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM]: %@ client should retry", (uint8_t *)&v7, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    CGImageRelease(*(CGImageRef *)(a1 + 56));
  }
}

void __74__PHImageManager_synchronousImageForAsset_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = *(id *)(a1 + 32);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 48);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = 134349056;
    v16 = a5;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_END, v14, "com.apple.photos.backend.requestPlayerItemForVideo", " enableTelemetry=YES resultItemFormat=%{signpost.telemetry:number1,public}td", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_557(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("PHImageErrorKey");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *, uint64_t))(v2 + 16))(v2, 0, 0, v5, 1);

  }
}

void __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v5, "sanitizedInfoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v5, "videoMediaItemMakerData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniformTypeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("PHImageFileUTIKey"));
    if (v9)
    {
      objc_msgSend(v5, "info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("PHImageResultAVAssetOutOfBandPresentationHintsKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("PHImageResultAVAssetOutOfBandPresentationHintsKey"));
      objc_msgSend(v5, "fingerPrint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("PHImageResultFingerPrintKey"));

      v15 = 4;
    }
    else if (v10)
    {
      v15 = 3;
    }
    else
    {
      v15 = 1;
    }
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_3;
    v22[3] = &unk_1E35DF5C0;
    v18 = *(id *)(a1 + 48);
    v23 = v10;
    v24 = v9;
    v25 = v8;
    v26 = v18;
    v27 = v15;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    objc_msgSend(v16, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, v17, v22);

  }
}

uint64_t __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a1[8]);
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = 134349056;
    v13 = a4;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_END, v11, "com.apple.photos.backend.requestPlayerItemForVideo", " enableTelemetry=YES resultItemFormat=%{signpost.telemetry:number1,public}td", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_546(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVideoComposition:", v10);
      objc_msgSend(v13, "setAudioMix:", v9);
      objc_msgSend(v13, "setSeekingWaitsForVideoCompositionRendering:", 1);
      v12 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v13 = 0;
    }
    (*(void (**)(uint64_t, void *, id, uint64_t))(v12 + 16))(v12, v13, v11, 5);

  }
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v5, "videoURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoMediaItemMakerData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "playerItemFromVideoMediaItemMakerDataInMediaResult:forAsset:", v5, *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      if (v9 && MEMORY[0x19AEBDEDC]())
      {
        v11 = (void *)MEMORY[0x1E0D75140];
        objc_msgSend(v9, "asset");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v10;
        v37[1] = 3221225472;
        v37[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3;
        v37[3] = &unk_1E35DF4D0;
        v38 = v9;
        objc_msgSend(v11, "metadataForAsset:completionHandler:", v12, v37);

      }
      v13 = *(void **)(a1 + 32);
      v33[0] = v10;
      v33[1] = 3221225472;
      v33[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_550;
      v33[3] = &unk_1E35DF3B8;
      v14 = *(_QWORD *)(a1 + 48);
      v36 = *(id *)(a1 + 56);
      v34 = v9;
      v35 = v5;
      v15 = v9;
      objc_msgSend(v13, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, v14, v33);

    }
    else
    {
      v16 = *(void **)(a1 + 32);
      if (v7)
      {
        v17 = (void *)objc_opt_class();
        objc_msgSend(v5, "info");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 48);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_551;
        v26[3] = &unk_1E35DF548;
        v27 = v7;
        v28 = *(id *)(a1 + 48);
        v20 = v5;
        v21 = *(_QWORD *)(a1 + 32);
        v29 = v20;
        v30 = v21;
        v31 = v6;
        v32 = *(id *)(a1 + 56);
        objc_msgSend(v17, "buildAVPlayerItemFromVideoURL:infoDictionary:options:completion:", v27, v18, v19, v26);

        v15 = v27;
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_555;
        v23[3] = &unk_1E35DF368;
        v22 = *(_QWORD *)(a1 + 48);
        v25 = *(id *)(a1 + 56);
        v24 = v5;
        objc_msgSend(v16, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, v22, v23);

        v15 = v25;
      }
    }

  }
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLImageManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstVideoTrackFormatDebugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "Media item maker player item asset %@: %{public}@", (uint8_t *)&v11, 0x16u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Error loading metadata for media item maker player item asset %@: %@", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }

}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_550(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sanitizedInfoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v2 + 16))(v2, v1, v3, 4);

}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_551(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  if (v7 && MEMORY[0x19AEBDEDC]())
  {
    v11 = (void *)MEMORY[0x1E0D75140];
    objc_msgSend(v7, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3_552;
    v22[3] = &unk_1E35DF4F8;
    v23 = *(id *)(a1 + 32);
    v24 = v7;
    objc_msgSend(v11, "metadataForAsset:completionHandler:", v12, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "includeTimeRangeMapper"))
    objc_msgSend(*(id *)(a1 + 48), "setInfo:forKey:", v8, CFSTR("PHImageResultTimeRangeMapperKey"));
  objc_msgSend(*(id *)(a1 + 48), "setErrorIfNone:", v9);
  v13 = *(void **)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 40);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_553;
  v17[3] = &unk_1E35DF520;
  v21 = *(id *)(a1 + 72);
  v18 = v7;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 32);
  v16 = v7;
  objc_msgSend(v13, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v14, v15, v17);

}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_555(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, uint64_t))(v1 + 16))(v1, 0, v2, 1);

}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3_552(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLImageManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v5, "firstVideoTrackFormatDebugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v11 = "Player item asset for URL %@: %{public}@";
      v12 = v8;
      v13 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1991EC000, v12, v13, v11, (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    v11 = "Error loading metadata for player item asset %@: %@";
    v12 = v8;
    v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_553(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sanitizedInfoDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "isFileURL"))
    v4 = 2;
  else
    v4 = 3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v2 + 16))(v2, v3, v5, v4);

}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[2];
  id v27;
  id v28;
  id v29;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "videoURL");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = *(void **)(a1 + 56);
  v10 = *(void **)(a1 + 32);
  if (v9)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_4;
    v22[3] = &unk_1E35DF368;
    v18 = &v24;
    v23 = v5;
    v24 = v9;
    v13 = v5;
    objc_msgSend(v10, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v6, v12, v22);
    v21 = v23;
  }
  else
  {
    v14 = (void *)objc_opt_class();
    objc_msgSend(v5, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_2;
    v25[3] = &unk_1E35DF480;
    v18 = (id *)v26;
    v19 = *(_QWORD *)(a1 + 32);
    v26[0] = v5;
    v26[1] = v19;
    v27 = v6;
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 56);
    v20 = v5;
    objc_msgSend(v14, "buildExportSessionFromVideoURL:infoDictionary:options:exportPreset:completion:", v8, v15, v17, v16, v25);

    v21 = v27;
  }

}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setErrorIfNone:", a3);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_3;
  v10[3] = &unk_1E35DF3B8;
  v8 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v6, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", v7, v8, v10);

}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sanitizedInfoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

uint64_t __63__PHImageManager_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(id *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  PHLivePhoto *v20;
  PHLivePhoto *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  PHLivePhoto *v25;
  uint64_t v26;
  void *v27;
  _QWORD block[4];
  PHLivePhoto *v29;
  id v30;
  id v31;
  __int128 v32;
  uint64_t v33;
  uint8_t buf[16];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (a1[6])
  {
    objc_msgSend(a1[4], "isNetworkAccessAllowed");
    v15 = v11;
    if ((objc_msgSend(v15, "containsValidData") & 1) != 0)
    {

      PLImageManagerGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "identifierString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "[RM]: %@ building live photo with live-rendered avasset", buf, 0xCu);

      }
      if (PHImageManagerRecordEnabled())
      {
        v26 = objc_msgSend(v12, "requestID");
        objc_msgSend(v12, "identifierString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v26, CFSTR("[RM]: %@ building live photo with live-rendered avasset"), v27);

      }
      objc_msgSend(a1[5], "fetchPropertySetsIfNeeded");
      memset(buf, 0, sizeof(buf));
      v35 = 0;
      objc_msgSend(a1[5], "photoIrisProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "photoIrisStillDisplayTime");
      }
      else
      {
        memset(buf, 0, sizeof(buf));
        v35 = 0;
      }

      v21 = [PHLivePhoto alloc];
      v22 = objc_msgSend(v15, "imageRef");
      v23 = objc_msgSend(v15, "uiOrientation");
      v24 = a1[5];
      v32 = *(_OWORD *)buf;
      v33 = v35;
      v20 = -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:](v21, "initWithImage:uiOrientation:videoAsset:photoTime:asset:", v22, v23, v13, &v32, v24);
    }
    else
    {
      if ((objc_msgSend(v15, "isCancelled") & 1) == 0)
        objc_msgSend(v15, "isInCloud");

      v20 = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_526;
    block[3] = &unk_1E35DF3B8;
    v31 = a1[6];
    v29 = v20;
    v30 = v14;
    v25 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_530(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  int v10;
  void (**v11)(void *, _QWORD, void *);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(void *, _QWORD, void *);
  char v31;
  __int128 v32;
  uint64_t v33;
  _QWORD aBlock[4];
  id v35;
  _BYTE buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "isNetworkAccessAllowed");
  v8 = v5;
  if ((objc_msgSend(v8, "containsValidData") & 1) != 0)
  {
    v9 = 0;
  }
  else if ((objc_msgSend(v8, "isCancelled") & 1) != 0)
  {
    v9 = 1;
  }
  else if (v7 | objc_msgSend(v8, "isInCloud") ^ 1)
  {
    v9 = 3;
  }
  else
  {
    v9 = 2;
  }

  v10 = objc_msgSend(v8, "isDegraded");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
  aBlock[3] = &unk_1E35DF408;
  v35 = *(id *)(a1 + 56);
  v11 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v10)
  {
    if (!objc_msgSend(v8, "imageRef") && v9)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "deliveryMode") != 2)
        goto LABEL_24;
      goto LABEL_14;
    }
  }
  else if (v9)
  {
LABEL_14:
    objc_msgSend(v8, "sanitizedInfoDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);

    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsIfNeeded");
  v32 = 0uLL;
  v33 = 0;
  objc_msgSend(*(id *)(a1 + 40), "photoIrisProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "photoIrisStillDisplayTime");
  }
  else
  {
    v32 = 0uLL;
    v33 = 0;
  }

  if ((v10 & 1) == 0)
  {
    PLImageManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "identifierString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "[RM]: %@ building live photo with video URL: %@", buf, 0x16u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v23 = objc_msgSend(v6, "requestID");
      objc_msgSend(v6, "identifierString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v23, CFSTR("[RM]: %@ building live photo with video URL: %@"), v24, v25);

    }
  }
  v26 = *(void **)(a1 + 48);
  v18 = objc_msgSend(v8, "imageRef");
  v19 = objc_msgSend(v8, "uiOrientation");
  objc_msgSend(v8, "videoURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "info");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 40);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_534;
  v27[3] = &unk_1E35DF430;
  v28 = v6;
  v31 = v10;
  v29 = v8;
  v30 = v11;
  *(_OWORD *)buf = v32;
  *(_QWORD *)&buf[16] = v33;
  objc_msgSend(v26, "_prepareLivePhotoResultWithImage:uiOrientation:shouldIncludeVideo:videoURL:info:photoTime:asset:completion:", v18, v19, v10 ^ 1u, v20, v21, buf, v22, v27);

LABEL_24:
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E35DF3B8;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_534(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  _BYTE buf[22];
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLImageManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifierString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v8;
    if (v9)
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "[RM]: %@ live photo request finished with live photo: %@, error: %@, isDegraded: %@", buf, 0x2Au);

  }
  if (PHImageManagerRecordEnabled())
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "requestID");
    objc_msgSend(*(id *)(a1 + 32), "identifierString");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (*(_BYTE *)(a1 + 56))
      v16 = CFSTR("Y");
    else
      v16 = CFSTR("N");
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v13, CFSTR("[RM]: %@ live photo request finished with live photo: %@, error: %@, isDegraded: %@"), v14, v5, v6, v16, *(_OWORD *)buf);

  }
  objc_msgSend(*(id *)(a1 + 40), "setErrorIfNone:", v6);
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sanitizedInfoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);

}

uint64_t __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

uint64_t __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_526(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __125__PHImageManager__prepareLivePhotoResultWithImage_uiOrientation_shouldIncludeVideo_videoURL_info_photoTime_asset_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  PHLivePhoto *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PHLivePhoto *v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, PHLivePhoto *);
  __int128 v16;
  uint64_t v17;

  v7 = a2;
  if (v7)
  {
    v8 = a5;
    v9 = [PHLivePhoto alloc];
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v16 = *(_OWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 80);
    v13 = -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:](v9, "initWithImage:uiOrientation:videoAsset:photoTime:asset:", v10, v11, v7, &v16, v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void (**)(uint64_t, _QWORD, PHLivePhoto *))(v14 + 16);
    v13 = a5;
    v15(v14, 0, v13);
  }

}

void __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke_2;
  v10[3] = &unk_1E35DF368;
  v8 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v6, "_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:options:block:", a3, v7, v10);

}

void __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniformTypeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "cgOrientation");
    objc_msgSend(*(id *)(a1 + 32), "sanitizedInfoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, uint64_t, void *))(v1 + 16))(v1, v6, v3, v4, v5);

  }
}

void __65__PHImageManager_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(void *, id, id, _QWORD, id);
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v12 = PLImageOrientationFromExifOrientation();
      (*(void (**)(uint64_t, id, id, uint64_t, id))(v11 + 16))(v11, v14, v9, v12, v10);
    }
    else
    {
      v13 = (void (**)(void *, id, id, _QWORD, id))_Block_copy(*(const void **)(a1 + 32));
      v13[2](v13, v14, v9, a4, v10);

    }
  }

}

+ (PHImageManager)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PHImageManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_42910 != -1)
    dispatch_once(&defaultManager_onceToken_42910, block);
  return (PHImageManager *)(id)defaultManager_manager;
}

+ (BOOL)_allowVideoAccessForAsset:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = (objc_msgSend(v5, "isVideo") & 1) != 0
    || objc_msgSend(v5, "playbackStyle") == 4
    || objc_msgSend(v5, "playbackStyle") == 5
    || objc_msgSend(v5, "isPhotoIris") && (objc_msgSend(v6, "isVideoComplementAllowed") & 1) != 0;

  return v7;
}

void __32__PHImageManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v1;

  *(_QWORD *)(defaultManager_manager + 32) = 1;
}

@end
