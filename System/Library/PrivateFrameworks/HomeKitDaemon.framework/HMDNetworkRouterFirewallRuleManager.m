@implementation HMDNetworkRouterFirewallRuleManager

- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3 notificationCenter:(id)a4 workQueue:(id)a5 coordinatorFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDNetworkRouterFirewallRuleManager *v15;
  HMDNetworkRouterFirewallRuleManager *v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *callbackQueue;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *coordinator;
  uint64_t v22;
  NSMutableArray *clients;
  HMDNetworkRouterFirewallRuleManager *v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDNetworkRouterFirewallRuleManager;
  v15 = -[HMDNetworkRouterFirewallRuleManager init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_localDatabase, a3);
    objc_storeStrong((id *)&v16->_notificationCenter, a4);
    v17 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v17, v18);
    callbackQueue = v16->_callbackQueue;
    v16->_callbackQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_workQueue, a5);
    objc_storeStrong((id *)&v16->_coordinatorFactory, a6);
    coordinator = v16->_coordinator;
    v16->_coordinator = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    clients = v16->_clients;
    v16->_clients = (NSMutableArray *)v22;

    v16->_state = 0;
    v16->_operationsInProgressCount = 0;
    v24 = v16;
  }

  return v16;
}

- (HMDNetworkRouterFirewallRuleManager)init
{
  void *v3;
  void *v4;
  HMDNetworkRouterFirewallRuleManager *v5;

  +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDNetworkRouterFirewallRuleManager initWithLocalDatabase:](self, "initWithLocalDatabase:", v4);

  return v5;
}

- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3
{
  return -[HMDNetworkRouterFirewallRuleManager initWithLocalDatabase:coordinatorFactory:](self, "initWithLocalDatabase:coordinatorFactory:", a3, 0);
}

- (HMDNetworkRouterFirewallRuleManager)initWithLocalDatabase:(id)a3 coordinatorFactory:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  HMDNetworkRouterFirewallRuleManager *v13;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const char *)HMFDispatchQueueName();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create(v10, v11);

  v13 = -[HMDNetworkRouterFirewallRuleManager initWithLocalDatabase:notificationCenter:workQueue:coordinatorFactory:](self, "initWithLocalDatabase:notificationCenter:workQueue:coordinatorFactory:", v8, v9, v12, v7);
  return v13;
}

- (void)dealloc
{
  void *v3;
  HMDNetworkRouterFirewallRuleManager *v4;
  NSObject *v5;
  void *v6;
  HMDAssertionLogEvent *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_state)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: should be stopped", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("should be stopped"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitLogEvent:", v7);

  }
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterFirewallRuleManager;
  -[HMDNetworkRouterFirewallRuleManager dealloc](&v9, sel_dealloc);
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)coordinator
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v4;
  NSObject *v5;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *coordinator;

  v4 = (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)a3;
  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  coordinator = self->_coordinator;
  self->_coordinator = v4;

}

- (int64_t)state
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_state;
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_state = a3;
}

- (NSMutableArray)clients
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_clients;
}

- (unint64_t)operationsInProgressCount
{
  os_unfair_lock_assert_owner(&self->_propertyLock);
  return self->_operationsInProgressCount;
}

- (void)setOperationsInProgressCount:(unint64_t)a3
{
  os_unfair_lock_assert_owner(&self->_propertyLock);
  self->_operationsInProgressCount = a3;
}

- (void)startupForClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)shutdownForClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)activeClients
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNetworkRouterFirewallRuleManager clients](self, "clients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__HMDNetworkRouterFirewallRuleManager_activeClients__block_invoke;
  v9[3] = &unk_24E77D4C0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSArray *)v7;
}

- (void)didCompleteScheduledCloudFetch
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNetworkRouterFirewallRuleManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDNetworkRouterFirewallRuleManager_didCompleteScheduledCloudFetch__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)fetchCloudChangesWithCompletion:(id)a3
{
  -[HMDNetworkRouterFirewallRuleManager _fetchCloudChangesIgnoringLastFetchedAccessories:forceChangeNotifications:completion:](self, "_fetchCloudChangesIgnoringLastFetchedAccessories:forceChangeNotifications:completion:", 0, 0, a3);
}

