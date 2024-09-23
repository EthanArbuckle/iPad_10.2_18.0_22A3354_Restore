@implementation CPLLibraryManager

- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CPLLibraryManager *v20;
  CPLLibraryManager *v21;
  CPLLibraryManager *v22;
  _CPLWeakLibraryManager *v23;
  _CPLWeakLibraryManager *weakSelf;
  uint64_t v25;
  NSURL *clientLibraryBaseURL;
  uint64_t v27;
  NSURL *cloudLibraryStateStorageURL;
  uint64_t v29;
  NSURL *cloudLibraryResourceStorageURL;
  uint64_t v31;
  NSString *libraryIdentifier;
  uint64_t v33;
  NSString *mainScopeIdentifier;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *queue;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *sessionLock;
  NSObject *v41;
  dispatch_queue_t v42;
  OS_dispatch_queue *initLock;
  void *v44;
  uint64_t v45;
  CPLPlatformObject *platformObject;
  NSObject *v47;
  NSObject *v49;
  CPLLibraryManager *v50;
  CPLLibraryManager *v51;
  void *v52;
  void *v53;
  objc_super v54;
  _QWORD block[4];
  CPLLibraryManager *v56;
  uint8_t buf[4];
  CPLLibraryManager *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __155__CPLLibraryManager_initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options___block_invoke;
  block[3] = &unk_1E60D65B8;
  v20 = self;
  v56 = v20;
  if (initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options__onceToken != -1)
    dispatch_once(&initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options__onceToken, block);
  v54.receiver = v20;
  v54.super_class = (Class)CPLLibraryManager;
  v21 = -[CPLLibraryManager init](&v54, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_preventObserving = 1;
    v23 = -[_CPLWeakLibraryManager initWithLibraryManager:]([_CPLWeakLibraryManager alloc], "initWithLibraryManager:", v21);
    weakSelf = v22->_weakSelf;
    v22->_weakSelf = v23;

    v25 = objc_msgSend(v15, "copy");
    clientLibraryBaseURL = v22->_clientLibraryBaseURL;
    v22->_clientLibraryBaseURL = (NSURL *)v25;

    v27 = objc_msgSend(v16, "copy");
    cloudLibraryStateStorageURL = v22->_cloudLibraryStateStorageURL;
    v22->_cloudLibraryStateStorageURL = (NSURL *)v27;

    v29 = objc_msgSend(v17, "copy");
    cloudLibraryResourceStorageURL = v22->_cloudLibraryResourceStorageURL;
    v22->_cloudLibraryResourceStorageURL = (NSURL *)v29;

    v31 = objc_msgSend(v18, "copy");
    libraryIdentifier = v22->_libraryIdentifier;
    v22->_libraryIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v19, "copy");
    mainScopeIdentifier = v22->_mainScopeIdentifier;
    v22->_mainScopeIdentifier = (NSString *)v33;

    v22->_libraryOptions = a8;
    CPLCopyDefaultSerialQueueAttributes();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create("com.apple.cpl.librarymanager", v35);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v36;

    CPLCopyDefaultSerialQueueAttributes();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = dispatch_queue_create("com.apple.cpl.librarymanager.session", v38);
    sessionLock = v22->_sessionLock;
    v22->_sessionLock = (OS_dispatch_queue *)v39;

    CPLCopyDefaultSerialQueueAttributes();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = dispatch_queue_create("com.apple.cpl.librarymanager.init", v41);
    initLock = v22->_initLock;
    v22->_initLock = (OS_dispatch_queue *)v42;

    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "newPlatformImplementationForObject:", v22);
    platformObject = v22->_platformObject;
    v22->_platformObject = (CPLPlatformObject *)v45;

    if (!v22->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain_0();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = (CPLLibraryManager *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v58 = v50;
          v51 = v50;
          _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, v53, 272, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v22;
        _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
      }

    }
  }

  return v22;
}

- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 options:(unint64_t)a7
{
  return -[CPLLibraryManager initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:](self, "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:", a3, a4, a5, a6, CFSTR("PrimarySync"), a7);
}

- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6
{
  return -[CPLLibraryManager initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:options:](self, "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:options:", a3, a4, a5, a6, 0);
}

- (id)initForManagement
{
  return -[CPLLibraryManager initForManagementWithLibraryIdentifier:](self, "initForManagementWithLibraryIdentifier:", CFSTR("SystemLibrary"));
}

- (id)initForManagementWithLibraryIdentifier:(id)a3
{
  return -[CPLLibraryManager initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:](self, "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:", 0, 0, 0, a3, 0, 0);
}

- (void)barrier
{
  id v2;

  -[CPLLibraryManager platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barrier");

}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  CPLLibraryManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_state)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", self->_state);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v12 = self;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "at dealloc time, %@ should not be in state %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", self->_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 311, CFSTR("at dealloc time, %@ should not be in state %@"), self, v8);

LABEL_14:
    abort();
  }
  if (self->_currentSession)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Current session not finished", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 312, CFSTR("Current session not finished"));
    goto LABEL_14;
  }
  v10.receiver = self;
  v10.super_class = (Class)CPLLibraryManager;
  -[CPLLibraryManager dealloc](&v10, sel_dealloc);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CPLLibraryManager_openWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)_closeDeactivating:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD block[4];
  id v17;

  v6 = a4;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke;
  v13[3] = &unk_1E60DC058;
  v13[4] = self;
  v14 = v6;
  v15 = a3;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = queue;
  v11 = v6;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

- (void)closeWithCompletionHandler:(id)a3
{
  -[CPLLibraryManager _closeDeactivating:completionHandler:](self, "_closeDeactivating:completionHandler:", 0, a3);
}

- (void)deactivateWithCompletionHandler:(id)a3
{
  -[CPLLibraryManager _closeDeactivating:completionHandler:](self, "_closeDeactivating:completionHandler:", 1, a3);
}

- (void)enableMainScopeWithCompletionHandler:(id)a3
{
  -[CPLLibraryManager activateScopeWithIdentifier:completionHandler:](self, "activateScopeWithIdentifier:completionHandler:", self->_mainScopeIdentifier, a3);
}

- (void)disableMainScopeWithCompletionHandler:(id)a3
{
  -[CPLLibraryManager deactivateScopeWithIdentifier:completionHandler:](self, "deactivateScopeWithIdentifier:completionHandler:", self->_mainScopeIdentifier, a3);
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)_configurationDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CPLLibraryManager__configurationDidChange__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CPLConfiguration)configuration
{
  NSObject *initLock;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[16];

  if (!self->_clientLibraryBaseURL)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Can't access configuration with client library base URL", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 498, CFSTR("Can't access configuration with client library base URL"));

    abort();
  }
  initLock = self->_initLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CPLLibraryManager_configuration__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(initLock, block);
  return self->_configuration;
}

- (void)_statusDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CPLLibraryManager__statusDidChange__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CPLStatus)syncStatus
{
  NSObject *initLock;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[16];

  if (!self->_clientLibraryBaseURL)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Can't access configuration with client library base URL", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 529, CFSTR("Can't access configuration with client library base URL"));

    abort();
  }
  initLock = self->_initLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CPLLibraryManager_syncStatus__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(initLock, block);
  return self->_syncStatus;
}

- (id)currentSession
{
  NSObject *sessionLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10661;
  v10 = __Block_byref_object_dispose__10662;
  v11 = 0;
  sessionLock = self->_sessionLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CPLLibraryManager_currentSession__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)discardCurrentSession
{
  NSObject *sessionLock;
  _QWORD block[5];

  sessionLock = self->_sessionLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CPLLibraryManager_discardCurrentSession__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(sessionLock, block);
}

- (void)_setCurrentSession:(id)a3
{
  id v5;
  NSObject *sessionLock;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  if (v5)
    +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.client.session"), CFSTR("push/pull session is active"), 1);
  sessionLock = self->_sessionLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CPLLibraryManager__setCurrentSession___block_invoke;
  block[3] = &unk_1E60D6E20;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(sessionLock, block);

}

- (void)_setLibraryVersion:(id)a3
{
  NSString *v4;
  NSString *libraryVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  libraryVersion = self->_libraryVersion;
  self->_libraryVersion = v4;

}

- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager beginPushChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:](self, "beginPushChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:", a3, 0, a4);
}

- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager beginPullChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:](self, "beginPullChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:", a3, 0, a4);
}

- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  _QWORD block[4];
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke;
  v20[3] = &unk_1E60D72E0;
  v23 = v11;
  v24 = a2;
  v20[4] = self;
  v21 = v9;
  v22 = v10;
  v14 = v20;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v26 = v14;
  v15 = queue;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);

}

- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  _QWORD block[4];
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke;
  v20[3] = &unk_1E60D72E0;
  v23 = v11;
  v24 = a2;
  v20[4] = self;
  v21 = v9;
  v22 = v10;
  v14 = v20;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v26 = v14;
  v15 = queue;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  CPLResourceTransferTaskOptions *v16;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = -[CPLResourceTransferTaskOptions initWithHighPriority:]([CPLResourceTransferTaskOptions alloc], "initWithHighPriority:", v8);
  -[CPLLibraryManager beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:](self, "beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:", v15, v14, v16, v13, v12);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 intent:(unint64_t)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  +[CPLResourceTransferTaskOptions optionsForLegacyIntent:](CPLResourceTransferTaskOptions, "optionsForLegacyIntent:", a5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[CPLLibraryManager beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:](self, "beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:", v15, v14, v16, v13, v12);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  OS_dispatch_queue *queue;
  _QWORD *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  dispatch_block_t v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SEL v37;
  _BYTE buf[24];
  void *v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v39 = v20;
      _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Running %@(%@) at %@ QOS", buf, 0x20u);

    }
  }
  v21 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke;
  v31[3] = &unk_1E60DC9E8;
  v36 = v17;
  v37 = a2;
  v31[4] = self;
  v32 = v13;
  v33 = v14;
  v34 = v15;
  v35 = v16;
  v23 = v31;
  *(_QWORD *)buf = v21;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v39 = &unk_1E60D71F8;
  v40 = v23;
  v24 = queue;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v28 = v13;
  v29 = v17;
  v30 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v24, v30);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 completionHandler:(id)a6
{
  -[CPLLibraryManager beginDownloadForResource:clientBundleID:highPriority:proposedTaskIdentifier:completionHandler:](self, "beginDownloadForResource:clientBundleID:highPriority:proposedTaskIdentifier:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)beginDownloadForResource:(id)a3 highPriority:(BOOL)a4 completionHandler:(id)a5
{
  -[CPLLibraryManager beginDownloadForResource:clientBundleID:highPriority:proposedTaskIdentifier:completionHandler:](self, "beginDownloadForResource:clientBundleID:highPriority:proposedTaskIdentifier:completionHandler:", a3, 0, a4, 0, a5);
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 completionHandler:(id)a6
{
  -[CPLLibraryManager getStreamingURLForResource:intent:hints:clientBundleID:completionHandler:](self, "getStreamingURLForResource:intent:hints:clientBundleID:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 clientBundleID:(id)a6 completionHandler:(id)a7
{
  __int128 v7;
  _OWORD v8[3];

  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v8[0] = *MEMORY[0x1E0CA2E40];
  v8[1] = v7;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  -[CPLLibraryManager getStreamingURLForResource:intent:hints:timeRange:clientBundleID:completionHandler:](self, "getStreamingURLForResource:intent:hints:timeRange:clientBundleID:completionHandler:", a3, a4, a5, v8, a6, a7);
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14;
  __int128 v15;
  id v16;
  _OWORD v17[3];
  _QWORD v18[4];
  id v19;

  v14 = a8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__CPLLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v18[3] = &unk_1E60DA0D0;
  v19 = v14;
  v15 = *(_OWORD *)&a6->var0.var3;
  v17[0] = *(_OWORD *)&a6->var0.var0;
  v17[1] = v15;
  v17[2] = *(_OWORD *)&a6->var1.var1;
  v16 = v14;
  -[CPLLibraryManager getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:](self, "getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:", a3, a4, a5, v17, a7, v18);

}

- (void)getStreamingURLOrMediaMakerDataForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  OS_dispatch_queue *queue;
  __int128 v25;
  _QWORD *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  dispatch_block_t v33;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  SEL v41;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE buf[24];
  void *v47;
  id v48;
  SEL v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  v21 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v47 = &__block_descriptor_48_e5_v8__0lu32l8;
  v48 = v21;
  v49 = a2;
  objc_msgSend(v22, "setCancellationHandler:", buf);
  queue = self->_queue;
  v35[0] = v23;
  v35[1] = 3221225472;
  v35[2] = __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v35[3] = &unk_1E60DA0F8;
  v35[4] = self;
  v36 = v22;
  v41 = a2;
  v42 = a4;
  v37 = v14;
  v38 = v15;
  v25 = *(_OWORD *)&a6->var0.var3;
  v43 = *(_OWORD *)&a6->var0.var0;
  v44 = v25;
  v45 = *(_OWORD *)&a6->var1.var1;
  v39 = v16;
  v40 = v17;
  v26 = v35;
  *(_QWORD *)buf = v23;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v47 = &unk_1E60D71F8;
  v48 = v26;
  v27 = queue;
  v28 = v16;
  v29 = v15;
  v30 = v14;
  v31 = v22;
  v32 = v17;
  v33 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v27, v33);

}

- (void)publishResource:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager getStreamingURLForResource:intent:hints:clientBundleID:completionHandler:](self, "getStreamingURLForResource:intent:hints:clientBundleID:completionHandler:", a3, 0, 0, 0, a4);
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  SEL v26;
  unint64_t v27;
  unint64_t v28;
  _BYTE buf[24];
  void *v30;
  id v31;
  SEL v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS)
    v10 = _CPLSilentLogging == 0;
  else
    v10 = 0;
  if (v10)
  {
    __CPLQOSOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  v14 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v30 = &__block_descriptor_48_e5_v8__0lu32l8;
  v31 = v14;
  v32 = a2;
  objc_msgSend(v15, "setCancellationHandler:", buf);
  queue = self->_queue;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke;
  v23[3] = &unk_1E60DA120;
  v23[4] = self;
  v24 = v15;
  v25 = v9;
  v26 = a2;
  v27 = a3;
  v28 = a4;
  v18 = v23;
  *(_QWORD *)buf = v16;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v30 = &unk_1E60D71F8;
  v31 = v18;
  v19 = queue;
  v20 = v15;
  v21 = v9;
  v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v19, v22);

}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  _QWORD block[4];
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke;
  v20[3] = &unk_1E60D72E0;
  v23 = v11;
  v24 = a2;
  v20[4] = self;
  v21 = v9;
  v22 = v10;
  v14 = v20;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v26 = v14;
  v15 = queue;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);

}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  OS_dispatch_queue *queue;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  SEL v27;
  _BYTE buf[24];
  void *v29;
  id v30;
  SEL v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Creating %@ in the cloud", buf, 0xCu);
    }

  }
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v29 = &__block_descriptor_48_e5_v8__0lu32l8;
  v30 = v13;
  v31 = a2;
  objc_msgSend(v14, "setCancellationHandler:", buf);
  queue = self->_queue;
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __51__CPLLibraryManager_createScope_completionHandler___block_invoke;
  v23[3] = &unk_1E60D6E98;
  v23[4] = self;
  v24 = v7;
  v25 = v14;
  v26 = v8;
  v27 = a2;
  v17 = v23;
  *(_QWORD *)buf = v15;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v29 = &unk_1E60D71F8;
  v30 = v17;
  v18 = queue;
  v19 = v14;
  v20 = v8;
  v21 = v7;
  v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v22);

}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  dispatch_block_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  SEL v28;
  _BYTE buf[24];
  void *v30;
  id v31;
  SEL v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "share");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Updating share for %@ to %@", buf, 0x16u);

    }
  }
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  v14 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v30 = &__block_descriptor_48_e5_v8__0lu32l8;
  v31 = v14;
  v32 = a2;
  objc_msgSend(v15, "setCancellationHandler:", buf);
  queue = self->_queue;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke;
  v24[3] = &unk_1E60D6E98;
  v24[4] = self;
  v25 = v7;
  v26 = v15;
  v27 = v8;
  v28 = a2;
  v18 = v24;
  *(_QWORD *)buf = v16;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v30 = &unk_1E60D71F8;
  v31 = v18;
  v19 = queue;
  v20 = v15;
  v21 = v8;
  v22 = v7;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v19, v23);

}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *queue;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  dispatch_block_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  SEL v29;
  BOOL v30;
  _BYTE buf[24];
  void *v32;
  id v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = &stru_1E60DF6B8;
      if (v6)
        v12 = CFSTR(" (forced)");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Asking to delete scope %{public}@%@", buf, 0x16u);
    }

  }
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v18 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke;
  v25[3] = &unk_1E60DA170;
  v25[4] = self;
  v26 = v9;
  v28 = v10;
  v29 = a2;
  v27 = v16;
  v30 = v6;
  v19 = v25;
  *(_QWORD *)buf = v18;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v32 = &unk_1E60D71F8;
  v33 = v19;
  v20 = queue;
  v21 = v16;
  v22 = v10;
  v23 = v9;
  v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v20, v24);

}

- (void)deleteScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager deleteScopeWithIdentifier:forced:completionHandler:](self, "deleteScopeWithIdentifier:forced:completionHandler:", a3, 0, a4);
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  OS_dispatch_queue *queue;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  SEL v27;
  _BYTE buf[24];
  void *v29;
  id v30;
  SEL v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Asking to refresh scope %{public}@", buf, 0xCu);
    }

  }
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v29 = &__block_descriptor_48_e5_v8__0lu32l8;
  v30 = v13;
  v31 = a2;
  objc_msgSend(v14, "setCancellationHandler:", buf);
  queue = self->_queue;
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_1E60D6E98;
  v23[4] = self;
  v24 = v7;
  v25 = v14;
  v26 = v8;
  v27 = a2;
  v17 = v23;
  *(_QWORD *)buf = v15;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v29 = &unk_1E60D71F8;
  v30 = v17;
  v18 = queue;
  v19 = v14;
  v20 = v8;
  v21 = v7;
  v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v22);

}

