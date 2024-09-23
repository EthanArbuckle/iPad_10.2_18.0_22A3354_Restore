@implementation PHAssetResourceWriteRequest

- (PHAssetResourceWriteRequest)initWithAssetResource:(id)a3 destinationFileURL:(id)a4 options:(id)a5 requestID:(int)a6 managerID:(unint64_t)a7 delegate:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PHAssetResourceWriteRequest *v20;
  PHAssetResourceWriteRequest *v21;
  uint64_t v22;
  id completionHandler;
  void *v25;
  objc_super v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceWriteRequest.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  }
  v28.receiver = self;
  v28.super_class = (Class)PHAssetResourceWriteRequest;
  v20 = -[PHAssetResourceWriteRequest init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_assetResource, a3);
    objc_storeStrong((id *)&v21->_destinationFileURL, a4);
    objc_storeStrong((id *)&v21->_options, a5);
    v21->_requestID = a6;
    v21->_managerID = a7;
    objc_storeWeak((id *)&v21->_delegate, v18);
    v21->_completionHandlerLock._os_unfair_lock_opaque = 0;
    v22 = objc_msgSend(v19, "copy");
    completionHandler = v21->_completionHandler;
    v21->_completionHandler = (id)v22;

  }
  return v21;
}

- (void)setErrorIfNone:(id)a3
{
  id v5;
  NSError **p_error;
  NSError *error;
  id v8;

  v5 = a3;
  error = self->_error;
  p_error = &self->_error;
  if (!error)
  {
    v8 = v5;
    objc_storeStrong((id *)p_error, a3);
    v5 = v8;
  }

}

- (void)_handleDidFindFileURL:(id)a3
{
  id v4;
  NSURL *destinationFileURL;
  int v6;
  id v7;
  NSURL *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  NSURL *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  NSURL *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PHAssetResourceWriteRequest isCancelled](self, "isCancelled"))
  {
    destinationFileURL = self->_destinationFileURL;
    v15 = 0;
    v6 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v4, destinationFileURL, &v15);
    v7 = v15;
    if (v6)
    {
      v8 = self->_destinationFileURL;
      v9 = *MEMORY[0x1E0D73F90];
      v14 = 0;
      v10 = objc_msgSend(MEMORY[0x1E0D73208], "stripExtendedAttributesFromFileAtURL:inDomain:error:", v8, v9, &v14);
      v11 = v14;
      if ((v10 & 1) == 0)
      {
        PLPhotoKitGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = self->_destinationFileURL;
          *(_DWORD *)buf = 138412546;
          v17 = v13;
          v18 = 2112;
          v19 = v11;
          _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Failed to strip extended attributes from %@, %@", buf, 0x16u);
        }

      }
    }
    else
    {
      -[PHAssetResourceWriteRequest setErrorIfNone:](self, "setErrorIfNone:", v7);
    }

  }
}

- (id)_lazyDataRequest
{
  PHAssetResourceRequest *dataRequest;
  PHAssetResourceRequest *v4;
  PHAssetResource *assetResource;
  PHAssetResourceRequestOptions *options;
  uint64_t requestID;
  unint64_t managerID;
  PHAssetResourceRequest *v9;
  PHAssetResourceRequest *v10;
  _QWORD v12[4];
  id v13;
  id location;

  dataRequest = self->_dataRequest;
  if (!dataRequest)
  {
    objc_initWeak(&location, self);
    v4 = [PHAssetResourceRequest alloc];
    assetResource = self->_assetResource;
    options = self->_options;
    requestID = self->_requestID;
    managerID = self->_managerID;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PHAssetResourceWriteRequest__lazyDataRequest__block_invoke;
    v12[3] = &unk_1E35DFB98;
    objc_copyWeak(&v13, &location);
    v9 = -[PHAssetResourceRequest initWithAssetResource:options:requestID:managerID:delegate:urlReceivedHandler:dataReceivedHandler:completionHandler:](v4, "initWithAssetResource:options:requestID:managerID:delegate:urlReceivedHandler:dataReceivedHandler:completionHandler:", assetResource, options, requestID, managerID, self, v12, 0, 0);
    v10 = self->_dataRequest;
    self->_dataRequest = v9;

    -[PHAssetResourceRequest setLoadURLOnly:](self->_dataRequest, "setLoadURLOnly:", 1);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    dataRequest = self->_dataRequest;
  }
  return dataRequest;
}

- (BOOL)isCancelled
{
  return -[PHAssetResourceRequest isCancelled](self->_dataRequest, "isCancelled");
}

- (void)cancel
{
  -[PHAssetResourceRequest cancel](self->_dataRequest, "cancel");
}

- (void)startRequest
{
  id v2;

  -[PHAssetResourceWriteRequest _lazyDataRequest](self, "_lazyDataRequest");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRequest");

}

- (void)configureWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHAssetResourceWriteRequest _lazyDataRequest](self, "_lazyDataRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithError:", v4);

}

- (NSString)taskIdentifier
{
  NSString *taskIdentifier;

  taskIdentifier = self->_taskIdentifier;
  if (taskIdentifier)
    return taskIdentifier;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ARW-%lu-%lu"), self->_managerID, self->_requestID);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4
{
  id completionHandler;
  void *v6;
  id WeakRetained;
  void (**v8)(id, void *);

  -[PHAssetResourceWriteRequest setErrorIfNone:](self, "setErrorIfNone:", a4);
  os_unfair_lock_lock(&self->_completionHandlerLock);
  v8 = (void (**)(id, void *))_Block_copy(self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  os_unfair_lock_unlock(&self->_completionHandlerLock);
  if (v8)
  {
    PHPublicErrorFromError(self->_error);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v6);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "assetResourceRequest:didFinishWithError:", self, self->_error);

}

- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4
{
  PHAssetResourceWriteRequest *v4;
  PHAssetResourceRequestDelegate **p_delegate;
  id v6;
  id WeakRetained;

  v4 = self;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "retryAssetResourceRequest:afterFailureWithError:", v4, v6);

  return (char)v4;
}

- (unint64_t)fetchIncrementRetryAttemptCount
{
  return -[PHAssetResourceRequest fetchIncrementRetryAttemptCount](self->_dataRequest, "fetchIncrementRetryAttemptCount");
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

- (NSDictionary)info
{
  return self->_info;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)destinationFileURL
{
  return self->_destinationFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationFileURL, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetResource, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataRequest, 0);
}

void __47__PHAssetResourceWriteRequest__lazyDataRequest__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleDidFindFileURL:", v3);

}

@end
