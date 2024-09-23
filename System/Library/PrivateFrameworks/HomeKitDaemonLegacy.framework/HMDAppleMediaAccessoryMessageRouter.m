@implementation HMDAppleMediaAccessoryMessageRouter

- (HMDAppleMediaAccessoryMessageRouter)initWithIdentifier:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessoryMessageRouter *v10;
  HMDAppleMediaAccessoryMessageRouter *v11;
  HMDAppleMediaAccessoryMessageRouter *result;
  HMDAppleMediaAccessoryMessageRouter *v13;
  SEL v14;
  id v15;
  id v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDAppleMediaAccessoryMessageRouter *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessoryMessageRouter routeMessage:localHandler:](v13, v14, v15, v16);
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDAppleMediaAccessoryMessageRouter;
  v10 = -[HMDAppleMediaAccessoryMessageRouter init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
  -[HMDAppleMediaAccessoryMessageRouter routeMessage:allowRemoteRelayFromPrimary:localHandler:](self, "routeMessage:allowRemoteRelayFromPrimary:localHandler:", a3, 0, a4);
}

- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, id);
  void *v10;
  HMDAppleMediaAccessoryMessageRouter *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessoryMessageRouter *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v13;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAppleMediaAccessoryMessageRouter dataSourceDeviceForMessage:](v11, "dataSourceDeviceForMessage:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if (objc_msgSend(v14, "isCurrentDevice"))
      v9[2](v9, v8);
    else
      -[HMDAppleMediaAccessoryMessageRouter relayMessage:device:allowRemoteRelayFromPrimary:](v11, "relayMessage:device:allowRemoteRelayFromPrimary:", v8, v15, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v11;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v20;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source device while routing message error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v8, "respondWithError:", v16);

  }
}

- (void)relayMessage:(id)a3 device:(id)a4 allowRemoteRelayFromPrimary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessoryMessageRouter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoteDeviceMessageDestination *v18;
  void *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  void *v22;
  HMDAppleMediaAccessoryMessageRouter *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAppleMediaAccessoryMessageRouter *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDAppleMediaAccessoryMessageRouter dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isRemote"))
  {
LABEL_7:
    v16 = (void *)objc_msgSend(v8, "copy");
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setRemote:", 1);
    objc_msgSend(v17, "setSecureRemote:", 1);
    objc_msgSend(v17, "setRemoteRestriction:", -1);
    v18 = [HMDRemoteDeviceMessageDestination alloc];
    objc_msgSend(v8, "destination");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "target");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v18, "initWithTarget:device:", v20, v9);
    objc_msgSend(v17, "setDestination:", v21);

    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v25;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Relaying remote message: %@", (uint8_t *)&v31, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDAppleMediaAccessoryMessageRouter messageDispatcher](v23, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:", v17);

    goto LABEL_13;
  }
  if (v5 && objc_msgSend(v10, "isCurrentDevicePrimaryResident"))
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Allowing relay for message: %@", (uint8_t *)&v31, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    goto LABEL_7;
  }
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v30;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to relay message due to being a remote message: %@", (uint8_t *)&v31, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "respondWithError:", v17);
LABEL_13:

}

- (id)dataSourceDeviceForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessoryMessageRouter *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleMediaAccessoryMessageRouter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "deviceForAppleMediaAccessoryMessageRouter:message:", self, v4);
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
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source device due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoryMessageRouter identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAppleMediaAccessoryMessageRouterDataSource)dataSource
{
  return (HMDAppleMediaAccessoryMessageRouterDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_99933 != -1)
    dispatch_once(&logCategory__hmf_once_t6_99933, &__block_literal_global_99934);
  return (id)logCategory__hmf_once_v7_99935;
}

void __50__HMDAppleMediaAccessoryMessageRouter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_99935;
  logCategory__hmf_once_v7_99935 = v0;

}

@end
