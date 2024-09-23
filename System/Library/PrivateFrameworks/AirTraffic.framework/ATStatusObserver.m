@implementation ATStatusObserver

- (ATStatusObserver)init
{
  ATStatusObserver *v2;
  ATStatusObserver *v3;
  ATStatusObserver *v4;
  int *p_notifyToken;
  NSObject *v6;
  id v7;
  ATStatusObserver *v8;
  uint64_t state64;
  _QWORD handler[4];
  ATStatusObserver *v12;
  _QWORD *v13;
  _QWORD v14[5];
  ATStatusObserver *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ATStatusObserver;
  v2 = -[ATStatusObserver init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__169;
    v14[4] = __Block_byref_object_dispose__170;
    v4 = v2;
    v15 = v4;
    p_notifyToken = &v4->_notifyToken;
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __24__ATStatusObserver_init__block_invoke;
    handler[3] = &unk_24C4C9B40;
    v8 = v4;
    v12 = v8;
    v13 = v14;
    notify_register_dispatch("com.apple.atc.started", p_notifyToken, v6, handler);

    state64 = 0;
    notify_get_state(*p_notifyToken, &state64);
    if (state64)
      v8->_ATCRunning = 1;

    _Block_object_dispose(v14, 8);
  }
  return v3;
}

- (void)resume
{
  void *v2;
  id v3;

  self->_resumed = 1;
  if (self->_ATCRunning)
  {
    -[ATStatusObserver connection](self, "connection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resume");

  }
}

- (void)suspend
{
  NSXPCConnection *connection;

  self->_resumed = 0;
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)fetchAllStatusWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_ATCRunning)
  {
    -[ATStatusObserver connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke;
    v13[3] = &unk_24C4CA098;
    v8 = v5;
    v14 = v8;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke_2;
    v11[3] = &unk_24C4C9B68;
    v12 = v8;
    objc_msgSend(v9, "fetchAllStatusWithCompletion:", v11);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v10, 0);

  }
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.atc.xpc.observer"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473ABF8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchAllStatusWithCompletion_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254736178);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[NSXPCConnection resume](self->_connection, "resume");

    connection = self->_connection;
  }
  return connection;
}

- (void)updateWithStatus:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ATStatusObserver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "observer:didUpdateWithStatus:", self, v5);

}

- (ATStatusObserverDelegate)delegate
{
  return (ATStatusObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)ATCRunning
{
  return self->_ATCRunning;
}

- (void)setATCRunning:(BOOL)a3
{
  self->_ATCRunning = a3;
}

- (BOOL)resumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __24__ATStatusObserver_init__block_invoke(uint64_t a1, int token)
{
  uint32_t state;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t state64;

  state64 = 0;
  state = notify_get_state(token, &state64);
  v4 = *(_QWORD *)(a1 + 32);
  if (state || !state64)
  {
    *(_BYTE *)(v4 + 8) = 0;
  }
  else
  {
    if (!*(_BYTE *)(v4 + 8))
    {
      if (*(_BYTE *)(v4 + 9))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "connection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "remoteObjectProxy");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "start");

        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v4 + 8) = 1;
  }
}

@end
