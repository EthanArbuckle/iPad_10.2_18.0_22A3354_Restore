@implementation XPCClientConnection

- (void)sendMessage:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(7, CFSTR("%@ Scheduling message for sending."), v8, v9, v10, v11, v12, v13, (uint64_t)self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__XPCClientConnection_sendMessage_withHandler___block_invoke;
  block[3] = &unk_1E994DC88;
  block[4] = self;
  v18 = v6;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  dispatch_async(queue, block);

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)XPCClientConnection;
  -[XPCClientConnection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: name: %@, connection %p, delegate %p, queue %p"), v4, self->_serviceName, self->_connection, self->_delegate, self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4;
  int v5;
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
  uint64_t v17;
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
  OS_xpc_object *connection;
  OS_xpc_object *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  xpc_object_t xdict;

  v4 = a3;
  xdict = v4;
  if (_shouldLogBlock)
  {
    v5 = (*(uint64_t (**)(void))(_shouldLogBlock + 16))();
    v4 = xdict;
    if (v5)
    {
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
      _XPCLog(7, CFSTR("%@: Connection event handler received event: %s"), v6, v7, v8, v9, v10, v11, (uint64_t)self);
      v4 = xdict;
    }
  }
  v12 = MEMORY[0x1D82700DC](v4);
  if (v12 == MEMORY[0x1E0C812F8])
  {
    -[XPCClientConnection _handleIncomingMessage:](self, "_handleIncomingMessage:", xdict);
    goto LABEL_21;
  }
  if (v12 != MEMORY[0x1E0C81310])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 5))
    {
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
      _XPCLog(5, CFSTR("%@: Connection event handler ignoring unknown XPC event: %s"), v13, v14, v15, v16, v17, v18, (uint64_t)self);
    }
    goto LABEL_21;
  }
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
  {
    xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
    _XPCLog(3, CFSTR("%@: Connection event handler received error: %s"), v19, v20, v21, v22, v23, v24, (uint64_t)self);
  }
  if (xdict == (xpc_object_t)MEMORY[0x1E0C81260])
    goto LABEL_19;
  if (xdict != (xpc_object_t)MEMORY[0x1E0C81258])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
    {
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
      _XPCLog(3, CFSTR("%@: Connection event handler found unknown XPC Error: %s"), v25, v26, v27, v28, v29, v30, (uint64_t)self);
    }
LABEL_19:
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      v32 = self->_connection;
      self->_connection = 0;

    }
    goto LABEL_21;
  }
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
  {
    _XPCLog(7, CFSTR("%@: Connection event handler ignoring interrupted connection."), v33, v34, v35, v36, v37, v38, (uint64_t)self);
  }
LABEL_21:

}

- (void)_handleIncomingMessage:(id)a3
{
  id v4;
  XPCRequest *v5;

  v4 = a3;
  v5 = -[XPCRequest initWithMessage:sequence:connection:]([XPCRequest alloc], "initWithMessage:sequence:connection:", v4, 0, self->_connection);

  -[XPCClientConnectionDelegate XPCClientConnection:didReceiveRequest:](self->_delegate, "XPCClientConnection:didReceiveRequest:", self, v5);
}

- (void)_reallySendMessage:(id)a3 handler:(id)a4 sequence:(unint64_t)a5 retryCount:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  OS_xpc_object *mach_service;
  OS_xpc_object *connection;
  OS_xpc_object *v28;
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
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  OS_xpc_object *v48;
  NSObject *queue;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD handler[4];
  id v58;
  id location;

  v10 = a3;
  v11 = a4;
  if (!v11)
    __assert_rtn("-[XPCClientConnection _reallySendMessage:handler:sequence:retryCount:]", "XPCKitBasic.m", 136, "handler");
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  if (self->_connection)
  {
    if (a5)
    {
LABEL_4:
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
      {
        _XPCLog(6, CFSTR("%@: Redriving message with sequence %llu"), v14, v15, v16, v17, v18, v19, (uint64_t)self);
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
    {
      _XPCLog(6, CFSTR("%@: Creating connection to service %@"), v20, v21, v22, v23, v24, v25, (uint64_t)self);
    }
    mach_service = xpc_connection_create_mach_service(-[NSString UTF8String](self->_serviceName, "UTF8String"), (dispatch_queue_t)self->_queue, 0);
    connection = self->_connection;
    self->_connection = mach_service;

    objc_initWeak(&location, self);
    v28 = self->_connection;
    handler[0] = v13;
    handler[1] = 3221225472;
    handler[2] = __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke;
    handler[3] = &unk_1E994DBC0;
    objc_copyWeak(&v58, &location);
    xpc_connection_set_event_handler(v28, handler);
    xpc_connection_resume(self->_connection);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
    if (a5)
      goto LABEL_4;
  }
  a5 = _reallySendMessage_handler_sequence_retryCount__currentMessageSequence++;
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
  {
    _XPCLog(7, CFSTR("%@: Setting sequence number to %llu"), v29, v30, v31, v32, v33, v34, (uint64_t)self);
  }
LABEL_14:
  xpc_dictionary_set_uint64(v10, "__xpcseq", a5);
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
      _XPCLog(6, CFSTR("%@: Sending message."), v35, v36, v37, v38, v39, v40, (uint64_t)self);
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
    {
      v41 = (void *)MEMORY[0x1D8270064](v10);
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        _XPCLog(7, CFSTR("Message: %s"), v42, v43, v44, v45, v46, v47, (uint64_t)v41);
      }
      free(v41);
    }
  }
  v48 = self->_connection;
  queue = self->_queue;
  v52[0] = v13;
  v52[1] = 3221225472;
  v52[2] = __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke_2;
  v52[3] = &unk_1E994DBE8;
  v54 = v12;
  v55 = a5;
  v52[4] = self;
  v53 = v10;
  v56 = a6;
  v50 = v10;
  v51 = v12;
  xpc_connection_send_message_with_reply(v48, v50, queue, v52);

}

