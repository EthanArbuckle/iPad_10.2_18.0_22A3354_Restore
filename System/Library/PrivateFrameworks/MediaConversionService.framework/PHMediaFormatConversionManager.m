@implementation PHMediaFormatConversionManager

- (void)preflightConversionRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[PHMediaFormatConversionManager configureTransferBehaviorUserPreferenceForRequest:](self, "configureTransferBehaviorUserPreferenceForRequest:", v4);
  objc_msgSend(v4, "setDirectoryForTemporaryFiles:", self->_directoryForTemporaryFiles);
  objc_msgSend(v4, "preflightWithConversionManager:", self);

}

- (void)configureTransferBehaviorUserPreferenceForRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t (**transferBehaviorUserPreferenceOverride)(id, id);
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHMediaFormatConversionManager conversionImplementation](self, "conversionImplementation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transferBehaviorUserPreference");

  transferBehaviorUserPreferenceOverride = (uint64_t (**)(id, id))self->_transferBehaviorUserPreferenceOverride;
  if (transferBehaviorUserPreferenceOverride)
  {
    v8 = transferBehaviorUserPreferenceOverride[2](transferBehaviorUserPreferenceOverride, v4);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Media conversion transfer user preference overridden from %ld to %ld", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v8 = v6;
  }
  objc_msgSend(v4, "setTransferBehaviorUserPreference:", v8);

}

- (PHMediaFormatConversionImplementation)conversionImplementation
{
  return (PHMediaFormatConversionImplementation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setupConversionImplementation
{
  id v3;

  v3 = (id)objc_opt_new();
  -[PHMediaFormatConversionManager setConversionImplementation:](self, "setConversionImplementation:", v3);

}

- (void)setConversionImplementation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PHMediaFormatConversionManager)init
{
  PHMediaFormatConversionManager *v2;
  uint64_t v3;
  NSMutableArray *queuedJobs;
  dispatch_queue_t v5;
  OS_dispatch_queue *stateQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *preflightQueue;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *directoryForTemporaryFiles;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHMediaFormatConversionManager;
  v2 = -[PHMediaFormatConversionManager init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    queuedJobs = v2->_queuedJobs;
    v2->_queuedJobs = (NSMutableArray *)v3;

    v5 = dispatch_queue_create("com.apple.photos.mediaformatconversion.state", 0);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.photos.mediaformatconversion.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.photos.mediaformatconversion.preflight", 0);
    preflightQueue = v2->_preflightQueue;
    v2->_preflightQueue = (OS_dispatch_queue *)v9;

    v2->_state = 1;
    v11 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    directoryForTemporaryFiles = v2->_directoryForTemporaryFiles;
    v2->_directoryForTemporaryFiles = (NSURL *)v13;

    -[PHMediaFormatConversionManager setupConversionImplementation](v2, "setupConversionImplementation");
  }
  return v2;
}

- (void)enqueueConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  __CFString *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  void (**v19)(_QWORD);
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v7, "status") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2071, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conversionRequest.status == PHMediaFormatRequestStatusInitialized"));

  }
  if (objc_msgSend(v7, "isCompositeRequest"))
    objc_msgSend(v7, "enqueueSubrequestsOnConversionManager:", self);
  objc_msgSend(v7, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderOriginatingSignature");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10 == CFSTR("PHMediaFormatConversionUnknownFutureIdentifierPlaceholder"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2078, CFSTR("Invalid attempt to enqueue a request using an identifier placeholder. The placeholder may only be used for preflight."));

  }
  if (!objc_msgSend(v7, "requiresSinglePassVideoConversion"))
    goto LABEL_10;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setMediaType:", 1);
  objc_msgSend(v11, "generateTemporaryOutputFileURLForRequest:", v7);
  objc_msgSend(v11, "enableSinglePassVideoConversionWithTargetLength:", objc_msgSend(v7, "estimatedOutputFileLength"));
  v20 = 0;
  v12 = objc_msgSend(v11, "createTemporaryOutputDirectoryWithError:", &v20);
  v13 = v20;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v7, "setDestination:", v11);

