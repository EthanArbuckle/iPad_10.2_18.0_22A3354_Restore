@implementation ATServiceProxyConnection

- (ATServiceProxyConnection)initWithService:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  ATServiceProxyConnection *v8;
  ATServiceProxyConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATServiceProxyConnection;
  v8 = -[ATServiceProxyConnection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_connection, a4);
  }

  return v9;
}

- (void)service:(id)a3 willOpenMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "proxyListenerForMessageLink:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CF7698]);
    objc_msgSend(v8, "endpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithEndpoint:", v10);

    v12 = dispatch_semaphore_create(0);
    -[ATServiceProxyConnection connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke;
    v20[3] = &unk_1E928CBE0;
    v15 = v12;
    v21 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke_2;
    v18[3] = &unk_1E928CBE0;
    v19 = v15;
    v17 = v15;
    objc_msgSend(v16, "service:willOpenMessageLink:completion:", 0, v11, v18);

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }

}

- (void)connectWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)fetchMessageLinksWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[ATServiceProxyConnection service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v22 = v5;
    objc_msgSend(v5, "allMessageLinkProxyListeners");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x1E0CF7698]);
          objc_msgSend(v13, "endpoint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithEndpoint:", v15);

          objc_msgSend(v13, "messageLink");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "guid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setIdentifier:", v18);

          objc_msgSend(v13, "messageLink");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setOpen:", objc_msgSend(v19, "isOpen"));

          objc_msgSend(v13, "messageLink");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setInitialized:", objc_msgSend(v20, "isInitialized"));

          objc_msgSend(v13, "messageLink");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setEndpointType:", objc_msgSend(v21, "endpointType"));

          objc_msgSend(v7, "addObject:", v16);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    v4[2](v4, v7, 0);
    v5 = v22;
  }

}

- (ATService)service
{
  return (ATService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_service);
}

intptr_t __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
