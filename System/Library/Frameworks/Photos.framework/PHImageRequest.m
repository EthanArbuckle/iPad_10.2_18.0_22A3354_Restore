@implementation PHImageRequest

- (BOOL)isSynchronous
{
  return -[PHImageRequestBehaviorSpec isSynchronous](self->_behaviorSpec, "isSynchronous");
}

- (PHImageRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 displaySpec:(id)a8 behaviorSpec:(id)a9 chooser:(id)a10 delegate:(id)a11
{
  uint64_t v15;
  id v17;
  id v18;
  uint64_t v19;
  PHImageRequest *v20;
  PHImageRequest *v21;
  PHImageResult *v22;
  PHImageResult *imageResult;
  dispatch_semaphore_t v24;
  OS_dispatch_semaphore *syncDownloadWaitSemaphore;
  id v28;
  id v29;
  objc_super v30;

  v15 = *(_QWORD *)&a3;
  v29 = a8;
  v17 = a9;
  v28 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)PHImageRequest;
  v19 = v15;
  v20 = -[PHMediaRequest initWithRequestID:requestIndex:contextType:managerID:asset:delegate:](&v30, sel_initWithRequestID_requestIndex_contextType_managerID_asset_delegate_, v15, a4, a5, a6, a7, v18);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_displaySpec, a8);
    objc_storeStrong((id *)&v21->_behaviorSpec, a9);
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v21->_imageDelegate, v18);
    v22 = -[PHCompositeMediaResult initWithRequestID:]([PHImageResult alloc], "initWithRequestID:", v19);
    imageResult = v21->_imageResult;
    v21->_imageResult = v22;

    objc_storeStrong((id *)&v21->_chooser, a10);
    if (objc_msgSend(v17, "isSynchronous"))
    {
      v24 = dispatch_semaphore_create(0);
      syncDownloadWaitSemaphore = v21->_syncDownloadWaitSemaphore;
      v21->_syncDownloadWaitSemaphore = (OS_dispatch_semaphore *)v24;

    }
  }

  return v21;
}

- (PHImageDisplaySpec)displaySpec
{
  return self->_displaySpec;
}

