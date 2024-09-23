@implementation NPKSubcredentialInvitationCoordinator

- (NPKSubcredentialInvitationCoordinator)init
{
  return -[NPKSubcredentialInvitationCoordinator initWithCallbackQueue:](self, "initWithCallbackQueue:", MEMORY[0x24BDAC9B8]);
}

- (NPKSubcredentialInvitationCoordinator)initWithCallbackQueue:(id)a3
{
  id v4;
  NPKSubcredentialInvitationCoordinator *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKSubcredentialInvitationCoordinator;
  v5 = -[NPKSubcredentialInvitationCoordinator init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.NPKSubcredentialInvitationCoordinator", 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v6;

    if (v4)
    {
      v8 = (OS_dispatch_queue *)v4;
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v8;
    }
    else
    {
      v10 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v11 = MEMORY[0x24BDAC9B8];
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v10;
    }

  }
  return v5;
}

- (PKPaymentService)paymentService
{
  PKPaymentService *paymentService;
  PKPaymentService *v4;
  PKPaymentService *v5;

  paymentService = self->_paymentService;
  if (!paymentService)
  {
    v4 = (PKPaymentService *)objc_alloc_init(MEMORY[0x24BE6ED30]);
    v5 = self->_paymentService;
    self->_paymentService = v4;

    paymentService = self->_paymentService;
  }
  return paymentService;
}

- (NPKStandaloneFirstUnlockCoordinator)firstUnlockCoordinator
{
  NPKStandaloneFirstUnlockCoordinator *firstUnlockCoordinator;
  NPKStandaloneFirstUnlockCoordinator *v4;
  void *v5;
  NPKStandaloneFirstUnlockCoordinator *v6;
  NPKStandaloneFirstUnlockCoordinator *v7;

  firstUnlockCoordinator = self->_firstUnlockCoordinator;
  if (!firstUnlockCoordinator)
  {
    v4 = [NPKStandaloneFirstUnlockCoordinator alloc];
    -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NPKStandaloneFirstUnlockCoordinator initWithQueue:](v4, "initWithQueue:", v5);
    v7 = self->_firstUnlockCoordinator;
    self->_firstUnlockCoordinator = v6;

    firstUnlockCoordinator = self->_firstUnlockCoordinator;
  }
  return firstUnlockCoordinator;
}

- (NPKWatchSubcredentialProvisioningService)subcredentialProvisioningService
{
  NPKWatchSubcredentialProvisioningService *subcredentialProvisioningService;
  NPKWatchSubcredentialProvisioningService *v4;
  NPKWatchSubcredentialProvisioningService *v5;

  subcredentialProvisioningService = self->_subcredentialProvisioningService;
  if (!subcredentialProvisioningService)
  {
    v4 = objc_alloc_init(NPKWatchSubcredentialProvisioningService);
    v5 = self->_subcredentialProvisioningService;
    self->_subcredentialProvisioningService = v4;

    subcredentialProvisioningService = self->_subcredentialProvisioningService;
  }
  return subcredentialProvisioningService;
}

+ (BOOL)canAddSecureElementPassWithInvitation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6E990]);
  objc_msgSend(v5, "setSupportedRadioTechnologies:", objc_msgSend(v4, "supportedRadioTechnologies"));
  objc_msgSend(v4, "brandIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "setManufacturerIdentifier:", v6);
  }
  else
  {
    objc_msgSend(v4, "manufacturerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setManufacturerIdentifier:", v7);

  }
  v8 = objc_msgSend(a1, "canAddSecureElementPassWithConfiguration:outError:", v5, 0);

  return v8;
}

+ (BOOL)canAddSecureElementPassWithConfiguration:(id)a3 outError:(id *)a4
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE6EC00]);
    v7 = objc_msgSend(v6, "canAddSecureElementPassWithConfiguration:outError:", v5, a4);

  }
  else
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: %{public}@: Expected to have a configuration but instead found %@!", (uint8_t *)&v14, 0x16u);

      }
    }
    v7 = 0;
  }

  return v7;
}

- (void)canAcceptInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Checking whether pass library can accept invitation: %@ completion: %@", buf, 0x20u);

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_38;
  v15 = &unk_24CFE8510;
  objc_copyWeak(&v17, v2);
  v16 = *(id *)(a1 + 40);
  v11 = (void *)MEMORY[0x2199B6780](&v12);
  objc_msgSend(WeakRetained, "_queue_canAcceptInvitation:completion:", *(_QWORD *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_2;
  block[3] = &unk_24CFE84E8;
  block[4] = WeakRetained;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)listSubcredentialInvitationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke;
  block[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Listing subcredential invitations", buf, 0xCu);

    }
  }
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_41;
  v13 = &unk_24CFE8560;
  objc_copyWeak(&v15, v2);
  v14 = *(id *)(a1 + 32);
  v9 = (void *)MEMORY[0x2199B6780](&v10);
  objc_msgSend(WeakRetained, "_queue_listSubcredentialInvitationsWithCompletion:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
}

