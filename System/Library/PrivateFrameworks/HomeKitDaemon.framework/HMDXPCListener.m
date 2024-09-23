@implementation HMDXPCListener

- (HMDXPCListener)initWithXPCListener:(id)a3
{
  id v5;
  void *v6;
  HMDXPCListener *v7;
  HMDXPCListener *v8;
  HMDXPCListener *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDXPCListener;
    v7 = -[HMDXPCListener init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_xpcListener, a3);

    return v8;
  }
  else
  {
    v10 = (HMDXPCListener *)_HMFPreconditionFailure();
    return (HMDXPCListener *)-[HMDXPCListener queue](v10, v11);
  }
}

- (OS_dispatch_queue)queue
{
  void *v2;
  void *v3;

  -[HMDXPCListener xpcListener](self, "xpcListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)setQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCListener xpcListener](self, "xpcListener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v4);

}

- (void)start
{
  void *v3;
  id v4;

  -[HMDXPCListener xpcListener](self, "xpcListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[HMDXPCListener xpcListener](self, "xpcListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

- (void)stop
{
  id v2;

  -[HMDXPCListener xpcListener](self, "xpcListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  HMDXPCConnection *v6;
  void *v7;

  v5 = a4;
  v6 = -[HMDXPCConnection initWithXPCConnection:]([HMDXPCConnection alloc], "initWithXPCConnection:", v5);

  -[HMDXPCListener delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "listener:shouldAcceptNewConnection:", self, v6);

  return (char)self;
}

- (HMDXPCListenerDelegate)delegate
{
  return (HMDXPCListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
