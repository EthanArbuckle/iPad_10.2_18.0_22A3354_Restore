@implementation _GCAgentClientProxy

+ (id)clientProxyWithConnection:(id)a3 server:(id)a4 userDefaultsProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConnection:server:userDefaultsProxy:", v10, v9, v8);

  return v11;
}

- (id)_initWithConnection:(id)a3 server:(id)a4 userDefaultsProxy:(id)a5
{
  id v9;
  id v10;
  id v11;
  _GCAgentClientProxy *v12;
  _GCAgentClientProxy *v13;
  uint64_t v14;
  NSArray *invalidationHandlers;
  _GCAgentClientProxy *v16;
  void *v17;
  uint64_t v18;
  id connectionInvalidationRegistration;
  uint64_t v20;
  id connectionInterruptedRegistration;
  NSObject *v23;
  _QWORD v24[4];
  _GCAgentClientProxy *v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_GCAgentClientProxy;
  v12 = -[_GCAgentClientProxy init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_server, a4);
    objc_storeStrong((id *)&v13->_connection, a3);
    objc_storeWeak((id *)&v13->_userDefaultsProxy, v11);
    v14 = objc_opt_new();
    invalidationHandlers = v13->_invalidationHandlers;
    v13->_invalidationHandlers = (NSArray *)v14;

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68___GCAgentClientProxy__initWithConnection_server_userDefaultsProxy___block_invoke;
    v24[3] = &unk_24D2B2B20;
    v16 = v13;
    v25 = v16;
    v17 = (void *)MEMORY[0x2199DEBB0](v24);
    -[_GCIPCIncomingConnection addInvalidationHandler:](v13->_connection, "addInvalidationHandler:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    connectionInvalidationRegistration = v16->_connectionInvalidationRegistration;
    v16->_connectionInvalidationRegistration = (id)v18;

    -[_GCIPCIncomingConnection addInterruptionHandler:](v13->_connection, "addInterruptionHandler:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    connectionInterruptedRegistration = v16->_connectionInterruptedRegistration;
    v16->_connectionInterruptedRegistration = (id)v20;

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[_GCAgentClientProxy _initWithConnection:server:userDefaultsProxy:].cold.1((uint64_t)v16, v23);

    }
  }

  return v13;
}

- (_GCAgentClientProxy)init
{
  -[_GCAgentClientProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v5;
  objc_super v6;

  v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCAgentClientProxy.m"), 77, CFSTR("%@ is being deallocated, but is still valid."), self);

  }
  -[_GCAgentClientProxy _invalidate](self, "_invalidate");
  v6.receiver = self;
  v6.super_class = (Class)_GCAgentClientProxy;
  -[_GCAgentClientProxy dealloc](&v6, sel_dealloc);
}

- (id)description
{
  uint64_t v3;
  unsigned __int8 v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_class();
  v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v4 & 1) != 0)
    v5 = " (invalid)";
  else
    v5 = "";
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processIdentifier");
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@%s client.pid: %i, client.bundleIdentifier: %@>"), v3, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)redactedDescription
{
  uint64_t v3;
  unsigned __int8 v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_class();
  v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v4 & 1) != 0)
    v5 = " (invalid)";
  else
    v5 = "";
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processIdentifier");
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@%s client.pid: %i, client.bundleIdentifier: %@>"), v3, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  unsigned __int8 v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v5 & 1) != 0)
    v6 = " (invalid)";
  else
    v6 = "";
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "processIdentifier");
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p%s client.pid: %i, client.bundleIdentifier: %@>"), v4, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_invalidate
{
  BOOL *p_invalid;
  unsigned __int8 v3;
  _GCAgentClientProxy *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id connectionInterruptedRegistration;
  id connectionInvalidationRegistration;
  void **p_connection;
  _GCIPCIncomingConnection *connection;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  _GCAgentClientProxy *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_invalid = &self->_invalid;
  v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    atomic_store(1u, (unsigned __int8 *)p_invalid);
    -[_GCAgentClientProxy invalidationHandlers](v4, "invalidationHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "Agent client proxy invalidated: %@", buf, 0xCu);
      }

    }
    connectionInterruptedRegistration = v4->_connectionInterruptedRegistration;
    v4->_connectionInterruptedRegistration = 0;

    connectionInvalidationRegistration = v4->_connectionInvalidationRegistration;
    v4->_connectionInvalidationRegistration = 0;

    connection = v4->_connection;
    p_connection = (void **)&v4->_connection;
    -[_GCIPCIncomingConnection invalidate](connection, "invalidate");
    v14 = *p_connection;
    *p_connection = 0;

  }
}

- (void)pingWithReply:(id)a3
{
  id v3;
  id v4;
  _QWORD activity_block[4];
  id v6;

  v3 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __37___GCAgentClientProxy_pingWithReply___block_invoke;
  activity_block[3] = &unk_24D2B4AA8;
  v6 = v3;
  v4 = v3;
  _os_activity_initiate(&dword_215181000, "(App Client) Ping", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToUserDefaultsXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAgentClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __76___GCAgentClientProxy_connectToUserDefaultsXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'User Defaults XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToVideoRelocationXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAgentClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __79___GCAgentClientProxy_connectToVideoRelocationXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Video Relocation XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (NSArray)invalidationHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInvalidationHandlers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_destroyWeak((id *)&self->_userDefaultsProxy);
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)getTheLastGeneratedURLWithReply:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))a3 + 2))(a3, 0, 0, 0, 0);
}

- (void)userDefaultsCheckIn:(id)a3
{
  GCRemoteUserDefaultsProxy **p_userDefaultsProxy;
  id v5;
  id WeakRetained;

  p_userDefaultsProxy = &self->_userDefaultsProxy;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_userDefaultsProxy);
  objc_msgSend(WeakRetained, "userDefaultsCheckIn:effectiveUserIdentifier:", v5, -[_GCIPCIncomingConnection peerEffectiveUserIdentifier](self->_connection, "peerEffectiveUserIdentifier"));

}

- (void)observeUserDefaultsValueForKeyPath:(id)a3 change:(id)a4
{
  GCRemoteUserDefaultsProxy **p_userDefaultsProxy;
  id v6;
  id v7;
  id WeakRetained;

  p_userDefaultsProxy = &self->_userDefaultsProxy;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_userDefaultsProxy);
  objc_msgSend(WeakRetained, "observeUserDefaultsValueForKeyPath:change:", v7, v6);

}

- (GCRemoteUserDefaultsProxy)userDefaultsProxy
{
  return (GCRemoteUserDefaultsProxy *)objc_loadWeakRetained((id *)&self->_userDefaultsProxy);
}

- (void)_initWithConnection:(uint64_t)a1 server:(NSObject *)a2 userDefaultsProxy:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_215181000, a2, OS_LOG_TYPE_DEBUG, "Agent client proxy created: %@", (uint8_t *)&v2, 0xCu);
}

@end