LABEL_10:
    -[PHMediaFormatConversionManager stateQueue](self, "stateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PHMediaFormatConversionManager_enqueueConversionRequest_completionHandler___block_invoke;
    block[3] = &unk_1E9953868;
    block[4] = self;
    v18 = v7;
    v19 = v8;
    dispatch_sync(v14, block);

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary directory: %@", buf, 0xCu);
  }
  objc_msgSend(v7, "setError:", v13);
  objc_msgSend(v7, "setStatus:", 5);
  v8[2](v8);

LABEL_14:
}

- (void)preflightConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PHMediaFormatConversionManager preflightQueue](self, "preflightQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PHMediaFormatConversionManager_preflightConversionRequest_completionHandler___block_invoke;
  block[3] = &unk_1E9953868;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setTransferBehaviorUserPreferenceOverride:(id)a3
{
  void *v4;
  id transferBehaviorUserPreferenceOverride;

  v4 = (void *)MEMORY[0x1D8270520](a3, a2);
  transferBehaviorUserPreferenceOverride = self->_transferBehaviorUserPreferenceOverride;
  self->_transferBehaviorUserPreferenceOverride = v4;

}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
  NSURL *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  _BOOL4 v11;
  NSURL *directoryForTemporaryFiles;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v5 = (NSURL *)a3;
  -[NSURL path](v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v15);
  v9 = objc_msgSend(v7, "isWritableFileAtPath:", v6);
  v10 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || !v15 || (v11 = 0, v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2155, CFSTR("Invalid temporary directory URL parameter '%@' not satisfying exists && isDirectory && isWritable (%d/%d/%d)"), v5, v8, v15, v9);

    v11 = v15 == 0;
  }
  if ((v8 ^ 1 | v11 | v10) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exists && isDirectory && isWritable"));

  }
  directoryForTemporaryFiles = self->_directoryForTemporaryFiles;
  self->_directoryForTemporaryFiles = v5;

}

- (void)processQueuedJobs
{
  NSObject *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20[2];
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PHMediaFormatConversionManager stateQueue](self, "stateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[PHMediaFormatConversionManager state](self, "state") != 1)
    goto LABEL_4;
  -[PHMediaFormatConversionManager currentlyProcessingJob](self, "currentlyProcessingJob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    goto LABEL_4;
  }
  -[PHMediaFormatConversionManager queuedJobs](self, "queuedJobs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
LABEL_4:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = -[PHMediaFormatConversionManager state](self, "state");
      -[PHMediaFormatConversionManager currentlyProcessingJob](self, "currentlyProcessingJob");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conversionRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaFormatConversionManager queuedJobs](self, "queuedJobs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v22 = v6;
      v23 = 2112;
      v24 = v9;
      v25 = 2048;
      v26 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process queued jobs: not starting job, state: %ld, current request: %@, queued job count: %lu", buf, 0x20u);

    }
    return;
  }
  -[NSMutableArray firstObject](self->_queuedJobs, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionManager queuedJobs](self, "queuedJobs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectAtIndex:", 0);

  -[PHMediaFormatConversionManager setCurrentlyProcessingJob:](self, "setCurrentlyProcessingJob:", v13);
  objc_msgSend(v13, "conversionRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "status") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2172, CFSTR("Unexpected request state %@"), v18);

  }
  objc_msgSend(v15, "setStatus:", 3);
  if ((objc_msgSend(v15, "preflighted") & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = (unint64_t)v13;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process queued jobs: starting job %{public}@ for request %{public}@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, v13);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke;
    v19[3] = &unk_1E99538B8;
    objc_copyWeak(v20, (id *)buf);
    v20[1] = (id)a2;
    v19[4] = self;
    -[PHMediaFormatConversionManager performConversionRequest:completionHandler:](self, "performConversionRequest:completionHandler:", v15, v19);
    objc_destroyWeak(v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[PHMediaFormatConversionManager preflightAllRelatedRequestsForCurrentJob](self, "preflightAllRelatedRequestsForCurrentJob");
  }

}

