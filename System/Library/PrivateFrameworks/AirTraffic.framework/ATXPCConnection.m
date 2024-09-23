@implementation ATXPCConnection

- (ATXPCConnection)initWithServiceName:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  ATXPCConnection *v8;
  ATXPCConnection *v9;
  const char *v10;
  NSObject *v11;
  xpc_connection_t mach_service;
  OS_xpc_object *conn;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXPCConnection;
  v8 = -[ATXPCConnection init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventQueue, a4);
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    -[ATXPCConnection eventQueue](v9, "eventQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service(v10, v11, 0);
    conn = v9->_conn;
    v9->_conn = mach_service;

    -[ATXPCConnection _setEventHandlerOnConnection:](v9, "_setEventHandlerOnConnection:", v9->_conn);
    xpc_connection_resume(v9->_conn);
  }

  return v9;
}

- (ATXPCConnection)initWithXPCConnection:(id)a3
{
  id v6;
  ATXPCConnection *v7;
  ATXPCConnection *v8;
  _xpc_connection_s *conn;
  NSObject *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPCConnection.m"), 72, CFSTR("Must have xpc_connection"));

  }
  v13.receiver = self;
  v13.super_class = (Class)ATXPCConnection;
  v7 = -[ATXPCConnection init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_conn, a3);
    conn = v8->_conn;
    -[ATXPCConnection eventQueue](v8, "eventQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(conn, v10);

    -[ATXPCConnection _setEventHandlerOnConnection:](v8, "_setEventHandlerOnConnection:", v8->_conn);
    xpc_connection_resume(v8->_conn);
  }

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "ATXPCConnection dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)ATXPCConnection;
  -[ATXPCConnection dealloc](&v4, sel_dealloc);
}

- (NSString)serviceName
{
  _xpc_connection_s *conn;

  conn = self->_conn;
  if (conn)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_connection_get_name(conn));
    conn = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)conn;
}

- (id)eventQueue
{
  OS_dispatch_queue *eventQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  eventQueue = self->_eventQueue;
  if (!eventQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.atc.XPCEvent", 0);
    v5 = self->_eventQueue;
    self->_eventQueue = v4;

    eventQueue = self->_eventQueue;
  }
  return eventQueue;
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  OS_xpc_object *conn;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPCConnection.m"), 99, CFSTR("Message must have a name"));

  }
  if (self->_conn)
  {
    objc_msgSend(v7, "_createXPCMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      conn = self->_conn;
      if (v8)
      {
        dispatch_get_global_queue(2, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message_with_reply(conn, v10, v12, v8);

      }
      else
      {
        xpc_connection_send_message(conn, v10);
      }
    }

  }
  else
  {
    v13 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_20BB5D000, v13, OS_LOG_TYPE_ERROR, "Sending message without a connection: %{public}@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)sendMessage:(id)a3
{
  -[ATXPCConnection _sendMessage:handler:](self, "_sendMessage:handler:", a3, 0);
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ATXPCConnection *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __41__ATXPCConnection_sendMessage_withReply___block_invoke;
      v13 = &unk_24C4CA2D8;
      v14 = self;
      v15 = v7;
      v9 = MEMORY[0x20BD3C8B4](&v10);

    }
    else
    {
      v9 = 0;
    }
    -[ATXPCConnection _sendMessage:handler:](self, "_sendMessage:handler:", v6, v9, v10, v11, v12, v13);
  }
  else
  {
    v9 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BB5D000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring request to send a nil message", buf, 2u);
    }
  }

}

- (void)_handleXPCError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *string;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void (**disconnectHandler)(id, _QWORD);
  int v13;
  ATXPCConnection *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 == (id)MEMORY[0x24BDACF30])
  {
    v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v13 = 138543362;
    v14 = self;
    v10 = "XPC Connection interrupted %{public}@";
    goto LABEL_11;
  }
  v5 = (id)MEMORY[0x24BDACF38];
  v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v4 != v5)
  {
    if (v7)
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF40]);
      v9 = "Unknown error";
      if (string)
        v9 = string;
      v13 = 136315138;
      v14 = (ATXPCConnection *)v9;
      _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_ERROR, "Error: %s", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_14;
  }
  if (v7)
  {
    v13 = 138543362;
    v14 = self;
    v10 = "XPC Connection invalid %{public}@";
LABEL_11:
    _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0xCu);
  }
