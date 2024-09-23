@implementation HMDSoftwareUpdateEventListenerContext

- (HMDSoftwareUpdateEventListenerContext)initWithAccessory:(id)a3 subscriptionProvider:(id)a4 eventStoreReadHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDSoftwareUpdateEventListenerContext *v11;
  HMDSoftwareUpdateEventListenerContext *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDSoftwareUpdateEventListenerContext;
  v11 = -[HMDSoftwareUpdateEventListenerContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeStrong((id *)&v12->_subscriptionProvider, a4);
    objc_storeStrong((id *)&v12->_eventStoreReadHandle, a5);
  }

  return v12;
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDSoftwareUpdateEventListenerContext subscriptionProvider](self, "subscriptionProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerConsumer:topicFilters:completion:", v10, v9, v8);

}

- (void)updateAppBadgeAndBulletinNotification
{
  void *v3;
  HMDSoftwareUpdateEventListenerContext *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDSoftwareUpdateEventListenerContext *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating app badge and bulletin", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSoftwareUpdateEventListenerContext accessory](v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "reevaluateAccessoryInfo");
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot update app badge and bulletin because home is nil", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (NSString)topicForSoftwareUpdateDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateEventListenerContext *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDSoftwareUpdateEventListenerContext *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDSoftwareUpdateEventListenerContext accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    v7 = (void *)*MEMORY[0x24BDD4BD0];
    objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4BD0], v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138544130;
        v21 = v18;
        v22 = 2048;
        v23 = v7;
        v24 = 2112;
        v25 = v6;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with suffix: %ld, homeUUID: %@, accessoryUUID: %@", (uint8_t *)&v20, 0x2Au);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v14;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic with homeUUID: %@, accessoryUUID: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v9 = 0;
  }

  return (NSString *)v9;
}

- (int64_t)softwareUpdateStatusForLastEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  HMDSoftwareUpdateEventListenerContext *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDSoftwareUpdateEventListenerContext *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDSoftwareUpdateEventListenerContext topicForSoftwareUpdateDescriptor](self, "topicForSoftwareUpdateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDSoftwareUpdateEventListenerContext eventStoreReadHandle](self, "eventStoreReadHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastEventForTopic:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD79E0], "descriptorFromEvent:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_msgSend(v6, "status");
      }
      else
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v16;
          v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from event: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        v8 = 0;
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v12;
        v20 = 2112;
        v21 = v3;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve last event for topic: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptorForLastEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDSoftwareUpdateEventListenerContext *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDSoftwareUpdateEventListenerContext *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDSoftwareUpdateEventListenerContext topicForSoftwareUpdateDescriptor](self, "topicForSoftwareUpdateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDSoftwareUpdateEventListenerContext eventStoreReadHandle](self, "eventStoreReadHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastEventForTopic:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD79E0], "descriptorFromEvent:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v16;
          v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from event: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v12;
        v20 = 2112;
        v21 = v3;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve last event for topic: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (HMSoftwareUpdateDescriptor *)v7;
}

- (void)handleSoftwareUpdateDidBecomeAvailableWithDescriptor:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[HMDSoftwareUpdateEventListenerContext accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "handleSoftwareUpdateDidBecomeAvailableWithDescriptor:", v7);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDSoftwareUpdateEventListenerContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 16, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_124448 != -1)
    dispatch_once(&logCategory__hmf_once_t9_124448, &__block_literal_global_124449);
  return (id)logCategory__hmf_once_v10_124450;
}

void __52__HMDSoftwareUpdateEventListenerContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_124450;
  logCategory__hmf_once_v10_124450 = v0;

}

@end
