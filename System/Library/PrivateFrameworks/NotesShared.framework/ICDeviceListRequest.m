@implementation ICDeviceListRequest

- (ICDeviceListRequest)init
{
  -[ICDeviceListRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICDeviceListRequest)initWithAccount:(id)a3
{
  id v5;
  ICDeviceListRequest *v6;
  ICDeviceListRequest *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *workSemaphore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDeviceListRequest;
  v6 = -[ICDeviceListRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = dispatch_semaphore_create(0);
    workSemaphore = v7->_workSemaphore;
    v7->_workSemaphore = (OS_dispatch_semaphore *)v8;

  }
  return v7;
}

- (BOOL)anyDeviceNeedsUpgrade
{
  void *v2;
  char v3;

  -[ICDeviceListRequest devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_13);

  return v3;
}

uint64_t __44__ICDeviceListRequest_anyDeviceNeedsUpgrade__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "upgraded") ^ 1;
}

- (BOOL)anyDeviceNotUpgradable
{
  void *v2;
  char v3;

  -[ICDeviceListRequest devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_18);

  return v3;
}

uint64_t __45__ICDeviceListRequest_anyDeviceNotUpgradable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "upgradable") ^ 1;
}

- (BOOL)anyOSXDeviceNotUpgraded
{
  void *v2;
  char v3;

  -[ICDeviceListRequest devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_19);

  return v3;
}

uint64_t __46__ICDeviceListRequest_anyOSXDeviceNotUpgraded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isOSXDevice"))
    v3 = objc_msgSend(v2, "upgraded") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)waitForFetchWithTimeout:(double)a3
{
  ICDeviceListRequest *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;

  v4 = self;
  -[ICDeviceListRequest workSemaphore](self, "workSemaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_semaphore_wait(v5, v6);

  -[ICDeviceListRequest devices](v4, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CFABE0]);
  -[ICDeviceListRequest account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccount:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ICDeviceListRequest_fetchCloudKitDevicesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E76C9100;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performRequestWithHandler:", v9);

}

void __63__ICDeviceListRequest_fetchCloudKitDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    v12 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_DEFAULT, "CloudKit device list request failed, error: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "incompatibleDeviceNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "needUpgradeDeviceNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);

  }
}

- (void)fetchICloudDevicesWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "systemName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@;%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CFAC40]);
  -[ICDeviceListRequest account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithAccount:", v12);

  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__ICDeviceListRequest_fetchICloudDevicesWithCompletionBlock___block_invoke;
  v17[3] = &unk_1E76C9128;
  objc_copyWeak(&v21, &location);
  v14 = v6;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  v16 = v4;
  v20 = v16;
  objc_msgSend(v13, "performRequestWithHandler:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __61__ICDeviceListRequest_fetchICloudDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICFullDeviceInfo *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ICFullDeviceInfo *v24;
  NSObject *v25;
  id v26;
  id v27;
  id obj;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0D64410]);

      if ((v8 & 1) == 0)
      {
        v26 = WeakRetained;
        v27 = v4;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v25 = v6;
        -[NSObject devices](v6, "devices");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (!v10)
          goto LABEL_16;
        v11 = v10;
        v12 = *(_QWORD *)v31;
        while (1)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v15 = *(void **)(a1 + 32);
            objc_msgSend(v14, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) == 0)
            {

LABEL_13:
              v19 = [ICFullDeviceInfo alloc];
              objc_msgSend(v14, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "model");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "modelDisplayName");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "swVersion");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[ICFullDeviceInfo initWithName:model:modelDisplayName:softwareVersion:](v19, "initWithName:model:modelDisplayName:softwareVersion:", v20, v21, v22, v23);

              objc_msgSend(v9, "addObject:", v24);
              continue;
            }
            v17 = *(void **)(a1 + 40);
            objc_msgSend(v14, "swVersion");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v17) = objc_msgSend(v17, "isEqualToString:", v18);

            if ((v17 & 1) == 0)
              goto LABEL_13;
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (!v11)
          {
LABEL_16:

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            WeakRetained = v26;
            v4 = v27;
            v6 = v25;
            break;
          }
        }
      }
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Device list request was already torn down.", buf, 2u);
    }
  }

}

