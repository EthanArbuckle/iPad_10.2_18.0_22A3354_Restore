@implementation HMDRemoteEventRouterResidentClient

- (id)initWitAccessoryUUID:(id)a3 homeUUID:(id)a4 queue:(id)a5 dataSource:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 storeReadHandle:(id)a12 storeWriteHandle:(id)a13 retryIntervalProvider:(id)a14 logCategory:(const char *)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  HMDRemoteEventRouterResidentClient *v27;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v39;
  id v40;
  objc_super v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  const char *v47;

  v40 = a4;
  v19 = a5;
  v20 = a12;
  v35 = a13;
  v33 = a14;
  v32 = a11;
  v30 = a10;
  v31 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __259__HMDRemoteEventRouterResidentClient_initWitAccessoryUUID_homeUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke;
  v42[3] = &unk_1E89AD480;
  v26 = v19;
  v43 = v26;
  v39 = v20;
  v44 = v39;
  v36 = v35;
  v45 = v36;
  v34 = v33;
  v46 = v34;
  v47 = a15;
  v41.receiver = self;
  v41.super_class = (Class)HMDRemoteEventRouterResidentClient;
  v27 = -[HMDRemoteEventRouterClient initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:](&v41, sel_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_logCategory_logEventSubmitter_eventRouterClientFactory_, v24, v26, v23, v22, v21, v31, v30, v32, a15, v25, v42);

  if (v27)
    objc_storeStrong((id *)&v27->_homeUUID, a4);

  return v27;
}

- (void)configureIsPrimaryResident:(BOOL)a3 networkAvailable:(BOOL)a4 additionalPolicies:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteEventRouterResidentClient;
  -[HMDRemoteEventRouterClient configureIsPrimaryResident:networkAvailable:additionalPolicies:](&v6, sel_configureIsPrimaryResident_networkAvailable_additionalPolicies_, a3, a4, a5);
  -[HMDRemoteEventRouterResidentClient _registerForNotifications](self, "_registerForNotifications");
}

- (void)_registerForNotifications
{
  void *v3;
  id v4;

  -[HMDRemoteEventRouterClient notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleAccessoryDeviceDidUpdateNotification_, CFSTR("HMDAppleMediaAccessoryDeviceUpdatedNotification"), 0);

  -[HMDRemoteEventRouterClient notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentReceivedIncomingConnection_, CFSTR("RemoteEventRouterServerDidReceiveConnectionToPrimary"), 0);

}

- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__HMDRemoteEventRouterResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryDeviceDidUpdateNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDRemoteEventRouterResidentClient accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hmf_isEqualToUUID:", v7);

  if (v9)
  {
    -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__HMDRemoteEventRouterResidentClient_handleAccessoryDeviceDidUpdateNotification___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v10, block);

  }
}

- (void)handlePrimaryResidentReceivedIncomingConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idsIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterResidentClient accessoryUUID](self, "accessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "client:isIdsIdentifier:ofAccessory:", self, v7, v9);

    if (v10)
    {
      -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__HMDRemoteEventRouterResidentClient_handlePrimaryResidentReceivedIncomingConnection___block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = self;
      dispatch_async(v11, block);

    }
  }

}

- (BOOL)clientIsEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  if (self)
  {
    -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    -[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(self) = v6 == v4 && -[HMDRemoteEventRouterClient isPrimaryResident](self, "isPrimaryResident");
  }

  return (char)self;
}

- (id)dumpStateDescription
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteEventRouterResidentClient;
  -[HMDRemoteEventRouterClient dumpStateDescription](&v6, sel_dumpStateDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDRemoteEventRouterResidentClient: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)client:(id)a3 upstreamTopicsForTopic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[HMDRemoteEventRouterResidentClient homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterResidentClient accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeEventsGenerated upstreamHomeAndAccessoryTopicsForTopic:homeUUID:accessoryUUID:](HMDHomeEventsGenerated, "upstreamHomeAndAccessoryTopicsForTopic:homeUUID:accessoryUUID:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)forwardingTopicsForTopics:(id)a3 downstreamRouter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[HMDRemoteEventRouterResidentClient accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterResidentClient homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryEventsGenerated forwardingTopicsForTopics:residentAccessoryUUID:homeUUID:](HMDAccessoryEventsGenerated, "forwardingTopicsForTopics:residentAccessoryUUID:homeUUID:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

void __86__HMDRemoteEventRouterResidentClient_handlePrimaryResidentReceivedIncomingConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 112))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Primary resident received incoming connection from client reset connection timer.", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "eventRouterClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetReconnectTimerToInitialState");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
  }
}

void __81__HMDRemoteEventRouterResidentClient_handleAccessoryDeviceDidUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory device updated, kicking event router client", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "eventRouterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionCapabilityDidChange");

}

void __103__HMDRemoteEventRouterResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Resident Client received primary resident change notification %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(_QWORD *)(a1 + 40);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)HMDRemoteEventRouterResidentClient;
  objc_msgSendSuper2(&v9, sel_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification_, v7);
  objc_msgSend(*(id *)(a1 + 32), "eventRouterClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectionCapabilityDidChange");

}

HMDRemoteEventRouterClient *__259__HMDRemoteEventRouterResidentClient_initWitAccessoryUUID_homeUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke(_QWORD *a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:](HMDRemoteEventRouterClient, "routerClientWithQueue:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

@end
