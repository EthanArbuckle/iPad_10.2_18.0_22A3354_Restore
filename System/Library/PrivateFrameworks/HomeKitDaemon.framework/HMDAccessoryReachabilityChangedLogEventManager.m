@implementation HMDAccessoryReachabilityChangedLogEventManager

- (id)logEventSubmitter
{
  return +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
}

- (HMDAccessoryReachabilityChangedLogEventManager)initWithHome:(id)a3
{
  id v4;
  HMDAccessoryReachabilityChangedLogEventManager *v5;
  HMDAccessoryReachabilityChangedLogEventManager *v6;
  uint64_t v7;
  NSMutableDictionary *transportReachabilityChangeDatesByUUID;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryReachabilityChangedLogEventManager;
  v5 = -[HMDAccessoryReachabilityChangedLogEventManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_home, v4);
    v6->_enabled = 0;
    v7 = objc_opt_new();
    transportReachabilityChangeDatesByUUID = v6->_transportReachabilityChangeDatesByUUID;
    v6->_transportReachabilityChangeDatesByUUID = (NSMutableDictionary *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("HMDReachabilityChangedLogEventManagerWorkQueue", v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v6;
}

- (void)configure
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdatedNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDAccessoryReachabilityChangedLogEventManager home](self, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dailyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDailyTaskRunner:", self);

}

- (void)submitForAccessory:(id)a3 withTransportReport:(id)a4 reachable:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[HMDAccessoryReachabilityChangedLogEventManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__HMDAccessoryReachabilityChangedLogEventManager_submitForAccessory_withTransportReport_reachable___block_invoke;
  v13[3] = &unk_24E796150;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_submitForAccessory:(id)a3 withTransportReport:(id)a4 reachable:(BOOL)a5 changed:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSMutableDictionary *transportReachabilityChangeDatesByUUID;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v6 = a6;
  v7 = a5;
  v27 = a3;
  v10 = a4;
  if (v27)
  {
    if (v10)
    {
      if (self->_enabled)
      {
        transportReachabilityChangeDatesByUUID = self->_transportReachabilityChangeDatesByUUID;
        objc_msgSend(v27, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](transportReachabilityChangeDatesByUUID, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "linkType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15
          || (objc_msgSend(v10, "reachableLastChangedTime"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceDate:", v15);
          v18 = v17;
          v19 = self->_transportReachabilityChangeDatesByUUID;
          objc_msgSend(v27, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v21 = (void *)objc_opt_new();
            v22 = self->_transportReachabilityChangeDatesByUUID;
            objc_msgSend(v27, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

          }
          objc_msgSend(v10, "linkType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, v24);

          +[HMDAccessoryReachabilityChangedLogEvent eventWithReachable:changed:duration:accessory:transportReport:](HMDAccessoryReachabilityChangedLogEvent, "eventWithReachable:changed:duration:accessory:transportReport:", v7, v6, v27, v10, v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryReachabilityChangedLogEventManager logEventSubmitter](self, "logEventSubmitter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "submitLogEvent:error:", v25, 0);

        }
      }
    }
  }

}

- (void)_submitDailyUpdateForAccessory:(id)a3 withTransportReport:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[HMDAccessoryReachabilityChangedLogEventManager _submitForAccessory:withTransportReport:reachable:changed:](self, "_submitForAccessory:withTransportReport:reachable:changed:", v7, v6, objc_msgSend(v7, "isReachable"), 0);

}

- (void)_submitForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "transportReports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HMDAccessoryReachabilityChangedLogEventManager__submitForAccessory___block_invoke;
  v7[3] = &unk_24E77ABF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

}

- (void)_reset
{
  void *v3;
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *transportReachabilityChangeDatesByUUID;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryReachabilityChangedLogEventManager home](self, "home");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableDictionary *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));
  transportReachabilityChangeDatesByUUID = self->_transportReachabilityChangeDatesByUUID;
  self->_transportReachabilityChangeDatesByUUID = v6;

  objc_msgSend(v10, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke;
  v11[3] = &unk_24E77AC40;
  v11[4] = self;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

}

- (void)_submit
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (self->_enabled)
  {
    -[HMDAccessoryReachabilityChangedLogEventManager home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__HMDAccessoryReachabilityChangedLogEventManager__submit__block_invoke;
    v5[3] = &unk_24E787690;
    v5[4] = self;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);

  }
}

- (void)_enable
{
  if (!self->_enabled)
  {
    -[HMDAccessoryReachabilityChangedLogEventManager _reset](self, "_reset");
    self->_enabled = 1;
  }
}

- (void)_disable
{
  if (self->_enabled)
  {
    -[HMDAccessoryReachabilityChangedLogEventManager _submit](self, "_submit");
    self->_enabled = 0;
  }
}

- (void)handlePrimaryResidentUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryReachabilityChangedLogEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__HMDAccessoryReachabilityChangedLogEventManager_handlePrimaryResidentUpdatedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)runDailyTask
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryReachabilityChangedLogEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__HMDAccessoryReachabilityChangedLogEventManager_runDailyTask__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessoryReachabilityChangedLogEventManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_transportReachabilityChangeDatesByUUID, 0);
}

uint64_t __62__HMDAccessoryReachabilityChangedLogEventManager_runDailyTask__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@action=submit reason=periodic", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_submit");
}

uint64_t __91__HMDAccessoryReachabilityChangedLogEventManager_handlePrimaryResidentUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDeviceConfirmedPrimaryResident");

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@action=enable reason=primary", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    return objc_msgSend(*(id *)(a1 + 32), "_enable");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@action=disable reason=not_primary", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    return objc_msgSend(*(id *)(a1 + 32), "_disable");
  }
}

uint64_t __57__HMDAccessoryReachabilityChangedLogEventManager__submit__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitForAccessory:", a2);
}

void __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  objc_msgSend(v3, "transportReports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke_2;
  v10[3] = &unk_24E77AC18;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

}

void __56__HMDAccessoryReachabilityChangedLogEventManager__reset__block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)a1[5];
  v2 = a1[6];
  v4 = *(void **)(a1[4] + 8);
  v5 = a2;
  objc_msgSend(v3, "uuid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v2, v7);
}

uint64_t __70__HMDAccessoryReachabilityChangedLogEventManager__submitForAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitDailyUpdateForAccessory:withTransportReport:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __99__HMDAccessoryReachabilityChangedLogEventManager_submitForAccessory_withTransportReport_reachable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitForAccessory:withTransportReport:reachable:changed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_38439 != -1)
    dispatch_once(&logCategory__hmf_once_t3_38439, &__block_literal_global_38440);
  return (id)logCategory__hmf_once_v4_38441;
}

void __61__HMDAccessoryReachabilityChangedLogEventManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_38441;
  logCategory__hmf_once_v4_38441 = v0;

}

@end
