@implementation HMDWACScanner

- (HMDWACScanner)init
{
  HMDWACScanner *v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDWACScanner;
  v2 = -[HMDWACScanner init](&v8, sel_init);
  if (v2)
  {
    v3 = (const char *)HAPDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create(v3, v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDWACScanner_setDelegate_queue___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)start
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__HMDWACScanner_start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)startDiscoveringAirPlayAccessoriesWithBrowser:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDWACScanner *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMDWACScanner_startDiscoveringAirPlayAccessoriesWithBrowser___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)backoff
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__HMDWACScanner_backoff__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)resume
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__HMDWACScanner_resume__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)stop
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__HMDWACScanner_stop__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)wacBrowser:(id)a3 didFindAirPlayDevice:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (void)wacBrowser:(id)a3 didRemoveAirPlayDevice:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (void)wacBrowser:(id)a3 didUpdateAirPlayDevice:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (HMDWACScannerDelegate)delegate
{
  return (HMDWACScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_wifiScanner, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@wacBrowser updated device %@: (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    __wrapCUWiFiDevice(*(void **)(a1 + 32), *(void **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke_4;
    block[3] = &unk_24E79BBD0;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    v17 = v9;
    v13 = v9;
    dispatch_async(v10, block);

  }
}

uint64_t __51__HMDWACScanner_wacBrowser_didUpdateAirPlayDevice___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scanner:didUpdateDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@wacBrowser lost device %@: (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    __wrapCUWiFiDevice(*(void **)(a1 + 32), *(void **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke_3;
    block[3] = &unk_24E79BBD0;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    v17 = v9;
    v13 = v9;
    dispatch_async(v10, block);

  }
}

uint64_t __51__HMDWACScanner_wacBrowser_didRemoveAirPlayDevice___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scanner:didRemoveDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@wacBrowser found device %@: (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    __wrapCUWiFiDevice(*(void **)(a1 + 32), *(void **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Device %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke_2;
    block[3] = &unk_24E79BBD0;
    v15 = v8;
    v16 = *(_QWORD *)(a1 + 32);
    v19 = v15;
    v20 = v16;
    v21 = v9;
    v17 = v9;
    dispatch_async(v14, block);

  }
}

uint64_t __49__HMDWACScanner_wacBrowser_didFindAirPlayDevice___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scanner:didAddDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __21__HMDWACScanner_stop__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)*(id *)(a1 + 32);
  if (v1[2])
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = v1;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Invalidating CUWiFiScanner...", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v1[2], "invalidate");
  }

}

uint64_t __23__HMDWACScanner_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
}

uint64_t __24__HMDWACScanner_backoff__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "suspend");
}

uint64_t __63__HMDWACScanner_startDiscoveringAirPlayAccessoriesWithBrowser___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startDiscoveringAirPlayAccessoriesWithDelegate:", *(_QWORD *)(a1 + 40));
}

void __22__HMDWACScanner_start__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  __int128 buf;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (id *)*(id *)(a1 + 32);
  if (!v1[2])
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = v1;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing CUWiFiScanner...", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = objc_alloc_init(MEMORY[0x24BE29858]);
    objc_msgSend(v6, "setLabel:", CFSTR("homed.wac"));
    objc_msgSend(v6, "setDispatchQueue:", v3[1]);
    objc_initWeak(&location, v3);
    v7 = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v18 = ____start_block_invoke;
    v19 = &unk_24E786768;
    objc_copyWeak(v20, &location);
    objc_msgSend(v6, "setDeviceFoundHandler:", &buf);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = ____start_block_invoke_2;
    v14[3] = &unk_24E786768;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "setDeviceLostHandler:", v14);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = ____start_block_invoke_2_140;
    v12[3] = &unk_24E786790;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "setDeviceChangedHandler:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = ____start_block_invoke_4;
    v10[3] = &unk_24E799B48;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "setErrorHandler:", v10);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = ____start_block_invoke_2_144;
    v8[3] = &unk_24E797318;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v8);
    objc_storeStrong(v1 + 2, v6);
    objc_msgSend(v6, "activate");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

  }
}

uint64_t __35__HMDWACScanner_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_126615 != -1)
    dispatch_once(&logCategory__hmf_once_t7_126615, &__block_literal_global_126616);
  return (id)logCategory__hmf_once_v8_126617;
}

void __28__HMDWACScanner_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_126617;
  logCategory__hmf_once_v8_126617 = v0;

}

@end
