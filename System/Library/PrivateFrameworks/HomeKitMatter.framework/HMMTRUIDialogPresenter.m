@implementation HMMTRUIDialogPresenter

- (HMMTRUIDialogPresenter)initWithQueue:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  HMMTRUIDialogPresenter *v9;
  HMMTRUIDialogPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRUIDialogPresenter;
  v9 = -[HMMTRUIDialogPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeStrong(&v10->_context, a4);
  }

  return v10;
}

- (void)setDialogDelegate:(id)a3
{
  objc_storeWeak(&self->_dialogDelegate, a3);
}

- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRUIDialogPresenter clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRUIDialogPresenter clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)context
{
  return self->_context;
}

- (id)dialogDelegate
{
  return objc_loadWeakRetained(&self->_dialogDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_dialogDelegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dialogDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dialogDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke_2;
      v17[3] = &unk_250F21220;
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v3, "requestUserPermissionForBridgeAccessory:withContext:queue:completionHandler:", v4, v5, v6, v17);

      v7 = v18;
    }
    else
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, 1, v7);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Dialog delegate is not set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dialogDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dialogDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke_2;
      v17[3] = &unk_250F21220;
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v3, "requestUserPermissionForUnauthenticatedAccessory:withContext:queue:completionHandler:", v4, v5, v6, v17);

      v7 = v18;
    }
    else
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, 1, v7);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Dialog delegate is not set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
