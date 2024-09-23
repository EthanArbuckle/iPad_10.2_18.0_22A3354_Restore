@implementation HMDUnassociatedWACAccessory

- (unint64_t)transportTypes
{
  return 8;
}

- (void)setDelegate:(id)a3 withQueue:(id)a4
{
  OS_dispatch_queue *v6;
  id v7;
  OS_dispatch_queue *delegateQueue;

  v6 = (OS_dispatch_queue *)a4;
  v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v7);

  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v6;

  os_unfair_recursive_lock_unlock();
}

- (HMDWACAccessoryConfigurationDelegate)delegate
{
  id WeakRetained;

  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_recursive_lock_unlock();
  return (HMDWACAccessoryConfigurationDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  OS_dispatch_queue *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_delegateQueue;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDUnassociatedWACAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6 wacDevice:(id)a7
{
  id v13;
  HMDUnassociatedWACAccessory *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDUnassociatedWACAccessory;
  v14 = -[HMDUnassociatedAccessory initWithIdentifier:name:category:messageDispatcher:](&v21, sel_initWithIdentifier_name_category_messageDispatcher_, a3, a4, a5, a6);
  if (v14)
  {
    HMDispatchQueueNameString();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_wacDevice, a7);
    v14->_state = 0;
  }

  return v14;
}

- (void)setWACDevice:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_state)
    objc_storeStrong((id *)&self->_wacDevice, a3);
  os_unfair_recursive_lock_unlock();

}

- (HMDWACDevice)wacDevice
{
  HMDWACDevice *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_wacDevice;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)wacDeviceID
{
  void *v2;
  void *v3;

  -[HMDUnassociatedWACAccessory wacDevice](self, "wacDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)startConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HMDUnassociatedWACAccessory_startConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cancelConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMDUnassociatedWACAccessory *v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Cancellation requested, aborting association", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  queue = v6->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HMDUnassociatedWACAccessory_cancelConfigurationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E89C1D68;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(queue, v11);

}

- (void)updateWithMatchingUnassociatedAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HMDUnassociatedWACAccessory_updateWithMatchingUnassociatedAccessory___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_requestUserPermission
{
  void *v3;
  id inited;
  void *v5;
  HMDUnassociatedWACAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDUnassociatedWACAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDUnassociatedWACAccessory delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self->_state = 2;
    inited = objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1D17BA0A0](inited);
    v6 = self;
    HMFGetOSLogHandle();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Request user permission to share network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke;
    v14[3] = &unk_1E89B5420;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v3, "requestPermissionToAssociateWACAccessory:completionHandler:", v6, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@No delegate assigned, cannot continue WAC association", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __callCompletion(v10, v13, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _requestUserPermission]");

    v10->_state = 0;
  }

}

- (void)_userPermissionResponse:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HMDUnassociatedWACAccessory *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  HMDUnassociatedWACAccessory *v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("Allowed");
    if (v3)
      v10 = CFSTR("Denied");
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Permission to share network: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __callCompletion(v6, v11, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _userPermissionResponse:]");

    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = (uint64_t)v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@User permission denied, return to ready state", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v13->_state = 0;
  }
  else
  {
    v6->_state = 3;
    __run(v6);
  }
}

- (void)_configureDevice
{
  void *v3;
  void *v4;
  id inited;
  void *v6;
  HMDUnassociatedWACAccessory *v7;
  NSObject *v8;
  void *v9;
  HMDWACDevice *wacDevice;
  HMDWACDevice *v11;
  void *v12;
  HMDUnassociatedWACAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  HMDWACDevice *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDUnassociatedWACAccessory delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unassociatedWACAccessoryDidStartAssociation:", self);
    inited = objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1D17BA0A0](inited);
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      wacDevice = v7->_wacDevice;
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      v22 = 2112;
      v23 = wacDevice;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting WAC process for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v7->_state = 4;
    v11 = v7->_wacDevice;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke;
    v17[3] = &unk_1E89C0678;
    objc_copyWeak(&v18, &location);
    -[HMDWACDevice startConfigurationWithCompletionHandler:](v11, "startConfigurationWithCompletionHandler:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@No delegate assigned, cannot continue WAC association", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __callCompletion(v13, v16, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _configureDevice]");

    v13->_state = 0;
  }

}

