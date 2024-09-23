@implementation _EMRemoteInterfaceDistantObject

- (void)_forwardStackInvocation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (**reattemptHandler)(id, void *);
  void *v8;
  int v9;
  _EMRemoteInterfaceDistantObject *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_proxyGenerator)
  {
    -[EMRemoteConnection _sendInvocation:withProxy:](self->_remoteInterface, "_sendInvocation:withProxy:", v4, self);
  }
  else
  {
    +[EMRemoteConnection log](EMRemoteConnection, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client instance no longer valid. Skipping fowarding stack invocation %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_reattemptHandler)
    {
      +[EMRemoteConnection log](EMRemoteConnection, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543618;
        v10 = self;
        v11 = 2114;
        v12 = v4;
        _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking reattemptHandler with EMConnectionInvalidated error for invocation %{public}@", (uint8_t *)&v9, 0x16u);
      }

      reattemptHandler = (void (**)(id, void *))self->_reattemptHandler;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      reattemptHandler[2](reattemptHandler, v8);

    }
  }

}

- (id)reattemptHandler
{
  return self->_reattemptHandler;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (_EMRemoteInterfaceDistantObject)initWithRemoteInterface:(id)a3 proxyGenerator:(id)a4 synchronous:(BOOL)a5 reattemptHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  _EMRemoteInterfaceDistantObject *v14;
  _EMRemoteInterfaceDistantObject *v15;
  uint64_t v16;
  id reattemptHandler;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_EMRemoteInterfaceDistantObject;
  v14 = -[_EMRemoteInterfaceDistantObject init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteInterface, a3);
    objc_storeStrong((id *)&v15->_proxyGenerator, a4);
    v15->_synchronous = a5;
    v16 = objc_msgSend(v13, "copy");
    reattemptHandler = v15->_reattemptHandler;
    v15->_reattemptHandler = (id)v16;

  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reattemptHandler, 0);
  objc_storeStrong((id *)&self->_proxyGenerator, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[EMRemoteConnection _methodSignatureForRemoteSelector:](self->_remoteInterface, "_methodSignatureForRemoteSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_EMRemoteInterfaceDistantObject;
    -[_EMRemoteInterfaceDistantObject methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  BOOL v5;
  Protocol *v6;
  objc_super v8;

  v4 = (Protocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_EMRemoteInterfaceDistantObject;
  if (-[_EMRemoteInterfaceDistantObject conformsToProtocol:](&v8, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[EMRemoteConnection protocol](self->_remoteInterface, "protocol");
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    v5 = protocol_conformsToProtocol(v6, v4);

  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if (-[EMRemoteConnection _respondsToRemoteSelector:](self->_remoteInterface, "_respondsToRemoteSelector:"))
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)_EMRemoteInterfaceDistantObject;
  return -[_EMRemoteInterfaceDistantObject respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (**reattemptHandler)(id, void *);
  void *v8;
  int v9;
  _EMRemoteInterfaceDistantObject *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_proxyGenerator)
  {
    -[EMRemoteConnection _sendInvocation:withProxy:](self->_remoteInterface, "_sendInvocation:withProxy:", v4, self);
  }
  else
  {
    +[EMRemoteConnection log](EMRemoteConnection, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client instance no longer valid. Skipping forwarding invocation %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_reattemptHandler)
    {
      +[EMRemoteConnection log](EMRemoteConnection, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543618;
        v10 = self;
        v11 = 2114;
        v12 = v4;
        _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking reattemptHandler with EMConnectionInvalidated error for invocation %{public}@", (uint8_t *)&v9, 0x16u);
      }

      reattemptHandler = (void (**)(id, void *))self->_reattemptHandler;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      reattemptHandler[2](reattemptHandler, v8);

    }
  }

}

- (id)reattemptingRemoteObjectProxy
{
  id v3;
  EMRemoteConnection *remoteInterface;
  EMRemoteProxyGenerator *proxyGenerator;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  defaultReattemptingHandlerForConnection(remoteInterface);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", remoteInterface, proxyGenerator, 0, v6);

  return v7;
}

- (id)remoteObjectProxy
{
  id v3;
  EMRemoteConnection *remoteInterface;
  EMRemoteProxyGenerator *proxyGenerator;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  defaultNonReattemptingHandlerForConnection(remoteInterface);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", remoteInterface, proxyGenerator, 0, v6);

  return v7;
}

- (id)reattemptingRemoteObjectProxyWithReattemptHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", self->_remoteInterface, self->_proxyGenerator, 0, v4);

  return v5;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  id v5;
  EMRemoteConnection *remoteInterface;
  EMRemoteProxyGenerator *proxyGenerator;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  nonReattemptingHandlerForErrorHandler(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", remoteInterface, proxyGenerator, 0, v8);

  return v9;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  id v5;
  EMRemoteConnection *remoteInterface;
  EMRemoteProxyGenerator *proxyGenerator;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  remoteInterface = self->_remoteInterface;
  proxyGenerator = self->_proxyGenerator;
  nonReattemptingHandlerForErrorHandler(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", remoteInterface, proxyGenerator, 1, v8);

  return v9;
}

- (EMRemoteConnection)remoteInterface
{
  return self->_remoteInterface;
}

- (EMRemoteProxyGenerator)proxyGenerator
{
  return self->_proxyGenerator;
}

- (void)setProxyGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_proxyGenerator, a3);
}

@end
