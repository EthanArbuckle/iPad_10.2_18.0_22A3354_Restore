@implementation PHSingleMediaRequestContext

- (PHSingleMediaRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 type:(int64_t)a7 networkAccessAllowed:(BOOL)a8 progressHandler:(id)a9 resultHandler:(id)a10
{
  uint64_t v15;
  id v17;
  PHSingleMediaRequestContext *v18;
  PHSingleMediaRequestContext *v19;
  uint64_t v20;
  id progressHandler;
  objc_super v23;

  v15 = *(_QWORD *)&a3;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PHSingleMediaRequestContext;
  v18 = -[PHMediaRequestContext initWithRequestID:managerID:asset:displaySpec:resultHandler:](&v23, sel_initWithRequestID_managerID_asset_displaySpec_resultHandler_, v15, a4, a5, a6, a10);
  v19 = v18;
  if (v18)
  {
    v18->_type = a7;
    v18->_networkAccessAllowed = a8;
    v20 = objc_msgSend(v17, "copy");
    progressHandler = v19->_progressHandler;
    v19->_progressHandler = (id)v20;

  }
  return v19;
}

- (id)_lazyProgress
{
  NSProgress *progress;
  NSProgress *v4;
  NSProgress *v5;

  progress = self->_progress;
  if (!progress)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    v5 = self->_progress;
    self->_progress = v4;

    progress = self->_progress;
  }
  return progress;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)isSynchronous
{
  return -[PHMediaRequest isSynchronous](self->_request, "isSynchronous");
}

- (id)initialRequests
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_request)
  {
    v4[0] = self->_request;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)progressHandler
{
  return _Block_copy(self->_progressHandler);
}

- (id)progresses
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress"))
    return 0;
  -[PHSingleMediaRequestContext _lazyProgress](self, "_lazyProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  void (**resultHandler)(id, id, id, PHSingleMediaRequestContext *);

  resultHandler = (void (**)(id, id, id, PHSingleMediaRequestContext *))self->super._resultHandler;
  if (resultHandler)
    resultHandler[2](resultHandler, a3, a4, self);
}

- (PHMediaRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

+ (id)avProxyRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  PHSingleMediaRequestContext *v15;
  uint64_t v16;
  void *v17;
  PHSingleMediaRequestContext *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  PHMediaResourceRequest *v25;
  __CFString *v26;
  NSObject *v27;
  PHSingleMediaRequestContext *v28;
  _BOOL4 v29;
  PHMediaResourceRequest *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  int v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  PHMediaResourceRequest *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  __CFString *v48;
  uint64_t v49;

  v10 = *(_QWORD *)&a3;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = [PHSingleMediaRequestContext alloc];
  v16 = objc_msgSend(v13, "isNetworkAccessAllowed");
  objc_msgSend(v13, "progressHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PHSingleMediaRequestContext initWithRequestID:managerID:asset:displaySpec:type:networkAccessAllowed:progressHandler:resultHandler:](v15, "initWithRequestID:managerID:asset:displaySpec:type:networkAccessAllowed:progressHandler:resultHandler:", v10, a4, v12, 0, 5, v16, v17, v14);

  +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:", v12, 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(a1, "_indexOfAvProxyFromResources:hasAdjustments:version:", v19, objc_msgSend(v12, "hasAdjustments"), objc_msgSend(v13, "version"));
  if (v20 == 0x7FFFFFFFFFFFFFFFLL
    && (!objc_msgSend(v12, "hasAdjustments")
     || (v20 = objc_msgSend(a1, "_indexOfAvProxyFromResources:hasAdjustments:version:", v19, 0, objc_msgSend(v13, "version")), v20 == 0x7FFFFFFFFFFFFFFFLL)))
  {
    PLImageManagerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Request for AVAssetProxy, but asset has no media metadata or video resources, invalid request", buf, 2u);
    }

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2938];
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("asset %@ does not have media metadata or video resources"), v24);
    v25 = (PHMediaResourceRequest *)objc_claimAutoreleasedReturnValue();
    v44 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext setPrestartError:](v18, "setPrestartError:", v27);
  }
  else
  {
    v41 = a4;
    v42 = v19;
    objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v18;
    v29 = objc_msgSend(v24, "type") != 105 && objc_msgSend(v24, "type") != 104;
    v30 = [PHMediaResourceRequest alloc];
    v31 = objc_msgSend(v13, "isNetworkAccessAllowed");
    v32 = objc_msgSend(v13, "downloadIntent");
    v33 = objc_msgSend(v13, "downloadPriority");
    BYTE1(v40) = objc_msgSend(v13, "isSynchronous");
    LOBYTE(v40) = v29;
    v39 = v32;
    v18 = v28;
    LOBYTE(v38) = v31;
    v25 = -[PHMediaResourceRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:](v30, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:", v10, 0, 5, v41, v12, v24, v38, v39, v33, v40, v28);
    -[PHSingleMediaRequestContext setRequest:](v18, "setRequest:", v25);
    if (!v29 || (objc_msgSend(v24, "isLocallyAvailable") & 1) != 0)
    {
      v19 = v42;
      goto LABEL_14;
    }
    v35 = objc_msgSend(v12, "deferredProcessingNeeded");
    v36 = CFSTR("unexpected state, will attempt to continue");
    if (v35 == 2)
      v36 = CFSTR("deferred processing needed");
    v26 = v36;
    PLImageManagerGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v19 = v42;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[PHMediaRequest identifierString](v25, "identifierString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v37;
      v47 = 2114;
      v48 = v26;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEFAULT, "[RM] %@ Request for AVAssetProxy for asset with no media metadata resource, but video is not locally available: %{public}@", buf, 0x16u);

    }
  }

