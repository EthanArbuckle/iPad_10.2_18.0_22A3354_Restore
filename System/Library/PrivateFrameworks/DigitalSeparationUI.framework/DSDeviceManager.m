@implementation DSDeviceManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DSDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___utility;
}

void __33__DSDeviceManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___utility;
  sharedInstance___utility = (uint64_t)v1;

}

- (DSDeviceManager)init
{
  DSDeviceManager *v2;
  os_log_t v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DSDeviceManager;
  v2 = -[DSDeviceManager init](&v12, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.DigitalSeparation", "DSDeviceManager");
    v4 = (void *)DSLog_7;
    DSLog_7 = (uint64_t)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("DSDeviceManager", v5);
    -[DSDeviceManager setWorkQueue:](v2, "setWorkQueue:", v6);

    v7 = objc_alloc(MEMORY[0x24BE060C8]);
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithAccountStore:", v8);
    -[DSDeviceManager setAccountManager:](v2, "setAccountManager:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
    -[DSDeviceManager setAuthController:](v2, "setAuthController:", v10);

    -[DSDeviceManager refresh](v2, "refresh");
  }
  return v2;
}

- (void)appDidLaunch
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = DSLog_7;
  if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_DEFAULT, "Initializing device manager and fetching device lists", v3, 2u);
  }
}

- (void)refresh
{
  NSObject *v3;
  _QWORD block[5];

  -[DSDeviceManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__DSDeviceManager_refresh__block_invoke;
  block[3] = &unk_24EFF33A0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __26__DSDeviceManager_refresh__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshRemoteDeviceList");
}

- (id)iconForDevice:(id)a3
{
  return 0;
}

- (void)refreshRemoteDeviceList
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE0AD70]);
  objc_msgSend(v4, "aa_altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__DSDeviceManager_refreshRemoteDeviceList__block_invoke;
  v8[3] = &unk_24EFF4140;
  v8[4] = self;
  objc_msgSend(v7, "deviceListWithContext:completion:", v5, v8);

}

void __42__DSDeviceManager_refreshRemoteDeviceList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = DSLog_7;
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR))
    {
      v11 = CFSTR("Unknown");
      if (v7)
        v11 = v7;
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_2278DF000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the AK device list with error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "deviceList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setRemoteDeviceList:", v9);

  }
}

- (void)_setRemoteDeviceList:(id)a3
{
  id v5;
  NSArray *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = self->_remoteDevices;
  objc_storeStrong((id *)&self->_remoteDevices, a3);
  if (v5 || !v6)
  {
    -[DSDeviceManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __40__DSDeviceManager__setRemoteDeviceList___block_invoke;
      v8[3] = &unk_24EFF3A78;
      v8[4] = self;
      v9 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v8);

    }
  }

}

void __40__DSDeviceManager__setRemoteDeviceList___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDeviceListModified:", *(_QWORD *)(a1 + 40));

}

- (DSDeviceListDelegate)delegate
{
  return (DSDeviceListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)remoteDevices
{
  return self->_remoteDevices;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (AKAppleIDAuthenticationController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
  objc_storeStrong((id *)&self->_authController, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
