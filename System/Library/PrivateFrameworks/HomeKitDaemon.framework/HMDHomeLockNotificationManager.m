@implementation HMDHomeLockNotificationManager

- (HMDHomeLockNotificationManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDHomeLockNotificationManagerDataSource *v8;
  HMDHomeLockNotificationManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDHomeLockNotificationManagerDataSource);
  v9 = -[HMDHomeLockNotificationManager initWithUUID:workQueue:dataSource:](self, "initWithUUID:workQueue:dataSource:", v7, v6, v8);

  return v9;
}

- (HMDHomeLockNotificationManager)initWithUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHomeLockNotificationManager *v11;
  uint64_t v12;
  NSUUID *uuid;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLockNotificationManager;
  v11 = -[HMDHomeLockNotificationManager init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_workQueue, a4);
    objc_storeStrong((id *)&v11->_dataSource, a5);
  }

  return v11;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDHomeLockNotificationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDHomeLockNotificationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeLockNotificationManager setHome:](v6, "setHome:", v4);
  objc_msgSend(v4, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLockNotificationManager setMsgDispatcher:](v6, "setMsgDispatcher:", v9);

  -[HMDHomeLockNotificationManager dataSource](v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isResidentCapable");

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering for lock notifications messages", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRoles:", objc_msgSend(v16, "roles") | 4);
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLockNotificationManager msgDispatcher](v13, "msgDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    v20[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessage"), v13, v19, sel_handleResolveNotificationContextIdentifierMessage_);

  }
}

- (BOOL)hasReachablePrimaryResidentSupportingLockNotificationContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDHomeLockNotificationManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLockNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryResidentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "supportsLockNotificationContext"))
      v7 = objc_msgSend(v5, "isReachable");
    else
      v7 = 0;

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident is not available", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldResolveNotificationContextForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5850]);

  if (v5
    && (objc_msgSend(v3, "value"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "integerValue"),
        v6,
        v7 <= 1)
    && objc_msgSend(v3, "supportsNotificationContext"))
  {
    objc_msgSend(v3, "notificationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleResolveNotificationContextIdentifierMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeLockNotificationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDHomeLockNotificationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling message: %@ to resolve notification context identifier", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "numberForKey:", CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessageAccessCodeIdentifierKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidForKey:", CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessage"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __84__HMDHomeLockNotificationManager_handleResolveNotificationContextIdentifierMessage___block_invoke;
    v18[3] = &unk_24E7839B8;
    v18[4] = v7;
    v19 = v10;
    v20 = v4;
    -[HMDHomeLockNotificationManager _resolveKeypadContextIdentifier:accessoryUUID:completion:](v7, "_resolveKeypadContextIdentifier:accessoryUUID:completion:", v19, v12, v18);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Received invalid parameters in message to resolve lock notification context for identifier: %@ accessoryUUID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);

  }
}

- (void)resolveEncodedCharacteristicNotificationContext:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDHomeLockNotificationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDHomeLockNotificationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  objc_msgSend(MEMORY[0x24BE1BA18], "parsedFromData:error:", v8, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  if (v11)
  {
    objc_msgSend(v11, "contextIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "source");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "value");

      switch(v16)
      {
        case 1:
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __107__HMDHomeLockNotificationManager_resolveEncodedCharacteristicNotificationContext_accessoryUUID_completion___block_invoke;
          v30[3] = &unk_24E7839E0;
          v31 = v10;
          -[HMDHomeLockNotificationManager resolveKeypadContextIdentifier:accessoryUUID:withCompletion:](self, "resolveKeypadContextIdentifier:accessoryUUID:withCompletion:", v14, v9, v30);
          v26 = v31;
LABEL_20:

          goto LABEL_21;
        case 2:
          -[HMDHomeLockNotificationManager contextResolutionResultFromNFCContextId:](self, "contextResolutionResultFromNFCContextId:", v14);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 3:
          -[HMDHomeLockNotificationManager contextResolutionResultFromHAPContextId:](self, "contextResolutionResultFromHAPContextId:", v14);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v26 = (void *)v17;
          (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, v17, 0);
          goto LABEL_20;
      }
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v28;
        v35 = 2048;
        v36 = v16;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Invalid source %ld present in notification context", buf, 0x16u);

        v22 = v29;
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2112;
        v36 = (uint64_t)v8;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to decode notification context identifier from data:%@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v26);
    goto LABEL_20;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v21;
    v35 = 2112;
    v36 = (uint64_t)v8;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse notification context TLV from context:%@ error:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
LABEL_21:

}

- (id)displayNameForNotificationContextResolutionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeLockNotificationManager *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLockNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      v14 = "%{public}@Can not find display name because home is nil";
LABEL_10:
      v15 = v12;
      v16 = 12;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);

    }
LABEL_12:

    objc_autoreleasePoolPop(v10);
    v9 = 0;
    goto LABEL_13;
  }
  if (!-[HMDHomeLockNotificationManager hasReachablePrimaryResidentSupportingLockNotificationContext](self, "hasReachablePrimaryResidentSupportingLockNotificationContext"))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      v14 = "%{public}@Can not find display name because primary resident supporting lock notification context is not present";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "userUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  objc_msgSend(v5, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __84__HMDHomeLockNotificationManager_displayNameForNotificationContextResolutionResult___block_invoke;
  v19[3] = &unk_24E799728;
  v20 = v4;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

LABEL_17:
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2112;
    v24 = v4;
    v14 = "%{public}@Did not find display name for notification context result: %@";
    v15 = v12;
    v16 = 22;
    goto LABEL_11;
  }
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v9;
}

- (void)resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDHomeLockNotificationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HMDHomeLockNotificationManager hasReachablePrimaryResidentSupportingLockNotificationContext](self, "hasReachablePrimaryResidentSupportingLockNotificationContext"))
  {
    -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke;
    v17[3] = &unk_24E79B3F0;
    v17[4] = self;
    v20 = v10;
    v18 = v8;
    v19 = v9;
    dispatch_async(v11, v17);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Can not resolve keypad contextId because primary resident supporting lock notification context is not present", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

  }
}