- (void)startRequest
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  int v7;
  int64_t v8;
  void *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  CGSize *p_desiredImageSize;
  PHImageDisplaySpec *displaySpec;
  void *v16;
  uint64_t v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  PHImageRequest *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  PHImageRequest *v41;
  PHImageResourceChooser *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unsigned int v92;
  void *v93;
  _QWORD v94[5];
  __int16 v95;
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  PHImageRequest *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  if (-[PHMediaRequest isCancelled](self, "isCancelled") || self->super._configurationError)
  {
    _finishRequest(self);
    return;
  }
  v3 = -[PHImageRequestBehaviorSpec shouldLoadURL](self->_behaviorSpec, "shouldLoadURL");
  v4 = -[PHImageRequestBehaviorSpec shouldLoadData](self->_behaviorSpec, "shouldLoadData");
  v5 = -[PHImageRequestBehaviorSpec shouldLoadImage](self->_behaviorSpec, "shouldLoadImage");
  v6 = (unint64_t)-[PHImageRequestBehaviorSpec choosingPolicy](self->_behaviorSpec, "choosingPolicy") < 3
    && (v4 || v3);
  if (v6 || !v5 && !v4 && !v3)
  {
    PLImageManagerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v97 = (uint64_t)v22;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Invalid loading mode for image request %@ is a no-op", buf, 0xCu);

    }
    if (!PHImageManagerRecordEnabled())
      goto LABEL_43;
    v23 = -[PHMediaRequest requestID](self, "requestID");
    -[PHMediaRequest identifierString](self, "identifierString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v23, CFSTR("Invalid loading mode for image request %@ is a no-op"), v24);
LABEL_31:

    goto LABEL_43;
  }
  if (!self->_chooser)
  {
    PLImageManagerGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v97 = (uint64_t)v26;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Image request %@ running without chooser is a no-op", buf, 0xCu);

    }
    if (!PHImageManagerRecordEnabled())
      goto LABEL_43;
    v27 = -[PHMediaRequest requestID](self, "requestID");
    -[PHMediaRequest identifierString](self, "identifierString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v27, CFSTR("Image request %@ running without chooser is a no-op"), v24);
    goto LABEL_31;
  }
  v7 = !v5;
  if (self->_forceIgnoreCache)
    v7 = 1;
  if (((v7 | (v4 || v3)) & 1) != 0)
    goto LABEL_17;
  v8 = -[PHImageRequestBehaviorSpec choosingPolicy](self->_behaviorSpec, "choosingPolicy");
  v95 = 0;
  -[PHImageRequest imageDelegate](self, "imageDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 == 3 ? (char *)&v95 + 1 : 0;
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __30__PHImageRequest_startRequest__block_invoke;
  v94[3] = &unk_1E35D6598;
  v94[4] = self;
  objc_msgSend(v9, "imageRequest:isQueryingCacheAndDidWait:didFindImage:resultHandler:", self, v11, &v95, v94);

  if (HIBYTE(v95) | v95)
  {
    PLImageManagerGetLog();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v65;
      v67 = CFSTR("found image");
      if (!(_BYTE)v95)
        v67 = CFSTR("waiting for in-flight request");
      *(_DWORD *)buf = 138412546;
      v97 = v65;
      v98 = 2112;
      v99 = (PHImageRequest *)v67;
      _os_log_impl(&dword_1991EC000, v64, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ early return from image cache, reason: %@", buf, 0x16u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v68 = -[PHMediaRequest requestID](self, "requestID");
      -[PHMediaRequest identifierString](self, "identifierString");
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = (void *)v69;
      if ((_BYTE)v95)
        v71 = CFSTR("found image");
      else
        v71 = CFSTR("waiting for in-flight request");
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v68, CFSTR("[RM][cache]: %@ early return from image cache, reason: %@"), v69, v71);

    }
  }
  else
  {
LABEL_17:
    PLImageManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = (uint64_t)v13;
      v98 = 2112;
      v99 = self;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request: %@", buf, 0x16u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v72 = -[PHMediaRequest requestID](self, "requestID");
      -[PHMediaRequest identifierString](self, "identifierString");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v72, CFSTR("[RM]: %@ Image request: %@"), v73, self);

    }
    p_desiredImageSize = &self->_desiredImageSize;
    displaySpec = self->_displaySpec;
    if (displaySpec)
    {
      -[PHMediaRequest asset](self, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "pixelWidth");
      -[PHMediaRequest asset](self, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImageDisplaySpec requestSizeFromFullSizedWidth:height:resizeMode:](displaySpec, "requestSizeFromFullSizedWidth:height:resizeMode:", v17, objc_msgSend(v18, "pixelHeight"), -[PHImageRequestBehaviorSpec resizeMode](self->_behaviorSpec, "resizeMode"));
      p_desiredImageSize->width = v19;
      self->_desiredImageSize.height = v20;

    }
    else
    {
      *p_desiredImageSize = *(CGSize *)MEMORY[0x1E0C9D820];
    }
    PLImageManagerGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      DCIM_NSStringFromCGSize();
      v30 = (PHImageRequest *)objc_claimAutoreleasedReturnValue();
      -[PHImageDisplaySpec shortDescription](self->_displaySpec, "shortDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v97 = (uint64_t)v29;
      v98 = 2112;
      v99 = v30;
      v100 = 2112;
      v101 = v31;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEBUG, "[RM]: %@ request sized to %@, for display spec: %@", buf, 0x20u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v74 = -[PHMediaRequest requestID](self, "requestID");
      -[PHMediaRequest identifierString](self, "identifierString");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      DCIM_NSStringFromCGSize();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImageDisplaySpec shortDescription](self->_displaySpec, "shortDescription");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v74, CFSTR("[RM]: %@ request sized to %@, for display spec: %@"), v75, v76, v77);

    }
    if (self->_configuredImageURL)
    {
      if ((!-[PHImageRequestBehaviorSpec shouldLoadDataOrURL](self->_behaviorSpec, "shouldLoadDataOrURL")
         || _loadURLIntoResult(-[PHImageRequestBehaviorSpec shouldLoadURL](self->_behaviorSpec, "shouldLoadURL"), -[PHImageRequestBehaviorSpec shouldLoadData](self->_behaviorSpec, "shouldLoadData"), self->_configuredImageURL, self->_configuredImageUTI, self->_configuredExifOrientation, self))&& -[PHImageRequestBehaviorSpec shouldLoadImage](self->_behaviorSpec, "shouldLoadImage"))
      {
        if (self->_configuredImageUTI)
          v32 = objc_msgSend(MEMORY[0x1E0D71880], "isPrimaryImageFormatForUTI:");
        else
          v32 = 0;
        -[PHImageRequest _decodeImageConfiguredWithURL:isPrimaryFormat:](self, "_decodeImageConfiguredWithURL:isPrimaryFormat:", self->_configuredImageURL, v32);
        return;
      }
LABEL_43:
      _finishRequest(self);
      return;
    }
    PLImageManagerGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D71880];
      -[PHMediaRequest asset](self, "asset");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "imageRequestHints");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaRequest asset](self, "asset");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "pixelWidth");
      -[PHMediaRequest asset](self, "asset");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "pixelHeight");
      -[PHMediaRequest asset](self, "asset");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "debugDescriptionForHintData:assetWidth:assetHeight:assetID:", v35, v37, v39, v40);
      v41 = (PHImageRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = (uint64_t)v91;
      v98 = 2112;
      v99 = v41;
      _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_DEBUG, "[RM]: %@ choosing image resource, hints are: %@", buf, 0x16u);

    }
    if (PHImageManagerRecordEnabled())
    {
      v92 = -[PHMediaRequest requestID](self, "requestID");
      -[PHMediaRequest identifierString](self, "identifierString");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)MEMORY[0x1E0D71880];
      -[PHMediaRequest asset](self, "asset");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "imageRequestHints");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaRequest asset](self, "asset");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "pixelWidth");
      -[PHMediaRequest asset](self, "asset");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "pixelHeight");
      -[PHMediaRequest asset](self, "asset");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "debugDescriptionForHintData:assetWidth:assetHeight:assetID:", v80, v82, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v92, CFSTR("[RM]: %@ choosing image resource, hints are: %@"), v90, v86);

    }
    v42 = self->_chooser;
    -[PHImageRequest behaviorSpec](self, "behaviorSpec");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageResourceChooser setBehaviorSpec:](v42, "setBehaviorSpec:", v43);

    -[PHImageRequest desiredImageSize](self, "desiredImageSize");
    -[PHImageResourceChooser setDesiredSize:](v42, "setDesiredSize:");
    -[PHImageResourceChooser setContext:](v42, "setContext:", self);
    -[PHMediaRequest identifierString](self, "identifierString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageResourceChooser setLoggingPrefix:](v42, "setLoggingPrefix:", v44);

    -[PHImageResourceChooser setResourceHandler:](v42, "setResourceHandler:", &__block_literal_global_2927);
    -[PHImageDisplaySpec fallbackTargetSizeIfRequestedSizeNotLocallyAvailable](self->_displaySpec, "fallbackTargetSizeIfRequestedSizeNotLocallyAvailable");
    v47 = *MEMORY[0x1E0C9D820];
    v46 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v48 != *MEMORY[0x1E0C9D820] || v45 != v46)
    {
      -[PHImageDisplaySpec fallbackTargetSizeIfRequestedSizeNotLocallyAvailable](self->_displaySpec, "fallbackTargetSizeIfRequestedSizeNotLocallyAvailable");
      v51 = v49 * v50;
      -[PHImageDisplaySpec targetSize](self->_displaySpec, "targetSize");
      v53 = v52;
      -[PHImageDisplaySpec targetSize](self->_displaySpec, "targetSize");
      if (v51 < v53 * v54
        || (-[PHImageDisplaySpec targetSize](self->_displaySpec, "targetSize"), v56 == v47) && v55 == v46)
      {
        -[PHMediaRequest asset](self, "asset");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "pixelWidth");
        -[PHMediaRequest asset](self, "asset");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v51 / (double)(unint64_t)(objc_msgSend(v59, "pixelHeight") * v58);

        if (v60 < 0.000000238418579)
          v60 = 0.000000238418579;
        -[PHImageResourceChooser setFallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:](v42, "setFallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:", v60);
        PLImageManagerGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          -[PHMediaRequest identifierString](self, "identifierString");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          DCIM_NSStringFromCGSize();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v97 = (uint64_t)v62;
          v98 = 2048;
          v99 = *(PHImageRequest **)&v60;
          v100 = 2112;
          v101 = v63;
          _os_log_impl(&dword_1991EC000, v61, OS_LOG_TYPE_DEBUG, "[RM]: %@ enabling fallback-best scale: %f based on fallback size: %@", buf, 0x20u);

        }
        if (PHImageManagerRecordEnabled())
        {
          v87 = -[PHMediaRequest requestID](self, "requestID");
          -[PHMediaRequest identifierString](self, "identifierString");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          DCIM_NSStringFromCGSize();
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v87, CFSTR("[RM]: %@ enabling fallback-best scale: %f based on fallback size: %@"), v88, *(_QWORD *)&v60, v89);

        }
      }
    }
    -[PHImageResourceChooser presentNextQualifyingResource](self->_chooser, "presentNextQualifyingResource");

  }
}

