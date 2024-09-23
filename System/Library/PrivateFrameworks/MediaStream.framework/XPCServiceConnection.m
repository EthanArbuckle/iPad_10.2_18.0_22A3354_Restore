@implementation XPCServiceConnection

- (id)debugDescription
{
  void *v3;
  void *v4;
  NSString *serviceName;
  id WeakRetained;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)XPCServiceConnection;
  -[XPCServiceConnection description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  serviceName = self->_serviceName;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ name %@, delegate %p, client %p, queue %p"), v4, serviceName, WeakRetained, self->_client, self->_workQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (XPCServiceConnection)initWithServiceName:(id)a3 client:(id)a4 queue:(id)a5
{
  id v9;
  _xpc_connection_s *v10;
  id v11;
  XPCServiceConnection *v12;
  XPCServiceConnection *v13;
  XPCServiceConnection *v14;
  XPCServiceConnection *v15;
  _QWORD handler[4];
  XPCServiceConnection *v18;
  objc_super v19;

  v9 = a3;
  v10 = (_xpc_connection_s *)a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)XPCServiceConnection;
  v12 = -[XPCServiceConnection init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_workQueue, a5);
    objc_storeStrong((id *)&v13->_client, a4);
    xpc_connection_set_target_queue(v10, (dispatch_queue_t)v13->_workQueue);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__XPCServiceConnection_initWithServiceName_client_queue___block_invoke;
    handler[3] = &unk_1E994DC38;
    v14 = v13;
    v18 = v14;
    xpc_connection_set_event_handler(v10, handler);
    v15 = v14;

  }
  return v13;
}

- (void)workQueueHandleIncomingMessage:(id)a3
{
  id v4;
  uint64_t uint64;
  id WeakRetained;
  XPCRequest *v7;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "__xpcseq");
  v7 = -[XPCRequest initWithMessage:sequence:connection:]([XPCRequest alloc], "initWithMessage:sequence:connection:", v4, uint64, self->_client);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "XPCServiceConnection:didReceiveRequest:sequenceNumber:", self, v7, uint64);

}

- (void)resume
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(6, CFSTR("%@: Resuming service connection."), v3, v4, v5, v6, v7, v8, (uint64_t)self);
  xpc_connection_resume(self->_client);
}

- (void)workQueueShutDown
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OS_xpc_object *client;
  OS_xpc_object *v10;
  NSString *serviceName;
  id v12;
  id WeakRetained;

  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(7, CFSTR("%@: Shutting down."), v3, v4, v5, v6, v7, v8, (uint64_t)self);
  client = self->_client;
  if (client)
  {
    xpc_connection_cancel(client);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    v10 = self->_client;
    self->_client = 0;

    serviceName = self->_serviceName;
    self->_serviceName = 0;

    v12 = objc_loadWeakRetained((id *)&self->_serviceListener);
    objc_msgSend(v12, "serviceConnectionDidDisconnect:", self);

    objc_msgSend(WeakRetained, "XPCServiceConnectionDidDisconnect:", self);
  }
}

