@implementation PHVideoRequest

- (PHVideoRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 displaySpec:(id)a8 behaviorSpec:(id)a9 delegate:(id)a10
{
  uint64_t v15;
  id v17;
  PHVideoRequest *v18;
  PHVideoRequest *v19;
  PHVideoResult *v20;
  PHVideoResult *videoResult;
  id v23;
  objc_super v24;

  v15 = *(_QWORD *)&a3;
  v23 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PHVideoRequest;
  v18 = -[PHMediaRequest initWithRequestID:requestIndex:contextType:managerID:asset:delegate:](&v24, sel_initWithRequestID_requestIndex_contextType_managerID_asset_delegate_, v15, a4, a5, a6, a7, a10);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_displaySpec, a8);
    objc_storeStrong((id *)&v19->_behaviorSpec, a9);
    v20 = -[PHCompositeMediaResult initWithRequestID:]([PHVideoResult alloc], "initWithRequestID:", v15);
    videoResult = v19->_videoResult;
    v19->_videoResult = v20;

    v19->_lock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (void)_finish
{
  id v3;

  if (-[PHMediaRequest isCancelled](self, "isCancelled"))
    -[PHCompositeMediaResult setCancelled:](self->_videoResult, "setCancelled:", 1);
  -[PHMediaRequest delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaRequest:didFinishWithResult:", self, self->_videoResult);

}

- (void)_handleResultVideoURL:(id)a3 mediaItemMakerData:(id)a4 fingerPrint:(id)a5 info:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!-[PHMediaRequest isCancelled](self, "isCancelled"))
  {
    -[PHVideoResult setVideoURL:](self->_videoResult, "setVideoURL:", v16);
    -[PHVideoResult setVideoMediaItemMakerData:](self->_videoResult, "setVideoMediaItemMakerData:", v12);
    -[PHVideoResult setFingerPrint:](self->_videoResult, "setFingerPrint:", v13);
    -[PHCompositeMediaResult setError:](self->_videoResult, "setError:", v15);
    -[PHCompositeMediaResult addInfoFromDictionary:](self->_videoResult, "addInfoFromDictionary:", v14);
  }
  -[PHVideoRequest _finish](self, "_finish");

}

- (BOOL)isSynchronous
{
  return 0;
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHVideoRequestBehaviorSpec isNetworkAccessAllowed](self->_behaviorSpec, "isNetworkAccessAllowed");
}

- (int64_t)downloadIntent
{
  return -[PHVideoRequestBehaviorSpec downloadIntent](self->_behaviorSpec, "downloadIntent");
}

- (int64_t)downloadPriority
{
  return -[PHVideoRequestBehaviorSpec downloadPriority](self->_behaviorSpec, "downloadPriority");
}

- (void)configureWithError:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHVideoRequest;
  v4 = a3;
  -[PHMediaRequest configureWithError:](&v5, sel_configureWithError_, v4);
  -[PHCompositeMediaResult setError:](self->_videoResult, "setError:", v4, v5.receiver, v5.super_class);

}

- (void)startRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  PHImageDisplaySpec *displaySpec;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  PHVideoXPCRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  PHVideoXPCRequest *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  os_unfair_lock_s *p_lock;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[PHMediaRequest isCancelled](self, "isCancelled") || self->super._configurationError)
  {
    -[PHVideoRequest _finish](self, "_finish");
    return;
  }
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v4;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %@ Video request running for asset %@", buf, 0x16u);

  }
  -[PHMediaRequest asset](self, "asset");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isPhotoIris](v7, "isPhotoIris"))
    goto LABEL_9;
  -[PHMediaRequest asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "canPlayPhotoIris"))
    goto LABEL_8;
  -[PHVideoRequest behaviorSpec](self, "behaviorSpec");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "version");

  if (v37)
    goto LABEL_10;
  PLImageManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest asset](self, "asset");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v8;
    v43 = 2114;
    v44 = v39;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ video request for unplayable live photo (uuid: %{public}@) will likely fail", buf, 0x16u);

LABEL_8:
  }
LABEL_9:

