@implementation CPLChangeSession

- (CPLChangeSession)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeSession.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 65, CFSTR("Should not use -init method but -initWithLibraryManager:"));

  abort();
}

- (CPLChangeSession)initWithLibraryManager:(id)a3
{
  id v6;
  CPLChangeSession *v7;
  void *v8;
  uint64_t v9;
  CPLPlatformObject *platformObject;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *sessionIdentifier;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPLChangeSession;
  v7 = -[CPLChangeSession init](&v21, sel_init);
  if (v7)
  {
    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "newPlatformImplementationForObject:", v7);
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v9;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_19957();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v23 = v17;
          v18 = v17;
          _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeSession.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, v20, 73, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
    objc_storeStrong((id *)&v7->_libraryManager, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    sessionIdentifier = v7->_sessionIdentifier;
    v7->_sessionIdentifier = (NSString *)v13;

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_state != 6 && _CPLSilentLogging == 0)
  {
    __CPLSessionOSLogDomain_19957();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", self->_state);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "session was not properly finalized. Still in %@ state", buf, 0xCu);

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CPLChangeSession;
  -[CPLChangeSession dealloc](&v6, sel_dealloc);
}

- (id)createSessionContext
{
  CPLChangeSessionContext *v3;

  v3 = objc_alloc_init(CPLChangeSessionContext);
  -[CPLChangeSessionContext setEstimatedInitialSizeForLocalLibrary:](v3, "setEstimatedInitialSizeForLocalLibrary:", -[CPLLibraryManager estimatedInitialSizeForLocalLibrary](self->_libraryManager, "estimatedInitialSizeForLocalLibrary"));
  -[CPLChangeSessionContext setEstimatedInitialAssetCountForLocalLibrary:](v3, "setEstimatedInitialAssetCountForLocalLibrary:", -[CPLLibraryManager estimatedInitialAssetCountForLocalLibrary](self->_libraryManager, "estimatedInitialAssetCountForLocalLibrary"));
  return v3;
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  CPLChangeSession *v13;
  NSObject *v14;
  CPLChangeSession *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, void *);
  BOOL v23;
  uint8_t buf[4];
  CPLChangeSession *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_19957();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v13 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  if (-[CPLChangeSession state](self, "state"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_19957();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v15 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Trying to begin a session that has already started (state: %@)", buf, 0xCu);

      }
    }
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to begin a session that has already started"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_19957();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEBUG, "%@ starting with known library version %@", buf, 0x16u);
      }

    }
    -[CPLChangeSession createSessionContext](self, "createSessionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    if (!v10)
    {
      +[CPLResetTracker currentTracker](CPLResetTracker, "currentTracker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "setResetTracker:", v18);
    -[CPLChangeSession platformObject](self, "platformObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__CPLChangeSession_beginSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke;
    v20[3] = &unk_1E60DD020;
    v20[4] = self;
    v23 = v10 == 0;
    v10 = v18;
    v21 = v10;
    v22 = v11;
    objc_msgSend(v19, "beginSessionWithKnownLibraryVersion:context:completionHandler:", v9, v16, v20);

  }
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  void (**v5)(id, void *);
  NSObject *v6;
  CPLChangeSession *v7;
  NSObject *v8;
  CPLChangeSession *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, void *);
  uint8_t buf[4];
  CPLChangeSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_19957();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v7 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  if (-[CPLChangeSession state](self, "state") == 6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_19957();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v9 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to begin a session that has already been finalized (state: %@)", buf, 0xCu);

      }
    }
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to begin a session that has already been finalized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v10);

  }
  else
  {
    if (-[CPLChangeSession state](self, "state") == 1)
      -[CPLChangeSession setState:](self, "setState:", 5);
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_19957();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "%@ finalizing", buf, 0xCu);
      }

    }
    -[CPLChangeSession platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__CPLChangeSession_finalizeWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E60D7330;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v12, "finalizeWithCompletionHandler:", v13);

  }
}

- (void)tearDownWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  CPLChangeSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_19957();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Tearing down %@", buf, 0xCu);
    }

  }
  -[CPLChangeSession platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CPLChangeSession_tearDownWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E60D6708;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "tearDownWithCompletionHandler:", v8);

}

- (NSString)description
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("[%@ session]"), v3);

  return (NSString *)v4;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (NSProgress)sessionProgress
{
  return self->_sessionProgress;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (CPLLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryManager, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionProgress, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

uint64_t __50__CPLChangeSession_tearDownWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", 6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __50__CPLChangeSession_finalizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setState:", 6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "discardCurrentSession");
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_19957();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "%@ finalized with error %@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87__CPLChangeSession_beginSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_19957();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v8 = 138412546;
        v9 = v5;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "%@ failed to start: %@", (uint8_t *)&v8, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 6);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_19957();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "%@ started", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    if (*(_BYTE *)(a1 + 56))
      +[CPLResetTracker discardTracker:](CPLResetTracker, "discardTracker:", *(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)stateDescriptionForState:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("UNKNOWN");
  else
    return off_1E60DD060[a3];
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

+ (NSString)shortDescription
{
  return (NSString *)CFSTR("generic");
}

@end
