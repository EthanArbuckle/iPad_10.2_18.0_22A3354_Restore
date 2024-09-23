@implementation HMDEventTriggerSession

- (HMDEventTriggerSession)initWithSessionID:(id)a3 eventTrigger:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDEventTriggerSession *v15;
  HMDEventTriggerSession *v16;
  uint64_t v17;
  NSUUID *eventTriggerUUID;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSString *logString;
  void *v30;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)HMDEventTriggerSession;
  v15 = -[HMDEventTriggerSession init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeWeak((id *)&v16->_eventTrigger, v12);
    objc_msgSend(v12, "uuid");
    v17 = objc_claimAutoreleasedReturnValue();
    eventTriggerUUID = v16->_eventTriggerUUID;
    v16->_eventTriggerUUID = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_workQueue, a5);
    objc_storeStrong((id *)&v16->_msgDispatcher, a6);
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerSession sessionID](v16, "sessionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = v14;
    v24 = v13;
    v25 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@/%@/%@"), v19, v21, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    logString = v16->_logString;
    v16->_logString = (NSString *)v27;

    v11 = v25;
    v13 = v24;
    v14 = v23;

    -[HMDEventTriggerSession _registerForMessages](v16, "_registerForMessages");
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  HMDEventTriggerSession *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating the %@ session", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerSession eventTriggerUUID](v4, "eventTriggerUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeBulletinsForTrigger:", v11);

  v12.receiver = v4;
  v12.super_class = (Class)HMDEventTriggerSession;
  -[HMDEventTriggerSession dealloc](&v12, sel_dealloc);
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerSession sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uuid"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDEventTriggerSession logString](self, "logString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerSession sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Event Trigger Session: %@/%@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)sendResidentMessage:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryResident");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "supportsSharedEventTriggerActivation"))
    v15 = -[HMDEventTriggerSession sendMessage:payload:device:responseHandler:](self, "sendMessage:payload:device:responseHandler:", v8, v9, v14, v10);
  else
    v15 = 0;

  return v15;
}

- (BOOL)sendMessage:(id)a3 payload:(id)a4 device:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HMDEventTriggerSession sessionID](self, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDEventTriggerSession sendMessage:payload:device:target:responseHandler:](self, "sendMessage:payload:device:target:responseHandler:", v13, v12, v11, v14, v10);

  return (char)self;
}

- (BOOL)sendMessage:(id)a3 payload:(id)a4 device:(id)a5 target:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  HMDEventTriggerSession *v25;
  NSObject *v26;
  void *v27;
  BOOL v29;
  void *context;
  id v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "homeManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:]([HMDRemoteDeviceMessageDestination alloc], "initWithTarget:device:", v15, v14);
  if (v21)
    v22 = v20 == 0;
  else
    v22 = 1;
  v23 = !v22;
  if (!v22)
  {
    v31 = v13;
    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v12, 25, v21, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x227676638](objc_msgSend(v24, "setResponseHandler:", v16));
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v32;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ with identifier %@", buf, 0x20u);

      v23 = v29;
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend(v20, "sendMessage:completionHandler:", v24, 0);

    v13 = v31;
  }

  return v23;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (NSString)logString
{
  return self->_logString;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDEventTrigger)eventTrigger
{
  return (HMDEventTrigger *)objc_loadWeakRetained((id *)&self->_eventTrigger);
}

- (void)setEventTrigger:(id)a3
{
  objc_storeWeak((id *)&self->_eventTrigger, a3);
}

- (NSUUID)eventTriggerUUID
{
  return self->_eventTriggerUUID;
}

- (HMDDevice)currentDevice
{
  return self->_currentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_eventTriggerUUID, 0);
  objc_destroyWeak((id *)&self->_eventTrigger);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_logString, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_95711 != -1)
    dispatch_once(&logCategory__hmf_once_t1_95711, &__block_literal_global_95712);
  return (id)logCategory__hmf_once_v2_95713;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

void __37__HMDEventTriggerSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_95713;
  logCategory__hmf_once_v2_95713 = v0;

}

@end
