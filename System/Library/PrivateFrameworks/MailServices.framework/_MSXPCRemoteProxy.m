@implementation _MSXPCRemoteProxy

- (void)forwardInvocation:(id)a3
{
  -[MSXPCConnection _sendInvocation:remoteInterface:remoteProxy:errorHandler:](self->_connection, "_sendInvocation:remoteInterface:remoteProxy:errorHandler:", a3, self->_remoteInterface, self, self->_errorHandler);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->____nsxpc_remoteObjectProxy, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)___nsxpc_remoteObjectProxy
{
  return self->____nsxpc_remoteObjectProxy;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  void *v6;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v9;
  objc_super v11;

  -[NSXPCInterface protocol](self->_remoteInterface, "protocol");
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: No protocol has been set on connection %@"), "-[_MSXPCRemoteProxy methodSignatureForSelector:]", self->_connection);
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_selectorLock);
  CFDictionaryGetValue(self->_knownSelectors, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_selectorLock);
  if (!v6)
  {
    MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);
    types = MethodDescription.types;
    if (MethodDescription.name || (v9 = protocol_getMethodDescription(v5, a3, 0, 1), types = v9.types, v9.name))
    {
      objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", types);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_8;
    }
    v11.receiver = self;
    v11.super_class = (Class)_MSXPCRemoteProxy;
    -[_MSXPCRemoteProxy methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_8:
      os_unfair_lock_lock(&self->_selectorLock);
      CFDictionarySetValue(self->_knownSelectors, a3, v6);
      os_unfair_lock_unlock(&self->_selectorLock);
    }
  }
LABEL_11:

  return v6;
}

- (void)___setNSXPCRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->____nsxpc_remoteObjectProxy, a3);
}

- (_MSXPCRemoteProxy)initWithConnection:(id)a3 interface:(id)a4 errorHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MSXPCRemoteProxy *v12;
  _MSXPCRemoteProxy *v13;
  uint64_t v14;
  id errorHandler;
  _MSXPCRemoteProxy *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_MSXPCRemoteProxy;
  v12 = -[_MSXPCRemoteProxy init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_selectorLock._os_unfair_lock_opaque = 0;
    v12->_knownSelectors = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    objc_storeStrong((id *)&v13->_connection, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    v14 = MEMORY[0x20BD2EB84](v11);
    errorHandler = v13->_errorHandler;
    v13->_errorHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (void)dealloc
{
  __CFDictionary *knownSelectors;
  objc_super v4;

  knownSelectors = self->_knownSelectors;
  if (knownSelectors)
    CFRelease(knownSelectors);
  v4.receiver = self;
  v4.super_class = (Class)_MSXPCRemoteProxy;
  -[_MSXPCRemoteProxy dealloc](&v4, sel_dealloc);
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  BOOL v5;
  Protocol *v6;
  objc_super v8;

  v4 = (Protocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_MSXPCRemoteProxy;
  if (-[_MSXPCRemoteProxy conformsToProtocol:](&v8, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[NSXPCInterface protocol](self->_remoteInterface, "protocol");
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    v5 = protocol_conformsToProtocol(v6, v4);

  }
  return v5;
}

- (id)remoteObjectProxy
{
  return -[_MSXPCRemoteProxy initWithConnection:interface:errorHandler:]([_MSXPCRemoteProxy alloc], "initWithConnection:interface:errorHandler:", self->_connection, self->_remoteInterface, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  _MSXPCRemoteProxy *v5;

  v4 = a3;
  v5 = -[_MSXPCRemoteProxy initWithConnection:interface:errorHandler:]([_MSXPCRemoteProxy alloc], "initWithConnection:interface:errorHandler:", self->_connection, self->_remoteInterface, v4);

  return v5;
}

@end
