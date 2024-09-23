@implementation LACUNManagerQueueDecorator

- (LACUNManagerQueueDecorator)initWithManager:(id)a3 replyQueue:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  LACUNManagerQueueDecorator *v11;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACUNManagerQueueDecorator initWithManager:workQueue:replyQueue:](self, "initWithManager:workQueue:replyQueue:", v7, v10, v6);
  return v11;
}

- (LACUNManagerQueueDecorator)initWithManager:(id)a3 workQueue:(id)a4 replyQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACUNManagerQueueDecorator *v12;
  LACUNManagerQueueDecorator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACUNManagerQueueDecorator;
  v12 = -[LACUNManagerQueueDecorator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_manager, a3);
    -[LACUNManager setDelegate:](v13->_manager, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
    objc_storeStrong((id *)&v13->_workQueue, a4);
  }

  return v13;
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke;
  v11[3] = &unk_2510C1140;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 2);
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_2;
    v7[3] = &unk_2510C1470;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "postNotification:completion:", v6, v7);

    objc_destroyWeak(&v9);
  }

}

void __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_3;
    v7[3] = &unk_2510C13A8;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke;
  block[3] = &unk_2510C2608;
  objc_copyWeak(&v16, &location);
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 2);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_2;
    v8[3] = &unk_2510C1470;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v5, "cancelNotificationsWithIdentifiers:scheduledOnly:completion:", v6, v7, v8);

    objc_destroyWeak(&v10);
  }

}

void __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_3;
    v7[3] = &unk_2510C13A8;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke;
  block[3] = &unk_2510C1B50;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 2);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_2;
    v6[3] = &unk_2510C1470;
    objc_copyWeak(&v8, v2);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "cancelAllNotificationsWithCompletion:", v6);

    objc_destroyWeak(&v8);
  }

}

void __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_3;
    v7[3] = &unk_2510C13A8;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (LACUNManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)notificationManager:(id)a3 didRespondToNotification:(id)a4 fromCategory:(id)a5 withAction:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *replyQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_initWeak(&location, self);
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__LACUNManagerQueueDecorator_notificationManager_didRespondToNotification_fromCategory_withAction_completionHandler___block_invoke;
  block[3] = &unk_2510C2630;
  objc_copyWeak(&v25, &location);
  block[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(replyQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __117__LACUNManagerQueueDecorator_notificationManager_didRespondToNotification_fromCategory_withAction_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "notificationManager:didRespondToNotification:fromCategory:withAction:completionHandler:", WeakRetained, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
