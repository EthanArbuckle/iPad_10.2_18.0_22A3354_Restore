@implementation PHLivePhotoRequestContext

- (PHLivePhotoRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 resultHandler:(id)a8
{
  uint64_t v13;
  id v15;
  PHLivePhotoRequestContext *v16;
  PHLivePhotoRequestContext *v17;
  PHLivePhotoResult *v18;
  PHLivePhotoResult *livePhotoResult;
  char v20;
  objc_super v22;

  v13 = *(_QWORD *)&a3;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PHLivePhotoRequestContext;
  v16 = -[PHMediaRequestContext initWithRequestID:managerID:asset:displaySpec:resultHandler:](&v22, sel_initWithRequestID_managerID_asset_displaySpec_resultHandler_, v13, a4, a5, a6, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_livePhotoOptions, a7);
    v18 = -[PHCompositeMediaResult initWithRequestID:]([PHLivePhotoResult alloc], "initWithRequestID:", v13);
    livePhotoResult = v17->_livePhotoResult;
    v17->_livePhotoResult = v18;

    if (v15)
      v20 = objc_msgSend(v15, "includeImage");
    else
      v20 = 1;
    v17->_includeImage = v20;
    -[PHLivePhotoResult setRequiresImageResult:](v17->_livePhotoResult, "setRequiresImageResult:");
    v17->_lock._os_unfair_lock_opaque = 0;
  }

  return v17;
}

- (PHLivePhotoRequestContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLivePhotoRequestContext.m"), 51, CFSTR("Unavailable initializer"));

  return 0;
}

- (BOOL)_shouldRequestVideo
{
  return -[PHLivePhotoRequestOptions deliveryMode](self->_livePhotoOptions, "deliveryMode") != PHImageRequestOptionsDeliveryModeFastFormat;
}

