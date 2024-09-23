@implementation HMDWACBrowser

- (HMDWACBrowser)initWithWACScanner:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  HMDWACBrowser *v9;
  HMDWACBrowser *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *unassociatedAccessories;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *dispatchQueue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDWACBrowser;
  v9 = -[HMDWACBrowser init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDispatcher, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    unassociatedAccessories = v10->_unassociatedAccessories;
    v10->_unassociatedAccessories = v11;

    v13 = (const char *)HAPDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    dispatchQueue = v10->_dispatchQueue;
    v10->_dispatchQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_wacScanner, a3);
    -[HMDWACScanner setDelegate:queue:](v10->_wacScanner, "setDelegate:queue:", v10, v10->_dispatchQueue);
    v10->_scanIsActive = 0;
  }

  return v10;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMDWACBrowser_setDelegate_queue___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)startBrowsingForAccessories
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDWACBrowser_startBrowsingForAccessories__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)startBrowsingForAirPlayWACAccessoriesWithBrowser:(id)a3
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
  v7[2] = __66__HMDWACBrowser_startBrowsingForAirPlayWACAccessoriesWithBrowser___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)stopBrowsingForAccessories
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMDWACBrowser_stopBrowsingForAccessories__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)requestBackoff
{
  void *v3;
  HMDWACBrowser *v4;
  NSObject *v5;
  void *v6;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Backoff requested", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HMDWACBrowser_requestBackoff__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)clearBackoff
{
  void *v3;
  HMDWACBrowser *v4;
  NSObject *v5;
  void *v6;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Backoff cleared", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HMDWACBrowser_clearBackoff__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)scanner:(id)a3 didAddDevice:(id)a4
{
  __addDevice(self, a4);
}

- (void)scanner:(id)a3 didRemoveDevice:(id)a4
{
  id v5;

  objc_msgSend(a4, "identifier", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  __removeUnassociatedAccessory(self, v5);

}

- (void)scanner:(id)a3 didUpdateDevice:(id)a4
{
  id v6;
  id v7;
  HMDWACBrowser *v8;
  id v9;
  NSMutableDictionary *unassociatedAccessories;
  void *v11;
  void *v12;
  void *v13;
  HMDWACBrowser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BYTE v20[24];
  void *v21;
  id v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v7;
  unassociatedAccessories = v8->_unassociatedAccessories;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](unassociatedAccessories, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "wacDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543874;
      *(_QWORD *)&v20[4] = v16;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v17;
      *(_WORD *)&v20[22] = 2112;
      v21 = v9;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating WAC device: %@ -> %@", v20, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v12, "setWACDevice:", v9);
    -[HMDWACBrowser delegate](v14, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[HMDWACBrowser delegateQueue](v14, "delegateQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v20 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v20[8] = 3221225472;
      *(_QWORD *)&v20[16] = ____updateDevice_block_invoke;
      v21 = &unk_1E89C2328;
      v22 = v18;
      v23 = v12;
      dispatch_async(v19, v20);

    }
  }
  else
  {
    __addDevice(v8, v9);
  }

}

- (void)scanner:(id)a3 didError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDWACBrowser *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error while scanning for WAC devices: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)scannerDidStop:(id)a3
{
  id v4;
  void *v5;
  HMDWACBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDWACBrowser *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@WAC Scan Stopped...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDWACBrowser scanIsActive](v6, "scanIsActive"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2048;
      v19 = 2;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Scan was still flagged as active, restarting after %lu seconds...", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    __removeAllAccessories(v10);
    v13 = dispatch_time(0, 2000000000);
    dispatchQueue = v10->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__HMDWACBrowser_scannerDidStop___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v10;
    dispatch_after(v13, dispatchQueue, block);
  }

}

- (BOOL)scanIsActive
{
  return self->_scanIsActive;
}

- (void)setScanIsActive:(BOOL)a3
{
  self->_scanIsActive = a3;
}

- (HMDWACBrowserDelegate)delegate
{
  return (HMDWACBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_unassociatedAccessories, 0);
  objc_storeStrong((id *)&self->_wacScanner, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

uint64_t __32__HMDWACBrowser_scannerDidStop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "start");
}

uint64_t __29__HMDWACBrowser_clearBackoff__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
}

uint64_t __31__HMDWACBrowser_requestBackoff__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "backoff");
}

uint64_t __43__HMDWACBrowser_stopBrowsingForAccessories__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stop");
  __removeAllAccessories(*(void **)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "setScanIsActive:", 0);
}

uint64_t __66__HMDWACBrowser_startBrowsingForAirPlayWACAccessoriesWithBrowser___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "startDiscoveringAirPlayAccessoriesWithBrowser:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__HMDWACBrowser_startBrowsingForAccessories__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "scanIsActive");
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setScanIsActive:", 1));
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Activating WAC Scanner...", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "start");
  }
  return result;
}

uint64_t __35__HMDWACBrowser_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_109178 != -1)
    dispatch_once(&logCategory__hmf_once_t9_109178, &__block_literal_global_109179);
  return (id)logCategory__hmf_once_v10_109180;
}

void __28__HMDWACBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_109180;
  logCategory__hmf_once_v10_109180 = v0;

}

@end