- (PHImageRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (CGSize)desiredImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredImageSize.width;
  height = self->_desiredImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PHImageRequestDelegate)imageDelegate
{
  return (PHImageRequestDelegate *)objc_loadWeakRetained((id *)&self->_imageDelegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_displaySpec, 0);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_storeStrong((id *)&self->_configuredImageUTI, 0);
  objc_storeStrong((id *)&self->_configuredImageURL, 0);
  objc_storeStrong((id *)&self->_syncDownloadWaitSemaphore, 0);
  objc_storeStrong((id *)&self->_chooser, 0);
  objc_storeStrong((id *)&self->_imageResult, 0);
  objc_storeStrong((id *)&self->_asyncDecodeRequestHandle, 0);
}

- (void)_decodeImageConfiguredWithURL:(id)a3 isPrimaryFormat:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PHImageRequest__decodeImageConfiguredWithURL_isPrimaryFormat___block_invoke;
  v4[3] = &unk_1E35D6570;
  v4[4] = self;
  PHDecodeImageFromURLForRequest(a3, a4, self, v4, self->_desiredImageSize.width, self->_desiredImageSize.height);
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHImageRequestBehaviorSpec isNetworkAccessAllowed](self->_behaviorSpec, "isNetworkAccessAllowed");
}

