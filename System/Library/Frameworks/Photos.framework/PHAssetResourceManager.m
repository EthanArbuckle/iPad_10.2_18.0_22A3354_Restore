@implementation PHAssetResourceManager

- (PHAssetResourceManager)init
{
  PHAssetResourceManager *v2;
  PHAssetResourceManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *requestsLock_requestsByID;
  NSMutableDictionary *v6;
  NSMutableDictionary *requestsLock_supplementaryContextsByID;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHAssetResourceManager;
  v2 = -[PHAssetResourceManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(1u, (unsigned int *)&v2->_nextRequestID);
    v2->_requestsLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestsLock_requestsByID = v3->_requestsLock_requestsByID;
    v3->_requestsLock_requestsByID = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestsLock_supplementaryContextsByID = v3->_requestsLock_supplementaryContextsByID;
    v3->_requestsLock_supplementaryContextsByID = v6;

    if (PHNextImageAndAssetResourceManagerID_onceToken != -1)
      dispatch_once(&PHNextImageAndAssetResourceManagerID_onceToken, &__block_literal_global_20522);
    do
      v8 = __ldaxr(&PHNextImageAndAssetResourceManagerID_managerID);
    while (__stlxr(v8 + 1, &PHNextImageAndAssetResourceManagerID_managerID));
    v3->_managerID = v8;
  }
  return v3;
}

- (PHAssetResourceDataRequestID)requestDataForAssetResource:(PHAssetResource *)resource options:(PHAssetResourceRequestOptions *)options dataReceivedHandler:(void *)handler completionHandler:(void *)completionHandler
{
  PHAssetResource *v11;
  PHAssetResourceRequestOptions *v12;
  void *v13;
  void *v14;
  void *v15;
  PHAssetResourceDataRequestID v16;
  void *v18;
  void *v19;

  v11 = resource;
  v12 = options;
  v13 = handler;
  v14 = completionHandler;
  v15 = v14;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceManager.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    if (v15)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceManager.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_5;
LABEL_3:
  v16 = -[PHAssetResourceManager _requestForAssetResource:loadURLOnly:options:urlReceivedHandler:dataReceivedHandler:completionHandler:](self, "_requestForAssetResource:loadURLOnly:options:urlReceivedHandler:dataReceivedHandler:completionHandler:", v11, 0, v12, 0, v13, v15);

  return v16;
}

- (int)requestWriteDataForAssetResource:(id)a3 toFile:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PHAssetResourceWriteRequest *v23;
  NSObject *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v31;
  const __CFString *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceManager.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  if ((objc_msgSend(v12, "isFileURL") & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Invalid file url at '%@' for resource %@"), v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v17, 0);

  if (!v18)
  {
    if (v11)
      goto LABEL_8;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Cannot write data for nil asset resource"));
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v22;
    if (v22)
      goto LABEL_9;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("File already exists at '%@' for resource %@"), v12, v11);
  v21 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)v21;
  if (!v11)
    goto LABEL_11;
LABEL_8:
  if (v15)
  {
LABEL_9:
    v14[2](v14, v15);
    LODWORD(v19) = 0;
    v20 = v13;
    goto LABEL_19;
  }
LABEL_12:
  v20 = (void *)objc_msgSend(v13, "copy");

  v19 = -[PHAssetResourceManager _nextRequestID](self, "_nextRequestID");
  v23 = -[PHAssetResourceWriteRequest initWithAssetResource:destinationFileURL:options:requestID:managerID:delegate:completionHandler:]([PHAssetResourceWriteRequest alloc], "initWithAssetResource:destinationFileURL:options:requestID:managerID:delegate:completionHandler:", v11, v12, v20, v19, self->_managerID, self, v14);
  PLSafeRunWithUnfairLock();
  PLImageManagerGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    -[PHAssetResourceWriteRequest taskIdentifier](v23, "taskIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v20, "isNetworkAccessAllowed");
    v27 = CFSTR("N");
    if (v26)
      v27 = CFSTR("Y");
    v32 = v27;
    objc_msgSend(v20, "progressHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = CFSTR("N");
    if (v28)
      v29 = CFSTR("Y");
    v34 = v25;
    v35 = 2112;
    v36 = v32;
    v37 = 2112;
    v38 = v29;
    _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting asset resource write request with network: %@, progress: %@", buf, 0x20u);

  }
  -[PHAssetResourceWriteRequest startRequest](v23, "startRequest");

LABEL_19:
  return v19;
}

- (void)cancelDataRequest:(PHAssetResourceDataRequestID)requestID
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v4 = MEMORY[0x1E0C809B0];
  LODWORD(v6) = requestID;
  PLSafeResultWithUnfairLock();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel", v4, 3221225472, __44__PHAssetResourceManager_cancelDataRequest___block_invoke, &unk_1E35DD828, self, v6);

}

