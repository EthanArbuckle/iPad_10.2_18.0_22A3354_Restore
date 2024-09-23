@implementation MTSXPCListener

- (MTSXPCListener)initWithXPCListener:(id)a3
{
  id v5;
  void *v6;
  MTSXPCListener *v7;
  MTSXPCListener *v8;
  MTSXPCListener *result;
  MTSXPCListener *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSXPCListener;
    v7 = -[MTSXPCListener init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_xpcListener, a3);

    return v8;
  }
  else
  {
    v10 = (MTSXPCListener *)_HMFPreconditionFailure();
    -[MTSXPCListener start](v10, v11);
  }
  return result;
}

- (void)start
{
  void *v3;
  id v4;

  -[MTSXPCListener xpcListener](self, "xpcListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[MTSXPCListener xpcListener](self, "xpcListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  MTSXPCConnection *v6;
  void *v7;

  v5 = a4;
  v6 = -[MTSXPCConnection initWithXPCConnection:]([MTSXPCConnection alloc], "initWithXPCConnection:", v5);

  -[MTSXPCListener delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "listener:shouldAcceptNewConnection:", self, v6);

  return (char)self;
}

- (MTSXPCListenerDelegate)delegate
{
  return (MTSXPCListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
