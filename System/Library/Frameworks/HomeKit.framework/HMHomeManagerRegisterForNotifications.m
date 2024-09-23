@implementation HMHomeManagerRegisterForNotifications

void ____HMHomeManagerRegisterForNotifications_block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Refreshing config from HomeKit daemon", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Refresh fetch"));
    objc_msgSend(v3, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = ____HMHomeManagerRegisterForNotifications_block_invoke_1216;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v3;
    v12 = v6;
    v9 = v6;
    dispatch_async(v8, v10);

  }
}

uint64_t ____HMHomeManagerRegisterForNotifications_block_invoke_1216(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchHomeConfigurationWithRefreshRequested:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

@end