- (XPCClientConnection)initWithServiceName:(id)a3 delegate:(id)a4
{
  id v6;
  XPCClientConnectionDelegate *v7;
  XPCClientConnection *v8;
  uint64_t v9;
  NSString *serviceName;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v6 = a3;
  v7 = (XPCClientConnectionDelegate *)a4;
  v15.receiver = self;
  v15.super_class = (Class)XPCClientConnection;
  v8 = -[XPCClientConnection init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;

    v8->_delegate = v7;
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".queue"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

  }
  return v8;
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__XPCClientConnection_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E994DC10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (XPCClientConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

void __47__XPCClientConnection_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    xpc_connection_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    v5 = *(void **)(a1 + 40);
    if (v5)
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), v5);
  }
}

uint64_t __47__XPCClientConnection_sendMessage_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallySendMessage:handler:sequence:retryCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
}

void __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleConnectionEvent:", v3);

}

void __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke_2(uint64_t *a1, void *a2)
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
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  char v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(7, CFSTR("%@: Message sent: sequence: %llu."), v4, v5, v6, v7, v8, v9, a1[4]);
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
  if (v18 != MEMORY[0x1E0C81310])
  {
    if (v18 == MEMORY[0x1E0C812F8])
    {
      xpc_dictionary_get_uint64(xdict, "__xpcseq");
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        _XPCLog(7, CFSTR("%@ Handling reply for message with sequence %llu."), v47, v48, v49, v50, v51, v52, a1[4]);
      }
      v26 = *(void (**)(void))(a1[6] + 16);
    }
    else
    {
      v19 = (void *)MEMORY[0x1D8270064](xdict);
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        _XPCLog(3, CFSTR("%@ Received unknown XPC event type: %s"), v20, v21, v22, v23, v24, v25, a1[4]);
      }
      free(v19);
      v26 = *(void (**)(void))(a1[6] + 16);
    }
LABEL_32:
    v26();
    goto LABEL_33;
  }
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
  {
    v27 = a1[4];
    xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
    _XPCLog(3, CFSTR("%@: Received an error when receiving reply. Error: %s"), v28, v29, v30, v31, v32, v33, v27);
  }
  if (xdict == (xpc_object_t)MEMORY[0x1E0C81260])
  {
    if (!_shouldLogBlock
      || ((*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6) & 1) == 0)
    {
      goto LABEL_42;
    }
    v60 = CFSTR("%@: Connection invalid.");
    goto LABEL_41;
  }
  if (xdict != (xpc_object_t)MEMORY[0x1E0C81258])
  {
    if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        v34 = a1[4];
        xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
        _XPCLog(3, CFSTR("%@: Unknown XPC error: %s"), v35, v36, v37, v38, v39, v40, v34);
      }
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        _XPCLog(3, CFSTR("%@: Message send failed. Not retrying."), v41, v42, v43, v44, v45, v46, a1[4]);
      }
    }
    v26 = *(void (**)(void))(a1[6] + 16);
    goto LABEL_32;
  }
  if (_shouldLogBlock
    && ((*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6) & 1) != 0)
  {
    v60 = CFSTR("%@: Connection interrupted.");
LABEL_41:
    _XPCLog(6, v60, v54, v55, v56, v57, v58, v59, a1[4]);
  }
LABEL_42:
  v61 = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (_shouldLogBlock)
  {
    v62 = (*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6);
    if ((v61 & 1) == 0)
    {
      v53 = xdict;
      if (!v62)
        goto LABEL_34;
      _XPCLog(6, CFSTR("%@: Did not want to retry sending the last message. Message send failed."), (uint64_t)xdict, v64, v65, v66, v67, v68, a1[4]);
      goto LABEL_33;
    }
    if (v62)
      _XPCLog(6, CFSTR("%@: Trying to resend last message."), v63, v64, v65, v66, v67, v68, a1[4]);
  }
  else
  {
    v53 = xdict;
    if ((v61 & 1) == 0)
      goto LABEL_34;
  }
  objc_msgSend((id)a1[4], "_reallySendMessage:handler:sequence:retryCount:", a1[5], a1[6], a1[7], a1[8] + 1);
LABEL_33:
  v53 = xdict;
LABEL_34:

}

@end