- (void)createOwnedLibraryShareScopeWithShare:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = +[CPLScopeChange newScopeChangeWithAutomaticScopeIdentifierForScopeType:](CPLLibraryShareScopeChange, "newScopeChangeWithAutomaticScopeIdentifierForScopeType:", 4);
  objc_msgSend(v11, "setShare:", v10);

  objc_msgSend(v11, "setTitle:", v9);
  -[CPLLibraryManager createScope:completionHandler:](self, "createScope:completionHandler:", v11, v8);

}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  _QWORD *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  dispatch_block_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  SEL v30;
  int64_t v31;
  int64_t v32;
  _BYTE buf[24];
  void *v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS)
    v13 = _CPLSilentLogging == 0;
  else
    v13 = 0;
  if (v13)
  {
    __CPLQOSOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v26[3] = &unk_1E60DA1C0;
  v26[4] = self;
  v27 = v11;
  v28 = v17;
  v29 = v12;
  v30 = a2;
  v31 = a4;
  v32 = a5;
  v20 = v26;
  *(_QWORD *)buf = v18;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v34 = &unk_1E60D71F8;
  v35 = v20;
  v21 = queue;
  v22 = v17;
  v23 = v12;
  v24 = v11;
  v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v21, v25);

}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  OS_dispatch_queue *queue;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  dispatch_block_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  SEL v34;
  int64_t v35;
  int64_t v36;
  _BYTE buf[24];
  void *v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v21 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v29[3] = &unk_1E60DA210;
  v29[4] = self;
  v30 = v14;
  v33 = v15;
  v34 = a2;
  v31 = v19;
  v32 = v13;
  v35 = a5;
  v36 = a6;
  v22 = v29;
  *(_QWORD *)buf = v21;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v38 = &unk_1E60D71F8;
  v39 = v22;
  v23 = queue;
  v24 = v13;
  v25 = v19;
  v26 = v15;
  v27 = v14;
  v28 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v23, v28);

}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  SEL v22;
  _BYTE buf[24];
  void *v24;
  id v25;
  SEL v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS)
    v6 = _CPLSilentLogging == 0;
  else
    v6 = 0;
  if (v6)
  {
    __CPLQOSOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v24 = &__block_descriptor_48_e5_v8__0lu32l8;
  v25 = v10;
  v26 = a2;
  objc_msgSend(v11, "setCancellationHandler:", buf);
  queue = self->_queue;
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E60D6C58;
  v19[4] = self;
  v20 = v11;
  v21 = v5;
  v22 = a2;
  v14 = v19;
  *(_QWORD *)buf = v12;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v24 = &unk_1E60D71F8;
  v25 = v14;
  v15 = queue;
  v16 = v11;
  v17 = v5;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v15, v18);

}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;
  unint64_t v22;
  _QWORD block[4];
  id v24;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__CPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  v18[3] = &unk_1E60D6B90;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v21 = a2;
  v22 = a4;
  v13 = v18;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v10;
  v16 = v9;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  _QWORD *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  SEL v25;
  __int128 buf;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  SEL v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "cpl_redactedShareURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Fetching share info at %@", (uint8_t *)&buf, 0xCu);

    }
  }
  v11 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v27 = ___CPLProgressForAsyncCall_block_invoke_0;
  v28 = &__block_descriptor_48_e5_v8__0lu32l8;
  v29 = v11;
  v30 = a2;
  objc_msgSend(v12, "setCancellationHandler:", &buf);
  queue = self->_queue;
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke;
  v21[3] = &unk_1E60D72E0;
  v21[4] = self;
  v22 = v12;
  v24 = v8;
  v25 = a2;
  v23 = v7;
  v15 = v21;
  *(_QWORD *)&buf = v13;
  *((_QWORD *)&buf + 1) = 3221225472;
  v27 = __cpl_dispatch_async_block_invoke_10471;
  v28 = &unk_1E60D71F8;
  v29 = v15;
  v16 = queue;
  v17 = v7;
  v18 = v12;
  v19 = v8;
  v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v16, v20);

}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *queue;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  dispatch_block_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  SEL v28;
  _BYTE buf[24];
  void *v30;
  id v31;
  SEL v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "share");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Accepting %@ from %@", buf, 0x16u);

    }
  }
  v11 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v30 = &__block_descriptor_48_e5_v8__0lu32l8;
  v31 = v11;
  v32 = a2;
  objc_msgSend(v12, "setCancellationHandler:", buf);
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke;
  v24[3] = &unk_1E60D72E0;
  v24[4] = self;
  v25 = v12;
  v27 = v8;
  v28 = a2;
  v26 = v7;
  v18 = v24;
  *(_QWORD *)buf = v13;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v30 = &unk_1E60D71F8;
  v31 = v18;
  v19 = queue;
  v20 = v7;
  v21 = v12;
  v22 = v8;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v19, v23);

}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *queue;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  SEL v22;
  _BYTE buf[24];
  void *v24;
  id v25;
  SEL v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Looking for shared library scope", buf, 2u);
    }

  }
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v24 = &__block_descriptor_48_e5_v8__0lu32l8;
  v25 = v7;
  v26 = a2;
  objc_msgSend(v8, "setCancellationHandler:", buf);
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E60D6C58;
  v19[4] = self;
  v20 = v8;
  v21 = v5;
  v22 = a2;
  v14 = v19;
  *(_QWORD *)buf = v9;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v24 = &unk_1E60D71F8;
  v25 = v14;
  v15 = queue;
  v16 = v8;
  v17 = v5;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v15, v18);

}

- (void)publishMomentShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(a3, "translateToScopeChangeWithScopeType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CPLLibraryManager_publishMomentShare_completionHandler___block_invoke;
  v9[3] = &unk_1E60DA238;
  v10 = v6;
  v8 = v6;
  -[CPLLibraryManager createScope:completionHandler:](self, "createScope:completionHandler:", v7, v9);

}

- (void)fetchMomentShareFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CPLLibraryManager_fetchMomentShareFromShareURL_completionHandler___block_invoke;
  v8[3] = &unk_1E60DA238;
  v9 = v6;
  v7 = v6;
  -[CPLLibraryManager fetchSharedScopeFromShareURL:completionHandler:](self, "fetchSharedScopeFromShareURL:completionHandler:", a3, v8);

}

- (void)acceptMomentShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(a3, "translateToScopeChangeWithScopeType:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CPLLibraryManager_acceptMomentShare_completionHandler___block_invoke;
  v9[3] = &unk_1E60D7268;
  v10 = v6;
  v8 = v6;
  -[CPLLibraryManager acceptSharedScope:completionHandler:](self, "acceptSharedScope:completionHandler:", v7, v9);

}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *queue;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  dispatch_block_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  SEL v26;
  _BYTE buf[24];
  void *v28;
  id v29;
  SEL v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v28 = &__block_descriptor_48_e5_v8__0lu32l8;
  v29 = v9;
  v30 = a2;
  objc_msgSend(v10, "setCancellationHandler:", buf);
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    __CPLQOSOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke;
  v22[3] = &unk_1E60D72E0;
  v22[4] = self;
  v23 = v10;
  v25 = v8;
  v26 = a2;
  v24 = v7;
  v16 = v22;
  *(_QWORD *)buf = v11;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v28 = &unk_1E60D71F8;
  v29 = v16;
  v17 = queue;
  v18 = v7;
  v19 = v10;
  v20 = v8;
  v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v17, v21);

}

- (void)queryUserIdentitiesWithParticipants:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  +[CPLMomentShareParticipant shareParticipantsFromMomentShareParticipants:](CPLMomentShareParticipant, "shareParticipantsFromMomentShareParticipants:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CPLLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke;
  v9[3] = &unk_1E60DA260;
  v10 = v6;
  v8 = v6;
  -[CPLLibraryManager queryUserDetailsForShareParticipants:completionHandler:](self, "queryUserDetailsForShareParticipants:completionHandler:", v7, v9);

}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  SEL v23;
  _BYTE buf[24];
  void *v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS)
    v9 = _CPLSilentLogging == 0;
  else
    v9 = 0;
  if (v9)
  {
    __CPLQOSOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke;
  v20[3] = &unk_1E60D6C58;
  v22 = v8;
  v23 = a2;
  v20[4] = self;
  v21 = v7;
  v15 = v20;
  *(_QWORD *)buf = v14;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v25 = &unk_1E60D71F8;
  v26 = v15;
  v16 = queue;
  v17 = v7;
  v18 = v8;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v16, v19);

}

- (void)_getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;
  BOOL v22;
  _QWORD block[4];
  id v24;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__CPLLibraryManager__getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke;
  v18[3] = &unk_1E60D70F0;
  v22 = a4;
  v20 = v10;
  v21 = a2;
  v18[4] = self;
  v19 = v9;
  v13 = v18;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v9;
  v16 = v10;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

- (id)_mappedUnscopedIdentifiersFromScopedIdentifiers:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CPLLibraryManager__mappedUnscopedIdentifiersFromScopedIdentifiers___block_invoke;
  v8[3] = &unk_1E60DA2B0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (void)getCloudScopedIdentifiersForLocalScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager _getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:](self, "_getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:", a3, 1, a4);
}

- (void)getLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager _getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:](self, "_getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:", a3, 0, a4);
}

- (void)_getMappedIdentifiersForIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  v8 = a5;
  +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromArrayOfUnknownIdentifiers:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__CPLLibraryManager__getMappedIdentifiersForIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E60D7140;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[CPLLibraryManager _getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:](self, "_getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:", v9, v5, v11);

}

- (void)getCloudIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager _getMappedIdentifiersForIdentifiers:inAreLocalIdentifiers:completionHandler:](self, "_getMappedIdentifiersForIdentifiers:inAreLocalIdentifiers:completionHandler:", a3, 1, a4);
}

- (void)getLocalIdentifiersForCloudIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager _getMappedIdentifiersForIdentifiers:inAreLocalIdentifiers:completionHandler:](self, "_getMappedIdentifiersForIdentifiers:inAreLocalIdentifiers:completionHandler:", a3, 0, a4);
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__CPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

- (BOOL)_setStatus:(unint64_t)a3 andError:(id)a4
{
  id v7;
  unint64_t status;
  BOOL v9;
  NSError *v10;
  id *p_statusError;
  NSError *statusError;

  v7 = a4;
  status = self->_status;
  v9 = status != a3;
  if (status != a3)
    self->_status = a3;
  statusError = self->_statusError;
  p_statusError = (id *)&self->_statusError;
  v10 = statusError;
  if (statusError)
  {
    if (!v7)
    {
      *p_statusError = 0;

      goto LABEL_10;
    }
    if ((-[NSError isEqual:](v10, "isEqual:", v7) & 1) != 0)
      goto LABEL_11;
LABEL_8:
    objc_storeStrong(p_statusError, a4);
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  if (v7)
    goto LABEL_8;
LABEL_11:

  return v9;
}

- (void)_setSizeOfResourcesToUpload:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7
{
  NSObject *v8;
  unint64_t sizeOfResourcesToUpload;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_sizeOfResourcesToUpload == a3
    && self->_sizeOfOriginalResourcesToUpload == a4
    && self->_numberOfImagesToUpload == a5
    && self->_numberOfVideosToUpload == a6
    && self->_numberOfOtherItemsToUpload == a7)
  {
    if (self->_sizeOfResourcesToUploadIsSet)
      return;
    goto LABEL_15;
  }
  self->_sizeOfResourcesToUpload = a3;
  self->_sizeOfOriginalResourcesToUpload = a4;
  self->_numberOfImagesToUpload = a5;
  self->_numberOfVideosToUpload = a6;
  self->_numberOfOtherItemsToUpload = a7;
  if (!self->_sizeOfResourcesToUploadIsSet)
  {
LABEL_15:
    self->_sizeOfResourcesToUploadIsSet = 1;
    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sizeOfResourcesToUpload = self->_sizeOfResourcesToUpload;
      v13 = 134217984;
      v14 = sizeOfResourcesToUpload;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Size of resources to upload changed to %llu bytes", (uint8_t *)&v13, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
    objc_msgSend(v12, "sizeOfResourcesToUploadDidChangeForLibraryManager:", self);

  }
}

