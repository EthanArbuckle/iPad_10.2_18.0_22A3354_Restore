@implementation XPCNSClientConnection

- (void)sendMessageReliably:(id)a3 data:(id)a4 maxRetryCount:(int)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int v14;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__XPCNSClientConnection_sendMessageReliably_data_maxRetryCount_withHandler___block_invoke;
  v12[3] = &unk_1E994DD50;
  v14 = a5;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[XPCNSClientConnection sendMessage:data:withHandler:](self, "sendMessage:data:withHandler:", a3, a4, v12);

}

- (void)sendMessage:(id)a3 data:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  int inserted;
  XPCClientConnection *clientConnection;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  size_t v23;
  size_t v24;
  uint64_t v25;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = xpc_dictionary_create(0, 0, 0);
  v24 = 0;
  v25 = 0;
  inserted = _insertMessage(v11, v10, v9, &v25, &v24);

  if (inserted)
  {
    clientConnection = self->_clientConnection;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__XPCNSClientConnection_sendMessage_data_withHandler___block_invoke;
    v20[3] = &unk_1E994DD28;
    v20[4] = self;
    v21 = v8;
    v22 = v25;
    v23 = v24;
    -[XPCClientConnection sendMessage:withHandler:](clientConnection, "sendMessage:withHandler:", v11, v20);

  }
  else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
  {
    _XPCLog(3, CFSTR("%@: Cannot send message."), v14, v15, v16, v17, v18, v19, (uint64_t)self);
  }

}

- (XPCNSClientConnection)initWithServiceName:(id)a3 delegate:(id)a4
{
  id v6;
  XPCNSClientConnectionDelegate *v7;
  XPCNSClientConnection *v8;
  XPCClientConnection *v9;
  XPCClientConnection *clientConnection;
  objc_super v12;

  v6 = a3;
  v7 = (XPCNSClientConnectionDelegate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)XPCNSClientConnection;
  v8 = -[XPCNSClientConnection init](&v12, sel_init);
  if (v8)
  {
    v9 = -[XPCClientConnection initWithServiceName:delegate:]([XPCClientConnection alloc], "initWithServiceName:delegate:", v6, v8);
    clientConnection = v8->_clientConnection;
    v8->_clientConnection = v9;

    v8->_delegate = v7;
  }

  return v8;
}

- (void)shutDownCompletionBlock:(id)a3
{
  -[XPCClientConnection shutDownCompletionBlock:](self->_clientConnection, "shutDownCompletionBlock:", a3);
}

- (void)XPCClientConnection:(id)a3 didReceiveRequest:(id)a4
{
  XPCNSClientConnectionDelegate *delegate;
  id v6;
  XPCNSRequest *v7;

  delegate = self->_delegate;
  v6 = a4;
  v7 = -[XPCNSRequest initWithXPCRequest:]([XPCNSRequest alloc], "initWithXPCRequest:", v6);

  -[XPCNSClientConnectionDelegate XPCNSClientConnection:didReceiveRequest:](delegate, "XPCNSClientConnection:didReceiveRequest:", self, v7);
}

- (XPCNSClientConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

uint64_t __76__XPCNSClientConnection_sendMessageReliably_data_maxRetryCount_withHandler___block_invoke(uint64_t a1, int a2, void *a3, int a4, unint64_t a5)
{
  id v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);

  v9 = a3;
  if (!a2)
  {
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_14:
    v19();
    v12 = 0;
    goto LABEL_15;
  }
  if (!a4 || ((v10 = *(int *)(a1 + 48), (_DWORD)v10 != -1) ? (v11 = v10 > a5) : (v11 = 1), !v11))
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(3, CFSTR("%@: Could not send message, even after retrying. Dropping message."), v13, v14, v15, v16, v17, v18, *(_QWORD *)(a1 + 32));
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

uint64_t __54__XPCNSClientConnection_sendMessage_data_withHandler___block_invoke(uint64_t a1, int a2, void *a3, int a4)
{
  id v7;
  void *v8;
  unsigned int v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v7 = a3;
  v8 = v7;
  if (a2)
  {
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v20 = 0;
    v10 = _unpack(v7, &v20, 0);
    v11 = v20;
    if (v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v9 = 0;
    }
    else
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
        _XPCLog(3, CFSTR("%@: Could not unserialize reply to message."), v12, v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 32));
      v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  v18 = a4 & v9;
  if ((v18 & 1) == 0)
    munmap(*(void **)(a1 + 48), *(_QWORD *)(a1 + 56));

  return v18;
}

@end
