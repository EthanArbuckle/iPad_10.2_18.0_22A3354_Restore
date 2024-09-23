@implementation PHImageRequestContext

- (BOOL)shouldReportProgress
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHImageRequestContext;
  v3 = -[PHMediaRequestContext shouldReportProgress](&v5, sel_shouldReportProgress);
  if (v3)
    LOBYTE(v3) = -[PHImageRequestOptions isNetworkAccessAllowed](self->_imageOptions, "isNetworkAccessAllowed");
  return v3;
}

- (id)progressHandler
{
  return -[PHImageRequestOptions progressHandler](self->_imageOptions, "progressHandler");
}

- (id)_produceFinalImageRequestForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHImageRequest *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PHImageRequest *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(v26, "behaviorSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImageRequestContext imageOptions](self, "imageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHImageRequestBehaviorSpec imageRequestBestBehaviorSpecWithPreviousBehaviorSpec:options:asset:](PHImageRequestBehaviorSpec, "imageRequestBestBehaviorSpecWithPreviousBehaviorSpec:options:asset:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PHImageRequest alloc];
  v9 = -[PHMediaRequestContext requestID](self, "requestID");
  v10 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v11 = -[PHImageRequestContext type](self, "type");
  v12 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext displaySpec](self, "displaySpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext imageResourceChooser](self, "imageResourceChooser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v8, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v9, v10, v11, v12, v13, v14, v7, v15, self);

  -[PHImageRequestContext _lazyProgress](self, "_lazyProgress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest identifierString](v16, "identifierString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v17, v18);

  PLImageManagerGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v26, "identifierString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest identifierString](v16, "identifierString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v20;
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "[RM]: %@ Spawned final (best) child request: %@", buf, 0x16u);

  }
  if (PHImageManagerRecordEnabled())
  {
    v23 = objc_msgSend(v26, "requestID");
    objc_msgSend(v26, "identifierString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest identifierString](v16, "identifierString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v23, CFSTR("[RM]: %@ Spawned final (best) child request: %@"), v24, v25);

  }
  return v16;
}