- (void)resetStatus
{
  id v2;

  -[CPLLibraryManager platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetStatus");

}

- (void)startSyncSession
{
  void *v3;
  char v4;
  uint64_t v5;
  OS_dispatch_queue *queue;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  NSObject *v10;
  _QWORD v11[5];
  __int128 block;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CPLLibraryManager platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__CPLLibraryManager_startSyncSession__block_invoke;
    v11[3] = &unk_1E60D65B8;
    v11[4] = self;
    v7 = v11;
    *(_QWORD *)&block = v5;
    *((_QWORD *)&block + 1) = 3221225472;
    v13 = __cpl_dispatch_async_block_invoke_10471;
    v14 = &unk_1E60D71F8;
    v15 = v7;
    v8 = queue;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v8, v9);

  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 138412290;
      *(_QWORD *)((char *)&block + 4) = self;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "%@ does not support forcing a sync session", (uint8_t *)&block, 0xCu);
    }

  }
}

- (id)addSubscriberUsingPublishingHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  if (self->_libraryIdentifier)
  {
    -[CPLLibraryManager libraryIdentifier](self, "libraryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.cpl."), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForCategory:usingPublishingHandler:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to subscribe to published progress for a library with no identifier", v10, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (void)noteClientReceivedNotificationOfServerChanges
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__CPLLibraryManager_noteClientReceivedNotificationOfServerChanges__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteClientIsInForeground
{
  -[CPLLibraryManager noteClientIsInForegroundQuietly:](self, "noteClientIsInForegroundQuietly:", 0);
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD block[4];
  id v11;

  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CPLLibraryManager_noteClientIsInForegroundQuietly___block_invoke;
  v8[3] = &unk_1E60DC878;
  v8[4] = self;
  v9 = a3;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)noteClientIsInBackground
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CPLLibraryManager_noteClientIsInBackground__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__CPLLibraryManager_disableSynchronizationWithReason___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__CPLLibraryManager_enableSynchronizationWithReason___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)setShouldOverrideSystemBudgetsForSyncSession:(BOOL)a3
{
  -[CPLLibraryManager setShouldOverride:forSystemBudgets:](self, "setShouldOverride:forSystemBudgets:", a3, 18487);
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  OS_dispatch_queue *queue;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD v9[6];
  BOOL v10;
  _QWORD block[4];
  id v12;

  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CPLLibraryManager_setShouldOverride_forSystemBudgets___block_invoke;
  v9[3] = &unk_1E60D6DD0;
  v10 = a3;
  v9[4] = self;
  v9[5] = a4;
  v6 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v12 = v6;
  v7 = queue;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

}

- (void)noteClientIsBeginningSignificantWork
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CPLLibraryManager_noteClientIsBeginningSignificantWork__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteClientIsEndingSignificantWork
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CPLLibraryManager_noteClientIsEndingSignificantWork__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6780;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__CPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

- (void)getStatusForRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromArrayOfUnknownIdentifiers:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CPLLibraryManager_getStatusForRecordsWithIdentifiers_completionHandler___block_invoke;
  v9[3] = &unk_1E60DA300;
  v10 = v6;
  v8 = v6;
  -[CPLLibraryManager getStatusForRecordsWithScopedIdentifiers:completionHandler:](self, "getStatusForRecordsWithScopedIdentifiers:completionHandler:", v7, v9);

}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__CPLLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6780;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__CPLLibraryManager_acknowledgeChangedStatuses___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  BOOL v17;
  _QWORD block[4];
  id v19;

  v7 = a3;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__CPLLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke;
  v14[3] = &unk_1E60D6E70;
  v15 = v7;
  v16 = a2;
  v14[4] = self;
  v17 = a4;
  v10 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v13);

}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__CPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

- (void)disableMingling
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CPLLibraryManager_disableMingling__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)enableMingling
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CPLLibraryManager_enableMingling__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)takeStatisticsSnapshotSinceDate:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  OS_dispatch_queue *queue;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__CPLLibraryManager_takeStatisticsSnapshotSinceDate_completionHandler___block_invoke;
  v12[3] = &unk_1E60D71F8;
  v13 = v5;
  v8 = v12;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v15 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__CPLLibraryManager_testKey_value_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6CD0;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v13 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);

}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__CPLLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)markLibraryManagerAsInvalid
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CPLLibraryManager platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "markLibraryManagerAsInvalid");
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = (id)objc_opt_class();
      v11 = 2048;
      v12 = v3;
      v6 = v10;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to call %@ while <%@ %p> does not support it", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  id v20;
  dispatch_block_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  BOOL v25;
  _BYTE buf[24];
  void *v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS)
    v11 = _CPLSilentLogging == 0;
  else
    v11 = 0;
  if (v11)
  {
    __CPLQOSOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__CPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v22[3] = &unk_1E60D6AA0;
  v23 = v9;
  v24 = v10;
  v22[4] = self;
  v25 = a4;
  v17 = v22;
  *(_QWORD *)buf = v16;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v27 = &unk_1E60D71F8;
  v28 = v17;
  v18 = queue;
  v19 = v9;
  v20 = v10;
  v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v21);

}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  id v20;
  dispatch_block_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  BOOL v25;
  _BYTE buf[24];
  void *v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (__CPLShouldLogQOS_onceToken != -1)
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_30);
  if (__CPLShouldLogQOS_debugQOS)
    v11 = _CPLSilentLogging == 0;
  else
    v11 = 0;
  if (v11)
  {
    __CPLQOSOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CPLCurrentQOS();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__CPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke;
  v22[3] = &unk_1E60D6AA0;
  v23 = v9;
  v24 = v10;
  v22[4] = self;
  v25 = a4;
  v17 = v22;
  *(_QWORD *)buf = v16;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_10471;
  v27 = &unk_1E60D71F8;
  v28 = v17;
  v18 = queue;
  v19 = v9;
  v20 = v10;
  v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v21);

}

- (void)deleteResourcesIfSafe:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__CPLLibraryManager_deleteResourcesIfSafe_completionHandler___block_invoke;
  v8[3] = &unk_1E60DA328;
  v9 = v6;
  v7 = v6;
  -[CPLLibraryManager deleteResources:checkServerIfNecessary:completionHandler:](self, "deleteResources:checkServerIfNecessary:completionHandler:", a3, 0, v8);

}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__CPLLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CPLLibraryManager_compactFileCacheWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)resetCacheWithOption:(unint64_t)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager resetCacheWithOption:reason:completionHandler:](self, "resetCacheWithOption:reason:completionHandler:", a3, 0, a4);
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  _QWORD block[4];
  id v24;

  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    if (a3 > 3)
    {
      v8 = 0;
    }
    else
    {
      v10 = off_1E60DA3F8[a3];
      +[CPLResetTracker currentTracker](CPLResetTracker, "currentTracker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "likelyResetReasonWithImmediateReason:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__CPLLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke;
  v19[3] = &unk_1E60DA350;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = a3;
  v14 = v19;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v24 = v14;
  v15 = queue;
  v16 = v9;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v18);

}

- (void)addInfoToLog:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLLibraryManager platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInfoToLog:", v4);

}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  SEL v23;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___CPLProgressForAsyncCall_block_invoke_0;
  v21 = &__block_descriptor_48_e5_v8__0lu32l8;
  v22 = v6;
  v23 = a2;
  objc_msgSend(v7, "setCancellationHandler:", &block);
  queue = self->_queue;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v7;
  v17 = v5;
  v15[4] = self;
  v10 = v15;
  block = v8;
  v19 = 3221225472;
  v20 = __cpl_dispatch_async_block_invoke_10471;
  v21 = &unk_1E60D71F8;
  v22 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v14);

}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  SEL v23;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___CPLProgressForAsyncCall_block_invoke_0;
  v21 = &__block_descriptor_48_e5_v8__0lu32l8;
  v22 = v6;
  v23 = a2;
  objc_msgSend(v7, "setCancellationHandler:", &block);
  queue = self->_queue;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v7;
  v17 = v5;
  v15[4] = self;
  v10 = v15;
  block = v8;
  v19 = 3221225472;
  v20 = __cpl_dispatch_async_block_invoke_10471;
  v21 = &unk_1E60D71F8;
  v22 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v14);

}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke_0;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke_10471;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *libraryIdentifier;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  libraryIdentifier = self->_libraryIdentifier;
  objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %p %@ %@]"), v4, self, libraryIdentifier, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__CPLLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CPLLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__CPLLibraryManager_provideCloudResource_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__CPLLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E60D6D48;
  v17[4] = self;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CPLLibraryManager_attachComputeStates_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  _QWORD *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  dispatch_block_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;
  uint64_t block;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  SEL v39;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = ___CPLProgressForAsyncCall_block_invoke_0;
  v37 = &__block_descriptor_48_e5_v8__0lu32l8;
  v38 = v16;
  v39 = a2;
  objc_msgSend(v17, "setCancellationHandler:", &block);
  queue = self->_queue;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke;
  v27[3] = &unk_1E60DA378;
  v30 = v14;
  v31 = v15;
  v27[4] = self;
  v28 = v17;
  v29 = v13;
  v32 = a5;
  v33 = a6;
  v20 = v27;
  block = v18;
  v35 = 3221225472;
  v36 = __cpl_dispatch_async_block_invoke_10471;
  v37 = &unk_1E60D71F8;
  v38 = v20;
  v21 = queue;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  v25 = v15;
  v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v21, v26);

}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 onDemand:(BOOL)a5 completionHandler:(id)a6
{
  -[CPLLibraryManager fetchComputeStatesForRecordsWithScopedIdentifiers:validator:shouldDecrypt:onDemand:completionHandler:](self, "fetchComputeStatesForRecordsWithScopedIdentifiers:validator:shouldDecrypt:onDemand:completionHandler:", a3, a4, 1, a5, a6);
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (NSURL)clientLibraryBaseURL
{
  return self->_clientLibraryBaseURL;
}

- (NSURL)cloudLibraryStateStorageURL
{
  return self->_cloudLibraryStateStorageURL;
}

- (NSURL)cloudLibraryResourceStorageURL
{
  return self->_cloudLibraryResourceStorageURL;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (unint64_t)libraryOptions
{
  return self->_libraryOptions;
}

- (NSString)libraryVersion
{
  return self->_libraryVersion;
}

- (unint64_t)estimatedInitialSizeForLocalLibrary
{
  return self->_estimatedInitialSizeForLocalLibrary;
}

- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialSizeForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialAssetCountForLocalLibrary
{
  return self->_estimatedInitialAssetCountForLocalLibrary;
}

- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialAssetCountForLocalLibrary = a3;
}

- (unint64_t)sizeOfResourcesToUpload
{
  return self->_sizeOfResourcesToUpload;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  return self->_sizeOfOriginalResourcesToUpload;
}

- (unint64_t)numberOfImagesToUpload
{
  return self->_numberOfImagesToUpload;
}

- (unint64_t)numberOfVideosToUpload
{
  return self->_numberOfVideosToUpload;
}

- (unint64_t)numberOfOtherItemsToUpload
{
  return self->_numberOfOtherItemsToUpload;
}

- (CPLLibraryManagerDelegate)delegate
{
  return (CPLLibraryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CPLResourceProgressDelegate)resourceProgressDelegate
{
  return (CPLResourceProgressDelegate *)objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
}

- (void)setResourceProgressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resourceProgressDelegate, a3);
}

