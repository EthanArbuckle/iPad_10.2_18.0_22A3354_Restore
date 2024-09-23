@implementation HMDRemoteLoginReceiver

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDRemoteLoginReceiver;
  -[HMDRemoteLoginBase configureWithWorkQueue:messageDispatcher:](&v4, sel_configureWithWorkQueue_messageDispatcher_, a3, a4);
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginBase accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteLoginCompanionAuthenticationRequest messageName](HMDRemoteLoginCompanionAuthenticationRequest, "messageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v8, self, v9, sel__handleCompanionAuthenticationRequest_);

  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteLoginProxyDeviceRequest messageName](HMDRemoteLoginProxyDeviceRequest, "messageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v21[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, self, v12, sel__handleProxyDeviceRequest_);

  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteLoginProxyAuthenticationRequest messageName](HMDRemoteLoginProxyAuthenticationRequest, "messageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  v20[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v14, self, v15, sel__handleProxyAuthenticationRequest_);

  -[HMDRemoteLoginBase msgDispatcher](self, "msgDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteLoginSignoutRequest messageName](HMDRemoteLoginSignoutRequest, "messageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerForMessage:receiver:policies:selector:", v17, self, v18, sel__handleSignoutRequest_);

  -[HMDRemoteLoginReceiver registerForNotifications](self, "registerForNotifications");
}

- (void)registerForNotifications
{
  void *v3;
  int v4;
  id v5;

  -[HMDRemoteLoginBase accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentAccessory");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleACAccountDidChangeNotification_, *MEMORY[0x24BDB41E0], 0);

  }
}

- (void)_handleCompanionAuthenticationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDRemoteLoginMessageSender *v22;
  void *v23;
  void *v24;
  HMDRemoteLoginMessageSender *v25;
  HMDRemoteLoginReceiverCompanionAuthentication *v26;
  void *v27;
  HMDRemoteLoginReceiverCompanionAuthentication *v28;
  void *v29;
  HMDRemoteLoginReceiver *v30;
  NSObject *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteLoginReceiver loginSession](self, "loginSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteLoginCompanionAuthenticationRequest objWithDict:](HMDRemoteLoginCompanionAuthenticationRequest, "objWithDict:", v14);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "remoteSourceID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDevice deviceWithDestination:](HMDDevice, "deviceWithDestination:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginBase accessory](self, "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "homeManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "messageDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = [HMDRemoteLoginMessageSender alloc];
      -[HMDRemoteLoginBase uuid](self, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginBase workQueue](self, "workQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HMDRemoteLoginMessageSender initWithTarget:accessory:device:workQueue:messageDispatcher:](v22, "initWithTarget:accessory:device:workQueue:messageDispatcher:", v23, 0, v16, v24, v21);

      v26 = [HMDRemoteLoginReceiverCompanionAuthentication alloc];
      -[HMDRemoteLoginBase workQueue](self, "workQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDRemoteLoginReceiverCompanionAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:request:](v26, "initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:request:", v17, v16, v27, v25, self, v12);

      -[HMDRemoteLoginReceiver _authenticate:message:](self, "_authenticate:message:", v28, v4);
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v32;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Companion Authentication request is missing", (uint8_t *)&v35, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(v4, "responseHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "responseHandler");
        v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v33)[2](v33, v34, 0);

        v12 = 0;
      }
    }
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginReceiver loginSession](v7, "loginSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "responseHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "responseHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v13, 0);

LABEL_12:
  }

}