- (int)requestFileURLForAssetResource:(id)a3 options:(id)a4 urlReceivedHandler:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceManager.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("urlReceivedHandler"));

    if (v15)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceManager.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_5;
LABEL_3:
  v16 = -[PHAssetResourceManager _requestForAssetResource:loadURLOnly:options:urlReceivedHandler:dataReceivedHandler:completionHandler:](self, "_requestForAssetResource:loadURLOnly:options:urlReceivedHandler:dataReceivedHandler:completionHandler:", v11, 1, v12, v13, 0, v15);

  return v16;
}

- (id)infoForRequest:(int)a3
{
  PLSafeResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)consolidateAssets:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v14, "isReferencedAsset"))
        {
          objc_msgSend(v14, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          if (!v11)
          {
            objc_msgSend(v14, "photoLibrary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v11, "assetsdClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resourceClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__PHAssetResourceManager_consolidateAssets_completionHandler___block_invoke;
    v20[3] = &unk_1E35DD850;
    v21 = v6;
    objc_msgSend(v17, "consolidateAssets:completionHandler:", v7, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)reconnectAssets:(id)a3 urlResolvingHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  PHAssetResourceManager *v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v8, "count");
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v13)
    {
      v14 = v13;
      v11 = 0;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = v14;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          --v16;
        }
        while (v16);
        v11 += v14;
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v14);
    }
    else
    {
      v11 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_queue_create("PHAssetResourceManager.reconnectAssets", 0);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke;
  v28[3] = &unk_1E35DD8E0;
  v29 = v8;
  v30 = v19;
  v33 = v9;
  v31 = self;
  v20 = v17;
  v32 = v20;
  v34 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v19;
  v24 = v8;
  dispatch_async(v18, v28);
  v25 = v34;
  v26 = v20;

  return v26;
}

- (void)_autoResolveReferencedResources:(id)a3 folderURL:(id)a4 resourceClient:(id)a5
{
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  uint32_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  id v38;
  id v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v39 = a4;
  v38 = a5;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v43;
    *(_QWORD *)&v9 = 138543362;
    v37 = v9;
    do
    {
      v12 = 0;
      v40 = v10;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v13, "fileURL");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(v13, "fileSystemBookmark");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fileSystemVolume");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = PLPrimaryResourceDataStoreReferenceFileURL();
          v15 = 0;

          if (v18 == 3)
          {
            PLImageManagerGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "asset");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v21;
              v48 = 2112;
              v49 = v15;
              v22 = v19;
              v23 = OS_LOG_TYPE_DEFAULT;
              v24 = "No volume URL for referenced resource for asset %{public}@, using artificial volume for URL %@";
              v25 = 22;
LABEL_13:
              _os_log_impl(&dword_1991EC000, v22, v23, v24, buf, v25);

            }
LABEL_14:

          }
          else if (!v18)
          {
            PLImageManagerGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "asset");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v37;
              v47 = v21;
              v22 = v19;
              v23 = OS_LOG_TYPE_ERROR;
              v24 = "Failed to resolve bookmark URL for asset %{public}@";
              v25 = 12;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          if (!v15)
            goto LABEL_22;
        }
        v26 = (void *)MEMORY[0x1E0D73208];
        objc_msgSend(v15, "path", v37);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "realPathForPath:error:", v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v29 = v11;
          objc_msgSend(v15, "lastPathComponent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "URIRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "URLByAppendingPathComponent:isDirectory:", v30, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x1E0D73208];
          objc_msgSend(v33, "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "realPathForPath:error:", v35, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36 && objc_msgSend(MEMORY[0x1E0D732C8], "processCanReadSandboxForPath:", v36))
            objc_msgSend(v38, "updateInternalResourcePath:objectURI:error:", v36, v32, 0);

          v11 = v29;
          v10 = v40;
        }

LABEL_22:
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v10);
  }

}

- (int)_nextRequestID
{
  int *p_nextRequestID;
  int result;

  p_nextRequestID = &self->_nextRequestID;
  do
    result = __ldaxr((unsigned int *)p_nextRequestID);
  while (__stlxr(result + 1, (unsigned int *)p_nextRequestID));
  return result;
}

