@implementation FCCMoveModeClient

- (FCCMoveModeClient)init
{
  FCCXPCClient *v3;
  void *v4;
  FCCMoveModeClient *v5;

  v3 = objc_alloc_init(FCCXPCClient);
  HKCreateSerialDispatchQueueWithQOSClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCCMoveModeClient initWithQueue:xpcClient:](self, "initWithQueue:xpcClient:", v4, v3);

  return v5;
}

- (FCCMoveModeClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7;
  id v8;
  FCCMoveModeClient *v9;
  FCCMoveModeClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCMoveModeClient;
  v9 = -[FCCMoveModeClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postMoveModeNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FCCMoveModeClient_postMoveModeNotification_completion___block_invoke;
  block[3] = &unk_1E620FFE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __57__FCCMoveModeClient_postMoveModeNotification_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postMoveModeNotification:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_postMoveModeNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "transportData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCXPCClient transportMessage:data:completion:](self->_xpcClient, "transportMessage:data:completion:", 4, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
