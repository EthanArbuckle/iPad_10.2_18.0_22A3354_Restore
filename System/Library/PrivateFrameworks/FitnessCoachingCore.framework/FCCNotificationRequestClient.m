@implementation FCCNotificationRequestClient

- (FCCNotificationRequestClient)init
{
  FCCXPCClient *v3;
  void *v4;
  FCCNotificationRequestClient *v5;

  v3 = objc_alloc_init(FCCXPCClient);
  HKCreateSerialDispatchQueueWithQOSClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCCNotificationRequestClient initWithQueue:xpcClient:](self, "initWithQueue:xpcClient:", v4, v3);

  return v5;
}

- (FCCNotificationRequestClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7;
  id v8;
  FCCNotificationRequestClient *v9;
  FCCNotificationRequestClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCNotificationRequestClient;
  v9 = -[FCCNotificationRequestClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postSampleNotificationWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__FCCNotificationRequestClient_postSampleNotificationWithCompletion___block_invoke;
  v7[3] = &unk_1E6210170;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __69__FCCNotificationRequestClient_postSampleNotificationWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSampleNotificationWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_postSampleNotificationWithCompletion:(id)a3
{
  -[FCCXPCClient transportMessage:data:completion:](self->_xpcClient, "transportMessage:data:completion:", 2, 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