- (int64_t)downloadIntent
{
  return -[PHImageRequestBehaviorSpec downloadIntent](self->_behaviorSpec, "downloadIntent");
}

- (int64_t)downloadPriority
{
  return -[PHImageRequestBehaviorSpec downloadPriority](self->_behaviorSpec, "downloadPriority");
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)PHImageRequest;
  -[PHMediaRequest cancel](&v4, sel_cancel);
  -[PHImageDecoderAsyncDecodeRequestHandle cancel](self->_asyncDecodeRequestHandle, "cancel");
  os_unfair_lock_unlock(p_lock);
}

- (void)prepareForRetry
{
  -[PHImageResourceChooser moveFirst](self->_chooser, "moveFirst");
}

- (void)configureWithError:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHImageRequest;
  v4 = a3;
  -[PHMediaRequest configureWithError:](&v5, sel_configureWithError_, v4);
  -[PHCompositeMediaResult setError:](self->_imageResult, "setError:", v4, v5.receiver, v5.super_class);

}

- (void)handleAvailabilityChangeForResource:(id)a3 url:(id)a4 info:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  PHImageRequestBehaviorSpec *behaviorSpec;
  id v14;
  void *v15;
  uint64_t *p_aBlock;
  void (**v17)(_QWORD);
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  char URLIntoResult;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  void (**v36)(_QWORD);
  uint64_t aBlock;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  behaviorSpec = self->_behaviorSpec;
  v14 = a6;
  if (-[PHImageRequestBehaviorSpec isSynchronous](behaviorSpec, "isSynchronous"))
  {
    v38 = MEMORY[0x1E0C809B0];
    v15 = __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke;
    p_aBlock = &v38;
  }
  else
  {
    aBlock = MEMORY[0x1E0C809B0];
    v15 = __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_2;
    p_aBlock = &aBlock;
  }
  p_aBlock[1] = 3221225472;
  p_aBlock[2] = (uint64_t)v15;
  p_aBlock[3] = (uint64_t)&unk_1E35DF110;
  p_aBlock[4] = (uint64_t)self;
  v17 = (void (**)(_QWORD))_Block_copy(p_aBlock);
  -[PHCompositeMediaResult setError:](self->_imageResult, "setError:", v14);

  -[PHCompositeMediaResult addInfoFromDictionary:](self->_imageResult, "addInfoFromDictionary:", v12);
  PLImageManagerGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v19;
    v41 = 2112;
    v42 = v11;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request handling resource availabilty at url: %@", buf, 0x16u);

  }
  if (PHImageManagerRecordEnabled())
  {
    v32 = -[PHMediaRequest requestID](self, "requestID");
    -[PHMediaRequest identifierString](self, "identifierString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v32, CFSTR("[RM]: %@ Image request handling resource availabilty at url: %@"), v33, v11);

    if (!v11)
      goto LABEL_16;
  }
  else if (!v11)
  {
    goto LABEL_16;
  }
  if (!-[PHImageRequestBehaviorSpec shouldLoadDataOrURL](self->_behaviorSpec, "shouldLoadDataOrURL"))
    goto LABEL_13;
  v20 = -[PHImageRequestBehaviorSpec shouldLoadURL](self->_behaviorSpec, "shouldLoadURL");
  v21 = -[PHImageRequestBehaviorSpec shouldLoadData](self->_behaviorSpec, "shouldLoadData");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileUTIKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileOrientationKey"));
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    URLIntoResult = _loadURLIntoResult(v20, v21, v11, v22, -1, self);

    if ((URLIntoResult & 1) != 0)
      goto LABEL_13;
LABEL_16:
    v17[2](v17);
    goto LABEL_17;
  }
  v24 = (void *)v23;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHImageFileOrientationKey"));
  v34 = v10;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "integerValue");
  v26 = PLExifOrientationFromImageOrientation();
  v27 = _loadURLIntoResult(v20, v21, v11, v22, v26, self);

  v10 = v34;
  if (!v27)
    goto LABEL_16;
