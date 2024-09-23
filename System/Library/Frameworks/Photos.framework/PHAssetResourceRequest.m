@implementation PHAssetResourceRequest

- (PHAssetResourceRequest)initWithAssetResource:(id)a3 options:(id)a4 requestID:(int)a5 managerID:(unint64_t)a6 delegate:(id)a7 urlReceivedHandler:(id)a8 dataReceivedHandler:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PHAssetResourceRequest *v22;
  PHAssetResourceRequest *v23;
  uint64_t v24;
  id urlReceivedHandler;
  uint64_t v26;
  id dataHandler;
  uint64_t v28;
  id completionHandler;
  void *v31;
  objc_super v34;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceRequest.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetResource"));

  }
  v34.receiver = self;
  v34.super_class = (Class)PHAssetResourceRequest;
  v22 = -[PHAssetResourceRequest init](&v34, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_assetResource, a3);
    if (v19)
    {
      v24 = objc_msgSend(v19, "copy");
      urlReceivedHandler = v23->_urlReceivedHandler;
      v23->_urlReceivedHandler = (id)v24;

    }
    if (v20)
    {
      v26 = objc_msgSend(v20, "copy");
      dataHandler = v23->_dataHandler;
      v23->_dataHandler = (id)v26;

    }
    if (v21)
    {
      v28 = objc_msgSend(v21, "copy");
      completionHandler = v23->_completionHandler;
      v23->_completionHandler = (id)v28;

    }
    v23->_managerID = a6;
    v23->_requestID = a5;
    objc_storeStrong((id *)&v23->_options, a4);
    objc_storeWeak((id *)&v23->_delegate, v18);
    v23->_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, &v23->_retryAttemptCount);
  }

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  -[PLProgressFollower invalidate](self->_progressFollower, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHAssetResourceRequest;
  -[PHAssetResourceRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)isCancelled
{
  PHAssetResourceRequest *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_cancelled = 1;
  os_unfair_lock_unlock(p_lock);
  -[PHProgressContainerForRetryableRequest totalProgress](self->_availabilityRequestProgressContainer, "totalProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)startRequest
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSDictionary *v11;
  NSDictionary *info;
  void (**dataHandler)(id, void *);
  void *v14;
  void *v15;
  char v16;
  _BOOL4 synchronous;
  NSObject *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _BOOL8 v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _BOOL8, _QWORD *, _QWORD *);
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[4];
  id v49;
  PHAssetResourceRequest *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  const __CFString *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  -[PHAssetResourceRequest _initialValidationError](self, "_initialValidationError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHAssetResourceRequest _finishWithFileURL:didBecomeAvailable:error:](self, "_finishWithFileURL:didBecomeAvailable:error:", 0, 0, v3);
    goto LABEL_35;
  }
  -[PHAssetResourceRequest _setupTotalProgressIfNeeded](self, "_setupTotalProgressIfNeeded");
  -[PHAssetResource backingResourceIdentity](self->_assetResource, "backingResourceIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "resourceType") == 9)
  {
    v5 = -[PHAssetResource cplResourceType](self->_assetResource, "cplResourceType");

    if (!v5)
    {
      -[PHAssetResource photoLibrary](self->_assetResource, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      v54 = 0;
      -[PHAssetResourceRequest _loadMediaMetadataFromDatabaseWithPhotoLibrary:type:error:](self, "_loadMediaMetadataFromDatabaseWithPhotoLibrary:type:error:", v7, &v54, &v53);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v54;
      v10 = v53;

      if (v9)
      {
        v59 = CFSTR("PHMediaMetadataTypeKey");
        v60[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
        v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        info = self->_info;
        self->_info = v11;

      }
      dataHandler = (void (**)(id, void *))self->_dataHandler;
      if (dataHandler)
        dataHandler[2](dataHandler, v8);
      -[PHAssetResourceRequest _finishWithFileURL:didBecomeAvailable:error:](self, "_finishWithFileURL:didBecomeAvailable:error:", 0, 0, v10);

      goto LABEL_30;
    }
  }
  else
  {

  }
  if (!-[PHAssetResource isLocallyAvailable](self->_assetResource, "isLocallyAvailable")
    || -[PHAssetResourceRequestOptions downloadIsTransient](self->_options, "downloadIsTransient"))
  {
    goto LABEL_24;
  }
  -[PHAssetResource privateFileURL](self->_assetResource, "privateFileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Asset resource marked locally available but has no file URL";
LABEL_22:
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    }
LABEL_23:

    goto LABEL_24;
  }
  -[PHAssetResource privateFileURL](self->_assetResource, "privateFileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", 0);

  if ((v16 & 1) == 0)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Asset resource file URL not reachable, may have been pruned, will attempt availability change request";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (!-[PHAssetResourceRequestOptions downloadIsTransient](self->_options, "downloadIsTransient"))
  {
    synchronous = self->_synchronous;
    -[PHAssetResource privateFileURL](self->_assetResource, "privateFileURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (synchronous)
      -[PHAssetResourceRequest _finishWithFileURL:didBecomeAvailable:error:](self, "_finishWithFileURL:didBecomeAvailable:error:", v9, 0, 0);
    else
      -[PHAssetResourceRequest _finishAsyncWithFileURL:didBecomeAvailable:error:](self, "_finishAsyncWithFileURL:didBecomeAvailable:error:", v9, 0, 0);
    goto LABEL_30;
  }
LABEL_24:
  -[PHAssetResource privateFileLoader](self->_assetResource, "privateFileLoader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    PLImageManagerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[PHAssetResourceRequest taskIdentifier](self, "taskIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v22;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEBUG, "[RM] %@ Using private file loader to load asset resource data", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetResourceRequest _setAvailabilityProgress:](self, "_setAvailabilityProgress:", v23);
    -[PHAssetResource privateFileLoader](self->_assetResource, "privateFileLoader");
    v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v25 = -[PHAssetResourceRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed");
    v26 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __38__PHAssetResourceRequest_startRequest__block_invoke;
    v51[3] = &unk_1E35DE470;
    v51[4] = self;
    v52 = v23;
    v48[0] = v26;
    v48[1] = 3221225472;
    v48[2] = __38__PHAssetResourceRequest_startRequest__block_invoke_2;
    v48[3] = &unk_1E35DE498;
    v49 = v52;
    v50 = self;
    v27 = (void (*)(_QWORD *, _BOOL8, _QWORD *, _QWORD *))v24[2];
    v28 = v52;
    v27(v24, v25, v51, v48);

  }
  else
  {
    -[PHAssetResource backingResourceIdentity](self->_assetResource, "backingResourceIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_alloc(MEMORY[0x1E0D71A88]);
      -[PHAssetResourceRequest taskIdentifier](self, "taskIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetResource assetObjectID](self->_assetResource, "assetObjectID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetResource backingResourceIdentity](self->_assetResource, "backingResourceIdentity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v30, "initWithTaskIdentifier:assetObjectID:resource:", v31, v32, v33);

      objc_msgSend(v9, "setNetworkAccessAllowed:", -[PHAssetResourceRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed"));
      -[PHAssetResourceRequestOptions progressHandler](self->_options, "progressHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWantsProgress:", v34 != 0);

      objc_msgSend(v9, "setTransient:", -[PHAssetResourceRequestOptions downloadIsTransient](self->_options, "downloadIsTransient"));
      objc_msgSend(v9, "setDownloadIntent:", -[PHAssetResourceRequestOptions downloadIntent](self->_options, "downloadIntent"));
      objc_msgSend(v9, "setDownloadPriority:", -[PHAssetResourceRequestOptions downloadPriority](self->_options, "downloadPriority"));
      -[PHAssetResourceRequest assetResource](self, "assetResource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "photoLibrary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "assetsdClient");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "resourceAvailabilityClient");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __38__PHAssetResourceRequest_startRequest__block_invoke_3;
      v47[3] = &unk_1E35DE4E8;
      v47[4] = self;
      objc_msgSend(v38, "sendMakeResourceAvailableRequest:reply:", v9, v47);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHAssetResourceRequest _setAvailabilityProgress:](self, "_setAvailabilityProgress:", v39);
LABEL_30:

      goto LABEL_35;
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2938];
    v41 = (void *)MEMORY[0x1E0CB3940];
    -[PHAssetResource assetLocalIdentifier](self->_assetResource, "assetLocalIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetResource originalFilename](self->_assetResource, "originalFilename");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("Asset resource (asset identifier: %@, filename: %@) missing fileLoader or backing resource, unable to load data"), v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_synchronous)
      -[PHAssetResourceRequest _finishWithFileURL:didBecomeAvailable:error:](self, "_finishWithFileURL:didBecomeAvailable:error:", 0, 0, v46);
    else
      -[PHAssetResourceRequest _finishAsyncWithFileURL:didBecomeAvailable:error:](self, "_finishAsyncWithFileURL:didBecomeAvailable:error:", 0, 0, v46);

  }
LABEL_35:

}

- (void)configureWithError:(id)a3
{
  objc_storeStrong((id *)&self->_configuredError, a3);
}

- (void)_assetsdMakeAvailableRequestRepliedWithSuccess:(BOOL)a3 url:(id)a4 data:(id)a5 info:(id)a6 error:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**dataHandler)(id, id);
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v10 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_storeStrong((id *)&self->_info, a6);
  if (v10)
  {
    if (!v13)
    {
      if (v12)
      {
        v22 = (void *)MEMORY[0x1E0D71A60];
        -[PHAssetResourceRequest assetResource](self, "assetResource");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "libraryID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetResourceRequest assetResource](self, "assetResource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "assetLocalIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        LOBYTE(v22) = objc_msgSend(v22, "refreshSandboxExtensionForURL:libraryID:assetUUID:error:", v12, v23, v26, &v36);
        v35 = v36;

        if ((v22 & 1) != 0)
        {
          -[PHAssetResourceRequest _updateAssetResourceWithLocallyAvailable:fileURL:](self, "_updateAssetResourceWithLocallyAvailable:fileURL:", 1, v12);
          v27 = v35;
        }
        else
        {
          PLImageManagerGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = v35;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            -[PHAssetResourceRequest taskIdentifier](self, "taskIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "path");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v31;
            v39 = 2112;
            v40 = v32;
            v41 = 2112;
            v42 = v35;
            _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "[RM] %{public}@ asset resource request failed to refresh sandbox extension for path: %@, error; %@",
              buf,
              0x20u);

          }
          v33 = v35;

          v15 = v33;
        }

        v28 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Download reported success but no file URL specified"));
        v29 = objc_claimAutoreleasedReturnValue();

        v28 = 0;
        v15 = (id)v29;
      }
      goto LABEL_16;
    }
    dataHandler = (void (**)(id, id))self->_dataHandler;
    if (dataHandler)
      dataHandler[2](dataHandler, v13);
    goto LABEL_15;
  }
  if (!-[PHAssetResourceRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed"))
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      PHNetworkAccessAllowedRequiredError();
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v19;
    }
  }
  -[PHAssetResourceRequest delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "retryAssetResourceRequest:afterFailureWithError:", self, v15);

  if (v15)
  {
    if ((v21 & 1) != 0)
      goto LABEL_17;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Download failed"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((v21 & 1) == 0)
  {
LABEL_15:
    v28 = 0;
LABEL_16:
    -[PHAssetResourceRequest _finishWithFileURL:didBecomeAvailable:error:](self, "_finishWithFileURL:didBecomeAvailable:error:", v12, v28, v15);
  }
LABEL_17:

}

- (NSString)taskIdentifier
{
  NSString *taskIdentifier;

  taskIdentifier = self->_taskIdentifier;
  if (taskIdentifier)
    return taskIdentifier;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AR-%lu-%lu"), self->_managerID, self->_requestID);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_initialValidationError
{
  NSError *configuredError;
  NSError *v3;
  void *v5;
  uint64_t v6;

  configuredError = self->_configuredError;
  if (configuredError)
  {
    v3 = configuredError;
  }
  else if (-[PHAssetResourceRequestOptions downloadIsTransient](self->_options, "downloadIsTransient"))
  {
    if (-[PHAssetResourceRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed"))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3164, CFSTR("Transient data requests can only run with network access allowed"));
      v3 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    -[PHAssetResource privateFileLoader](self->_assetResource, "privateFileLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("File loader backed asset resources do not support transient data requests"));
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (NSError *)v6;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setupTotalProgressIfNeeded
{
  void *v3;
  NSProgress *v4;
  NSProgress *totalProgress;
  id v6;
  NSProgress *v7;
  PLProgressFollower *v8;
  PLProgressFollower *progressFollower;
  _BOOL4 v10;
  _BOOL4 v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  -[PHAssetResourceRequestOptions progressHandler](self->_options, "progressHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || self->_totalProgress)
    return;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  totalProgress = self->_totalProgress;
  self->_totalProgress = v4;

  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D71A18]);
  v7 = self->_totalProgress;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __53__PHAssetResourceRequest__setupTotalProgressIfNeeded__block_invoke;
  v17 = &unk_1E35DE530;
  objc_copyWeak(&v18, &location);
  v8 = (PLProgressFollower *)objc_msgSend(v6, "initWithSourceProgress:progressHandler:", v7, &v14);
  progressFollower = self->_progressFollower;
  self->_progressFollower = v8;

  v10 = -[PHAssetResource isLocallyAvailable](self->_assetResource, "isLocallyAvailable", v14, v15, v16, v17);
  if (-[PHAssetResourceRequestOptions downloadIsTransient](self->_options, "downloadIsTransient"))
  {
    v11 = 0;
    if (v10)
      goto LABEL_10;
LABEL_7:
    v12 = 100;
    if (v11)
      v12 = 50;
    self->_availabilityPendingCount = v12;
    goto LABEL_10;
  }
  v11 = !self->_loadURLOnly;
  if (!v10)
    goto LABEL_7;
LABEL_10:
  if (v11)
  {
    v13 = 50;
    if (v10)
      v13 = 100;
    self->_fileStreamPendingCount = v13;
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_setAvailabilityProgress:(id)a3
{
  id v4;
  PHProgressContainerForRetryableRequest *availabilityRequestProgressContainer;
  PHProgressContainerForRetryableRequest *v6;
  PHProgressContainerForRetryableRequest *v7;
  NSProgress *totalProgress;
  void *v9;
  id v10;

  v4 = a3;
  if (v4 && self->_availabilityPendingCount >= 1)
  {
    availabilityRequestProgressContainer = self->_availabilityRequestProgressContainer;
    v10 = v4;
    if (!availabilityRequestProgressContainer)
    {
      v6 = objc_alloc_init(PHProgressContainerForRetryableRequest);
      v7 = self->_availabilityRequestProgressContainer;
      self->_availabilityRequestProgressContainer = v6;

      totalProgress = self->_totalProgress;
      -[PHProgressContainerForRetryableRequest totalProgress](self->_availabilityRequestProgressContainer, "totalProgress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSProgress addChild:withPendingUnitCount:](totalProgress, "addChild:withPendingUnitCount:", v9, self->_availabilityPendingCount);

      availabilityRequestProgressContainer = self->_availabilityRequestProgressContainer;
    }
    -[PHProgressContainerForRetryableRequest setRequestProgress:](availabilityRequestProgressContainer, "setRequestProgress:", v10);
    v4 = v10;
  }

}

- (void)_setupFilestreamProgressIfNeeded
{
  NSProgress *v3;
  NSProgress *fileStreamProgress;

  if (self->_fileStreamPendingCount >= 1 && !self->_fileStreamProgress)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    fileStreamProgress = self->_fileStreamProgress;
    self->_fileStreamProgress = v3;

    -[NSProgress addChild:withPendingUnitCount:](self->_totalProgress, "addChild:withPendingUnitCount:", self->_fileStreamProgress, self->_fileStreamPendingCount);
  }
}

- (void)_finishWithFileURL:(id)a3 didBecomeAvailable:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void (**urlReceivedHandler)(id, id);
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(void *, void *);
  id completionHandler;
  void *v36;
  id WeakRetained;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8 || v9)
    goto LABEL_25;
  urlReceivedHandler = (void (**)(id, id))self->_urlReceivedHandler;
  if (urlReceivedHandler)
    urlReceivedHandler[2](urlReceivedHandler, v8);
  if (self->_loadURLOnly)
  {
    v10 = 0;
    if (!v6)
      goto LABEL_25;
    goto LABEL_17;
  }
  -[PHAssetResourceRequest _setupFilestreamProgressIfNeeded](self, "_setupFilestreamProgressIfNeeded");
  if (self->_fileStreamProgress)
  {
    v41 = 0;
    v12 = *MEMORY[0x1E0C99998];
    v40 = 0;
    v13 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v41, v12, &v40);
    v14 = v41;
    v15 = v40;
    if (v13)
    {
      -[NSProgress setTotalUnitCount:](self->_fileStreamProgress, "setTotalUnitCount:", objc_msgSend(v14, "unsignedIntegerValue"));
    }
    else
    {
      -[NSProgress setTotalUnitCount:](self->_fileStreamProgress, "setTotalUnitCount:", 0);
      PLImageManagerGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v15;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Unable to read file size, error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v15 = 0;
  }
  v38[4] = self;
  v39 = v15;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __70__PHAssetResourceRequest__finishWithFileURL_didBecomeAvailable_error___block_invoke;
  v38[3] = &unk_1E35DE558;
  -[PHAssetResourceRequest _streamDataAtURL:error:dataHandler:](self, "_streamDataAtURL:error:dataHandler:", v8, &v39, v38);
  v10 = v39;

  if (v6)
  {
LABEL_17:
    if (-[PHAssetResourceRequestOptions pruneAfterAvailableOnLowDisk](self->_options, "pruneAfterAvailableOnLowDisk"))
    {
      -[PHAssetResourceRequestOptions pruneAfterAvailableLowDiskThresholdBytes](self->_options, "pruneAfterAvailableLowDiskThresholdBytes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[PHAssetResourceRequestOptions pruneAfterAvailableLowDiskThresholdBytes](self->_options, "pruneAfterAvailableLowDiskThresholdBytes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");

      }
      else
      {
        v19 = 0x80000000;
      }

      v20 = (void *)MEMORY[0x1E0D731D8];
      objc_msgSend(v8, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "diskSpaceAvailableForPath:", v21);

      if (v22 < v19)
      {
        PLImageManagerGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[PHAssetResourceRequest taskIdentifier](self, "taskIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v24;
          v44 = 2048;
          v45 = v22;
          v46 = 2048;
          v47 = v19;
          _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ sending resource unavailable request, availableStorage: %lld purgeThreshold: %lld", buf, 0x20u);

        }
        v25 = objc_alloc(MEMORY[0x1E0D71A88]);
        -[PHAssetResourceRequest taskIdentifier](self, "taskIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetResource assetObjectID](self->_assetResource, "assetObjectID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetResource backingResourceIdentity](self->_assetResource, "backingResourceIdentity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v25, "initWithTaskIdentifier:assetObjectID:resource:", v26, v27, v28);

        -[PHAssetResourceRequest assetResource](self, "assetResource");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "photoLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "assetsdClient");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "resourceAvailabilityClient");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sendMakeResourceUnavailableRequest:", v29);

      }
    }
  }
LABEL_25:
  os_unfair_lock_lock(&self->_lock);
  v34 = (void (**)(void *, void *))_Block_copy(self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v34)
  {
    PHPublicErrorFromError(v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2](v34, v36);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "assetResourceRequest:didFinishWithError:", self, v10);

}

- (void)_finishAsyncWithFileURL:(id)a3 didBecomeAvailable:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "_globalFileIOQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PHAssetResourceRequest__finishAsyncWithFileURL_didBecomeAvailable_error___block_invoke;
  v13[3] = &unk_1E35DE580;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (int64_t)_streamDataAtURL:(id)a3 error:(id *)a4 dataHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  PHAssetResourceRequest *v30;
  char v31;

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceRequest.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceRequest.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataHandler"));

LABEL_3:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v9);
  v13 = v12;
  if (!v12)
  {
    v23 = CFSTR("Unable to initialize stream for resource %@");
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", v23, self->_assetResource);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v12, "open");
  objc_msgSend(v13, "streamError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
LABEL_19:
    v31 = 0;
    v17 = -1;
    goto LABEL_20;
  }
  v15 = malloc_type_malloc(0x100000uLL, 0x3B669A13uLL);
  if (!v15)
  {
    v23 = CFSTR("Unable to reserve temporary space for resource %@");
    goto LABEL_18;
  }
  v16 = v15;
  v30 = self;
  v14 = 0;
  v17 = 0;
  v31 = 0;
  while (objc_msgSend(v13, "hasBytesAvailable"))
  {
    v18 = objc_msgSend(v13, "read:maxLength:", v16, 0x100000);
    v19 = v18;
    if (v18 <= 0)
    {
      if (v18 < 0)
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v13, "streamError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "ph_genericErrorWithUnderlyingError:localizedDescription:", v26, CFSTR("Unable to continue reading data for resource %@"), v30->_assetResource);
        v27 = objc_claimAutoreleasedReturnValue();

        v17 = -1;
        v14 = (void *)v27;
        break;
      }
      if (v17 < 0)
        goto LABEL_16;
    }
    else
    {
      v20 = (void *)MEMORY[0x19AEBEADC]();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v16, v19, 0);
      ((void (**)(_QWORD, void *, char *))v11)[2](v11, v21, &v31);
      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
        v22 = objc_claimAutoreleasedReturnValue();

        v17 = -1;
        v14 = (void *)v22;
      }
      else
      {
        v17 += v19;
      }

      objc_autoreleasePoolPop(v20);
      if (v17 < 0)
      {
LABEL_16:
        v17 = -1;
        break;
      }
    }
  }
  free(v16);
LABEL_20:
  objc_msgSend(v13, "close");
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v17;
}

- (void)_updateAssetResourceWithLocallyAvailable:(BOOL)a3 fileURL:(id)a4
{
  _BOOL8 v4;
  PHAssetResource *assetResource;
  id v7;

  v4 = a3;
  assetResource = self->_assetResource;
  v7 = a4;
  -[PHAssetResource setLocallyAvailable:](assetResource, "setLocallyAvailable:", v4);
  -[PHAssetResource setPrivateFileURL:](self->_assetResource, "setPrivateFileURL:", v7);

}

- (id)_loadMediaMetadataFromDatabaseWithPhotoLibrary:(id)a3 type:(id *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__38032;
  v33 = __Block_byref_object_dispose__38033;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__38032;
  v27 = __Block_byref_object_dispose__38033;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__38032;
  v21 = __Block_byref_object_dispose__38033;
  v22 = 0;
  PLImageManagerGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[PHAssetResourceRequest taskIdentifier](self, "taskIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v10;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "[RM] %@ Attempting to load media metadata from database", buf, 0xCu);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PHAssetResourceRequest__loadMediaMetadataFromDatabaseWithPhotoLibrary_type_error___block_invoke;
  v16[3] = &unk_1E35DE5A8;
  v16[4] = self;
  v16[5] = &v29;
  v16[6] = &v23;
  v16[7] = &v17;
  objc_msgSend(v8, "performBlockAndWait:", v16);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = v24[5];
  v12 = (id)v30[5];
  v13 = v12;
  if (!v11 && a5)
    *a5 = objc_retainAutorelease(v12);

  v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (unint64_t)fetchIncrementRetryAttemptCount
{
  unsigned int *p_retryAttemptCount;
  unsigned int v3;

  p_retryAttemptCount = &self->_retryAttemptCount;
  do
    v3 = __ldaxr(p_retryAttemptCount);
  while (__stlxr(v3 + 1, p_retryAttemptCount));
  return v3;
}

- (PHAssetResource)assetResource
{
  return self->_assetResource;
}

- (PHAssetResourceRequestOptions)options
{
  return self->_options;
}

- (int)requestID
{
  return self->_requestID;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (PHAssetResourceRequestDelegate)delegate
{
  return (PHAssetResourceRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)loadURLOnly
{
  return self->_loadURLOnly;
}

- (void)setLoadURLOnly:(BOOL)a3
{
  self->_loadURLOnly = a3;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (id)urlReceivedHandler
{
  return self->_urlReceivedHandler;
}

- (void)setUrlReceivedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void)setDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong(&self->_urlReceivedHandler, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetResource, 0);
  objc_storeStrong((id *)&self->_configuredError, 0);
  objc_storeStrong((id *)&self->_progressFollower, 0);
  objc_storeStrong((id *)&self->_totalProgress, 0);
  objc_storeStrong((id *)&self->_fileStreamProgress, 0);
  objc_storeStrong((id *)&self->_availabilityRequestProgressContainer, 0);
}

void __84__PHAssetResourceRequest__loadMediaMetadataFromDatabaseWithPhotoLibrary_type_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id obj;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1[4] + 88), "assetObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self = %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(*(id *)(a1[4] + 88), "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1[4] + 88), "backingResourceIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "version");
      v16 = *(_QWORD *)(a1[7] + 8);
      v26 = *(id *)(v16 + 40);
      objc_msgSend(v13, "mediaMetadataForResourceVersion:mediaMetadataType:", v15, &v26);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v16 + 40), v26);
      v18 = *(_QWORD *)(a1[6] + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1[4] + 88), "assetObjectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Cannot find asset with object ID %@"), v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1[5] + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

    }
  }

}

