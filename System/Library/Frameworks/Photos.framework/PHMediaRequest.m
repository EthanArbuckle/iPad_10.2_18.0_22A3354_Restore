@implementation PHMediaRequest

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (BOOL)isCancelled
{
  PHMediaRequest *v2;
  os_unfair_lock_s *p_lock;
  unsigned __int8 v4;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = atomic_load((unsigned __int8 *)&v2->_cancelled);
  LOBYTE(v2) = v4 & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PLProgressFollower invalidate](self->_progressFollower, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHMediaRequest;
  -[PHMediaRequest dealloc](&v3, sel_dealloc);
}

- (PHMediaRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  PHMediaRequest *v17;
  PHMediaRequest *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PHMediaRequest;
  v17 = -[PHMediaRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_requestID = a3;
    v17->_requestIndex = a4;
    v17->_contextType = a5;
    v17->_managerID = a6;
    objc_storeStrong((id *)&v17->_asset, a7);
    v18->_signpostID = 0;
    v18->_wantsProgress = 1;
    v18->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v18->_delegate, v16);
    atomic_store(0, &v18->_retryAttemptCount);
  }

  return v18;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (int)requestID
{
  return self->_requestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressFollower, 0);
  objc_storeStrong((id *)&self->_progressContainer, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong((id *)&self->_identifierString, 0);
  objc_storeStrong((id *)&self->_configurationError, 0);
}

- (PHMediaRequestDelegate)delegate
{
  return (PHMediaRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)identifierString
{
  NSString *identifierString;
  NSString *v4;
  NSString *v5;

  identifierString = self->_identifierString;
  if (!identifierString)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), self->_managerID, self->_requestID, self->_requestIndex);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_identifierString;
    self->_identifierString = v4;

    identifierString = self->_identifierString;
  }
  return identifierString;
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (BOOL)isSynchronous
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequest.m"), 59, CFSTR("%@ Subclass must implement"), v6);

  return 0;
}

- (void)startRequest
{
  objc_class *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequest.m"), 71, CFSTR("%@ Subclass must implement"), v5);

}

