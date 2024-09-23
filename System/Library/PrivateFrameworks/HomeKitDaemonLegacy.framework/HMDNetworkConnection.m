@implementation HMDNetworkConnection

- (HMDNetworkConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  HMDNetworkConnection *v8;
  nw_connection_t v9;
  OS_nw_connection *nwConnection;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkConnection;
  v8 = -[HMDNetworkConnection init](&v12, sel_init);
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

  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_start(v2);

}

- (void)cancel
{
  NSObject *v2;

  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_connection_cancel(v2);

}

- (void)sendData:(id)a3 context:(id)a4 isComplete:(BOOL)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD completion[4];
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v13 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __63__HMDNetworkConnection_sendData_context_isComplete_completion___block_invoke;
  completion[3] = &unk_1E89B07D0;
  v16 = v10;
  v14 = v10;
  nw_connection_send(v13, v12, v11, a5, completion);

}

- (void)receiveWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD completion[4];
  id v12;

  v8 = a5;
  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __66__HMDNetworkConnection_receiveWithMinLength_maxLength_completion___block_invoke;
  completion[3] = &unk_1E89B07F8;
  v12 = v8;
  v10 = v8;
  nw_connection_receive(v9, a3, a4, completion);

}

- (void)receiveMessageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD completion[4];
  id v8;

  v4 = a3;
  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __53__HMDNetworkConnection_receiveMessageWithCompletion___block_invoke;
  completion[3] = &unk_1E89B07F8;
  v8 = v4;
  v6 = v4;
  nw_connection_receive_message(v5, completion);

}

- (void)setStateChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  v4 = a3;
  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__HMDNetworkConnection_setStateChangedHandler___block_invoke;
    handler[3] = &unk_1E89B0820;
    v8 = v4;
    nw_connection_set_state_changed_handler(v6, handler);

  }
  else
  {
    nw_connection_set_state_changed_handler(v5, 0);

  }
}

- (void)setReadCloseHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  nw_connection_set_read_close_handler();

}

- (void)resetTrafficClass:(unint64_t)a3
{
  id v3;

  -[HMDNetworkConnection nwConnection](self, "nwConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  nw_connection_reset_traffic_class();

}

- (void)setQueue:(id)a3
{
  NSObject *v5;
  NSObject *v6;

  objc_storeStrong((id *)&self->_queue, a3);
  v5 = a3;
  -[HMDNetworkConnection nwConnection](self, "nwConnection");
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

void __47__HMDNetworkConnection_setStateChangedHandler___block_invoke(uint64_t a1, uint64_t a2, nw_error_t error)
{
  uint64_t v4;
  nw_error_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (error)
    error = (nw_error_t)nw_error_copy_cf_error(error);
  v5 = error;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);

}

void __53__HMDNetworkConnection_receiveMessageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, NSObject *a5)
{
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v9 = a3;
  v10 = *(_QWORD *)(a1 + 32);
  if (a5)
    a5 = nw_error_copy_cf_error(a5);
  (*(void (**)(uint64_t, id, id, uint64_t, NSObject *))(v10 + 16))(v10, v11, v9, a4, a5);

}

void __66__HMDNetworkConnection_receiveWithMinLength_maxLength_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, NSObject *a5)
{
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v9 = a3;
  v10 = *(_QWORD *)(a1 + 32);
  if (a5)
    a5 = nw_error_copy_cf_error(a5);
  (*(void (**)(uint64_t, id, id, uint64_t, NSObject *))(v10 + 16))(v10, v11, v9, a4, a5);

}

void __63__HMDNetworkConnection_sendData_context_isComplete_completion___block_invoke(uint64_t a1, nw_error_t error)
{
  uint64_t v2;
  nw_error_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (error)
    error = (nw_error_t)nw_error_copy_cf_error(error);
  v3 = error;
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

@end