- (CPLLibraryManagerForceSyncDelegate)forceSyncDelegate
{
  return (CPLLibraryManagerForceSyncDelegate *)objc_loadWeakRetained((id *)&self->_forceSyncDelegate);
}

- (void)setForceSyncDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forceSyncDelegate, a3);
}

- (CPLLibraryManagerOwner)owner
{
  return (CPLLibraryManagerOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSError)statusError
{
  return self->_statusError;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)userOverride
{
  return self->_userOverride;
}

- (void)setUserOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)effectiveClientBundleIdentifier
{
  return self->_effectiveClientBundleIdentifier;
}

- (void)setEffectiveClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (CPLRecordComputeStateDelegate)recordComputeStateDelegate
{
  return (CPLRecordComputeStateDelegate *)objc_loadWeakRetained((id *)&self->_recordComputeStateDelegate);
}

- (void)setRecordComputeStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recordComputeStateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordComputeStateDelegate);
  objc_storeStrong((id *)&self->_effectiveClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userOverride, 0);
  objc_storeStrong((id *)&self->_statusError, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_destroyWeak((id *)&self->_forceSyncDelegate);
  objc_destroyWeak((id *)&self->_resourceProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_libraryVersion, 0);
  objc_storeStrong((id *)&self->_mainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudLibraryResourceStorageURL, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateStorageURL, 0);
  objc_storeStrong((id *)&self->_clientLibraryBaseURL, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_weakSelf, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_initLock, 0);
  objc_storeStrong((id *)&self->_sessionLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
}

void __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  __int16 v11;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_357;
    v6[3] = &unk_1E60D7168;
    v2 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v11 = *(_WORD *)(a1 + 72);
    v10 = *(id *)(a1 + 64);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v2, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v6);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Trying to fetch compute states while the library is not open", buf, 2u);
      }

    }
    v4 = *(_QWORD *)(a1 + 64);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to fetch compute states while the library is not open"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_357(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v6 = *(unsigned __int8 *)(a1 + 73);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2;
  v7[3] = &unk_1E60D7140;
  v9 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "fetchComputeStatesForRecordsWithScopedIdentifiers:validator:shouldDecrypt:onDemand:completionHandler:", v3, v4, v5, v6, v7);

}

uint64_t __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __59__CPLLibraryManager_attachComputeStates_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachComputeStates:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __88__CPLLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addDropDerivativesRecipe:writeToUserDefaults:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __60__CPLLibraryManager_provideCloudResource_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provideCloudResource:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __77__CPLLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provideRecordWithCloudScopeIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __80__CPLLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provideScopeChangeForScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  void (**v4)(id, void *);
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (objc_msgSend(a1[4], "state") == 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_352;
    v6[3] = &unk_1E60D6AF0;
    v2 = a1[5];
    v6[4] = a1[4];
    v7 = a1[6];
    v9 = a1[7];
    v8 = a1[5];
    objc_msgSend(v2, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v6);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Trying to force client to pull all changes while the library is not open", buf, 2u);
      }

    }
    v4 = (void (**)(id, void *))a1[7];
    if (v4)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to force client to pull all changes while the library is not open"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
  }
}

void __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_352(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60D64F0;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "requestClientToPullAllChangesInScopeIdentifier:completionHandler:", v3, v4);

}

uint64_t __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_349;
    v6[3] = &unk_1E60D6708;
    v2 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v2, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v6);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Trying to force client to push all changes while the library is not open", buf, 2u);
      }

    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to force client to push all changes while the library is not open"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    }
  }
}

void __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_349(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestClientToPushAllChangesWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  void (**v4)(id, void *);
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint8_t buf[16];

  if (objc_msgSend(a1[4], "state") == 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke_346;
    v6[3] = &unk_1E60D6898;
    v2 = a1[5];
    v6[4] = a1[4];
    v8 = a1[6];
    v7 = a1[5];
    objc_msgSend(v2, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v6);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Trying to force a backup while the library is not open", buf, 2u);
      }

    }
    v4 = (void (**)(id, void *))a1[6];
    if (v4)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to force a backup while the library is not open"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
  }
}

uint64_t __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke_346(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceBackupWithCompletionHandler:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
}

void __67__CPLLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetCacheWithOption:reason:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __59__CPLLibraryManager_compactFileCacheWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactFileCacheWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void __79__CPLLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourcesForItemWithScopedIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __61__CPLLibraryManager_deleteResourcesIfSafe_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);

}

void __91__CPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Trying to check purgeaable resources while the library is not open", buf, 2u);
      }

    }
    v5 = a1 + 40;
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(v5 + 8);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors unsafeResources:withError:realPrune:resourceStorage:](CPLErrors, "unsafeResources:withError:realPrune:resourceStorage:", v3, v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, MEMORY[0x1E0C9AA60], v7);

  }
}

void __78__CPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteResources:checkServerIfNecessary:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Trying to delete resources while the library is not open", buf, 2u);
      }

    }
    v5 = a1 + 40;
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(v5 + 8);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors unsafeResources:withError:realPrune:resourceStorage:](CPLErrors, "unsafeResources:withError:realPrune:resourceStorage:", v3, v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, MEMORY[0x1E0C9AA60], v7);

  }
}

void __81__CPLLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getTargetsForRecordsWithScopedIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __53__CPLLibraryManager_testKey_value_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testKey:value:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __71__CPLLibraryManager_takeStatisticsSnapshotSinceDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__CPLLibraryManager_enableMingling__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enableMingling");

}

void __36__CPLLibraryManager_disableMingling__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disableMingling");

}

void __82__CPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v8, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getScopeStatusCountsForScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to call %@ while the library is not open", (uint8_t *)&v8, 0xCu);

      }
    }
    v7 = *(_QWORD *)(a1 + 48);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to get status counts while library is not open"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v4);
  }

}

void __77__CPLLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412290;
        v7 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v6, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject addStatusChangesForRecordsWithScopedIdentifiers:persist:](v4, "addStatusChangesForRecordsWithScopedIdentifiers:persist:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    if (_CPLSilentLogging)
      return;
    __CPLManagerOSLogDomain_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to call %@ while the library is not open", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __48__CPLLibraryManager_acknowledgeChangedStatuses___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 138412290;
        v6 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v5, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject acknowledgeChangedStatuses:](v4, "acknowledgeChangedStatuses:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (_CPLSilentLogging)
      return;
    __CPLManagerOSLogDomain_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to check record statuses while the library is not open", (uint8_t *)&v5, 2u);
    }
  }

}

void __61__CPLLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v7, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getChangedStatusesWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to check record statuses while the library is not open", (uint8_t *)&v7, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 40);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v4);
  }

}

void __74__CPLLibraryManager_getStatusForRecordsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    +[CPLScopedIdentifier unscopedIdentifiersFromDictionaryOfScopedIdentifiers:](CPLScopedIdentifier, "unscopedIdentifiersFromDictionaryOfScopedIdentifiers:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

void __80__CPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v7, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getStatusForRecordsWithScopedIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to check record statuses while the library is not open", (uint8_t *)&v7, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v4);
  }

}

void __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_329;
    v8[3] = &unk_1E60DA2D8;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "checkHasBackgroundDownloadOperationsWithCompletionHandler:", v8);

    v5 = v9;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to check background download operations while the library is not open", buf, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 40);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
  }

}

uint64_t __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_329(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__CPLLibraryManager_noteClientIsEndingSignificantWork__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "noteClientIsEndingSignificantWork");

}

void __57__CPLLibraryManager_noteClientIsBeginningSignificantWork__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "noteClientIsBeginningSignificantWork");

}

void __56__CPLLibraryManager_setShouldOverride_forSystemBudgets___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldOverride:forSystemBudgets:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __59__CPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSystemBudgetsWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void __53__CPLLibraryManager_enableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableSynchronizationWithReason:", *(_QWORD *)(a1 + 40));

}

void __54__CPLLibraryManager_disableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableSynchronizationWithReason:", *(_QWORD *)(a1 + 40));

}

void __45__CPLLibraryManager_noteClientIsInBackground__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "noteClientIsInBackground");

}

void __53__CPLLibraryManager_noteClientIsInForegroundQuietly___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteClientIsInForegroundQuietly:", *(unsigned __int8 *)(a1 + 40));

}

void __66__CPLLibraryManager_noteClientReceivedNotificationOfServerChanges__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "noteClientReceivedNotificationOfServerChanges");

}

void __37__CPLLibraryManager_startSyncSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ forcing a sync session", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startSyncSession");

}

void __94__CPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v7, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to get real cloudIdentifier while the library is not open", (uint8_t *)&v7, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to get real cloudIdentifier while the library is not open"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v4);
  }

}

void __97__CPLLibraryManager__getMappedIdentifiersForIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "_mappedUnscopedIdentifiersFromScopedIdentifiers:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

void __69__CPLLibraryManager__mappedUnscopedIdentifiersFromScopedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

void __109__CPLLibraryManager__getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)v3;
        v5 = "local->cloud";
        if (!*(_BYTE *)(a1 + 64))
          v5 = "cloud->local";
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        v13 = 2080;
        v14 = v5;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ (%s) called", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        if (*(_BYTE *)(a1 + 64))
          v8 = "cloud";
        else
          v8 = "local";
        *(_DWORD *)buf = 136315138;
        v12 = (uint64_t)v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Trying to get %s identifiers while the library is not open", buf, 0xCu);
      }

    }
    v9 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 64))
      v10 = "cloud";
    else
      v10 = "local";
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to get %s identifiers while the library is not open"), v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v6);
  }

}

