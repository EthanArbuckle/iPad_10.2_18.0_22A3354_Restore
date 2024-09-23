@implementation GEOXPCConnection

uint64_t __108__GEOXPCConnection_initServerConnectionFor_debugIdentifier_queue_creationBlock_reconnectBlock_eventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconnectIsolated");
}

- (void)sendMessage:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _xpc_connection_s *v11;
  void *v12;
  _QWORD handler[5];
  id v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[GEOXPCConnection xpcConnection](self, "xpcConnection");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v11);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke_2;
      handler[3] = &unk_1E1C09400;
      handler[4] = self;
      v14 = v10;
      xpc_connection_send_message_with_reply(v11, v8, v9, handler);
      v12 = v14;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke;
      block[3] = &unk_1E1C01F48;
      v16 = v10;
      dispatch_async(v9, block);
      v12 = v16;
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", buf, 2u);
  }

}

- (id)sendMessageWithReplySync:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  uint8_t v8[16];

  v4 = a3;
  if (v4)
  {
    -[GEOXPCConnection xpcConnection](self, "xpcConnection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v5);
      v6 = xpc_connection_send_message_with_reply_sync(v5, v4);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", v8, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (void)sendMessage:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  NSObject *queue;
  _QWORD handler[5];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[GEOXPCConnection xpcConnection](self, "xpcConnection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v5);
      queue = self->_queue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __32__GEOXPCConnection_sendMessage___block_invoke;
      handler[3] = &unk_1E1C093A8;
      handler[4] = self;
      xpc_connection_send_message_with_reply(v5, v4, queue, handler);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", buf, 2u);
  }

}

- (void)_sendGreetingIfNeeded:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: connection != ((void *)0)", buf, 2u);
    }
    goto LABEL_10;
  }
  if (self->_greetingSent || !self->_creationBlock)
  {
LABEL_10:

    return;
  }
  self->_greetingSent = 1;
  GEOXPCServerIdentifierForType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    v7 = objc_retainAutorelease(v5);
    xpc_dictionary_set_string(v6, "peer_server_identifier", (const char *)objc_msgSend(v7, "UTF8String"));
    if (-[NSString length](self->_debugIdentifier, "length"))
      xpc_dictionary_set_string(v6, "peer_debug_identifier", -[NSString UTF8String](self->_debugIdentifier, "UTF8String"));
    xpc_connection_send_message((xpc_connection_t)v4, v6);
    if (self->_reconnectBlock)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__GEOXPCConnection__sendGreetingIfNeeded___block_invoke;
      block[3] = &unk_1E1BFF6F8;
      block[4] = self;
      dispatch_async(queue, block);
    }

    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: serverIdentifier.length > 0", buf, 2u);
  }
  __break(1u);
}

- (OS_xpc_object)xpcConnection
{
  void *xpcConnection;
  id v4;
  geo_isolater *v6;

  v6 = self->_connectionIsolater;
  _geo_isolate_lock_data();
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    xpcConnection = self->_creationBlock;
    if (xpcConnection)
    {
      if (self->_reconnectAutomatically)
      {
        -[GEOXPCConnection _reconnectIsolated](self, "_reconnectIsolated");
        xpcConnection = self->_xpcConnection;
      }
      else
      {
        xpcConnection = 0;
      }
    }
  }
  v4 = xpcConnection;
  _geo_isolate_unlock();

  return (OS_xpc_object *)v4;
}

uint64_t __35__GEOXPCConnection__barrierIsReady__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "geoXPCConnectionIsReadyToSend:", *(_QWORD *)(a1 + 40));
}

- (void)_reconnectIsolated
{
  void (**creationBlock)(id, OS_dispatch_queue *, const char *);
  OS_xpc_object *v4;
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  geo_assert_isolated();
  if (!self->_xpcConnection)
  {
    creationBlock = (void (**)(id, OS_dispatch_queue *, const char *))self->_creationBlock;
    if (creationBlock)
    {
      creationBlock[2](creationBlock, self->_queue, "com.apple.geod");
      v4 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
      xpcConnection = self->_xpcConnection;
      self->_xpcConnection = v4;

      if (self->_xpcConnection)
      {
        objc_initWeak(&location, self);
        v6 = self->_xpcConnection;
        v7 = MEMORY[0x1E0C809B0];
        v8 = 3221225472;
        v9 = __38__GEOXPCConnection__reconnectIsolated__block_invoke;
        v10 = &unk_1E1C07998;
        objc_copyWeak(&v11, &location);
        xpc_connection_set_event_handler(v6, &v7);
        xpc_connection_activate(self->_xpcConnection);
        -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", self->_xpcConnection, v7, v8, v9, v10);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __38__GEOXPCConnection__reconnectIsolated__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_9;
  if (v5 == (id)MEMORY[0x1E0C81258])
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_71);
  }
  else if (v5 != (id)MEMORY[0x1E0C81260])
  {
    goto LABEL_7;
  }
  geo_isolate_sync_data();
LABEL_7:
  v4 = WeakRetained[6];
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
LABEL_9:

}

void __25__GEOXPCConnection_close__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    xpc_connection_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

  }
}

