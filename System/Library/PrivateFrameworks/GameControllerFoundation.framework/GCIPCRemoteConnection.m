@implementation GCIPCRemoteConnection

- (GCIPCRemoteConnection)initWithConnection:(id)a3
{
  id v5;
  GCIPCRemoteConnection *v6;
  GCIPCRemoteConnection *v7;
  uint64_t v8;
  NSArray *interruptionHandlers;
  uint64_t v10;
  NSArray *invalidationHandlers;
  GCIPCRemoteConnection *v12;
  NSXPCConnection *connection;
  uint64_t v14;
  GCIPCRemoteConnection *v15;
  NSXPCConnection *v16;
  GCIPCRemoteConnection *v17;
  _QWORD v19[4];
  GCIPCRemoteConnection *v20;
  _QWORD v21[4];
  GCIPCRemoteConnection *v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GCIPCRemoteConnection;
  v6 = -[GCIPCRemoteConnection init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_opt_new();
    interruptionHandlers = v7->_interruptionHandlers;
    v7->_interruptionHandlers = (NSArray *)v8;

    v10 = objc_opt_new();
    invalidationHandlers = v7->_invalidationHandlers;
    v7->_invalidationHandlers = (NSArray *)v10;

    atomic_store(0, (unsigned __int8 *)&v7->_invalid);
    v12 = v7;
    connection = v7->_connection;
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __44__GCIPCRemoteConnection_initWithConnection___block_invoke;
    v21[3] = &unk_1EA4D2DB8;
    v15 = v12;
    v22 = v15;
    -[NSXPCConnection setInterruptionHandler:](connection, "setInterruptionHandler:", v21);
    v16 = v7->_connection;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __44__GCIPCRemoteConnection_initWithConnection___block_invoke_1;
    v19[3] = &unk_1EA4D2DB8;
    v20 = v15;
    v17 = v15;
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v19);

  }
  return v7;
}

void __44__GCIPCRemoteConnection_initWithConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_activity_scope_state_s state;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_1DC79E000, "[IPC] Connection Interrupted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DC79E000, v3, OS_LOG_TYPE_INFO, "Connection interrupted: %@", buf, 0xCu);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "interruptionHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

  os_activity_scope_leave(&state);
}

void __44__GCIPCRemoteConnection_initWithConnection___block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_activity_scope_state_s state;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_1DC79E000, "[IPC] Connection Invalidated", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DC79E000, v3, OS_LOG_TYPE_INFO, "Connection invalidated: %@", buf, 0xCu);
  }

  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "invalidationHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v6, "reverseObjectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

  os_activity_scope_leave(&state);
}

- (GCIPCRemoteConnection)init
{
  -[GCIPCRemoteConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)resume
{
  -[NSXPCConnection resume](self->_connection, "resume");
}

- (void)suspend
{
  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)isInvalid
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInterruptionHandler:(id)a3
{
  void *v4;
  GCIPCRemoteConnection *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  _GCDisposable *v10;
  _GCDisposable *v11;
  _QWORD v13[5];
  id v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  v6 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if ((v6 & 1) != 0)
  {
    objc_sync_exit(v5);

    v11 = 0;
  }
  else
  {
    -[GCIPCRemoteConnection interruptionHandlers](v5, "interruptionHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v9 = _Block_copy(v4);
    objc_msgSend(v8, "addObject:", v9);

    -[GCIPCRemoteConnection setInterruptionHandlers:](v5, "setInterruptionHandlers:", v8);
    objc_sync_exit(v5);

    v10 = [_GCDisposable alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__GCIPCRemoteConnection_addInterruptionHandler___block_invoke;
    v13[3] = &unk_1EA4D3408;
    v13[4] = v5;
    v14 = v4;
    v11 = -[_GCDisposable initWithCleanupHandler:](v10, "initWithCleanupHandler:", v13);

  }
  return v11;
}

void __48__GCIPCRemoteConnection_addInterruptionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "interruptionHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v3, "removeObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandlers:", v3);
  objc_sync_exit(obj);

}

- (id)addInvalidationHandler:(id)a3
{
  void *v4;
  GCIPCRemoteConnection *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  _GCDisposable *v10;
  _GCDisposable *v11;
  _QWORD v13[5];
  id v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  v6 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if ((v6 & 1) != 0)
  {
    objc_sync_exit(v5);

    v11 = 0;
  }
  else
  {
    -[GCIPCRemoteConnection invalidationHandlers](v5, "invalidationHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v9 = _Block_copy(v4);
    objc_msgSend(v8, "addObject:", v9);

    -[GCIPCRemoteConnection setInvalidationHandlers:](v5, "setInvalidationHandlers:", v8);
    objc_sync_exit(v5);

    v10 = [_GCDisposable alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__GCIPCRemoteConnection_addInvalidationHandler___block_invoke;
    v13[3] = &unk_1EA4D3408;
    v13[4] = v5;
    v14 = v4;
    v11 = -[_GCDisposable initWithCleanupHandler:](v10, "initWithCleanupHandler:", v13);

  }
  return v11;
}

void __48__GCIPCRemoteConnection_addInvalidationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "invalidationHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v3, "removeObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandlers:", v3);
  objc_sync_exit(obj);

}

- ($115C4C562B26FF47E01F9F4EA65B5887)peerAuditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[GCIPCRemoteConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (int)peerAuditSessionIdentifier
{
  void *v2;
  int v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "auditSessionIdentifier");

  return v3;
}

- (int)peerProcessIdentifier
{
  void *v2;
  int v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (unsigned)peerEffectiveUserIdentifier
{
  void *v2;
  unsigned int v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveUserIdentifier");

  return v3;
}

- (unsigned)peerEffectiveGroupIdentifier
{
  void *v2;
  unsigned int v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveGroupIdentifier");

  return v3;
}

- (NSString)peerBundleIdentifier
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection gc_peerBundleIdentifier]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)peerValueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)scheduleSendBarrierBlock:(id)a3
{
  -[NSXPCConnection scheduleSendBarrierBlock:](self->_connection, "scheduleSendBarrierBlock:", a3);
}

- (id)remoteProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)remoteProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)synchronousRemoteProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)isEqualToConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GCIPCRemoteConnection isEqualToConnection:](self, "isEqualToConnection:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  uint64_t v3;
  unsigned __int8 v4;
  const char *v5;

  v3 = objc_opt_class();
  v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v4 & 1) != 0)
    v5 = " (invalid)";
  else
    v5 = "";
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@%s remote.pid: %i>"), v3, v5, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
}

- (id)redactedDescription
{
  uint64_t v3;
  unsigned __int8 v4;
  const char *v5;

  v3 = objc_opt_class();
  v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v4 & 1) != 0)
    v5 = " (invalid)";
  else
    v5 = "";
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@%s remote.pid: %i>"), v3, v5, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  unsigned __int8 v5;
  const char *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v5 & 1) != 0)
    v6 = " (invalid)";
  else
    v6 = "";
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p%s remote.pid: %i>"), v4, self, v6, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSArray)interruptionHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInterruptionHandlers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)invalidationHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInvalidationHandlers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong((id *)&self->_interruptionHandlers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