void __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_2;
  block[3] = &unk_24CFE84E8;
  block[4] = WeakRetained;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with invitations: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)startProvisioningWithInvitationIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke;
  v21[3] = &unk_24CFE8628;
  objc_copyWeak(&v25, &location);
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v15 = (void *)MEMORY[0x2199B6780](v21);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_5;
  block[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v20, &location);
  v19 = v15;
  v17 = v15;
  dispatch_async(v16, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Begin provisioning with invitation identifier: %@ metadata: %@ completion: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(WeakRetained, "setCompletion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setUpSubcredentialProvisioningController");
  v12 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_43;
  v13[3] = &unk_24CFE8600;
  objc_copyWeak(&v15, v2);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "_fetchInvitationWithIdentifier:completion:", v12, v13);

  objc_destroyWeak(&v15);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_2;
  v6[3] = &unk_24CFE85D8;
  v6[4] = WeakRetained;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v5 = v3;
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "canAcceptInvitation:completion:", v5, v6);

  objc_destroyWeak(&v9);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(a1[4], "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_3;
  v6[3] = &unk_24CFE85B0;
  objc_copyWeak(&v10, a1 + 7);
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "_handleProvisioningAttemptForConfiguration:error:", 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "subcredentialProvisioningController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setUpSharingSessionWithSubcredentialProvisioningController:forInvitation:", v5, *(_QWORD *)(a1 + 40));

    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "sharingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "_paymentWebService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_4;
    v10[3] = &unk_24CFE8588;
    objc_copyWeak(&v11, v2);
    objc_msgSend(v4, "_makeConfigurationForInvitation:session:metadata:paymentWebService:completion:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
  }

}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleProvisioningAttemptForConfiguration:error:", v6, v5);

}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performBlockFollowingFirstUnlockWithBlock:", *(_QWORD *)(a1 + 32));

}

- (void)startProvisioningWithInvitation:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke;
  v21[3] = &unk_24CFE8628;
  objc_copyWeak(&v25, &location);
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v15 = (void *)MEMORY[0x2199B6780](v21);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_4;
  block[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v20, &location);
  v19 = v15;
  v17 = v15;
  dispatch_async(v16, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Begin provisioning with invitation: %@ metadata: %@ completion: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(WeakRetained, "setCompletion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setUpSubcredentialProvisioningController");
  if (*(_QWORD *)(a1 + 32))
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_46;
    v18 = &unk_24CFE8678;
    objc_copyWeak(&v20, v2);
    v19 = *(id *)(a1 + 40);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B6780](&v15);
    v13 = objc_msgSend(*(id *)(a1 + 32), "type", v15, v16, v17, v18);
    if (v13)
    {
      if (v13 == 1)
        v12[2](v12, *(_QWORD *)(a1 + 32), 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "deviceContainsInvitationMatchingInvitation:withTimeout:completion:", *(_QWORD *)(a1 + 32), 60, v12);
    }

    objc_destroyWeak(&v20);
  }
  else
  {
    objc_msgSend(WeakRetained, "_errorWithCode:message:", 0, CFSTR("Unable to start provisioning - insufficient information"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleProvisioningAttemptForConfiguration:error:", 0, v14);

  }
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_2;
  block[3] = &unk_24CFE8650;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "subcredentialProvisioningController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setUpSharingSessionWithSubcredentialProvisioningController:forInvitation:", v4, *(_QWORD *)(a1 + 32));

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "sharingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "_paymentWebService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_3;
  v9[3] = &unk_24CFE8588;
  objc_copyWeak(&v10, v2);
  objc_msgSend(WeakRetained, "_makeConfigurationForInvitation:session:metadata:paymentWebService:completion:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleProvisioningAttemptForConfiguration:error:", v6, v5);

}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performBlockFollowingFirstUnlockWithBlock:", *(_QWORD *)(a1 + 32));

}

- (void)deviceContainsInvitationMatchingInvitation:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke;
  block[3] = &unk_24CFE86F0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138544130;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      v23 = 2048;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Checking whether device contains invitation matching invitation: %@ timeout: %lu completion: %@", buf, 0x2Au);

    }
  }
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_50;
  v16 = &unk_24CFE86C8;
  objc_copyWeak(&v18, v2);
  v17 = *(id *)(a1 + 40);
  v12 = (void *)MEMORY[0x2199B6780](&v13);
  objc_msgSend(WeakRetained, "_queue_deviceContainsInvitationMatchingInvitation:withTimeout:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v12, v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_2;
  v11[3] = &unk_24CFE86A0;
  v11[4] = WeakRetained;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

uint64_t __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with invitation: %@ error: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke;
  block[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Fetching account attestation anonymization salt", buf, 0xCu);

    }
  }
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_51;
  v13 = &unk_24CFE8718;
  objc_copyWeak(&v15, v2);
  v14 = *(id *)(a1 + 32);
  v9 = (void *)MEMORY[0x2199B6780](&v10);
  objc_msgSend(WeakRetained, "_queue_accountAttestationAnonymizationSaltWithCompletion:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
}

