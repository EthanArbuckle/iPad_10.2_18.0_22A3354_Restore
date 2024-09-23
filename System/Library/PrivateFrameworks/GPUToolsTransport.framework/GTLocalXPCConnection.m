@implementation GTLocalXPCConnection

- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7;
  id v8;
  GTLocalXPCConnection *v9;
  GTLocalXPCConnection *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dispatchers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTLocalXPCConnection;
  v9 = -[GTLocalXPCConnection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
  }

  return v10;
}

- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7;
  id v8;
  GTLocalXPCConnection *v9;
  GTLocalXPCConnection *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dispatchers;
  uint64_t v13;
  OS_os_transaction *transaction;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GTLocalXPCConnection;
  v9 = -[GTLocalXPCConnection init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
    v13 = os_transaction_create();
    transaction = v10->_transaction;
    v10->_transaction = (OS_os_transaction *)v13;

  }
  return v10;
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
  id v6;
  NSObject *messageQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__GTLocalXPCConnection_registerDispatcher_forPort___block_invoke;
  block[3] = &unk_24F8281F8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(messageQueue, block);

}

void __51__GTLocalXPCConnection_registerDispatcher_forPort___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    v2 = a1[5];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, v3);

  }
}

- (unint64_t)registerDispatcher:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *messageQueue;
  id v7;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v4 = a3;
  do
    v5 = __ldaxr(&registerDispatcher__nextStreamId);
  while (__stlxr(v5 + 1, &registerDispatcher__nextStreamId));
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__GTLocalXPCConnection_registerDispatcher___block_invoke;
  block[3] = &unk_24F8281F8;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  dispatch_async(messageQueue, block);

  return v5;
}

void __43__GTLocalXPCConnection_registerDispatcher___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    v2 = a1[5];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, v3);

  }
}

- (void)deregisterDispatcher:(unint64_t)a3
{
  NSObject *messageQueue;
  _QWORD v4[6];

  messageQueue = self->_messageQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__GTLocalXPCConnection_deregisterDispatcher___block_invoke;
  v4[3] = &unk_24F828220;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(messageQueue, v4);
}

void __45__GTLocalXPCConnection_deregisterDispatcher___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectForKey:", v2);

  }
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *messageQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  GTLocalXPCConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__GTLocalXPCConnection_dispatchMessage_replyConnection___block_invoke;
  block[3] = &unk_24F827F08;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(messageQueue, block);

}

void __56__GTLocalXPCConnection_dispatchMessage_replyConnection___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t uint64;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (xpc_dictionary_get_flag(*(void **)(a1 + 32), "_flags", 1))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (IsServicePort(objc_msgSend(v7, "unsignedLongLongValue")))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "dispatchMessage:replyConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "_port");
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "dispatchMessage:replyConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)sendMessage:(id)a3
{
  xpc_connection_send_message(self->_connection, a3);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6;
  NSObject *v7;
  OS_xpc_object *connection;
  id v9;
  _QWORD handler[4];
  id v11;

  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__GTLocalXPCConnection_sendMessage_replyHandler___block_invoke;
  handler[3] = &unk_24F828248;
  v11 = v6;
  v9 = v6;
  xpc_connection_send_message_with_reply(connection, a3, v7, handler);

}

void __49__GTLocalXPCConnection_sendMessage_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL IsValid;
  id v5;
  id v6;

  v3 = a2;
  v6 = 0;
  IsValid = MessageIsValid(v3, &v6);
  v5 = v6;
  if (!IsValid)
  {

    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)sendMessageWithReplySync:(id)a3
{
  return xpc_connection_send_message_with_reply_sync(self->_connection, a3);
}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  -[GTLocalXPCConnection sendMessageWithReplySync:](self, "sendMessageWithReplySync:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (MessageIsValid(v5, a4))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  NSObject *v4;
  OS_xpc_object *connection;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD barrier[4];
  NSObject *v9;

  -[GTLocalXPCConnection sendMessage:](self, "sendMessage:", a3);
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  connection = self->_connection;
  barrier[0] = MEMORY[0x24BDAC760];
  barrier[1] = 3221225472;
  barrier[2] = __54__GTLocalXPCConnection_sendMessageAndWaitForDelivery___block_invoke;
  barrier[3] = &unk_24F827850;
  v9 = v4;
  v6 = v4;
  xpc_connection_send_barrier(connection, barrier);
  v7 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v6, v7);

}

void __54__GTLocalXPCConnection_sendMessageAndWaitForDelivery___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
  id v6;
  id v7;
  OS_xpc_object *connection;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke;
  v11[3] = &unk_24F828298;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  xpc_connection_set_event_handler(connection, v11);
  xpc_connection_activate(self->_connection);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke_2;
    v7[3] = &unk_24F828270;
    v8 = v3;
    v9 = v5;
    v10 = a1[4];
    v11 = a1[5];
    dispatch_async(v6, v7);

  }
}

_QWORD *__67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;

  if (MEMORY[0x22E30CF14](*(_QWORD *)(a1 + 32)) == MEMORY[0x24BDACFB8])
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 32));
    v2 = (_QWORD *)(a1 + 48);
  }
  else
  {
    v2 = (_QWORD *)(a1 + 56);
  }
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v2 + 16))(v2);
}

- (void)cancel
{
  NSObject *messageQueue;
  _QWORD block[5];

  xpc_connection_cancel(self->_connection);
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__GTLocalXPCConnection_cancel__block_invoke;
  block[3] = &unk_24F827850;
  block[4] = self;
  dispatch_async(messageQueue, block);
}

void __30__GTLocalXPCConnection_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

- (BOOL)isTrusted
{
  return 1;
}

- (OS_xpc_object)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchers, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