- (void)performConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  if ((objc_msgSend(v7, "isCompositeRequest") & 1) != 0)
  {
LABEL_16:
    v9[2](v9);
    goto LABEL_17;
  }
  v10 = objc_msgSend(v7, "backwardsCompatibilityStatus");
  v11 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v7, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "typeWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "requiresPassthroughConversion"))
  {
LABEL_10:
    if (v10 == 2)
      goto LABEL_11;
LABEL_12:
    if (objc_msgSend(v7, "backwardsCompatibilityStatus") != 1)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v7, "setStatus:", 4);
    objc_msgSend(v7, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHMediaFormatConversionDestination destinationForConversionReturningUnchangedSource:](PHMediaFormatConversionDestination, "destinationForConversionReturningUnchangedSource:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDestination:", v19);
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v7, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "mediaType") != 1)
  {

    goto LABEL_10;
  }
  v16 = objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CEC5B0]);

  if (v10 != 2)
    goto LABEL_12;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v7, "setStatus:", 5);
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Passthrough video conversion is only available for QuickTime input format");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 4, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:", v19);
    goto LABEL_14;
  }
LABEL_11:
  -[PHMediaFormatConversionManager validateLivePhotoPairingIdentifierConfigurationForRequest:](self, "validateLivePhotoPairingIdentifierConfigurationForRequest:", v7);
  -[PHMediaFormatConversionManager conversionImplementation](self, "conversionImplementation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performConversionRequest:completionHandler:", v7, v9);

LABEL_17:
}

- (void)validateLivePhotoPairingIdentifierConfigurationForRequest:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((unint64_t)(objc_msgSend(v7, "livePhotoPairingIdentifierBehavior") - 3) <= 1)
  {
    objc_msgSend(v7, "livePhotoPairingIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 2240, CFSTR("Unexpected nil pairing identifier"));

    }
  }

}

- (void)preflightAllRelatedRequestsForCurrentJob
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  SEL v12;

  -[PHMediaFormatConversionManager currentlyProcessingJob](self, "currentlyProcessingJob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionManager rootAncestorRequestForRequest:](self, "rootAncestorRequestForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke;
  v9[3] = &unk_1E99538E0;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v12 = a2;
  v7 = v5;
  v8 = v4;
  -[PHMediaFormatConversionManager preflightConversionRequest:completionHandler:](self, "preflightConversionRequest:completionHandler:", v6, v9);

}

- (id)rootAncestorRequestForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "parentRequest");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = v5;

      objc_msgSend(v6, "parentRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v6;
    }
    while (v5);
  }
  else
  {
    v6 = v3;
  }
  return v6;
}

- (id)jobForConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setConversionRequest:", v6);
  objc_msgSend(v8, "setCompletionHandler:", v7);
  objc_msgSend(v6, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancellationHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PHMediaFormatConversionManager_jobForConversionRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E9953908;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(&v17, &location);
  v11 = v10;
  v15 = v11;
  objc_msgSend(v6, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCancellationHandler:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

- (void)cancellationRequestedForJob:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  PHMediaFormatConversionManager *v9;

  v4 = a3;
  -[PHMediaFormatConversionManager stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PHMediaFormatConversionManager_cancellationRequestedForJob___block_invoke;
  block[3] = &unk_1E9953840;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)invalidate
{
  NSObject *v4;
  _QWORD v5[6];

  -[PHMediaFormatConversionManager stateQueue](self, "stateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PHMediaFormatConversionManager_invalidate__block_invoke;
  v5[3] = &unk_1E9953930;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);

}

- (id)ut_objectsToBeDeallocatedWithReceiver
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PHMediaFormatConversionManager conversionImplementation](self, "conversionImplementation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PHMediaFormatConversionManager conversionImplementation](self, "conversionImplementation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ut_objectsToBeDeallocatedWithReceiver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSURL)directoryForTemporaryFiles
{
  return self->_directoryForTemporaryFiles;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)queuedJobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueuedJobs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PHMediaFormatConversionJob)currentlyProcessingJob
{
  return (PHMediaFormatConversionJob *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentlyProcessingJob:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)stateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)preflightQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPreflightQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_currentlyProcessingJob, 0);
  objc_storeStrong((id *)&self->_queuedJobs, 0);
  objc_storeStrong((id *)&self->_conversionImplementation, 0);
  objc_storeStrong((id *)&self->_directoryForTemporaryFiles, 0);
  objc_storeStrong(&self->_transferBehaviorUserPreferenceOverride, 0);
}