void __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_2;
  v11[3] = &unk_24CFE86A0;
  v11[4] = WeakRetained;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

uint64_t __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with anonymizationSalt: %@ error: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Setting account attestation anonymization salt: %@", buf, 0x16u);

    }
  }
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_53;
  v14 = &unk_24CFE8510;
  objc_copyWeak(&v16, v2);
  v15 = *(id *)(a1 + 40);
  v10 = (void *)MEMORY[0x2199B6780](&v11);
  objc_msgSend(WeakRetained, "_queue_setAccountAttestationAnonymizationSalt:completion:", *(_QWORD *)(a1 + 32), v10, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
}

void __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_2;
  block[3] = &unk_24CFE84E8;
  block[4] = WeakRetained;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)requestSubcredentialInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Requesting subcredential invitation: %@", buf, 0x16u);

    }
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_54;
  v15[3] = &unk_24CFE8768;
  objc_copyWeak(&v18, v2);
  v11 = *(void **)(a1 + 32);
  v10 = (id *)(a1 + 32);
  v16 = v11;
  v17 = v10[1];
  v12 = (void *)MEMORY[0x2199B6780](v15);
  v13 = *v10;
  objc_msgSend(*v10, "originatorIDSHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_queue_requestSubcredentialInvitation:fromIDSHandle:completion:", v13, v14, v12);

  objc_destroyWeak(&v18);
}

void __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_54(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_2;
  v8[3] = &unk_24CFE8740;
  v8[4] = WeakRetained;
  v9 = a1[4];
  v6 = a1[5];
  v10 = v3;
  v11 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with invitation: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)updateSubcredentialMetadataOnPass:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke;
  block[3] = &unk_24CFE8628;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Updating metadata on pass: %@ with credential: %@ completion: %@", buf, 0x2Au);

    }
  }
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_55;
  v16 = &unk_24CFE8790;
  objc_copyWeak(&v18, v2);
  v17 = *(id *)(a1 + 48);
  v12 = (void *)MEMORY[0x2199B6780](&v13);
  objc_msgSend(WeakRetained, "_queue_updateSubcredentialMetadataOnPass:withCredential:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v12, v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_2;
  block[3] = &unk_24CFE84E8;
  block[4] = WeakRetained;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with pass: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Registering credentials with identifiers: %@ completion: %@", buf, 0x20u);

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_57;
  v15 = &unk_24CFE87B8;
  objc_copyWeak(&v17, v2);
  v16 = *(id *)(a1 + 40);
  v11 = (void *)MEMORY[0x2199B6780](&v12);
  objc_msgSend(WeakRetained, "_queue_registerCredentialsWithIdentifiers:completion:", *(_QWORD *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_2;
  v11[3] = &unk_24CFE86A0;
  v11[4] = WeakRetained;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

uint64_t __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[5];
      v8 = a1[6];
      v10 = 138543874;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with passes: %@ errors: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Revoking credentials with identifiers: %@ completion: %@", buf, 0x20u);

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_59;
  v15 = &unk_24CFE8808;
  objc_copyWeak(&v17, v2);
  v16 = *(id *)(a1 + 40);
  v11 = (void *)MEMORY[0x2199B6780](&v12);
  objc_msgSend(WeakRetained, "_queue_revokeCredentialsWithIdentifiers:completion:", *(_QWORD *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_59(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_2;
  block[3] = &unk_24CFE87E0;
  block[4] = WeakRetained;
  v8 = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);

}

uint64_t __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 48))
        v8 = CFSTR("NO");
      v10 = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with success: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeSharingInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Removing sharing invitation: %@ completion: %@", buf, 0x20u);

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_65;
  v15 = &unk_24CFE8808;
  objc_copyWeak(&v17, v2);
  v16 = *(id *)(a1 + 40);
  v11 = (void *)MEMORY[0x2199B6780](&v12);
  objc_msgSend(WeakRetained, "_queue_removeSharingInvitation:completion:", *(_QWORD *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_65(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_2;
  block[3] = &unk_24CFE87E0;
  block[4] = WeakRetained;
  v8 = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);

}

uint64_t __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 48))
        v8 = CFSTR("NO");
      v10 = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with success: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)declineRelatedInvitationsIfNecessaryForInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke;
  v11[3] = &unk_24CFE8538;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Declining related invitations if necessary for invitation: %@ completion: %@", buf, 0x20u);

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_66;
  v15 = &unk_24CFE8808;
  objc_copyWeak(&v17, v2);
  v16 = *(id *)(a1 + 40);
  v11 = (void *)MEMORY[0x2199B6780](&v12);
  objc_msgSend(WeakRetained, "_queue_declineRelatedInvitationsIfNecessaryForInvitation:completion:", *(_QWORD *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_66(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_2;
  block[3] = &unk_24CFE87E0;
  block[4] = WeakRetained;
  v8 = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);

}

uint64_t __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 48))
        v8 = CFSTR("NO");
      v10 = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with didDeclineInvitations: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke;
  block[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Initializing account attestation anonymization salt if necessary with completion: %@", buf, 0x16u);

    }
  }
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_67;
  v14 = &unk_24CFE8718;
  objc_copyWeak(&v16, v2);
  v15 = *(id *)(a1 + 32);
  v10 = (void *)MEMORY[0x2199B6780](&v11);
  objc_msgSend(WeakRetained, "_queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
}