void __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_310;
    v7[3] = &unk_1E60DA288;
    v5 = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "forceSynchronizingScopeWithIdentifiers:completionHandler:", v5, v7);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to download a resource while the library is not open", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__CPLLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD);
  id v8;

  if (a2)
  {
    v5 = a3;
    +[CPLMomentShareParticipant momentShareParticipantsFromParticipants:](CPLMomentShareParticipant, "momentShareParticipantsFromParticipants:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void (**)(uint64_t, _QWORD))(v6 + 16);
    v8 = a3;
    v7(v6, 0);
  }

}

void __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_307;
    v8[3] = &unk_1E60D6AF0;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to query user identities while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to query user identities while the library is not open"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_307(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60D6C80;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "queryUserDetailsForShareParticipants:completionHandler:", v3, v4);

}

uint64_t __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

uint64_t __57__CPLLibraryManager_acceptMomentShare_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__CPLLibraryManager_fetchMomentShareFromShareURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CPLMomentShare *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    if ((objc_msgSend(v8, "scopeType") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v6 = -[CPLMomentShare initWithScopeChange:]([CPLMomentShare alloc], "initWithScopeChange:", v8);
      (*(void (**)(_QWORD, CPLMomentShare *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, v5);
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
        goto LABEL_10;
      }
      +[CPLErrors notImplementedError](CPLErrors, "notImplementedError");
      v6 = (CPLMomentShare *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, CPLMomentShare *))(v7 + 16))(v7, 0, v6);
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v5);
  }
LABEL_10:

}

void __58__CPLLibraryManager_publishMomentShare_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CPLMomentShare *v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD, CPLMomentShare *);
  id v9;

  v9 = a2;
  if (v9)
  {
    v5 = a3;
    v6 = -[CPLMomentShare initWithScopeChange:]([CPLMomentShare alloc], "initWithScopeChange:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void (**)(uint64_t, _QWORD, CPLMomentShare *))(v7 + 16);
    v6 = a3;
    v8(v7, 0, v6);
  }

}

void __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_303;
    v8[3] = &unk_1E60D6898;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to look for shared library scope while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to look for shared library scope while the library is not open"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_303(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6AC8;
  v5 = a1[6];
  v4 = a1[5];
  objc_msgSend(v2, "fetchExistingSharedLibraryScopeWithCompletionHandler:", v3);

}

uint64_t __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_300;
    v8[3] = &unk_1E60D6AF0;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to accept a share while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to accept a share while the library is not open"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_300(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60D64F0;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "acceptSharedScope:completionHandler:", v3, v4);

}

uint64_t __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_297;
    v8[3] = &unk_1E60D6AF0;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to fetch a share while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to fetch a share while the library is not open"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_297(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DA148;
  v5 = v3;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchSharedScopeFromShareURL:completionHandler:", v5, v4);

}

void __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "cpl_redactedShareURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v13 = 138412546;
    *(_QWORD *)&v13[4] = v8;
    *(_WORD *)&v13[12] = 2112;
    *(_QWORD *)&v13[14] = v5;
    v9 = "Fetched share info at %@: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  if (_CPLSilentLogging)
    goto LABEL_10;
  __CPLManagerOSLogDomain_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "cpl_redactedShareURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v13 = 138412546;
    *(_QWORD *)&v13[4] = v8;
    *(_WORD *)&v13[12] = 2112;
    *(_QWORD *)&v13[14] = v6;
    v9 = "Failed to fetch share info at %@: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v10, v11, v9, v13, 0x16u);

  }
LABEL_9:

LABEL_10:
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14));

}

void __106__CPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v8, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 40);
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to fetch record status for pending shared records in %{public}@ while the library is not open", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to remove participant from shared library while the library is not open"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v4);
LABEL_13:

  }
}

void __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_293;
    v8[3] = &unk_1E60D6898;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to check shared library ramp while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to check shared library ramp while the library is not open"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_293(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6C30;
  v5 = a1[6];
  v4 = a1[5];
  objc_msgSend(v2, "sharedLibraryRampCheckWithCompletionHandler:", v3);

}

uint64_t __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_290;
    v9[3] = &unk_1E60D6BE0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    v13 = *(_OWORD *)(a1 + 80);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v15 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to remove participant from shared library %{public}@ while the library is not open", buf, 0xCu);
      }

    }
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to remove participant from shared library while the library is not open"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }
}

void __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_290(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v7[3] = &unk_1E60DA1E8;
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v4, v8, v5, v6, v7);

}

void __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = a1[4];
        v15 = 138543618;
        v16 = v9;
        v17 = 2112;
        v18 = v7;
        v10 = "Failed to remove participant from shared library %{public}@: %@";
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_1B03C2000, v11, v12, v10, (uint8_t *)&v15, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)a1[4];
      v13 = a1[5];
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      v10 = "Successfully removed participants %{public}@ from shared library %{public}@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:

  }
  (*(void (**)(_QWORD, id, id, uint64_t))(a1[6] + 16))(a1[6], v5, v7, v6);

}

void __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_286;
    v10[3] = &unk_1E60D6B90;
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v13 = *(_OWORD *)(a1 + 72);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v5, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to start exit from shared library %{public}@ while the library is not open", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to exit from shared library while the library is not open"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
  }
}

void __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_286(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60DA198;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v7, v4, v5, v6);

}

void __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v9;
        v17 = 2112;
        v18 = v7;
        v10 = "Failed to exit from shared library %{public}@: %@";
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 22;
LABEL_8:
        _os_log_impl(&dword_1B03C2000, v11, v12, v10, (uint8_t *)&v15, v13);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v14;
      v10 = "Successfully started exit from %{public}@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 12;
      goto LABEL_8;
    }
LABEL_9:

  }
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v7, v6);

}

void __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_252;
    v10[3] = &unk_1E60D6AF0;
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to refresh %{public}@ while the library is not open", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to refresh a scope while the library is not open"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
}

void __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_252(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DA148;
  v5 = v3;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "refreshScopeWithIdentifier:completionHandler:", v5, v4);

}

void __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)&v14[4] = v5;
    v8 = "Successfully updated %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 12;
    goto LABEL_8;
  }
  if (_CPLSilentLogging)
    goto LABEL_10;
  __CPLManagerOSLogDomain_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v6;
    v8 = "Failed to update %@: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v9, v10, v8, v14, v11);
  }
LABEL_9:

LABEL_10:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15));

}

void __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_249;
    v10[3] = &unk_1E60D6D48;
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v13 = *(_BYTE *)(a1 + 72);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v5, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to delete %{public}@ while the library is not open", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to delete a scope while the library is not open"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }
}

void __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_249(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D7330;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "deleteScopeWithIdentifier:forced:completionHandler:", v6, v4, v5);

}

void __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v13 = 138543618;
        v14 = v7;
        v15 = 2112;
        v16 = v5;
        v8 = "Failed to delete %{public}@: %@";
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        v11 = 22;
LABEL_8:
        _os_log_impl(&dword_1B03C2000, v9, v10, v8, (uint8_t *)&v13, v11);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543362;
      v14 = v12;
      v8 = "Successfully deleted %{public}@";
      v9 = v6;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 12;
      goto LABEL_8;
    }
LABEL_9:

  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v3, v4);

}

void __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_241;
    v10[3] = &unk_1E60D6AF0;
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to update %{public}@ while the library is not open", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to create a scope while the library is not open"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
}

void __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_241(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DA148;
  v5 = v3;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateShareForScope:completionHandler:", v5, v4);

}

void __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)&v14[4] = v5;
    v8 = "Successfully updated %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 12;
    goto LABEL_8;
  }
  if (_CPLSilentLogging)
    goto LABEL_10;
  __CPLManagerOSLogDomain_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v6;
    v8 = "Failed to update %@: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v9, v10, v8, v14, v11);
  }
LABEL_9:

LABEL_10:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15));

}

void __51__CPLLibraryManager_createScope_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__CPLLibraryManager_createScope_completionHandler___block_invoke_239;
    v10[3] = &unk_1E60D6AF0;
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to create %@ while the library is not open", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to create a scope while the library is not open"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
}

void __51__CPLLibraryManager_createScope_completionHandler___block_invoke_239(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CPLLibraryManager_createScope_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DA148;
  v5 = v3;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "createScope:completionHandler:", v5, v4);

}

void __51__CPLLibraryManager_createScope_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)&v14[4] = v5;
    v8 = "Successfully created %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 12;
    goto LABEL_8;
  }
  if (_CPLSilentLogging)
    goto LABEL_10;
  __CPLManagerOSLogDomain_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v6;
    v8 = "Failed to create %@: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v9, v10, v8, v14, v11);
  }
LABEL_9:

LABEL_10:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15));

}

void __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_236;
    v9[3] = &unk_1E60DA0A8;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v4, "beginInMemoryDownloadOfResource:clientBundleID:completionHandler:", v5, v6, v9);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Trying to download a resource in-memory while the library is not open", buf, 2u);
      }

    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
}

uint64_t __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_236(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_234;
    v8[3] = &unk_1E60D6A00;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v11 = *(_OWORD *)(a1 + 64);
    v10 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to issue ramping request while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to issue ramping request while the library is not open"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v7);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_234(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D69D8;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "rampingRequestForResourceType:numRequested:completionHandler:", v4, v3, v5);

}

uint64_t __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  }
  return result;
}

void __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_231;
    v11[3] = &unk_1E60D6988;
    v4 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 88);
    v12 = v5;
    v17 = v6;
    v13 = *(id *)(a1 + 56);
    v7 = *(_OWORD *)(a1 + 112);
    v18 = *(_OWORD *)(a1 + 96);
    v19 = v7;
    v20 = *(_OWORD *)(a1 + 128);
    v14 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 72);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v11);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to publish a resource while the library is not open", buf, 2u);
      }

    }
    v9 = *(_QWORD *)(a1 + 72);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to publish a resource while the library is not open"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, 0, 0, v10);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_231(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[3];
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2;
  v9[3] = &unk_1E60D6960;
  v6 = *(_QWORD *)(a1 + 80);
  v11 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 104);
  v8[0] = *(_OWORD *)(a1 + 88);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 120);
  objc_msgSend(v2, "getStreamingURLForResource:intent:hints:timeRange:clientBundleID:completionHandler:", v3, v6, v4, v8, v5, v9);

}

uint64_t __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