- (void)_sendResolveLockNotificationContextIdentifierMessage:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDRemoteDeviceMessageDestination *v15;
  void *v16;
  void *v17;
  HMDRemoteDeviceMessageDestination *v18;
  void *v19;
  void *v20;
  HMDRemoteMessage *v21;
  id v22;
  void *v23;
  HMDHomeLockNotificationManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDHomeLockNotificationManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  HMDRemoteMessage *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeLockNotificationManager home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "residentDeviceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryResidentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDHomeLockNotificationManager messageTargetUUID](self, "messageTargetUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v15, "initWithTarget:device:", v16, v17);

    v46[0] = v8;
    v45[0] = CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessageAccessCodeIdentifierKey");
    v45[1] = CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessage");
    v32 = v9;
    objc_msgSend(v9, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessage"), v18, v20, 0, 1, 0.0);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke;
    v34[3] = &unk_24E796990;
    v34[4] = self;
    v36 = v10;
    v33 = v8;
    v22 = v8;
    v35 = v22;
    v23 = (void *)MEMORY[0x227676638](-[HMDRemoteMessage setResponseHandler:](v21, "setResponseHandler:", v34));
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v26;
      v39 = 2112;
      v40 = v21;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v22;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Sending message: %@ to primary resident: %@ to resolve notification context identifier: %@ ", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDHomeLockNotificationManager msgDispatcher](v24, "msgDispatcher");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sendMessage:", v21);

    v9 = v32;
    v8 = v33;
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Did not find primary resident to send message to resolve notification context identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v18 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, HMDRemoteDeviceMessageDestination *))v10 + 2))(v10, 0, v18);
  }

}

- (void)_resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeLockNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeLockNotificationManager home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessCodeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __91__HMDHomeLockNotificationManager__resolveKeypadContextIdentifier_accessoryUUID_completion___block_invoke;
    v19[3] = &unk_24E783A08;
    v19[4] = self;
    v20 = v10;
    objc_msgSend(v13, "fetchAccessCodeForIdentifier:accessoryUUID:completion:", v8, v9, v19);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Can not resolve notification context identifier because accessCodeManager is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v18);

  }
}

- (id)contextResolutionResultFromAccessCode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDHomeLockNotificationContextResolutionResult *v11;
  void *v12;
  HMDHomeLockNotificationContextResolutionResult *v13;
  void *v14;
  HMDHomeLockNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeLockNotificationManager *v23;
  NSObject *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeLockNotificationManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __72__HMDHomeLockNotificationManager_contextResolutionResultFromAccessCode___block_invoke;
    v27[3] = &unk_24E799728;
    v9 = v4;
    v28 = v9;
    objc_msgSend(v8, "na_firstObjectPassingTest:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [HMDHomeLockNotificationContextResolutionResult alloc];
      objc_msgSend(v10, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDHomeLockNotificationContextResolutionResult initWithUserUUID:label:labelIdentifier:](v11, "initWithUserUUID:label:labelIdentifier:", v12, 0, 0);

    }
    else
    {
      objc_msgSend(v7, "labelsByAccessCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v7, "labelIdentifiersByAccessCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[HMDHomeLockNotificationContextResolutionResult initWithUserUUID:label:labelIdentifier:]([HMDHomeLockNotificationContextResolutionResult alloc], "initWithUserUUID:label:labelIdentifier:", 0, v19, v21);
      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v25;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Did not find any user or label with access code", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        v13 = 0;
      }

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result from access code because home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (id)contextResolutionResultFromHAPContextId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDHomeLockNotificationContextResolutionResult *v10;
  void *v11;
  HMDHomeLockNotificationContextResolutionResult *v12;
  void *v13;
  HMDHomeLockNotificationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDHomeLockNotificationManager *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLockNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "users");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __74__HMDHomeLockNotificationManager_contextResolutionResultFromHAPContextId___block_invoke;
    v22[3] = &unk_24E799728;
    v8 = v4;
    v23 = v8;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [HMDHomeLockNotificationContextResolutionResult alloc];
      objc_msgSend(v9, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDHomeLockNotificationContextResolutionResult initWithUserUUID:label:labelIdentifier:](v10, "initWithUserUUID:label:labelIdentifier:", v11, 0, 0);

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find any user with HAP contextId: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v12 = 0;
    }

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
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result because home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)contextResolutionResultFromNFCContextId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDHomeLockNotificationContextResolutionResult *v10;
  void *v11;
  HMDHomeLockNotificationContextResolutionResult *v12;
  void *v13;
  HMDHomeLockNotificationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDHomeLockNotificationManager *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLockNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "users");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __74__HMDHomeLockNotificationManager_contextResolutionResultFromNFCContextId___block_invoke;
    v22[3] = &unk_24E799728;
    v8 = v4;
    v23 = v8;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [HMDHomeLockNotificationContextResolutionResult alloc];
      objc_msgSend(v9, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDHomeLockNotificationContextResolutionResult initWithUserUUID:label:labelIdentifier:](v10, "initWithUserUUID:label:labelIdentifier:", v11, 0, 0);

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find any user with NFC contextId: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v12 = 0;
    }

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
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result because home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeLockNotificationManager uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMsgDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMDHomeLockNotificationManagerDataSource)dataSource
{
  return (HMDHomeLockNotificationManagerDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __74__HMDHomeLockNotificationManager_contextResolutionResultFromNFCContextId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "notificationContextNFCIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __74__HMDHomeLockNotificationManager_contextResolutionResultFromHAPContextId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "notificationContextHAPIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __72__HMDHomeLockNotificationManager_contextResolutionResultFromAccessCode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __91__HMDHomeLockNotificationManager__resolveKeypadContextIdentifier_accessoryUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "contextResolutionResultFromAccessCode:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMDHomeLockNotificationContextResolutionResultKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v35;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = v5;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v39 = v15;
        v40 = 2112;
        v41 = v8;
        v42 = 2112;
        v43 = v16;
        v44 = 2112;
        v45 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification context resolution result: %@ from resident for access code identifier: %@ with error: %@", buf, 0x2Au);

        v5 = v14;
      }

      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_25;
      v29[3] = &unk_24E79C2B8;
      v31 = *(id *)(a1 + 48);
      v30 = v8;
      dispatch_async(v17, v29);

      v18 = v31;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = v5;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v25;
        v40 = 2112;
        v41 = v7;
        v42 = 2112;
        v43 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode notification context result from data: %@ decodingError: %@", buf, 0x20u);

        v5 = v24;
      }

      objc_autoreleasePoolPop(v10);
      if (v9)
      {
        v46 = *MEMORY[0x24BDD1398];
        v47[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_24;
      v32[3] = &unk_24E79C2B8;
      v28 = *(id *)(a1 + 48);
      v33 = v26;
      v34 = v28;
      v18 = v26;
      dispatch_async(v27, v32);

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v22;
      v40 = 2112;
      v41 = v6;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing notification context result key in response payload: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_21;
    block[3] = &unk_24E799CC8;
    v37 = *(id *)(a1 + 48);
    dispatch_async(v23, block);

    v9 = v37;
  }

}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_24(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isOwnerUser");
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v32 = v9;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resolving keypad context identifier locally for access code identifier: %@ accessoryUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_16;
      v29[3] = &unk_24E7839E0;
      v14 = *(_QWORD *)(a1 + 48);
      v30 = *(id *)(a1 + 56);
      objc_msgSend(v12, "_resolveKeypadContextIdentifier:accessoryUUID:completion:", v13, v14, v29);
      v15 = v30;
    }
    else
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 40);
        v23 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        v33 = 2112;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resolving keypad context identifier via resident for access code identifier: %@ accessoryUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      v24 = *(void **)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_17;
      v27[3] = &unk_24E7839E0;
      v26 = *(_QWORD *)(a1 + 48);
      v28 = *(id *)(a1 + 56);
      objc_msgSend(v24, "_sendResolveLockNotificationContextIdentifierMessage:accessoryUUID:withCompletion:", v25, v26, v27);
      v15 = v28;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can not resolve keypad contextId because home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v15);
  }

}

