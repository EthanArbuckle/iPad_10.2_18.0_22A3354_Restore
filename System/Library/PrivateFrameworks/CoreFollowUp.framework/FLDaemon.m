@implementation FLDaemon

void __26__FLDaemon_sharedInstance__block_invoke()
{
  FLDaemon *v0;
  void *v1;

  v0 = objc_alloc_init(FLDaemon);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (FLDaemon)init
{
  FLDaemon *v2;
  NSLock *v3;
  NSLock *connLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FLDaemon;
  v2 = -[FLDaemon init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    connLock = v2->_connLock;
    v2->_connLock = v3;

  }
  return v2;
}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FLDaemon connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  return (id)sharedInstance_instance_0;
}

- (id)connection
{
  NSXPCConnection *conn;
  NSXPCListenerEndpoint *daemonXPCEndpoint;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  NSXPCConnection *v12;
  NSXPCConnection *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  FLDaemon *v18;

  -[NSLock lock](self->_connLock, "lock");
  conn = self->_conn;
  if (!conn)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (daemonXPCEndpoint)
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithListenerEndpoint:", self->_daemonXPCEndpoint);
    else
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.corefollowup.agent"), 0);
    v7 = self->_conn;
    self->_conn = v6;

    v8 = self->_conn;
    -[FLDaemon remoteObjectInterface](self, "remoteObjectInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__2;
    v17[4] = __Block_byref_object_dispose__2;
    v18 = self;
    v10 = MEMORY[0x1E0C809B0];
    v11 = self->_conn;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __22__FLDaemon_connection__block_invoke;
    v16[3] = &unk_1E6F1E5D8;
    v16[4] = v17;
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v16);
    v12 = self->_conn;
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __22__FLDaemon_connection__block_invoke_6;
    v15[3] = &unk_1E6F1E5D8;
    v15[4] = v17;
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v15);
    -[NSXPCConnection resume](self->_conn, "resume");
    _Block_object_dispose(v17, 8);

    conn = self->_conn;
  }
  v13 = conn;
  -[NSLock unlock](self->_connLock, "unlock");
  return v13;
}

- (id)remoteObjectInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1E5E60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_pendingFollowUpItemsForClientIdentifier_completion_, 0, 1);

  return v2;
}

+ (id)daemonWithErrorHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemonWithErrorHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FLDaemon;
  -[FLDaemon dealloc](&v3, sel_dealloc);
}

uint64_t __22__FLDaemon_connection__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v1 = result + 32;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    _FLLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __22__FLDaemon_connection__block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 16), "lock");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 8), "invalidate");
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 16), "unlock");
  }
  return result;
}

uint64_t __22__FLDaemon_connection__block_invoke_6(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v1 = result + 32;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    _FLLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __22__FLDaemon_connection__block_invoke_6_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 16), "lock");
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 16), "unlock");
  }
  return result;
}

- (void)setDaemonXPCEndpoint:(id)a3
{
  NSXPCListenerEndpoint *v4;
  NSXPCListenerEndpoint *daemonXPCEndpoint;
  NSXPCListenerEndpoint *v6;

  v4 = (NSXPCListenerEndpoint *)a3;
  -[FLDaemon invalidateConnection](self, "invalidateConnection");
  -[NSLock lock](self->_connLock, "lock");
  daemonXPCEndpoint = self->_daemonXPCEndpoint;
  self->_daemonXPCEndpoint = v4;
  v6 = v4;

  -[NSLock unlock](self->_connLock, "unlock");
}

- (void)invalidateConnection
{
  NSXPCConnection *conn;

  -[NSLock lock](self->_connLock, "lock");
  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  conn = self->_conn;
  self->_conn = 0;

  -[NSLock unlock](self->_connLock, "unlock");
}

- (FLDaemon)daemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FLDaemon connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (FLDaemon *)v6;
}

- (NSXPCListenerEndpoint)daemonXPCEndpoint
{
  return self->_daemonXPCEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_connLock, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

void __22__FLDaemon_connection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "%@: Daemon connection interrupted", v2, v3, v4, v5, 2u);
}

void __22__FLDaemon_connection__block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "%@: Daemon connection invalidated", v2, v3, v4, v5, 2u);
}

@end