LABEL_10:
  if (-[PHVideoRequestBehaviorSpec deliveryMode](self->_behaviorSpec, "deliveryMode"))
  {
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    displaySpec = self->_displaySpec;
    -[PHMediaRequest asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "pixelWidth");
    -[PHMediaRequest asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageDisplaySpec requestSizeFromFullSizedWidth:height:](displaySpec, "requestSizeFromFullSizedWidth:height:", v13, objc_msgSend(v14, "pixelHeight"));
    v9 = v15;
    v10 = v16;

    PLImageManagerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      DCIM_NSStringFromCGSize();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v18;
      v43 = 2112;
      v44 = v19;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ request sized to %@", buf, 0x16u);

    }
  }
  v20 = [PHVideoXPCRequest alloc];
  -[PHMediaRequest identifierString](self, "identifierString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest asset](self, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PHVideoXPCRequest initWithTaskIdentifier:assetObjectID:size:behavior:](v20, "initWithTaskIdentifier:assetObjectID:size:behavior:", v21, v23, self->_behaviorSpec, v9, v10);

  -[PLResourceXPCRequest setWantsProgress:](v24, "setWantsProgress:", -[PHMediaRequest wantsProgress](self, "wantsProgress"));
  PLImageManagerGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest asset](self, "asset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v26;
    v43 = 2112;
    v44 = v28;
    _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "[RM] %@ sending video request for asset: %@", buf, 0x16u);

  }
  -[PHMediaRequest asset](self, "asset");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "photoLibrary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "assetsdClient");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "resourceAvailabilityClient");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __30__PHVideoRequest_startRequest__block_invoke;
  v40[3] = &unk_1E35D6C40;
  v40[4] = self;
  objc_msgSend(v32, "sendVideoRequest:reply:", v24, v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (-[PHMediaRequest isCancelled](self, "isCancelled"))
    {
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v33, "cancel");
    }
    else
    {
      -[PHMediaRequest lazyProgressContainer](self, "lazyProgressContainer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRequestProgress:", v33);

      os_unfair_lock_unlock(p_lock);
    }
  }

}

- (PHImageDisplaySpec)displaySpec
{
  return self->_displaySpec;
}

- (PHVideoRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_displaySpec, 0);
  objc_storeStrong((id *)&self->_videoResult, 0);
}

void __30__PHVideoRequest_startRequest__block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  PHAdjustmentData *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  char v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v45 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHImageFileUTIKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setUniformTypeIdentifier:", v17);

  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73390]);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v19)
    v22 = v18 == 0;
  else
    v22 = 1;
  v23 = v22 || v20 == 0;
  v46 = (void *)v21;
  v47 = (void *)v18;
  if (!v23)
  {
    v24 = -[PHAdjustmentData initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:]([PHAdjustmentData alloc], "initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:", v18, v19, v21, v20);
    if (v14)
      v25 = (id)objc_msgSend(v14, "mutableCopy");
    else
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26 = v25;
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("PHAdjustmentDataKey"));

    v14 = v26;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHImageRequestResultEligibleForCacheMetricsLogging"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");

  if (v28)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHImageRequestResultIsLocallyAvailableForCacheMetricsLogging"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    v31 = *(void **)(a1 + 32);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __30__PHVideoRequest_startRequest__block_invoke_2;
    v49[3] = &__block_descriptor_33_e39_v16__0__PLCacheMetricsCollectorClient_8l;
    v50 = v30;
    objc_msgSend(v31, "recordMetricsWithMetricsHandler:", v49);
  }
  if (v13 && a2)
  {
    v32 = (void *)MEMORY[0x1E0D71A60];
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v34 = objc_msgSend(v32, "refreshSandboxExtensionForURL:assetID:error:", v13, v33, &v48);
    v35 = v48;

    if ((v34 & 1) == 0)
    {
      PLImageManagerGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifierString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v37 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v44;
        v53 = 2112;
        v54 = v37;
        v38 = (void *)v37;
        v55 = 2112;
        v56 = v35;
        _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_ERROR, "[RM] %{public}@ video request failed to refresh sandbox extension for path: %@, error; %@",
          buf,
          0x20u);

      }
      v39 = v35;

      v13 = 0;
      v16 = v39;
    }
    v40 = v45;

    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "retryMediaRequest:afterFailureWithError:", *(_QWORD *)(a1 + 32), v16);

  v40 = v45;
  if ((v42 & 1) == 0)
  {
LABEL_22:
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHImageResultFingerPrintKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_handleResultVideoURL:mediaItemMakerData:fingerPrint:info:error:", v13, v40, v43, v14, v16);

  }
}

uint64_t __30__PHVideoRequest_startRequest__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "incrementVideoComplementCacheHitCount");
  else
    return objc_msgSend(a2, "incrementVideoComplementCacheMissCount");
}

@end