LABEL_13:
  if (!-[PHImageRequestBehaviorSpec shouldLoadImage](self->_behaviorSpec, "shouldLoadImage"))
    goto LABEL_16;
  v29 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(v10, "uniformTypeIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = objc_msgSend(v29, "isPrimaryImageFormatForUTI:", v31);

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_52;
  v35[3] = &unk_1E35D6600;
  v35[4] = self;
  v36 = v17;
  PHDecodeImageFromURLForRequest(v11, (int)v29, self, v35, self->_desiredImageSize.width, self->_desiredImageSize.height);

LABEL_17:
}

- (void)configureWithURL:(id)a3 uniformTypeIdentifier:(id)a4 exifOrientation:(int)a5
{
  NSURL *v8;
  NSString *v9;
  NSURL *configuredImageURL;
  NSURL *v11;
  NSString *configuredImageUTI;

  v8 = (NSURL *)a3;
  v9 = (NSString *)a4;
  configuredImageURL = self->_configuredImageURL;
  self->_configuredImageURL = v8;
  v11 = v8;

  configuredImageUTI = self->_configuredImageUTI;
  self->_configuredImageUTI = v9;

  self->_configuredExifOrientation = a5;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest identifierString](self, "identifierString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHImageRequest isSynchronous](self, "isSynchronous"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  -[PHImageRequest displaySpec](self, "displaySpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImageRequest behaviorSpec](self, "behaviorSpec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@ %p> %@ - asset: %@, sync: %@, display: (%@), behavior: (%@)"), v4, self, v5, v7, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setDisplaySpec:(id)a3
{
  objc_storeStrong((id *)&self->_displaySpec, a3);
}

- (void)setBehaviorSpec:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorSpec, a3);
}

void __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_2(uint64_t a1)
{
  _finishRequest(*(void **)(a1 + 32));
}

intptr_t __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 184));
}

void __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_52(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;

  v9 = a5;
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setImageRef:", a2);
    if (a3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setHighDynamicRangeGainMap:orientation:averagePixelLuminance:", a3, a4, v9);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __30__PHImageRequest_startRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        PLImageManagerGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(*(id *)(a1 + 32), "managerID");
        v8 = objc_msgSend(*(id *)(a1 + 32), "requestID");
        v9 = objc_msgSend(*(id *)(a1 + 32), "requestIndex");
        if (os_signpost_enabled(v6))
        {
          *(_DWORD *)buf = 134218752;
          v20 = v7;
          v21 = 2048;
          v22 = v8;
          v23 = 2048;
          v24 = v9;
          v25 = 2048;
          v26 = 33;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_EVENT, v5, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
        }

      }
    }
    PLImageManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v11;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ request vended image from cache", buf, 0xCu);

    }
    if (PHImageManagerRecordEnabled())
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "requestID");
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v15, CFSTR("[RM][cache]: %@ request vended image from cache"), v16);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setImageRef:", a2);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaRequest:didFinishWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

  }
  else
  {
    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v14;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request was cancelled or errored, restarting request", buf, 0xCu);

    }
    if (PHImageManagerRecordEnabled())
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "requestID");
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v17, CFSTR("[RM][cache]: %@ cache request was cancelled or errored, restarting request"), v18);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 1;
    objc_msgSend(*(id *)(a1 + 32), "startRequest");
  }
}

