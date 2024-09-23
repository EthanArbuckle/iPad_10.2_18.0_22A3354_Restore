@implementation HMFWiFiManager

- (void)__updateActiveAssertions
{
  os_unfair_lock_s *v2;
  id v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 1);
    os_unfair_lock_lock_with_options();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v3 = a1[6];
    v4 = 0;
    v5 = 0;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v9, "isValid", (_QWORD)v24))
          {
            v4 |= objc_msgSend(v9, "options");
            v5 = 1;
          }
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v6);
    }

    v10 = a1[4];
    v11 = objc_msgSend(v10, "isAssertionActive");

    if (((v5 ^ v11) & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1A1AC355C]();
      v13 = a1;
      if ((v5 & 1) == 0)
      {
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v29 = v23;
          _os_log_impl(&dword_19B546000, v22, OS_LOG_TYPE_INFO, "%{public}@Deactivating", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        v17 = v13[4];
        objc_msgSend(v17, "deactivate");
        goto LABEL_23;
      }
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        HMFWiFiAssertionOptionsDescription(v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Activating with options: %@", buf, 0x16u);

      }
    }
    else
    {
      v18 = a1[4];
      v19 = v4 == objc_msgSend(v18, "assertionOptions");

      if (v19)
      {
LABEL_24:
        os_unfair_lock_unlock(v2);
        return;
      }
      v12 = (void *)MEMORY[0x1A1AC355C]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        HMFWiFiAssertionOptionsDescription(v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating activation with options: %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v12);
    v17 = v13[4];
    objc_msgSend(v17, "activateWithOptions:", v4);
LABEL_23:

    goto LABEL_24;
  }
}

+ (HMFWiFiManager)sharedManager
{
  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_9);
  return (HMFWiFiManager *)(id)qword_1ED012E28;
}

void __31__HMFWiFiManager_sharedManager__block_invoke()
{
  HMFWiFiManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMFWiFiManager);
  v1 = (void *)qword_1ED012E28;
  qword_1ED012E28 = (uint64_t)v0;

}

- (HMFWiFiManager)init
{
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  HMFWiFiManagerDataSource *v6;
  HMFWiFiManager *v7;

  v3 = (const char *)HMFDispatchQueueName(self, 0);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(v3, v4);

  v6 = -[HMFWiFiManagerDataSource initWithWorkQueue:]([HMFWiFiManagerDataSource alloc], "initWithWorkQueue:", v5);
  v7 = -[HMFWiFiManager initWithWorkQueue:dataSource:](self, "initWithWorkQueue:dataSource:", v5, v6);

  return v7;
}

- (HMFWiFiManager)initWithWorkQueue:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  HMFWiFiManager *v9;
  HMFWiFiManager *v10;
  uint64_t v11;
  NSHashTable *activeAssertions;
  void *v13;
  HMFMACAddress *v14;
  HMFMACAddress *MACAddress;
  NSObject *workQueue;
  _QWORD block[4];
  HMFWiFiManager *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMFWiFiManager;
  v9 = -[HMFWiFiManager init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    activeAssertions = v10->_activeAssertions;
    v10->_activeAssertions = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_dataSource, a4);
    -[HMFWiFiManagerDataSource setDelegate:](v10->_dataSource, "setDelegate:", v10);
    objc_msgSend((id)objc_opt_class(), "MACAddressString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMFMACAddress initWithMACAddressString:]([HMFMACAddress alloc], "initWithMACAddressString:", v13);
    MACAddress = v10->_MACAddress;
    v10->_MACAddress = v14;

    workQueue = v10->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__HMFWiFiManager_initWithWorkQueue_dataSource___block_invoke;
    block[3] = &unk_1E3B37AF8;
    v19 = v10;
    dispatch_async(workQueue, block);

  }
  return v10;
}

uint64_t __47__HMFWiFiManager_initWithWorkQueue_dataSource___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v2 = v1[4];
  else
    v2 = 0;
  return objc_msgSend(v1, "currentNetworkDidChangeForDataSource:", v2);
}

