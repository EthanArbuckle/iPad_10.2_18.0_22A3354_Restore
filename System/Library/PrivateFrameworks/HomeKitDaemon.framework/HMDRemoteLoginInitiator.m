@implementation HMDRemoteLoginInitiator

- (HMDRemoteLoginInitiator)initWithUUID:(id)a3 accessory:(id)a4 remoteLoginHandler:(id)a5
{
  id v8;
  HMDRemoteLoginInitiator *v9;
  HMDRemoteLoginAnisetteDataProviderBridge *v10;
  HMDRemoteLoginAnisetteDataProviderBridge *anisetteProviderBridge;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDRemoteLoginInitiator;
  v9 = -[HMDRemoteLoginBase initWithUUID:accessory:remoteLoginHandler:](&v13, sel_initWithUUID_accessory_remoteLoginHandler_, v8, a4, a5);
  if (v9)
  {
    v10 = -[HMDRemoteLoginAnisetteDataProviderBridge initWithUUID:]([HMDRemoteLoginAnisetteDataProviderBridge alloc], "initWithUUID:", v8);
    anisetteProviderBridge = v9->_anisetteProviderBridge;
    v9->_anisetteProviderBridge = v10;

  }
  return v9;
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDRemoteLoginMessageSender *v12;
  void *v13;
  void *v14;
  HMDRemoteLoginMessageSender *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDRemoteLoginInitiator;
  v6 = a4;
  v7 = a3;
  -[HMDRemoteLoginBase configureWithWorkQueue:messageDispatcher:](&v18, sel_configureWithWorkQueue_messageDispatcher_, v7, v6);
  -[HMDRemoteLoginBase accessory](self, "accessory", v18.receiver, v18.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HMDRemoteLoginMessageSender alloc];
  -[HMDRemoteLoginBase uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDRemoteLoginMessageSender initWithTarget:accessory:device:workQueue:messageDispatcher:](v12, "initWithTarget:accessory:device:workQueue:messageDispatcher:", v13, v8, 0, v14, v11);
  -[HMDRemoteLoginInitiator setRemoteMessageSender:](self, "setRemoteMessageSender:", v15);

  -[HMDRemoteLoginInitiator anisetteProviderBridge](self, "anisetteProviderBridge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginInitiator remoteMessageSender](self, "remoteMessageSender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configureWithWorkQueue:messageDispatcher:remoteMessageSender:", v7, v6, v17);

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginBase accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoteLoginCompanionAuthentication"), self, v8, sel__handleRemoteLoginCompanionAuthentication_);

  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoteLoginQueryProxiedDevice"), self, v10, sel__handleRemoteLoginProxiedDevice_);

  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoteLoginProxyAuthentication"), self, v12, sel__handleRemoteLoginProxyAuthentication_);

  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoteLoginSignout"), self, v14, sel__handleRemoteLoginSignout_);

  -[HMDRemoteLoginInitiator anisetteProviderBridge](self, "anisetteProviderBridge");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerForMessages");

}

- (void)_handleRemoteLoginCompanionAuthentication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDRemoteLoginInitiator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kRemoteLoginSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:", CFSTR("kRemoteLoginAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive account from account data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  -[HMDRemoteLoginBase accessory](self, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__HMDRemoteLoginInitiator__handleRemoteLoginCompanionAuthentication___block_invoke;
  v16[3] = &unk_24E77B490;
  v17 = v4;
  v15 = v4;
  -[HMDRemoteLoginInitiator _companionLoginWithSessionID:account:remoteDevice:completion:](self, "_companionLoginWithSessionID:account:remoteDevice:completion:", v5, v7, v14, v16);

}

- (void)_companionLoginWithSessionID:(id)a3 account:(id)a4 remoteDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDRemoteLoginInitiatorCompanionAuthentication *v14;
  void *v15;
  void *v16;
  HMDRemoteLoginInitiatorCompanionAuthentication *v17;
  HMDRemoteLoginInitiatorAuthenticationSession *v18;
  void *v19;
  HMDRemoteLoginInitiator *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [HMDRemoteLoginInitiatorCompanionAuthentication alloc];
  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginInitiator remoteMessageSender](self, "remoteMessageSender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDRemoteLoginInitiatorCompanionAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:account:](v14, "initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:account:", v10, v12, v15, v16, self, v11);

  v18 = -[HMDRemoteLoginInitiatorAuthenticationSession initWithSessionID:remoteAuthentication:completion:]([HMDRemoteLoginInitiatorAuthenticationSession alloc], "initWithSessionID:remoteAuthentication:completion:", v10, v17, v13);
  v19 = (void *)MEMORY[0x227676638](-[HMDRemoteLoginInitiator setLoginSession:](self, "setLoginSession:", v18));
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v22;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Created the companion login with Session ID: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDRemoteLoginInitiatorAuthenticationSession remoteAuthentication](v18, "remoteAuthentication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "authenticate");

}