- (int)_requestForAssetResource:(id)a3 loadURLOnly:(BOOL)a4 options:(id)a5 urlReceivedHandler:(id)a6 dataReceivedHandler:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  PHAssetResourceRequest *v21;
  PHAssetResourceRequest *v22;
  NSObject *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v12 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    v18 = a8;
    v19 = (void *)objc_msgSend(v15, "copy");

    v20 = (id)-[PHAssetResourceManager _nextRequestID](self, "_nextRequestID");
    v21 = -[PHAssetResourceRequest initWithAssetResource:options:requestID:managerID:delegate:urlReceivedHandler:dataReceivedHandler:completionHandler:]([PHAssetResourceRequest alloc], "initWithAssetResource:options:requestID:managerID:delegate:urlReceivedHandler:dataReceivedHandler:completionHandler:", v14, v19, v20, self->_managerID, self, v16, v17, v18);

    -[PHAssetResourceRequest setLoadURLOnly:](v21, "setLoadURLOnly:", v12);
    v22 = v21;
    PLSafeRunWithUnfairLock();
    PLImageManagerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      -[PHAssetResourceRequest taskIdentifier](v22, "taskIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isNetworkAccessAllowed"))
        v25 = CFSTR("Y");
      else
        v25 = CFSTR("N");
      objc_msgSend(v19, "progressHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = CFSTR("Y");
      if (!v26)
        v27 = CFSTR("N");
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting asset resource request with network: %@, progress: %@", buf, 0x20u);

    }
    -[PHAssetResourceRequest startRequest](v22, "startRequest");

  }
  else
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v20 = a8;
    objc_msgSend(v28, "ph_genericErrorWithLocalizedDescription:", CFSTR("Cannot perform resource request for nil asset resource"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v20 + 2))(v20, v29);

    LODWORD(v20) = 0;
    v19 = v15;
  }

  return (int)v20;
}

- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  PLSafeRunWithUnfairLock();

}

- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  unint64_t managerID;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  unsigned int v32;
  id v33;
  _QWORD v34[4];
  id v35;
  PHAssetResourceManager *v36;
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = PHRequestRetryTypeForRequest(v6, v7);
  switch(v8)
  {
    case 3:
      PLImageManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "taskIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v12;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ asset resource request requires additional resources to generate adjustment on demand", buf, 0xCu);

      }
      objc_msgSend(v6, "assetResource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2938];
        v38 = CFSTR("Unable to start content editing request on behalf of asset resource request that is not backed by PHAsset");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v30);
        v9 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "configureWithError:", v9);
        objc_msgSend(v6, "startRequest");
        goto LABEL_15;
      }
      objc_msgSend(v6, "assetResource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(v6, "requestID");
      managerID = self->_managerID;
      objc_msgSend(v6, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isNetworkAccessAllowed");
      objc_msgSend(v6, "options");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "downloadIntent");
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_2;
      v34[3] = &unk_1E35DD928;
      v23 = v6;
      v35 = v23;
      v36 = self;
      +[PHContentEditingInputRequestContext contentEditingInputRequestContextForAsset:requestID:managerID:networkAccessAllowed:downloadIntent:progressHandler:resultHandler:](PHContentEditingInputRequestContext, "contentEditingInputRequestContextForAsset:requestID:managerID:networkAccessAllowed:downloadIntent:progressHandler:resultHandler:", v17, v32, managerID, v20, v22, &__block_literal_global_122, v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v23;
      v25 = v24;
      PLSafeRunWithUnfairLock();
      objc_msgSend(v25, "start");

      break;
    case 2:
      PLImageManagerGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "taskIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v27;
        v41 = 2112;
        v42 = v7;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "[RM] %{public}@ asset resource request retrying due to error: %@", buf, 0x16u);

      }
      objc_msgSend(v6, "startRequest");
      break;
    case 1:
      PLImageManagerGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "taskIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v10;
        v41 = 2112;
        v42 = v7;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "[RM] %{public}@ asset resource request exceeded retry limit, failing with error: %@", buf, 0x16u);

      }
LABEL_15:

      goto LABEL_16;
    default:
LABEL_16:
      v28 = 0;
      goto LABEL_17;
  }
  v28 = 1;
LABEL_17:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsLock_supplementaryContextsByID, 0);
  objc_storeStrong((id *)&self->_requestsLock_requestsByID, 0);
}

void __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "containsValidData") & 1) == 0)
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2938];
      v9[0] = CFSTR("Content editing input request on behalf of asset resource request failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "configureWithError:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "startRequest");
  v7 = *(id *)(a1 + 32);
  PLSafeRunWithUnfairLock();

}