- (void)fetchWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E76C9240;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;
  id *v12;
  id v13;
  id WeakRetained;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[8];
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  NSObject *v23;
  id v24;
  _QWORD block[5];
  NSObject *v26;
  id v27;

  v2 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.notes.deviceListDevicesMutex", v3);

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2;
  block[3] = &unk_1E76C91A0;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v26 = v7;
  objc_copyWeak(&v27, (id *)(a1 + 48));
  dispatch_group_async(v2, v5, block);

  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_37;
  v22[3] = &unk_1E76C91A0;
  v22[4] = *(_QWORD *)(a1 + 32);
  v8 = v7;
  v23 = v8;
  objc_copyWeak(&v24, (id *)(a1 + 48));
  dispatch_group_async(v2, v5, v22);

  v9 = dispatch_time(0, 10000000000);
  if (!dispatch_group_wait(v2, v9))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "workSemaphore");
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v15);

    if (!*(_QWORD *)(a1 + 40))
    {
LABEL_9:

      goto LABEL_10;
    }
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_41;
    v20[3] = &unk_1E76C91F0;
    v12 = &v21;
    v21 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v20);
LABEL_8:

    goto LABEL_9;
  }
  v10 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for both device lists", buf, 2u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_43;
    v16[3] = &unk_1E76C9218;
    v12 = &v18;
    v13 = *(id *)(a1 + 40);
    v17 = v11;
    v18 = v13;
    WeakRetained = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

    goto LABEL_8;
  }
LABEL_10:
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  NSObject *v7;
  id v8;

  v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E76C9178;
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "fetchCloudKitDevicesWithCompletionBlock:", v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v8);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICMinimalDeviceInfo *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ICMinimalDeviceInfo *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v22[16];
  _QWORD block[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = -[ICMinimalDeviceInfo initWithName:upgradable:upgraded:]([ICMinimalDeviceInfo alloc], "initWithName:upgradable:upgraded:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12), 0, 0);
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = -[ICMinimalDeviceInfo initWithName:upgradable:upgraded:]([ICMinimalDeviceInfo alloc], "initWithName:upgradable:upgraded:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18), 1, 0);
        objc_msgSend(v7, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v7, "count"))
  {
    v20 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E76C9150;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    v24 = v7;
    dispatch_sync(v20, block);

    objc_destroyWeak(&v25);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v21 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_DEFAULT, "Got old device list", v22, 2u);
  }

}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    +[ICDeviceListRequest combineICloudDevices:withCloudKitDevices:](ICDeviceListRequest, "combineICloudDevices:withCloudKitDevices:", v2, *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setDevices:", v3);

  }
  else
  {
    objc_msgSend(WeakRetained, "setDevices:", *(_QWORD *)(a1 + 32));
  }

}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_37(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2_38;
  v5[3] = &unk_1E76C91C8;
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "fetchICloudDevicesWithCompletionBlock:", v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v9);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD block[4];
  id v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    +[ICDeviceListRequest filteredDevices:](ICDeviceListRequest, "filteredDevices:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3_39;
    block[3] = &unk_1E76C9150;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    v10 = v4;
    v6 = v4;
    dispatch_sync(v5, block);

    objc_destroyWeak(&v11);
  }
  objc_msgSend(*(id *)(a1 + 40), "setDidGetICloudDeviceList:", 1);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  v7 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Got new device list", v8, 2u);
  }

}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3_39(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      +[ICDeviceListRequest combineICloudDevices:withCloudKitDevices:](ICDeviceListRequest, "combineICloudDevices:withCloudKitDevices:", *(_QWORD *)(a1 + 32), v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setDevices:", v3);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setDevices:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)filteredDevices:(id)a3
{
  return (id)objc_msgSend(a3, "ic_objectsPassingTest:", &__block_literal_global_44);
}

uint64_t __39__ICDeviceListRequest_filteredDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldBeHidden") ^ 1;
}

+ (id)setOfDeviceNamesFromDevices:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "name", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)combineICloudDevices:(id)a3 withCloudKitDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "setOfDeviceNamesFromDevices:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "name", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v8, "containsObject:", v17);

          if ((v18 & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v9;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)didGetICloudDeviceList
{
  return self->_didGetICloudDeviceList;
}

- (void)setDidGetICloudDeviceList:(BOOL)a3
{
  self->_didGetICloudDeviceList = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (OS_dispatch_semaphore)workSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void)setModelDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_workSemaphore, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
