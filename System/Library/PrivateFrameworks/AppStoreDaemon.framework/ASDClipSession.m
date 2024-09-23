@implementation ASDClipSession

- (ASDClipSession)initWithRequest:(id)a3
{
  return -[ASDClipSession initWithRequest:delegate:](self, "initWithRequest:delegate:", a3, 0);
}

- (ASDClipSession)initWithRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASDClipSession *v9;

  v6 = a4;
  v7 = a3;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASDClipSession initWithRequest:delegate:usingBroker:](self, "initWithRequest:delegate:usingBroker:", v7, v6, v8);

  return v9;
}

- (ASDClipSession)initWithRequest:(id)a3 delegate:(id)a4 usingBroker:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASDClipSession *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v19;
  NSObject *v20;
  dispatch_block_t v21;
  _QWORD block[4];
  ASDClipSession *v24;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ASDClipSession;
  v12 = -[ASDClipSession init](&v25, sel_init);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("com.apple.AppStoreDaemon.ASDClipSession.%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_retainAutorelease(v15);
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v12->_broker, a5);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v12->_request, a3);
    v19 = v12->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__ASDClipSession_initWithRequest_delegate_usingBroker___block_invoke;
    block[3] = &unk_1E37BDD60;
    v24 = v12;
    v20 = v19;
    v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v20, v21);

  }
  return v12;
}

void __55__ASDClipSession_initWithRequest_delegate_usingBroker___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 16));
    v2 = *(void **)(v1 + 8);
    v10 = 0;
    objc_msgSend(v2, "getClipServiceWithError:", &v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v3)
    {
      v5 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke;
      v9[3] = &unk_1E37BDDB0;
      v9[4] = v1;
      objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(v1 + 24);
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke_3;
      v8[3] = &unk_1E37C00E8;
      v8[4] = v1;
      objc_msgSend(v6, "boostSessionUsingChannel:forRequest:withReplyHandler:", v1, v7, v8);

    }
  }
}

- (NSUUID)uniqueID
{
  return -[ASDClipRequest uniqueID](self->_request, "uniqueID");
}

- (void)startDownloadWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v6 = dispatchQueue;
  v7 = v4;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);

}

void __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = 0;
  objc_msgSend(v2, "getClipServiceWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDEE8;
    v6 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v6;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E37BF300;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v7, "startSessionID:withReplyHandler:", v8, v10);

  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);
  }

}

void __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2);
}

- (void)_dispatchHandler:(void *)a3 withError:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__ASDClipSession__dispatchHandler_withError___block_invoke;
    v8[3] = &unk_1E37BDCC0;
    v10 = v5;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

void __53__ASDClipSession_startDownloadWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a3);
}

- (void)cancelInstallWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v6 = dispatchQueue;
  v7 = v4;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);

}

void __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = 0;
  objc_msgSend(v2, "getClipServiceWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDEE8;
    v6 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v6;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E37BF300;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v7, "cancelSessionID:withReplyHandler:", v8, v10);

  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);
  }

}

void __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2);
}

void __53__ASDClipSession_cancelInstallWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a3);
}

- (void)continueInstallWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v6 = dispatchQueue;
  v7 = v4;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);

}

void __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = 0;
  objc_msgSend(v2, "getClipServiceWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDEE8;
    v6 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v6;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E37BF300;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v7, "commitSessionID:withReplyHandler:", v8, v10);

  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);
  }

}

void __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2);
}

void __55__ASDClipSession_continueInstallWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a3);
}

- (void)installPlaceholderWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v6 = dispatchQueue;
  v7 = v4;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);

}

void __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = 0;
  objc_msgSend(v2, "getClipServiceWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDEE8;
    v6 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v6;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E37BF300;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v7, "placeholderSessionID:withReplyHandler:", v8, v10);

  }
  else
  {
    -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);
  }

}

void __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2);
}

void __58__ASDClipSession_installPlaceholderWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  -[ASDClipSession _dispatchHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a3);
}

- (void)channelNotifyDidComplete
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASDClipRequest uniqueID](self->_request, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session completed successfully", (uint8_t *)&v6, 0xCu);

  }
  -[ASDClipSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipSessionDidCompleteSuccessfully:", self);

}

- (void)channelNotifyDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[ASDClipRequest uniqueID](self->_request, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Session failed with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[ASDClipSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipSession:didFailWithError:", self, v4);

}

- (void)channelNotifyDidInstallPlaceholder
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASDClipRequest uniqueID](self->_request, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session did install placeholder", (uint8_t *)&v8, 0xCu);

  }
  -[ASDClipSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ASDClipSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipSessionDidInstallPlaceholder:", self);

  }
}

- (void)channelNotifyDidProgress:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[ASDClipRequest uniqueID](self->_request, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Session received progress: %.2f", (uint8_t *)&v8, 0x16u);

  }
  -[ASDClipSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clipSession:didUpdateProgress:", self, a3);

}

- (void)_dispatchFailWithError:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_get_global_queue(21, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__ASDClipSession__dispatchFailWithError___block_invoke;
      block[3] = &unk_1E37BDE50;
      v7 = WeakRetained;
      v8 = a1;
      v9 = v3;
      dispatch_async(v5, block);

    }
  }

}

uint64_t __41__ASDClipSession__dispatchFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clipSession:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __45__ASDClipSession__dispatchHandler_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__ASDClipSession__establishBoostingConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke_2;
  v7[3] = &unk_1E37BDC98;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __46__ASDClipSession__establishBoostingConnection__block_invoke_2(uint64_t a1)
{
  -[ASDClipSession _dispatchFailWithError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __46__ASDClipSession__establishBoostingConnection__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ASDClipSession__establishBoostingConnection__block_invoke_4;
  block[3] = &unk_1E37C00C0;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

void __46__ASDClipSession__establishBoostingConnection__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session boosting dropped", (uint8_t *)&v4, 0xCu);

  }
  if (!*(_BYTE *)(a1 + 48))
    -[ASDClipSession _dispatchFailWithError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (ASDClipSessionDelegate)delegate
{
  return (ASDClipSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_broker, 0);
}

@end
