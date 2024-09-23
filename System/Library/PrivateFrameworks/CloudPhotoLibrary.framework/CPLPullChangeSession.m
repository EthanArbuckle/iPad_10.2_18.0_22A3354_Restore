@implementation CPLPullChangeSession

+ (id)shortDescription
{
  return CFSTR("pull");
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  CPLPullChangeSession *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CPLPullChangeSession *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  CPLPullChangeSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v7 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  if (-[CPLChangeSession state](self, "state") == 1)
  {
    -[CPLChangeSession setState:](self, "setState:", 2);
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "%@ asking for batches", buf, 0xCu);
      }

    }
    -[CPLChangeSession platformObject](self, "platformObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__CPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E60D7290;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v9, "getChangeBatchWithCompletionHandler:", v13);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v11 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Trying to get change batches while session is not idle (state: %@)", buf, 0xCu);

      }
    }
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to get change batches while session is not idle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v12, 0);

  }
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  CPLPullChangeSession *v10;
  double Current;
  double sentBatchTimeInterval;
  double v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  CPLPullChangeSession *v17;
  void *v18;
  NSObject *v19;
  CPLPullChangeSession *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  double v27;
  uint8_t buf[4];
  CPLPullChangeSession *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);

    }
  }
  Current = CFAbsoluteTimeGetCurrent();
  sentBatchTimeInterval = self->_sentBatchTimeInterval;
  if (-[CPLChangeSession state](self, "state") == 3)
  {
    if (-[CPLChangeSession state](self, "state") != 3)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSessionOSLogDomain_0();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
          v20 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "can't finalize a session that is in %@ state", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPullChangeSession.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v22, 65, CFSTR("can't finalize a session that is in %@ state"), v23);

      abort();
    }
    v13 = Current - sentBatchTimeInterval;
    -[CPLChangeSession setState:](self, "setState:", 4);
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_0();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "%@ acknowledging %@", buf, 0x16u);
      }

    }
    -[CPLChangeSession platformObject](self, "platformObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __69__CPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E60D9458;
    v24[4] = self;
    v27 = v13;
    v25 = v7;
    v26 = v8;
    objc_msgSend(v15, "acknowledgeChangeBatch:withCompletionHandler:", v25, v24);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v17 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Trying to acknowledge a batch while session is not waiting for that (state: %@)", buf, 0xCu);

      }
    }
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Trying to acknowledge a batch while session is not waiting for that"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v18, 0);

  }
}

void __69__CPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "%@ acknowledged batch to new version %@ with error %@", (uint8_t *)&v13, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(void **)(a1 + 40);
        v13 = 134218242;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Client acknowledged (used %.1fs) %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "libraryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setLibraryVersion:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__CPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLSessionOSLogDomain_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)&v14[4] = v8;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v5;
    v9 = "%@ got error: %@";
    v10 = v7;
    v11 = 22;
    goto LABEL_8;
  }
  if (_CPLSilentLogging)
    goto LABEL_10;
  __CPLSessionOSLogDomain_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v14 = 138412802;
    *(_QWORD *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2048;
    *(_QWORD *)&v14[14] = objc_msgSend(v6, "count");
    *(_WORD *)&v14[22] = 2112;
    v15 = v6;
    v9 = "%@ got %lu changes in %@";
    v10 = v7;
    v11 = 32;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, v9, v14, v11);
  }
LABEL_9:

LABEL_10:
  if (v6)
    v13 = 3;
  else
    v13 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setState:", v13, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
