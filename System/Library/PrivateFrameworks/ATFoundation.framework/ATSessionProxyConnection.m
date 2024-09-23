@implementation ATSessionProxyConnection

- (ATSessionProxyConnection)initWithSession:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  ATSessionProxyConnection *v9;
  ATSessionProxyConnection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATSessionProxyConnection;
  v9 = -[ATSessionProxyConnection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_connection, a4);
  }

  return v10;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ATSession addObserver:](self->_session, "addObserver:", self);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC696D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC71050);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v4);

  -[NSXPCConnection resume](self->_connection, "resume");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ATSession sessionTasks](self->_session, "sessionTasks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ATSessionProxyConnection session:didUpdateSessionTask:](self, "session:didUpdateSessionTask:", self->_session, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)stop
{
  -[ATSession removeObserver:](self->_session, "removeObserver:", self);
}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  NSXPCConnection *connection;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__ATSessionProxyConnection_session_willBeginSessionTask___block_invoke;
  v8[3] = &unk_1E928CBE0;
  v8[4] = self;
  v5 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseClassRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginSessionTask:", v7);
}

- (void)session:(id)a3 didUpdateSessionTask:(id)a4
{
  NSXPCConnection *connection;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__ATSessionProxyConnection_session_didUpdateSessionTask___block_invoke;
  v8[3] = &unk_1E928CBE0;
  v8[4] = self;
  v5 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseClassRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateSessionTask:", v7);
}

- (void)session:(id)a3 didFinishSessionTask:(id)a4
{
  NSXPCConnection *connection;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__ATSessionProxyConnection_session_didFinishSessionTask___block_invoke;
  v8[3] = &unk_1E928CBE0;
  v8[4] = self;
  v5 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseClassRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateSessionTask:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __57__ATSessionProxyConnection_session_didFinishSessionTask___block_invoke(uint64_t a1, void *a2)
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
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error %{public}@ notifying didFinishSessionTask", (uint8_t *)&v6, 0x16u);
  }

}

void __57__ATSessionProxyConnection_session_didUpdateSessionTask___block_invoke(uint64_t a1, void *a2)
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
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error %{public}@ notifying didUpdateSessionTask", (uint8_t *)&v6, 0x16u);
  }

}

void __57__ATSessionProxyConnection_session_willBeginSessionTask___block_invoke(uint64_t a1, void *a2)
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
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error %{public}@ notifying willBeginSessionTask", (uint8_t *)&v6, 0x16u);
  }

}

@end