- (void)_fetchCloudChangesIgnoringLastFetchedAccessories:(BOOL)a3 forceChangeNotifications:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke;
  v10[3] = &unk_24E77D510;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  v9 = v8;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v10);

}

- (void)fetchRulesForAccessories:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke;
  v10[3] = &unk_24E77D538;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v10);

}

- (void)fetchPairedMetadataVersionConfigurationsForAccessories:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke;
  v10[3] = &unk_24E77D538;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v10);

}

- (void)listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
  -[HMDNetworkRouterFirewallRuleManager _dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:]((os_unfair_lock_s *)self, a3, 0, a4, 1, 0, a5);
}

- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7
{
  -[HMDNetworkRouterFirewallRuleManager _dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:]((os_unfair_lock_s *)self, a3, a4, a5, 0, a6, a7);
}

- (void)dumpAllLocalRulesIgnoringOverrides:(BOOL)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
  -[HMDNetworkRouterFirewallRuleManager _dumpLocalRuleConfigurationsForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:]((os_unfair_lock_s *)self, 0, 0, 0, a3, a4, a5);
}

- (void)dumpLocalRulesForProductGroup:(id)a3 ignoreOverrides:(BOOL)a4 rawOutput:(BOOL)a5 completion:(id)a6
{
  -[HMDNetworkRouterFirewallRuleManager _dumpLocalRuleConfigurationsForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:]((os_unfair_lock_s *)self, a3, 0, 0, a4, a5, a6);
}

- (void)dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  -[HMDNetworkRouterFirewallRuleManager _dumpLocalRuleConfigurationsForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:]((os_unfair_lock_s *)self, a3, a4, a5, a6, a7, a8);
}

- (void)removeAllLocalRulesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke;
  v6[3] = &unk_24E77D5B0;
  v7 = v4;
  v5 = v4;
  -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v6);

}

- (void)dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = v17;
  if (self)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
    v19[3] = &unk_24E77D588;
    v23 = v17;
    v20 = v14;
    v21 = v15;
    v22 = v16;
    v24 = a6;
    v25 = a7;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:]((os_unfair_lock_s *)self, v19);

  }
}

- (void)setOverrides:(id)a3 completion:(id)a4
{
  -[HMDNetworkRouterFirewallRuleManager _addOverridesWithData:replace:completion:]((os_unfair_lock_s *)self, a3, 1, a4);
}

- (void)addOverrides:(id)a3 completion:(id)a4
{
  -[HMDNetworkRouterFirewallRuleManager _addOverridesWithData:replace:completion:]((os_unfair_lock_s *)self, a3, 0, a4);
}

- (void)removeAllOverridesWithCompletion:(id)a3
{
  -[HMDNetworkRouterFirewallRuleManager _removeOverridesForProductGroup:productNumber:completion:]((os_unfair_lock_s *)self, 0, 0, a3);
}

- (void)removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 completion:(id)a5
{
  -[HMDNetworkRouterFirewallRuleManager _removeOverridesForProductGroup:productNumber:completion:]((os_unfair_lock_s *)self, a3, a4, a5);
}

- (void)forceFetchCloudChangesAndForceChangeNotifications:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __100__HMDNetworkRouterFirewallRuleManager_forceFetchCloudChangesAndForceChangeNotifications_completion___block_invoke;
  v8[3] = &unk_24E78DAA8;
  v9 = v6;
  v7 = v6;
  -[HMDNetworkRouterFirewallRuleManager _fetchCloudChangesIgnoringLastFetchedAccessories:forceChangeNotifications:completion:](self, "_fetchCloudChangesIgnoringLastFetchedAccessories:forceChangeNotifications:completion:", 1, v4, v8);

}

- (HMBLocalDatabase)localDatabase
{
  return self->_localDatabase;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinatorFactory)coordinatorFactory
{
  return self->_coordinatorFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

uint64_t __100__HMDNetworkRouterFirewallRuleManager_forceFetchCloudChangesAndForceChangeNotifications_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeOverridesForProductGroup:(void *)a3 productNumber:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke;
    v11[3] = &unk_24E77D600;
    v14 = v9;
    v12 = v7;
    v13 = v8;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v11);

  }
}

