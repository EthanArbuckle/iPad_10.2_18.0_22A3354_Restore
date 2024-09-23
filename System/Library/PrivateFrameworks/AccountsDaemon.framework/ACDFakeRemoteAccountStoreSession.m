@implementation ACDFakeRemoteAccountStoreSession

- (ACDFakeRemoteAccountStoreSession)initWithFakeProxy:(id)a3
{
  id v4;
  ACDFakeRemoteAccountStoreSession *v5;
  ACDFakeRemoteAccountStoreSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACDFakeRemoteAccountStoreSession;
  v5 = -[ACRemoteAccountStoreSession init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_proxy, v4);

  return v6;
}

- (id)remoteObjectProxy
{
  return objc_loadWeakRetained((id *)&self->_proxy);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_proxy);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_proxy);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
}

@end
