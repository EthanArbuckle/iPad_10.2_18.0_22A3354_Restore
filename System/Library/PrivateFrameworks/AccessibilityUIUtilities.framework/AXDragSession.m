@implementation AXDragSession

- (AXDragSession)initWithDruidConnection:(id)a3
{
  id v5;
  AXDragSession *v6;
  AXDragSession *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXDragSession;
  v6 = -[AXDragSession init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    _DUINewServerSessionAccessibilityInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v8);

    _DUINewClientSessionAccessibilityInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7->_connection, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__AXDragSession_initWithDruidConnection___block_invoke;
    v11[3] = &unk_1E76AB200;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v7->_connection, "setInvalidationHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __41__AXDragSession_initWithDruidConnection___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dragSessionWasTerminated:", WeakRetained);

  objc_msgSend(WeakRetained, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionWasTerminated:", WeakRetained);

}

- (id)_serverSession
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)dragWillBeginWithReply:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)dragStatusDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXDragSession delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dragSessionChanged:toStatus:", self, v4);

}

- (void)dragDidEndWithOperation:(unint64_t)a3
{
  void *v5;

  -[AXDragSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dragSessionEnded:withOperation:", self, a3);

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)resume
{
  -[NSXPCConnection resume](self->_connection, "resume");
  self->_resumed = 1;
}

- (void)abort
{
  void *v3;
  id v4;

  self->_aborted = 1;
  -[AXDragSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dragSessionWasTerminated:", self);

  -[AXDragSession manager](self, "manager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionWasTerminated:", self);

}

- (void)drop
{
  id v2;

  -[AXDragSession _serverSession](self, "_serverSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDrop");

}

- (void)cancel
{
  void *v3;

  -[AXDragSession _serverSession](self, "_serverSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityCancel");

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)moveToPoint:(CGPoint)a3 forRequestor:(id)a4 completion:(id)a5
{
  double y;
  double x;
  void (**v9)(id, uint64_t);
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v14 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  -[AXDragSession _serverSession](self, "_serverSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityMoveToPoint:", x, y);

  v9[2](v9, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "dragSession:movedToPoint:byRequestor:", self, v14, x, y);

  }
}

- (id)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (AXDragSessionDelegate)delegate
{
  return (AXDragSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
