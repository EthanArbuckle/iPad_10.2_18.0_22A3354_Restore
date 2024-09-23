@implementation PUEditingExtensionUndoProxyHostSide

- (PUEditingExtensionUndoProxyHostSide)init
{
  PUEditingExtensionUndoProxyHostSide *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUEditingExtensionUndoProxyHostSide;
  v2 = -[PUEditingExtensionUndoProxyHostSide init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  void *v2;
  void *v3;

  -[PUEditingExtensionUndoProxyHostSide listener](self, "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (id)remoteObject
{
  void *v2;
  void *v3;

  -[PUEditingExtensionUndoProxyHostSide connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_237);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[PUEditingExtensionUndoProxyHostSide connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C9D68);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C9DE8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_53);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_56);
    -[PUEditingExtensionUndoProxyHostSide setConnection:](self, "setConnection:", v5);
    objc_msgSend(v5, "resume");
  }

  return v6 == 0;
}

- (void)setShowUndoRedo:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUEditingExtensionUndoProxyHostSide target](self, "target");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowUndoRedo:", v3);

}

- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[PUEditingExtensionUndoProxyHostSide target](self, "target");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUndoEnabled:redoEnabled:", v5, v4);

}

- (void)performUndo
{
  id v2;

  -[PUEditingExtensionUndoProxyHostSide remoteObject](self, "remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performUndo");

}

- (void)performRedo
{
  id v2;

  -[PUEditingExtensionUndoProxyHostSide remoteObject](self, "remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRedo");

}

- (PUEditingExtensionUndoButtonHost)target
{
  return (PUEditingExtensionUndoButtonHost *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_target);
}

void __74__PUEditingExtensionUndoProxyHostSide_listener_shouldAcceptNewConnection___block_invoke_2()
{
  NSLog(CFSTR("PUEditingExtensionUndoProxyHostSide connection was invalidated"));
}

void __74__PUEditingExtensionUndoProxyHostSide_listener_shouldAcceptNewConnection___block_invoke()
{
  NSLog(CFSTR("PUEditingExtensionUndoProxyHostSide connection was interrupted"));
}

void __51__PUEditingExtensionUndoProxyHostSide_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("PUEditingExtensionUndoProxyHostSide remote object failed with error: %@"), a2);
}

@end