void __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  char v14;
  char v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_2;
    v24[3] = &unk_24E79C2B8;
    v26 = *(id *)(a1 + 48);
    v25 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v24);

    v7 = v26;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v23 = 0;
      v13 = (id *)&v23;
      v14 = objc_msgSend(v9, "removeOverridesForProductGroup:productNumber:error:", v11, v12, &v23);
    }
    else
    {
      v22 = 0;
      v13 = (id *)&v22;
      v14 = objc_msgSend(v9, "removeAllOverridesWithError:", &v22);
    }
    v15 = v14;
    v16 = *v13;

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_3;
    v18[3] = &unk_24E78D3F8;
    v21 = v15;
    v17 = *(id *)(a1 + 48);
    v19 = v16;
    v20 = v17;
    v7 = v16;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v18);

  }
}

- (void)__beginOperationWithBlock:(os_unfair_lock_s *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v4 = -[os_unfair_lock_s operationsInProgressCount](a1, "operationsInProgressCount") + 1;
    -[os_unfair_lock_s setOperationsInProgressCount:](a1, "setOperationsInProgressCount:", v4);
    os_unfair_lock_unlock(a1 + 2);
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2048;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Operation started (%lu operations now pending)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[os_unfair_lock_s workQueue](v6, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__HMDNetworkRouterFirewallRuleManager___beginOperationWithBlock___block_invoke;
    v10[3] = &unk_24E79C2B8;
    v10[4] = v6;
    v11 = v3;
    dispatch_async(v9, v10);

  }
}

void __65__HMDNetworkRouterFirewallRuleManager___beginOperationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2 == 1 || v2 == 3)
  {
    v6 = a1 + 32;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v6 + 8);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 15;
  }
  else
  {
    if (v2 == 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return;
    }
    v9 = a1 + 32;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v9 + 8);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = -1;
  }
  objc_msgSend(v7, "hmErrorWithCode:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v4, v10);

}

uint64_t __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)__finishOperationWithCallbackBlock:(void *)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(a1, "callbackQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke;
    v6[3] = &unk_24E79C2B8;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __96__HMDNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    v4 = 0;
  else
    v4 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke_2;
  block[3] = &unk_24E79C240;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __74__HMDNetworkRouterFirewallRuleManager___finishOperationWithCallbackBlock___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  void *v12;
  HMDAssertionLogEvent *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    os_unfair_lock_lock_with_options();
    v3 = -[os_unfair_lock_s operationsInProgressCount](v1, "operationsInProgressCount");
    if (v3)
    {
      v4 = v3 - 1;
      -[os_unfair_lock_s setOperationsInProgressCount:](v1, "setOperationsInProgressCount:", v3 - 1);
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v1;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v15 = 138543362;
        v16 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v16;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Operation count unbalanced", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Operation count unbalanced"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "submitLogEvent:", v13);

      v4 = 0;
    }
    os_unfair_lock_unlock(v1 + 2);
    v5 = (void *)MEMORY[0x227676638]();
    v6 = v1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = (uint64_t)v8;
      v17 = 2048;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Operation finished (%lu operations now pending)", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](v6);
  }
}

