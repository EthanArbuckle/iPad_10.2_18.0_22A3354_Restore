@implementation MTRDeviceControllerXPCProxyHandle

- (MTRDeviceControllerXPCProxyHandle)initWithXPCConnection:(id)a3
{
  id v4;
  MTRDeviceControllerXPCProxyHandle *v5;
  MTRDeviceControllerXPCProxyHandle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTRDeviceControllerXPCProxyHandle;
  v5 = -[MTRDeviceControllerXPCProxyHandle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_xpcConnection, v4);

  return v6;
}

- (MTRDeviceControllerServerProtocol)proxy
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend_remoteObjectProxy(WeakRetained, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRDeviceControllerServerProtocol *)v5;
}

- (void)dealloc
{
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend_invalidate(WeakRetained, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)MTRDeviceControllerXPCProxyHandle;
  -[MTRDeviceControllerXPCProxyHandle dealloc](&v6, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end
