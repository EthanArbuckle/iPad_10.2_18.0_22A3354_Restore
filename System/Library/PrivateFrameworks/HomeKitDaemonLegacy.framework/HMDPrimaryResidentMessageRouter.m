@implementation HMDPrimaryResidentMessageRouter

- (HMDPrimaryResidentMessageRouter)initWithHomeUUID:(id)a3 messageDispatcher:(id)a4 metricsDispatcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDPrimaryResidentMessageRouter *v13;
  HMDPrimaryResidentMessageRouter *v14;
  HMDPrimaryResidentMessageRouter *v16;
  SEL v17;
  id v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v16 = (HMDPrimaryResidentMessageRouter *)_HMFPreconditionFailure();
    return (HMDPrimaryResidentMessageRouter *)-[HMDPrimaryResidentMessageRouter dataSourcePrimaryResidentDeviceWithMessage:](v16, v17, v18);
  }
  v12 = v11;
  v19.receiver = self;
  v19.super_class = (Class)HMDPrimaryResidentMessageRouter;
  v13 = -[HMDPrimaryResidentMessageRouter init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeUUID, a3);
    objc_storeStrong((id *)&v14->_messageDispatcher, a4);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

- (id)dataSourcePrimaryResidentDeviceWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDPrimaryResidentMessageRouter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPrimaryResidentMessageRouter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "primaryResidentDeviceForPrimaryResidentMessageRouter:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source primary resident device due to no data source", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDPrimaryResidentMessageRouter metricsDispatcher](v9, "metricsDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitFailureEventWithMessageName:failureType:", v13, 2);

    v7 = 0;
  }

  return v7;
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
  -[HMDPrimaryResidentMessageRouter routeMessage:allowRemoteRelayFromPrimary:localHandler:](self, "routeMessage:allowRemoteRelayFromPrimary:localHandler:", a3, 0, a4);
}

- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  HMDPrimaryResidentMessageRouter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDPrimaryResidentMessageRouter *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMDPrimaryResidentMessageRouter *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDPrimaryResidentMessageRouter *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id))a5;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@", (uint8_t *)&v38, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDPrimaryResidentMessageRouter dataSourcePrimaryResidentDeviceWithMessage:](v10, "dataSourcePrimaryResidentDeviceWithMessage:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2032);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v10;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v21;
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source primary resident with error: %@", (uint8_t *)&v38, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v7, "respondWithError:", v17);
    -[HMDPrimaryResidentMessageRouter metricsDispatcher](v19, "metricsDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v25 = v23;
    v26 = 3;
    goto LABEL_14;
  }
  if ((objc_msgSend(v14, "isConfirmed") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2033);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v10;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v30;
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get confirmed primary resident device with error: %@", (uint8_t *)&v38, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(v7, "respondWithError:", v17);
    -[HMDPrimaryResidentMessageRouter metricsDispatcher](v28, "metricsDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v25 = v23;
    v26 = 4;
LABEL_14:
    objc_msgSend(v24, "submitFailureEventWithMessageName:failureType:", v25, v26);

    goto LABEL_15;
  }
  objc_msgSend(v15, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = v16;
    if (objc_msgSend(v16, "isCurrentDevice"))
      v8[2](v8, v7);
    else
      -[HMDPrimaryResidentMessageRouter relayMessage:device:](v10, "relayMessage:device:", v7, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2034);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = v10;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v35;
      v40 = 2112;
      v41 = v31;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination device from primary resident device with error: %@", (uint8_t *)&v38, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v7, "respondWithError:", v31);
    -[HMDPrimaryResidentMessageRouter metricsDispatcher](v33, "metricsDispatcher");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "submitFailureEventWithMessageName:failureType:", v37, 5);

    v17 = 0;
  }
LABEL_15:

}

- (void)relayMessage:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPrimaryResidentMessageRouter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRemoteDeviceMessageDestination *v16;
  void *v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;
  void *v20;
  HMDPrimaryResidentMessageRouter *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isRemote"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v11;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay message that is already remote: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3202);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v12);

    -[HMDPrimaryResidentMessageRouter metricsDispatcher](v9, "metricsDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitFailureEventWithMessageName:failureType:", v14, 1);
  }
  else
  {
    v15 = (void *)objc_msgSend(v6, "copy");
    v13 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v13, "setRemote:", 1);
    objc_msgSend(v13, "setSecureRemote:", 1);
    v16 = [HMDRemoteDeviceMessageDestination alloc];
    objc_msgSend(v6, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "target");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v16, "initWithTarget:device:", v18, v7);
    objc_msgSend(v13, "setDestination:", v19);

    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v23;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Relaying remote message: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDPrimaryResidentMessageRouter messageDispatcher](v21, "messageDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendMessage:", v13);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPrimaryResidentMessageRouter homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDPrimaryResidentMessageRouterDataSource)dataSource
{
  return (HMDPrimaryResidentMessageRouterDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMDPrimaryResidentMessageRouterMetricsDispatcher)metricsDispatcher
{
  return (HMDPrimaryResidentMessageRouterMetricsDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_11696 != -1)
    dispatch_once(&logCategory__hmf_once_t7_11696, &__block_literal_global_11697);
  return (id)logCategory__hmf_once_v8_11698;
}

void __46__HMDPrimaryResidentMessageRouter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_11698;
  logCategory__hmf_once_v8_11698 = v0;

}

@end