uint64_t __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__HMDHomeLockNotificationManager_displayNameForNotificationContextResolutionResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __107__HMDHomeLockNotificationManager_resolveEncodedCharacteristicNotificationContext_accessoryUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__HMDHomeLockNotificationManager_handleResolveNotificationContextIdentifierMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context identifier: %@ to result: %@ with error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v28;
    v14 = v13;
    if (v12)
    {
      v29 = CFSTR("HMDHomeLockNotificationContextResolutionResultKey");
      v30 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "respondWithPayload:", v15);
    }
    else
    {
      if (v13)
      {
        v31 = *MEMORY[0x24BDD1398];
        v32 = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v34 = v25;
        v35 = 2112;
        v36 = v26;
        v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Responding to resolve notification context identifier message: %@ with: %@", buf, 0x20u);

        v22 = v27;
      }

      objc_autoreleasePoolPop(v22);
      objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v21);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v34 = v19;
      v35 = 2112;
      v36 = v20;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Responding to resolve notification context identifier message: %@ with: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v14);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t30_105740 != -1)
    dispatch_once(&logCategory__hmf_once_t30_105740, &__block_literal_global_105741);
  return (id)logCategory__hmf_once_v31_105742;
}

void __45__HMDHomeLockNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v31_105742;
  logCategory__hmf_once_v31_105742 = v0;

}

- (void)handleDoorLockEventReport:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDHomeLockNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v19;
    v29 = 1024;
    v30 = v13;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling Matter event report for accessory=%@ eventID=%u", (uint8_t *)&v23, 0x26u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v8, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "event");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntValue");

  switch(v22)
  {
    case 4:
      -[HMDHomeLockNotificationManager handleLockUserChangeEvent:forAccessory:flow:](v15, "handleLockUserChangeEvent:forAccessory:flow:", v8, v9, v10);
      break;
    case 2:
      -[HMDHomeLockNotificationManager handleLockOperationEvent:forAccessory:flow:](v15, "handleLockOperationEvent:forAccessory:flow:", v8, v9, v10);
      break;
    case 0:
      -[HMDHomeLockNotificationManager handleDoorLockAlarmEvent:forAccessory:flow:](v15, "handleDoorLockAlarmEvent:forAccessory:flow:", v8, v9, v10);
      break;
  }

}

- (void)handleDoorLockAlarmEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDHomeLockNotificationManager *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v22 = "%{public}@[Flow: %@] Cannot insert DoorLockAlarm event bulletin because event is nil for MTRDoorLockClusterD"
            "oorLockAlarmEvent.";
      v23 = v18;
      v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v16);
    goto LABEL_15;
  }
  objc_msgSend(v13, "alarmCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v22 = "%{public}@[Flow: %@] Not inserting DoorLockAlarm event bulletin because alarmCode is not of type LockJammed.";
      v23 = v18;
      v24 = OS_LOG_TYPE_INFO;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v23, v24, v22, (uint8_t *)&v29, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v19)
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544130;
    v30 = v25;
    v31 = 2112;
    v32 = v26;
    v33 = 2112;
    v34 = v27;
    v35 = 2112;
    v36 = v13;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling DoorLockAlarm (Door Jammed) Event for accessory=%@ event=%@", (uint8_t *)&v29, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(v13, "alarmCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLockNotificationManager sendDoorLockAlarmEventNotification:accessory:flow:](v17, "sendDoorLockAlarmEventNotification:accessory:flow:", v28, v9, v10);

LABEL_15:
}

- (void)handleLockOperationEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDHomeLockNotificationManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  HMDHomeLockNotificationManager *v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v20;
    v53 = 2112;
    v54 = v21;
    v22 = "%{public}@[Flow: %@] Cannot insert lock operation bulletin because eventReport.value was not a MTRDoorLockClus"
          "terLockOperationEvent.";
