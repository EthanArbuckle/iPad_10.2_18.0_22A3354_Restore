@implementation TKTokenConnection

- (TKTokenConnection)initWithToken:(id)a3
{
  id v5;
  TKTokenConnection *v6;
  TKTokenConnection *v7;
  uint64_t v8;
  NSMapTable *sessions;
  void *v10;
  void *v11;
  uint64_t v12;
  id initialKeepAlive;
  uint64_t v14;
  NSXPCListener *listener;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TKTokenConnection;
  v6 = -[TKTokenConnection init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    sessions = v7->_sessions;
    v7->_sessions = (NSMapTable *)v8;

    -[TKTokenConnection token](v7, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tokenDriver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keepAlive");
    v12 = objc_claimAutoreleasedReturnValue();
    initialKeepAlive = v7->_initialKeepAlive;
    v7->_initialKeepAlive = (id)v12;

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v14 = objc_claimAutoreleasedReturnValue();
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v14;

    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_listener, "resume");
  }

  return v7;
}

- (void)invalidate
{
  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  TKTokenSessionConnection *v8;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EF235888);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  v8 = -[TKTokenSessionConnection initWithTokenConnection:]([TKTokenSessionConnection alloc], "initWithTokenConnection:", self);
  objc_msgSend(v6, "setExportedObject:", v8);

  objc_msgSend(v6, "resume");
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[TKTokenConnection token](self, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "terminate");

  v4.receiver = self;
  v4.super_class = (Class)TKTokenConnection;
  -[TKTokenConnection dealloc](&v4, sel_dealloc);
}

- (TKToken)token
{
  return self->_token;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSMapTable)sessions
{
  return self->_sessions;
}

- (id)initialKeepAlive
{
  return self->_initialKeepAlive;
}

- (void)setInitialKeepAlive:(id)a3
{
  objc_storeStrong(&self->_initialKeepAlive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialKeepAlive, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
