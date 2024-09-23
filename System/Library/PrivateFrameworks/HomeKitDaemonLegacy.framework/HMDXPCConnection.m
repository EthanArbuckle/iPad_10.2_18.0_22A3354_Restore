@implementation HMDXPCConnection

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDXPCConnection processIdentifier](self, "processIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Process ID"), v4);
  v12[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDXPCConnection processInfo](self, "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Process Name"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (HMFProcessInfo)processInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D28688];
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processInfoForXPCConnection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFProcessInfo *)v4;
}

- (void)setExportedInterface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v4);

}

- (void)setExportedObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v4);

}

- (void)setRemoteObjectInterface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", v4);

}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v4);

}

- (void)resume
{
  id v2;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (HMDXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  void *v6;
  HMDXPCConnection *v7;
  HMDXPCConnection *v8;
  HMDXPCConnection *result;
  HMDXPCClientConnection *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)HMDXPCConnection;
    v7 = -[HMDXPCConnection init](&v13, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_xpcConnection, a3);

    return v8;
  }
  else
  {
    v10 = (HMDXPCClientConnection *)_HMFPreconditionFailure();
    -[HMDXPCClientConnection setProcessInfo:](v10, v11, v12);
  }
  return result;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (void)setQueue:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_queue)queue
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (OS_dispatch_queue *)v5;
}

- (id)exportedObject
{
  void *v2;
  void *v3;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSXPCInterface)exportedInterface
{
  void *v2;
  void *v3;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCInterface *)v3;
}

- (NSXPCInterface)remoteObjectInterface
{
  void *v2;
  void *v3;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCInterface *)v3;
}

- (id)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)interruptionHandler
{
  void *v2;
  void *v3;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interruptionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)activate
{
  id v2;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)invalidate
{
  id v2;

  -[HMDXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