- (void)__startupOrShutdownIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *v11;
  NSObject *v12;
  void *v13;
  char v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  os_unfair_lock_s *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v24;
  char v25;
  NSObject *v26;
  void *v27;
  os_unfair_lock_s *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v39;
  void *v40;
  os_unfair_lock_s *v41;
  NSObject *v42;
  void *v43;
  HMDAssertionLogEvent *v44;
  void *v45;
  void *v46;
  os_unfair_lock_s *v47;
  NSObject *v48;
  void *v49;
  HMDAssertionLogEvent *v50;
  void *v51;
  void *v52;
  os_unfair_lock_s *v53;
  NSObject *v54;
  void *v55;
  HMDAssertionLogEvent *v56;
  void *v57;
  _BYTE v58[24];
  void *v59;
  os_unfair_lock_s *v60;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = -[os_unfair_lock_s state](a1, "state");
    if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v3 = v2;
      -[os_unfair_lock_s clients](a1, "clients");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");
      if (!v5)
        goto LABEL_13;
      v6 = 0;
      v7 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          ++v7;
        }
        else
        {
          objc_msgSend(v4, "removeObjectAtIndex:", v7);
          --v5;
          ++v6;
        }

      }
      while (v7 < v5);
      if (v6)
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = a1;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v58 = 138543874;
          *(_QWORD *)&v58[4] = v13;
          *(_WORD *)&v58[12] = 2048;
          *(_QWORD *)&v58[14] = v6;
          *(_WORD *)&v58[22] = 2048;
          v59 = (void *)v5;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Purged %lu deallocated client(s) (now have %lu)", v58, 0x20u);

        }
        objc_autoreleasePoolPop(v10);
        v14 = 1;
      }
      else
      {
LABEL_13:
        v14 = 0;
      }
      os_unfair_lock_lock_with_options();
      v15 = -[os_unfair_lock_s operationsInProgressCount](a1, "operationsInProgressCount");
      os_unfair_lock_unlock(a1 + 2);
      v16 = (v5 | v15) != 0;
      if (v3 || !(v5 | v15))
      {
        if (v3 != 2)
          v16 = 1;
        if (v16)
        {
          v25 = v14 ^ 1;
          if (v3 != 2)
            v25 = 1;
          if ((v25 & 1) == 0)
            -[HMDNetworkRouterFirewallRuleManager __notifyCoordinatorThatClientsChanged](a1);
        }
        else
        {
          -[os_unfair_lock_s workQueue](a1, "workQueue");
          v26 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v26);

          if (-[os_unfair_lock_s state](a1, "state") != 2)
          {
            v46 = (void *)MEMORY[0x227676638]();
            v47 = a1;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v58 = 138543362;
              *(_QWORD *)&v58[4] = v49;
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must be running", v58, 0xCu);

            }
            objc_autoreleasePoolPop(v46);
            v50 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must be running"));
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "submitLogEvent:", v50);

          }
          os_unfair_lock_lock_with_options();
          if (-[os_unfair_lock_s operationsInProgressCount](a1, "operationsInProgressCount"))
          {
            v52 = (void *)MEMORY[0x227676638]();
            v53 = a1;
            HMFGetOSLogHandle();
            v54 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
            {
              HMFGetLogIdentifier();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v58 = 138543362;
              *(_QWORD *)&v58[4] = v55;
              _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have finished all operations", v58, 0xCu);

            }
            objc_autoreleasePoolPop(v52);
            v56 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must have finished all operations"));
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "submitLogEvent:", v56);

          }
          os_unfair_lock_unlock(a1 + 2);
          v27 = (void *)MEMORY[0x227676638]();
          v28 = a1;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138543362;
            *(_QWORD *)&v58[4] = v30;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Shutdown initiated", v58, 0xCu);

          }
          objc_autoreleasePoolPop(v27);
          -[os_unfair_lock_s setState:](v28, "setState:", 3);
          -[os_unfair_lock_s coordinator](v28, "coordinator");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v58 = MEMORY[0x24BDAC760];
          *(_QWORD *)&v58[8] = 3221225472;
          *(_QWORD *)&v58[16] = __49__HMDNetworkRouterFirewallRuleManager___shutdown__block_invoke;
          v59 = &unk_24E79BD80;
          v60 = v28;
          objc_msgSend(v31, "shutdownWithCompletion:", v58);

        }
      }
      else
      {
        -[os_unfair_lock_s workQueue](a1, "workQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v17);

        if (-[os_unfair_lock_s state](a1, "state"))
        {
          v40 = (void *)MEMORY[0x227676638]();
          v41 = a1;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138543362;
            *(_QWORD *)&v58[4] = v43;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must be stopped", v58, 0xCu);

          }
          objc_autoreleasePoolPop(v40);
          v44 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must be stopped"));
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "submitLogEvent:", v44);

        }
        v18 = (void *)MEMORY[0x227676638]();
        v19 = a1;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v58 = 138543362;
          *(_QWORD *)&v58[4] = v21;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Startup initiated", v58, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        -[os_unfair_lock_s setState:](v19, "setState:", 1);
        -[os_unfair_lock_s coordinatorFactory](v19, "coordinatorFactory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[os_unfair_lock_s coordinatorFactory](v19, "coordinatorFactory");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "createCoordinator");
          v24 = (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = [HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator alloc];
          -[os_unfair_lock_s notificationCenter](v19, "notificationCenter");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "defaultCloudFetchInterval");
          v34 = v33;
          objc_msgSend((id)objc_opt_class(), "defaultCloudFetchRetryInterval");
          v36 = v35;
          -[os_unfair_lock_s workQueue](v19, "workQueue");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator initWithFirewallRuleManager:notificationCenter:cloudFetchInterval:cloudFetchRetryInterval:ownerQueue:](v32, "initWithFirewallRuleManager:notificationCenter:cloudFetchInterval:cloudFetchRetryInterval:ownerQueue:", v19, v23, v37, v34, v36);

        }
        -[os_unfair_lock_s localDatabase](v19, "localDatabase");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v58 = MEMORY[0x24BDAC760];
        *(_QWORD *)&v58[8] = 3221225472;
        *(_QWORD *)&v58[16] = __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke;
        v59 = &unk_24E79BCC8;
        v60 = v19;
        v61 = v24;
        v39 = v24;
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator startupWithLocalDatabase:completion:](v39, "startupWithLocalDatabase:completion:", v38, v58);

      }
    }
  }
}