void __30__PHImageRequest_startRequest__block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id *v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  id *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int URLIntoResult;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  int v58;
  int v59;
  id v60;
  id *v61;
  uint64_t v62;
  os_signpost_id_t v63;
  NSObject *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  int v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  NSObject *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  char v97;
  char v98;
  int v99;
  id v100;
  _BYTE *v101;
  id v102;
  void *v103;
  void *v104;
  _BYTE v105[24];
  void *v106;
  __int128 v107;
  id v108;
  id v109;
  _BYTE buf[24];
  void *v111;
  __int128 v112;
  _BYTE *v113;
  char v114;
  char v115;
  char v116;
  char v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (id *)v6;
  v10 = v7;
  v11 = v8;
  WeakRetained = objc_loadWeakRetained(v9 + 27);
  objc_msgSend(WeakRetained, "mediaRequest:didFindLocallyAvailableResult:isDegraded:", v9, v10 != 0, objc_msgSend(v10, "isDegraded"));

  v104 = v11;
  v103 = v10;
  if (objc_msgSend(v11, "recipeID") == 65749 && (objc_msgSend(v11, "isHintBased") & 1) == 0)
  {

  }
  else if (v10)
  {
    v13 = v10;
    v14 = v9;
    objc_msgSend(v13, "dataStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataStoreKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v13, "isDegraded");
    v99 = objc_msgSend(v13, "isPrimaryFormat");
    v97 = objc_msgSend(v13, "isDerivedFromDeferredPreview");
    v17 = objc_msgSend(v13, "keyIsHintBased");
    *(_QWORD *)v105 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v105[8] = 3221225472;
    *(_QWORD *)&v105[16] = ___chooserDidPresentLocallyAvailableBag_block_invoke;
    v106 = &unk_1E35D6628;
    *(_QWORD *)&v107 = v14;
    *((_QWORD *)&v107 + 1) = v15;
    v108 = v16;
    v100 = v13;
    v109 = v100;
    v102 = *((id *)&v107 + 1);
    v18 = v108;
    v19 = (id)v107;
    v101 = v105;
    objc_msgSend(v19, "behaviorSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v17 & 1) == 0)
    {
      if (PHSignpostEventsEnabled_onceToken != -1)
        dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
      if (PHSignpostEventsEnabled_eventsEnabled)
      {
        v21 = objc_msgSend(v19, "signpostID");
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          PLImageManagerGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v19, "managerID");
          v24 = objc_msgSend(v19, "requestID");
          v25 = objc_msgSend(v19, "requestIndex");
          if (os_signpost_enabled(v22))
          {
            *(_DWORD *)buf = 134218752;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2048;
            v111 = (void *)v25;
            LOWORD(v112) = 2048;
            *(_QWORD *)((char *)&v112 + 2) = 35;
            _os_signpost_emit_with_name_impl(&dword_1991EC000, v22, OS_SIGNPOST_EVENT, v21, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
          }

        }
      }
    }
    v26 = objc_msgSend(v20, "shouldLoadURL");
    v27 = objc_msgSend(v20, "shouldLoadData");
    if ((v26 | v27) != 1)
      goto LABEL_76;
    objc_msgSend(v19, "asset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLForAssetID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniformTypeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    URLIntoResult = _loadURLIntoResult(v26, v27, v29, v30, -1, v19);

    if (!URLIntoResult)
    {
      PLImageManagerGetLog();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "identifierString");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "asset");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileURLForAssetID:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v76;
        _os_log_impl(&dword_1991EC000, v73, OS_LOG_TYPE_ERROR, "[RM]: %@ Failed to load image from URL: %@", buf, 0x16u);

      }
      if (PHImageManagerRecordEnabled())
      {
        v88 = objc_msgSend(v19, "requestID");
        objc_msgSend(v19, "identifierString");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "asset");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileURLForAssetID:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v88, CFSTR("[RM]: %@ Failed to load image from URL: %@"), v89, v91);

      }
      v57 = 0;
    }
    else
    {
LABEL_76:
      if (objc_msgSend(v20, "shouldLoadImage"))
      {
        objc_msgSend(v19, "desiredImageSize");
        v33 = v32;
        v35 = v34;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___loadImageFromStoreAndKey_block_invoke;
        v111 = &unk_1E35D6690;
        v36 = v19;
        *(_QWORD *)&v112 = v36;
        v114 = v97;
        v115 = v98;
        v116 = v99;
        v117 = v17;
        v37 = v18;
        *((_QWORD *)&v112 + 1) = v37;
        v113 = v101;
        PHDecodeImageFromStoreForRequest(v102, v37, v99, v36, buf, v33, v35);

LABEL_50:
        goto LABEL_71;
      }
      v57 = 1;
    }
    (*(void (**)(_BYTE *, uint64_t))&v105[16])(v101, v57);
    goto LABEL_50;
  }
  if (v11)
  {
    if ((objc_msgSend(v11, "isHintBased") & 1) != 0)
    {
      PLImageManagerGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "identifierString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "asset");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "uuid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v105 = 138543874;
        *(_QWORD *)&v105[4] = v39;
        *(_WORD *)&v105[12] = 2114;
        *(_QWORD *)&v105[14] = v104;
        *(_WORD *)&v105[22] = 2114;
        v106 = v41;
        _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ unexpected hint based resource info found w/o bag: %{public}@, for asset %{public}@", v105, 0x20u);

      }
      v42 = v9[18];
      v43 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)buf = *MEMORY[0x1E0CB2938];
      *(_QWORD *)v105 = CFSTR("Unexpected hint based resource missing locally available bag");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, buf, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setErrorIfNone:", v45);

      _finishRequest(v9);
      goto LABEL_71;
    }
    v58 = objc_msgSend(v11, "canDownload");
    v59 = objc_msgSend(v11, "locallyGeneratableOnDemand");
    v60 = v11;
    v61 = v9;
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      v62 = objc_msgSend(v61, "signpostID");
      if ((unint64_t)(v62 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v63 = v62;
        PLImageManagerGetLog();
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v61, "managerID");
        v66 = objc_msgSend(v61, "requestID");
        v67 = objc_msgSend(v61, "requestIndex");
        if (os_signpost_enabled(v64))
        {
          *(_DWORD *)v105 = 134218752;
          *(_QWORD *)&v105[4] = v65;
          *(_WORD *)&v105[12] = 2048;
          *(_QWORD *)&v105[14] = v66;
          *(_WORD *)&v105[22] = 2048;
          v106 = (void *)v67;
          LOWORD(v107) = 2048;
          *(_QWORD *)((char *)&v107 + 2) = 34;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v64, OS_SIGNPOST_EVENT, v63, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", v105, 0x2Au);
        }

      }
    }
    objc_msgSend(v61, "behaviorSpec");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v58)
    {
      v70 = objc_msgSend(v68, "isNetworkAccessAllowed");
      if (((v59 | v70) & 1) != 0)
      {
        if (v70)
        {
          PLImageManagerGetLog();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v61, "identifierString");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v105 = 138412290;
            *(_QWORD *)&v105[4] = v72;
            _os_log_impl(&dword_1991EC000, v71, OS_LOG_TYPE_DEBUG, "[RM]: %@ remotely available, requesting availability change", v105, 0xCu);

          }
          if (PHImageManagerRecordEnabled())
          {
            v94 = objc_msgSend(v61, "requestID");
            objc_msgSend(v61, "identifierString");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v94, CFSTR("[RM]: %@ remotely available, requesting availability change"), v95);

          }
          if (!objc_msgSend(v60, "recipeID"))
            objc_msgSend(v61, "recordMetricsWithMetricsHandler:", &__block_literal_global_174);