LABEL_12:

  disconnectHandler = (void (**)(id, _QWORD))self->_disconnectHandler;
  if (disconnectHandler)
  {
    disconnectHandler[2](disconnectHandler, v11);
    v6 = self->_disconnectHandler;
    self->_disconnectHandler = 0;
LABEL_14:

  }
}

- (void)shutdown
{
  NSObject *v3;
  OS_xpc_object *conn;
  _QWORD barrier[5];
  uint8_t buf[4];
  ATXPCConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "Shutdown called on XPC connection %{public}@", buf, 0xCu);
  }

  conn = self->_conn;
  if (conn)
  {
    barrier[0] = MEMORY[0x24BDAC760];
    barrier[1] = 3221225472;
    barrier[2] = __27__ATXPCConnection_shutdown__block_invoke;
    barrier[3] = &unk_24C4CA300;
    barrier[4] = self;
    xpc_connection_send_barrier(conn, barrier);
  }
}

- (void)_handleXPCMessage:(id)a3
{
  id v4;
  id v5;

  if (self->_messageHandler)
  {
    v4 = a3;
    v5 = -[ATXPCMessage _initWithXPCMessage:onConnection:]([ATXPCMessage alloc], "_initWithXPCMessage:onConnection:", v4, self);

    (*((void (**)(void))self->_messageHandler + 2))();
  }
}

- (void)_handleLockdownMessage:(void *)a3
{
  void (**lockdownHandler)(id, void *);

  lockdownHandler = (void (**)(id, void *))self->_lockdownHandler;
  if (lockdownHandler)
    lockdownHandler[2](lockdownHandler, a3);
}

- (void)_setEventHandlerOnConnection:(id)a3
{
  _xpc_connection_s *v4;
  _QWORD handler[5];
  _QWORD v6[5];
  ATXPCConnection *v7;

  v4 = (_xpc_connection_s *)a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__1545;
  v6[4] = __Block_byref_object_dispose__1546;
  v7 = self;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __48__ATXPCConnection__setEventHandlerOnConnection___block_invoke;
  handler[3] = &unk_24C4CA328;
  handler[4] = v6;
  xpc_connection_set_event_handler(v4, handler);
  _Block_object_dispose(v6, 8);

}

- (void)_registerMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ATXPCConnection eventQueue](self, "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ATXPCConnection__registerMessage___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_removeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ATXPCConnection eventQueue](self, "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__ATXPCConnection__removeMessage___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (unint64_t)_outstandingMessages
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ATXPCConnection eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__ATXPCConnection__outstandingMessages__block_invoke;
  v6[3] = &unk_24C4CA378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)lockdownHandler
{
  return self->_lockdownHandler;
}

- (void)setLockdownHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)assertionHeld
{
  return self->_assertionHeld;
}

- (void)setAssertionHeld:(BOOL)a3
{
  self->_assertionHeld = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_lockdownHandler, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

uint64_t __39__ATXPCConnection__outstandingMessages__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __34__ATXPCConnection__removeMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__ATXPCConnection__registerMessage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __48__ATXPCConnection__setEventHandlerOnConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  CFTypeRef cf[4];

  cf[3] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x20BD3CAB8]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleXPCError:", v3);
  }
  else
  {
    v5 = v4;
    if (v4 == MEMORY[0x24BDACFA0])
    {
      cf[0] = 0;
      v7 = lockdown_copy_checkin_info();
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (v7)
      {
        objc_msgSend(v8, "_handleXPCMessage:", v3);
      }
      else
      {
        objc_msgSend(v8, "_handleLockdownMessage:", cf[0]);
        CFRelease(cf[0]);
      }
    }
    else
    {
      v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(cf[0]) = 136315138;
        *(CFTypeRef *)((char *)cf + 4) = _StringForXPCType(v5);
        _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring unexpected event of type %s", (uint8_t *)cf, 0xCu);
      }

    }
  }

}

void __27__ATXPCConnection_shutdown__block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
}

void __41__ATXPCConnection_sendMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *string;
  const char *v9;
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x20BD3CAB8]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
      v9 = "Unknown error";
      if (string)
        v9 = string;
      v11 = 136315138;
      v12 = v9;
      _os_log_impl(&dword_20BB5D000, v7, OS_LOG_TYPE_ERROR, "Reply Error: %s", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = v4;
    if (v4 == MEMORY[0x24BDACFA0])
    {
      v10 = -[ATXPCMessage _initWithXPCMessage:onConnection:]([ATXPCMessage alloc], "_initWithXPCMessage:onConnection:", v3, *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = _StringForXPCType(v5);
        _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring unexpected event of type %s", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

@end
