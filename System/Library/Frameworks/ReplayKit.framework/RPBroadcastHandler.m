@implementation RPBroadcastHandler

- (void)_completeRequestWithReturnItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_serviceInfo)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "_rpLocalizationNotNeeded:", CFSTR("RPBroadcastExtensionKeyExtensionServiceInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);
    objc_msgSend(v5, "setAttributedTitle:", v8);

    v9 = objc_alloc(MEMORY[0x24BDD15F0]);
    v10 = (void *)objc_msgSend(v9, "initWithItem:typeIdentifier:", self->_serviceInfo, *MEMORY[0x24BDC1748]);
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttachments:", v11);

    objc_msgSend(v4, "arrayByAddingObject:", v5);
    v12 = objc_claimAutoreleasedReturnValue();

    -[RPBroadcastHandler setServiceInfo:](self, "setServiceInfo:", 0);
    v4 = (id)v12;
  }
  -[RPBroadcastHandler extensionContext](self, "extensionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "completeRequestReturningItems:completionHandler:", v4, 0);

}

- (RPBroadcastHandler)init
{
  RPBroadcastHandler *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPBroadcastHandler;
  v2 = -[RPBroadcastHandler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPBroadcastHandler setListener:](v2, "setListener:", v3);

    -[NSXPCListener resume](v2->_listener, "resume");
    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener endpoint](v2->_listener, "endpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPBroadcastHandler setListenerEndpoint:](v2, "setListenerEndpoint:", v4);

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  -[RPBroadcastHandler setConnection:](self, "setConnection:", a4);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81EA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_processPayload_completion_, 0, 0);

  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v5);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81F10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v9);

  -[NSXPCConnection resume](self->_connection, "resume");
  return 1;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (void)setServiceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serviceInfo, a3);
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContext, a3);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end