LABEL_11:
    v23 = v19;
    v24 = OS_LOG_TYPE_ERROR;
    goto LABEL_12;
  }
  objc_msgSend(v13, "lockOperationType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "integerValue"))
  {

LABEL_15:
    objc_msgSend(v13, "operationSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "integerValue") == 7)
    {
      objc_msgSend(v13, "fabricIndex");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v20;
        v53 = 2112;
        v54 = v21;
        v22 = "%{public}@[Flow: %@] Cannot insert lock operation bulletin because the operation source is Remote but we h"
              "ave no fabric. This is likely a bug with the lock.";
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v28, "initWithQueue:", v29);

    objc_msgSend(v9, "chipAccessoryServer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "createDoorLockClusterObjectWithFlow:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke;
    v45[3] = &unk_24E789228;
    v46 = v13;
    v47 = self;
    v31 = v10;
    v32 = v10;
    v33 = v9;
    v34 = v31;
    v48 = v31;
    v49 = v33;
    v50 = v27;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_63;
    v40[3] = &unk_24E789200;
    v40[4] = self;
    v35 = v34;
    v9 = v33;
    v10 = v32;
    v41 = v35;
    v42 = v49;
    v43 = v46;
    v44 = v50;
    v36 = v50;
    v37 = (id)objc_msgSend(v30, "inContext:then:orRecover:", v39, v45, v40);

    goto LABEL_21;
  }
  objc_msgSend(v13, "lockOperationType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if (v16 == 1)
    goto LABEL_15;
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v20;
    v53 = 2112;
    v54 = v21;
    v22 = "%{public}@[Flow: %@] Not inserting lock operation bulletin because lockOperationType is neither Lock or Unlock types.";
    v23 = v19;
    v24 = OS_LOG_TYPE_INFO;
LABEL_12:
    _os_log_impl(&dword_2218F0000, v23, v24, v22, buf, 0x16u);

  }
LABEL_13:

  objc_autoreleasePoolPop(v17);
LABEL_21:

}

- (void)handleLockUserChangeEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDHomeLockNotificationManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  _QWORD v35[4];
  id v36;
  HMDHomeLockNotificationManager *v37;
  id v38;
  id v39;
  char v40;
  char v41;
  char v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v13, "dataOperationType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v15 != 2)
    {
      objc_msgSend(v13, "lockDataType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v24, "integerValue");

      objc_msgSend(v13, "dataOperationType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = objc_msgSend(v25, "integerValue");

      objc_msgSend(v13, "dataIndex");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToNumber:", &unk_24E96BDC8);

      v28 = objc_alloc(MEMORY[0x24BE3F168]);
      -[HMDHomeLockNotificationManager workQueue](self, "workQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithQueue:", v29);

      objc_msgSend(v9, "chipAccessoryServer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "createDoorLockClusterObjectWithFlow:", v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke;
      v35[3] = &unk_24E7892A0;
      v36 = v13;
      v37 = self;
      v38 = v10;
      v40 = v34;
      v41 = v27;
      v39 = v9;
      v42 = (char)v24;
      v33 = (id)objc_msgSend(v32, "inContext:then:orRecover:", v30, v35, &__block_literal_global_146897);

      goto LABEL_13;
    }
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v19;
      v45 = 2112;
      v46 = v20;
      v21 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because dataOperationType is not of type MTRDoo"
            "rLockDataOperationTypeClear or MTRDoorLockDataOperationTypeAdd (we are not clearing or adding the credential"
            ", we are modifying it).";
      v22 = v18;
      v23 = OS_LOG_TYPE_INFO;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v22, v23, v21, buf, 0x16u);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v19;
      v45 = 2112;
      v46 = v20;
      v21 = "%{public}@[Flow: %@] Cannot insert lock user change bulletin because eventReport.value is not a MTRDoorLockC"
            "lusterLockUserChangeEvent.";
      v22 = v18;
      v23 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }

  objc_autoreleasePoolPop(v16);
LABEL_13:

}

- (void)sendLockOperationEventNotification:(id)a3 lockOperationType:(id)a4 lockOperationSource:(id)a5 fabricIndex:(id)a6 accessory:(id)a7 timestamp:(id)a8 flow:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  HMDHomeLockNotificationManager *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDHomeLockNotificationManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  HMDHomeLockNotificationManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  HMDHomeLockNotificationManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDHomeLockNotificationManager *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  HMDHomeLockNotificationManager *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDHomeLockNotificationManager *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  HMDHomeLockNotificationManager *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  HMDHomeLockNotificationManager *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  HMDHomeLockNotificationManager *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  HMDHomeLockNotificationManager *v116;
  id v117;
  _QWORD v118[4];
  id v119;
  void *v120;
  _QWORD v121[3];
  _QWORD v122[3];
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  id v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v107 = a3;
  v109 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v106 = a8;
  v18 = a9;
  v108 = v17;
  objc_msgSend(v17, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = 0x24BDBC000uLL;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v109, CFSTR("HMDCharacteristicEventReportMessageKeyOperationType"));
    HMFEncodedRootObject();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v21;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE3EBF8]);

    v23 = v15;
    v24 = objc_msgSend(v15, "isEqualToNumber:", &unk_24E96BDE0);
    v25 = self;
    v102 = v18;
    if (v24)
    {
      if (v16)
      {
        objc_msgSend((id)objc_opt_class(), "findEcosystemName:", v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("HMDCharacteristicEventReportMessageKeyEcosystemName"));

      }
      else
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "UUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v124 = v37;
          v125 = 2112;
          v126 = v38;
          v127 = 2112;
          v128 = (uint64_t)v23;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Lock Operation Source = %@, which is Remote, and fabric index is null. This is an error (most likely with the lock firmware). The fabric index should never be null when the operation source is Remote, according to the Matter spec.", buf, 0x20u);

          v18 = v102;
          v20 = 0x24BDBC000uLL;
        }

        objc_autoreleasePoolPop(v34);
      }
    }
    v39 = MEMORY[0x24BDAC760];
    v100 = v16;
    if (v107)
    {
      objc_msgSend(v19, "users");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v39;
      v118[1] = 3221225472;
      v118[2] = __150__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke;
      v118[3] = &unk_24E799728;
      v41 = v107;
      v119 = v41;
      objc_msgSend(v40, "na_firstObjectPassingTest:", v118);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v23;
      if (v42)
      {
        v44 = (void *)MEMORY[0x227676638]();
        v45 = v25;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v98 = v23;
          v47 = v42;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "UUID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "uuid");
          v50 = v25;
          v51 = v19;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v124 = v48;
          v125 = 2112;
          v126 = v49;
          v127 = 2160;
          v128 = 1752392040;
          v129 = 2112;
          v130 = v41;
          v131 = 2160;
          v132 = 1752392040;
          v133 = 2112;
          v134 = v52;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Matched userUUID %{mask.hash}@ to user %{mask.hash}@", buf, 0x3Eu);

          v19 = v51;
          v25 = v50;
          v20 = 0x24BDBC000;

          v42 = v47;
          v43 = v98;
        }

        objc_autoreleasePoolPop(v44);
        v53 = 0;
        v101 = 0;
        v18 = v102;
      }
      else
      {
        objc_msgSend(0, "uniqueIDForAccessories");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accessCodeForMatterUserWithUserUniqueID:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v102;
        if (objc_msgSend(v59, "length"))
        {
          objc_msgSend(v19, "labelsByAccessCode");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", v59);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "labelIdentifiersByAccessCode");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v59);
          v53 = objc_claimAutoreleasedReturnValue();

          v96 = MEMORY[0x227676638]();
          v62 = v25;
          v63 = v59;
          HMFGetOSLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "UUID");
            v103 = v53;
            v66 = v43;
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "uniqueIDForAccessories");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138545155;
            v124 = v65;
            v125 = 2112;
            v126 = v67;
            v127 = 2160;
            v128 = 1752392040;
            v129 = 2112;
            v130 = v68;
            v131 = 2113;
            v132 = (uint64_t)v63;
            v133 = 2113;
            v134 = v101;
            v135 = 2160;
            v136 = 1752392040;
            v137 = 2112;
            v138 = v103;
            _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Matched userUniqueID %{mask.hash}@ to guest access code %{private}@ ('%{private}@', %{mask.hash}@)", buf, 0x52u);

            v42 = 0;
            v43 = v66;
            v53 = v103;

          }
          v59 = v63;
          v69 = (void *)v96;
        }
        else
        {
          v69 = (void *)MEMORY[0x227676638]();
          v70 = v25;
          HMFGetOSLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "UUID");
            v96 = (uint64_t)v69;
            v72 = v59;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "uniqueIDForAccessories");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v124 = v71;
            v125 = 2112;
            v126 = v73;
            v127 = 2160;
            v128 = 1752392040;
            v129 = 2112;
            v130 = v74;
            _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Could not match userUniqueID %{mask.hash}@ to any user", buf, 0x2Au);

            v18 = v102;
            v59 = v72;
            v69 = (void *)v96;

          }
          v53 = 0;
          v101 = 0;
        }

        objc_autoreleasePoolPop(v69);
      }

    }
    else
    {
      v54 = (void *)MEMORY[0x227676638]();
      v55 = self;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v124 = v57;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_DEBUG, "%{public}@No userUUID to match to a specific user", buf, 0xCu);

        v20 = 0x24BDBC000uLL;
      }

      objc_autoreleasePoolPop(v54);
      v53 = 0;
      v101 = 0;
      v42 = 0;
      v43 = v23;
    }
    v75 = *(void **)(v20 + 3800);
    v121[0] = CFSTR("HMDAccessoryMatterLockOperationTypeNotificationKey");
    v121[1] = CFSTR("HMDAccessoryMatterLockOperationSourceNotificationKey");
    v122[0] = v109;
    v122[1] = v43;
    v121[2] = CFSTR("HMDAccessoryMatterLockOperationDateNotificationKey");
    v122[2] = v106;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, v121, 3, v96);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "dictionaryWithDictionary:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v42, "uuid");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setObject:forKeyedSubscript:", v78, CFSTR("HMDAccessoryMatterLockUserUUIDNotificationKey"));

    }
    else if (v53)
    {
      objc_msgSend(v77, "setObject:forKeyedSubscript:", v53, CFSTR("HMDAccessoryMatterLockLabelIdentifierNotificationKey"));
    }
    v104 = (void *)v53;
    v79 = v42;
    v80 = (void *)objc_msgSend(v77, "copy");
    logAndPostNotification(CFSTR("HMDAccessoryMatterLockStateChangedNotification"), v108, v80);

    objc_msgSend(v108, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5850], *MEMORY[0x24BDD6C08]);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      v27 = v43;
      objc_msgSend(v19, "accessoryBulletinNotificationManager");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v81;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
      v83 = v25;
      v84 = v19;
      v85 = v18;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "characteristicsByDestinationForCharacteristics:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "allKeys");
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v85;
      v19 = v84;

      v110[0] = MEMORY[0x24BDAC760];
      v110[1] = 3221225472;
      v110[2] = __150__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke_75;
      v110[3] = &unk_24E789308;
      v111 = v79;
      v112 = v105;
      v113 = v84;
      v89 = v101;
      v114 = v101;
      v115 = v108;
      v116 = v83;
      v117 = v18;
      objc_msgSend(v88, "na_each:", v110);

    }
    else
    {
      v97 = v19;
      v99 = v43;
      v90 = (void *)MEMORY[0x227676638]();
      v91 = v25;
      HMFGetOSLogHandle();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUID");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "uuid");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v124 = v93;
        v125 = 2112;
        v126 = v94;
        v127 = 2112;
        v128 = (uint64_t)v95;
        _os_log_impl(&dword_2218F0000, v92, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] There is no HMCharacteristicTypeCurrentLockMechanismState characteristic on this accessory %@", buf, 0x20u);

        v18 = v102;
      }

      objc_autoreleasePoolPop(v90);
      v19 = v97;
      v27 = v99;
      v89 = v101;
    }

    v16 = v100;
  }
  else
  {
    v27 = v15;
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUID");
      v32 = v18;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v124 = v31;
      v125 = 2112;
      v126 = v33;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error sending message for Matter Accessory Bulletin Notification, home is nil.", buf, 0x16u);

      v18 = v32;
      v19 = 0;

    }
    objc_autoreleasePoolPop(v28);
  }

}

