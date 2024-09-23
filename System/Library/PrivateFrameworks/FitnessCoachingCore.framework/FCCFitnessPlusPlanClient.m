@implementation FCCFitnessPlusPlanClient

- (FCCFitnessPlusPlanClient)init
{
  FCCXPCClient *v3;
  void *v4;
  FCCFitnessPlusPlanClient *v5;

  v3 = objc_alloc_init(FCCXPCClient);
  HKCreateSerialDispatchQueueWithQOSClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCCFitnessPlusPlanClient initWithQueue:xpcClient:](self, "initWithQueue:xpcClient:", v4, v3);

  return v5;
}

- (FCCFitnessPlusPlanClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7;
  id v8;
  FCCFitnessPlusPlanClient *v9;
  FCCFitnessPlusPlanClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCFitnessPlusPlanClient;
  v9 = -[FCCFitnessPlusPlanClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postNotificationForType:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  FCCFitnessPlusPlanPostNotificationRequest *v10;
  NSObject *dispatchQueue;
  id v12;
  FCCFitnessPlusPlanPostNotificationRequest *v13;
  _QWORD block[5];
  FCCFitnessPlusPlanPostNotificationRequest *v15;
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[FCCFitnessPlusPlanPostNotificationRequest initWithType:force:]([FCCFitnessPlusPlanPostNotificationRequest alloc], "initWithType:force:", v9, v5);

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__FCCFitnessPlusPlanClient_postNotificationForType_force_completion___block_invoke;
  block[3] = &unk_1E620FFE8;
  block[4] = self;
  v15 = v10;
  v16 = v8;
  v12 = v8;
  v13 = v10;
  dispatch_async(dispatchQueue, block);

}

uint64_t __69__FCCFitnessPlusPlanClient_postNotificationForType_force_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationWithRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)hasPlanScheduledWorkoutsForTodayWithCompletion:(id)a3
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
  v7[2] = __75__FCCFitnessPlusPlanClient_hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke;
  v7[3] = &unk_1E6210170;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __75__FCCFitnessPlusPlanClient_hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hasPlanScheduledWorkoutsForTodayWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "transportData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCXPCClient transportMessage:data:completion:](self->_xpcClient, "transportMessage:data:completion:", 9, v7, v6);

}

- (void)_hasPlanScheduledWorkoutsForTodayWithCompletion:(id)a3
{
  id v4;
  FCCXPCClient *xpcClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  xpcClient = self->_xpcClient;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__FCCFitnessPlusPlanClient__hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke;
  v7[3] = &unk_1E62101B8;
  v8 = v4;
  v6 = v4;
  -[FCCXPCClient transportRequest:data:completion:](xpcClient, "transportRequest:data:completion:", 4, 0, v7);

}

void __76__FCCFitnessPlusPlanClient__hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCFitnessPlusPlanState *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[FCCFitnessPlusPlanState initWithTransportData:]([FCCFitnessPlusPlanState alloc], "initWithTransportData:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