void __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

void __66__PHAssetResourceManager_assetResourceRequest_didFinishWithError___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

void __128__PHAssetResourceManager__requestForAssetResource_loadURLOnly_options_urlReceivedHandler_dataReceivedHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

uint64_t __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *context;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v48;
  _QWORD v49[5];
  id v50;
  _QWORD *v51;
  uint64_t *v52;
  _QWORD v53[5];
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  _QWORD v68[8];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[5];
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  id v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  char v100;
  __int16 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v101 = 0;
  v100 = 0;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = *(id *)(a1 + 32);
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v97;
LABEL_3:
    v41 = 0;
    while (1)
    {
      if (*(_QWORD *)v97 != v37)
        objc_enumerationMutation(obj);
      v48 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v41);
      context = (void *)MEMORY[0x19AEBEADC]();
      if (objc_msgSend(v48, "isReferencedAsset"))
        break;
LABEL_43:
      objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
LABEL_44:
      objc_autoreleasePoolPop(context);
      if (++v41 == v38)
      {
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
        if (!v38)
          goto LABEL_48;
        goto LABEL_3;
      }
    }
    if (!HIBYTE(v101))
    {
      if ((_BYTE)v101 && v100)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3110, MEMORY[0x1E0C9AA70]);
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = *(void **)(a1 + 40);
        objc_msgSend(v48, "localIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

        goto LABEL_44;
      }
      objc_msgSend(v48, "photoLibrary");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "photoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0;
      v91 = &v90;
      v92 = 0x3032000000;
      v93 = __Block_byref_object_copy__32568;
      v94 = __Block_byref_object_dispose__32569;
      v95 = 0;
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_108;
      v87[3] = &unk_1E35DEE50;
      v87[4] = v48;
      v88 = v4;
      v89 = &v90;
      v46 = v88;
      objc_msgSend(v88, "performBlockAndWait:", v87);
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v43 = (id)v91[5];
      v5 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      if (!v5)
        goto LABEL_42;
      v44 = *(_QWORD *)v84;