void __56__GEOXPCConnection_initiateBarrierIfNecessary_delegate___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *global_queue;

  v2 = *(void **)(a1[4] + 64);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

    v2 = *(void **)(a1[4] + 64);
  }
  v6 = a1[5];
  if (v6)
  {
    objc_msgSend(v2, "setObject:forKey:", v6, a1[6]);
  }
  else
  {
    global_queue = (void *)geo_get_global_queue();
    objc_msgSend(v2, "setObject:forKey:", global_queue, a1[6]);

  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 56) ^ 1;
  *(_BYTE *)(a1[4] + 56) = 1;
}

void __35__GEOXPCConnection__barrierIsReady__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOXPCConnection close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)GEOXPCConnection;
  -[GEOXPCConnection dealloc](&v3, sel_dealloc);
}

- (void)close
{
  if (self->_xpcConnection)
    geo_isolate_sync();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reconnectBlock, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_barrierDelegates, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_connectionIsolater, 0);
  objc_storeStrong(&self->_creationBlock, 0);
}

void __56__GEOXPCConnection_initiateBarrierIfNecessary_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_barrierIsReady");

}

- (void)_barrierIsReady
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  GEOXPCConnection *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__35;
  v25 = __Block_byref_object_dispose__35;
  v26 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __35__GEOXPCConnection__barrierIsReady__block_invoke;
  v18 = &unk_1E1C00760;
  v19 = self;
  v20 = &v21;
  geo_isolate_sync_data();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)v22[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend((id)v22[5], "objectForKey:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10[0] = v3;
        v10[1] = 3221225472;
        v10[2] = __35__GEOXPCConnection__barrierIsReady__block_invoke_2;
        v10[3] = &unk_1E1C00738;
        v10[4] = v8;
        v10[5] = self;
        dispatch_async(v9, v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v27, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)sendMessageReporingProgress:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _xpc_connection_s *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[GEOXPCConnection xpcConnection](self, "xpcConnection");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v11);
      objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_mirroredProgressForReceivingOverXPC:", &v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v17;
        objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, 1);

        if (v12)
          xpc_dictionary_set_value(v8, "progress_observer_endpoint", v12);
      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke_2;
      v15[3] = &unk_1E1C09400;
      v15[4] = self;
      v16 = v10;
      xpc_connection_send_message_with_reply(v11, v8, v9, v15);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke;
      block[3] = &unk_1E1C01F48;
      v19 = v10;
      dispatch_async(v9, block);
      v12 = v19;
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", buf, 2u);
  }

}

uint64_t __29__GEOXPCConnection_reconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconnectIsolated");
}

- (void)setReconnectAutomatically:(BOOL)a3
{
  uint8_t v3[16];

  if (self->_creationBlock)
  {
    self->_reconnectAutomatically = a3;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _creationBlock != ((void *)0)", v3, 2u);
  }
}

+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 reconnectBlock:(id)a6 eventHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initServerConnectionFor:debugIdentifier:queue:creationBlock:reconnectBlock:eventHandler:", a3, v15, v14, 0, v13, v12);

  return v16;
}

+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 eventHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initServerConnectionFor:debugIdentifier:queue:creationBlock:reconnectBlock:eventHandler:", a3, v12, v11, 0, 0, v10);

  return v13;
}

+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 eventHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initServerConnectionFor:debugIdentifier:queue:creationBlock:reconnectBlock:eventHandler:", a3, v9, 0, 0, 0, v8);

  return v10;
}

