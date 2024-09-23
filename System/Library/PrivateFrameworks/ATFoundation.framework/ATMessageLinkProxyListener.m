@implementation ATMessageLinkProxyListener

- (ATMessageLinkProxyListener)initWithMessageLink:(id)a3
{
  id v5;
  ATMessageLinkProxyListener *v6;
  ATMessageLinkProxyListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATMessageLinkProxyListener;
  v6 = -[ATMessageLinkProxyListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageLink, a3);

  return v7;
}

- (void)start
{
  NSObject *v3;
  NSXPCListener *v4;
  NSXPCListener *listener;
  int v6;
  ATMessageLinkProxyListener *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v4 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)stop
{
  NSObject *v3;
  NSXPCListener *listener;
  NSXPCListener *v5;
  ATMessageLink *messageLink;
  int v7;
  ATMessageLinkProxyListener *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v7, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
    v5 = self->_listener;
    self->_listener = 0;

  }
  messageLink = self->_messageLink;
  self->_messageLink = 0;

}

- (id)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  ATMessageLinkProxyConnection *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ATMessageLinkProxyListener *v19;
  id v20;
  int v21;
  _QWORD v22[5];
  id v23;
  int v24;
  uint8_t buf[4];
  ATMessageLinkProxyListener *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "processIdentifier");
  _ATLogCategoryXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 1024;
    v28 = v8;
    _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v10 = -[ATMessageLinkProxyConnection initWithMessageLink:connection:]([ATMessageLinkProxyConnection alloc], "initWithMessageLink:connection:", self->_messageLink, v7);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC6EB98);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v11);

  objc_msgSend(v7, "setExportedObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC71288);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v12);

  objc_initWeak((id *)buf, v10);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke;
  v22[3] = &unk_1E928CB58;
  v22[4] = self;
  v24 = v8;
  objc_copyWeak(&v23, (id *)buf);
  objc_msgSend(v7, "setInterruptionHandler:", v22);
  v15 = v13;
  v16 = 3221225472;
  v17 = __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke_69;
  v18 = &unk_1E928CB58;
  v19 = self;
  v21 = v8;
  objc_copyWeak(&v20, (id *)buf);
  objc_msgSend(v7, "setInvalidationHandler:", &v15);
  objc_msgSend(v7, "resume", v15, v16, v17, v18, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (ATMessageLink)messageLink
{
  return self->_messageLink;
}

- (void)setMessageLink:(id)a3
{
  objc_storeStrong((id *)&self->_messageLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 48);
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection interrupted from pid: %i", (uint8_t *)&v6, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stop");

}

void __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 48);
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection invalidated from pid: %i", (uint8_t *)&v6, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stop");

}

@end