- (void)_configureDeviceCompleted:(id)a3
{
  id v4;
  void *v5;
  HMDUnassociatedWACAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDUnassociatedWACAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@WAC completed with %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUnassociatedWACAccessory delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "unassociatedWACAccessoryDidFinishAssociation:withError:", v6, v4);
    if (!v4)
    {
      v6->_state = 5;
      __run(v6);
      goto LABEL_13;
    }
    __callCompletion(v6, v4, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _configureDeviceCompleted:]");
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@WAC Failed with %@, device should still be WAC-able", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@No delegate assigned, cannot continue WAC association", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __callCompletion(v12, v18, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _configureDeviceCompleted:]");

  }
  v12->_state = 0;
LABEL_13:

}

- (void)_waitForPostWACMatch
{
  void *v3;
  HMDUnassociatedWACAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  HMFTimer *v12;
  HMFTimer *handoffExpirationTimer;
  uint64_t v14;
  void *v15;
  HMDUnassociatedWACAccessory *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_postWACAccessory)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Post WAC accessory already located, handoff", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    __callCompletion(v4, 0, self->_postWACAccessory, (uint64_t)"-[HMDUnassociatedWACAccessory _waitForPostWACMatch]");
    v4->_state = 8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceForKey:", CFSTR("wacAccessoryPostConfigMatchTimeout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberValue");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = (void *)v9;
    else
      v10 = &unk_1E8B33270;
    v11 = objc_alloc(MEMORY[0x1E0D286C8]);
    objc_msgSend(v10, "doubleValue");
    v12 = (HMFTimer *)objc_msgSend(v11, "initWithTimeInterval:options:", 1);
    handoffExpirationTimer = self->_handoffExpirationTimer;
    self->_handoffExpirationTimer = v12;

    v14 = -[HMFTimer setDelegate:](self->_handoffExpirationTimer, "setDelegate:", self);
    self->_state = 6;
    v15 = (void *)MEMORY[0x1D17BA0A0](v14);
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting Post-WAC match timeout for %@ seconds", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMFTimer resume](self->_handoffExpirationTimer, "resume");

  }
}

- (void)_postWACMatchTimeout
{
  void *v3;
  HMDUnassociatedWACAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@Timeout waiting to find device post-WAC", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedWACAccessory delegate](v4, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "unassociatedWACAccessoryDidFinishAssociation:withError:", v4, v7);
  __callCompletion(v4, v7, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _postWACMatchTimeout]");
  v4->_state = 7;

}

- (void)_abort:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  HMDUnassociatedWACAccessory *v6;
  NSObject *v7;
  void *v8;
  HMDWACDevice *wacDevice;
  void *v10;
  HMDUnassociatedWACAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDUnassociatedWACAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDUnassociatedWACAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDUnassociatedWACAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDUnassociatedWACAccessory *v30;
  NSObject *v31;
  void *v32;
  id inited;
  void *v34;
  HMDUnassociatedWACAccessory *v35;
  NSObject *v36;
  void *v37;
  HMDWACDevice *v38;
  HMDWACDevice *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  void *v43;
  id WeakRetained;
  _QWORD v45[4];
  void (**v46)(_QWORD);
  id v47;
  id location;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  HMDWACDevice *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    wacDevice = v6->_wacDevice;
    *(_DWORD *)buf = 138543618;
    v50 = v8;
    v51 = 2112;
    v52 = wacDevice;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling WAC assocciation for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  switch(v6->_state)
  {
    case 0:
    case 7:
    case 8:
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v6;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Cancel: no action required", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v4[2](v4);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __callCompletion(v11, v14, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]");
      goto LABEL_26;
    case 1:
    case 2:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Cancel: notify delegate of cancellation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDUnassociatedWACAccessory delegate](v16, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = v16;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v50 = v23;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate that WAC was cancelled", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(v19, "unassociatedWACAccessoryDidFinishAssociation:withError:", v21, v14);
      }
      v6->_state = 0;
      v4[2](v4);
      __callCompletion(v16, v14, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]");

      goto LABEL_26;
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v6;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Cancel: cancel WAC and notify delegate", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDUnassociatedWACAccessory delegate](v25, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = v25;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v50 = v32;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate that WAC was cancelled", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v28, "unassociatedWACAccessoryDidFinishAssociation:withError:", v30, v14);
      }
      inited = objc_initWeak(&location, v25);
      v34 = (void *)MEMORY[0x1D17BA0A0](inited);
      v35 = v25;
      HMFGetOSLogHandle();
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v35->_wacDevice;
        *(_DWORD *)buf = 138543618;
        v50 = v37;
        v51 = 2112;
        v52 = v38;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Cancelling WAC operation for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v39 = v35->_wacDevice;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __38__HMDUnassociatedWACAccessory__abort___block_invoke;
      v45[3] = &unk_1E89BD190;
      objc_copyWeak(&v47, &location);
      v46 = v4;
      -[HMDWACDevice cancelConfigurationWithCompletionHandler:](v39, "cancelConfigurationWithCompletionHandler:", v45);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);

      goto LABEL_26;
    case 5:
    case 6:
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = v6;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v43;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate that WAC was cancelled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(v41 + 21);
      objc_msgSend(WeakRetained, "unassociatedWACAccessoryDidFinishAssociation:withError:", v41, v14);

      v4[2](v4);
      __callCompletion(v41, v14, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]");
      v6->_state = 7;
