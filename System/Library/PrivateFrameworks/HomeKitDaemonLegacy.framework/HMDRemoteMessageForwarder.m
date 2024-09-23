@implementation HMDRemoteMessageForwarder

- (HMDRemoteMessageForwarder)initWithHome:(id)a3 UUID:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDRemoteMessageForwarder *v11;
  HMDRemoteMessageForwarder *v12;
  uint64_t v13;
  NSUUID *UUID;
  uint64_t v15;
  NSMutableDictionary *messagesByIdentifier;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDRemoteMessageForwarder;
  v11 = -[HMDRemoteMessageForwarder init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v8);
    objc_storeStrong((id *)&v12->_contextUUID, a4);
    +[HMDRemoteMessageForwarder remoteMessageForwarderUUIDFromUUID:](HMDRemoteMessageForwarder, "remoteMessageForwarderUUIDFromUUID:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_workQueue, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    messagesByIdentifier = v12->_messagesByIdentifier;
    v12->_messagesByIdentifier = (NSMutableDictionary *)v15;

  }
  return v12;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  HMDRemoteMessageForwarder *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDRemoteMessageForwarder *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDRemoteMessageForwarder *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HMDRemoteMessageForwarder workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageForwarder UUID](v8, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDRemoteMessageForwarder with UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_storeStrong((id *)&v8->_messageDispatcher, a3);
  if (!v5)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v8;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Message dispatcher property is nil on HMDRemoteMessageForwarder", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
  -[HMDRemoteMessageForwarder home](v8, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v16, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageForwarder messageDispatcher](v8, "messageDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerForMessage:receiver:policies:selector:", CFSTR("HMDRemoteMessageForwarderResponseMessage"), v8, v19, sel_handleResponseMessage_);

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v8;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home property is nil on HMDRemoteMessageForwarder", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)redispatchToResidentMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDRemoteMessageForwarder *v7;
  NSObject *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  HMDRemoteMessageForwarder *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  HMDRemoteMessageForwarder *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRemoteMessageForwarder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Redispatching to resident message with name: %@, identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemoteMessageForwarder home](v7, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v4, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"));

    objc_msgSend(v13, "setMessagePayload:", v15);
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __57__HMDRemoteMessageForwarder_redispatchToResidentMessage___block_invoke;
    v30 = &unk_1E89BFD00;
    v31 = v7;
    v18 = v4;
    v32 = v18;
    objc_msgSend(v13, "setResponseHandler:", &v27);
    -[HMDRemoteMessageForwarder messagesByIdentifier](v7, "messagesByIdentifier", v27, v28, v29, v30, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

    -[HMDRemoteMessageForwarder contextUUID](v7, "contextUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageForwarder workQueue](v7, "workQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "redispatchToResidentMessage:target:responseQueue:", v13, v21, v22);

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v7;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home property is nil on HMDRemoteMessageForwarder", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (id)messageForForwardedMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDRemoteMessageForwarder *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDRemoteMessageForwarder *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMDRemoteMessageForwarder *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  HMDRemoteMessageForwarder *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRemoteMessageForwarder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Determining message for message with name: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "stringForKey:", CFSTR("HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRemote") && v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Message with original message identifier: %@, is remote, returning a copy and responding to the original.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "respondWithSuccess");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke;
    v25[3] = &unk_1E89BB158;
    v26 = v12;
    v27 = v14;
    v28 = v4;
    v18 = v4;
    v19 = v12;
    objc_msgSend(v17, "setResponseHandler:", v25);

    v4 = v17;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Message was not forwarded, returning as is.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

  return v4;
}

- (void)handleResponseMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMDRemoteMessageForwarder *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDRemoteMessageForwarder *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRemoteMessageForwarder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "respondWithSuccess");
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("HMDRemoteMessageForwarderPayloadKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMDRemoteMessageForwarderErrorKey"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "stringForKey:", CFSTR("HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v17;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling response message with name: %@, identifier: %@, originalMessageIdentifier: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDRemoteMessageForwarder messagesByIdentifier](v13, "messagesByIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "respondWithPayload:error:", v6, v8);
    -[HMDRemoteMessageForwarder messagesByIdentifier](v13, "messagesByIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v13;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v28 = v22;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find a cached message for message response with name: %@, identifier: %@", buf, 0x20u);

      v22 = v28;
    }

    objc_autoreleasePoolPop(v22);
  }

}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)contextUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)messagesByIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesByIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRemoteMessage *v10;
  HMDRemoteDeviceMessageDestination *v11;
  void *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
  HMDRemoteMessage *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("HMDRemoteMessageForwarderPayloadKey"));
  if (v5)
  {
    encodeRootObjectForIncomingXPCMessage(v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("HMDRemoteMessageForwarderErrorKey"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("HMDRemoteMessageForwarderErrorKey"));
  }
  objc_msgSend(a1[4], "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("HMDRemoteMessageForwarderOriginalMessageUUIDStringKey"));

  v10 = [HMDRemoteMessage alloc];
  v11 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(a1[5], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "remoteSourceDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v11, "initWithTarget:device:", v12, v13);
  v15 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:](v10, "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDRemoteMessageForwarderResponseMessage"), v14, v7, 0, 1, 0.0);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke_2;
  v28[3] = &unk_1E89BB158;
  v16 = a1[6];
  v28[4] = a1[5];
  v29 = v16;
  v30 = a1[4];
  v17 = (void *)MEMORY[0x1D17BA0A0](-[HMDRemoteMessage setResponseHandler:](v15, "setResponseHandler:", v28));
  v18 = a1[5];
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v5;
    v23 = a1[4];
    -[HMDRemoteMessage identifier](v15, "identifier");
    v26 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2112;
    v36 = v23;
    v5 = v22;
    v37 = 2112;
    v38 = v24;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending response message for message with name: %@, originalMessageIdentifier: %@, responseMessageIdentifier: %@", buf, 0x2Au);

    v17 = v26;
    v6 = v27;
  }

  objc_autoreleasePoolPop(v17);
  objc_msgSend(a1[5], "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v15);

}

void __56__HMDRemoteMessageForwarder_messageForForwardedMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 138544130;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to send response message for message with name: %@, originalMessageIdentifier: %@, error: %@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __57__HMDRemoteMessageForwarder_redispatchToResidentMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward message to resident: %@ with error: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "messagesByIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }

}

+ (id)remoteMessageForwarderUUIDFromUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("CB9FD9B1-29D4-4CA4-97DF-22611DF4AFEC"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_74793 != -1)
    dispatch_once(&logCategory__hmf_once_t13_74793, &__block_literal_global_74794);
  return (id)logCategory__hmf_once_v14_74795;
}

void __40__HMDRemoteMessageForwarder_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_74795;
  logCategory__hmf_once_v14_74795 = v0;

}

@end
