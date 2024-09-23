@implementation CRKDmdBackedInstructordTransportProvider

- (void)fetchTransportWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke;
  v7[3] = &unk_24D9CA710;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "performRequest:completion:", v5, v7);

}

void __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCF18];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke_2;
  v11[3] = &unk_24D9C6D98;
  v12 = v6;
  v8 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "cat_performBlockOnMainRunLoop:", v11);

}

void __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "endpoint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v4);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7B0]), "initWithXPCConnection:", v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

@end