- (void)__notifyCoordinatorThatClientsChanged
{
  NSObject *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(a1, "coordinator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "firewallRuleManagerClientsDidChange");

  }
}

void __49__HMDNetworkRouterFirewallRuleManager___shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "setCoordinator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
  -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(_QWORD *)(a1 + 32));

}

void __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke_2;
  v17 = &unk_24E77D4E8;
  v18 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v19 = v7;
  v8 = (void *)MEMORY[0x227676638](objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v14));
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Startup failed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 0, v14, v15, v16, v17, v18);
    objc_msgSend(v5, "removeAllObjects");
    -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](*(void **)(a1 + 32), v7, v3);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Startup completed successfully", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "setCoordinator:", *(_QWORD *)(a1 + 40), v14, v15, v16, v17, v18);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](*(void **)(a1 + 32), v7, 0);
    -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(_QWORD *)(a1 + 32));
  }

}

void __48__HMDNetworkRouterFirewallRuleManager___startup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDAssertionLogEvent *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "startupCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v7 = _Block_copy(v4);
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v3, "setStartupCompletion:", 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Completion should not have been called yet", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Completion should not have been called yet"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitLogEvent:", v12);

  }
}

- (void)__invokeCompletions:(void *)a3 withError:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(a1, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__HMDNetworkRouterFirewallRuleManager___invokeCompletions_withError___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = a1;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

void __69__HMDNetworkRouterFirewallRuleManager___invokeCompletions_withError___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_addOverridesWithData:(char)a3 replace:(void *)a4 completion:
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke;
    v10[3] = &unk_24E77D5D8;
    v12 = v8;
    v11 = v7;
    v13 = a3;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v10);

  }
}

void __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_2;
    v22[3] = &unk_24E79C2B8;
    v24 = *(id *)(a1 + 40);
    v23 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v22);

    v7 = v24;
  }
  else
  {
    +[HMDNetworkRouterFirewallRuleManagerOverrideParser parseFromData:](HMDNetworkRouterFirewallRuleManagerOverrideParser, "parseFromData:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "coordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "copy");
      v10 = *(unsigned __int8 *)(a1 + 48);
      v19 = 0;
      v11 = objc_msgSend(v8, "addOverrides:replace:error:", v9, v10, &v19);
      v12 = v19;

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_4;
      v15[3] = &unk_24E78D3F8;
      v18 = v11;
      v13 = *(id *)(a1 + 40);
      v16 = v12;
      v17 = v13;
      v14 = v12;
      -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v15);

    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_3;
      v20[3] = &unk_24E799CC8;
      v21 = *(id *)(a1 + 40);
      -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v20);
      v14 = v21;
    }

  }
}

