@implementation PHLiveRenderEditingInputRequestContext

- (PHLiveRenderEditingInputRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8
{
  _BOOL8 v8;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  PHLiveRenderEditingInputRequestContext *v17;
  objc_super v19;

  v8 = a7;
  v12 = *(_QWORD *)&a3;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  objc_msgSend(v15, "setForceReturnFullLivePhoto:", 1);
  v19.receiver = self;
  v19.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  v17 = -[PHContentEditingInputRequestContext initWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:](&v19, sel_initWithRequestID_managerID_asset_options_useRAWAsUnadjustedBase_resultHandler_, v12, a4, v16, v15, v8, v14);

  if (v17)
    v17->_renderLock._os_unfair_lock_opaque = 0;
  return v17;
}

- (id)initialRequests
{
  void *v3;
  PHVideoRequestBehaviorSpec *v4;
  PHVideoRequest *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  PHVideoRequest *v11;
  PHVideoRequest *onDemandRenderRequest;
  NSProgress *onDemandRenderProgress;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  -[PHContentEditingInputRequestContext initialRequests](&v17, sel_initialRequests);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHMediaRequestLiveRenderingOptions liveRenderAndOnDemandRenderVideoConcurrently](self->_liveRenderOptions, "liveRenderAndOnDemandRenderVideoConcurrently"))
  {
    v4 = objc_alloc_init(PHVideoRequestBehaviorSpec);
    -[PHVideoRequestBehaviorSpec setDeliveryMode:](v4, "setDeliveryMode:", 1);
    -[PHVideoRequestBehaviorSpec setVersion:](v4, "setVersion:", 0);
    v5 = [PHVideoRequest alloc];
    v6 = -[PHMediaRequestContext requestID](self, "requestID");
    v7 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v8 = -[PHContentEditingInputRequestContext type](self, "type");
    v9 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PHVideoRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:](v5, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:", v6, v7, v8, v9, v10, 0, v4, self);
    onDemandRenderRequest = self->_onDemandRenderRequest;
    self->_onDemandRenderRequest = v11;

    onDemandRenderProgress = self->_onDemandRenderProgress;
    -[PHMediaRequest identifierString](self->_onDemandRenderRequest, "identifierString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", onDemandRenderProgress, v14);

    objc_msgSend(v3, "arrayByAddingObject:", self->_onDemandRenderRequest);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
  }
  return v3;
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  PHVideoRequest *v10;
  id v11;
  void *v12;
  objc_super v14;

  v7 = a5;
  v8 = a4;
  v10 = (PHVideoRequest *)a3;
  v11 = a6;
  if (-[PHMediaRequestLiveRenderingOptions liveRenderAndOnDemandRenderVideoConcurrently](self->_liveRenderOptions, "liveRenderAndOnDemandRenderVideoConcurrently")&& self->_onDemandRenderRequest == v10)
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PHLiveRenderEditingInputRequestContext;
    -[PHContentEditingInputRequestContext produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:](&v14, sel_produceChildRequestsForRequest_reportingIsLocallyAvailable_isDegraded_result_, v10, v8, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  id v6;
  PHVideoRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  id renderedVideoHandler;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  PHLiveRenderEditingInputRequestContext *v16;
  PHVideoRequest *v17;

  v6 = a3;
  v7 = (PHVideoRequest *)a4;
  if (-[PHMediaRequestLiveRenderingOptions liveRenderAndOnDemandRenderVideoConcurrently](self->_liveRenderOptions, "liveRenderAndOnDemandRenderVideoConcurrently")&& self->_onDemandRenderRequest == v7)
  {
    objc_msgSend(v6, "videoURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "videoURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__PHLiveRenderEditingInputRequestContext_processMediaResult_forRequest___block_invoke;
      v14[3] = &unk_1E35DD770;
      v15 = v6;
      v16 = self;
      v17 = v7;
      +[PHImageManager buildAVAssetFromVideoURL:infoDictionary:options:completion:](PHImageManager, "buildAVAssetFromVideoURL:infoDictionary:options:completion:", v9, v10, 0, v14);

    }
    else
    {
      renderedVideoHandler = self->_renderedVideoHandler;
      objc_msgSend(v6, "info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, PHVideoRequest *, _QWORD, _QWORD, _QWORD, void *))renderedVideoHandler + 2))(renderedVideoHandler, 0, v7, 0, 0, 0, v12);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PHLiveRenderEditingInputRequestContext;
    -[PHContentEditingInputRequestContext processMediaResult:forRequest:](&v13, sel_processMediaResult_forRequest_, v6, v7);
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_renderLock;
  PLPhotoEditRenderer *renderer;
  objc_super v5;

  p_renderLock = &self->_renderLock;
  os_unfair_lock_lock(&self->_renderLock);
  v5.receiver = self;
  v5.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  -[PHContentEditingInputRequestContext cancel](&v5, sel_cancel);
  renderer = self->_renderer;
  os_unfair_lock_unlock(p_renderLock);
  if (renderer)
    -[PLPhotoEditRenderer cancelAllRenders](self->_renderer, "cancelAllRenders");
}

- (id)progressHandler
{
  return (id)-[PHMediaRequestLiveRenderingOptions progressHandler](self->_liveRenderOptions, "progressHandler");
}

- (id)progresses
{
  void *v3;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[PHMediaRequestLiveRenderingOptions liveRenderAndOnDemandRenderVideoConcurrently](self->_liveRenderOptions, "liveRenderAndOnDemandRenderVideoConcurrently"))
  {
    v6[0] = self->_onDemandRenderProgress;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHLiveRenderEditingInputRequestContext;
    -[PHContentEditingInputRequestContext progresses](&v5, sel_progresses);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_handleRenderVideoFinishedWithRequest:(id)a3 avAsset:(id)a4 videoComposition:(id)a5 audioMix:(id)a6 error:(id)a7 mutableInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("PHImageErrorKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHMediaRequestContext isCancelled](self, "isCancelled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("PHImageCancelledKey"));

  PLImageManagerGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "identifierString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v22;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - Live rendering video completed with error: %@", (uint8_t *)&v25, 0x16u);

  }
  if (!v15)
  {
    PLImageManagerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[PHContentEditingInputResult videoURL](self->super._contentEditingInputResult, "videoURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v24;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Error live rendering video at URL: %@, error: %@", (uint8_t *)&v25, 0x16u);

    }
  }
  (*((void (**)(void))self->_renderedVideoHandler + 2))();
  -[PHMediaRequestContext finishCustomAsyncWorkWithIdentifier:](self, "finishCustomAsyncWorkWithIdentifier:", CFSTR("renderVideoWithTargetSize"));

}