- (NSString)currentNetworkSSID
{
  os_unfair_lock_s *p_lock;
  HMFWiFiManagerDataSource *dataSource;
  HMFWiFiManagerDataSource *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    dataSource = self->_dataSource;
  else
    dataSource = 0;
  v5 = dataSource;
  -[HMFWiFiManagerDataSource currentNetworkAssociation](v5, "currentNetworkAssociation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (HMFWifiNetworkAssociation)currentNetworkAssociation
{
  os_unfair_lock_s *p_lock;
  HMFWiFiManagerDataSource *dataSource;
  HMFWiFiManagerDataSource *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    dataSource = self->_dataSource;
  else
    dataSource = 0;
  v5 = dataSource;
  -[HMFWiFiManagerDataSource currentNetworkAssociation](v5, "currentNetworkAssociation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (HMFWifiNetworkAssociation *)v6;
}

- (NSNumber)currentNetworkRSSI
{
  os_unfair_lock_s *p_lock;
  HMFWiFiManagerDataSource *dataSource;
  HMFWiFiManagerDataSource *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    dataSource = self->_dataSource;
  else
    dataSource = 0;
  v5 = dataSource;
  -[HMFWiFiManagerDataSource currentNetworkRSSI](v5, "currentNetworkRSSI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSNumber *)v6;
}

- (BOOL)isActive
{
  os_unfair_lock_s *p_lock;
  HMFWiFiManagerDataSource *dataSource;
  HMFWiFiManagerDataSource *v5;
  BOOL v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    dataSource = self->_dataSource;
  else
    dataSource = 0;
  v5 = dataSource;
  v6 = -[HMFWiFiManagerDataSource isAssertionActive](v5, "isAssertionActive");

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isCaptive
{
  os_unfair_lock_s *p_lock;
  HMFWiFiManagerDataSource *dataSource;
  HMFWiFiManagerDataSource *v5;
  BOOL v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    dataSource = self->_dataSource;
  else
    dataSource = 0;
  v5 = dataSource;
  v6 = -[HMFWiFiManagerDataSource isCaptive](v5, "isCaptive");

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)beginActiveAssertionWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  void *v7;
  HMFWiFiManager *v8;
  NSObject *v9;
  void *v10;
  __HMFWiFiAssertion *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC355C]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Taking active assertion with reason: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = -[__HMFWiFiAssertion initWithOptions:manager:reason:]([__HMFWiFiAssertion alloc], "initWithOptions:manager:reason:", a3, v8, v6);
  os_unfair_lock_lock_with_options();
  -[NSHashTable addObject:](v8->_activeAssertions, "addObject:", v11);
  os_unfair_lock_unlock(&v8->_lock);
  -[__HMFWiFiAssertion acquire:](v11, "acquire:", 0);

  return v11;
}

- (void)endActiveAssertion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    os_unfair_lock_lock_with_options();
    -[NSHashTable removeObject:](self->_activeAssertions, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v5, "invalidate");
  }

}

- (void)takeWoWAssertion
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HMFWiFiManager_takeWoWAssertion__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__HMFWiFiManager_takeWoWAssertion__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1 && !*(_BYTE *)(v1 + 12) && *(_QWORD *)(v1 + 32))
  {
    v2 = result;
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = *(id *)(v2 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Taking WoW assertion", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = *(_QWORD *)(v2 + 32);
    if (v7 && (*(_BYTE *)(v7 + 12) = 1, (v8 = *(_QWORD *)(v2 + 32)) != 0))
      v9 = *(void **)(v8 + 32);
    else
      v9 = 0;
    return objc_msgSend(v9, "setWoWAsserted:", 1);
  }
  return result;
}

- (void)releaseWoWAssertion
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HMFWiFiManager_releaseWoWAssertion__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __37__HMFWiFiManager_releaseWoWAssertion__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1 && *(_BYTE *)(v1 + 12) && *(_QWORD *)(v1 + 32))
  {
    v2 = result;
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = *(id *)(v2 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Releasing WoW assertion", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = *(_QWORD *)(v2 + 32);
    if (v7 && (*(_BYTE *)(v7 + 12) = 0, (v8 = *(_QWORD *)(v2 + 32)) != 0))
      v9 = *(void **)(v8 + 32);
    else
      v9 = 0;
    return objc_msgSend(v9, "setWoWAsserted:", 0);
  }
  return result;
}

+ (id)logCategory
{
  if (qword_1ED012E30 != -1)
    dispatch_once(&qword_1ED012E30, &__block_literal_global_67);
  return (id)qword_1ED012E38;
}

void __29__HMFWiFiManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.WiFi.Manager"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012E38;
  qword_1ED012E38 = v0;

}

- (void)dataSource:(id)a3 didChangeWoWState:(BOOL)a4
{
  HMFWiFiManager *v5;
  HMFWiFiManagerDataSource *dataSource;
  _QWORD v7[5];

  v5 = self;
  if (self)
    self = (HMFWiFiManager *)self->_workQueue;
  dispatch_assert_queue_V2(&self->super.super);
  if (v5 && !a4 && v5->_shouldAssertWoW)
  {
    dataSource = v5->_dataSource;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__HMFWiFiManager_dataSource_didChangeWoWState___block_invoke;
    v7[3] = &unk_1E3B37AF8;
    v7[4] = v5;
    -[HMFWiFiManagerDataSource performBlockAfterWoWReassertionDelay:](dataSource, "performBlockAfterWoWReassertionDelay:", v7);
  }
}

void __47__HMFWiFiManager_dataSource_didChangeWoWState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Re-Enabling WoW", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (*(_BYTE *)(v6 + 12))
      objc_msgSend(*(id *)(v6 + 32), "setWoWAsserted:", 1);
  }
}

- (void)dataSource:(id)a3 didChangeLinkAvailability:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *workQueue;
  void *v8;
  HMFWiFiManager *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  dispatch_assert_queue_V2(workQueue);
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("Down");
    if (v4)
      v13 = CFSTR("Up");
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@WiFi link is %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (self && !v4)
    v9->_shouldAssertWoW = 0;

}

- (void)currentNetworkDidChangeForDataSource:(id)a3
{
  id v4;
  HMFWiFiManagerDataSource *dataSource;
  HMFWiFiManagerDataSource *v6;
  void *v7;
  void *v8;
  NSString *savedNetworkSSID;
  void *v10;
  HMFWiFiManager *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  const char *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    dataSource = self->_dataSource;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    dataSource = 0;
  }
  v6 = dataSource;
  -[HMFWiFiManagerDataSource currentNetworkAssociation](v6, "currentNetworkAssociation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    savedNetworkSSID = self->_savedNetworkSSID;
  else
    savedNetworkSSID = 0;
  if ((HMFEqualObjects(savedNetworkSSID, v8) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v11);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (self)
        v15 = v11->_savedNetworkSSID;
      else
        v15 = 0;
      v18 = 138543874;
      v19 = v13;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_INFO, "%{public}@Current network SSID updated from %@ to %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    if (self)
      objc_setProperty_nonatomic_copy(v11, v16, v8, 40);
    +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", HMFWiFiManagerCurrentNetworkDidChangeNotification, v11);

  }
}

- (HMFMACAddress)MACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_savedNetworkSSID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end
