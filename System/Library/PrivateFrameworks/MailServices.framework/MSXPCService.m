@implementation MSXPCService

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MSXPCService;
  -[MSXPCService dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (MSXPCService)initWithRemoteObjectInterface:(id)a3
{
  id v5;
  MSXPCService *v6;
  MSXPCService *v7;
  NSLock *v8;
  NSLock *lock;
  MSXPCService *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSXPCService;
  v6 = -[MSXPCService init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_shouldLaunchMobileMail = 1;
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v7->_lock;
    v7->_lock = v8;

    objc_storeStrong((id *)&v7->_remoteObjectInterface, a3);
    v10 = v7;
  }

  return v7;
}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;

  connection = self->_connection;
  if (!connection)
  {
    -[NSLock lock](self->_lock, "lock");
    if (!self->_connection)
    {
      v4 = -[MSXPCService newConnectionForInterface:](self, "newConnectionForInterface:", self->_remoteObjectInterface);
      v5 = self->_connection;
      self->_connection = v4;

      -[NSXPCConnection resume](self->_connection, "resume");
    }
    -[NSLock unlock](self->_lock, "unlock");
    connection = self->_connection;
  }
  return connection;
}

- (id)newConnectionForInterface:(id)a3
{
  id v4;
  MSXPCConnection *v5;
  void *v6;
  MSXPCConnection *v7;

  v4 = a3;
  v5 = [MSXPCConnection alloc];
  objc_msgSend(v4, "protocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MSXPCConnection initWithProtocol:](v5, "initWithProtocol:", v6);

  -[MSXPCConnection setShouldLaunchMobileMail:](v7, "setShouldLaunchMobileMail:", -[MSXPCService shouldLaunchMobileMail](self, "shouldLaunchMobileMail"));
  -[MSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v4);

  return v7;
}

- (BOOL)shouldLaunchMobileMail
{
  return self->_shouldLaunchMobileMail;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  MSXPCService *v14;
  id v15;

  v4 = a3;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __50__MSXPCService_remoteObjectProxyWithErrorHandler___block_invoke;
  v13 = &unk_24C3859F8;
  v5 = v4;
  v14 = self;
  v15 = v5;
  v6 = (void *)MEMORY[0x20BD2EB84](&v10);
  -[MSXPCService connection](self, "connection", v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MSXPCService)init
{
  return -[MSXPCService initWithRemoteObjectInterface:](self, "initWithRemoteObjectInterface:", 0);
}

+ (id)remoteProxyForXPCInterface:(id)a3 connectionErrorHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "remoteProxyForXPCInterface:shouldLaunchMobileMail:connectionErrorHandler:", v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)remoteProxyForXPCInterface:(id)a3 shouldLaunchMobileMail:(BOOL)a4 connectionErrorHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRemoteObjectInterface:", v7);
  objc_msgSend(v9, "setShouldLaunchMobileMail:", v6);
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)remoteObjectProxy
{
  return -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", 0);
}

void __50__MSXPCService_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  v4 = (id)objc_opt_self();

}

- (void)setShouldLaunchMobileMail:(BOOL)a3
{
  self->_shouldLaunchMobileMail = a3;
}

@end