LABEL_13:
      v6 = 0;
      v45 = v5;
      while (1)
      {
        if (*(_QWORD *)v84 != v44)
          objc_enumerationMutation(v43);
        v7 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19AEBEADC]();
        v76 = 0;
        v77 = 0;
        v78 = &v77;
        v79 = 0x3032000000;
        v80 = __Block_byref_object_copy__32568;
        v81 = __Block_byref_object_dispose__32569;
        v82 = 0;
        v75[0] = 0;
        v75[1] = v75;
        v75[2] = 0x3032000000;
        v75[3] = __Block_byref_object_copy__32568;
        v75[4] = __Block_byref_object_dispose__32569;
        v69 = 0;
        v70 = &v69;
        v71 = 0x3032000000;
        v72 = __Block_byref_object_copy__32568;
        v73 = __Block_byref_object_dispose__32569;
        v74 = 0;
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_3;
        v68[3] = &unk_1E35DE5A8;
        v68[4] = v7;
        v68[5] = &v77;
        v68[6] = v75;
        v68[7] = &v69;
        objc_msgSend(v46, "performBlockAndWait:", v68);
        v9 = (void *)v78[5];
        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0D73208];
          objc_msgSend(v9, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "realPathForPath:error:", v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 && (objc_msgSend(MEMORY[0x1E0D732C8], "processCanReadSandboxForPath:", v12) & 1) != 0)
          {
            v13 = 5;
            goto LABEL_38;
          }
          v101 = 0;
          v100 = 0;
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3110, MEMORY[0x1E0C9AA70]);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(void **)(a1 + 40);
            objc_msgSend(v48, "localIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
          v18 = HIBYTE(v101) | v101;
          v19 = v18 == 0;
          v20 = v18 != 0;
          if (v19)
            v13 = 5;
          else
            v13 = 4;
          if (v14 && !v20)
          {
            v21 = (void *)MEMORY[0x1E0D73208];
            objc_msgSend(v14, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 0;
            objc_msgSend(v21, "realPathForPath:error:", v22, &v67);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v67;

            if (v23)
            {
              objc_msgSend(v39, "assetsdClient");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "resourceClient");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = v70[5];
              v66 = 0;
              v27 = objc_msgSend(v25, "updateInternalResourcePath:objectURI:error:", v23, v26, &v66);
              v28 = v66;
              v29 = v28;
              if (v27)
              {
                v64[0] = 0;
                v64[1] = v64;
                v64[2] = 0x3032000000;
                v64[3] = __Block_byref_object_copy__32568;
                v64[4] = __Block_byref_object_dispose__32569;
                v65 = 0;
                v58 = 0;
                v59 = &v58;
                v60 = 0x3032000000;
                v61 = __Block_byref_object_copy__32568;
                v62 = __Block_byref_object_dispose__32569;
                v63 = 0;
                v53[0] = MEMORY[0x1E0C809B0];
                v53[1] = 3221225472;
                v53[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_114;
                v53[3] = &unk_1E35DD8B8;
                v53[4] = v7;
                v55 = v75;
                v56 = v64;
                v57 = &v58;
                v54 = v14;
                objc_msgSend(v46, "performBlockAndWait:", v53);
                if (v59[5])
                {
                  v49[0] = MEMORY[0x1E0C809B0];
                  v49[1] = 3221225472;
                  v49[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_2_115;
                  v49[3] = &unk_1E35DE5F8;
                  v49[4] = *(_QWORD *)(a1 + 48);
                  v51 = v64;
                  v52 = &v58;
                  v50 = v25;
                  objc_msgSend(v46, "performBlockAndWait:", v49);

                }
                _Block_object_dispose(&v58, 8);

                _Block_object_dispose(v64, 8);
              }
              else
              {
                PHErrorFromPLError(v28);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = *(void **)(a1 + 40);
                objc_msgSend(v48, "localIdentifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v34);

              }
              v13 = 0;
            }
            else
            {
              PHErrorFromPLError(v42);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = *(void **)(a1 + 40);
              objc_msgSend(v48, "localIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, v29);
              v13 = 5;
            }

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3110, MEMORY[0x1E0C9AA70]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 40);
          objc_msgSend(v48, "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v12, v14);
          v13 = 5;
        }

LABEL_38:
        _Block_object_dispose(&v69, 8);

        _Block_object_dispose(v75, 8);
        _Block_object_dispose(&v77, 8);

        objc_autoreleasePoolPop(v8);
        if (v13 != 5 && v13)
          goto LABEL_42;
        if (v45 == ++v6)
        {
          v5 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
          if (!v5)
          {
LABEL_42:

            _Block_object_dispose(&v90, 8);
            goto LABEL_43;
          }
          goto LABEL_13;
        }
      }
    }
    objc_autoreleasePoolPop(context);
  }
LABEL_48:

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_108(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithObjectID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "persistedResourcesMatching:", &__block_literal_global_111_32573);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "fileSystemBookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fileSystemVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PLPrimaryResourceDataStoreReferenceFileURL();
    v8 = 0;

    if ((v7 - 1) >= 2)
    {
      if (!v7)
      {
        PLImageManagerGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "asset");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v23;
          _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Failed to resolve bookmark URL for asset %{public}@", buf, 0xCu);

        }
        goto LABEL_9;
      }
      if (v7 != 3)
      {
LABEL_10:

        goto LABEL_11;
      }
      PLImageManagerGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v11;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEFAULT, "No volume URL for referenced resource for asset %{public}@, using artificial volume for URL %@", buf, 0x16u);

      }
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = v8;
    v14 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "fileSystemVolume");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URIRepresentation");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_114(uint64_t a1)
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
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 32), 1);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingObjectWithID:error:", v4, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v18;
  if (v18)
  {
    objc_msgSend(v18, "fileSystemVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_msgSend(v6, "url"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "path"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", v8),
          v10,
          v9,
          (v11 & 1) == 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "resources");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    v5 = v18;
  }

}

uint64_t __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_2_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_autoResolveReferencedResources:folderURL:resourceClient:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
}

uint64_t __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  int v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "version");
  v4 = objc_msgSend(v2, "isDerivative");

  if (v3)
    return 0;
  else
    return v4 ^ 1u;
}

uint64_t __62__PHAssetResourceManager_consolidateAssets_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __41__PHAssetResourceManager_infoForRequest___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __44__PHAssetResourceManager_cancelDataRequest___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __92__PHAssetResourceManager_requestWriteDataForAssetResource_toFile_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

+ (PHAssetResourceManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_32601);
  return (PHAssetResourceManager *)(id)defaultManager__manager;
}

void __40__PHAssetResourceManager_defaultManager__block_invoke()
{
  PHAssetResourceManager *v0;
  void *v1;

  v0 = objc_alloc_init(PHAssetResourceManager);
  v1 = (void *)defaultManager__manager;
  defaultManager__manager = (uint64_t)v0;

  *(_QWORD *)(defaultManager__manager + 16) = 2;
}

@end
