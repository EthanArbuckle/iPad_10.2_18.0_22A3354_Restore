@implementation CWFXPCProxyConnection

- (CWFXPCProxyConnection)initWithForwardingTarget:(id)a3
{
  id v4;
  CWFXPCProxyConnection *v5;
  CWFXPCProxy *v6;
  CWFXPCProxy *XPCProxy;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCProxy *v11;
  CWFXPCProxy *v12;
  CWFXPCProxy *synchronousXPCProxy;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CWFXPCProxy *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CWFXPCProxyConnection;
  v5 = -[CWFXPCProxyConnection init](&v22, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = objc_alloc_init(CWFXPCProxy);
  XPCProxy = v5->_XPCProxy;
  v5->_XPCProxy = v6;

  v11 = v5->_XPCProxy;
  if (!v11)
    goto LABEL_6;
  objc_msgSend_setTarget_(v11, v8, (uint64_t)v4, v9, v10);
  v12 = objc_alloc_init(CWFXPCProxy);
  synchronousXPCProxy = v5->_synchronousXPCProxy;
  v5->_synchronousXPCProxy = v12;

  v17 = v5->_synchronousXPCProxy;
  if (v17)
  {
    objc_msgSend_setSynchronous_(v17, v14, 1, v15, v16);
    objc_msgSend_setTarget_(v5->_synchronousXPCProxy, v18, (uint64_t)v4, v19, v20);
  }
  else
  {
LABEL_6:

    v5 = 0;
  }

  return v5;
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void);

  objc_msgSend_setTarget_(self->_XPCProxy, a2, 0, v2, v3);
  objc_msgSend_setTarget_(self->_synchronousXPCProxy, v5, 0, v6, v7);
  objc_msgSend_invalidationHandler(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_invalidationHandler(self, v13, v14, v15, v16);
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v17[2]();

  }
  objc_msgSend_setInvalidationHandler_(self, v13, 0, v15, v16);
}

- (id)remoteObjectProxy
{
  return self->_XPCProxy;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return self->_XPCProxy;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return self->_synchronousXPCProxy;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_synchronousXPCProxy, 0);
  objc_storeStrong((id *)&self->_XPCProxy, 0);
}

@end