LABEL_26:

      break;
    default:
      break;
  }

}

- (void)_postWACMatchingAccessoryFound:(id)a3
{
  id v5;
  void *v6;
  HMDUnassociatedWACAccessory *v7;
  NSObject *v8;
  void *v9;
  int64_t state;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDUnassociatedWACAccessory *v16;
  NSObject *v17;
  void *v18;
  int64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = (int64_t)v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Post-WAC matching accessory found: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  state = v7->_state;
  if (state == 4)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Post-WAC accessory found, but WAC hasn't completed.  Holding on to accessory until completion", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_storeStrong(v12 + 20, a3);
  }
  else if (state == 6)
  {
    __callCompletion(v7, 0, v5, (uint64_t)"-[HMDUnassociatedWACAccessory _postWACMatchingAccessoryFound:]");
    v7->_state = 8;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v7->_state;
      v20 = 138543618;
      v21 = v18;
      v22 = 2048;
      v23 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid state (%ld) for postWACMatchingAccessoryFound call", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)timerDidFire:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDUnassociatedWACAccessory_timerDidFire___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wacDeviceID, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_postWACAccessory, 0);
  objc_storeStrong((id *)&self->_handoffExpirationTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_wacDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__HMDUnassociatedWACAccessory_timerDidFire___block_invoke(uint64_t a1)
{
  __run(*(void **)(a1 + 32));
}

void __38__HMDUnassociatedWACAccessory__abort___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[15];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__HMDUnassociatedWACAccessory__abort___block_invoke_2;
    v5[3] = &unk_1E89C1D68;
    v5[4] = WeakRetained;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

  }
}

void __38__HMDUnassociatedWACAccessory__abort___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  __callCompletion(v2, v3, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]_block_invoke_2");

}

void __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[15];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke_2;
    v7[3] = &unk_1E89C2328;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureDeviceCompleted:", *(_QWORD *)(a1 + 40));
}

void __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke(uint64_t a1, char a2)
{
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[15];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke_2;
    v6[3] = &unk_1E89C2758;
    v6[4] = v4;
    v7 = a2;
    dispatch_async(v5, v6);
  }

}

uint64_t __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userPermissionResponse:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __71__HMDUnassociatedWACAccessory_updateWithMatchingUnassociatedAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postWACMatchingAccessoryFound:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__HMDUnassociatedWACAccessory_cancelConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_abort:", *(_QWORD *)(a1 + 40));
}

void __71__HMDUnassociatedWACAccessory_startConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@WAC association already in progress", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 79);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Kicking off WAC association for %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v12 = _Block_copy(*(const void **)(a1 + 40));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 136);
    *(_QWORD *)(v13 + 136) = v12;

    __run(*(void **)(a1 + 32));
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_67832 != -1)
    dispatch_once(&logCategory__hmf_once_t32_67832, &__block_literal_global_67833);
  return (id)logCategory__hmf_once_v33_67834;
}

void __42__HMDUnassociatedWACAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33_67834;
  logCategory__hmf_once_v33_67834 = v0;

}

@end