LABEL_56:
          objc_initWeak((id *)buf, v61);
          *(_QWORD *)v105 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v105[8] = 3221225472;
          *(_QWORD *)&v105[16] = ___chooserDidPresentResourceIdentity_block_invoke_2;
          v106 = &unk_1E35D6700;
          objc_copyWeak((id *)&v107 + 1, (id *)buf);
          *(_QWORD *)&v107 = v60;
          v79 = (id)objc_msgSend(v61, "sendMakeAvailableRequestForResource:reply:", (_QWORD)v107, v105);
          if (objc_msgSend(v61[29], "isSynchronous"))
          {
            dispatch_semaphore_wait((dispatch_semaphore_t)v61[23], 0xFFFFFFFFFFFFFFFFLL);
            _finishRequest(v61);
          }

          objc_destroyWeak((id *)&v107 + 1);
          objc_destroyWeak((id *)buf);
          goto LABEL_70;
        }
LABEL_52:
        PLImageManagerGetLog();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v61, "identifierString");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v105 = 138412290;
          *(_QWORD *)&v105[4] = v78;
          _os_log_impl(&dword_1991EC000, v77, OS_LOG_TYPE_DEBUG, "[RM]: %@ locally generatable, requesting availability change", v105, 0xCu);

        }
        if (PHImageManagerRecordEnabled())
        {
          v92 = objc_msgSend(v61, "requestID");
          objc_msgSend(v61, "identifierString");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v92, CFSTR("[RM]: %@ locally generatable, requesting availability change"), v93);

        }
        goto LABEL_56;
      }
      if ((objc_msgSend(v69, "isNetworkAccessAllowed") & 1) == 0)
      {
        objc_msgSend(v61[18], "setIsInCloud:", 1);
        v84 = v61[18];
        PHNetworkAccessAllowedRequiredError();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setErrorIfNone:", v85);

        PLImageManagerGetLog();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v61, "identifierString");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v105 = 138412290;
          *(_QWORD *)&v105[4] = v87;
          _os_log_impl(&dword_1991EC000, v86, OS_LOG_TYPE_DEBUG, "[RM]: %@ remotely available but network access not allowed", v105, 0xCu);

        }
        if (!PHImageManagerRecordEnabled())
          goto LABEL_69;
        v96 = objc_msgSend(v61, "requestID");
        objc_msgSend(v61, "identifierString");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v96, CFSTR("[RM]: %@ remotely available but network access not allowed"), v83);
        goto LABEL_73;
      }
    }
    else if ((v59 & 1) != 0)
    {
      goto LABEL_52;
    }
    PLImageManagerGetLog();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v61, "identifierString");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138412290;
      *(_QWORD *)&v105[4] = v81;
      _os_log_impl(&dword_1991EC000, v80, OS_LOG_TYPE_DEBUG, "[RM]: %@ nothing remotely available nor locally generatable", v105, 0xCu);

    }
    if (!PHImageManagerRecordEnabled())
      goto LABEL_69;
    v82 = objc_msgSend(v61, "requestID");
    objc_msgSend(v61, "identifierString");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v82, CFSTR("[RM]: %@ nothing remotely available nor locally generatable"), v83);