- (void)processAndReturnResultsWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  PLPhotoEditRenderer *v20;
  PLPhotoEditRenderer *renderer;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  PLPhotoEditRenderer *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  -[PHContentEditingInputRequestContext processAndReturnResultsWithRequest:](&v45, sel_processAndReturnResultsWithRequest_, v4);
  -[PHCompositeMediaResult info](self->super._contentEditingInputResult, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHContentEditingInputCancelledKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PHImageCancelledKey"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHContentEditingInputResultIsInCloudKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("PHImageResultIsInCloudKey"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHContentEditingInputErrorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("PHImageErrorKey"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("PHContentEditingInputCancelledKey"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("PHContentEditingInputResultIsInCloudKey"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("PHContentEditingInputErrorKey"));
  if (-[PHMediaRequestLiveRenderingOptions liveRenderAndOnDemandRenderVideoConcurrently](self->_liveRenderOptions, "liveRenderAndOnDemandRenderVideoConcurrently"))objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultIsDegradedKey"));
  if (-[PHMediaRequestContext isCancelled](self, "isCancelled")
    || !-[PHContentEditingInputResult containsValidData](self->super._contentEditingInputResult, "containsValidData")
    || (-[PHContentEditingInputResult videoURL](self->super._contentEditingInputResult, "videoURL"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = v10 == 0,
        v10,
        v11))
  {
    v28 = -[PHMediaRequestContext isCancelled](self, "isCancelled");
    PLImageManagerGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "identifierString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v31;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - Request was cancelled, will not live render", buf, 0xCu);

      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageCancelledKey"));
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "identifierString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v32;
        v48 = 2112;
        v49 = (uint64_t)v33;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "%@ Video URL unavailable, will not live render, error: %@", buf, 0x16u);

      }
    }
    (*((void (**)(void))self->_renderedVideoHandler + 2))();
  }
  else
  {
    -[PHContentEditingInputResult videoURL](self->super._contentEditingInputResult, "videoURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInputResult overCaptureVideoURL](self->super._contentEditingInputResult, "overCaptureVideoURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInputResult imageURL](self->super._contentEditingInputResult, "imageURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInputResult adjustmentData](self->super._contentEditingInputResult, "adjustmentData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formatIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formatVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "identifierString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v16;
      v48 = 2112;
      v49 = (uint64_t)v40;
      v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - preparing live renderer for video at URL: %@, overcapture URL: %@", buf, 0x20u);

    }
    PLImageManagerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "identifierString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v14, "length");
      *(_DWORD *)buf = 138413058;
      v47 = v18;
      v48 = 2048;
      v49 = v19;
      v50 = 2112;
      v51 = v39;
      v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - adj data length: %ld, format id: %@, version: %@", buf, 0x2Au);

    }
    os_unfair_lock_lock(&self->_renderLock);
    objc_msgSend(MEMORY[0x1E0D71990], "rendererForVideoURL:livePhotoStillURL:adjustmentData:formatIdentifier:formatVersion:", v40, v38, v14, v39, v13);
    v20 = (PLPhotoEditRenderer *)objc_claimAutoreleasedReturnValue();
    renderer = self->_renderer;
    self->_renderer = v20;

    os_unfair_lock_unlock(&self->_renderLock);
    if (self->_renderer)
    {
      objc_initWeak((id *)buf, self);
      -[PHMediaRequestContext beginCustomAsyncWorkWithIdentifier:](self, "beginCustomAsyncWorkWithIdentifier:", CFSTR("renderVideoWithTargetSize"));
      -[PHContentEditingInputRequestContext options](self, "options");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "targetSize");
      v24 = v23;
      v26 = v25;

      if (v24 == -1.0 && v26 == -1.0)
      {
        v24 = *MEMORY[0x1E0C9D820];
        v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      v27 = self->_renderer;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __77__PHLiveRenderEditingInputRequestContext_processAndReturnResultsWithRequest___block_invoke;
      v41[3] = &unk_1E35DD798;
      objc_copyWeak(&v44, (id *)buf);
      v42 = v4;
      v43 = v6;
      -[PLPhotoEditRenderer renderVideoWithTargetSize:name:completion:](v27, "renderVideoWithTargetSize:name:completion:", CFSTR("PHLiveRenderEditingInputRequestContext-renderVideo"), v41, v24, v26);
      os_unfair_lock_lock(&self->_renderLock);
      LODWORD(v27) = -[PHMediaRequestContext isCancelled](self, "isCancelled");
      os_unfair_lock_unlock(&self->_renderLock);
      if ((_DWORD)v27)
        -[PLPhotoEditRenderer cancelAllRenders](self->_renderer, "cancelAllRenders");

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      PLImageManagerGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "identifierString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v35;
        _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_ERROR, "%@ PLPhotoEditRenderer unavailable, will not live render", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("PLPhotoEditRenderer unavailable, will not live render"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("PHImageErrorKey"));

      (*((void (**)(void))self->_renderedVideoHandler + 2))();
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRenderProgress, 0);
  objc_storeStrong((id *)&self->_onDemandRenderRequest, 0);
  objc_storeStrong((id *)&self->_liveRenderOptions, 0);
  objc_storeStrong(&self->_renderedVideoHandler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

void __77__PHLiveRenderEditingInputRequestContext_processAndReturnResultsWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v9 = (id *)(a1 + 48);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_handleRenderVideoFinishedWithRequest:avAsset:videoComposition:audioMix:error:mutableInfo:", *(_QWORD *)(a1 + 32), v13, v12, v11, v10, *(_QWORD *)(a1 + 40));

}