- (void)handleAvailabilityChangeForResource:(id)a3 url:(id)a4 info:(id)a5 error:(id)a6
{
  objc_class *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequest.m"), 75, CFSTR("%@ Subclass must implement"), v9);

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
  v4 = (void *)-[NSMutableArray copy](self->_progresses, "copy");
  -[NSMutableArray removeAllObjects](self->_progresses, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cancel", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isNetworkAccessAllowed
{
  return 0;
}

- (void)configureWithError:(id)a3
{
  objc_storeStrong((id *)&self->_configurationError, a3);
}

- (int64_t)downloadIntent
{
  return 0;
}

- (int64_t)downloadPriority
{
  return 0;
}

- (id)lazyProgressContainer
{
  PHProgressContainerForRetryableRequest *progressContainer;
  PHProgressContainerForRetryableRequest *v4;
  PHProgressContainerForRetryableRequest *v5;
  id v6;
  void *v7;
  PLProgressFollower *v8;
  PLProgressFollower *progressFollower;
  _QWORD v11[4];
  id v12;
  id location;

  progressContainer = self->_progressContainer;
  if (!progressContainer)
  {
    v4 = objc_alloc_init(PHProgressContainerForRetryableRequest);
    v5 = self->_progressContainer;
    self->_progressContainer = v4;

    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x1E0D71A18]);
    -[PHProgressContainerForRetryableRequest totalProgress](self->_progressContainer, "totalProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__PHMediaRequest_lazyProgressContainer__block_invoke;
    v11[3] = &unk_1E35DE530;
    objc_copyWeak(&v12, &location);
    v8 = (PLProgressFollower *)objc_msgSend(v6, "initWithSourceProgress:progressHandler:", v7, v11);
    progressFollower = self->_progressFollower;
    self->_progressFollower = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    progressContainer = self->_progressContainer;
  }
  return progressContainer;
}

- (id)sendMakeAvailableRequestForResource:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  NSMutableArray *progresses;
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PHMediaRequest isCancelled](self, "isCancelled")
    || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE38EFE8) & 1) == 0)
  {
    v42 = CFSTR("PHImageCancelledKey");
    v43[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, void *))v7 + 2))(v7, 0, 0, 0, v11, v27);

    v28 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0D71A88]);
    -[PHMediaRequest identifierString](self, "identifierString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject objectID](self->_asset, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithTaskIdentifier:assetObjectID:resource:", v9, v10, v6);

    objc_msgSend(v11, "setWantsProgress:", self->_wantsProgress);
    objc_msgSend(v11, "setNetworkAccessAllowed:", -[PHMediaRequest isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
    objc_msgSend(v11, "setDownloadIntent:", -[PHMediaRequest downloadIntent](self, "downloadIntent"));
    objc_msgSend(v11, "setDownloadPriority:", -[PHMediaRequest downloadPriority](self, "downloadPriority"));
    objc_msgSend(v6, "recipeID");
    if (PLShouldBoostLogLevelForResourceRecipeID())
      v12 = OS_LOG_TYPE_DEFAULT;
    else
      v12 = OS_LOG_TYPE_DEBUG;
    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, v12))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHObject objectID](self->_asset, "objectID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pl_shortURI");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHObject uuid](self->_asset, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PLResourceIdentityShortDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v14;
      v36 = 2114;
      v37 = v15;
      v38 = 2114;
      v39 = v16;
      v40 = 2114;
      v41 = v17;
      _os_log_impl(&dword_1991EC000, v13, v12, "[RM] %{public}@ media request sending make available request for asset: %{public}@ %{public}@, resource: %{public}@", buf, 0x2Au);

    }
    -[PHObject photoLibrary](self->_asset, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assetsdClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resourceAvailabilityClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __60__PHMediaRequest_sendMakeAvailableRequestForResource_reply___block_invoke;
    v31[3] = &unk_1E35DC130;
    v31[4] = self;
    v32 = v6;
    v33 = v7;
    objc_msgSend(v20, "sendMakeResourceAvailableRequest:reply:", v11, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      os_unfair_lock_lock(&self->_lock);
      v22 = atomic_load((unsigned __int8 *)&self->_cancelled);
      if ((v22 & 1) != 0)
      {
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(v21, "cancel");
      }
      else
      {
        progresses = self->_progresses;
        if (!progresses)
        {
          v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v25 = self->_progresses;
          self->_progresses = v24;

          progresses = self->_progresses;
        }
        -[NSMutableArray addObject:](progresses, "addObject:", v21);
        -[PHMediaRequest lazyProgressContainer](self, "lazyProgressContainer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setRequestProgress:", v21);

        os_unfair_lock_unlock(&self->_lock);
      }
    }
    -[PHProgressContainerForRetryableRequest totalProgress](self->_progressContainer, "totalProgress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

- (id)sendResourceRepairRequestForResource:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSMutableArray *progresses;
  NSMutableArray *v21;
  NSMutableArray *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (-[PHMediaRequest isCancelled](self, "isCancelled")
    || (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE38EFE8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v14);
    v18 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0D71A88]);
    -[PHMediaRequest identifierString](self, "identifierString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject objectID](self->_asset, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTaskIdentifier:assetObjectID:resource:", v12, v13, v8);

    -[PHObject photoLibrary](self->_asset, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetsdClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resourceAvailabilityClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendResourceRepairRequest:errorCodes:reply:", v14, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      os_unfair_lock_lock(&self->_lock);
      v19 = atomic_load((unsigned __int8 *)&self->_cancelled);
      if ((v19 & 1) != 0)
      {
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(v18, "cancel");
      }
      else
      {
        progresses = self->_progresses;
        if (!progresses)
        {
          v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v22 = self->_progresses;
          self->_progresses = v21;

          progresses = self->_progresses;
        }
        -[NSMutableArray addObject:](progresses, "addObject:", v18);
        os_unfair_lock_unlock(&self->_lock);
      }
    }
  }

  return v18;
}