LABEL_14:
  return v18;
}

+ (id)originalAdjustmentDataRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  PHSingleMediaRequestContext *v14;
  uint64_t v15;
  void *v16;
  PHSingleMediaRequestContext *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  PHMediaResourceRequest *v35;
  uint64_t v37;
  uint64_t v38;
  PHMediaResourceRequest *v39;
  void *v40;
  uint8_t buf[8];
  uint64_t v42;
  _QWORD v43[2];

  v10 = *(_QWORD *)&a3;
  v43[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = [PHSingleMediaRequestContext alloc];
  v15 = objc_msgSend(v12, "isNetworkAccessAllowed");
  objc_msgSend(v12, "progressHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PHSingleMediaRequestContext initWithRequestID:managerID:asset:displaySpec:type:networkAccessAllowed:progressHandler:resultHandler:](v14, "initWithRequestID:managerID:asset:displaySpec:type:networkAccessAllowed:progressHandler:resultHandler:", v10, a4, v11, 0, 6, v15, v16, v13);

  +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:", v11, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObjectPassingTest:", &__block_literal_global_1792);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLImageManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Request original adjustment data, but asset has none, invalid request", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2938];
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("asset %@ does not have original adjustemnt data resource"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequestContext setPrestartError:](v17, "setPrestartError:", v26);

  }
  else
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = [PHMediaResourceRequest alloc];
    v27 = -[PHSingleMediaRequestContext type](v17, "type");
    v28 = objc_msgSend(v12, "isNetworkAccessAllowed");
    v29 = v18;
    v30 = a4;
    v31 = objc_msgSend(v12, "downloadIntent");
    v32 = v10;
    v33 = objc_msgSend(v12, "downloadPriority");
    BYTE1(v38) = objc_msgSend(v12, "isSynchronous");
    LOBYTE(v38) = 0;
    LOBYTE(v37) = v28;
    v34 = v30;
    v18 = v29;
    v35 = -[PHMediaResourceRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:](v39, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:", v32, 0, v27, v34, v11, v40, v37, v31, v33, v38, v17);
    -[PHSingleMediaRequestContext setRequest:](v17, "setRequest:", v35);

  }
  return v17;
}

+ (int64_t)_indexOfAvProxyFromResources:(id)a3 hasAdjustments:(BOOL)a4 version:(int64_t)a5
{
  id v7;
  uint64_t v8;
  int64_t v9;
  _QWORD v11[5];
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;

  v7 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke;
  v13[3] = &__block_descriptor_41_e32_B32__0__PHAssetResource_8Q16_B24l;
  v14 = a4;
  v13[4] = a5;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v13);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke_2;
    v11[3] = &__block_descriptor_41_e32_B32__0__PHAssetResource_8Q16_B24l;
    v12 = a4;
    v11[4] = a5;
    v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v11);
  }

  return v9;
}

BOOL __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40) && !*(_QWORD *)(a1 + 32))
    v5 = 105;
  else
    v5 = 104;
  v6 = objc_msgSend(v3, "type") == v5;

  return v6;
}

BOOL __83__PHSingleMediaRequestContext__indexOfAvProxyFromResources_hasAdjustments_version___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40) && !*(_QWORD *)(a1 + 32))
    v5 = 6;
  else
    v5 = 2;
  v6 = objc_msgSend(v3, "type") == v5;

  return v6;
}

BOOL __119__PHSingleMediaRequestContext_originalAdjustmentDataRequestContextWithRequestID_managerID_asset_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 16;
}

@end