- (void)_handleProxyDeviceRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  HMDRemoteLoginProxyDeviceResponse *v15;
  void *v16;
  HMDRemoteLoginProxyDeviceResponse *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  HMDRemoteLoginReceiver *v22;
  NSObject *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteLoginReceiver loginSession](self, "loginSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteLoginProxyDeviceRequest objWithDict:](HMDRemoteLoginProxyDeviceRequest, "objWithDict:", v14);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Proxy device request is missing", (uint8_t *)&v27, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v4, "responseHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "responseHandler");
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v25)[2](v25, v26, 0);

        v12 = 0;
      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLinkType:", 3);
    v15 = [HMDRemoteLoginProxyDeviceResponse alloc];
    objc_msgSend(v12, "sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMRemoteLoginMessage initWithSessionID:](v15, "initWithSessionID:", v16);

    -[HMDRemoteLoginProxyDeviceResponse setProxyDevice:](v17, "setProxyDevice:", v13);
    objc_msgSend(v4, "responseHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "responseHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginProxyDeviceResponse messagePayload](v17, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v20);

    }
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginReceiver loginSession](v7, "loginSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "responseHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "responseHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v13, 0);
    goto LABEL_10;
  }
LABEL_12:

}

- (void)_handleProxyAuthenticationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDRemoteLoginMessageSender *v22;
  void *v23;
  void *v24;
  HMDRemoteLoginMessageSender *v25;
  HMDRemoteLoginReceiverProxyAuthentication *v26;
  void *v27;
  HMDRemoteLoginReceiverProxyAuthentication *v28;
  void *v29;
  HMDRemoteLoginReceiver *v30;
  NSObject *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteLoginReceiver loginSession](self, "loginSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteLoginProxyAuthenticationRequest objWithDict:](HMDRemoteLoginProxyAuthenticationRequest, "objWithDict:", v14);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "remoteSourceID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDevice deviceWithDestination:](HMDDevice, "deviceWithDestination:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginBase accessory](self, "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "homeManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "messageDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = [HMDRemoteLoginMessageSender alloc];
      -[HMDRemoteLoginBase uuid](self, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginBase workQueue](self, "workQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HMDRemoteLoginMessageSender initWithTarget:accessory:device:workQueue:messageDispatcher:](v22, "initWithTarget:accessory:device:workQueue:messageDispatcher:", v23, 0, v16, v24, v21);

      v26 = [HMDRemoteLoginReceiverProxyAuthentication alloc];
      -[HMDRemoteLoginBase workQueue](self, "workQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDRemoteLoginReceiverProxyAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:request:](v26, "initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:request:", v17, v16, v27, v25, self, v12);

      -[HMDRemoteLoginReceiver _authenticate:message:](self, "_authenticate:message:", v28, v4);
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v32;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Proxy Authentication request is missing", (uint8_t *)&v35, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(v4, "responseHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "responseHandler");
        v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v33)[2](v33, v34, 0);

        v12 = 0;
      }
    }
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginReceiver loginSession](v7, "loginSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "responseHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "responseHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v13, 0);

LABEL_12:
  }

}

- (void)_authenticate:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  HMDRemoteLoginReceiverSession *v8;
  void *v9;
  id v10;
  HMDRemoteLoginReceiverSession *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDRemoteLoginReceiver *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = [HMDRemoteLoginReceiverSession alloc];
  objc_msgSend(v6, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__HMDRemoteLoginReceiver__authenticate_message___block_invoke;
  v19[3] = &unk_24E795DB8;
  v10 = v7;
  v20 = v10;
  v11 = -[HMDRemoteLoginReceiverSession initWithSessionID:remoteAuthentication:completion:](v8, "initWithSessionID:remoteAuthentication:completion:", v9, v6, v19);
  -[HMDRemoteLoginReceiver setLoginSession:](self, "setLoginSession:", v11);

  -[HMDRemoteLoginReceiver loginSession](self, "loginSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteAuthentication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticate");

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v17;
    v23 = 2112;
    v24 = v18;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Started authentication for session %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);

}

