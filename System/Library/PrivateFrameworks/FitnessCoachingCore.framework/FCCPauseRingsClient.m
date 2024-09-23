@implementation FCCPauseRingsClient

- (FCCPauseRingsClient)init
{
  FCCXPCClient *v3;
  void *v4;
  FCCPauseRingsClient *v5;

  v3 = objc_alloc_init(FCCXPCClient);
  HKCreateSerialDispatchQueueWithQOSClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCCPauseRingsClient initWithQueue:xpcClient:](self, "initWithQueue:xpcClient:", v4, v3);

  return v5;
}

- (FCCPauseRingsClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7;
  id v8;
  FCCPauseRingsClient *v9;
  FCCPauseRingsClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCPauseRingsClient;
  v9 = -[FCCPauseRingsClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postNotificationWithForce:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  FCCPauseRingsPostNotificationRequest *v7;
  NSObject *dispatchQueue;
  id v9;
  FCCPauseRingsPostNotificationRequest *v10;
  _QWORD block[5];
  FCCPauseRingsPostNotificationRequest *v12;
  id v13;

  v4 = a3;
  v6 = a4;
  v7 = -[FCCPauseRingsPostNotificationRequest initWithForce:]([FCCPauseRingsPostNotificationRequest alloc], "initWithForce:", v4);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FCCPauseRingsClient_postNotificationWithForce_completion___block_invoke;
  block[3] = &unk_1E620FFE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

uint64_t __60__FCCPauseRingsClient_postNotificationWithForce_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationWithRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "transportData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCXPCClient transportMessage:data:completion:](self->_xpcClient, "transportMessage:data:completion:", 10, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