- (id)sendResourceRepairRequestWithErrorCodes:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSMutableArray *progresses;
  NSMutableArray *v18;
  NSMutableArray *v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[PHMediaRequest isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);

    v9 = 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0D71A90]);
    -[PHMediaRequest identifierString](self, "identifierString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject objectID](self->_asset, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v10, "initWithTaskIdentifier:assetObjectID:", v11, v12);

    -[PHObject photoLibrary](self->_asset, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetsdClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resourceAvailabilityClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendResourceRepairRequestForAsset:errorCodes:reply:", v8, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      os_unfair_lock_lock(&self->_lock);
      v16 = atomic_load((unsigned __int8 *)&self->_cancelled);
      if ((v16 & 1) != 0)
      {
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(v9, "cancel");
      }
      else
      {
        progresses = self->_progresses;
        if (!progresses)
        {
          v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v19 = self->_progresses;
          self->_progresses = v18;

          progresses = self->_progresses;
        }
        -[NSMutableArray addObject:](progresses, "addObject:", v9);
        os_unfair_lock_unlock(&self->_lock);
      }
    }
  }

  return v9;
}

- (void)recordMetricsWithMetricsHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequest.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  if (recordMetricsWithMetricsHandler__onceToken != -1)
    dispatch_once(&recordMetricsWithMetricsHandler__onceToken, &__block_literal_global_29176);
  -[PHMediaRequest asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = recordMetricsWithMetricsHandler__metricsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PHMediaRequest_recordMetricsWithMetricsHandler___block_invoke_2;
  block[3] = &unk_1E35DF368;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v7;
  dispatch_async(v8, block);

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

- (unint64_t)requestIndex
{
  return self->_requestIndex;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

void __50__PHMediaRequest_recordMetricsWithMetricsHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cacheMetricsCollector");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__PHMediaRequest_recordMetricsWithMetricsHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.photos.imagemanager.metrics", 0);
  v1 = (void *)recordMetricsWithMetricsHandler__metricsQueue;
  recordMetricsWithMetricsHandler__metricsQueue = (uint64_t)v0;

  v2 = recordMetricsWithMetricsHandler__metricsQueue;
  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

void __60__PHMediaRequest_sendMakeAvailableRequestForResource_reply___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  os_signpost_id_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    v15 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      PLImageManagerGetLog();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(*(id *)(a1 + 32), "managerID");
      v18 = objc_msgSend(*(id *)(a1 + 32), "requestID");
      v19 = objc_msgSend(*(id *)(a1 + 32), "requestIndex");
      v20 = v17;
      if (os_signpost_enabled(v20))
      {
        v31 = (void *)v18;
        v21 = objc_msgSend(*(id *)(a1 + 40), "recipeID");
        objc_msgSend(*(id *)(a1 + 40), "resourceType");
        *(_DWORD *)buf = 134218752;
        v35 = v32;
        v36 = 2048;
        v37 = v31;
        v38 = 2048;
        v39 = v19;
        v40 = 2048;
        v41 = PHImageManagerSignpostRequestStateFromRecipeID(v21);
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_EVENT, v16, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
      }

    }
  }
  if (v11 && a2)
  {
    v22 = (void *)MEMORY[0x1E0D71A60];
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    LOBYTE(v22) = objc_msgSend(v22, "refreshSandboxExtensionForURL:assetID:error:", v11, v23, &v33);
    v24 = v33;

    if ((v22 & 1) == 0)
    {
      PLImageManagerGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifierString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = (uint64_t)v26;
        v36 = 2112;
        v37 = v27;
        v38 = 2112;
        v39 = (uint64_t)v24;
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "[RM] %@ media request failed to refresh sandbox extension for path: %@, error; %@",
          buf,
          0x20u);

      }
      v28 = v24;

      v14 = v28;
    }

    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "retryMediaRequest:afterFailureWithError:", *(_QWORD *)(a1 + 32), v14);

  if ((v30 & 1) == 0)
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __39__PHMediaRequest_lazyProgressContainer__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRequest:didReportProgress:", WeakRetained, v3);

}

@end
