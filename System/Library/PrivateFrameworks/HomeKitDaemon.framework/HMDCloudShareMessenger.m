@implementation HMDCloudShareMessenger

- (HMDCloudShareMessenger)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCloudShareMessenger *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDCloudShareMessenger initWithMessageTargetUUID:workQueue:home:messageDispatcher:](self, "initWithMessageTargetUUID:workQueue:home:messageDispatcher:", v10, v9, v8, v11);

  return v12;
}

- (HMDCloudShareMessenger)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 home:(id)a5 messageDispatcher:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDCloudShareMessenger *v16;
  HMDCloudShareMessenger *v17;
  id shareInvitationRetryHandler;
  HMDCloudShareMessenger *result;
  HMDCloudShareMessenger *v20;
  SEL v21;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v12)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    v20 = (HMDCloudShareMessenger *)_HMFPreconditionFailure();
    -[HMDCloudShareMessenger configure](v20, v21);
    return result;
  }
  v15 = v14;
  v22.receiver = self;
  v22.super_class = (Class)HMDCloudShareMessenger;
  v16 = -[HMDCloudShareMessenger init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v17->_messageTargetUUID, a3);
    objc_storeWeak((id *)&v17->_home, v13);
    objc_storeStrong((id *)&v17->_messageDispatcher, a6);
    shareInvitationRetryHandler = v17->_shareInvitationRetryHandler;
    v17->_shareInvitationRetryHandler = &__block_literal_global_37639;

  }
  return v17;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudShareMessenger *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareMessenger home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 5, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudShareMessenger messageDispatcher](self, "messageDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCloudShareInviteMessage"), self, v6, sel_handleShareInviteMessage_);

    -[HMDCloudShareMessenger messageDispatcher](self, "messageDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCloudShareRequestInviteMessage"), self, v6, sel_handleShareRequestInviteMessage_);

    -[HMDCloudShareMessenger messageDispatcher](self, "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCloudShareAccessRevokedMessage"), self, v6, sel_handleShareRevokeMessage_);

    -[HMDCloudShareMessenger setConfigured:](self, "setConfigured:", 1);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot configure cloud share messenger because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)unconfigure
{
  void *v3;
  HMDCloudShareMessenger *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@De-registering from message dispatcher.", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudShareMessenger setConfigured:](v4, "setConfigured:", 0);
  -[HMDCloudShareMessenger messageDispatcher](v4, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deregisterReceiver:", v4);

}

- (void)sendShareInvitationData:(id)a3 toUser:(id)a4 minimumHomeKitVersion:(id)a5 requiredSupportedFeatures:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDRemoteAccountMessageDestination *v24;
  void *v25;
  HMDRemoteAccountMessageDestination *v26;
  void *v27;
  HMDCloudShareMessenger *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  _BYTE buf[12];
  __int16 v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v38 = CFSTR("kRequiredCapabilitiesKey");
  v36[0] = CFSTR("kHomedVersionKey");
  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "versionString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = CFSTR("kHomedSupportedFeaturesKey");
  v37[0] = v19;
  objc_msgSend(v14, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "accountHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = [HMDRemoteAccountMessageDestination alloc];
    -[HMDCloudShareMessenger messageTargetUUID](self, "messageTargetUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:deviceCapabilities:](v24, "initWithTarget:handle:multicast:deviceCapabilities:", v25, v23, 1, v22);

    *(_QWORD *)buf = objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Send share invitation to user"));
    -[HMDCloudShareMessenger _sendShareInvitationData:toDestination:retryCount:activity:completion:](self, "_sendShareInvitationData:toDestination:retryCount:activity:completion:", v32, v26, 0, *(_QWORD *)buf, v15);
    __HMFActivityScopeLeave();

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v30;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not send share invitation data to user with no account handle: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    v26 = (HMDRemoteAccountMessageDestination *)_Block_copy(v15);
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(HMDRemoteAccountMessageDestination *, _QWORD, void *))&v26->_multicast)(v26, 0, v31);

    }
  }

}

- (void)sendShareInvitationData:(id)a3 toDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  HMDRemoteDeviceMessageDestination *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = [HMDRemoteDeviceMessageDestination alloc];
  -[HMDCloudShareMessenger messageTargetUUID](self, "messageTargetUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v12, "initWithTarget:device:", v13, v9);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Send share invitation to device"));
  -[HMDCloudShareMessenger _sendShareInvitationData:toDestination:retryCount:activity:completion:](self, "_sendShareInvitationData:toDestination:retryCount:activity:completion:", v8, v14, 0, v15, v10);
  __HMFActivityScopeLeave();

}

- (void)requestShareInvitationDataFromUser:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Send request share invitation"));
  -[HMDCloudShareMessenger _requestShareInvitationDataFromUser:retryCount:activity:](self, "_requestShareInvitationDataFromUser:retryCount:activity:", v4, 0, v6);
  __HMFActivityScopeLeave();

}

