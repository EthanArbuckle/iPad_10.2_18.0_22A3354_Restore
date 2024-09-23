@implementation MRXPCConnection

- (int)pid
{
  return xpc_connection_get_pid(self->_connection);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

void __46__MRXPCConnection_addCustomXPCHandler_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1[4] + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = a1[4];
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(a1[4] + 24);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRXPCConnection addCustomXPCHandler:forKey:]_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRXPCConnection.m"), 68, CFSTR("A custom xpc handler already exists with key %llu"), a1[6]);

  }
  v7 = *(void **)(a1[4] + 24);
  v8 = (void *)MEMORY[0x194036C44](a1[5]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v9);

}

void __37__MRXPCConnection__registerCallbacks__block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = MEMORY[0x194036C44](*(_QWORD *)(a1[4] + 40));
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MRXPCConnection)initWithConnection:(id)a3 queue:(id)a4 defaultReplyQueue:(id)a5
{
  id v9;
  NSObject *v10;
  id v11;
  MRXPCConnection *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *serialQueue;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MRXPCConnection;
  v12 = -[MRXPCConnection init](&v19, sel_init);
  if (v12)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRXPCConnection initWithConnection:queue:defaultReplyQueue:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MRXPCConnection.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    }
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v12->_defaultReplyQueue, a5);
    if (v10)
      xpc_connection_set_target_queue(v12->_connection, v10);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.mediaremote.MRXPCConnection", v13);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v14;

    -[MRXPCConnection _registerCallbacks](&v12->super.isa);
  }

  return v12;
}

- (void)_registerCallbacks
{
  _xpc_connection_s *v2;
  _QWORD handler[5];
  id v4;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = val[4];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__MRXPCConnection__registerCallbacks__block_invoke;
    handler[3] = &unk_1E30CAD70;
    objc_copyWeak(&v4, &location);
    handler[4] = val;
    xpc_connection_set_event_handler(v2, handler);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)addCustomXPCHandler:(id)a3 forKey:(unint64_t)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRXPCConnection_addCustomXPCHandler_forKey___block_invoke;
  block[3] = &unk_1E30C77F0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(serialQueue, block);

}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

void __37__MRXPCConnection__registerCallbacks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t uint64;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  void *v23;
  _QWORD block[4];
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__23;
    v31 = __Block_byref_object_dispose__23;
    v32 = 0;
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MRXPCConnection__registerCallbacks__block_invoke_22;
    block[3] = &unk_1E30C5F90;
    v25 = WeakRetained;
    v26 = &v27;
    dispatch_sync(v7, block);
    v8 = v28[5];
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    v9 = v25;
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v3, "MRXPC_MESSAGE_ID_KEY");
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__23;
    v31 = __Block_byref_object_dispose__23;
    v32 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__23;
    v22 = __Block_byref_object_dispose__23;
    v23 = 0;
    v11 = v5[1];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__MRXPCConnection__registerCallbacks__block_invoke_2;
    v13[3] = &unk_1E30CAD48;
    v15 = &v18;
    v16 = &v27;
    v17 = uint64;
    v14 = v5;
    dispatch_sync(v11, v13);
    v12 = v19[5];
    if (!v12)
      v12 = v28[5];
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

    _Block_object_dispose(&v18, 8);
    v9 = v23;
  }

  _Block_object_dispose(&v27, 8);
}

- (unsigned)uid
{
  return xpc_connection_get_euid(self->_connection);
}

- (void)sendMessage:(id)a3 queue:(id)a4 reply:(id)a5
{
  id v9;
  OS_dispatch_queue *v10;
  id v11;
  OS_xpc_object *connection;
  void *v13;
  _QWORD handler[4];
  id v15;

  v9 = a3;
  v10 = (OS_dispatch_queue *)a4;
  v11 = a5;
  if (v11)
  {
    if (!v10)
    {
      v10 = self->_defaultReplyQueue;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRXPCConnection.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

        v10 = 0;
      }
    }
    connection = self->_connection;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__MRXPCConnection_sendMessage_queue_reply___block_invoke;
    handler[3] = &unk_1E30C7D98;
    v15 = v11;
    xpc_connection_send_message_with_reply(connection, v9, (dispatch_queue_t)v10, handler);

  }
  else
  {
    xpc_connection_send_message(self->_connection, v9);
  }

}

- (id)sendSyncMessageWithType:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  MRCreateXPCMessage(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRXPCConnection sendSyncMessage:error:](self, "sendSyncMessage:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sendSyncMessage:(id)a3 error:(id *)a4
{
  xpc_object_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
  v6 = v5;
  if (a4)
  {
    if (v5 == (xpc_object_t)MEMORY[0x1E0C81258])
    {
      v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
      MRCreateStringFromXPCMessage(MEMORY[0x1E0C81258], (const char *)*MEMORY[0x1E0C81270]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithMRError:format:", 1, CFSTR("Connection interrupted with error=%@"), v8);
    }
    else
    {
      if (v5 != (xpc_object_t)MEMORY[0x1E0C81260])
      {
        *a4 = (id)MRCreateClientErrorFromXPCMessage(v5);
        return v6;
      }
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      MRCreateStringFromXPCMessage(MEMORY[0x1E0C81260], (const char *)*MEMORY[0x1E0C81270]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "initWithMRError:format:", 1, CFSTR("Connection invalid with error=%@"), v8);
    }
    *a4 = v9;

  }
  return v6;
}

void __43__MRXPCConnection_sendMessage_queue_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    MRCreateStringFromXPCMessage(MEMORY[0x1E0C81258], (const char *)*MEMORY[0x1E0C81270]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithMRError:format:", 1, CFSTR("Connection interrupted with error=%@"), v6);
LABEL_6:
    v4 = (void *)v7;

    goto LABEL_7;
  }
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    MRCreateStringFromXPCMessage(MEMORY[0x1E0C81260], (const char *)*MEMORY[0x1E0C81270]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "initWithMRError:format:", 1, CFSTR("Connection invalid with error=%@"), v6);
    goto LABEL_6;
  }
  v4 = (void *)MRCreateClientErrorFromXPCMessage(v3);
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)dealloc
{
  objc_super v3;

  xpc_connection_cancel(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)MRXPCConnection;
  -[MRXPCConnection dealloc](&v3, sel_dealloc);
}

- (void)removeCustomXPCHandler:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__MRXPCConnection_removeCustomXPCHandler___block_invoke;
  v4[3] = &unk_1E30C78E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

void __42__MRXPCConnection_removeCustomXPCHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (void)sendMessageWithType:(unint64_t)a3 queue:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  MRCreateXPCMessage(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MRXPCConnection sendMessage:queue:reply:](self, "sendMessage:queue:reply:", v10, v9, v8);

}

void __37__MRXPCConnection__registerCallbacks__block_invoke_22(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = MEMORY[0x194036C44]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_customXpcHandlers, 0);
  objc_storeStrong((id *)&self->_defaultReplyQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
