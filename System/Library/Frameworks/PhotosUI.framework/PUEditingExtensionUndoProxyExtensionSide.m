@implementation PUEditingExtensionUndoProxyExtensionSide

- (PUEditingExtensionUndoProxyExtensionSide)initWithEndpoint:(id)a3
{
  id v4;
  PUEditingExtensionUndoProxyExtensionSide *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUEditingExtensionUndoProxyExtensionSide;
  v5 = -[PUEditingExtensionUndoProxyExtensionSide init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v4);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C9DE8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", v8);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C9D68);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", &__block_literal_global_91);
    -[NSXPCConnection setInvalidationHandler:](v5->_connection, "setInvalidationHandler:", &__block_literal_global_94);
    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    -[NSXPCConnection resume](v5->_connection, "resume");
  }

  return v5;
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void)performUndo
{
  id v2;

  -[PUEditingExtensionUndoProxyExtensionSide target](self, "target");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performUndo");

}

- (void)performRedo
{
  id v2;

  -[PUEditingExtensionUndoProxyExtensionSide target](self, "target");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRedo");

}

- (id)remoteObject
{
  void *v2;
  void *v3;

  -[PUEditingExtensionUndoProxyExtensionSide connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_97);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setShowUndoRedo:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUEditingExtensionUndoProxyExtensionSide remoteObject](self, "remoteObject");
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
  -[PUEditingExtensionUndoProxyExtensionSide remoteObject](self, "remoteObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUndoEnabled:redoEnabled:", v5, v4);

}

- (PUEditingExtensionUndoTarget)target
{
  return (PUEditingExtensionUndoTarget *)objc_loadWeakRetained((id *)&self->_target);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_target);
}

void __56__PUEditingExtensionUndoProxyExtensionSide_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("PUEditingExtensionUndoProxyExtensionSide remote object failed with error: %@"), a2);
}

void __61__PUEditingExtensionUndoProxyExtensionSide_initWithEndpoint___block_invoke_2()
{
  NSLog(CFSTR("PUEditingExtensionUndoProxyExtensionSide connection was invalidated"));
}

void __61__PUEditingExtensionUndoProxyExtensionSide_initWithEndpoint___block_invoke()
{
  NSLog(CFSTR("PUEditingExtensionUndoProxyExtensionSide connection was interrupted"));
}

@end
