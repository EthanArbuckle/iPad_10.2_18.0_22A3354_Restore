@implementation VSServiceConnectionHandler

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConnection:(id)a3
{
  NSXPCConnection *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = (NSXPCConnection *)a3;
  if (self->_connection != v5)
  {
    objc_storeStrong((id *)&self->_connection, a3);
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__VSServiceConnectionHandler_setConnection___block_invoke;
    v9[3] = &unk_1E939FD70;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInterruptionHandler:](v5, "setInterruptionHandler:", v9);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __44__VSServiceConnectionHandler_setConnection___block_invoke_2;
    v7[3] = &unk_1E939FD70;
    objc_copyWeak(&v8, &location);
    -[NSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_didFinish
{
  id v3;

  -[VSServiceConnectionHandler delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionHandlerDidFinish:", self);

}

void __44__VSServiceConnectionHandler_setConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinish");

}

void __44__VSServiceConnectionHandler_setConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinish");

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (VSServiceConnectionHandlerDelegate)delegate
{
  return (VSServiceConnectionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
