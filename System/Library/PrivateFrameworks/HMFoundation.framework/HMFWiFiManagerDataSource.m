@implementation HMFWiFiManagerDataSource

- (HMFWiFiManagerDataSource)initWithWorkQueue:(id)a3
{
  id v5;
  HMFWiFiManagerDataSource *v6;
  HMFWiFiManagerDataSource *v7;
  NSLock *v8;
  NSLock *captiveCachedLock;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const __CFArray *v14;
  const __CFArray *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMFWiFiManagerDataSource;
  v6 = -[HMFWiFiManagerDataSource init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    captiveCachedLock = v7->_captiveCachedLock;
    v7->_captiveCachedLock = v8;

    v10 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Initializing WiFi Services", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v13 = WiFiManagerClientCreate();
    v7->_wifiClientReference = (__WiFiManagerClient *)v13;
    if (v13)
    {
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      WiFiManagerClientRegisterWowStateChangedCallback();
      v14 = (const __CFArray *)WiFiManagerClientCopyDevices();
      if (v14)
      {
        v15 = v14;
        if (CFArrayGetCount(v14))
          -[HMFWiFiManagerDataSource startWithWiFiDevice:](v7, "startWithWiFiDevice:", CFArrayGetValueAtIndex(v15, 0));
        CFRelease(v15);
      }
      -[HMFWiFiManagerDataSource _registerForCaptiveStateChanges](v7, "_registerForCaptiveStateChanges");
    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_ERROR, "%{public}@[HMFWiFiManagerDataSource] Failed to create WiFiManagerClient", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference"))
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Clearing wifi client reference", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
    WiFiManagerClientRegisterWowStateChangedCallback();
    CFRelease(-[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference"));
  }
  if (-[HMFWiFiManagerDataSource wifiDeviceReference](self, "wifiDeviceReference"))
  {
    v6 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Clearing wifi device reference", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMFWiFiManagerDataSource wifiDeviceReference](self, "wifiDeviceReference");
    WiFiDeviceClientRegisterExtendedLinkCallback();
    CFRelease(-[HMFWiFiManagerDataSource wifiDeviceReference](self, "wifiDeviceReference"));
  }
  if (-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"))
    CFRelease(-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"));
  if (-[HMFWiFiManagerDataSource scStore](self, "scStore"))
  {
    -[HMFWiFiManagerDataSource scStore](self, "scStore");
    SCDynamicStoreRemoveWatchedKey();
    CFRelease(-[HMFWiFiManagerDataSource scStore](self, "scStore"));
  }
  v9.receiver = self;
  v9.super_class = (Class)HMFWiFiManagerDataSource;
  -[HMFWiFiManagerDataSource dealloc](&v9, sel_dealloc);
}

+ (NSString)MACAddressString
{
  void *v2;
  void *v3;
  void *v4;

  +[HMFSystemInfo systemInfo](HMFSystemInfo, "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "WiFiInterfaceMACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isAssertionActive
{
  -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
  return WiFiManagerClientGetType() - 1 < 2;
}

- (unint64_t)assertionOptions
{
  -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
  return WiFiManagerClientGetType() == 2;
}

- (void)activateWithOptions:(unint64_t)a3
{
  -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
  WiFiManagerClientSetType();
}

- (void)deactivate
{
  -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
  WiFiManagerClientSetType();
}

- (BOOL)isWoWAsserted
{
  NSObject *v3;

  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
  return WiFiManagerClientGetWoWState() != 0;
}

- (void)setWoWAsserted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Calling WiFiManagerClientSetWoWState() with %d", (uint8_t *)&v9, 0x12u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMFWiFiManagerDataSource wifiClientReference](self, "wifiClientReference");
  WiFiManagerClientSetWoWState();
}

- (HMFWifiNetworkAssociation)currentNetworkAssociation
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMFMACAddress *v10;
  HMFWifiNetworkAssociation *v11;
  void *v12;
  void *v13;
  HMFMACAddress *v14;
  void *v16;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"))
  {
    v4 = (void *)WiFiCopyCurrentNetworkInfoEx();
    objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("rawRecord"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork");
    WiFiNetworkGetSSID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFSystemInfo systemInfo](HMFSystemInfo, "systemInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "WiFiInterfaceMACAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork");
    v9 = (void *)WiFiNetworkCopyBSSIDData();
    if (v9)
      v10 = -[HMFMACAddress initWithAddressData:]([HMFMACAddress alloc], "initWithAddressData:", v9);
    else
      v10 = 0;
    objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E0D4FE50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E0D4FE58]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = -[HMFMACAddress initWithMACAddressString:]([HMFMACAddress alloc], "initWithMACAddressString:", v13);
    else
      v14 = 0;
    v11 = 0;
    if (v6 && v8 && v10 && v12 && v14)
      v11 = -[HMFWifiNetworkAssociation initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:]([HMFWifiNetworkAssociation alloc], "initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:", v8, v6, v10, v12, v14);

  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (NSNumber)currentNetworkRSSI
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork");
    objc_msgSend(v4, "numberWithInt:", WiFiNetworkGetRSSI());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (NSNumber *)v5;
}

- (BOOL)isCaptive
{
  double Current;
  int captiveCached;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  CFAbsoluteTime v13;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  -[NSLock lock](self->_captiveCachedLock, "lock");
  captiveCached = self->_captiveCached;
  if (!captiveCached)
  {
    v5 = (void *)WiFiCopyCurrentNetworkInfo();
    if (v5)
    {
      if (CFDictionaryGetInt64())
        v6 = 6;
      else
        v6 = 5;
      self->_captiveCached = v6;
    }
    else
    {
      v7 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier(0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v9;
        _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@[HMFWiFiManagerDataSource] isCaptive: WiFi info not found", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }

    captiveCached = self->_captiveCached;
  }
  v10 = (void *)MEMORY[0x1A1AC355C](-[NSLock unlock](self->_captiveCachedLock, "unlock"));
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFAbsoluteTimeGetCurrent();
    v15 = 138543874;
    v16 = v12;
    v17 = 2048;
    v18 = v13 - Current;
    v19 = 1024;
    v20 = captiveCached == 6;
    _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[HMFWiFiManagerDataSource] isCaptive took %.02f seconds (captive: %d)", (uint8_t *)&v15, 0x1Cu);

  }
  objc_autoreleasePoolPop(v10);
  return captiveCached == 6;
}

- (void)_invalidateCaptiveState
{
  -[NSLock lock](self->_captiveCachedLock, "lock");
  -[HMFWiFiManagerDataSource setCaptiveCached:](self, "setCaptiveCached:", 0);
  -[NSLock unlock](self->_captiveCachedLock, "unlock");
}

- (void)performBlockAfterWoWReassertionDelay:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;

  v4 = a3;
  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = dispatch_time(0, 5000000000);
  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v6, v7, v4);

}

- (void)startWithWiFiDevice:(__WiFiDeviceClient *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HMFWiFiManagerDataSource_startWithWiFiDevice___block_invoke;
  v6[3] = &unk_1E3B395C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __48__HMFWiFiManagerDataSource_startWithWiFiDevice___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v4;
    _os_log_impl(&dword_19B546000, v3, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Initializing WiFi Device", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "wifiDeviceReference"))
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Clearing previous reference", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "wifiDeviceReference");
    WiFiDeviceClientRegisterExtendedLinkCallback();
    CFRelease((CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "wifiDeviceReference"));
  }
  objc_msgSend(*(id *)(a1 + 32), "setWifiDeviceReference:", CFRetain(*(CFTypeRef *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "wifiDeviceReference");
  WiFiDeviceClientRegisterExtendedLinkCallback();
  objc_msgSend(*(id *)(a1 + 32), "wifiDeviceReference");
  v8 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
  v9 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Initialized WiFi Device with current network: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentNetwork:", v8);
  if (v8)
    CFRelease(v8);
}

- (void)handleWiFiLinkChangedWithEventDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMFWiFiManagerDataSource *v9;

  v4 = a3;
  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HMFWiFiManagerDataSource_handleWiFiLinkChangedWithEventDictionary___block_invoke;
  v7[3] = &unk_1E3B37CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__HMFWiFiManagerDataSource_handleWiFiLinkChangedWithEventDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", CFSTR("LINK_CHANGED_IS_LINKDOWN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_NETWORK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("Up");
    if (v3)
      v9 = CFSTR("Down");
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] WiFi link is %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource:didChangeLinkAvailability:", *(_QWORD *)(a1 + 40), v3 ^ 1u);

  objc_msgSend(*(id *)(a1 + 40), "_setCurrentNetwork:", v4);
}

- (void)_setCurrentNetwork:(__WiFiNetwork *)a3
{
  NSObject *v5;
  id v6;

  -[HMFWiFiManagerDataSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  if (-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork") == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"))
      CFRelease(-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"));
    -[HMFWiFiManagerDataSource setCurrentNetwork:](self, "setCurrentNetwork:", a3);
    if (-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"))
      CFRetain(-[HMFWiFiManagerDataSource currentNetwork](self, "currentNetwork"));
    -[HMFWiFiManagerDataSource _invalidateCaptiveState](self, "_invalidateCaptiveState");
    os_unfair_lock_unlock(&self->_lock);
    -[HMFWiFiManagerDataSource delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentNetworkDidChangeForDataSource:", self);

  }
}

- (void)_registerForCaptiveStateChanges
{
  SCDynamicStoreRef v3;
  __SCDynamicStore *v4;
  SCDynamicStoreContext v5;

  v5.version = 0;
  memset(&v5.retain, 0, 24);
  v5.info = self;
  v3 = SCDynamicStoreCreate(0, CFSTR("HMFWiFiManager"), (SCDynamicStoreCallBack)dynamicStoreCallback, &v5);
  if (v3)
  {
    v4 = v3;
    if (SCDynamicStoreAddWatchedKey())
    {
      if (SCDynamicStoreSetDispatchQueue(v4, (dispatch_queue_t)self->_workQueue))
        self->_scStore = v4;
    }
  }
}

- (HMFWiFiManagerDataSourceDelegate)delegate
{
  return (HMFWiFiManagerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (__WiFiManagerClient)wifiClientReference
{
  return self->_wifiClientReference;
}

- (__WiFiDeviceClient)wifiDeviceReference
{
  return self->_wifiDeviceReference;
}

- (void)setWifiDeviceReference:(__WiFiDeviceClient *)a3
{
  self->_wifiDeviceReference = a3;
}

- (__WiFiNetwork)currentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(__WiFiNetwork *)a3
{
  self->_currentNetwork = a3;
}

- (__SCDynamicStore)scStore
{
  return self->_scStore;
}

- (void)setScStore:(__SCDynamicStore *)a3
{
  self->_scStore = a3;
}

- (NSLock)captiveCachedLock
{
  return self->_captiveCachedLock;
}

- (void)setCaptiveCachedLock:(id)a3
{
  objc_storeStrong((id *)&self->_captiveCachedLock, a3);
}

- (int)captiveCached
{
  return self->_captiveCached;
}

- (void)setCaptiveCached:(int)a3
{
  self->_captiveCached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captiveCachedLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
