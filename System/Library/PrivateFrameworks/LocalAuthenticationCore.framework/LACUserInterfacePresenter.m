@implementation LACUserInterfacePresenter

- (LACUserInterfacePresenter)initWithReplyQueue:(id)a3 uiController:(id)a4
{
  id v7;
  id v8;
  LACUserInterfacePresenter *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  OS_dispatch_queue *workQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACUserInterfacePresenter;
  v9 = -[LACUserInterfacePresenter init](&v15, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_replyQueue, a3);
    objc_storeStrong((id *)&v9->_uiController, a4);
  }

  return v9;
}

- (void)presentUIForIdentifier:(int64_t)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *replyQueue;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *workQueue;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[2];
  _QWORD block[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    objc_msgSend(v8, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    LACLogUI();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        NSStringFromLACUserInterfaceRequestIdentifier(a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v16;
        v39 = 2114;
        v40 = v17;
        _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Skipping UI for %@ rid: %{public}@, not interactive evaluation", buf, 0x16u);

      }
      replyQueue = self->_replyQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_5;
      block[3] = &unk_2510C1818;
      v33 = v9;
      dispatch_async(replyQueue, block);

    }
    else
    {
      if (v15)
      {
        NSStringFromLACUserInterfaceRequestIdentifier(a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Will present UI for %@", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      workQueue = self->_workQueue;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_6;
      v28[3] = &unk_2510C12E0;
      objc_copyWeak(v31, (id *)buf);
      v29 = v8;
      v31[1] = (id)a3;
      v30 = v9;
      dispatch_async(workQueue, v28);

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    LACLogUI();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[LACUserInterfacePresenter presentUIForIdentifier:request:completion:].cold.1((uint64_t)self, a3, v19);

    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Unsupported user interface request: %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self->_replyQueue;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke;
    v34[3] = &unk_2510C13A8;
    v35 = v23;
    v36 = v9;
    v25 = v23;
    dispatch_async(v24, v34);

  }
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_6(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  LACUserInterfaceRequest *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 3);
    objc_msgSend(*(id *)(a1 + 32), "contextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInterfaceWithUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 32);
    v10 = -[LACUserInterfaceRequest initWithIdentifier:evaluationRequest:]([LACUserInterfaceRequest alloc], "initWithIdentifier:evaluationRequest:", v8, v9);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_3;
    v12[3] = &unk_2510C1868;
    v15[1] = *(id *)(a1 + 56);
    objc_copyWeak(v15, v2);
    v14 = *(id *)(a1 + 40);
    v11 = v7;
    v13 = v11;
    objc_msgSend(v11, "processRequest:completion:", v10, v12);

    objc_destroyWeak(v15);
  }

}

void __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogUI();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromLACUserInterfaceRequestIdentifier(*(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "Did dismiss UI for %@ with error: %@", buf, 0x16u);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_9;
    block[3] = &unk_2510C1840;
    v12 = *(id *)(a1 + 40);
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

  }
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (void)presentUIForIdentifier:(uint64_t)a1 request:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromLACUserInterfaceRequestIdentifier(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_2409DC000, a3, OS_LOG_TYPE_ERROR, "%@ cannot present UI for identifier: %@", (uint8_t *)&v6, 0x16u);

}

@end
