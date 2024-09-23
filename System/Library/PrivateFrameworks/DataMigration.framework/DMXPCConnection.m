@implementation DMXPCConnection

uint64_t __38__DMXPCConnection_initWithConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMessage:", a2);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

uint64_t __39__DMXPCConnection_initWithServiceName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMessage:", a2);
}

- (void)_handleMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  void (**messageHandler)(id, id);
  id v7;

  v7 = a3;
  v4 = MEMORY[0x1D824E4C4]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    messageHandler = (void (**)(id, id))self->_messageHandler;
    if (!messageHandler)
    {
      -[DMXPCConnection handleMessage:](self, "handleMessage:", v7);
LABEL_11:
      v5 = v7;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v5 = v7;
  if (v4 != MEMORY[0x1E0C81310])
    goto LABEL_12;
  if (v7 == (id)MEMORY[0x1E0C81258])
  {
    messageHandler = (void (**)(id, id))self->_interruptionHandler;
    if (!messageHandler)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v7 == (id)MEMORY[0x1E0C81260])
  {
    messageHandler = (void (**)(id, id))self->_invalidationHandler;
    if (messageHandler)
    {
LABEL_10:
      messageHandler[2](messageHandler, v7);
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (DMXPCConnection)initWithConnection:(id)a3
{
  _xpc_connection_s *v5;
  DMXPCConnection *v6;
  DMXPCConnection *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  _QWORD handler[4];
  DMXPCConnection *v12;
  objc_super v13;

  v5 = (_xpc_connection_s *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DMXPCConnection;
  v6 = -[DMXPCConnection init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = dispatch_queue_create("com.apple.dmxpcservice.client", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    xpc_connection_set_target_queue(v5, (dispatch_queue_t)v7->_queue);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__DMXPCConnection_initWithConnection___block_invoke;
    handler[3] = &unk_1E951EFC0;
    v12 = v7;
    xpc_connection_set_event_handler(v5, handler);

  }
  return v7;
}

- (void)invalidate
{
  xpc_connection_cancel(self->_connection);
}

- (id)sendMessageSync:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;

  v4 = a3;
  -[DMXPCConnection connection](self, "connection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_connection_send_message_with_reply_sync(v5, v4);

  return v6;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)resume
{
  xpc_connection_resume(self->_connection);
}

- (void)targetForegroundUserSessionIfNecessary
{
  uint64_t v2;

  if (xpc_user_sessions_enabled())
  {
    xpc_user_sessions_get_foreground_uid();
    _DMLogFunc(v2, 7, CFSTR("targeting foreground user session for uid %d"));
    xpc_connection_set_target_user_session_uid();
  }
}

- (DMXPCConnection)initWithServiceName:(id)a3
{
  uint64_t v3;
  id v5;
  DMXPCConnection *v6;
  DMXPCConnection *v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *replyQueue;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  _xpc_connection_s *v18;
  _xpc_connection_s *v19;
  DMXPCConnection *v20;
  _QWORD handler[4];
  DMXPCConnection *v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DMXPCConnection;
  v6 = -[DMXPCConnection init](&v24, sel_init);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.dmxpcservice.%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.dmxpcservice.reply.%@"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v8);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_retainAutorelease(v9);
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v14;

    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), (dispatch_queue_t)v7->_queue, 0);
    connection = v7->_connection;
    v7->_connection = mach_service;

    _DMLogFunc(v3, 7, CFSTR("DMXPCConnection created connection %p"));
    v18 = v7->_connection;
    if (v18)
    {
      xpc_connection_set_target_queue(v18, (dispatch_queue_t)v7->_queue);
      v19 = v7->_connection;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __39__DMXPCConnection_initWithServiceName___block_invoke;
      handler[3] = &unk_1E951EFC0;
      v20 = v7;
      v23 = v20;
      xpc_connection_set_event_handler(v19, handler);
      v7 = v23;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  _xpc_connection_s *v8;
  NSObject *replyQueue;
  id v10;
  _QWORD handler[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[DMXPCConnection connection](self, "connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  replyQueue = self->_replyQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__DMXPCConnection_sendMessage_replyHandler___block_invoke;
  handler[3] = &unk_1E951EFE8;
  v12 = v6;
  v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, replyQueue, handler);

}

uint64_t __44__DMXPCConnection_sendMessage_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasEntitlement:(id)a3
{
  uint64_t v3;
  __CFString *v5;
  void *v6;
  const __CFAllocator *v7;
  __SecTask *v8;
  __SecTask *v9;
  CFTypeRef v10;
  CFTypeID v11;
  BOOL v12;
  audit_token_t token;
  __int128 v15;
  __int128 v16;

  v5 = (__CFString *)a3;
  v15 = 0u;
  v16 = 0u;
  -[DMXPCConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_get_audit_token();

  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  memset(&token, 0, sizeof(token));
  v8 = SecTaskCreateWithAuditToken(v7, &token);
  if (v8)
  {
    v9 = v8;
    *(_QWORD *)token.val = 0;
    v10 = SecTaskCopyValueForEntitlement(v8, v5, (CFErrorRef *)&token);
    if (*(_QWORD *)token.val)
      _DMLogFunc(v3, 3, CFSTR("hasEntitlement: %@ did fail to copy value with error %@"));
    if (v10)
    {
      v11 = CFGetTypeID(v10);
      v12 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v10) != 0;
      CFRelease(v10);
      _DMLogFunc(v3, 7, CFSTR("hasEntitlement: %@ did get value %d"));
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    _DMLogFunc(v3, 3, CFSTR("hasEntitlement: %@ did fail to create SecTask"));
    v12 = 0;
  }

  return v12;
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)messageHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

@end