- (id)progresses
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PHImageRequestContext shouldReportProgress](self, "shouldReportProgress"))
    return 0;
  -[PHImageRequestContext _lazyProgress](self, "_lazyProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initialRequests
{
  PHVideoRequest *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  PHImageRequestOptions *imageOptions;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  PHImageRequest *v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  PHImageRequest *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  CMTime time;
  PHImageRequest *v48;
  NSObject *v49;
  uint8_t buf[4];
  unint64_t v51;
  __int16 v52;
  __CFString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (-[PHImageRequestContext _isVideoFrameRequest](self, "_isVideoFrameRequest"))
  {
    v3 = [PHVideoRequest alloc];
    v4 = -[PHMediaRequestContext requestID](self, "requestID");
    v5 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v6 = -[PHImageRequestContext type](self, "type");
    v7 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageRequestContext _videoBehavior](self, "_videoBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PHVideoRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:](v3, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:", v4, v5, v6, v7, v8, v9, v10, self);

    PLImageManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject identifierString](v11, "identifierString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      imageOptions = self->_imageOptions;
      if (imageOptions)
        -[PHImageRequestOptions videoFrameTime](imageOptions, "videoFrameTime");
      else
        memset(&time, 0, sizeof(time));
      v16 = (__CFString *)CMTimeCopyDescription(0, &time);
      *(_DWORD *)buf = 138543618;
      v51 = (unint64_t)v13;
      v52 = 2114;
      v53 = v16;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ starting video request to load video frame at time: %{public}@", buf, 0x16u);

    }
    v49 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((+[PHImageRequestBehaviorSpec loadingOptionsFromLoadingMode:](PHImageRequestBehaviorSpec, "loadingOptionsFromLoadingMode:", -[PHImageRequestOptions loadingMode](self->_imageOptions, "loadingMode")) & 7) != 0)
  {
    v46 = -[PHImageRequestOptions deliveryMode](self->_imageOptions, "deliveryMode") == PHImageRequestOptionsDeliveryModeFastFormat
       || -[PHImageRequestOptions deliveryMode](self->_imageOptions, "deliveryMode") == PHImageRequestOptionsDeliveryModeHighQualityFormat;
    -[PHImageRequestContext imageOptions](self, "imageOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext asset](self, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageRequestBehaviorSpec imageRequestInitialBehaviorSpecWithImageRequestOptions:asset:](PHImageRequestBehaviorSpec, "imageRequestInitialBehaviorSpecWithImageRequestOptions:asset:", v17, v18);
    v11 = objc_claimAutoreleasedReturnValue();

    v19 = [PHImageRequest alloc];
    v20 = -[PHMediaRequestContext requestID](self, "requestID");
    v21 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v22 = -[PHImageRequestContext type](self, "type");
    v23 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext imageResourceChooser](self, "imageResourceChooser");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v19, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v20, v21, v22, v23, v24, v25, v11, v26, self);

    -[PHImageRequestContext _lazyProgress](self, "_lazyProgress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest identifierString](v27, "identifierString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v28, v29);

    if (-[PHImageRequestOptions chooseAlchemist](self->_imageOptions, "chooseAlchemist"))
    {
      v41 = (void *)MEMORY[0x1E0D71880];
      -[PHMediaRequestContext asset](self, "asset");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaRequestContext asset](self, "asset");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v44, "bundleScope");
      -[PHMediaRequestContext asset](self, "asset");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "directory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaRequestContext asset](self, "asset");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "filename");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaRequestContext asset](self, "asset");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "photoLibrary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pathManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "pathForAlchemistImageWithUUID:bundleScope:directory:filename:pathManager:", v30, v40, v31, v33, v36);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v42, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImageRequest configureWithURL:uniformTypeIdentifier:exifOrientation:](v27, "configureWithURL:uniformTypeIdentifier:exifOrientation:", v37, v38, 1);

    }
    objc_storeStrong((id *)&self->_initialRequest, v27);
    if (v46)
      objc_storeStrong((id *)&self->_finalRequest, v27);
    v48 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLImageManagerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v51 = -[PHMediaRequestContext managerID](self, "managerID");
      v52 = 2048;
      v53 = (__CFString *)-[PHMediaRequestContext requestID](self, "requestID");
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Loading options don't specify any result, request %ld-%ld will be a no-op", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)_isVideoFrameRequest
{
  void *v3;
  PHImageRequestOptions *imageOptions;
  BOOL v5;
  char v7;

  -[PHMediaRequestContext asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideo"))
  {
    imageOptions = self->_imageOptions;
    if (imageOptions)
    {
      -[PHImageRequestOptions videoFrameTime](imageOptions, "videoFrameTime");
      v5 = v7 & 1;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_lazyProgress
{
  NSProgress *v3;
  NSProgress *progress;

  if (!self->_progress && -[PHImageRequestContext shouldReportProgress](self, "shouldReportProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    progress = self->_progress;
    self->_progress = v3;

  }
  return self->_progress;
}

- (int64_t)type
{
  return 0;
}

- (PHImageRequestOptions)imageOptions
{
  return self->_imageOptions;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  id v7;
  id v8;
  int64_t *p_countOfResultsObserved;
  unint64_t v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  PHImageRequestOptions *imageOptions;
  id v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  atomic_flag *v22;
  unsigned __int8 v23;
  atomic_flag *v24;
  unsigned __int8 v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  atomic_flag *v31;
  unsigned __int8 v32;
  void *v33;
  uint64_t v34;
  atomic_flag *p_firstNonFastResultWasObserved;
  unsigned __int8 v36;
  NSObject *v37;
  void *v38;
  PHCompositeMediaResult *v39;
  NSObject *v40;
  void *v41;
  atomic_flag *p_finalResultSent;
  unsigned __int8 v43;
  NSObject *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PHImageRequestOptions *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[3];
  CMTime time;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  __CFString *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  p_countOfResultsObserved = &self->_countOfResultsObserved;
  do
    v10 = __ldaxr((unint64_t *)p_countOfResultsObserved);
  while (__stlxr(v10 + 1, (unint64_t *)p_countOfResultsObserved));
  if (self->super._resultHandler)
  {
    v11 = -[PHImageRequestContext _isVideoFrameRequest](self, "_isVideoFrameRequest");
    v12 = v7;
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "videoURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        PLImageManagerGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "identifierString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          imageOptions = self->_imageOptions;
          if (imageOptions)
            -[PHImageRequestOptions videoFrameTime](imageOptions, "videoFrameTime");
          else
            memset(&time, 0, sizeof(time));
          v46 = (__CFString *)CMTimeCopyDescription(0, &time);
          objc_msgSend(v13, "videoURL");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "path");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v70 = v16;
          v71 = 2114;
          v72 = v46;
          v73 = 2112;
          v74 = v48;
          _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ generating video frame at time: %{public}@, file path: '%@'", buf, 0x20u);

        }
        v49 = (void *)MEMORY[0x1E0D71A08];
        objc_msgSend(v13, "videoURL");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = self->_imageOptions;
        if (v51)
          -[PHImageRequestOptions videoFrameTime](v51, "videoFrameTime");
        else
          memset(v67, 0, sizeof(v67));
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __55__PHImageRequestContext_processMediaResult_forRequest___block_invoke;
        v65[3] = &unk_1E35DC108;
        v65[4] = self;
        v66 = v8;
        objc_msgSend(v49, "generateKeyFrameFromVideoURL:time:completion:", v50, v67, v65);

      }
      else
      {
        (*((void (**)(void))self->super._resultHandler + 2))();
      }
      goto LABEL_85;
    }
    v18 = v8;
    objc_msgSend(v18, "behaviorSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "choosingPolicy");

    if (-[PHImageRequestOptions deliveryMode](self->_imageOptions, "deliveryMode"))
      v21 = 1;
    else
      v21 = v20 == 3;
    if (!v21)
    {
      if (objc_msgSend(v13, "imageRef")
        && objc_msgSend(v13, "isPlaceholder")
        && objc_msgSend(v13, "isPlaceholder"))
      {
        objc_msgSend(v13, "setDegraded:", 1);
      }
      if (v20 == 1)
      {
        if (objc_msgSend(v13, "imageRef"))
        {
          if (v10 && !objc_msgSend(v18, "isSynchronous"))
          {
            PLImageManagerGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v18, "identifierString");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v70 = v53;
              _os_log_impl(&dword_1991EC000, v52, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context avoiding delivering fast degraded image because another result has already been delivered.", buf, 0xCu);

            }
            if (PHImageManagerRecordEnabled())
            {
              v54 = objc_msgSend(v18, "requestID");
              objc_msgSend(v18, "identifierString");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v54, CFSTR("[RM]: %@ image request context avoiding delivering fast degraded image because another result has already been delivered."), v55);

            }
            goto LABEL_84;
          }
          PLImageManagerGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v18, "identifierString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v70 = v28;
            _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering fast degraded image.", buf, 0xCu);

          }
          if (!PHImageManagerRecordEnabled())
            goto LABEL_53;
          v29 = objc_msgSend(v18, "requestID");
          objc_msgSend(v18, "identifierString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v29, CFSTR("[RM]: %@ image request context delivering fast degraded image."), v30);
          goto LABEL_88;
        }
      }
      else
      {
        p_firstNonFastResultWasObserved = &self->_firstNonFastResultWasObserved;
        do
          v36 = __ldaxr((unsigned __int8 *)p_firstNonFastResultWasObserved);
        while (__stlxr(1u, (unsigned __int8 *)p_firstNonFastResultWasObserved));
        if ((v36 & 1) != 0)
        {
          v39 = self->_delayedFinalInvalidDataResult;
          if (v39)
          {
            if (objc_msgSend(v13, "imageRef"))
            {
              PLImageManagerGetLog();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v18, "identifierString");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v70 = v41;
                _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering non-fast degraded image.", buf, 0xCu);

              }
              if (PHImageManagerRecordEnabled())
              {
                v59 = objc_msgSend(v18, "requestID");
                objc_msgSend(v18, "identifierString");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v59, CFSTR("[RM]: %@ image request context delivering non-fast degraded image."), v60);

              }
              (*((void (**)(void))self->super._resultHandler + 2))();
            }
            p_finalResultSent = &self->_finalResultSent;
            do
              v43 = __ldaxr((unsigned __int8 *)p_finalResultSent);
            while (__stlxr(1u, (unsigned __int8 *)p_finalResultSent));
            if ((v43 & 1) == 0)
            {
              PLImageManagerGetLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                -[PHMediaRequest identifierString](self->_finalRequest, "identifierString");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v70 = v45;
                _os_log_impl(&dword_1991EC000, v44, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering (delayed) final image.", buf, 0xCu);

              }
              if (PHImageManagerRecordEnabled())
              {
                v63 = -[PHMediaRequest requestID](self->_finalRequest, "requestID");
                -[PHMediaRequest identifierString](self->_finalRequest, "identifierString");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v63, CFSTR("[RM]: %@ image request context delivering (delayed) final image."), v64);

              }
              (*((void (**)(void))self->super._resultHandler + 2))();
            }
          }
          else
          {
            PLImageManagerGetLog();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v18, "identifierString");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v70 = v57;
              _os_log_impl(&dword_1991EC000, v56, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context discarding non-fast degraded image because it arrived after the final result.", buf, 0xCu);

            }
            if (PHImageManagerRecordEnabled())
            {
              v61 = objc_msgSend(v18, "requestID");
              objc_msgSend(v18, "identifierString");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v61, CFSTR("[RM]: %@ image request context discarding non-fast degraded image because it arrived after the final result."), v62);

            }
          }

          goto LABEL_84;
        }
        if (objc_msgSend(v13, "imageRef"))
        {
          PLImageManagerGetLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v18, "identifierString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v70 = v38;
            _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering non-fast degraded image.", buf, 0xCu);

          }
          if (!PHImageManagerRecordEnabled())
            goto LABEL_53;
          v58 = objc_msgSend(v18, "requestID");
          objc_msgSend(v18, "identifierString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v58, CFSTR("[RM]: %@ image request context delivering non-fast degraded image."), v30);
          goto LABEL_88;
        }
      }
