@implementation NPKExpressGymKitAvailabilityManager

- (NPKExpressGymKitAvailabilityManager)init
{
  return -[NPKExpressGymKitAvailabilityManager initWithDelegate:](self, "initWithDelegate:", 0);
}

- (NPKExpressGymKitAvailabilityManager)initWithDelegate:(id)a3
{
  id v4;
  NPKExpressGymKitAvailabilityManager *v5;
  const char *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKExpressGymKitAvailabilityManager;
  v5 = -[NPKExpressGymKitAvailabilityManager init](&v13, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = (const char *)objc_msgSend(CFSTR("com.apple.nanopasskit.expressGymKitAvailable.didChange"), "UTF8String");
    v7 = MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__NPKExpressGymKitAvailabilityManager_initWithDelegate___block_invoke;
    v10[3] = &unk_24CFE78F0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v5->_notificationToken, v7, v10);

    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__NPKExpressGymKitAvailabilityManager_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "isExpressGymKitAllowed");
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_class();
      objc_msgSend(WeakRetained, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138413058;
      v11 = WeakRetained;
      v12 = 1024;
      v13 = v2;
      v14 = 2112;
      v15 = v7;
      v16 = 2048;
      v17 = v8;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@ handling com.apple.nanopasskit.expressGymKitAvailable.didChange notification isAllowed:%d delegate:<%@:%p>", (uint8_t *)&v10, 0x26u);

    }
  }
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressGymKitAvailabilityManager:didChangeIsExpressGymKitAllowed:", WeakRetained, v2);

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_notificationToken))
    notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NPKExpressGymKitAvailabilityManager;
  -[NPKExpressGymKitAvailabilityManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isExpressGymKitAllowed
{
  void *v2;
  BOOL v3;

  -[NPKExpressGymKitAvailabilityManager _conflictingPassUniqueID](self, "_conflictingPassUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (PKPaymentPass)conflictingPass
{
  void *v2;
  NPKCompanionAgentConnection *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[NPKExpressGymKitAvailabilityManager _conflictingPassUniqueID](self, "_conflictingPassUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(NPKCompanionAgentConnection);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__NPKExpressGymKitAvailabilityManager_conflictingPass__block_invoke;
    v6[3] = &unk_24CFE7918;
    v6[4] = &v7;
    -[NPKCompanionAgentConnection paymentPassWithUniqueID:synchronous:reply:](v3, "paymentPassWithUniqueID:synchronous:reply:", v2, 1, v6);

  }
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (PKPaymentPass *)v4;
}

void __54__NPKExpressGymKitAvailabilityManager_conflictingPass__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_conflictingPassUniqueID
{
  void *v2;
  void *v3;

  NPKDomainAccessorForDomain(CFSTR("com.apple.nanopasskit.shared"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("NPKExpressGymKitConflictPassUniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)allowEnableExpressGymKitWithVisibleViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKExpressGymKitAvailabilityManager: requested allow enable express GymKit with view controller:%@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/NanoPreferenceBundles/Applications/NanoPassbookBridgeSettings.bundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isLoaded");
  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 1024;
      v22 = v11;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKExpressGymKitAvailabilityManager: Found settings bundle:%@ loaded:%d", buf, 0x12u);
    }

  }
  if ((v11 & 1) == 0)
    objc_msgSend(v10, "load");
  v15 = (objc_class *)objc_msgSend(v10, "classNamed:", CFSTR("NPKPassbookBridgeSettingsController"));
  if (-[objc_class conformsToProtocol:](v15, "conformsToProtocol:", &unk_254D07898))
  {
    v16 = objc_alloc_init(v15);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __100__NPKExpressGymKitAvailabilityManager_allowEnableExpressGymKitWithVisibleViewController_completion___block_invoke;
    v17[3] = &unk_24CFE7940;
    v18 = v6;
    objc_msgSend(v16, "allowEnableExpressGymKitWithVisibleViewController:completion:", v5, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NPKExpressGymKitAvailabilityManagerErrorDomain"), 1, 0));
  }

}

void __100__NPKExpressGymKitAvailabilityManager_allowEnableExpressGymKitWithVisibleViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = a2;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKExpressGymKitAvailabilityManager: did allowed enable express GymKit:%d error:%@", (uint8_t *)v9, 0x12u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NPKExpressGymKitAvailabilityManagerDelegate)delegate
{
  return (NPKExpressGymKitAvailabilityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
