@implementation ATStatusObserverConnection

- (ATStatusObserverConnection)initWithConnection:(id)a3
{
  id v5;
  ATStatusObserverConnection *v6;
  ATStatusObserverConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATStatusObserverConnection;
  v6 = -[ATStatusObserverConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)monitor:(id)a3 didUpdateWithStatus:(id)a4
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a4;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithStatus:", v5);

}

- (void)fetchAllStatusWithCompletion:(id)a3
{
  void (**v3)(id, id, _QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(id, id, _QWORD))a3;
  +[ATStatusMonitor sharedMonitor](ATStatusMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allStatus");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3[2](v3, v5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
