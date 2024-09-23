@implementation HMDIDSFirewallManager

- (HMDIDSFirewallManager)initWithContext:(id)a3
{
  id v5;
  HMDIDSFirewallManager *v6;
  HMDIDSFirewallManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDIDSFirewallManager;
  v6 = -[HMDIDSFirewallManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    -[HMDIDSFirewallManagerContext setFirewallManager:](v7->_context, "setFirewallManager:", v7);
  }

  return v7;
}

- (NSArray)userIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HMDIDSFirewallManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "na_flatMap:", &__block_literal_global_106_142568);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDIDSFirewallManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDIDSFirewallManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting HMDIDSFirewallManager", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSFirewallManager context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configure");

  -[HMDIDSFirewallManager userIDs](v6, "userIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSFirewallManager replaceFireWallEntriesWithUserIDs:](v6, "replaceFireWallEntriesWithUserIDs:", v10);

}

- (void)replaceFireWallEntriesWithUserIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDIDSFirewallManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSFirewallManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543619;
    v14 = v10;
    v15 = 2117;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Replacing firewall entries with userIDs: %{sensitive}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDIDSFirewallManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDIDSFirewallManager firewallEntriesForUserIDs:](HMDIDSFirewallManager, "firewallEntriesForUserIDs:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceFireWallEntries:", v12);

}

- (void)addFireWallEntryForUserIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDIDSFirewallManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSFirewallManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543619;
    v14 = v10;
    v15 = 2117;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding firewall entries for userIDs: %{sensitive}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDIDSFirewallManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDIDSFirewallManager firewallEntriesForUserIDs:](HMDIDSFirewallManager, "firewallEntriesForUserIDs:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFirewallEntries:", v12);

}

- (void)handleDidAddHome
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDIDSFirewallManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDIDSFirewallManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did add home", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSFirewallManager context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForHomeUserNotifications");

  -[HMDIDSFirewallManager userIDs](v6, "userIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSFirewallManager replaceFireWallEntriesWithUserIDs:](v6, "replaceFireWallEntriesWithUserIDs:", v10);

}

- (void)handleDidRemoveHome
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDIDSFirewallManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDIDSFirewallManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did remove home", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSFirewallManager userIDs](v6, "userIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSFirewallManager replaceFireWallEntriesWithUserIDs:](v6, "replaceFireWallEntriesWithUserIDs:", v9);

}

- (void)handleDidAddUserWithUserID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDIDSFirewallManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSFirewallManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v14 = v10;
    v15 = 2117;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling did add user with userID: %{sensitive}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSFirewallManager addFireWallEntryForUserIDs:](v8, "addFireWallEntryForUserIDs:", v11);

}

- (void)handleDidAddUserWithUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDIDSFirewallManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDIDSFirewallManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v19 = v13;
    v20 = 2117;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding firewall entry for userID: %{sensitive}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDIDSFirewallManager context](v11, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDIDSFirewallManager firewallEntriesForUserIDs:](HMDIDSFirewallManager, "firewallEntriesForUserIDs:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addFirewallEntries:completion:", v16, v7);

}

- (void)handleDidRemoveUser
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDIDSFirewallManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDIDSFirewallManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did remove user", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSFirewallManager userIDs](v6, "userIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSFirewallManager replaceFireWallEntriesWithUserIDs:](v6, "replaceFireWallEntriesWithUserIDs:", v9);

}

- (HMDIDSFirewallManagerContext)context
{
  return (HMDIDSFirewallManagerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

id __32__HMDIDSFirewallManager_userIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "usersIncludingPendingUsers:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_108_142570);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __32__HMDIDSFirewallManager_userIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userID");
}

+ (id)firewallEntriesForUserIDs:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_100_142578);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_142574 != -1)
    dispatch_once(&logCategory__hmf_once_t21_142574, &__block_literal_global_111);
  return (id)logCategory__hmf_once_v22_142575;
}

void __36__HMDIDSFirewallManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22_142575;
  logCategory__hmf_once_v22_142575 = v0;

}

id __51__HMDIDSFirewallManager_firewallEntriesForUserIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE4FCE0], "URIWithUnprefixedURI:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC30]), "initWithURI:", v2);

  return v3;
}

@end
