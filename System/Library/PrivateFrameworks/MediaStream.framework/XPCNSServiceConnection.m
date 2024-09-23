@implementation XPCNSServiceConnection

- (XPCNSServiceConnection)initWithXPCServiceConnection:(id)a3
{
  id v5;
  XPCNSServiceConnection *v6;
  XPCNSServiceConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XPCNSServiceConnection;
  v6 = -[XPCNSServiceConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceConnection, a3);
    -[XPCServiceConnection setDelegate:](v7->_serviceConnection, "setDelegate:", v7);
    -[XPCServiceConnection setContext:](v7->_serviceConnection, "setContext:", v7);
  }

  return v7;
}

- (void)sendMessage:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  int inserted;
  XPCServiceConnection *serviceConnection;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  inserted = _insertMessage(v8, v7, 0, 0, 0);

  if (inserted)
  {
    serviceConnection = self->_serviceConnection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__XPCNSServiceConnection_sendMessage_withHandler___block_invoke;
    v11[3] = &unk_1E994DD78;
    v11[4] = self;
    v12 = v6;
    -[XPCServiceConnection sendMessage:withHandler:](serviceConnection, "sendMessage:withHandler:", v8, v11);

  }
}

- (NSString)serviceName
{
  return -[XPCServiceConnection serviceName](self->_serviceConnection, "serviceName");
}

- (void)XPCServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5
{
  XPCNSServiceConnectionDelegate **p_delegate;
  id v8;
  XPCNSRequest *v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = -[XPCNSRequest initWithXPCRequest:]([XPCNSRequest alloc], "initWithXPCRequest:", v8);

  objc_msgSend(WeakRetained, "XPCNSServiceConnection:didReceiveRequest:sequenceNumber:", self, v9, a5);
}

- (void)XPCServiceConnectionDidDisconnect:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "XPCNSServiceConnectionDidDisconnect:", self);

}

- (void)shutDownCompletionBlock:(id)a3
{
  -[XPCServiceConnection shutDownCompletionBlock:](self->_serviceConnection, "shutDownCompletionBlock:", a3);
}

- (XPCNSServiceConnectionDelegate)delegate
{
  return (XPCNSServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __50__XPCNSServiceConnection_sendMessage_withHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (a2)
  {
    v4 = 0;
  }
  else
  {
    v12 = 0;
    v5 = _unpack(a3, &v12, 0);
    v4 = v12;
    if ((v5 & 1) == 0 && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(3, CFSTR("%@: Could not unserialize reply."), v6, v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