void __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_2;
  v11[3] = &unk_24CFE86A0;
  v11[4] = WeakRetained;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

uint64_t __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[5];
      v8 = a1[6];
      v10 = 138543874;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with anonymization salt: %@ error: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)canAcceptInvitationOnRemoteDeviceForInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending can accept invitation on remote device request for invitation: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  -[NPKSubcredentialInvitationCoordinator subcredentialProvisioningService](self, "subcredentialProvisioningService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation:completion:", v6, v7);

}

- (void)startSubcredentialProvisioningOnRemoteDeviceForInvitation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __99__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnRemoteDeviceForInvitation___block_invoke;
  v6[3] = &unk_24CFE8830;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[NPKSubcredentialInvitationCoordinator accountAttestationAnonymizationSaltWithCompletion:](self, "accountAttestationAnonymizationSaltWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __99__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnRemoteDeviceForInvitation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  objc_class *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      if (!v11)
        goto LABEL_13;
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v14;
        v21 = 2112;
        v22 = v6;
        v15 = "Warning: %{public}@: Expected to initiate subcredential provisioning on the remote device, but encountered an error: %@";
        v16 = v12;
        v17 = 22;
LABEL_11:
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);

      }
    }
    else
    {
      if (!v11)
        goto LABEL_13;
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v14;
        v21 = 2112;
        v22 = 0;
        v23 = 2112;
        v24 = v6;
        v15 = "Warning: %{public}@: Expected to initiate subcredential provisioning on the remote device, but failed to o"
              "btain the anonymizationSalt: %@ error: %@";
        v16 = v12;
        v17 = 32;
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  v8 = objc_alloc_init(MEMORY[0x24BE6EA00]);
  objc_msgSend(v8, "setAnonymizationSalt:", v5);
  objc_msgSend(WeakRetained, "subcredentialProvisioningService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendAcceptSubcredentialProvisioningRequestForInvitation:metadata:", *(_QWORD *)(a1 + 32), v8);

LABEL_13:
}

- (void)startProvisioningWithMailboxAddress:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  NPKSubcredentialInvitationCoordinator *v24;
  id v25;
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke;
  v21[3] = &unk_24CFE8880;
  objc_copyWeak(&v26, &location);
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v14 = v10;
  v24 = self;
  v25 = v14;
  v15 = (void *)MEMORY[0x2199B6780](v21);
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_73;
  v18[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v20, &location);
  v19 = v15;
  v17 = v15;
  dispatch_async(v16, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544131;
      v23 = v7;
      v24 = 2113;
      v25 = v8;
      v26 = 2113;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Begin provisioning with mailbox address: %{private}@, activation code: %{private}@, completion: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(WeakRetained, "setCompletion:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BE6ED30]);
    v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_69;
    v16[3] = &unk_24CFE8858;
    v17 = v12;
    v18 = WeakRetained;
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(a1 + 56);
    v19 = v13;
    v20 = v14;
    v21 = v15;
    objc_msgSend(v11, "retrieveShareInvitationForMailboxAddress:completion:", v17, v16);

  }
  else
  {
    objc_msgSend(WeakRetained, "_errorWithCode:message:", 0, CFSTR("Unable to start provisioning - insufficient information"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleProvisioningAttemptForConfiguration:error:", 0, v11);
  }

}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (objc_class *)MEMORY[0x24BE6E9F8];
    v9 = v5;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithCrossPlatformInvitation:", v9);
    objc_msgSend(v10, "setActivationCode:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "startProvisioningWithInvitation:metadata:completion:", v10, 0, *(_QWORD *)(a1 + 64));

  }
  else
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = 138478339;
        v16 = v5;
        v17 = 2113;
        v18 = v14;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: Unable to start provisioning for invitation: %{private}@. mailboxAddress: %{private}@. Error: %@", (uint8_t *)&v15, 0x20u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_handleProvisioningAttemptForConfiguration:error:", 0, v7);
  }

}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_73(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performBlockFollowingFirstUnlockWithBlock:", *(_QWORD *)(a1 + 32));

}

- (void)startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:(id)a3 activationCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[NPKSubcredentialInvitationCoordinator subcredentialProvisioningService](self, "subcredentialProvisioningService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendAcceptSubcredentialProvisioningRequestForMailboxAddress:activationCode:", v6, v7);

  }
  else
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to initiate subcredential provisioning on the remote device, but failed to obtain the mailboxAddress.", (uint8_t *)&v14, 0xCu);

      }
    }
  }

}