uint64_t __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __80__HMDNetworkRouterFirewallRuleManager__addOverridesWithData_replace_completion___block_invoke_4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    v4 = 0;
  else
    v4 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a3;
  if (v5)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2;
    v24[3] = &unk_24E79C2B8;
    v26 = *(id *)(a1 + 56);
    v25 = v5;
    v6 = a2;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v6, v24);

    v7 = v26;
  }
  else
  {
    v8 = a2;
    objc_msgSend(v8, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(unsigned __int8 *)(a1 + 64);
    v14 = *(unsigned __int8 *)(a1 + 65);
    v23 = 0;
    objc_msgSend(v9, "dumpPairedMetadataForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:error:", v10, v11, v12, v13, v14, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3;
    v19[3] = &unk_24E79B440;
    v20 = v15;
    v17 = *(id *)(a1 + 56);
    v21 = v16;
    v22 = v17;
    v7 = v16;
    v18 = v15;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v8, v19);

  }
}

uint64_t __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __141__HMDNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[5]);
}

void __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a3;
  if (v5)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_2;
    v18[3] = &unk_24E79C2B8;
    v20 = *(id *)(a1 + 32);
    v19 = v5;
    v6 = a2;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v6, v18);

    v7 = v20;
  }
  else
  {
    v8 = a2;
    objc_msgSend(v8, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v10 = objc_msgSend(v9, "removeAllLocalRulesWithError:", &v17);
    v11 = v17;

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_3;
    v13[3] = &unk_24E78D3F8;
    v12 = *(id *)(a1 + 32);
    v16 = v10;
    v14 = v11;
    v15 = v12;
    v7 = v11;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v8, v13);

  }
}

uint64_t __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73__HMDNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)_dumpLocalRuleConfigurationsForProductGroup:(void *)a3 productNumber:(void *)a4 firmwareVersion:(char)a5 ignoreOverrides:(char)a6 rawOutput:(void *)a7 completion:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  char v24;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = v16;
  if (a1)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
    v18[3] = &unk_24E77D588;
    v22 = v16;
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v23 = a5;
    v24 = a6;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v18);

  }
}

void __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a3;
  if (v5)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2;
    v24[3] = &unk_24E79C2B8;
    v26 = *(id *)(a1 + 56);
    v25 = v5;
    v6 = a2;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v6, v24);

    v7 = v26;
  }
  else
  {
    v8 = a2;
    objc_msgSend(v8, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(unsigned __int8 *)(a1 + 64);
    v14 = *(unsigned __int8 *)(a1 + 65);
    v23 = 0;
    objc_msgSend(v9, "dumpLocalRulesForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:error:", v10, v11, v12, v13, v14, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3;
    v19[3] = &unk_24E79B440;
    v20 = v15;
    v17 = *(id *)(a1 + 56);
    v21 = v16;
    v22 = v17;
    v7 = v16;
    v18 = v15;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v8, v19);

  }
}

uint64_t __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __150__HMDNetworkRouterFirewallRuleManager__dumpLocalRuleConfigurationsForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[5]);
}

- (void)_dumpCloudRecordsForProductGroup:(void *)a3 productNumber:(char)a4 rawOutput:(char)a5 listOnly:(char)a6 verifySignatures:(void *)a7 completion:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  char v21;
  char v22;
  char v23;

  v13 = a2;
  v14 = a3;
  v15 = a7;
  v16 = v15;
  if (a1)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke;
    v17[3] = &unk_24E77D560;
    v20 = v15;
    v18 = v13;
    v19 = v14;
    v21 = a4;
    v22 = a5;
    v23 = a6;
    -[HMDNetworkRouterFirewallRuleManager __beginOperationWithBlock:](a1, v17);

  }
}

void __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_2;
    v18[3] = &unk_24E79C2B8;
    v7 = &v20;
    v20 = *(id *)(a1 + 48);
    v8 = &v19;
    v19 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v18);
  }
  else
  {
    objc_msgSend(v5, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v11 = *(unsigned __int8 *)(a1 + 56);
    v12 = *(unsigned __int8 *)(a1 + 57);
    v13 = *(unsigned __int8 *)(a1 + 58);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_3;
    v15[3] = &unk_24E783A08;
    v7 = &v16;
    v16 = v5;
    v8 = &v17;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v9, "dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:", v14, v10, v11, v12, v13, v15);

  }
}

uint64_t __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_4;
  v11[3] = &unk_24E79B440;
  v12 = v5;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v7, v11);

}

uint64_t __133__HMDNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[5]);
}

