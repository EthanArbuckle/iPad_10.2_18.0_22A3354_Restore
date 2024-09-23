@implementation CRKInternetDateServiceProxy

- (CRKInternetDateServiceProxy)init
{
  CRKInternetDateServiceProxy *v2;
  CRKValidXPCConnectionProvider *v3;
  CRKValidXPCConnectionProvider *connectionProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKInternetDateServiceProxy;
  v2 = -[CRKInternetDateServiceProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CRKValidXPCConnectionProvider initWithBuilder:]([CRKValidXPCConnectionProvider alloc], "initWithBuilder:", &__block_literal_global_116);
    connectionProvider = v2->_connectionProvider;
    v2->_connectionProvider = v3;

  }
  return v2;
}

uint64_t __35__CRKInternetDateServiceProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD1988], "crk_internetDateServiceConnection");
}

- (void)fetchInternetDateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__CRKInternetDateServiceProxy_fetchInternetDateWithCompletion___block_invoke;
  v6[3] = &unk_24D9CAA40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKInternetDateServiceProxy _fetchInternetDateWithCompletion:](self, "_fetchInternetDateWithCompletion:", v6);

}

void __63__CRKInternetDateServiceProxy_fetchInternetDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchInternetDateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[CRKInternetDateServiceProxy connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke;
  v13[3] = &unk_24D9C6EB0;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_3;
  v11[3] = &unk_24D9CAA68;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "fetchInternetDateWithCompletion:", v11);

}

void __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_2;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_4;
  block[3] = &unk_24D9C7620;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (CRKValidXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProvider, 0);
}

@end