- (void)startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:(id)a3 shouldFetchAnonymizationSaltFromRemoteDevice:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  NPKSubcredentialInvitationCoordinator *v39;
  id v40;
  id v41;
  id location;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v6 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v14;
      v47 = 2112;
      v48 = v8;
      v49 = 2048;
      v50 = objc_msgSend(v8, "type");
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Start local device provisioning with invitation: %@ of type %lu", buf, 0x20u);

    }
  }
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke;
  v37[3] = &unk_24CFE88D0;
  objc_copyWeak(&v41, &location);
  v15 = v8;
  v38 = v15;
  v16 = v9;
  v39 = self;
  v40 = v16;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B6780](v37);
  if (v6)
  {
    -[NPKSubcredentialInvitationCoordinator subcredentialProvisioningService](self, "subcredentialProvisioningService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isPairedDeviceConnected");

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        pk_General_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v46 = v24;
          _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Remote device is connected.", buf, 0xCu);

        }
      }
      -[NPKSubcredentialInvitationCoordinator subcredentialProvisioningService](self, "subcredentialProvisioningService");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion:", v17);
    }
    else
    {
      pk_General_log();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        pk_General_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v46 = v30;
          _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Remote device is not connected; failing immediately...",
            buf,
            0xCu);

        }
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("COMPANION_UNREACHABLE_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("COMPANION_UNREACHABLE_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = *MEMORY[0x24BDD1398];
      v44 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6F8A0], 19, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v36);

    }
  }
  else
  {
    -[NPKSubcredentialInvitationCoordinator fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:](self, "fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:", v17);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

void __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!v5 || v6)
  {
    if (a1[6])
    {
      if (!v6)
      {
        if (v5)
        {
          v10 = CFSTR("An unknown error occurred!");
          v11 = 0;
        }
        else
        {
          v10 = CFSTR("Unable to start provisioning on local device without an anonymization salt");
          v11 = 3;
        }
        objc_msgSend(a1[5], "_errorWithCode:message:", v11, v10);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      (*((void (**)(void))a1[6] + 2))();
    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BE6EA00]);
    objc_msgSend(v8, "setAnonymizationSalt:", v5);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_2;
    v12[3] = &unk_24CFE88A8;
    objc_copyWeak(&v16, a1 + 7);
    v13 = a1[4];
    v9 = v8;
    v14 = v9;
    v15 = a1[6];
    objc_msgSend(WeakRetained, "setAccountAttestationAnonymizationSalt:completion:", v5, v12);

    objc_destroyWeak(&v16);
    v6 = 0;
  }

}

void __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(WeakRetained, "startProvisioningWithInvitation:metadata:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  -[NPKSubcredentialInvitationCoordinator callbackQueue](self, "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  block[3] = &unk_24CFE88F8;
  objc_copyWeak(v16, &location);
  v14 = v8;
  v15 = v9;
  v16[1] = (id)a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __104__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = 138544130;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Subcredential provisioning controller %@ did finish with error: %@ in state: %lu", (uint8_t *)&v11, 0x2Au);

    }
  }
  objc_msgSend(WeakRetained, "_endProvisioningWithPassForInvitation:error:", 0, *(_QWORD *)(a1 + 40));

}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[NPKSubcredentialInvitationCoordinator callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __95__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v11[3] = &unk_24CFE8650;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __95__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Subcredential provisioning controller %@ did finish with pass: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  objc_msgSend(WeakRetained, "_endProvisioningWithPassForInvitation:error:", *(_QWORD *)(a1 + 40), 0);

}

- (void)_queue_canAcceptInvitation:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paymentWebService:canAcceptInvitation:withCompletionV2:", v11, v6, v7);
LABEL_9:

    goto LABEL_10;
  }
  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:canAcceptInvitation:withCompletionV2:]", (uint8_t *)&v17, 0xCu);

    }
  }
  if (v7)
  {
    -[NPKSubcredentialInvitationCoordinator _errorWithCode:message:](self, "_errorWithCode:message:", 1, CFSTR("Unable to attempt to accept invitation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_queue_listSubcredentialInvitationsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentWebService:subcredentialInvitationsWithCompletion:", v8, v4);

  }
  else
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:subcredentialInvitationsWithCompletion:]", (uint8_t *)&v14, 0xCu);

      }
    }
    if (v4)
      v4[2](v4, 0);
  }

}

