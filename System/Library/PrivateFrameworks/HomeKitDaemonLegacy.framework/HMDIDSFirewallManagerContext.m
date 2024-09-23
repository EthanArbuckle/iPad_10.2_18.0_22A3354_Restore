@implementation HMDIDSFirewallManagerContext

- (HMDIDSFirewallManagerContext)initWithHomeManager:(id)a3 IDSFirewall:(id)a4 notificationCenter:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDIDSFirewallManagerContext *v14;
  HMDIDSFirewallManagerContext *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDIDSFirewallManagerContext;
  v14 = -[HMDIDSFirewallManagerContext init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_homeManager, v10);
    objc_storeStrong((id *)&v15->_firewall, a4);
    objc_storeStrong((id *)&v15->_notificationCenter, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
  }

  return v15;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDIDSFirewallManagerContext *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMDIDSFirewallManagerContext homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDIDSFirewallManagerContext notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleHomeAddedNotification_, CFSTR("HMDHomeAddedNotification"), v3);

    -[HMDIDSFirewallManagerContext notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), v3);

    -[HMDIDSFirewallManagerContext registerForHomeUserNotifications](self, "registerForHomeUserNotifications");
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Attempted to configure HMDIDSFirewallManagerContext with nil homeManager", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)registerForHomeUserNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDIDSFirewallManagerContext *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDIDSFirewallManagerContext homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HMDIDSFirewallManagerContext_registerForHomeUserNotifications__block_invoke;
    v10[3] = &unk_1E89B68B8;
    v10[4] = self;
    objc_msgSend(v5, "na_each:", v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Attempted to register for home user notifications for HMDIDSFirewallManagerContext with nil homeManager", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)handleHomeAddedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDIDSFirewallManagerContext workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HMDIDSFirewallManagerContext_handleHomeAddedNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDIDSFirewallManagerContext *v9;

  v4 = a3;
  -[HMDIDSFirewallManagerContext workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HMDIDSFirewallManagerContext_handleHomeRemovedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeUserAddedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDIDSFirewallManagerContext *v9;

  v4 = a3;
  -[HMDIDSFirewallManagerContext workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HMDIDSFirewallManagerContext_handleHomeUserAddedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDIDSFirewallManagerContext *v9;

  v4 = a3;
  -[HMDIDSFirewallManagerContext workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMDIDSFirewallManagerContext_handleHomeUserRemovedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)replaceFireWallEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDIDSFirewallManagerContext firewall](self, "firewall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMDIDSFirewallManagerContext_replaceFireWallEntries___block_invoke;
  v7[3] = &unk_1E89C21C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "replaceDonatedEntriesWithEntries:withCompletion:", v6, v7);

}

- (void)addFirewallEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDIDSFirewallManagerContext firewall](self, "firewall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMDIDSFirewallManagerContext_addFirewallEntries___block_invoke;
  v7[3] = &unk_1E89C21C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "donateEntries:withCompletion:", v6, v7);

}

- (void)addFirewallEntries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDIDSFirewallManagerContext firewall](self, "firewall");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "donateEntries:withCompletion:", v7, v6);

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (IDSFirewall)firewall
{
  return (IDSFirewall *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSFirewallManager)firewallManager
{
  return (HMDIDSFirewallManager *)objc_loadWeakRetained((id *)&self->_firewallManager);
}

- (void)setFirewallManager:(id)a3
{
  objc_storeWeak((id *)&self->_firewallManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firewallManager);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_firewall, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __51__HMDIDSFirewallManagerContext_addFirewallEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543875;
      v10 = v7;
      v11 = 2117;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to add firewall entries: %{sensitive}@ with error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __55__HMDIDSFirewallManagerContext_replaceFireWallEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543875;
      v10 = v7;
      v11 = 2117;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to replace firewall entries: %{sensitive}@ with error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __66__HMDIDSFirewallManagerContext_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543619;
    v12 = v9;
    v13 = 2117;
    v14 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %{sensitive}@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 40), "firewallManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleDidRemoveUser");

}

void __64__HMDIDSFirewallManagerContext_handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling added user: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "firewallManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleDidAddUserWithUserID:", v10);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543619;
      v17 = v15;
      v18 = 2117;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@User does not have userID. User: %{sensitive}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __62__HMDIDSFirewallManagerContext_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDHomeNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification home removed: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 40), "firewallManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleDidRemoveHome");

}

void __60__HMDIDSFirewallManagerContext_handleHomeAddedNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "firewallManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleDidAddHome");

}

void __64__HMDIDSFirewallManagerContext_registerForHomeUserNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleHomeUserAddedNotification_, CFSTR("HMDHomeUserAddedNotification"), v4);

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_68879 != -1)
    dispatch_once(&logCategory__hmf_once_t11_68879, &__block_literal_global_68880);
  return (id)logCategory__hmf_once_v12_68881;
}

void __43__HMDIDSFirewallManagerContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_68881;
  logCategory__hmf_once_v12_68881 = v0;

}

@end