- (void)sendDoorLockAlarmEventNotification:(id)a3 accessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  HMDHomeLockNotificationManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeLockNotificationManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDHomeLockNotificationManager *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  HMDHomeLockNotificationManager *v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("HMDCharacteristicEventReportMessageKeyAlarmCode"));
    HMFEncodedRootObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE3EBF8]);

    objc_msgSend(v9, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD5850], *MEMORY[0x24BDD6C08]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "accessoryBulletinNotificationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "characteristicsByDestinationForCharacteristics:", v16);
      v36 = self;
      v17 = v12;
      v18 = v9;
      v19 = v11;
      v20 = v14;
      v21 = v10;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v22;
      v10 = v21;
      v14 = v20;
      v11 = v19;
      v9 = v18;
      v12 = v17;

      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __90__HMDHomeLockNotificationManager_CHIP__sendDoorLockAlarmEventNotification_accessory_flow___block_invoke;
      v38[3] = &unk_24E789330;
      v39 = v9;
      v40 = v17;
      v41 = v11;
      v42 = v36;
      v43 = v10;
      objc_msgSend(v24, "na_each:", v38);

    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUID");
        v37 = v30;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        *(_DWORD *)buf = 138543874;
        v46 = v35;
        v47 = 2112;
        v48 = v33;
        v49 = 2112;
        v50 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v50;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] There is no HMCharacteristicTypeCurrentLockMechanismState characteristic on this accessory %@", buf, 0x20u);

        v30 = v37;
      }

      objc_autoreleasePoolPop(v30);
    }

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
      objc_msgSend(v10, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v28;
      v47 = 2112;
      v48 = v29;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error sending message for Matter Accessory Bulletin Notification, home is nil.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)sendLockUserChangeEventNotification:(id)a3 lockDataType:(unsigned __int8)a4 accessory:(id)a5 dataOperationType:(unsigned __int8)a6 fabricIndex:(id)a7 flow:(id)a8
{
  uint64_t v10;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeLockNotificationManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v10 = a6;
  v12 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v15, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = MEMORY[0x24BDAC760];
    if (v14)
    {
      objc_msgSend(v18, "users");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v20;
      v42[1] = 3221225472;
      v42[2] = __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke;
      v42[3] = &unk_24E799728;
      v43 = v14;
      objc_msgSend(v21, "na_firstObjectPassingTest:", v42);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("HMDCharacteristicEventReportMessageKeyLockDataType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("HMDCharacteristicEventReportMessageKeyDataOperationType"));

    if (v16)
    {
      objc_msgSend((id)objc_opt_class(), "findEcosystemName:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("HMDCharacteristicEventReportMessageKeyEcosystemName"));

    }
    HMFEncodedRootObject();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE3EBF8]);

    objc_msgSend(v19, "users");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke_2;
    v36[3] = &unk_24E789358;
    v36[4] = self;
    v37 = v17;
    v38 = v28;
    v41 = v10;
    v39 = v22;
    v40 = v15;
    v34 = v22;
    v35 = v28;
    objc_msgSend(v33, "na_each:", v36);

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v26;
      v46 = 2112;
      v47 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error sending message for Matter Accessory Bulletin Notification, home is nil.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

uint64_t __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIDForAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDRemoteAccountMessageDestination *v24;
  void *v25;
  HMDRemoteAccountMessageDestination *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDRemoteAccountMessageDestination *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "isAccessCurrentlyAllowedBySchedule") & 1) != 0)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    if (*(_BYTE *)(a1 + 72) || objc_msgSend(v3, "isAdministrator"))
    {
      v5 = *(void **)(a1 + 56);
      if (!v5)
        goto LABEL_10;
      objc_msgSend(v5, "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "hmf_isEqualToUUID:", v11);

      if (v12)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24E96BDF8, CFSTR("HMDCharacteristicEventReportMessageKeyIsAffectedUser"));
      }
      else
      {
LABEL_10:
        if (*(_BYTE *)(a1 + 72) == 1)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "UUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v48 = v21;
            v49 = 2112;
            v50 = v22;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not inserting lock user change bulletin because dataOperationType is of type MTRDoorLockDataOperationTypeClear and user is not the affected user.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          goto LABEL_22;
        }
      }
      objc_msgSend(v3, "accountHandle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = [HMDRemoteAccountMessageDestination alloc];
        objc_msgSend(*(id *)(a1 + 64), "messageTargetUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v24, "initWithTarget:handle:multicast:", v25, v23, 1);

        v46 = v4;
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1B0]), "initWithName:destination:payload:", CFSTR("HMDCharacteristicEventReportMessage"), v26, v4);
        v28 = (void *)MEMORY[0x227676638]();
        v29 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "UUID");
          v43 = v23;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "messageTargetUUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "account");
          v45 = v26;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "identifier");
          v44 = v28;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v48 = v31;
          v49 = 2112;
          v50 = v32;
          v51 = 2112;
          v52 = v33;
          v53 = 2112;
          v54 = v35;
          v55 = 2112;
          v56 = v46;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending HMDCharacteristicEventReportMessage to target=%@ for account=%@ with payload=%@", buf, 0x34u);

          v28 = v44;
          v26 = v45;

          v23 = v43;
        }

        objc_autoreleasePoolPop(v28);
        objc_msgSend(*(id *)(a1 + 64), "msgDispatcher");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sendMessage:", v27);

        v4 = v46;
      }
      else
      {
        v37 = (void *)MEMORY[0x227676638]();
        v38 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "shortDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = v40;
          v49 = 2112;
          v50 = v41;
          v51 = 2112;
          v52 = v42;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot send lock user change event notification because no account handle was found for user: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v37);
      }

    }