LABEL_84:

LABEL_85:
      goto LABEL_86;
    }
    if (self->_intermediateRequest && (objc_msgSend(v13, "containsValidData") & 1) == 0)
      objc_storeStrong((id *)&self->_delayedFinalInvalidDataResult, a3);
    v22 = &self->_firstNonFastResultWasObserved;
    do
      v23 = __ldaxr((unsigned __int8 *)v22);
    while (__stlxr(1u, (unsigned __int8 *)v22));
    if ((v23 & 1) != 0)
    {
      v31 = &self->_finalResultSent;
      do
        v32 = __ldaxr((unsigned __int8 *)v31);
      while (__stlxr(1u, (unsigned __int8 *)v31));
      if ((v32 & 1) != 0)
        goto LABEL_84;
      PLImageManagerGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        goto LABEL_44;
    }
    else
    {
      if (self->_delayedFinalInvalidDataResult)
        goto LABEL_84;
      v24 = &self->_finalResultSent;
      do
        v25 = __ldaxr((unsigned __int8 *)v24);
      while (__stlxr(1u, (unsigned __int8 *)v24));
      if ((v25 & 1) != 0)
        goto LABEL_84;
      PLImageManagerGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        goto LABEL_44;
    }
    objc_msgSend(v18, "identifierString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v70 = v33;
    _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering final image.", buf, 0xCu);

LABEL_44:
    if (!PHImageManagerRecordEnabled())
    {
LABEL_53:
      (*((void (**)(void))self->super._resultHandler + 2))();
      goto LABEL_84;
    }
    v34 = objc_msgSend(v18, "requestID");
    objc_msgSend(v18, "identifierString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v34, CFSTR("[RM]: %@ image request context delivering final image."), v30);
LABEL_88:

    goto LABEL_53;
  }
LABEL_86:

}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  PHImageRequest *v11;
  void *v12;
  uint64_t v13;
  id *p_finalRequest;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v6 = a5;
  v7 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!-[PHImageRequestContext _isVideoFrameRequest](self, "_isVideoFrameRequest"))
  {
    v11 = (PHImageRequest *)v9;
    if (v7 && !v6)
      goto LABEL_18;
    if (-[PHImageRequestOptions deliveryMode](self->_imageOptions, "deliveryMode"))
      goto LABEL_18;
    -[PHImageRequest behaviorSpec](v11, "behaviorSpec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "choosingPolicy");

    if (v13 == 3)
      goto LABEL_18;
    if (self->_initialRequest != v11)
    {
      if (self->_intermediateRequest == v11)
      {
        p_finalRequest = (id *)&self->_finalRequest;
        if (!self->_finalRequest)
        {
          -[PHImageRequestContext _produceFinalImageRequestForRequest:](self, "_produceFinalImageRequestForRequest:", v11);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *p_finalRequest;
          *p_finalRequest = (id)v15;

          PLImageManagerGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*p_finalRequest, "identifierString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v30 = v18;
            _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting final image request", buf, 0xCu);

          }
          if (PHImageManagerRecordEnabled())
          {
            v19 = -[PHMediaRequest requestID](v11, "requestID");
            objc_msgSend(*p_finalRequest, "identifierString");
            v20 = p_finalRequest;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v19, CFSTR("[RM]: %@ starting final image request"), v21);

            p_finalRequest = v20;
          }
          goto LABEL_23;
        }
      }
LABEL_18:
      v24 = 0;
      v25 = 0;
LABEL_19:
      v10 = v25;

      goto LABEL_20;
    }
    -[PHImageRequest behaviorSpec](v11, "behaviorSpec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setChoosingPolicy:", 1);

    if ((-[PHImageRequestOptions opportunisticDegradedImagesToReturn](self->_imageOptions, "opportunisticDegradedImagesToReturn") & 2) != 0)
    {
      p_finalRequest = (id *)&self->_intermediateRequest;
      if (self->_intermediateRequest)
        goto LABEL_18;
      -[PHImageRequestContext _produceIntermediateImageRequestForRequest:](self, "_produceIntermediateImageRequestForRequest:", v11);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      p_finalRequest = (id *)&self->_finalRequest;
      if (self->_finalRequest)
        goto LABEL_18;
      -[PHImageRequestContext _produceFinalImageRequestForRequest:](self, "_produceFinalImageRequestForRequest:", v11);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v27 = *p_finalRequest;
    *p_finalRequest = (id)v23;

LABEL_23:
    v25 = *p_finalRequest;
    v24 = v25;
    if (v25)
    {
      v28 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (id)_produceIntermediateImageRequestForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHImageRequest *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PHImageRequest *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "behaviorSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImageRequestContext imageOptions](self, "imageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHImageRequestBehaviorSpec imageRequestIntermediateBehaviorSpecWithPreviousBehaviorSpec:options:asset:](PHImageRequestBehaviorSpec, "imageRequestIntermediateBehaviorSpecWithPreviousBehaviorSpec:options:asset:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PHImageRequest alloc];
  v9 = -[PHMediaRequestContext requestID](self, "requestID");
  v10 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v11 = -[PHImageRequestContext type](self, "type");
  v12 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext displaySpec](self, "displaySpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext imageResourceChooser](self, "imageResourceChooser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v8, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v9, v10, v11, v12, v13, v14, v7, v15, self);

  PLImageManagerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v24, "identifierString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest identifierString](v16, "identifierString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v18;
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ Spawned intermediate (SPI) child request: %@", buf, 0x16u);

  }
  if (PHImageManagerRecordEnabled())
  {
    v21 = objc_msgSend(v24, "requestID");
    objc_msgSend(v24, "identifierString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest identifierString](v16, "identifierString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v21, CFSTR("[RM]: %@ Spawned intermediate (SPI) child request: %@"), v22, v23);

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_delayedFinalInvalidDataResult, 0);
  objc_storeStrong((id *)&self->_finalRequest, 0);
  objc_storeStrong((id *)&self->_intermediateRequest, 0);
  objc_storeStrong((id *)&self->_initialRequest, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (PHImageRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 resultHandler:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  PHImageRequestContext *v16;
  PHImageRequestContext *v17;
  id *p_imageOptions;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v23[16];
  objc_super v24;

  v12 = *(_QWORD *)&a3;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PHImageRequestContext;
  v16 = -[PHMediaRequestContext initWithRequestID:managerID:asset:displaySpec:resultHandler:](&v24, sel_initWithRequestID_managerID_asset_displaySpec_resultHandler_, v12, a4, a5, v14, a8);
  v17 = v16;
  if (v16)
  {
    p_imageOptions = (id *)&v16->_imageOptions;
    objc_storeStrong((id *)&v16->_imageOptions, a7);
    atomic_store(0, (unint64_t *)&v17->_countOfResultsObserved);
    if (objc_msgSend(*p_imageOptions, "isSynchronous"))
    {
      if (initWithRequestID_managerID_asset_displaySpec_options_resultHandler__onceToken != -1)
        dispatch_once(&initWithRequestID_managerID_asset_displaySpec_options_resultHandler__onceToken, &__block_literal_global_28979);
      if (!initWithRequestID_managerID_asset_displaySpec_options_resultHandler__allowFastSync
        && objc_msgSend(*p_imageOptions, "deliveryMode") == 2)
      {
        PLImageManagerGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Synchronous image requests are incompatible with fast delivery mode, changing delivery mode to high", v23, 2u);
        }

        objc_msgSend(*p_imageOptions, "setDeliveryMode:", 1);
      }
      if (!objc_msgSend(*p_imageOptions, "deliveryMode"))
      {
        PLImageManagerGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, "Synchronous image requests in opportunistic delivery mode will only deliver 1 image", v23, 2u);
        }

        objc_msgSend(*p_imageOptions, "setDeliveryMode:", 1);
      }
    }
    if (objc_msgSend(v14, "hasExplicitCrop") && objc_msgSend(v15, "resizeMode") != 2)
    {
      PLImageManagerGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Image request with normalized crop rect must use resize mode exact", v23, 2u);
      }

    }
  }

  return v17;
}

