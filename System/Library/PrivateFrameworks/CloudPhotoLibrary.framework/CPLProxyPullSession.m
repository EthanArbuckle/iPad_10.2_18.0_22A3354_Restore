@implementation CPLProxyPullSession

+ (void)beginSessionForProxy:(id)a3 knownVersion:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  objc_msgSend(a3, "beginPullSessionWithKnownLibraryVersion:context:completionHandler:", a4, a5, a6);
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Getting next change batch", buf, 2u);
    }

    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Sending Get Change Batch message to connection", buf, 2u);
      }

    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E60D6708;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[CPLProxySession dispatchBlockWhenLibraryIsOpen:](self, "dispatchBlockWhenLibraryIsOpen:", v8);

}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;

  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E60D7268;
  v3 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_1;
    v13[3] = &unk_1E60D7290;
    v5 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    objc_msgSend(v4, "getChangeBatchWithCompletionHandler:", v13);
    v6 = v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = v2;
    v11[1] = 3221225472;
    v11[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E60D71F8;
    v12 = *(id *)(a1 + 40);
    v9 = v11;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_0;
    block[3] = &unk_1E60D71F8;
    v18 = v9;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v8, v10);

    v6 = v12;
  }

}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Getting batch failed with error %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2_2;
  v15[3] = &unk_1E60D6898;
  v16 = v5;
  v10 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v10;
  v11 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_0;
  block[3] = &unk_1E60D71F8;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v14);

}

uint64_t __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_2_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = a1[4];
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Getting batch failed with error %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = a1[5];
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Got batch: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v4();
}

void __59__CPLProxyPullSession_getChangeBatchWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
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
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Acknowledging %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Sending Acknowledging message to connection", buf, 2u);
      }

    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6898;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[CPLProxySession dispatchBlockWhenLibraryIsOpen:](self, "dispatchBlockWhenLibraryIsOpen:", v12);

}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E60D7268;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "proxyWithErrorHandler:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_6;
    v13[3] = &unk_1E60D72B8;
    v5 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v4, "acknowledgeChangeBatch:withCompletionHandler:", v5, v13);
    v6 = v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = v2;
    v11[1] = 3221225472;
    v11[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_12;
    v11[3] = &unk_1E60D71F8;
    v12 = *(id *)(a1 + 48);
    v9 = v11;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_0;
    block[3] = &unk_1E60D71F8;
    v18 = v9;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v8, v10);

    v6 = v12;
  }

}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Acknowledging failed with error %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "proxyLibraryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2_7;
  v15[3] = &unk_1E60D6898;
  v16 = v5;
  v10 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v10;
  v11 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_0;
  block[3] = &unk_1E60D71F8;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v14);

}

uint64_t __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_2_7(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = a1[4];
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Acknowledging failed with error %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = a1[5];
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Acknowledging succeeded with new library version: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v4 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v4();
}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 150, CFSTR("Exception raised while trying to send a batch to the daemon: %@"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v2;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Acknowledgement failed with error %@", buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      __CPLProxyPullSessionOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 40), "estimatedBatchSize"), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v9 = v5;
        v10 = 2112;
        v11 = v6;
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Unable to send batch to daemon for ack: %@\nBatch (estimated size: %@): %@", buf, 0x20u);

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __68__CPLProxyPullSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLProxyPullSessionOSLogDomain();
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
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

@end