- (id)_lazyImageProgress
{
  NSProgress *v3;
  NSProgress *imageProgress;

  if (!self->_imageProgress && -[PHLivePhotoRequestContext shouldReportProgress](self, "shouldReportProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    imageProgress = self->_imageProgress;
    self->_imageProgress = v3;

  }
  return self->_imageProgress;
}

- (id)_lazyVideoProgress
{
  NSProgress *v3;
  NSProgress *videoProgress;

  if (!self->_videoProgress && -[PHLivePhotoRequestContext shouldReportProgress](self, "shouldReportProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 150);
    v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    videoProgress = self->_videoProgress;
    self->_videoProgress = v3;

  }
  return self->_videoProgress;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHLivePhotoRequestOptions isNetworkAccessAllowed](self->_livePhotoOptions, "isNetworkAccessAllowed");
}

- (BOOL)representsShareableHighQualityResource
{
  return 1;
}

- (id)initialRequests
{
  PHImageRequestOptionsDeliveryMode v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  PHImageRequest *v17;
  PHVideoRequestBehaviorSpec *v18;
  uint64_t v19;
  PHImageRequest *v20;
  void *v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  PHVideoRequest *v28;
  PHVideoRequest *videoRequest;
  void *v30;
  void *v31;
  PHImageRequest *v32;
  void *fastImageRequest;
  void *v34;
  void *v35;
  unsigned int v37;
  PHVideoRequest *v38;
  PHImageRequest *v39;
  void *v40;
  PHImageRequestOptionsDeliveryMode v41;

  v3 = -[PHLivePhotoRequestOptions deliveryMode](self->_livePhotoOptions, "deliveryMode");
  -[PHLivePhotoRequestContext livePhotoOptions](self, "livePhotoOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHImageRequestBehaviorSpec livePhotoRequestInitialBehaviorSpecWithLivePhotoRequestOptions:asset:](PHImageRequestBehaviorSpec, "livePhotoRequestInitialBehaviorSpecWithLivePhotoRequestOptions:asset:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v41 = v3;
  if (self->_includeImage)
  {
    v39 = [PHImageRequest alloc];
    v37 = -[PHMediaRequestContext requestID](self, "requestID");
    v8 = v7;
    v9 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v10 = -[PHLivePhotoRequestContext type](self, "type");
    v11 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v13 = (void *)v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext imageResourceChooser](self, "imageResourceChooser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    v7 = v8;
    v17 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v39, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v37, v16, v10, v11, v12, v14, v13, v15, self);

    objc_msgSend(v8, "addObject:", v17);
  }
  else
  {
    v17 = 0;
    v13 = (void *)v6;
  }
  if (-[PHLivePhotoRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
  {
    v18 = objc_alloc_init(PHVideoRequestBehaviorSpec);
    -[PHVideoRequestBehaviorSpec setNetworkAccessAllowed:](v18, "setNetworkAccessAllowed:", -[PHLivePhotoRequestOptions isNetworkAccessAllowed](self->_livePhotoOptions, "isNetworkAccessAllowed"));
    -[PHVideoRequestBehaviorSpec setDeliveryMode:](v18, "setDeliveryMode:", 0);
    -[PHVideoRequestBehaviorSpec setDownloadIntent:](v18, "setDownloadIntent:", -[PHLivePhotoRequestOptions downloadIntent](self->_livePhotoOptions, "downloadIntent"));
    -[PHVideoRequestBehaviorSpec setDownloadPriority:](v18, "setDownloadPriority:", -[PHLivePhotoRequestOptions downloadPriority](self->_livePhotoOptions, "downloadPriority"));
    v38 = [PHVideoRequest alloc];
    v19 = -[PHMediaRequestContext requestID](self, "requestID");
    v20 = v17;
    v21 = v7;
    v22 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v23 = -[PHLivePhotoRequestContext type](self, "type");
    v24 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v40 = v13;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v22;
    v7 = v21;
    v17 = v20;
    v28 = -[PHVideoRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:](v38, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:", v19, v27, v23, v24, v25, v26, v18, self);
    videoRequest = self->_videoRequest;
    self->_videoRequest = v28;

    objc_msgSend(v7, "addObject:", self->_videoRequest);
    -[PHLivePhotoRequestContext _lazyVideoProgress](self, "_lazyVideoProgress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest identifierString](self->_videoRequest, "identifierString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v30, v31);

    v13 = v40;
  }
  else
  {
    self->_videoPartCompleted = 1;
  }
  if (v17)
  {
    switch(v41)
    {
      case PHImageRequestOptionsDeliveryModeFastFormat:
        goto LABEL_11;
      case PHImageRequestOptionsDeliveryModeHighQualityFormat:
        objc_storeStrong((id *)&self->_highQualityImageRequest, v17);
        -[PHLivePhotoRequestContext _lazyImageProgress](self, "_lazyImageProgress");
        fastImageRequest = (void *)objc_claimAutoreleasedReturnValue();
        -[PHMediaRequest identifierString](v17, "identifierString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", fastImageRequest, v34);

        goto LABEL_13;
      case PHImageRequestOptionsDeliveryModeOpportunistic:
LABEL_11:
        v32 = v17;
        fastImageRequest = self->_fastImageRequest;
        self->_fastImageRequest = v32;
LABEL_13:

        break;
    }
  }
  v35 = (void *)objc_msgSend(v7, "copy");

  return v35;
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  PHImageRequest *v10;
  id *p_highQualityImageRequest;
  void *v12;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  PHLivePhotoRequestOptions *livePhotoOptions;
  void *v22;
  void *v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  PHImageRequest *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v6 = a5;
  v7 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = (PHImageRequest *)a3;
  if (-[PHLivePhotoRequestOptions deliveryMode](self->_livePhotoOptions, "deliveryMode"))
    goto LABEL_7;
  if (self->_fastImageRequest != v10)
    goto LABEL_7;
  p_highQualityImageRequest = (id *)&self->_highQualityImageRequest;
  if (self->_highQualityImageRequest)
    goto LABEL_7;
  if (!v7 || v6)
  {
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v15)
      {
        -[PHMediaRequest identifierString](v10, "identifierString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v16;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %@ found degraded result for opp. request, kick off request for best image", buf, 0xCu);

      }
      if (!PHImageManagerRecordEnabled())
        goto LABEL_17;
      v17 = -[PHMediaRequest requestID](v10, "requestID");
      -[PHMediaRequest identifierString](v10, "identifierString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v17, CFSTR("[RM]: %@ found degraded result for opp. request, kick off request for best image"), v18);
    }
    else
    {
      if (v15)
      {
        -[PHMediaRequest identifierString](v10, "identifierString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v19;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %@ no local image for opp. request, kick off request for best image", buf, 0xCu);

      }
      if (!PHImageManagerRecordEnabled())
        goto LABEL_17;
      v34 = -[PHMediaRequest requestID](v10, "requestID");
      -[PHMediaRequest identifierString](v10, "identifierString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v34, CFSTR("[RM]: %@ no local image for opp. request, kick off request for best image"), v18);
    }

LABEL_17:
    -[PHImageRequest behaviorSpec](self->_fastImageRequest, "behaviorSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    livePhotoOptions = self->_livePhotoOptions;
    -[PHMediaRequestContext asset](self, "asset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageRequestBehaviorSpec livePhotoRequestBestBehaviorSpecWithPreviousBehaviorSpec:options:asset:](PHImageRequestBehaviorSpec, "livePhotoRequestBestBehaviorSpecWithPreviousBehaviorSpec:options:asset:", v20, livePhotoOptions, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = [PHImageRequest alloc];
    v35 = -[PHMediaRequestContext requestID](self, "requestID");
    v24 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v25 = -[PHLivePhotoRequestContext type](self, "type");
    v26 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext imageResourceChooser](self, "imageResourceChooser");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v36, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v35, v24, v25, v26, v27, v28, v23, v29, self);
    v31 = *p_highQualityImageRequest;
    *p_highQualityImageRequest = (id)v30;

    -[PHLivePhotoRequestContext _lazyImageProgress](self, "_lazyImageProgress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_highQualityImageRequest, "identifierString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v32, v33);

    v37 = *p_highQualityImageRequest;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_highQualityImageRequest, a3);
LABEL_7:
  v12 = 0;
LABEL_8:

  return v12;
}

- (BOOL)shouldReportProgress
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHLivePhotoRequestContext;
  v3 = -[PHMediaRequestContext shouldReportProgress](&v5, sel_shouldReportProgress);
  if (v3)
    LOBYTE(v3) = -[PHLivePhotoRequestOptions isNetworkAccessAllowed](self->_livePhotoOptions, "isNetworkAccessAllowed");
  return v3;
}

- (id)progressHandler
{
  return -[PHLivePhotoRequestOptions progressHandler](self->_livePhotoOptions, "progressHandler");
}

- (id)progresses
{
  PHImageRequestOptionsDeliveryMode v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!-[PHLivePhotoRequestContext shouldReportProgress](self, "shouldReportProgress"))
    return 0;
  v3 = -[PHLivePhotoRequestOptions deliveryMode](self->_livePhotoOptions, "deliveryMode");
  -[PHLivePhotoRequestContext _lazyImageProgress](self, "_lazyImageProgress");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 == PHImageRequestOptionsDeliveryModeFastFormat)
  {
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = v4;
    -[PHLivePhotoRequestContext _lazyVideoProgress](self, "_lazyVideoProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  id v6;
  PHVideoRequest *v7;
  PHVideoRequest *v8;
  PHImageRequestOptionsDeliveryMode v9;
  _BOOL4 v10;
  os_unfair_lock_s *p_lock;
  _BOOL4 includeImage;
  _BOOL4 videoPartCompleted;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PHLivePhotoResult *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (PHVideoRequest *)a4;
  v8 = v7;
  if (!self->super._resultHandler)
    goto LABEL_20;
  if (self->_videoRequest == v7)
  {
    -[PHLivePhotoResult addVideoResult:](self->_livePhotoResult, "addVideoResult:", v6);
    os_unfair_lock_lock(&self->_lock);
    self->_videoPartCompleted = 1;
    if (self->_imagePartCompleted)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      includeImage = self->_includeImage;
      os_unfair_lock_unlock(&self->_lock);
      if (includeImage)
        goto LABEL_20;
    }
LABEL_19:
    (*((void (**)(void))self->super._resultHandler + 2))();
    goto LABEL_20;
  }
  if ((PHVideoRequest *)self->_highQualityImageRequest == v7)
  {
    -[PHLivePhotoResult addImageResult:](self->_livePhotoResult, "addImageResult:", v6);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_imagePartCompleted = 1;
    goto LABEL_18;
  }
  v9 = -[PHLivePhotoRequestOptions deliveryMode](self->_livePhotoOptions, "deliveryMode");
  if (v9 == PHImageRequestOptionsDeliveryModeFastFormat)
  {
    -[PHLivePhotoResult addImageResult:](self->_livePhotoResult, "addImageResult:", v6);
    -[PHLivePhotoResult setDegraded:](self->_livePhotoResult, "setDegraded:", 1);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_imagePartCompleted = 1;
LABEL_18:
    videoPartCompleted = self->_videoPartCompleted;
    os_unfair_lock_unlock(p_lock);
    if (!videoPartCompleted)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (v9 == PHImageRequestOptionsDeliveryModeOpportunistic && !self->_imagePartCompleted)
  {
    if (v6 && objc_msgSend(v6, "imageRef"))
    {
      os_unfair_lock_lock(&self->_lock);
      if (!self->_imagePartCompleted)
      {
        os_unfair_lock_unlock(&self->_lock);
LABEL_26:
        v18 = -[PHCompositeMediaResult initWithRequestID:]([PHLivePhotoResult alloc], "initWithRequestID:", -[PHMediaRequest requestID](v8, "requestID"));
        -[PHLivePhotoResult addImageResult:](v18, "addImageResult:", v6);
        -[PHLivePhotoResult setDegraded:](v18, "setDegraded:", 1);
        (*((void (**)(void))self->super._resultHandler + 2))();

        goto LABEL_20;
      }
      v10 = self->_videoPartCompleted;
      os_unfair_lock_unlock(&self->_lock);
      if (!v10)
        goto LABEL_26;
    }
    else
    {
      PLImageManagerGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[PHMediaRequest identifierString](v8, "identifierString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %@ opportunistic early-stage request returned no image", buf, 0xCu);

      }
      if (PHImageManagerRecordEnabled())
      {
        v16 = -[PHMediaRequest requestID](v8, "requestID");
        -[PHMediaRequest identifierString](v8, "identifierString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v16, CFSTR("[RM]: %@ opportunistic early-stage request returned no image"), v17);

      }
    }
  }
LABEL_20:

}

- (PHLivePhotoRequestOptions)livePhotoOptions
{
  return self->_livePhotoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoOptions, 0);
  objc_storeStrong((id *)&self->_videoRequest, 0);
  objc_storeStrong((id *)&self->_highQualityImageRequest, 0);
  objc_storeStrong((id *)&self->_fastImageRequest, 0);
  objc_storeStrong((id *)&self->_livePhotoResult, 0);
  objc_storeStrong((id *)&self->_videoProgress, 0);
  objc_storeStrong((id *)&self->_imageProgress, 0);
}

@end
