@implementation CPLProxySession

- (id)proxyLibraryManager
{
  void *v2;
  void *v3;
  void *v4;

  -[CPLPlatformObject abstractObject](self, "abstractObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CPLProxySession proxyLibraryManager](self, "proxyLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CPLProxySession_proxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E60D67A8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "proxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __41__CPLProxySession_proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxySession.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v16, 32, CFSTR("%@ should be implemented by subclasses"), v17);

  abort();
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  CPLProxySession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Beginning %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Sending begin session message to connection", buf, 2u);
      }

    }
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6B18;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[CPLProxySession dispatchBlockWhenLibraryIsOpen:](self, "dispatchBlockWhenLibraryIsOpen:", v16);

}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  dispatch_block_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2;
  v17[3] = &unk_1E60D7330;
  v17[4] = v2;
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v2, "proxyWithErrorHandler:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_5;
    v15[3] = &unk_1E60D7330;
    v6 = *(_QWORD *)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v5, "beginSessionForProxy:knownVersion:context:completionHandler:", v4, v6, v7, v15);
    v8 = v16;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_8;
    v13[3] = &unk_1E60D71F8;
    v14 = *(id *)(a1 + 56);
    v11 = v13;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_2;
    block[3] = &unk_1E60D71F8;
    v20 = v11;
    v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v10, v12);

    v8 = v14;
  }

}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Beginning %@ failed with error %@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2_6;
  v12[3] = &unk_1E60D70C8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v3;
  v14 = v7;
  v15 = v8;
  v9 = v12;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_2;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v11);

}

uint64_t __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_2_6(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v4 = a1[4];
        v3 = a1[5];
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Beginning %@ failed with error %@", (uint8_t *)&v9, 0x16u);
      }

    }
    v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = a1[5];
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Beginning %@  succeeded", (uint8_t *)&v9, 0xCu);
      }

    }
    v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v5();
}

void __81__CPLProxySession_beginSessionWithKnownLibraryVersion_context_completionHandler___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }

  }
  v3 = *(_QWORD *)(a1 + 32);
  +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  CPLProxySession *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Finalizing %@", buf, 0xCu);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60D6708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CPLProxySession dispatchBlockWhenLibraryIsOpen:](self, "dispatchBlockWhenLibraryIsOpen:", v7);

}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  dispatch_block_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;

  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Sending finalize message to connection", buf, 2u);
    }

  }
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_10;
  v16[3] = &unk_1E60D7330;
  v4 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 32);
  v18 = v4;
  objc_msgSend(v17, "proxyWithErrorHandler:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_11;
    v14[3] = &unk_1E60D7330;
    v6 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v6;
    objc_msgSend(v5, "finalizeSessionWithCompletionHandler:", v14);
    v7 = v15;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_12;
    v12[3] = &unk_1E60D71F8;
    v13 = *(id *)(a1 + 40);
    v10 = v12;
    *(_QWORD *)buf = v3;
    v20 = 3221225472;
    v21 = __cpl_dispatch_async_block_invoke_2;
    v22 = &unk_1E60D71F8;
    v23 = v10;
    v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v9, v11);

    v7 = v13;
  }

}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
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
  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Finalizing %@ failed with error %@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E60D70C8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v3;
  v14 = v7;
  v15 = v8;
  v9 = v12;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_2;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v11);

}

uint64_t __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v4 = a1[4];
        v3 = a1[5];
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Finalizing %@ failed with error %@", (uint8_t *)&v9, 0x16u);
      }

    }
    v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = a1[5];
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Finalizing %@ succeeded", (uint8_t *)&v9, 0xCu);
      }

    }
    v5 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v5();
}

void __49__CPLProxySession_finalizeWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Proxy has disappeared", v5, 2u);
    }

  }
  v3 = *(_QWORD *)(a1 + 32);
  +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)tearDownWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)dispatchBlockWhenLibraryIsOpen:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLProxySession proxyLibraryManager](self, "proxyLibraryManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchBlockWhenLibraryIsOpen:", v4);

}

@end