- (void)_queue_deviceContainsInvitationMatchingInvitation:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentWebService:matchingInvitationOnDevice:withTimeout:completion:", v13, v8, a4, v9);
LABEL_9:

    goto LABEL_10;
  }
  pk_General_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:matchingInvitationOnDevice:withTimeout:completion:]", (uint8_t *)&v19, 0xCu);

    }
  }
  if (v9)
  {
    -[NPKSubcredentialInvitationCoordinator _errorWithCode:message:](self, "_errorWithCode:message:", 2, CFSTR("Unable to check whether device has matching invitation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_queue_accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentWebService:accountAttestationAnonymizationSaltWithCompletion:", v8, v4);
LABEL_9:

    goto LABEL_10;
  }
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:accountAttestationAnonymizationSaltWithCompletion:]", (uint8_t *)&v14, 0xCu);

    }
  }
  if (v4)
  {
    -[NPKSubcredentialInvitationCoordinator _errorWithCode:message:](self, "_errorWithCode:message:", 3, CFSTR("Unable to fetch account attestation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_queue_setAccountAttestationAnonymizationSalt:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paymentWebService:setAccountAttestationAnonymizationSalt:withCompletion:", v11, v6, v7);
LABEL_9:

    goto LABEL_10;
  }
  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:setAccountAttestationAnonymizationSalt:withCompletion:]", (uint8_t *)&v17, 0xCu);

    }
  }
  if (v7)
  {
    -[NPKSubcredentialInvitationCoordinator _errorWithCode:message:](self, "_errorWithCode:message:", 0, CFSTR("Unable to set anonymiztion salt for account attestaion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_queue_requestSubcredentialInvitation:(id)a3 fromIDSHandle:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paymentWebService:requestSubcredentialInvitation:completion:", v12, v7, v8);
LABEL_9:

    goto LABEL_10;
  }
  pk_General_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:requestSubcredentialInvitation:completion:]", (uint8_t *)&v18, 0xCu);

    }
  }
  if (v8)
  {
    -[NPKSubcredentialInvitationCoordinator _errorWithCode:message:](self, "_errorWithCode:message:", 2, CFSTR("Unable to request new invitation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v12);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_queue_updateSubcredentialMetadataOnPass:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "targetDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NPKSubcredentialInvitationCoordinator _paymentWebService](self, "_paymentWebService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paymentWebService:updateMetadataOnPass:withCredential:completion:", v14, v8, v9, v10);

  }
  else
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_General_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:updateMetadataOnPass:withCredential:completion:]", (uint8_t *)&v20, 0xCu);

      }
    }
    if (v10)
      v10[2](v10, 0);
  }

}

- (void)_queue_registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator paymentService](self, "paymentService");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerCredentialsWithIdentifiers:completion:", v7, v6);

}

- (void)_queue_revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator paymentService](self, "paymentService");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "revokeCredentialsWithIdentifiers:completion:", v7, v6);

}

- (void)_queue_removeSharingInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator paymentService](self, "paymentService");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeSharingInvitation:withCompletion:", v7, v6);

}

- (void)_queue_declineRelatedInvitationsIfNecessaryForInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator paymentService](self, "paymentService");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "declineRelatedSharingInvitationsIfNecessary:withCompletion:", v7, v6);

}

- (void)_queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke;
  v7[3] = &unk_24CFE8718;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[NPKSubcredentialInvitationCoordinator _queue_accountAttestationAnonymizationSaltWithCompletion:](self, "_queue_accountAttestationAnonymizationSaltWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    if (v6)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        pk_General_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v18;
          v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Failed to get anonymization salt: %@. Proceeding anyway...", buf, 0x16u);

        }
      }
    }
    objc_msgSend(MEMORY[0x24BE6E968], "createAnonymizationSalt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    pk_General_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      pk_General_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: No salt found, setting default salt", buf, 0xCu);

      }
    }
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_114;
    v26[3] = &unk_24CFE8768;
    objc_copyWeak(&v29, (id *)(a1 + 40));
    v25 = v19;
    v27 = v25;
    v28 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "setAccountAttestationAnonymizationSalt:completion:", v25, v26);

    objc_destroyWeak(&v29);
  }
  else
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v12;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Found previously established anonymization salt: %@", buf, 0x16u);

      }
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v5, 0);
  }

}

void __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Set default salt with salt: %@ error: %@", (uint8_t *)&v12, 0x20u);

    }
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, *(_QWORD *)(a1 + 32), v3);

}