LABEL_22:

    goto LABEL_23;
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v16;
    v49 = 2112;
    v50 = v17;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot send the notification as the user is outside schedule", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
LABEL_23:

}

void __90__HMDHomeLockNotificationManager_CHIP__sendDoorLockAlarmEventNotification_accessory_flow___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;
  void *v8;
  HMDRemoteDeviceMessageDestination *v9;
  HMDRemoteMessage *v10;
  void *v11;
  HMDRemoteMessage *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMDRemoteDeviceMessageDestination *v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(a1[4], "messageTargetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v7, "initWithTarget:device:", v8, v6);

  v10 = [HMDRemoteMessage alloc];
  v11 = (void *)objc_msgSend(a1[5], "copy");
  v12 = -[HMDRemoteMessage initWithName:destination:payload:](v10, "initWithName:destination:payload:", CFSTR("HMDCharacteristicEventReportMessage"), v9, v11);

  objc_msgSend(a1[6], "primaryResident");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v6);

  v16 = (void *)MEMORY[0x227676638]();
  v17 = a1[7];
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[8], "UUID");
      v31 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a1[5];
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling handleCharacteristicEventReportMessage (Showing notification on THIS Apple TV) with payload=%@", buf, 0x20u);

      v4 = v31;
    }

    objc_autoreleasePoolPop(v16);
    objc_msgSend(a1[4], "handleCharacteristicEventReportMessage:", v12);
  }
  else
  {
    v32 = v4;
    if (v19)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[8], "UUID");
      v29 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "messageTargetUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v30 = v3;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = a1[5];
      *(_DWORD *)buf = 138544386;
      v34 = v23;
      v35 = 2112;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      v39 = 2112;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending HMDCharacteristicEventReportMessage to target=%@ for device=%@ with payload=%@", buf, 0x34u);

      v3 = v30;
      v9 = v29;

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(a1[4], "msgDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendMessage:", v12);

    v4 = v32;
  }

}

