@implementation __HMDHomeAdministratorDynamicRelay

- (void)registerForMessage:(id)a3 policies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)__HMDHomeAdministratorDynamicRelay;
  -[__HMDHomeAdministratorReceiver registerForMessage:policies:](&v16, sel_registerForMessage_policies_, v6, v7);
  -[__HMDHomeAdministratorReceiver handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isOwnerUser"))
    goto LABEL_4;
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isResidentCapable");

  if (v11)
  {
    objc_msgSend(v7, "hmf_objectsPassingTest:", &__block_literal_global_146_225287);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v12, "mutableCopy");

    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRoles:", 8);
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v9, "addObject:", v14);

    objc_msgSend(v8, "dispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerForMessage:receiver:policies:selector:", v6, self, v9, sel___handleRemoteMessage_);

LABEL_4:
  }

}

- (void)__handleXPCMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __HMDHomeAdministratorDynamicRelay *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __HMDHomeAdministratorDynamicRelay *v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[__HMDHomeAdministratorReceiver receiver](self, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[__HMDHomeAdministratorReceiver handler](self, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "shouldRelayMessage:", v4) & 1) != 0)
    {
      v7 = v4;
      if (objc_msgSend(v6, "allowLocalFallbackForMessage:", v7))
      {
        v8 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIdentifier:", v9);

        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __57____HMDHomeAdministratorDynamicRelay___handleXPCMessage___block_invoke;
        v18[3] = &unk_24E795C28;
        v19 = v6;
        v20 = self;
        v21 = v7;
        objc_msgSend(v8, "setResponseHandler:", v18);
        v7 = (id)objc_msgSend(v8, "copy");

      }
      v17 = 0;
      objc_msgSend(v6, "operationForMessage:error:", v7, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      if (v10)
      {
        objc_msgSend(v10, "setShouldSuspendSyncing:", 1);
        objc_msgSend(v6, "addOperation:", v10);
      }
      else
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v15;
          v25 = 2112;
          v26 = v11;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create operation with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
        if (v11)
        {
          objc_msgSend(v7, "respondWithError:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "respondWithError:", v16);

        }
      }

    }
    else
    {
      v22.receiver = self;
      v22.super_class = (Class)__HMDHomeAdministratorDynamicRelay;
      -[__HMDHomeAdministratorReceiver __handleXPCMessage:](&v22, sel___handleXPCMessage_, v4);
    }

  }
}

- (void)__handleRemoteMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __HMDHomeAdministratorDynamicRelay *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[__HMDHomeAdministratorReceiver receiver](self, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Locally dispatching remote configuration message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[__HMDHomeAdministratorReceiver handler](v7, "handler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "residentSyncManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __60____HMDHomeAdministratorDynamicRelay___handleRemoteMessage___block_invoke;
      v14[3] = &unk_24E79BF48;
      v15 = v11;
      objc_msgSend(v13, "interceptRemoteResidentRequest:proceed:", v4, v14);

    }
    else
    {
      objc_msgSend(v11, "dispatchMessage:", v4);
    }

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_225325 != -1)
    dispatch_once(&logCategory__hmf_once_t12_225325, &__block_literal_global_153_225326);
  return (id)logCategory__hmf_once_v13_225327;
}

@end