- (id)_videoBehavior
{
  PHVideoRequestBehaviorSpec *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PHImageRequestOptionsVersion v14;
  uint64_t v15;
  uint64_t v16;

  v3 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  if (-[PHImageRequestOptions deliveryMode](self->_imageOptions, "deliveryMode") == PHImageRequestOptionsDeliveryModeFastFormat)
  {
    v4 = 3;
  }
  else
  {
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "pixelWidth");
    -[PHMediaRequestContext asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestSizeFromFullSizedWidth:height:", v7, objc_msgSend(v8, "pixelHeight"));
    v10 = v9;
    v12 = v11;

    if (v12 <= 720.0 && v10 <= 720.0)
      v4 = 2;
    else
      v4 = 1;
  }
  -[PHVideoRequestBehaviorSpec setDeliveryMode:](v3, "setDeliveryMode:", v4);
  -[PHVideoRequestBehaviorSpec setNetworkAccessAllowed:](v3, "setNetworkAccessAllowed:", -[PHImageRequestOptions isNetworkAccessAllowed](self->_imageOptions, "isNetworkAccessAllowed"));
  -[PHVideoRequestBehaviorSpec setStreamingAllowed:](v3, "setStreamingAllowed:", -[PHImageRequestOptions isNetworkAccessAllowed](self->_imageOptions, "isNetworkAccessAllowed"));
  -[PHVideoRequestBehaviorSpec setDownloadIntent:](v3, "setDownloadIntent:", -[PHImageRequestOptions downloadIntent](self->_imageOptions, "downloadIntent"));
  -[PHVideoRequestBehaviorSpec setDownloadPriority:](v3, "setDownloadPriority:", -[PHImageRequestOptions downloadPriority](self->_imageOptions, "downloadPriority"));
  v14 = -[PHImageRequestOptions version](self->_imageOptions, "version");
  v15 = 8;
  if (v14 != 8)
    v15 = 0;
  if ((unint64_t)(v14 - 1) >= 2)
    v16 = v15;
  else
    v16 = 1;
  -[PHVideoRequestBehaviorSpec setVersion:](v3, "setVersion:", v16);
  return v3;
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHImageRequestOptions isNetworkAccessAllowed](self->_imageOptions, "isNetworkAccessAllowed");
}