- (void)notifyOfShareAccessRevocationForUser:(id)a3
{
  HMDRemoteMessage *v4;
  NSObject *v5;
  void *v6;
  HMDRemoteAccountMessageDestination *v7;
  void *v8;
  HMDRemoteAccountMessageDestination *v9;
  HMDRemoteMessage *v10;
  void *v11;
  HMDCloudShareMessenger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCloudShareMessenger *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  HMDRemoteMessage *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (HMDRemoteMessage *)a3;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDRemoteMessage accountHandle](v4, "accountHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [HMDRemoteAccountMessageDestination alloc];
    -[HMDCloudShareMessenger messageTargetUUID](self, "messageTargetUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v7, "initWithTarget:handle:multicast:", v8, v6, 1);

    v10 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("HMDCloudShareAccessRevokedMessage"), 17, v9, 0, 2, 0, 0.0);
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending share access revoked message: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCloudShareMessenger messageDispatcher](v12, "messageDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendMessage:", v10);

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
      v20 = 138543618;
      v21 = v19;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not notify of share access revocation for user with no account handle: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_sendShareInvitationData:(id)a3 toDestination:(id)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  HMDRemoteMessage *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDCloudShareMessenger *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  const __CFString *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v47 = CFSTR("invitationData");
  v48[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("HMDCloudShareInviteMessage"), 17, v13, v17, 0, 1, 0.0);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke;
  v35[3] = &unk_24E790970;
  v35[4] = self;
  v19 = v14;
  v36 = v19;
  v40 = a5;
  v20 = v15;
  v39 = v20;
  v21 = v12;
  v37 = v21;
  v22 = v13;
  v38 = v22;
  v23 = (void *)MEMORY[0x227676638](-[HMDRemoteMessage setResponseHandler:](v18, "setResponseHandler:", v35));
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v32 = v23;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shortDescription");
    v33 = v21;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFObject shortDescription](v18, "shortDescription");
    v29 = v20;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v26;
    v43 = 2114;
    v44 = v28;
    v45 = 2112;
    v46 = v30;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending CKShare invite message: %@", buf, 0x20u);

    v20 = v29;
    v21 = v33;

    v23 = v32;
    v17 = v34;
  }

  objc_autoreleasePoolPop(v23);
  -[HMDCloudShareMessenger messageDispatcher](v24, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sendMessage:", v18);

}

- (void)_requestShareInvitationDataFromUser:(id)a3 retryCount:(unint64_t)a4 activity:(id)a5
{
  HMDRemoteMessage *v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDRemoteAccountMessageDestination *v12;
  void *v13;
  HMDRemoteAccountMessageDestination *v14;
  HMDRemoteMessage *v15;
  HMDRemoteMessage *v16;
  void *v17;
  HMDCloudShareMessenger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCloudShareMessenger *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  HMDCloudShareMessenger *v30;
  id v31;
  HMDRemoteMessage *v32;
  unint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  HMDRemoteMessage *v37;
  __int16 v38;
  HMDRemoteMessage *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = (HMDRemoteMessage *)a3;
  v9 = a5;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[HMDRemoteMessage accountHandle](v8, "accountHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = [HMDRemoteAccountMessageDestination alloc];
    -[HMDCloudShareMessenger messageTargetUUID](self, "messageTargetUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:deviceCapabilities:](v12, "initWithTarget:handle:multicast:deviceCapabilities:", v13, v11, 0, 0);

    v15 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("HMDCloudShareRequestInviteMessage"), 17, v14, 0, 0, 1, 0.0);
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke;
    v29 = &unk_24E77A740;
    v30 = self;
    v31 = v9;
    v33 = a4;
    v16 = v8;
    v32 = v16;
    v17 = (void *)MEMORY[0x227676638](-[HMDRemoteMessage setResponseHandler:](v15, "setResponseHandler:", &v26));
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v20;
      v36 = 2112;
      v37 = v15;
      v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending request CKShare invite message %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDCloudShareMessenger messageDispatcher](v18, "messageDispatcher", v26, v27, v28, v29, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:", v15);

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not request share invitation data from user with no account handle: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }

}

- (void)handleShareInviteMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCloudShareMessenger *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCloudShareMessenger *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
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
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received share invite message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "messagePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("invitationData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDCloudShareMessenger delegate](v7, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __51__HMDCloudShareMessenger_handleShareInviteMessage___block_invoke;
    v19[3] = &unk_24E789D30;
    v19[4] = v7;
    v20 = v4;
    objc_msgSend(v12, "messenger:didReceiveInvitationData:completion:", v7, v11, v19);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to find invitation data in share invite message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);

  }
}

