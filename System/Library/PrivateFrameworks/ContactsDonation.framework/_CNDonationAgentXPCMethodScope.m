@implementation _CNDonationAgentXPCMethodScope

- (_CNDonationAgentXPCMethodScope)init
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _CNDonationAgentXPCMethodScope *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE192C0]);
  objc_initWeak(&location, v3);
  v4 = +[CNDonationAgentXPCAdapter newXPCConnection](CNDonationAgentXPCAdapter, "newXPCConnection");
  v5 = (void *)MEMORY[0x24BE192F0];
  v22[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAllowedClasses:toInterface:forSelector:argumentIndex:ofReply:", v6, v7, sel_meCardDonations_, 0, 1);

  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __38___CNDonationAgentXPCMethodScope_init__block_invoke;
  v19[3] = &unk_24C236510;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __38___CNDonationAgentXPCMethodScope_init__block_invoke_2;
  v17[3] = &unk_24C236510;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v17);
  objc_msgSend(v4, "resume");
  v12 = v8;
  v13 = 3221225472;
  v14 = __38___CNDonationAgentXPCMethodScope_init__block_invoke_3;
  v15 = &unk_24C236538;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_CNDonationAgentXPCMethodScope initWithConnection:promise:proxy:](self, "initWithConnection:promise:proxy:", v4, v3, v9, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return v10;
}

- (_CNDonationAgentXPCMethodScope)initWithConnection:(id)a3 promise:(id)a4 proxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CNDonationAgentXPCMethodScope *v11;
  _CNDonationAgentXPCMethodScope *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _CNDonationAgentXPCMethodScope *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_CNDonationAgentXPCMethodScope;
  v11 = -[_CNDonationAgentXPCMethodScope init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_promise, a4);
    objc_storeStrong((id *)&v12->_proxy, a5);
    -[CNPromise future](v12->_promise, "future");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67___CNDonationAgentXPCMethodScope_initWithConnection_promise_proxy___block_invoke;
    v21[3] = &unk_24C236560;
    v15 = v8;
    v22 = v15;
    objc_msgSend(v13, "addSuccessBlock:", v21);

    -[CNPromise future](v12->_promise, "future");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __67___CNDonationAgentXPCMethodScope_initWithConnection_promise_proxy___block_invoke_2;
    v19[3] = &unk_24C236588;
    v20 = v15;
    objc_msgSend(v16, "addFailureBlock:", v19);

    v17 = v12;
  }

  return v12;
}

- (_CNDonationAgentXPCMethodScope)initWithPromise:(id)a3 proxy:(id)a4
{
  return -[_CNDonationAgentXPCMethodScope initWithConnection:promise:proxy:](self, "initWithConnection:promise:proxy:", 0, a3, a4);
}

- (DonationAgentProtocol)proxy
{
  return self->_proxy;
}

- (CNPromise)promise
{
  return self->_promise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