- (BOOL)isSynchronous
{
  return -[PHImageRequestOptions isSynchronous](self->_imageOptions, "isSynchronous");
}

- (BOOL)representsShareableHighQualityResource
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  void *v15;
  void *v16;

  -[PHMediaRequestContext asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playbackStyle");
  if (v7 == 1)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    -[PHMediaRequestContext asset](self, "asset");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "playbackStyle") == 3)
    {
      v8 = 0;
      v9 = 0;
    }
    else
    {
      -[PHMediaRequestContext asset](self, "asset");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "playbackStyle") == 2)
      {
        v9 = 0;
        v8 = 1;
      }
      else
      {
        -[PHMediaRequestContext asset](self, "asset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "playbackStyle") != 5)
        {

          v13 = 0;
          goto LABEL_21;
        }
        v16 = v15;
        v8 = 1;
        v9 = 1;
      }
    }
  }
  -[PHMediaRequestContext displaySpec](self, "displaySpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PHMediaRequestContext displaySpec](self, "displaySpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetSize");
    if (v12 == -1.0 && v11 == -1.0)
    {
      v13 = 1;
      goto LABEL_13;
    }
  }
  if ((-[PHImageRequestOptions loadingMode](self->_imageOptions, "loadingMode") & 2) != 0)
  {
    v13 = -[PHImageRequestOptions deliveryMode](self->_imageOptions, "deliveryMode") == PHImageRequestOptionsDeliveryModeHighQualityFormat;
    if (v10)
    {
LABEL_13:

      if ((v9 & 1) != 0)
        goto LABEL_14;
LABEL_18:
      if (!v8)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else
  {
    v13 = 0;
    if (v10)
      goto LABEL_13;
  }
  if (!v9)
    goto LABEL_18;
LABEL_14:

  if ((v8 & 1) != 0)
LABEL_19:

LABEL_20:
  if (v7 != 1)
LABEL_21:

  return v13;
}

- (BOOL)shouldLimitRepairRequestsPerProcess
{
  return !-[PHImageRequestOptions ignoreProcessWideRepairLimits](self->_imageOptions, "ignoreProcessWideRepairLimits");
}

void __55__PHImageRequestContext_processMediaResult_forRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PHImageResult *v6;

  v5 = a3;
  v6 = -[PHCompositeMediaResult initWithRequestID:]([PHImageResult alloc], "initWithRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
  -[PHImageResult setImageRef:](v6, "setImageRef:", a2);
  -[PHCompositeMediaResult setError:](v6, "setError:", v5);

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
}

uint64_t __93__PHImageRequestContext_initWithRequestID_managerID_asset_displaySpec_options_resultHandler___block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  initWithRequestID_managerID_asset_displaySpec_options_resultHandler__allowFastSync = result;
  return result;
}

@end