- (void)handleShareRequestInviteMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCloudShareMessenger *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCloudShareMessenger *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCloudShareMessenger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCloudShareMessenger *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received share share request invite message: %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCloudShareMessenger home](v7, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v4, "userForHome:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v4, "remoteSourceDevice");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[HMDCloudShareMessenger delegate](v7, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "messenger:didReceiveInvitationRequestFromUser:device:", v7, v12, v14);

        objc_msgSend(v4, "respondWithSuccess");
      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = v7;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543362;
          v30 = v27;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle share request invite message because requesting device cannot be determined", (uint8_t *)&v29, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v28);

        v14 = 0;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v7;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle share request invite message because requesting user cannot be determined", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v14);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle share request invite message because home reference is nil", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleShareRevokeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCloudShareMessenger *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareMessenger workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received share revoke message: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCloudShareMessenger delegate](v7, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messengerDidReceiveShareAccessRevocation:", v7);

  objc_msgSend(v4, "respondWithSuccess");
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCloudShareMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCloudShareMessengerDelegate)delegate
{
  return (HMDCloudShareMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (BOOL)isConfigured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (id)shareInvitationRetryHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setShareInvitationRetryHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareInvitationRetryHandler, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

void __51__HMDCloudShareMessenger_handleShareInviteMessage___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Delegate successfully accepted share invitation", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delegate failed to accept share invitation: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }

}

void __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_2;
  block[3] = &unk_24E796BC0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v3;
  v13 = v5;
  v7 = v6;
  v9 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v14 = v7;
  v16 = v8;
  v15 = v9;
  v10 = v3;
  dispatch_async(v4, block);

}

void __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, double);
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v31 = v5;
      v32 = 2114;
      v33 = v7;
      v34 = 2114;
      v35 = v8;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send request CKShare invite message: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    v9 = *(_QWORD *)(a1 + 64) == 3;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        v31 = v14;
        v32 = 2114;
        v33 = v16;
        v34 = 2048;
        v35 = v17;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send request share invitation message and reached retry limit %lu", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544130;
        v31 = v18;
        v32 = 2114;
        v33 = v20;
        v34 = 2048;
        v35 = 0x4072C00000000000;
        v36 = 2048;
        v37 = v21;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Will retry sending request CKShare invite message in %fs (already retried %lu time(s))", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "shareInvitationRetryHandler");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "workQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_39;
      v26[3] = &unk_24E795538;
      objc_copyWeak(v29, (id *)buf);
      v24 = *(id *)(a1 + 56);
      v25 = *(void **)(a1 + 64);
      v27 = v24;
      v29[1] = v25;
      v28 = *(id *)(a1 + 48);
      ((void (**)(_QWORD, void *, _QWORD *, double))v22)[2](v22, v23, v26, 300.0);

      objc_destroyWeak(v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __82__HMDCloudShareMessenger__requestShareInvitationDataFromUser_retryCount_activity___block_invoke_39(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isConfigured"))
    objc_msgSend(WeakRetained, "_requestShareInvitationDataFromUser:retryCount:activity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 40));

}

void __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_2;
  block[3] = &unk_24E791498;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v3;
  v13 = v5;
  v7 = v6;
  v9 = *(void **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v14 = v7;
  v18 = v8;
  v17 = v9;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v10 = v3;
  dispatch_async(v4, block);

}

void __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, double);
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v35 = v5;
      v36 = 2114;
      v37 = v7;
      v38 = 2114;
      v39 = v8;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send CKShare invite message: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    v9 = *(_QWORD *)(a1 + 80) == 3;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138543874;
        v35 = v14;
        v36 = 2114;
        v37 = v16;
        v38 = 2048;
        v39 = v17;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to send share invitation message and reached retry limit %lu", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      v18 = *(_QWORD *)(a1 + 72);
      if (v18)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v18 + 16))(v18, 0, *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138544130;
        v35 = v20;
        v36 = 2114;
        v37 = v22;
        v38 = 2048;
        v39 = 0x4072C00000000000;
        v40 = 2048;
        v41 = v23;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Will retry sending CKShare invite message in %fs (already retried %lu time(s))", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "shareInvitationRetryHandler");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "workQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_36;
      v28[3] = &unk_24E77A718;
      objc_copyWeak(v33, (id *)buf);
      v29 = *(id *)(a1 + 56);
      v26 = *(id *)(a1 + 64);
      v27 = *(void **)(a1 + 80);
      v30 = v26;
      v33[1] = v27;
      v31 = *(id *)(a1 + 48);
      v32 = *(id *)(a1 + 72);
      ((void (**)(_QWORD, void *, _QWORD *, double))v24)[2](v24, v25, v28, 300.0);

      objc_destroyWeak(v33);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 72);
    if (v19)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v19 + 16))(v19, 1, 0);
  }
}

void __96__HMDCloudShareMessenger__sendShareInvitationData_toDestination_retryCount_activity_completion___block_invoke_36(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(WeakRetained, "isConfigured"))
    objc_msgSend(WeakRetained, "_sendShareInvitationData:toDestination:retryCount:activity:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __85__HMDCloudShareMessenger_initWithMessageTargetUUID_workQueue_home_messageDispatcher___block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  int64_t v5;
  id v6;
  dispatch_time_t v7;
  NSObject *queue;

  v5 = (uint64_t)(a1 * 1000000000.0);
  v6 = a4;
  queue = a3;
  v7 = dispatch_time(0, v5);
  dispatch_after(v7, queue, v6);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_37647 != -1)
    dispatch_once(&logCategory__hmf_once_t24_37647, &__block_literal_global_41);
  return (id)logCategory__hmf_once_v25_37648;
}

void __37__HMDCloudShareMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_37648;
  logCategory__hmf_once_v25_37648 = v0;

}

@end