- (void)_handleSignoutRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDRemoteLoginReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _BOOL4 v20;
  HMDRemoteLoginReceiver *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDRemoteLoginReceiver *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDRemoteLoginReceiver *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDRemoteLoginReceiver *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  void *v48;
  void *v49;
  id v50;
  void *context;
  void *v52;
  void *v53;
  void (**v54)(_QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v56;
  void (**v57)(_QWORD, _QWORD, _QWORD);
  HMDRemoteLoginReceiver *v58;
  id v59;
  _BYTE *v60;
  id v61;
  _QWORD v62[4];
  void (**v63)(_QWORD, _QWORD, _QWORD);
  _BYTE *v64;
  uint8_t v65[4];
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteLoginReceiver loginSession](self, "loginSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteLoginSignoutRequest objWithDict:](HMDRemoteLoginSignoutRequest, "objWithDict:", v14);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Signout request is missing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(v4, "responseHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(v4, "responseHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v15, 0);
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStoreForMediaType:", 0);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4180]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine store account type for iTunesStore", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(v4, "responseHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v4, "responseHandler");
        v54 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v54)[2](v54, v36, 0);

      }
      else
      {
        v15 = 0;
      }
      goto LABEL_34;
    }
    objc_msgSend(v13, "accountsWithAccountType:", v15);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__225889;
    v73 = __Block_byref_object_dispose__225890;
    v74 = 0;
    -[HMDRemoteLoginBase remoteLoginHandler](self, "remoteLoginHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggedInAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "username");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke;
      v62[3] = &unk_24E795DE0;
      v18 = v52;
      v63 = (void (**)(_QWORD, _QWORD, _QWORD))v18;
      v64 = buf;
      v19 = objc_msgSend(v53, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);
      v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
      context = (void *)MEMORY[0x227676638](v19);
      v21 = self;
      if (v20)
      {
        HMFGetOSLogHandle();
        v44 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v65 = 138543618;
          v66 = v45;
          v67 = 2112;
          v68 = v18;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine store account from request username %@", v65, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v4, "responseHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v4, "responseHandler");
          v47 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v47)[2](v47, v48, 0);

        }
      }
      else
      {
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringForObjectValue:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v23 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringForObjectValue:", v13);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v65 = 138543874;
          v66 = v50;
          v67 = 2112;
          v68 = v23;
          v69 = 2112;
          v70 = v25;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Will signout of account %@ using store %@", v65, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        objc_initWeak((id *)v65, v21);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_47;
        block[3] = &unk_24E79BF90;
        v60 = buf;
        v56 = 0;
        v57 = v13;
        v58 = v21;
        objc_copyWeak(&v61, (id *)v65);
        v59 = v4;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)v65);
      }
      v42 = v63;
    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v65 = 138543618;
        v66 = v40;
        v67 = 2112;
        v68 = 0;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot sign out of an account with username: %@", v65, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(v4, "responseHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_32;
      objc_msgSend(v4, "responseHandler");
      v42 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v42)[2](v42, v43, 0);

    }
LABEL_32:

    _Block_object_dispose(buf, 8);
LABEL_34:

    goto LABEL_35;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginReceiver loginSession](v7, "loginSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "responseHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "responseHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, v13, 0);
LABEL_35:

    goto LABEL_36;
  }
LABEL_37:

}

- (void)auditLoggedInAccount
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDRemoteLoginReceiver_auditLoggedInAccount__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)auditLoggedInAccountFor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDRemoteLoginReceiver_auditLoggedInAccountFor___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_auditLoggedInAccountFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDRemoteLoginReceiver *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDRemoteLoginReceiver *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteLoginBase remoteLoginHandler](self, "remoteLoginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggedInAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (HMFEqualObjects())
  {
    objc_msgSend(v5, "loggedInAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if ((v12 & 1) != 0)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "loggedInAccount");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@homed knowledge of logged in iTunes account %@ matches with account store: %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      goto LABEL_10;
    }
  }
  else
  {

  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggedInAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v21;
    v25 = 2112;
    v26 = v22;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@homed knowledge of logged in iTunes account %@ is different than in account store: %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v5, "_updateLoggedInAccount:", v4);
LABEL_10:

}