uint64_t __150__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __150__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v3;
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  void *v24;
  HMDRemoteDeviceMessageDestination *v25;
  HMDRemoteMessage *v26;
  void *v27;
  HMDRemoteMessage *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v47 = a2;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:");
  v3 = objc_claimAutoreleasedReturnValue();
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v3;
  objc_msgSend(v4, "deviceForHandle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hmf_isEqualToUUID:", v12))
    {
      objc_msgSend(v5, "productInfo");
      v13 = v5;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "productClass");

      v5 = v13;
      if (v15 != 4)
        goto LABEL_21;
    }
    else
    {

    }
  }
  v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 48), "users");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __150__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke_2;
  v48[3] = &unk_24E799728;
  v45 = v5;
  v18 = v5;
  v49 = v18;
  objc_msgSend(v17, "na_firstObjectPassingTest:", v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *(void **)(a1 + 32);
  if (v20 && ((objc_msgSend(v20, "isOwner") & 1) != 0 || objc_msgSend(v19, "isAdministrator")))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("HMDCharacteristicEventReportMessageKeyUserUUID"));

  }
  else if (*(_QWORD *)(a1 + 56) && objc_msgSend(v19, "isAdministrator"))
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("HMDCharacteristicEventReportMessageKeyGuestName"));
  }
  v23 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(*(id *)(a1 + 64), "messageTargetUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v23, "initWithTarget:device:", v24, v18);

  v26 = [HMDRemoteMessage alloc];
  v27 = (void *)objc_msgSend(v16, "copy");
  v28 = -[HMDRemoteMessage initWithName:destination:payload:](v26, "initWithName:destination:payload:", CFSTR("HMDCharacteristicEventReportMessage"), v25, v27);

  objc_msgSend(*(id *)(a1 + 48), "primaryResident");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "device");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqual:", v18);

  v32 = (void *)MEMORY[0x227676638]();
  v33 = *(id *)(a1 + 72);
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v35)
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "UUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v36;
      v52 = 2112;
      v53 = v37;
      v54 = 2112;
      v55 = v16;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling handleCharacteristicEventReportMessage (Showing notification on THIS Apple TV) with payload=%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(*(id *)(a1 + 64), "handleCharacteristicEventReportMessage:", v28);
  }
  else
  {
    if (v35)
    {
      HMFGetLogIdentifier();
      v44 = v16;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "UUID");
      v43 = v19;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "messageTargetUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v51 = v38;
      v52 = 2112;
      v53 = v39;
      v54 = 2112;
      v55 = v40;
      v56 = 2112;
      v57 = v41;
      v58 = 2112;
      v59 = v44;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending HMDCharacteristicEventReportMessage to target=%@ for device=%@ with payload=%@", buf, 0x34u);

      v19 = v43;
      v16 = v44;
    }

    objc_autoreleasePoolPop(v32);
    objc_msgSend(*(id *)(a1 + 64), "msgDispatcher");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sendMessage:", v28);

  }
  v5 = v45;

LABEL_21:
}

uint64_t __150__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "hmf_isEqualToUUID:", v8);

  return v9;
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  char v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  __int16 v27;

  v3 = a2;
  objc_msgSend(v3, "fetchCurrentFabricIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_2;
  v22[3] = &unk_24E789250;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v23 = v6;
  v24 = v7;
  v25 = v8;
  v27 = *(_WORD *)(a1 + 64);
  v9 = v3;
  v26 = v9;
  objc_msgSend(v4, "then:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_66;
  v15[3] = &unk_24E789278;
  v11 = *(void **)(a1 + 48);
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 32);
  v19 = *(_BYTE *)(a1 + 65);
  v20 = *(_BYTE *)(a1 + 64);
  v21 = *(_BYTE *)(a1 + 66);
  objc_msgSend(v10, "then:", v15);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;

    return 3;
  }
  else
  {
    _HMFPreconditionFailure();
    return __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_67();
  }
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_67()
{
  return 1;
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fabricIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", v3);

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v11 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because the user change was originated by our fabric.";
LABEL_10:
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v23, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((*(_BYTE *)(a1 + 64) & 0xFE) != 6)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v11 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because lockDataType is not of type MTRDoorLock"
            "LockDataTypePIN or MTRDoorLockLockDataTypeRFID (this event is for something other than the pin code or TTU credential).";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v11 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because allSlotsCleared.";
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v15 = 2;
    goto LABEL_15;
  }
  v17 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "userIndex");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getUserAtIndex:flow:", v19, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
    _HMFPreconditionFailure();
  v22 = v21;

  v15 = 3;