- (void)_setUpSubcredentialProvisioningController
{
  NSObject *v3;
  id v4;
  id v5;

  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BE6EF20]);
  -[NPKSubcredentialInvitationCoordinator setSubcredentialProvisioningController:](self, "setSubcredentialProvisioningController:", v4);

  -[NPKSubcredentialInvitationCoordinator subcredentialProvisioningController](self, "subcredentialProvisioningController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)_setUpSharingSessionWithSubcredentialProvisioningController:(id)a3 forInvitation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6 && v7)
  {
    if (objc_msgSend(v7, "type") == 1)
      objc_msgSend(MEMORY[0x24BE6EA08], "createPendingSessionWithDelegate:", v6);
    else
      objc_msgSend(MEMORY[0x24BE6EA08], "createSessionWithDelegate:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NPKSubcredentialInvitationCoordinator setSharingSession:](self, "setSharingSession:", v11);
LABEL_10:

    goto LABEL_11;
  }
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to find a subcredential provisioning controller, but instead found nil!: %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (id)_paymentWebService
{
  return (id)objc_msgSend(MEMORY[0x24BE6EDB0], "sharedService");
}

- (BOOL)_isInvitationUniqueForPairedReaderIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __CFString *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  int IsPersonalized;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  BOOL v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE6EC00]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "passes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "paymentPass");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pairedTerminalIdentifier");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v11, "isEqualToString:", v3))
        {
          pk_General_log();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

          if (v14)
          {
            pk_General_log();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (objc_class *)objc_opt_class();
              NSStringFromClass(v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "uniqueID");
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v38 = v17;
              v39 = 2112;
              v40 = (uint64_t)v3;
              v41 = 2112;
              v42 = v11;
              v43 = 2112;
              v44 = v18;
              _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: The invitation's paired reader identifier (%@) matches the paired reader identifier (%@) of pass with unique ID %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v10, "devicePrimaryPaymentApplication");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "state");
          IsPersonalized = PKPaymentApplicationStateIsPersonalized();

          v21 = objc_msgSend(v10, "effectiveContactlessPaymentApplicationState");
          pk_General_log();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

          if (v23)
          {
            pk_General_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (objc_class *)objc_opt_class();
              NSStringFromClass(v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "uniqueID");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = (void *)v27;
              v29 = CFSTR("YES");
              *(_DWORD *)buf = 138544130;
              v38 = v26;
              if (IsPersonalized)
                v30 = CFSTR("YES");
              else
                v30 = CFSTR("NO");
              if (v21 != 2)
                v29 = CFSTR("NO");
              v39 = 2112;
              v40 = v27;
              v41 = 2112;
              v42 = v30;
              v43 = 2112;
              v44 = v29;
              _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Pass with unique ID %@ is personalized: %@ personalizing: %@", buf, 0x2Au);

            }
          }
          if (IsPersonalized)
            v31 = 1;
          else
            v31 = v21 == 2;
          v12 = !v31;

          goto LABEL_30;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_30:

  return v12;
}

- (void)_fetchInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke;
    v14[3] = &unk_24CFE8948;
    v15 = v6;
    v16 = v7;
    -[NPKSubcredentialInvitationCoordinator listSubcredentialInvitationsWithCompletion:](self, "listSubcredentialInvitationsWithCompletion:", v14);

    v9 = v15;
  }
  else
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11)
      goto LABEL_4;
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to return an invitation, but no completion block was provided: %@", buf, 0x16u);

    }
  }

LABEL_4:
}

void __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke_118;
  v6[3] = &unk_24CFE8920;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10[5], v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke_118(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_fetchInvitationMatchingInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke;
    v14[3] = &unk_24CFE8948;
    v15 = v6;
    v16 = v7;
    -[NPKSubcredentialInvitationCoordinator listSubcredentialInvitationsWithCompletion:](self, "listSubcredentialInvitationsWithCompletion:", v14);

    v9 = v15;
  }
  else
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11)
      goto LABEL_4;
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to return an invitation, but no completion block was provided: %@", buf, 0x16u);

    }
  }

LABEL_4:
}

void __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke_2;
  v6[3] = &unk_24CFE8920;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10[5], v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isSameInvitationAsInvitation:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_makeConfigurationForInvitation:(id)a3 session:(id)a4 metadata:(id)a5 paymentWebService:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  NPKSubcredentialInvitationCoordinator *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (v16)
  {
    if (v12 && v13 && v15)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __119__NPKSubcredentialInvitationCoordinator__makeConfigurationForInvitation_session_metadata_paymentWebService_completion___block_invoke;
      v28[3] = &unk_24CFE8970;
      v29 = v13;
      v30 = v12;
      v31 = v14;
      v32 = v15;
      v33 = self;
      v34 = v16;
      -[NPKSubcredentialInvitationCoordinator canAcceptInvitation:completion:](self, "canAcceptInvitation:completion:", v30, v28);

      v18 = v29;
    }
    else
    {
      pk_General_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        pk_General_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v36 = v27;
          v37 = 2112;
          v38 = v13;
          v39 = 2112;
          v40 = v12;
          v41 = 2112;
          v42 = v14;
          v43 = 2112;
          v44 = v15;
          _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to make accept invitation configuration with a non-nil sharing session, invitation, and paymentWebService! sharingSession: %@ invitation: %@ metadata: %@ paymentWebService: %@", buf, 0x34u);

        }
      }
      -[NPKSubcredentialInvitationCoordinator _errorWithCode:message:](self, "_errorWithCode:message:", 0, CFSTR("Unable to make invitation configuration - insufficient information"));
      v18 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, NSObject *))v16 + 2))(v16, 0, v18);
    }
LABEL_14:

    goto LABEL_15;
  }
  pk_General_log();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      v37 = 2112;
      v38 = 0;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to return a configuration, but no completion block was provided: %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
LABEL_15:

}

void __119__NPKSubcredentialInvitationCoordinator__makeConfigurationForInvitation_session_metadata_paymentWebService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v8;
        v13 = 2112;
        v14 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Unable to make accept invitation configuration for this invitation! error: %@", (uint8_t *)&v11, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 64), "_errorWithCode:message:", 1, CFSTR("Unable to make invitation configuration - cannot accept invitation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EF18]), "initWithSession:invitation:metadata:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), 0);
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
  }
  v10();

}