- (void)_callCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Login session has ended with response %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDRemoteLoginReceiver loginSession](v6, "loginSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "completion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDRemoteLoginReceiver loginSession](v6, "loginSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completion");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v4);

  }
  -[HMDRemoteLoginReceiver setLoginSession:](v6, "setLoginSession:", 0);
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v4, "loggedInAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginReceiver _auditLoggedInAccountFor:](v6, "_auditLoggedInAccountFor:", v14);

  }
}

- (void)_handleACAccountDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRemoteLoginReceiver *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDRemoteLoginReceiver *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDB3ED0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDB40B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v26 = v4;
    v27 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginBase remoteLoginHandler](v10, "remoteLoginHandler");
    v13 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggedInAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginBase remoteLoginHandler](v10, "remoteLoginHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggedInAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v27;
    v34 = 2112;
    v35 = v15;
    v36 = 2112;
    v37 = v19;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Got account change notification type:%@ identifier:%@ current:%@ currentIdentifier:%@", buf, 0x34u);

    v9 = v18;
    v8 = v13;

    v4 = v26;
    v6 = v27;
  }

  objc_autoreleasePoolPop(v9);
  if (v6)
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB4180]))
    {
      -[HMDRemoteLoginBase remoteLoginHandler](v10, "remoteLoginHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggedInAccount");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = v10;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v29 = v25;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Performing account audit on detecting iTunes account change with active account present.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        -[HMDRemoteLoginReceiver auditLoggedInAccount](v23, "auditLoggedInAccount");
      }
    }
  }

}

- (void)didCompleteAuthentication:(id)a3 response:(id)a4
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
  -[HMDRemoteLoginBase workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__HMDRemoteLoginReceiver_didCompleteAuthentication_response___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (HMDRemoteLoginReceiverSession)loginSession
{
  return self->_loginSession;
}

- (void)setLoginSession:(id)a3
{
  objc_storeStrong((id *)&self->_loginSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginSession, 0);
}

void __61__HMDRemoteLoginReceiver_didCompleteAuthentication_response___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "loginSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteAuthentication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3 == v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ has completed with response %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "_callCompletion:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received completion from unknown remote authentication with error %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
}

uint64_t __50__HMDRemoteLoginReceiver_auditLoggedInAccountFor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_auditLoggedInAccountFor:", *(_QWORD *)(a1 + 40));
}

void __46__HMDRemoteLoginReceiver_auditLoggedInAccount__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentAccessory");

  if (v3)
  {
    +[HMDRemoteLoginUtilities primaryITunesAccount](HMDRemoteLoginUtilities, "primaryITunesAccount");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_auditLoggedInAccountFor:", v4);

  }
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_47(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "ams_setActive:forMediaType:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2;
  v9[3] = &unk_24E79BFE0;
  v4 = *(_QWORD *)(a1 + 64);
  v9[4] = *(_QWORD *)(a1 + 48);
  v11 = v4;
  objc_copyWeak(&v12, (id *)(a1 + 72));
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "addSuccessBlock:", v9);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2_49;
  v7[3] = &unk_24E795E08;
  v7[4] = *(_QWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 56);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "addErrorBlock:", v7);

  objc_destroyWeak(&v12);
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForObjectValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Succeeded in save of account: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_48;
  v9[3] = &unk_24E79C268;
  v9[4] = WeakRetained;
  v10 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForObjectValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to save account %@: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v11)[2](v11, v3, 0);

  }
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_48(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "auditLoggedInAccountFor:", 0);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);

  }
}

void __48__HMDRemoteLoginReceiver__authenticate_message___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messagePayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_225929 != -1)
    dispatch_once(&logCategory__hmf_once_t0_225929, &__block_literal_global_225930);
  return (id)logCategory__hmf_once_v1_225931;
}

void __37__HMDRemoteLoginReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_225931;
  logCategory__hmf_once_v1_225931 = v0;

}

@end