LABEL_15:

  return v15;
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  id v26;
  void *v27;
  NSObject *log;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "userUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v25 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "lockDataType");
    v26 = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "dataOperationType");
    log = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "operationSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "userIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
    v27 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "dataIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(unsigned __int8 *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138546178;
    v31 = v29;
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    v44 = 2112;
    v45 = v4;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v15;
    v50 = 1024;
    v51 = v16;
    v52 = 2112;
    v53 = v17;
    _os_log_impl(&dword_2218F0000, log, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockUserChange Event for accessory=%@ lockDataType=%@ dataOperationType=%@ operationSource=%@ userIndex=%@ userUniqueID=%@ fabricIndex=%@ dataIndex=%@ allSlotsCleared=%d event=%@", buf, 0x76u);

    v5 = v27;
    v7 = log;

    v3 = v26;
    v6 = v25;

  }
  objc_autoreleasePoolPop(v5);
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v3, "userUniqueID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(unsigned __int8 *)(a1 + 65);
  v21 = *(unsigned __int8 *)(a1 + 66);
  v22 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendLockUserChangeEventNotification:lockDataType:accessory:dataOperationType:fabricIndex:flow:", v19, v20, v22, v21, v23, *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  id v37;

  v3 = a2;
  objc_msgSend(v3, "fetchCurrentFabricIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_2;
  v33[3] = &unk_24E7891B0;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v34 = v6;
  v35 = v7;
  v36 = v8;
  v9 = v3;
  v37 = v9;
  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_55;
  v31[3] = &unk_24E79B210;
  v10 = *(void **)(a1 + 48);
  v31[4] = *(_QWORD *)(a1 + 40);
  v32 = v10;
  objc_msgSend(v4, "then:orRecover:", v33, v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_57;
  v25[3] = &unk_24E7891D8;
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = *(id *)(a1 + 32);
  v30 = *(id *)(a1 + 64);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_61;
  v20[3] = &unk_24E789200;
  v15 = *(void **)(a1 + 48);
  v20[4] = *(_QWORD *)(a1 + 40);
  v21 = v15;
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 32);
  v24 = *(id *)(a1 + 64);
  objc_msgSend(v11, "then:orRecover:", v25, v20);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = v16;

    return 3;
  }
  else
  {
    v19 = _HMFPreconditionFailure();
    return __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_63(v19);
  }
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to retrieve HMMTRSyncClusterDoorLock, so we cannot associate this LockOperation event with a user or our fabric. Posting bulletin without user attribution.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v26 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "lockOperationType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "operationSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "userIndex");
    v25 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138545154;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 2112;
    v38 = v17;
    v39 = 2112;
    v40 = v18;
    v41 = 2112;
    v42 = v19;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockOperation Event for accessory=%@ operationType=%@ operationSource=%@ userIndex=%@ userUniqueID=nil fabricIndex=%@ event=%@", buf, 0x52u);

    v9 = v25;
    v3 = v26;

  }
  objc_autoreleasePoolPop(v9);
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "lockOperationType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "operationSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendLockOperationEventNotification:lockOperationType:lockOperationSource:fabricIndex:accessory:timestamp:flow:", 0, v21, v22, v23, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "operationSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "integerValue") == 7)
  {
    objc_msgSend(*(id *)(a1 + 32), "fabricIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToNumber:", v3);

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v10;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not inserting lock operation event bulletin because the lock operation event was originated by our fabric. We handle this path in HMDHome and throw HMFErrorCodeOperationCancelled here.", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
        objc_claimAutoreleasedReturnValue();
      }

      v21 = 2;
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "userIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "userIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "integerValue");
    objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getUserAtIndex:flow:", v17, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
      _HMFPreconditionFailure();
    v20 = v19;
    v21 = 3;

    goto LABEL_14;
  }
  v21 = 1;
LABEL_15:

  return v21;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch current fabric index, so we cannot associate this LockOperation event with our fabric. Posting bulletin regardless.", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_57(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "userUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "users");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_2_58;
    v27[3] = &unk_24E799728;
    v28 = v3;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v26 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "lockOperationType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "operationSource");
    v25 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "userIndex");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
    v24 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138545410;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v16;
    v41 = 2112;
    v42 = v26;
    v43 = 2112;
    v44 = v17;
    v45 = 2112;
    v46 = v18;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockOperation Event for accessory=%@ operationType=%@ operationSource=%@ userIndex=%@ userUUID=%@ fabricIndex=%@ event=%@", buf, 0x5Cu);

    v8 = v24;
    v3 = v25;

    v4 = v26;
  }

  objc_autoreleasePoolPop(v8);
  v19 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "lockOperationType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "operationSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendLockOperationEventNotification:lockOperationType:lockOperationSource:fabricIndex:accessory:timestamp:flow:", v4, v20, v21, v22, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "code") != 12)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to retrieve MTRDoorLockClusterGetUserResponseParams, so we cannot associate this LockOperation event with a user. Posting bulletin without user attribution.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "lockOperationType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "operationSource");
      v25 = v3;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "userIndex");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
      v26 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138545154;
      v28 = v12;
      v29 = 2112;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v17;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockOperation Event for accessory=%@ operationType=%@ operationSource=%@ userIndex=%@ userUniqueID=nil fabricIndex=%@ event=%@", buf, 0x52u);

      v9 = v26;
      v3 = v25;

    }
    objc_autoreleasePoolPop(v9);
    v20 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "lockOperationType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "operationSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "fabricIndex");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendLockOperationEventNotification:lockOperationType:lockOperationSource:fabricIndex:accessory:timestamp:flow:", 0, v21, v22, v23, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

  }
  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_2_58(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIDForAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

+ (id)findEcosystemName:(id)a3
{
  return CFSTR("MATTER_ECOSYSTEM_NAME_UNKNOWN_SERVICE");
}

@end