- (void)sendMessage:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (!v7)
    __assert_rtn("-[XPCServiceConnection sendMessage:withHandler:]", "XPCKitBasic.m", 338, "handler");
  v8 = v7;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(6, CFSTR("%@: Scheduling message to be sent to the client."), v9, v10, v11, v12, v13, v14, (uint64_t)self);
  -[XPCServiceConnection workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__XPCServiceConnection_sendMessage_withHandler___block_invoke;
  block[3] = &unk_1E994DC88;
  v19 = v6;
  v20 = v8;
  block[4] = self;
  v16 = v6;
  v17 = v8;
  dispatch_async(v15, block);

}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[XPCServiceConnection workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__XPCServiceConnection_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E994DC10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (XPCServiceConnectionDelegate)delegate
{
  return (XPCServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)client
{
  return self->_client;
}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (XPCServiceListener)serviceListener
{
  return (XPCServiceListener *)objc_loadWeakRetained((id *)&self->_serviceListener);
}

- (void)setServiceListener:(id)a3
{
  objc_storeWeak((id *)&self->_serviceListener, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_serviceListener);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

void __48__XPCServiceConnection_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "workQueueShutDown");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

void __48__XPCServiceConnection_sendMessage_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _xpc_connection_s *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD handler[5];
  id v26;
  id v27;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
        _XPCLog(7, CFSTR("%@: Sending message."), v2, v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 32));
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        v8 = (void *)MEMORY[0x1D8270064](*(_QWORD *)(a1 + 40));
        if (_shouldLogBlock)
        {
          if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
            _XPCLog(7, CFSTR("Message: %s"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
        }
        free(v8);
      }
    }
    v15 = *(_QWORD **)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v17 = (_xpc_connection_s *)v15[3];
    objc_msgSend(v15, "workQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__XPCServiceConnection_sendMessage_withHandler___block_invoke_2;
    handler[3] = &unk_1E994DC60;
    handler[4] = *(_QWORD *)(a1 + 32);
    v27 = *(id *)(a1 + 48);
    v26 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v17, v16, v18, handler);

  }
  else
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(6, CFSTR("%@: Client has been torn down. Not sending message."), v19, v20, v21, v22, v23, v24, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __48__XPCServiceConnection_sendMessage_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(7, CFSTR("%@: Message sent."), v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
    v3 = xdict;
    if (_shouldLogBlock)
    {
      v10 = (*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7);
      v3 = xdict;
      if (v10)
      {
        v11 = (void *)MEMORY[0x1D8270064](xdict);
        if (_shouldLogBlock
          && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
        {
          _XPCLog(7, CFSTR("Reply: %s"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
        }
        free(v11);
        v3 = xdict;
      }
    }
  }
  v18 = MEMORY[0x1D82700DC](v3);
  if (v18 == MEMORY[0x1E0C81310])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
    {
      v27 = *(_QWORD *)(a1 + 32);
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
      _XPCLog(3, CFSTR("%@: Received an error when receiving reply. Error: %s"), v28, v29, v30, v31, v32, v33, v27);
    }
    if (xdict == (xpc_object_t)MEMORY[0x1E0C81260])
    {
      if (_shouldLogBlock)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
          _XPCLog(6, CFSTR("%@: Connection invalid."), v47, v48, v49, v50, v51, v52, *(_QWORD *)(a1 + 32));
        goto LABEL_36;
      }
    }
    else if (xdict == (xpc_object_t)MEMORY[0x1E0C81258])
    {
      if (_shouldLogBlock)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
          _XPCLog(6, CFSTR("%@: Connection interrupted."), v53, v54, v55, v56, v57, v58, *(_QWORD *)(a1 + 32));
        goto LABEL_36;
      }
    }
    else if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        v34 = *(_QWORD *)(a1 + 32);
        xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
        _XPCLog(3, CFSTR("%@: Unknown XPC error: %s"), v35, v36, v37, v38, v39, v40, v34);
      }
LABEL_36:
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        _XPCLog(3, CFSTR("%@: Message send failed. Not retrying."), v59, v60, v61, v62, v63, v64, *(_QWORD *)(a1 + 32));
      }
    }
    v26 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_40;
  }
  if (v18 == MEMORY[0x1E0C812F8])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
    {
      _XPCLog(7, CFSTR("%@ Handling reply for message."), v41, v42, v43, v44, v45, v46, *(_QWORD *)(a1 + 32));
    }
    v26 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v19 = (void *)MEMORY[0x1D8270064](xdict);
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
    {
      _XPCLog(3, CFSTR("%@ Received unknown XPC event type: %s"), v20, v21, v22, v23, v24, v25, *(_QWORD *)(a1 + 32));
    }
    free(v19);
    v26 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
LABEL_40:
  v26();

}

void __57__XPCServiceConnection_initWithServiceName_client_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x1D82700DC]();
  if (v3 == MEMORY[0x1E0C812F8])
  {
    if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
        _XPCLog(7, CFSTR("%@: Received message."), v11, v12, v13, v14, v15, v16, *(_QWORD *)(a1 + 32));
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        v17 = (void *)MEMORY[0x1D8270064](xdict);
        if (_shouldLogBlock
          && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
        {
          _XPCLog(7, CFSTR("Message: %s"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
        }
        free(v17);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "workQueueHandleIncomingMessage:", xdict);
  }
  else
  {
    if (v3 == MEMORY[0x1E0C81310])
    {
      if (xdict == (xpc_object_t)MEMORY[0x1E0C81260])
      {
        if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
          _XPCLog(6, CFSTR("%@: Client disconnected."), v31, v32, v33, v34, v35, v36, *(_QWORD *)(a1 + 32));
      }
      else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      {
        v24 = *(_QWORD *)(a1 + 32);
        xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
        _XPCLog(7, CFSTR("%@: Service connection received XPC Error: %s"), v25, v26, v27, v28, v29, v30, v24);
      }
    }
    else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      v4 = *(_QWORD *)(a1 + 32);
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
      _XPCLog(3, CFSTR("%@: Service connection received unknown XPC event: %s"), v5, v6, v7, v8, v9, v10, v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "workQueueShutDown");
  }

}

@end
