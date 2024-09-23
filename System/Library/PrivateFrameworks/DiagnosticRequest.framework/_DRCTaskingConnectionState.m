@implementation _DRCTaskingConnectionState

- (id)sendMessageWithReplySync:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  xpc_object_t v7;
  uint8_t v9[16];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[_DRCTaskingConnectionState connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___DRCTaskingConnectionState_sendMessageWithReplySync___block_invoke;
  block[3] = &unk_1E95530F8;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v12 + 24))
  {
    DPLogHandle_ClientTaskingXPCError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MessageSendFailed", "Message send failed due to closed connection to tasking service", v9, 2u);
    }
    v7 = 0;
  }
  else
  {
    -[_DRCTaskingConnectionState connection](self, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v6, v4);
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (_DRCTaskingConnectionState)init
{
  _DRCTaskingConnectionState *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  NSObject *v5;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  void *v8;
  _xpc_connection_s *v9;
  _DRCTaskingConnectionState *v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  _xpc_connection_s *v13;
  _QWORD handler[4];
  _DRCTaskingConnectionState *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_DRCTaskingConnectionState;
  v2 = -[_DRCTaskingConnectionState init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("DiagnosticRequest tasking service connection queue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    -[_DRCTaskingConnectionState connectionQueue](v2, "connectionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.tasking.service", v5, 0);
    connection = v2->_connection;
    v2->_connection = mach_service;

    v2->_isClosed = 0;
    -[_DRCTaskingConnectionState connection](v2, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_DRCTaskingConnectionState connection](v2, "connection");
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34___DRCTaskingConnectionState_init__block_invoke;
      handler[3] = &unk_1E95530A8;
      v10 = v2;
      v16 = v10;
      xpc_connection_set_event_handler(v9, handler);

      -[_DRCTaskingConnectionState connection](v10, "connection");
      v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_context(v11, v10);

      -[_DRCTaskingConnectionState connection](v10, "connection");
      v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_finalizer_f(v12, (xpc_finalizer_t)_DRCTaskingConnectionStateFinalizer);

      -[_DRCTaskingConnectionState connection](v10, "connection");
      v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_activate(v13);

    }
  }
  return v2;
}

+ (id)sharedConnectionState
{
  if (sharedConnectionState_onceToken != -1)
    dispatch_once(&sharedConnectionState_onceToken, &__block_literal_global);
  return (id)sharedConnectionState_connectionState;
}

- (void)cleanupState
{
  _xpc_connection_s *v3;
  OS_xpc_object *connection;

  if (!-[_DRCTaskingConnectionState isClosed](self, "isClosed"))
  {
    self->_isClosed = 1;
    -[_DRCTaskingConnectionState connection](self, "connection");
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v3);

    connection = self->_connection;
    self->_connection = 0;

  }
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
  -[_DRCTaskingConnectionState connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___DRCTaskingConnectionState_sendMessage___block_invoke;
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

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (OS_xpc_object)connection
{
  return self->_connection;
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
