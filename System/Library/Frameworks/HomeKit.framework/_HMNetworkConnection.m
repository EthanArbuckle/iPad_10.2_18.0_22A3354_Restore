@implementation _HMNetworkConnection

- (_HMNetworkConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  _HMNetworkConnection *v8;
  nw_connection_t v9;
  OS_nw_connection *nwConnection;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMNetworkConnection;
  v8 = -[_HMNetworkConnection init](&v12, sel_init);
  if (v8)
  {
    v9 = nw_connection_create(v6, v7);
    nwConnection = v8->_nwConnection;
    v8->_nwConnection = (OS_nw_connection *)v9;

  }
  return v8;
}

- (void)start
{
  NSObject *v2;

  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_start(v2);

}

- (void)cancel
{
  NSObject *v2;

  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_cancel(v2);

}

- (void)sendData:(id)a3 context:(id)a4 isComplete:(BOOL)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v13 = objc_claimAutoreleasedReturnValue();
  nw_connection_send(v13, v12, v11, a5, v10);

}

- (void)receiveMessageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_connection_receive_message(v5, v4);

}

- (void)setStateChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_state_changed_handler(v5, v4);

}

- (void)setViabilityChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_viability_changed_handler(v5, v4);

}

- (void)setPathChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  v4 = a3;
  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46___HMNetworkConnection_setPathChangedHandler___block_invoke;
    handler[3] = &unk_1E3AB3BC8;
    v8 = v4;
    nw_connection_set_path_changed_handler(v6, handler);

  }
  else
  {
    nw_connection_set_path_changed_handler(v5, 0);

  }
}

- (void)setQueue:(id)a3
{
  NSObject *v5;
  NSObject *v6;

  objc_storeStrong((id *)&self->_queue, a3);
  v5 = a3;
  -[_HMNetworkConnection nwConnection](self, "nwConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v6, v5);

}

- (OS_nw_connection)nwConnection
{
  return self->_nwConnection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nwConnection, 0);
}

@end