- (void)_handleRemoteLoginProxiedDevice:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginInitiatorSession *v6;
  HMDRemoteLoginProxyDeviceRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kRemoteLoginSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDRemoteLoginInitiatorSession initWithSessionID:]([HMDRemoteLoginInitiatorSession alloc], "initWithSessionID:", v5);
  -[HMDRemoteLoginInitiator setLoginSession:](self, "setLoginSession:", v6);
  v7 = -[HMRemoteLoginMessage initWithSessionID:]([HMDRemoteLoginProxyDeviceRequest alloc], "initWithSessionID:", v5);
  -[HMDRemoteLoginProxyDeviceRequest messageName](v7, "messageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  encodeRootObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginInitiator remoteMessageSender](self, "remoteMessageSender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyDeviceRequest messageName](v7, "messageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__HMDRemoteLoginInitiator__handleRemoteLoginProxiedDevice___block_invoke;
  v14[3] = &unk_24E798D90;
  objc_copyWeak(&v16, &location);
  v13 = v4;
  v15 = v13;
  objc_msgSend(v11, "sendRemoteMessageWithName:payload:responseHandler:", v12, v10, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_handleProxyDeviceResponse:(id)a3 error:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDRemoteLoginInitiator *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDRemoteLoginInitiator *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDRemoteLoginInitiator *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDRemoteLoginInitiator *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    +[HMDRemoteLoginProxyDeviceResponse objWithDict:](HMDRemoteLoginProxyDeviceResponse, "objWithDict:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(v18, "proxyDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v29)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v34;
            v43 = 2112;
            v44 = v29;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Received proxy device response with device: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          v39 = CFSTR("kRemoteLoginProxiedDevice");
          encodeRootObject();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v35;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = 0;
        }
        else
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v42 = v36;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with no device", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v30);
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = 0;
        }

        goto LABEL_22;
      }
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v23;
        v43 = 2112;
        v44 = 0;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with response error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v18, "error");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with invalid payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (id)v24;
    v16 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v14;
    v43 = 2112;
    v44 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received proxy device response with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = v9;
  v16 = 0;
LABEL_23:
  objc_msgSend(v10, "responseHandler", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v10, "responseHandler");
    v38 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v38)[2](v38, v15, v16);

  }
  -[HMDRemoteLoginInitiator _resetCurrentSession:](self, "_resetCurrentSession:", v15);

}

- (void)_handleRemoteLoginProxyAuthentication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDRemoteLoginInitiator *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kRemoteLoginSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:", CFSTR("kRemoteLoginAuthResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1620];
  v8 = (void *)MEMORY[0x24BDBCF20];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;

  if (!v11)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive authentication results from results data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  v17 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  -[HMDRemoteLoginBase accessory](self, "accessory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __65__HMDRemoteLoginInitiator__handleRemoteLoginProxyAuthentication___block_invoke;
  v23[3] = &unk_24E77B490;
  v24 = v4;
  v22 = v4;
  -[HMDRemoteLoginInitiator _proxyLoginWithSessionID:authResults:remoteDevice:completion:](self, "_proxyLoginWithSessionID:authResults:remoteDevice:completion:", v5, v19, v21, v23);

}

- (void)_proxyLoginWithSessionID:(id)a3 authResults:(id)a4 remoteDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDRemoteLoginInitiatorProxyAuthentication *v14;
  void *v15;
  void *v16;
  HMDRemoteLoginInitiatorProxyAuthentication *v17;
  HMDRemoteLoginInitiatorAuthenticationSession *v18;
  void *v19;
  HMDRemoteLoginInitiator *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [HMDRemoteLoginInitiatorProxyAuthentication alloc];
  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginInitiator remoteMessageSender](self, "remoteMessageSender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDRemoteLoginInitiatorProxyAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:authResults:](v14, "initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:authResults:", v10, v12, v15, v16, self, v11);

  v18 = -[HMDRemoteLoginInitiatorAuthenticationSession initWithSessionID:remoteAuthentication:completion:]([HMDRemoteLoginInitiatorAuthenticationSession alloc], "initWithSessionID:remoteAuthentication:completion:", v10, v17, v13);
  v19 = (void *)MEMORY[0x227676638](-[HMDRemoteLoginInitiator setLoginSession:](self, "setLoginSession:", v18));
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v22;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Created the proxy login with Session ID: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDRemoteLoginInitiatorAuthenticationSession remoteAuthentication](v18, "remoteAuthentication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "authenticate");

}