uint64_t __104__CPLLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_226;
    v10[3] = &unk_1E60DA0A8;
    v11 = *(id *)(a1 + 72);
    objc_msgSend(v4, "beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:", v5, v6, v7, v8, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Trying to download a resource while the library is not open", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

uint64_t __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  CPLPullChangeSession *v9;
  CPLPullChangeSession *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  CPLPullChangeSession *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!v4)
    {
      v10 = -[CPLChangeSession initWithLibraryManager:]([CPLPullChangeSession alloc], "initWithLibraryManager:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_setCurrentSession:", v10);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_224;
      v14[3] = &unk_1E60DA080;
      v11 = *(_QWORD *)(a1 + 40);
      v14[4] = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(id *)(a1 + 56);
      v15 = v10;
      v16 = v13;
      v9 = v10;
      -[CPLChangeSession beginSessionWithKnownLibraryVersion:resetTracker:completionHandler:](v9, "beginSessionWithKnownLibraryVersion:resetTracker:completionHandler:", v11, v12, v14);

      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to begin a pull session while %@ is already in place", buf, 0xCu);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    v7 = CFSTR("Trying to begin a pull session while an other one is already in place");
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to begin a pull session while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    v7 = CFSTR("Trying to begin a pull session while the library is not open");
  }
  +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", v7);
  v9 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, CPLPullChangeSession *))(v6 + 16))(v6, 0, v9);
LABEL_18:

}

void __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_224(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2;
  v11[3] = &unk_1E60D6AF0;
  v12 = v3;
  v13 = v4;
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v17 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "discardCurrentSession");
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], 0, a1[4]);
  }
  else
  {
    objc_msgSend(v2, "currentSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain_0();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v6 = a1[6];
          v9 = 138412290;
          v10 = v6;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "%@ was discarded before it was returned", (uint8_t *)&v9, 0xCu);
        }

      }
      v7 = a1[7];
      +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }
}

void __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  CPLPushChangeSession *v9;
  CPLPushChangeSession *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  CPLPushChangeSession *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (!v4)
    {
      v10 = -[CPLPushChangeSession initWithLibraryManager:]([CPLPushChangeSession alloc], "initWithLibraryManager:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_setCurrentSession:", v10);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_218;
      v14[3] = &unk_1E60DA080;
      v11 = *(_QWORD *)(a1 + 40);
      v14[4] = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(id *)(a1 + 56);
      v15 = v10;
      v16 = v13;
      v9 = v10;
      -[CPLChangeSession beginSessionWithKnownLibraryVersion:resetTracker:completionHandler:](v9, "beginSessionWithKnownLibraryVersion:resetTracker:completionHandler:", v11, v12, v14);

      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to begin a push session while %@ is already in place", buf, 0xCu);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    v7 = CFSTR("Trying to begin a push session while an other one is already in place");
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to begin a push session while the library is not open", buf, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 56);
    v7 = CFSTR("Trying to begin a push session while the library is not open");
  }
  +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", v7);
  v9 = (CPLPushChangeSession *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, CPLPushChangeSession *))(v6 + 16))(v6, 0, v9);
LABEL_18:

}

void __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_218(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2;
  v11[3] = &unk_1E60D6AF0;
  v12 = v3;
  v13 = v4;
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v17 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "discardCurrentSession");
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], 0, a1[4]);
  }
  else
  {
    objc_msgSend(v2, "currentSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain_0();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v6 = a1[6];
          v9 = 138412290;
          v10 = v6;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "%@ was discarded before it was returned", (uint8_t *)&v9, 0xCu);
        }

      }
      v7 = a1[7];
      +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }
}

void __40__CPLLibraryManager__setCurrentSession___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  v2 = a1[4];
  v1 = (void *)a1[5];
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    if (v1)
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain_0();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Setting a new session without finalizing the last", v11, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[6];
      v9 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, v10, 570, CFSTR("Setting a new session without finalizing the last"));

      abort();
    }
  }
  else
  {
    if (v1)
    {
      v4 = v1;
      v3 = *(void **)(v2 + 8);
      goto LABEL_6;
    }
    v3 = 0;
  }
  v4 = 0;
LABEL_6:
  *(_QWORD *)(v2 + 8) = v4;

}

void *__42__CPLLibraryManager_discardCurrentSession__block_invoke(uint64_t a1)
{
  void *result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Discarding current session %@", (uint8_t *)&v7, 0xCu);
      }

      result = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    }
    objc_msgSend(result, "tearDownWithCompletionHandler:", &__block_literal_global_208);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0;

    return (void *)+[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.client.session"));
  }
  return result;
}

void __35__CPLLibraryManager_currentSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

void __31__CPLLibraryManager_syncStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  CPLStatus *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 56))
  {
    if (*(_BYTE *)(v1 + 72))
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain_0();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Client tried to access sync status while the library is not open", v8, 2u);
        }

      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(*(_QWORD *)(a1 + 32) + 64), (CFNotificationCallback)_statusDidChange_10665, (CFStringRef)_CPLStatusDidChangeNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
      v5 = -[CPLStatus initWithClientLibraryBaseURL:]([CPLStatus alloc], "initWithClientLibraryBaseURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 56);
      *(_QWORD *)(v6 + 56) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "preventDelegateWithDelegationClass:selector:", &unk_1EEEE33C0, sel_libraryManagerStatusDidChange_);
    }
  }
}

void __37__CPLLibraryManager__statusDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "refetchFromDisk");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
    objc_msgSend(WeakRetained, "libraryManagerStatusDidChange:", *(_QWORD *)(a1 + 32));

  }
}

void __34__CPLLibraryManager_configuration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  CPLConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 48))
  {
    if (*(_BYTE *)(v1 + 72))
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain_0();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Client tried to access configuration while the library is not open", v8, 2u);
        }

      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(*(_QWORD *)(a1 + 32) + 64), (CFNotificationCallback)_configurationDidChange, CFSTR("_CPLConfigurationDidChangeNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
      v5 = -[CPLConfiguration initWithClientLibraryBaseURL:]([CPLConfiguration alloc], "initWithClientLibraryBaseURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 48);
      *(_QWORD *)(v6 + 48) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setConfigurationDictionaryUniquifier:", &__block_literal_global_24);
    }
  }
}

void __44__CPLLibraryManager__configurationDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  char v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "refetchFromDisk");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
      objc_msgSend(v5, "libraryManagerDidChangeConfiguration:", *(_QWORD *)(a1 + 32));

    }
  }
}

void __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_1E60D7330;
    v3 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v2, "boostPriorityForScopeWithIdentifier:completionHandler:", v3, v7);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't boost priority for %@ in state %@"), v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60DB970;
  v12 = v3;
  v13 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2;
    v6[3] = &unk_1E60D7330;
    v3 = *(_QWORD *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v2, "deactivateScopeWithIdentifier:completionHandler:", v3, v6);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't disable PrimarySync in state %@"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60DB970;
  v12 = v3;
  v13 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_1E60D7330;
    v3 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v2, "activateScopeWithIdentifier:completionHandler:", v3, v7);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't enable %@ in state %@"), v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60DB970;
  v12 = v3;
  v13 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void (**v9)(_QWORD);
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  id v20;
  char v21;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = MEMORY[0x1E0C809B0];
    v4 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2;
    block[3] = &unk_1E60D65B8;
    block[4] = v2;
    dispatch_sync(v4, block);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    v19[0] = v3;
    v19[1] = 3221225472;
    v19[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_3;
    v19[3] = &unk_1E60DC058;
    v5 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v5;
    v21 = *(_BYTE *)(a1 + 48);
    v6 = (void *)MEMORY[0x1B5E08DC4](v19);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 24);
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_132;
    v12[3] = &unk_1E60D67F8;
    v12[4] = v7;
    v9 = v6;
    v13 = v9;
    v14 = &v15;
    dispatch_sync(v8, v12);
    if (*((_BYTE *)v16 + 24))
      v9[2](v9);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't close a cloud library in state %@"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v4;
  void *v5;
  __CFNotificationCenter *v6;
  uint64_t v7;
  void *v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(*(_QWORD *)(a1 + 32) + 64), CFSTR("_CPLConfigurationDidChangeNotification"), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 56))
  {
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, *(const void **)(*(_QWORD *)(a1 + 32) + 64), (CFNotificationName)_CPLStatusDidChangeNotification, 0);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;

  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ closing", buf, 0xCu);
    }

  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_130;
  v12 = &unk_1E60D7330;
  v4 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v4;
  v5 = (void *)MEMORY[0x1B5E08DC4](&v9);
  v6 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platformObject", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "deactivateWithCompletionHandler:", v5);
  else
    objc_msgSend(v7, "closeWithCompletionHandler:", v5);

}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_132(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(v5 + 8);
        *(_DWORD *)buf = 138412546;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "%@ is closing in the middle of %@", buf, 0x16u);
      }

      v1 = *(_QWORD *)(a1 + 32);
      v2 = *(void **)(v1 + 8);
    }
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_133;
    v12 = &unk_1E60D6708;
    v13 = v1;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v2, "tearDownWithCompletionHandler:", &v9);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    if (v8)
    {
      *(_QWORD *)(v7 + 8) = 0;

      +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.client.session"), v9, v10, v11, v12, v13);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_133(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2_134;
  v7[3] = &unk_1E60D71F8;
  v8 = v1;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v10 = v4;
  v5 = v2;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "%@ closed", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

void __47__CPLLibraryManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't open a cloud library in state %@"), v2);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "%@ opening", buf, 0xCu);
      }

    }
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_125;
    v8[3] = &unk_1E60D6758;
    v6 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    objc_msgSend(v5, "openWithCompletionHandler:", v8);

  }
}