LABEL_73:

LABEL_69:
    _finishRequest(v61);
LABEL_70:

    goto LABEL_71;
  }
  objc_msgSend(v9, "behaviorSpec");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "choosingPolicy");
  if (v47 <= 4 && ((1 << v47) & 0x19) != 0)
  {

    PLImageManagerGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "identifierString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "behaviorSpec");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "asset");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "uuid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138543874;
      *(_QWORD *)&v105[4] = v49;
      *(_WORD *)&v105[12] = 2114;
      *(_QWORD *)&v105[14] = v50;
      *(_WORD *)&v105[22] = 2114;
      v106 = v52;
      _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ no resource found matching image request spec %{public}@, for asset %{public}@", v105, 0x20u);

    }
    v53 = v9[18];
    v54 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = *MEMORY[0x1E0CB2938];
    *(_QWORD *)v105 = CFSTR("No resource found matching image request spec");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, buf, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setErrorIfNone:", v56);

  }
  else
  {

  }
  _finishRequest(v9);
LABEL_71:

}

void __64__PHImageRequest__decodeImageConfiguredWithURL_isPrimaryFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;

  v9 = a5;
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setImageRef:", a2);
    if (a3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setHighDynamicRangeGainMap:orientation:averagePixelLuminance:", a3, a4, v9);
  }
  _finishRequest(*(void **)(a1 + 32));

}

@end
