@implementation MTSXPCConnection

- (MTSXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  void *v6;
  MTSXPCConnection *v7;
  MTSXPCConnection *v8;
  MTSXPCConnection *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSXPCConnection;
    v7 = -[MTSXPCConnection init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_xpcConnection, a3);

    return v8;
  }
  else
  {
    v10 = (MTSXPCConnection *)_HMFPreconditionFailure();
    return (MTSXPCConnection *)-[MTSXPCConnection processInfo](v10, v11);
  }
}

- (HMFProcessInfo)processInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE3F258];
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processInfoForXPCConnection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFProcessInfo *)v4;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)exportedObject
{
  void *v2;
  void *v3;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setExportedObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v4);

}

- (NSXPCInterface)exportedInterface
{
  void *v2;
  void *v3;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCInterface *)v3;
}

- (void)setExportedInterface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v4);

}

- (NSXPCInterface)remoteObjectInterface
{
  void *v2;
  void *v3;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCInterface *)v3;
}

- (void)setRemoteObjectInterface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

}

- (id)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)interruptionHandler
{
  void *v2;
  void *v3;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interruptionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v4);

}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", v4);

}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)activate
{
  id v2;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)resume
{
  id v2;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)invalidate
{
  id v2;

  -[MTSXPCConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

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

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[MTSXPCConnection processIdentifier](self, "processIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Process ID"), v4);
  v12[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSXPCConnection processInfo](self, "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Process Name"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
