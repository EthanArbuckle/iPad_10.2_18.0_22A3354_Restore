@implementation CPLPushChangeSession

- (CPLPushChangeSession)initWithLibraryManager:(id)a3
{
  CPLPushChangeSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPushChangeSession;
  v3 = -[CPLChangeSession initWithLibraryManager:](&v5, sel_initWithLibraryManager_, a3);
  if (v3)
    v3->_startWaitingForBatch = CFAbsoluteTimeGetCurrent();
  return v3;
}

- (void)commitChangeBatch:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__CPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke;
  v8[3] = &unk_1E60DC248;
  v9 = v6;
  v7 = v6;
  -[CPLPushChangeSession commitChangeBatch:withUnderlyingCompletionHandler:](self, "commitChangeBatch:withUnderlyingCompletionHandler:", a3, v8);

}

- (void)commitChangeBatch:(id)a3 withUnderlyingCompletionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  CPLPushChangeSession *v10;
  double Current;
  double startWaitingForBatch;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  CPLPushChangeSession *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  double v26;
  uint8_t buf[4];
  CPLPushChangeSession *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_15864();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (CPLPushChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  if (-[CPLChangeSession state](self, "state") != 1)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_15864();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v19 = (CPLPushChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "can't commit a session that is in %@ state", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushChangeSession.m");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v21, 219, CFSTR("can't commit a session that is in %@ state"), v22);

    abort();
  }
  -[CPLChangeSession setState:](self, "setState:", 4);
  Current = CFAbsoluteTimeGetCurrent();
  startWaitingForBatch = self->_startWaitingForBatch;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_15864();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138412802;
      v28 = self;
      v29 = 2048;
      v30 = v14;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "%@ committing %lu changes in %@", buf, 0x20u);
    }

  }
  -[CPLChangeSession platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__CPLPushChangeSession_commitChangeBatch_withUnderlyingCompletionHandler___block_invoke;
  v23[3] = &unk_1E60DC270;
  v26 = Current - startWaitingForBatch;
  v23[4] = self;
  v24 = v7;
  v25 = v8;
  v16 = v8;
  v17 = v7;
  objc_msgSend(v15, "commitChangeBatch:withCompletionHandler:", v17, v23);

}

void __74__CPLPushChangeSession_commitChangeBatch_withUnderlyingCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE v23[24];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_15864();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v23 = 138412802;
      *(_QWORD *)&v23[4] = v13;
      *(_WORD *)&v23[12] = 2112;
      *(_QWORD *)&v23[14] = v11;
      *(_WORD *)&v23[22] = 2112;
      v24 = v9;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "%@ committed to new version %@ with error %@", v23, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  if (!v9)
  {
    if (a3)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_15864();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 56);
          v16 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v23 = 134218498;
          *(_QWORD *)&v23[4] = v15;
          *(_WORD *)&v23[12] = 2112;
          *(_QWORD *)&v23[14] = v16;
          *(_WORD *)&v23[22] = 2048;
          v24 = a3;
          v17 = "Client pushed (used %.1fs) %@ (%lu spurious changes)";
          v18 = v14;
          v19 = 32;
LABEL_13:
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, v17, v23, v19);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_15864();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 56);
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v23 = 134218242;
        *(_QWORD *)&v23[4] = v20;
        *(_WORD *)&v23[12] = 2112;
        *(_QWORD *)&v23[14] = v21;
        v17 = "Client pushed (used %.1fs) %@";
        v18 = v14;
        v19 = 22;
        goto LABEL_13;
      }
LABEL_14:

    }
    objc_msgSend(*(id *)(a1 + 32), "libraryManager", *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setLibraryVersion:", v11);

  }
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __60__CPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)shortDescription
{
  return CFSTR("push");
}

@end
