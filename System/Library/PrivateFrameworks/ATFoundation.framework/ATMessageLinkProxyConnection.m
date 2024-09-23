@implementation ATMessageLinkProxyConnection

- (ATMessageLinkProxyConnection)initWithMessageLink:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  ATMessageLinkProxyConnection *v8;
  ATMessageLinkProxyConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATMessageLinkProxyConnection;
  v8 = -[ATMessageLinkProxyConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    objc_storeWeak((id *)&v9->_messageLink, v6);
    objc_msgSend(v6, "addObserver:", v9);
  }

  return v9;
}

- (void)stop
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  ATMessageLinkProxyConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryDeviceSync();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping .. ", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageLink);
  objc_msgSend(WeakRetained, "removeObserver:", self);

}

- (void)messageLinkWasOpened:(id)a3
{
  void *v3;
  id v4;

  -[ATMessageLinkProxyConnection connection](self, "connection", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1927);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageLinkWasOpened:", 0);

}

- (void)messageLinkWasInitialized:(id)a3
{
  void *v3;
  id v4;

  -[ATMessageLinkProxyConnection connection](self, "connection", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageLinkWasInitialized:", 0);

}

- (void)messageLinkWasClosed:(id)a3
{
  void *v4;
  void *v5;

  -[ATMessageLinkProxyConnection connection](self, "connection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageLinkWasClosed:", 0);

  -[ATMessageLinkProxyConnection stop](self, "stop");
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;

  v5 = a4;
  v6 = dispatch_semaphore_create(0);
  -[ATMessageLinkProxyConnection connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke;
  v14[3] = &unk_1E928CBE0;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke_3;
  v12[3] = &unk_1E928CC08;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "messageLink:didReceiveRequest:completion:", 0, v5, v12);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ATMessageLinkProxyConnection messageLink](self, "messageLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ATMessageLinkProxyConnection_sendRequest_withCompletion___block_invoke;
  v10[3] = &unk_1E928CC30;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "sendRequest:withCompletion:", v7, v10);

}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ATMessageLinkProxyConnection messageLink](self, "messageLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__ATMessageLinkProxyConnection_sendResponse_withCompletion___block_invoke;
  v10[3] = &unk_1E928CC58;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "sendResponse:withCompletion:", v7, v10);

}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a5;
  v7 = a4;
  -[ATMessageLinkProxyConnection messageLink](self, "messageLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addRequestHandler:forDataClass:", self, v7);

  v9[2](v9, 0);
}

- (void)removeRequestHandlerForDataClass:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[ATMessageLinkProxyConnection messageLink](self, "messageLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeRequestHandlerForDataClass:", v6);

  v8[2](v8, 0);
}

- (void)connectWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (ATMessageLink)messageLink
{
  return (ATMessageLink *)objc_loadWeakRetained((id *)&self->_messageLink);
}

- (void)setMessageLink:(id)a3
{
  objc_storeWeak((id *)&self->_messageLink, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageLink);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __60__ATMessageLinkProxyConnection_sendResponse_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ATMessageLinkProxyConnection_sendRequest_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ATLogCategoryXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__ATMessageLinkProxyConnection_messageLinkWasClosed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __58__ATMessageLinkProxyConnection_messageLinkWasInitialized___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __53__ATMessageLinkProxyConnection_messageLinkWasOpened___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

@end
