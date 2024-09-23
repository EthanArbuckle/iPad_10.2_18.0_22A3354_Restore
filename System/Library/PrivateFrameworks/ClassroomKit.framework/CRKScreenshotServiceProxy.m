@implementation CRKScreenshotServiceProxy

- (CRKScreenshotServiceProxy)init
{
  CRKScreenshotServiceProxy *v2;
  CRKValidXPCConnectionProvider *v3;
  CRKValidXPCConnectionProvider *connectionProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKScreenshotServiceProxy;
  v2 = -[CRKScreenshotServiceProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CRKValidXPCConnectionProvider initWithBuilder:]([CRKValidXPCConnectionProvider alloc], "initWithBuilder:", &__block_literal_global_94);
    connectionProvider = v2->_connectionProvider;
    v2->_connectionProvider = v3;

  }
  return v2;
}

uint64_t __33__CRKScreenshotServiceProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD1988], "crk_screenshotServiceConnection");
}

- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__CRKScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke;
  v9[3] = &unk_24D9C8E68;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[CRKScreenshotServiceProxy _fetchScreenshotDataWithMaximumSizeInPixels:completion:](self, "_fetchScreenshotDataWithMaximumSizeInPixels:completion:", v9, width, height);

}

void __83__CRKScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[CRKScreenshotServiceProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke;
  v16[3] = &unk_24D9C6EB0;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_3;
  v14[3] = &unk_24D9CA128;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "fetchScreenshotDataWithMaximumSizeInPixels:completion:", v14, width, height);

}

void __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_2;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  block[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_4;
  block[3] = &unk_24D9C7620;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_4(_QWORD *a1)
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