- (void)_handleRemoteLoginSignout:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginInitiatorSignoutSession *v6;
  HMDRemoteLoginSignoutRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kRemoteLoginSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDRemoteLoginInitiatorSession initWithSessionID:]([HMDRemoteLoginInitiatorSignoutSession alloc], "initWithSessionID:", v5);
  -[HMDRemoteLoginInitiator setLoginSession:](self, "setLoginSession:", v6);
  v7 = -[HMRemoteLoginMessage initWithSessionID:]([HMDRemoteLoginSignoutRequest alloc], "initWithSessionID:", v5);
  -[HMDRemoteLoginSignoutRequest messageName](v7, "messageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  encodeRootObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginInitiator remoteMessageSender](self, "remoteMessageSender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginSignoutRequest messageName](v7, "messageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__HMDRemoteLoginInitiator__handleRemoteLoginSignout___block_invoke;
  v14[3] = &unk_24E798D90;
  objc_copyWeak(&v16, &location);
  v13 = v4;
  v15 = v13;
  objc_msgSend(v11, "sendRemoteMessageWithName:payload:responseHandler:", v12, v10, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_handleSignoutResponse:(id)a3 error:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDRemoteLoginInitiator *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
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
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received proxy device response %@ and error %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (v9)
  {
    v15 = v9;
  }
  else
  {
    -[HMDRemoteLoginBase remoteLoginHandler](v12, "remoteLoginHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_updateLoggedInAccount:", 0);

  }
  objc_msgSend(v10, "responseHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v10, "responseHandler");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v18)[2](v18, v9, 0);

  }
  -[HMDRemoteLoginInitiator _resetCurrentSession:](v12, "_resetCurrentSession:", v9);

}

- (void)_callCompletion:(id)a3 loggedInAccount:(id)a4 authSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDRemoteLoginInitiator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  HMDRemoteLoginInitiator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
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
    -[HMDRemoteLoginInitiator loginSession](v12, "loginSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Login session %@ has ended with error %@", (uint8_t *)&v25, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v10, "completion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "completion");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v17)[2](v17, v8, v9);

  }
  if (v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v12;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginBase remoteLoginHandler](v19, "remoteLoginHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "loggedInAccount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating the logged in account from %@ to %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDRemoteLoginBase remoteLoginHandler](v19, "remoteLoginHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_updateLoggedInAccount:", v9);

  }
  -[HMDRemoteLoginInitiator _resetCurrentSession:](v12, "_resetCurrentSession:", v8);

}

- (void)_resetCurrentSession:(id)a3
{
  -[HMDRemoteLoginInitiator setLoginSession:](self, "setLoginSession:", 0);
}

- (id)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (objc_msgSend((id)-[HMDRemoteLoginInitiator superclass](self, "superclass"), "instancesRespondToSelector:", sel_messageReceiverChildren))
  {
    v9.receiver = self;
    v9.super_class = (Class)HMDRemoteLoginInitiator;
    -[HMDRemoteLoginInitiator messageReceiverChildren](&v9, sel_messageReceiverChildren);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDRemoteLoginInitiator anisetteProviderBridge](self, "anisetteProviderBridge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDRemoteLoginInitiator anisetteProviderBridge](self, "anisetteProviderBridge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (void)didCompleteAuthentication:(id)a3 error:(id)a4 loggedInAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__HMDRemoteLoginInitiator_didCompleteAuthentication_error_loggedInAccount___block_invoke;
  v15[3] = &unk_24E79A910;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (HMDRemoteLoginInitiatorSession)loginSession
{
  return self->_loginSession;
}

- (void)setLoginSession:(id)a3
{
  objc_storeStrong((id *)&self->_loginSession, a3);
}

- (HMDRemoteLoginAnisetteDataProviderBridge)anisetteProviderBridge
{
  return self->_anisetteProviderBridge;
}

- (void)setAnisetteProviderBridge:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteProviderBridge, a3);
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (void)setRemoteMessageSender:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMessageSender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_anisetteProviderBridge, 0);
  objc_storeStrong((id *)&self->_loginSession, 0);
}

void __75__HMDRemoteLoginInitiator_didCompleteAuthentication_error_loggedInAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "loginSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "remoteAuthentication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5 == v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ has completed with error %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "_callCompletion:loggedInAccount:authSession:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received completion from unknown remote authentication with error %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __53__HMDRemoteLoginInitiator__handleRemoteLoginSignout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleSignoutResponse:error:message:", v6, v7, *(_QWORD *)(a1 + 32));

}

void __65__HMDRemoteLoginInitiator__handleRemoteLoginProxyAuthentication___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messagePayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v7)[2](v7, v9, v8);

  }
}

void __59__HMDRemoteLoginInitiator__handleRemoteLoginProxiedDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleProxyDeviceResponse:error:message:", v6, v7, *(_QWORD *)(a1 + 32));

}

void __69__HMDRemoteLoginInitiator__handleRemoteLoginCompanionAuthentication___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messagePayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v7)[2](v7, v9, v8);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_43523 != -1)
    dispatch_once(&logCategory__hmf_once_t0_43523, &__block_literal_global_43524);
  return (id)logCategory__hmf_once_v1_43525;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

void __38__HMDRemoteLoginInitiator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_43525;
  logCategory__hmf_once_v1_43525 = v0;

}

@end