void __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_125(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v43 = v17;
      _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEBUG, "%@ opened", buf, 0xCu);
    }

  }
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v43 = v19;
        v44 = 2112;
        v45 = v11;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "%@ failed opening with error %@", buf, 0x16u);
      }

    }
    v20 = 0;
    goto LABEL_29;
  }
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (!v21)
    goto LABEL_15;
  v22 = v21;
  v23 = v22;
  if (v13 && (objc_msgSend(v22, "isEqual:", v13) & 1) != 0)
  {

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
LABEL_15:
      v24 = objc_msgSend(v13, "copy");
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(NSObject **)(v25 + 112);
      *(_QWORD *)(v25 + 112) = v24;
LABEL_19:

    }
  }
  else
  {

    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
        *(_DWORD *)buf = 138412546;
        v43 = v27;
        v44 = 2112;
        v45 = v13;
        _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_ERROR, "Unexpected implementation library identifier. Found '%@', expected '%@'", buf, 0x16u);
      }
      goto LABEL_19;
    }
  }
  v28 = *(_QWORD **)(a1 + 32);
  if (!v28[11])
  {
    v29 = objc_msgSend(v15, "copy");
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(void **)(v30 + 88);
    *(_QWORD *)(v30 + 88) = v29;

    v28 = *(_QWORD **)(a1 + 32);
  }
  if (!v28[15])
  {
    v32 = objc_msgSend(v14, "copy");
    v33 = *(_QWORD *)(a1 + 32);
    v34 = *(void **)(v33 + 120);
    *(_QWORD *)(v33 + 120) = v32;

    v28 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v28, "_setLibraryVersion:", v12);
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain_0();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(_QWORD *)(v36 + 160);
      v38 = *(_QWORD *)(v36 + 168);
      *(_DWORD *)buf = 138413314;
      v43 = v36;
      v44 = 2112;
      v45 = v13;
      v46 = 2112;
      v47 = v12;
      v48 = 2048;
      v49 = v37;
      v50 = 2048;
      v51 = v38;
      _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_DEBUG, "%@ opened with identifier %@ and version %@. Size of resources to upload is %llu (%llu) bytes", buf, 0x34u);
    }

  }
  v20 = 2;
LABEL_29:
  objc_msgSend(*(id *)(a1 + 32), "setState:", v20);
  v39 = *(_QWORD *)(a1 + 32);
  v40 = *(NSObject **)(v39 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_126;
  block[3] = &unk_1E60D65B8;
  block[4] = v39;
  dispatch_sync(v40, block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

uint64_t __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_126(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 0;
  return result;
}

void __155__CPLLibraryManager_initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  +[CPLPlatform defaultPlatform](CPLPlatform, "defaultPlatform");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain_0();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v2 = 0;
        _os_log_impl(&dword_1B03C2000, v1, OS_LOG_TYPE_DEBUG, "No platform has been currently selected. Automatically picking the appropriate one", v2, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "useCloudPhotoDaemonImplementation");
  }
}

+ (NSDictionary)mappingForLibraryOptions
{
  if (mappingForLibraryOptions_onceToken != -1)
    dispatch_once(&mappingForLibraryOptions_onceToken, &__block_literal_global_10785);
  return (NSDictionary *)(id)mappingForLibraryOptions_mapping;
}

+ (id)_reverseMappingForLibraryOptions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_reverseMappingForLibraryOptions_onceToken != -1)
    dispatch_once(&_reverseMappingForLibraryOptions_onceToken, block);
  return (id)_reverseMappingForLibraryOptions_reverseMapping;
}

+ (id)descriptionForLibraryOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;

  objc_msgSend(a1, "mappingForLibraryOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __50__CPLLibraryManager_descriptionForLibraryOptions___block_invoke;
  v14 = &unk_1E60DA030;
  v16 = &v17;
  v6 = v5;
  v15 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v11);
  if (v18[3])
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@|%lu"), v8, v18[3], v11, v12, v13, v14);

  }
  else
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (unint64_t)optionsFromDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_reverseMappingForLibraryOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v7, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(v15, "unsignedIntegerValue");
        }
        else
        {
          v18 = objc_msgSend(v14, "integerValue");
          v17 = v18 & ~(v18 >> 63);
        }
        v11 |= v17;

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (NSArray)allLibraryOptionsDescriptions
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "mappingForLibraryOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (void)useCloudPhotoDaemonImplementation
{
  CPLPlatform *v2;

  v2 = objc_alloc_init(CPLPlatform);
  +[CPLPlatform setProxyImplementationForPlatform:](CPLPlatform, "setProxyImplementationForPlatform:", v2);
  +[CPLPlatform setDefaultPlatform:](CPLPlatform, "setDefaultPlatform:", v2);

}

+ (id)stateDescriptionForState:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("UNKNOWN");
  else
    return off_1E60DA3B8[a3];
}

+ (id)descriptionForProvideContentResult:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("UNKNOWN");
  else
    return off_1E60DA3E0[a3];
}

+ (id)platformImplementationProtocol
{
  void *v2;
  NSString *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Implementation"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (NSDictionary)availableRetentionPolicies
{
  return (NSDictionary *)&unk_1E611B7A8;
}

+ (NSDictionary)mappingRetentionPolicies
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mappingRetentionPolicies_onceToken != -1)
    dispatch_once(&mappingRetentionPolicies_onceToken, block);
  return (NSDictionary *)(id)mappingRetentionPolicies_mappingRetentionPolicies;
}

+ (NSDictionary)availableExitSources
{
  return (NSDictionary *)&unk_1E611B7D0;
}

+ (NSDictionary)mappingExitSources
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CPLLibraryManager_mappingExitSources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mappingExitSources_onceToken != -1)
    dispatch_once(&mappingExitSources_onceToken, block);
  return (NSDictionary *)(id)mappingExitSources_mappingExitSources;
}

+ (id)descriptionForExitSource:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "mappingExitSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown exit source (%ld)"), a3);
  v8 = v7;

  return v8;
}

void __39__CPLLibraryManager_mappingExitSources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "availableExitSources");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  objc_msgSend(*(id *)(a1 + 32), "availableExitSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CPLLibraryManager_mappingExitSources__block_invoke_2;
  v8[3] = &unk_1E60DD138;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  v5 = (void *)mappingExitSources_mappingExitSources;
  mappingExitSources_mappingExitSources = (uint64_t)v4;
  v6 = v4;

}

uint64_t __39__CPLLibraryManager_mappingExitSources__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "availableRetentionPolicies");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  objc_msgSend(*(id *)(a1 + 32), "availableRetentionPolicies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke_2;
  v8[3] = &unk_1E60DD138;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  v5 = (void *)mappingRetentionPolicies_mappingRetentionPolicies;
  mappingRetentionPolicies_mappingRetentionPolicies = (uint64_t)v4;
  v6 = v4;

}

uint64_t __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __50__CPLLibraryManager_descriptionForLibraryOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & v5) != 0)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) &= ~v6;
  }

}

void __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mappingForLibraryOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke_2;
  v6[3] = &unk_1E60DA008;
  v2 = v1;
  v7 = v2;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);
  v3 = (void *)_reverseMappingForLibraryOptions_reverseMapping;
  _reverseMappingForLibraryOptions_reverseMapping = (uint64_t)v2;
  v4 = v2;

}

uint64_t __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __45__CPLLibraryManager_mappingForLibraryOptions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E611A0A8;
  v2[1] = &unk_1E611A0C0;
  v3[0] = CFSTR("primary-scope-management");
  v3[1] = CFSTR("library-scope-sync");
  v2[2] = &unk_1E611A0D8;
  v2[3] = &unk_1E611A0F0;
  v3[2] = CFSTR("cmm-scope-sync");
  v3[3] = CFSTR("share-scope-sync");
  v2[4] = &unk_1E611A108;
  v3[4] = CFSTR("inactive-scope-sync");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mappingForLibraryOptions_mapping;
  mappingForLibraryOptions_mapping = v0;

}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__CPLLibraryManager_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CPLLibraryManager_CPLManagement__getStatusForComponents_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__CPLLibraryManager_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__CPLLibraryManager_CPLManagement__getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6D48;
  v17[4] = self;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__CPLLibraryManager_CPLManagement__getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  -[CPLLibraryManager cloudCacheGetDescriptionForRecordWithScopedIdentifier:related:completionHandler:](self, "cloudCacheGetDescriptionForRecordWithScopedIdentifier:related:completionHandler:", a3, 0, a4);
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__CPLLibraryManager_CPLManagement__cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6D48;
  v17[4] = self;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

- (void)reportSetting:(id)a3 hasBeenEnabled:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  -[CPLLibraryManager reportSetting:hasBeenSetToValue:](self, "reportSetting:hasBeenSetToValue:", a3, v4);
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__CPLLibraryManager_CPLManagement__reportSetting_hasBeenSetToValue___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)reportMiscInformation:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CPLLibraryManager_CPLManagement__reportMiscInformation___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)blockEngineElement:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CPLLibraryManager_CPLManagement__blockEngineElement___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)unblockEngineElement:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CPLLibraryManager_CPLManagement__unblockEngineElement___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)unblockEngineElementOnce:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CPLLibraryManager_CPLManagement__unblockEngineElementOnce___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_10471;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __61__CPLLibraryManager_CPLManagement__unblockEngineElementOnce___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unblockEngineElementOnce:", *(_QWORD *)(a1 + 40));

}

void __57__CPLLibraryManager_CPLManagement__unblockEngineElement___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unblockEngineElement:", *(_QWORD *)(a1 + 40));

}

void __55__CPLLibraryManager_CPLManagement__blockEngineElement___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockEngineElement:", *(_QWORD *)(a1 + 40));

}

void __58__CPLLibraryManager_CPLManagement__reportMiscInformation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportMiscInformation:", *(_QWORD *)(a1 + 40));

}

void __68__CPLLibraryManager_CPLManagement__reportSetting_hasBeenSetToValue___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_QWORD *)(a1 + 48))
    v3 = *(const __CFString **)(a1 + 48);
  else
    v3 = CFSTR("nil");
  objc_msgSend(v2, "reportSetting:hasBeenSetToValue:", *(_QWORD *)(a1 + 40), v3);

}

void __116__CPLLibraryManager_CPLManagement__cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudCacheGetDescriptionForRecordWithScopedIdentifier:related:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __97__CPLLibraryManager_CPLManagement__getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCloudCacheForRecordWithScopedIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __106__CPLLibraryManager_CPLManagement__getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getStatusesForScopesWithIdentifiers:includeStorages:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __82__CPLLibraryManager_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getStatusArrayForComponents:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __77__CPLLibraryManager_CPLManagement__getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getStatusForComponents:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __77__CPLLibraryManager_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getListOfComponentsWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3
{
  double result;

  +[CPLEngineSystemMonitor nextOverrideTimeIntervalForSystemBudgets:](CPLEngineSystemMonitor, "nextOverrideTimeIntervalForSystemBudgets:", a3);
  return result;
}

@end