void __72__PHLiveRenderEditingInputRequestContext_processMediaResult_forRequest___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v9 = (void *)a1[4];
  v10 = a4;
  v11 = a3;
  v12 = a2;
  objc_msgSend(v9, "setErrorIfNone:", a5);
  v13 = (void *)a1[4];
  v14 = *(_QWORD *)(a1[5] + 304);
  v15 = a1[6];
  objc_msgSend(v13, "info");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, id, id, id, id))(v14 + 16))(v14, v13, v15, v12, v10, v11, v16);

}

+ (id)videoLiveRenderContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 renderedVideoHandler:(id)a9
{
  double height;
  double width;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  PHContentEditingInputRequestOptions *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  height = a7.height;
  width = a7.width;
  v16 = *(_QWORD *)&a3;
  v18 = a6;
  v19 = a9;
  v20 = a5;
  v21 = objc_alloc_init(PHContentEditingInputRequestOptions);
  -[PHContentEditingInputRequestOptions setCanHandleAdjustmentData:](v21, "setCanHandleAdjustmentData:", &__block_literal_global_32299);
  objc_msgSend(v18, "renderResultHandlerQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingInputRequestOptions setResultHandlerQueue:](v21, "setResultHandlerQueue:", v22);

  -[PHContentEditingInputRequestOptions setNetworkAccessAllowed:](v21, "setNetworkAccessAllowed:", objc_msgSend(v18, "isNetworkAccessAllowed"));
  -[PHContentEditingInputRequestOptions setTargetSize:](v21, "setTargetSize:", width, height);
  -[PHContentEditingInputRequestOptions setContentMode:](v21, "setContentMode:", a8);
  v23 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:", v16, a4, v20, v21, 0, 0);

  v24 = _Block_copy(v19);
  v25 = *(void **)(v23 + 304);
  *(_QWORD *)(v23 + 304) = v24;

  objc_storeStrong((id *)(v23 + 312), a6);
  if (objc_msgSend(v18, "liveRenderAndOnDemandRenderVideoConcurrently"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(v23 + 328);
    *(_QWORD *)(v23 + 328) = v26;

  }
  return (id)v23;
}

+ (id)videoLiveRenderContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 targetSize:(CGSize)a7 renderedVideoHandler:(id)a8
{
  return (id)objc_msgSend(a1, "videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:contentMode:renderedVideoHandler:", *(_QWORD *)&a3, a4, a5, a6, 0, a8, a7.width, a7.height);
}

@end