- (void)_handleProvisioningAttemptForConfiguration:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  id *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  if (v7)
  {
    -[NPKSubcredentialInvitationCoordinator callbackQueue](self, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke_2;
    v12[3] = &unk_24CFE7BA8;
    v9 = &v14;
    objc_copyWeak(&v14, &location);
    v10 = &v13;
    v13 = v7;
    v11 = v12;
  }
  else
  {
    -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke;
    block[3] = &unk_24CFE7BA8;
    v9 = &v17;
    objc_copyWeak(&v17, &location);
    v10 = &v16;
    v16 = v6;
    v11 = block;
  }
  dispatch_async(v8, v11);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

void __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "subcredentialProvisioningController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_startProvisioningForProvisioningController:withConfiguration:", v2, *(_QWORD *)(a1 + 32));

}

void __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_endProvisioningWithPassForInvitation:error:", 0, *(_QWORD *)(a1 + 32));

}

- (void)_performBlockFollowingFirstUnlockWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (NPKProtectedDataAvailable())
  {
    v4[2](v4);
  }
  else
  {
    -[NPKSubcredentialInvitationCoordinator firstUnlockCoordinator](self, "firstUnlockCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __84__NPKSubcredentialInvitationCoordinator__performBlockFollowingFirstUnlockWithBlock___block_invoke;
    v6[3] = &unk_24CFE7B00;
    v7 = v4;
    objc_msgSend(v5, "performSubjectToFirstUnlock:", v6);

  }
}

uint64_t __84__NPKSubcredentialInvitationCoordinator__performBlockFollowingFirstUnlockWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_errorWithCode:(int64_t)a3 message:(id)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 1) > 3)
    v4 = 0;
  else
    v4 = qword_213771F20[a3 - 1];
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BE6F8A0];
  v12 = *MEMORY[0x24BDD0FD8];
  v13[0] = a4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_startProvisioningForProvisioningController:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NPKSubcredentialInvitationCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v13;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Starting provisioning for provisioning controller: %@ with configuration: %@", buf, 0x20u);

    }
  }
  if (v6 && v7)
  {
    objc_msgSend(v6, "startProvisioningWithConfiguration:", v7);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[NPKSubcredentialInvitationCoordinator callbackQueue](self, "callbackQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__NPKSubcredentialInvitationCoordinator__startProvisioningForProvisioningController_withConfiguration___block_invoke;
    block[3] = &unk_24CFE8650;
    objc_copyWeak(&v18, (id *)buf);
    v16 = v6;
    v17 = v7;
    dispatch_async(v14, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

}

void __103__NPKSubcredentialInvitationCoordinator__startProvisioningForProvisioningController_withConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543874;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to start provisioning with a non-nil subcredential provisioning controller and configuration! subcredentialProvisioningController: %@ configuration: %@", (uint8_t *)&v11, 0x20u);

    }
  }
  objc_msgSend(WeakRetained, "_errorWithCode:message:", 0, CFSTR("Unable to start provisioning - insufficient information"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_endProvisioningWithPassForInvitation:error:", 0, v10);

}

- (void)_endProvisioningWithPassForInvitation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NPKSubcredentialInvitationCoordinator callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: End provisioning with pass: %@ error: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  -[NPKSubcredentialInvitationCoordinator _invokeCompletionWithPassForInvitation:error:](self, "_invokeCompletionWithPassForInvitation:error:", v6, v7);
  -[NPKSubcredentialInvitationCoordinator setSubcredentialProvisioningController:](self, "setSubcredentialProvisioningController:", 0);
  -[NPKSubcredentialInvitationCoordinator sharingSession](self, "sharingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endSession");

  -[NPKSubcredentialInvitationCoordinator setSharingSession:](self, "setSharingSession:", 0);
  -[NPKSubcredentialInvitationCoordinator setFirstUnlockCoordinator:](self, "setFirstUnlockCoordinator:", 0);

}

- (void)_invokeCompletionWithPassForInvitation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NPKSubcredentialInvitationCoordinator callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NPKSubcredentialInvitationCoordinator completion](self, "completion");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NPKSubcredentialInvitationCoordinator setCompletion:](self, "setCompletion:", 0);
  if (v9)
  {
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Attempted to invoke completion handler, but no block was found!", (uint8_t *)&v15, 0xCu);

      }
    }
  }

}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentService, a3);
}

- (PKSubcredentialProvisioningController)subcredentialProvisioningController
{
  return self->_subcredentialProvisioningController;
}

- (void)setSubcredentialProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_subcredentialProvisioningController, a3);
}

- (PKAppletSubcredentialSharingSession)sharingSession
{
  return self->_sharingSession;
}

- (void)setSharingSession:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSession, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setFirstUnlockCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockCoordinator, a3);
}

- (void)setSubcredentialProvisioningService:(id)a3
{
  objc_storeStrong((id *)&self->_subcredentialProvisioningService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialProvisioningService, 0);
  objc_storeStrong((id *)&self->_firstUnlockCoordinator, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_sharingSession, 0);
  objc_storeStrong((id *)&self->_subcredentialProvisioningController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
