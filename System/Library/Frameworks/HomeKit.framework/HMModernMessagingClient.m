@implementation HMModernMessagingClient

- (HMModernMessagingClient)initWithHome:(id)a3 idsTopic:(id)a4
{
  id v6;
  id v7;
  HMModernMessagingClient *v8;
  HMModernMessagingClient *v9;
  uint64_t v10;
  NSString *idsTopic;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMModernMessagingClient;
  v8 = -[HMModernMessagingClient init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    v10 = objc_msgSend(v7, "copy");
    idsTopic = v9->_idsTopic;
    v9->_idsTopic = (NSString *)v10;

  }
  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMModernMessagingClient home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("HomeUUID"), v5);
  v12[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMModernMessagingClient idsTopic](self, "idsTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("IDSTopic"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)registerModernMessagingRequestHandlerWithMessageName:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  HMModernMessagingClient *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMModernMessagingClient *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v17;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Registering hmmm request handler with message name: %@, options: %@", (uint8_t *)&v25, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMModernMessagingClient home](v15, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "registerModernMessagingRequestHandlerWithMessageName:options:requestHandler:completionHandler:", v10, v11, v12, v13);
  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Error while registering hmmm request handler: home is null", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v24);

    }
  }

}

- (void)unregisterModernMessagingRequestHandlerWithMessageName:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMModernMessagingClient *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMModernMessagingClient *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Unregistering hmmm request handler with message name: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMModernMessagingClient home](v9, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "unregisterModernMessagingRequestHandlerWithMessageName:completionHandler:", v6, v7);
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v9;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error while unregistering hmmm request handler: home is null", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v18);

    }
  }

}

- (void)sendModernMessagingRequestWithMessageName:(id)a3 destination:(id)a4 requestPayload:(id)a5 options:(id)a6 responseHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  void *v20;
  HMModernMessagingClient *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMModernMessagingClient *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *))a8;
  v20 = (void *)MEMORY[0x1A1AC1AAC]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v35 = v23;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v24;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Sending hmmm message with message name: %@, destination: %@, options: %@, oneway: %@", buf, 0x34u);

    v16 = v32;
  }

  objc_autoreleasePoolPop(v20);
  -[HMModernMessagingClient home](v21, "home");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "sendModernMessagingRequestWithMessageName:destination:requestPayload:options:responseHandler:completionHandler:", v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v33 = v16;
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = v21;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v30;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error while sending hmmm request handler: home is null", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v16 = v33;
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, v31);

    }
  }

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMModernMessagingClient home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMModernMessagingClient idsTopic](self, "idsTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSString)idsTopic
{
  return self->_idsTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTopic, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_37440 != -1)
    dispatch_once(&logCategory__hmf_once_t6_37440, &__block_literal_global_37441);
  return (id)logCategory__hmf_once_v7_37442;
}

void __38__HMModernMessagingClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_37442;
  logCategory__hmf_once_v7_37442 = v0;

}

@end