void __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a3;
  if (v5)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2;
    v15[3] = &unk_24E79C2B8;
    v17 = *(id *)(a1 + 40);
    v16 = v5;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](a2, v15);

  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    if (a2)
    {
      v8 = v6;
      objc_msgSend(a2, "workQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v9);

      objc_msgSend(a2, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v10, "fetchPairedMetadataVersionConfigurationsForAccessories:qualityOfService:ignoreOverrides:error:", v8, 17, 0, &v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v21;
      v18[0] = MEMORY[0x24BDAC760];
      if (v11)
      {
        v13 = __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2;
        v14 = v11;
      }
      else
      {
        v13 = __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke;
        v14 = v12;
      }
      v18[1] = 3221225472;
      v18[2] = v13;
      v18[3] = &unk_24E79C2B8;
      v20 = v7;
      v19 = v14;
      -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](a2, v18);

    }
  }

}

uint64_t __105__HMDNetworkRouterFirewallRuleManager_fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __106__HMDNetworkRouterFirewallRuleManager__fetchPairedMetadataVersionConfigurationsForAccessories_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_2;
    v14[3] = &unk_24E79C2B8;
    v7 = &v16;
    v16 = *(id *)(a1 + 40);
    v8 = &v15;
    v15 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v14);
  }
  else
  {
    objc_msgSend(v5, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_3;
    v11[3] = &unk_24E78EE90;
    v7 = &v12;
    v12 = v5;
    v8 = &v13;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "fetchRulesForAccessories:qualityOfService:ignoreOverrides:completion:", v10, 17, 0, v11);

  }
}

uint64_t __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_4;
  v11[3] = &unk_24E79B440;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v7, v11);

}

uint64_t __75__HMDNetworkRouterFirewallRuleManager_fetchRulesForAccessories_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_2;
    v15[3] = &unk_24E79C2B8;
    v7 = &v17;
    v17 = *(id *)(a1 + 32);
    v8 = &v16;
    v16 = v6;
    -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v5, v15);
  }
  else
  {
    objc_msgSend(v5, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(unsigned __int8 *)(a1 + 40);
    v11 = *(unsigned __int8 *)(a1 + 41);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_3;
    v12[3] = &unk_24E78EE90;
    v7 = &v13;
    v13 = v5;
    v8 = &v14;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v9, "fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:completion:", 17, v10, v11, v12);

  }
}

uint64_t __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_4;
  v11[3] = &unk_24E79B440;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  -[HMDNetworkRouterFirewallRuleManager __finishOperationWithCallbackBlock:](v7, v11);

}

uint64_t __124__HMDNetworkRouterFirewallRuleManager__fetchCloudChangesIgnoringLastFetchedAccessories_forceChangeNotifications_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__HMDNetworkRouterFirewallRuleManager_didCompleteScheduledCloudFetch__block_invoke(uint64_t a1)
{
  -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(os_unfair_lock_s **)(a1 + 32));
}

void __52__HMDNetworkRouterFirewallRuleManager_activeClients__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  HMDAssertionLogEvent *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__54880;
  v43 = __Block_byref_object_dispose__54881;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0x7FFFFFFFFFFFFFFFLL;
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke_2;
  v31 = &unk_24E77D498;
  v32 = *(id *)(a1 + 40);
  v33 = &v39;
  v34 = &v35;
  v3 = objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v28);
  if (v40[5])
  {
    v4 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "removeObjectAtIndex:", v36[3], v28, v29, v30, v31));
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v2, "count");
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v47 = (uint64_t)v7;
      v48 = 2048;
      v49 = v8;
      v50 = 2112;
      v51 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed active client (now have %lu): %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v10 = objc_msgSend(*(id *)(a1 + 32), "state");
    if (v10 == 2)
      -[HMDNetworkRouterFirewallRuleManager __notifyCoordinatorThatClientsChanged](*(void **)(a1 + 32));
    objc_msgSend((id)v40[5], "startupCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 1)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v24 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v24;
          v25 = (void *)v24;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must be starting or stopping", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        v26 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must be starting or stopping"));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "submitLogEvent:", v26);

      }
      v12 = *(void **)(a1 + 32);
      v13 = _Block_copy(v11);
      v45 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](v12, v14, v15);

    }
    -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary](*(os_unfair_lock_s **)(a1 + 32));

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638](v3);
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v47 = (uint64_t)v19;
      v48 = 2112;
      v49 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring unbalanced shutdown request for client %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

}

