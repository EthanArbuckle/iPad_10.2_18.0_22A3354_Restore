@implementation HMDSoftwareUpdateEventListener

- (HMDSoftwareUpdateEventListener)initWithContext:(id)a3
{
  id v5;
  HMDSoftwareUpdateEventListener *v6;
  HMDSoftwareUpdateEventListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSoftwareUpdateEventListener;
  v6 = -[HMDSoftwareUpdateEventListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)registerForEvents
{
  void *v3;
  HMDSoftwareUpdateEventListener *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSoftwareUpdateEventListener *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering for events", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSoftwareUpdateEventListener context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topicForSoftwareUpdateDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDSoftwareUpdateEventListener context](v4, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51__HMDSoftwareUpdateEventListener_registerForEvents__block_invoke;
    v15[3] = &unk_24E79A980;
    v15[4] = v4;
    objc_msgSend(v9, "registerConsumer:topicFilters:completion:", v4, v10, v15);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Not registering for events because failed to get software update topic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (BOOL)isSoftwareUpdateDownloadedAndReadyForInstallation
{
  void *v2;
  uint64_t v3;

  -[HMDSoftwareUpdateEventListener context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "softwareUpdateStatusForLastEvent");

  return v3 == 8 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (BOOL)isSoftwareUpdateAvailable
{
  void *v2;
  uint64_t v3;

  -[HMDSoftwareUpdateEventListener context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "softwareUpdateStatusForLastEvent");

  return v3 > 2;
}

- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptorForLastEvent
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdateEventListener context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateDescriptorForLastEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSoftwareUpdateDescriptor *)v3;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSoftwareUpdateEventListener *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Did receive event: %@, for topic: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDSoftwareUpdateEventListener context](v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateAppBadgeAndBulletinNotification");

  if (-[HMDSoftwareUpdateEventListener isSoftwareUpdateAvailable](v9, "isSoftwareUpdateAvailable"))
  {
    -[HMDSoftwareUpdateEventListener context](v9, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdateEventListener context](v9, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "softwareUpdateDescriptorForLastEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleSoftwareUpdateDidBecomeAvailableWithDescriptor:", v15);

  }
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateEventListener *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v14;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive cached event: %@, for topic: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDSoftwareUpdateEventListener context](v12, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateAppBadgeAndBulletinNotification");

  if (-[HMDSoftwareUpdateEventListener isSoftwareUpdateAvailable](v12, "isSoftwareUpdateAvailable"))
  {
    -[HMDSoftwareUpdateEventListener context](v12, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdateEventListener context](v12, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "softwareUpdateDescriptorForLastEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleSoftwareUpdateDidBecomeAvailableWithDescriptor:", v18);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdateEventListener context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDSoftwareUpdateEventListenerContext)context
{
  return (HMDSoftwareUpdateEventListenerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __51__HMDSoftwareUpdateEventListener_registerForEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error: %@, "), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24E79DB48;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribed with %@cachedEvents: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateAppBadgeAndBulletinNotification");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_62319 != -1)
    dispatch_once(&logCategory__hmf_once_t5_62319, &__block_literal_global_62320);
  return (id)logCategory__hmf_once_v6_62321;
}

void __45__HMDSoftwareUpdateEventListener_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_62321;
  logCategory__hmf_once_v6_62321 = v0;

}

@end
