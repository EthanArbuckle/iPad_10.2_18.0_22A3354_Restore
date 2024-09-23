@implementation FCCNotificationSuppressionClient

- (BOOL)notificationsSuppressed
{
  return -[FCCNotificationSuppressionStore notificationsSuppressed](self->_store, "notificationsSuppressed");
}

- (FCCNotificationSuppressionClient)init
{
  FCCNotificationSuppressionStore *v3;
  FCCXPCClient *v4;
  void *v5;
  FCCNotificationSuppressionClient *v6;

  v3 = objc_alloc_init(FCCNotificationSuppressionStore);
  v4 = objc_alloc_init(FCCXPCClient);
  HKCreateSerialDispatchQueueWithQOSClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCCNotificationSuppressionClient initWithQueue:store:xpcClient:](self, "initWithQueue:store:xpcClient:", v5, v3, v4);

  return v6;
}

- (FCCNotificationSuppressionClient)initWithQueue:(id)a3 store:(id)a4 xpcClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCCNotificationSuppressionClient *v12;
  FCCNotificationSuppressionClient *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCCNotificationSuppressionClient;
  v12 = -[FCCNotificationSuppressionClient init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dispatchQueue, a3);
    objc_storeStrong((id *)&v13->_store, a4);
    objc_storeStrong((id *)&v13->_xpcClient, a5);
  }

  return v13;
}

- (void)addNotificationSuppressionRequest:(id)a3 completion:(id)a4
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
  block[2] = __81__FCCNotificationSuppressionClient_addNotificationSuppressionRequest_completion___block_invoke;
  block[3] = &unk_1E620FFE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __81__FCCNotificationSuppressionClient_addNotificationSuppressionRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addNotificationSuppressionRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addNotificationSuppressionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "transportData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCXPCClient transportMessage:data:completion:](self->_xpcClient, "transportMessage:data:completion:", 7, v7, v6);

}

- (void)removeNotificationSuppressionRequest:(id)a3 completion:(id)a4
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
  block[2] = __84__FCCNotificationSuppressionClient_removeNotificationSuppressionRequest_completion___block_invoke;
  block[3] = &unk_1E620FFE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __84__FCCNotificationSuppressionClient_removeNotificationSuppressionRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNotificationSuppressionRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeNotificationSuppressionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "transportData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCXPCClient transportMessage:data:completion:](self->_xpcClient, "transportMessage:data:completion:", 8, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