void __57__HMDNetworkRouterFirewallRuleManager_shutdownForClient___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[4];

  if (v8 == v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }

}

void __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerClientState *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  void *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__54880;
  v36 = __Block_byref_object_dispose__54881;
  v3 = MEMORY[0x24BDAC760];
  v37 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_29;
  v29[3] = &unk_24E77D448;
  v30 = a1[5];
  v31 = &v32;
  v4 = objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
  if (v33[5])
  {
    v5 = (void *)MEMORY[0x227676638](v4);
    v6 = a1[4];
    HMFGetOSLogHandle();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      v40 = v8;
      v41 = 2112;
      v42 = (uint64_t)v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring duplicate startup request for client %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend((id)v33[5], "startupCompletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v26[0] = v3;
      v26[1] = 3221225472;
      v26[2] = __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_31;
      v26[3] = &unk_24E77D470;
      v27 = v10;
      v28 = a1[6];
      objc_msgSend((id)v33[5], "setStartupCompletion:", v26);

      v12 = v27;
    }
    else
    {
      v24 = a1[4];
      v12 = _Block_copy(a1[6]);
      v45[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](v24, v25, 0);

    }
  }
  else
  {
    v13 = objc_alloc_init(HMDNetworkRouterFirewallRuleManagerClientState);
    v14 = (void *)v33[5];
    v33[5] = (uint64_t)v13;

    objc_msgSend((id)v33[5], "setClient:", a1[5]);
    v15 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "addObject:", v33[5]));
    v16 = a1[4];
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v2, "count");
      v20 = a1[5];
      *(_DWORD *)buf = 138543874;
      v40 = v18;
      v41 = 2048;
      v42 = v19;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Added active client (now have %lu): %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    if (objc_msgSend(a1[4], "state") == 2)
    {
      v21 = a1[4];
      v22 = _Block_copy(a1[6]);
      v38 = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManager __invokeCompletions:withError:](v21, v23, 0);

      -[HMDNetworkRouterFirewallRuleManager __notifyCoordinatorThatClientsChanged](a1[4]);
    }
    else
    {
      objc_msgSend((id)v33[5], "setStartupCompletion:", a1[6]);
      -[HMDNetworkRouterFirewallRuleManager __startupOrShutdownIfNecessary]((os_unfair_lock_s *)a1[4]);
    }
  }

  _Block_object_dispose(&v32, 8);
}

void __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_29(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __67__HMDNetworkRouterFirewallRuleManager_startupForClient_completion___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_54929 != -1)
    dispatch_once(&logCategory__hmf_once_t0_54929, &__block_literal_global_54930);
  return (id)logCategory__hmf_once_v1_54931;
}

+ (HMDNetworkRouterFirewallRuleManager)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  return (HMDNetworkRouterFirewallRuleManager *)(id)sharedInstance_firewallRuleManager;
}

+ (double)defaultCloudFetchInterval
{
  return +[HMDNetworkRouterFirewallRuleManager _intervalPreferenceForKey:defaultValue:](86400.0, (uint64_t)a1, CFSTR("HMDNetworkRouterFirewallRuleManagerCloudFetchInterval"));
}

+ (double)defaultCloudFetchRetryInterval
{
  return +[HMDNetworkRouterFirewallRuleManager _intervalPreferenceForKey:defaultValue:](3600.0, (uint64_t)a1, CFSTR("HMDNetworkRouterFirewallRuleManagerCloudFetchRetryInterval"));
}

+ (double)_intervalPreferenceForKey:(void *)a3 defaultValue:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v4 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "numberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    a1 = v9;

  }
  return a1;
}

void __53__HMDNetworkRouterFirewallRuleManager_sharedInstance__block_invoke()
{
  HMDNetworkRouterFirewallRuleManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMDNetworkRouterFirewallRuleManager);
  v1 = (void *)sharedInstance_firewallRuleManager;
  sharedInstance_firewallRuleManager = (uint64_t)v0;

}

void __50__HMDNetworkRouterFirewallRuleManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_54931;
  logCategory__hmf_once_v1_54931 = v0;

}

@end
