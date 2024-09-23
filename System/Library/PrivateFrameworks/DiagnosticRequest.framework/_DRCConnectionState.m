@implementation _DRCConnectionState

+ (id)sharedConnectionState
{
  if (sharedConnectionState_onceToken_0 != -1)
    dispatch_once(&sharedConnectionState_onceToken_0, &__block_literal_global_3);
  return (id)sharedConnectionState_connectionState_0;
}

- (BOOL)hasConnection
{
  void *v2;
  BOOL v3;

  -[_DRCConnectionState connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_DRCConnectionState)init
{
  _DRCConnectionState *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  NSObject *v5;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  void *v8;
  _xpc_connection_s *v9;
  _DRCConnectionState *v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  _xpc_connection_s *v13;
  _QWORD handler[4];
  _DRCConnectionState *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_DRCConnectionState;
  v2 = -[_DRCConnectionState init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("DiagnosticRequest service connection queue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    -[_DRCConnectionState connectionQueue](v2, "connectionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.service", v5, 0);
    connection = v2->_connection;
    v2->_connection = mach_service;

    -[_DRCConnectionState connection](v2, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_DRCConnectionState connection](v2, "connection");
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __27___DRCConnectionState_init__block_invoke;
      handler[3] = &unk_1E95530A8;
      v10 = v2;
      v16 = v10;
      xpc_connection_set_event_handler(v9, handler);

      -[_DRCConnectionState connection](v10, "connection");
      v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_context(v11, v10);

      -[_DRCConnectionState connection](v10, "connection");
      v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_finalizer_f(v12, (xpc_finalizer_t)_DRCConnectionStateFinalizer);

      -[_DRCConnectionState connection](v10, "connection");
      v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_activate(v13);

    }
  }
  return v2;
}

- (BOOL)sendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[_DRCConnectionState connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___DRCConnectionState_sendMessage___block_invoke;
  block[3] = &unk_1E95530D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)sendMessageWithReplySync:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[_DRCConnectionState connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48___DRCConnectionState_sendMessageWithReplySync___block_invoke;
  v9[3] = &unk_1E95530F8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  v6 = (_xpc_connection_s *)v11[5];
  if (v6)
    v7 = xpc_connection_send_message_with_reply_sync(v6, v4);
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
