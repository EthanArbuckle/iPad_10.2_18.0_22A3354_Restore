@implementation SKXPCConnection

- (id)_initSKXPCConnection
{
  SKXPCConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKXPCConnection;
  v2 = -[SKXPCConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreKit.SKXPCConnection", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (SKXPCConnection)init
{
  return -[SKXPCConnection initWithServiceName:](self, "initWithServiceName:", 0);
}

- (SKXPCConnection)initWithServiceName:(id)a3
{
  const char *v4;
  xpc_connection_t v5;
  SKXPCConnection *v6;

  if (a3)
    v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  else
    v4 = 0;
  v5 = xpc_connection_create(v4, 0);
  xpc_connection_set_legacy();
  v6 = -[SKXPCConnection initWithXPCConnection:](self, "initWithXPCConnection:", v5);

  return v6;
}

- (SKXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  id *v6;
  SKXPCConnection *v7;

  v5 = a3;
  v6 = -[SKXPCConnection _initSKXPCConnection](self, "_initSKXPCConnection");
  v7 = (SKXPCConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    -[SKXPCConnection _reloadEventHandler](v7, "_reloadEventHandler");
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (id)createXPCEndpoint
{
  return xpc_endpoint_create(self->_connection);
}

- (id)disconnectBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SKXPCConnection_disconnectBlock__block_invoke;
  v5[3] = &unk_1E5B27380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SKXPCConnection_disconnectBlock__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)messageBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SKXPCConnection_messageBlock__block_invoke;
  v5[3] = &unk_1E5B27380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__SKXPCConnection_messageBlock__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)sendMessage:(id)a3
{
  xpc_connection_send_message(self->_connection, a3);
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  OS_xpc_object *connection;
  NSObject *v7;

  connection = self->_connection;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message_with_reply(connection, a3, v7, a4);

}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SKXPCConnection_sendSynchronousMessage_withReply___block_invoke;
  v11[3] = &unk_1E5B273A8;
  v12 = v8;
  v13 = v6;
  v9 = v8;
  v10 = v6;
  -[SKXPCConnection sendMessage:withReply:](self, "sendMessage:withReply:", v7, v11);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __52__SKXPCConnection_sendSynchronousMessage_withReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setDisconnectBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SKXPCConnection_setDisconnectBlock___block_invoke;
  block[3] = &unk_1E5B273D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void *__38__SKXPCConnection_setDisconnectBlock___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != result)
  {
    v4 = objc_msgSend(result, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    return (void *)objc_msgSend(*(id *)(a1 + 32), "_reloadEventHandler");
  }
  return result;
}

- (void)setMessageBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SKXPCConnection_setMessageBlock___block_invoke;
  block[3] = &unk_1E5B273D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void *__35__SKXPCConnection_setMessageBlock___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 32) != result)
  {
    v4 = objc_msgSend(result, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    return (void *)objc_msgSend(*(id *)(a1 + 32), "_reloadEventHandler");
  }
  return result;
}

- (void)_reloadEventHandler
{
  void *v3;
  void *v4;
  OS_xpc_object *connection;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = _Block_copy(self->_disconnectBlock);
  v4 = _Block_copy(self->_messageBlock);
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SKXPCConnection__reloadEventHandler__block_invoke;
  v8[3] = &unk_1E5B27420;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  xpc_connection_set_event_handler(connection, v8);

}

void __38__SKXPCConnection__reloadEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  id v7;
  _QWORD handler[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }
  else if (MEMORY[0x1AF43BC3C](v3) == MEMORY[0x1E0C812E0])
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__SKXPCConnection__reloadEventHandler__block_invoke_2;
    handler[3] = &unk_1E5B273F8;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v7 = v4;
    v9 = v7;
    xpc_connection_set_event_handler((xpc_connection_t)v7, handler);
    xpc_connection_resume((xpc_connection_t)v7);

  }
}

void __38__SKXPCConnection__reloadEventHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      goto LABEL_9;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
LABEL_9:
      v7 = v4;
      (*(void (**)(void))(v6 + 16))();
      v4 = v7;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageBlock, 0);
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