- (id)initServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 creationBlock:(id)a6 reconnectBlock:(id)a7 eventHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  GEOXPCConnection *v19;
  id v20;
  uint64_t v21;
  geo_isolater *connectionIsolater;
  uint64_t v23;
  NSString *debugIdentifier;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *queue;
  uint64_t v27;
  id eventHandler;
  uint64_t v29;
  void *creationBlock;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id reconnectBlock;
  GEOXPCConnection *v35;
  GEOXPCConnection *v37;
  objc_super v38;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v38.receiver = self;
  v38.super_class = (Class)GEOXPCConnection;
  v19 = -[GEOXPCConnection init](&v38, sel_init);
  if (v19)
  {
    v20 = objc_retainAutorelease(v14);
    objc_msgSend(v20, "UTF8String");
    v21 = geo_isolater_create();
    connectionIsolater = v19->_connectionIsolater;
    v19->_connectionIsolater = (geo_isolater *)v21;

    v19->_serverType = a3;
    v23 = objc_msgSend(v20, "copy");
    debugIdentifier = v19->_debugIdentifier;
    v19->_debugIdentifier = (NSString *)v23;

    if (v15)
    {
      v25 = (OS_dispatch_queue *)v15;
    }
    else
    {
      +[GEOXPCConnection defaultXPCServerConnectionQueue](GEOXPCConnection, "defaultXPCServerConnectionQueue");
      v25 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    queue = v19->_queue;
    v19->_queue = v25;

    v27 = objc_msgSend(v18, "copy");
    eventHandler = v19->_eventHandler;
    v19->_eventHandler = (id)v27;

    if (v16)
    {
      v29 = MEMORY[0x18D765024](v16);
      creationBlock = v19->_creationBlock;
      v19->_creationBlock = (id)v29;
    }
    else
    {
      +[GEOXPCConnection daemonXPCConnectionCreationBlock](GEOXPCConnection, "daemonXPCConnectionCreationBlock");
      creationBlock = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x18D765024]();
      v32 = v19->_creationBlock;
      v19->_creationBlock = (id)v31;

    }
    v33 = objc_msgSend(v17, "copy");
    reconnectBlock = v19->_reconnectBlock;
    v19->_reconnectBlock = (id)v33;

    v37 = v19;
    geo_isolate_sync();
    v35 = v37;

  }
  return v19;
}

+ (id)daemonXPCConnectionCreationBlock
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v6;

  daemonXPCUtilIsolater();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_lock_data();
  if (!_daemonXPCConnectionCreationBlock)
  {
    v2 = objc_msgSend(&__block_literal_global_336, "copy");
    v3 = (void *)_daemonXPCConnectionCreationBlock;
    _daemonXPCConnectionCreationBlock = v2;

  }
  v4 = (void *)MEMORY[0x18D765024]();
  _geo_isolate_unlock();

  return v4;
}

+ (OS_dispatch_queue)defaultXPCServerConnectionQueue
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v7;

  daemonXPCUtilIsolater();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_lock_data();
  v2 = (void *)_defaultXPCServerConnectionQueue;
  if (!_defaultXPCServerConnectionQueue)
  {
    v3 = MEMORY[0x18D764A24]("com.apple.geo.XPCServer");
    v4 = (void *)_defaultXPCServerConnectionQueue;
    _defaultXPCServerConnectionQueue = v3;

    v2 = (void *)_defaultXPCServerConnectionQueue;
  }
  v5 = v2;
  _geo_isolate_unlock();

  return (OS_dispatch_queue *)v5;
}

- (void)sendDictionary:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _xpc_connection_s *v11;
  id v12;
  id v13;
  _QWORD handler[5];
  id v15;
  _QWORD block[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GEOXPCConnection xpcConnection](self, "xpcConnection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v11);
    v12 = (id)_CFXPCCreateXPCObjectFromCFObject();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke_2;
    handler[3] = &unk_1E1C09400;
    handler[4] = self;
    v15 = v10;
    v13 = v10;
    xpc_connection_send_message_with_reply(v11, v12, v9, handler);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v17 = v10;
    v12 = v10;
    dispatch_async(v9, block);
    v13 = v17;
  }

}

- (BOOL)initiateBarrierIfNecessary:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _xpc_connection_s *v10;
  void *v11;
  BOOL v12;
  id v14;
  id location[6];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  location[1] = (id)MEMORY[0x1E0C809B0];
  location[2] = (id)3221225472;
  location[3] = __56__GEOXPCConnection_initiateBarrierIfNecessary_delegate___block_invoke;
  location[4] = &unk_1E1C09428;
  location[5] = self;
  v8 = v6;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  v18 = &v19;
  geo_isolate_sync_data();
  if (*((_BYTE *)v20 + 24)
    && (-[GEOXPCConnection xpcConnection](self, "xpcConnection"),
        (v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_initWeak(location, self);
    objc_copyWeak(&v14, location);
    geo_dispatch_block_clean_copy();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_barrier(v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);

    v12 = *((_BYTE *)v20 + 24) != 0;
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v3, a2);

}

void __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v3, a2);

}

void __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  GEOXPCErrorFromReply(v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138477827;
      v13 = v3;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Received xpc error: %{private}@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_geo_errorForKey:", CFSTR("err"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unexpected response from geod"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v6)
    {
      v10 = 0;
      v11 = v6;
    }
    else
    {
      v10 = v8;
      v11 = 0;
    }
    (*(void (**)(_QWORD, void *, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v11);

  }
}

- (void)reconnect
{
  uint8_t buf[16];

  if (self->_creationBlock)
  {
    geo_isolate_sync();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _creationBlock != ((void *)0)", buf, 2u);
  }
}

+ (void)setDaemonXPCConnectionCreationBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  daemonXPCUtilIsolater();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  geo_isolate_sync_data();

}

void __56__GEOXPCConnection_setDaemonXPCConnectionCreationBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v2 = (void *)_daemonXPCConnectionCreationBlock;
  _daemonXPCConnectionCreationBlock = v1;

}

+ (void)setDefaultXPCServerConnectionQueue:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  daemonXPCUtilIsolater();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  geo_isolate_sync_data();

}

void __55__GEOXPCConnection_setDefaultXPCServerConnectionQueue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&_defaultXPCServerConnectionQueue, *(id *)(a1 + 32));
}

- (GEOXPCConnection)initWithClientConnection:(id)a3 debugIdentifier:(id)a4
{
  id v7;
  id v8;
  GEOXPCConnection *v9;
  uint64_t v10;
  geo_isolater *connectionIsolater;
  uint64_t v12;
  NSString *debugIdentifier;
  GEOXPCConnection *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOXPCConnection;
  v9 = -[GEOXPCConnection init](&v16, sel_init);
  if (v9)
  {
    v10 = geo_isolater_create();
    connectionIsolater = v9->_connectionIsolater;
    v9->_connectionIsolater = (geo_isolater *)v10;

    v9->_serverType = 0;
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    v12 = objc_msgSend(v8, "copy");
    debugIdentifier = v9->_debugIdentifier;
    v9->_debugIdentifier = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

void __38__GEOXPCConnection__reconnectIsolated__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("GEODaemonCommunicationInterruptedNotification"), 0);

}

uint64_t __38__GEOXPCConnection__reconnectIsolated__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

void __38__GEOXPCConnection__reconnectIsolated__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

- (BOOL)isConnected
{
  GEOXPCConnection *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_connectionIsolater;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_xpcConnection != 0;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)setXpcConnection:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v6;
  geo_isolater *v7;

  v4 = (OS_xpc_object *)a3;
  v7 = self->_connectionIsolater;
  _geo_isolate_lock_data();
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;
  v6 = v4;

  _geo_isolate_unlock();
}

- (void)setReconnectBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id reconnectBlock;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (self->_creationBlock)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    reconnectBlock = self->_reconnectBlock;
    self->_reconnectBlock = v6;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _creationBlock != ((void *)0)", v8, 2u);
  }

}

uint64_t __42__GEOXPCConnection__sendGreetingIfNeeded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
}

uint64_t __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendMessageSync:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[GEOXPCConnection xpcConnection](self, "xpcConnection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v5);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", v6, 2u);
  }

}

- (void)sendDictionary:(id)a3
{
  id v4;

  v4 = (id)_CFXPCCreateXPCObjectFromCFObject();
  -[GEOXPCConnection sendMessage:](self, "sendMessage:", v4);

}

void __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -301);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)sendDictionarySync:(id)a3
{
  id v4;

  v4 = (id)_CFXPCCreateXPCObjectFromCFObject();
  -[GEOXPCConnection sendMessageSync:](self, "sendMessageSync:", v4);

}

- (id)sendDictionaryWithReplySync:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  id v9;
  void *v10;
  xpc_object_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOXPCConnection xpcConnection](self, "xpcConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_xpc_connection_s *)v7;
  if (!a4 || v7)
  {
    if (v7)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v7);
      v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      v11 = xpc_connection_send_message_with_reply_sync(v8, v10);
      GEOXPCErrorFromReply(v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (id)v12;
        GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v18 = 138477827;
          v19 = v11;
          _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Received xpc error: %{private}@", (uint8_t *)&v18, 0xCu);
        }

        if (a4)
        {
          v13 = objc_retainAutorelease(v13);
          v9 = 0;
          *a4 = v13;
        }
        else
        {
          v9 = 0;
        }
      }
      else
      {
        v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v15;
          v13 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unexpected response from geod"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = 138477827;
            v19 = v13;
            _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "xpc error: %{private}@", (uint8_t *)&v18, 0xCu);
          }

          if (a4)
          {
            v13 = objc_retainAutorelease(v13);
            v9 = 0;
            *a4 = v13;
          }
          else
          {
            v9 = 0;
          }
        }

      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -301);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)sendDictionaryWithMessageReplySync:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  void *v10;

  v6 = a3;
  -[GEOXPCConnection xpcConnection](self, "xpcConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_xpc_connection_s *)v7;
  if (!a4 || v7)
  {
    if (v7)
    {
      -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", v7);
      v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      v9 = xpc_connection_send_message_with_reply_sync(v8, v10);

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -301);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (unint64_t)serverType
{
  return self->_serverType;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)reconnectAutomatically
{
  return self->_reconnectAutomatically;
}

- (id)reconnectBlock
{
  return self->_reconnectBlock;
}

@end