void __44__PHMediaFormatConversionManager_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PHMediaFormatConversion.m"), 2338, CFSTR("Invalidate can only be called once."));

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "currentlyProcessingJob");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "conversionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "progress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "queuedJobs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      v11 = v3;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v3 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v10);

        objc_msgSend(v3, "conversionRequest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "progress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cancel");

        ++v10;
        v11 = v3;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __62__PHMediaFormatConversionManager_cancellationRequestedForJob___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") == 2)
  {
    objc_msgSend(v2, "markAsCancelled");
    objc_msgSend(*(id *)(a1 + 40), "queuedJobs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, v5);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v2, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled queued request %@", (uint8_t *)&v7, 0xCu);

    }
  }

}

void __76__PHMediaFormatConversionManager_jobForConversionRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "cancellationRequestedForJob:", v2);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "stateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke_2;
  block[3] = &unk_1E99538E0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v8 = v5;
  dispatch_async(v2, block);

}

uint64_t __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "currentlyProcessingJob");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "currentlyProcessingJob");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PHMediaFormatConversion.m"), 2256, CFSTR("Current job mismatch: %@/%@"), v12, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "status") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "statusString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v16, v15, CFSTR("PHMediaFormatConversion.m"), 2257, CFSTR("Current job request state mismatch: %@"), v17);

  }
  objc_msgSend(*(id *)(a1 + 48), "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "markAsCancelled");
  if (objc_msgSend(*(id *)(a1 + 48), "status") == 3 && objc_msgSend(*(id *)(a1 + 48), "preflighted"))
  {
    objc_msgSend(*(id *)(a1 + 48), "setStatus:", 2);
    objc_msgSend(*(id *)(a1 + 32), "queuedJobs");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject insertObject:atIndex:](v6, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentlyProcessingJob:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "processQueuedJobs");
}

void __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PHMediaFormatConversion.m"), 2185, CFSTR("Current job went away unexpectedly"));

  }
  objc_msgSend(WeakRetained, "conversionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v4;
    v17 = 2114;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process queued jobs: completed request %{public}@, status = %{public}@, error = %@", buf, 0x20u);

  }
  objc_msgSend(v3, "didFinishProcessing");
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_759;
  block[3] = &unk_1E9953890;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = WeakRetained;
  v13 = v8;
  v14 = *(_QWORD *)(a1 + 48);
  v9 = WeakRetained;
  dispatch_async(v7, block);

}

void __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_759(uint64_t a1)
{
  void (**v2)(void);
  NSObject *v3;
  id v4;
  int8x16_t v5;
  _QWORD block[4];
  int8x16_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  objc_msgSend(*(id *)(a1 + 40), "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_2;
  block[3] = &unk_1E9953890;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(_QWORD *)(a1 + 48);
  dispatch_async(v3, block);

}

uint64_t __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "currentlyProcessingJob");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "currentlyProcessingJob");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v8, CFSTR("PHMediaFormatConversion.m"), 2197, CFSTR("Current job mismatch: %@/%@"), v7, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentlyProcessingJob:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "processQueuedJobs");
}

void __79__PHMediaFormatConversionManager_preflightConversionRequest_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "preflightConversionRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 48));

}

void __77__PHMediaFormatConversionManager_enqueueConversionRequest_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "state") == 1)
  {
    objc_msgSend(a1[4], "jobForConversionRequest:completionHandler:", a1[5], a1[6]);
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setStatus:", 2);
    objc_msgSend(a1[4], "queuedJobs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v2);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[5], "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "queuedJobs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2048;
      v10 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Enqueued request %@, enqueued count now %lu", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(a1[4], "processQueuedJobs");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[5], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Rejecting conversion request %@ enqueued to manager not in running state", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(a1[5], "markAsCancelled");
    objc_msgSend(a1[4], "callbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, a1[6]);
  }

}

@end