uint64_t __75__PHAssetResourceRequest__finishAsyncWithFileURL_didBecomeAvailable_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithFileURL:didBecomeAvailable:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __70__PHAssetResourceRequest__finishWithFileURL_didBecomeAvailable_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(v5 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
  if (v6)
  {
    *a3 = 1;
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "totalUnitCount") >= 1)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCompletedUnitCount:", objc_msgSend(v8, "length") + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "completedUnitCount"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

void __53__PHAssetResourceRequest__setupTotalProgressIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void (**v5)(_QWORD, double);
  double v6;
  double v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progressHandler");
  v5 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionCompleted");
  v7 = v6;

  v5[2](v5, v7);
}

void __38__PHAssetResourceRequest_startRequest__block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v6;
  int v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned __int8 *)(v6 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 8));
  if (v7)
    *a2 = 1;
  else
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", (uint64_t)((double)objc_msgSend(*(id *)(a1 + 40), "totalUnitCount") * a3));
}

void __38__PHAssetResourceRequest_startRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "_updateAssetResourceWithLocallyAvailable:fileURL:", 1, v6);
  objc_msgSend(*(id *)(a1 + 40), "_finishAsyncWithFileURL:didBecomeAvailable:error:", v6, 0, v5);

}

void __38__PHAssetResourceRequest_startRequest__block_invoke_3(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend((id)objc_opt_class(), "_globalFileIOQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __38__PHAssetResourceRequest_startRequest__block_invoke_4;
  v21[3] = &unk_1E35DE4C0;
  v16 = *(_QWORD *)(a1 + 32);
  v26 = a2;
  v21[4] = v16;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  dispatch_async(v15, v21);

}

uint64_t __38__PHAssetResourceRequest_startRequest__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_assetsdMakeAvailableRequestRepliedWithSuccess:url:data:info:error:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

+ (id)_globalFileIOQueue
{
  if (_globalFileIOQueue_onceToken != -1)
    dispatch_once(&_globalFileIOQueue_onceToken, &__block_literal_global_38099);
  return (id)_globalFileIOQueue_ioQueue;
}

void __44__PHAssetResourceRequest__globalFileIOQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.assetResources.fileIO", v2);
  v1 = (void *)_globalFileIOQueue_ioQueue;
  _globalFileIOQueue_ioQueue = (uint64_t)v0;

}

@end
