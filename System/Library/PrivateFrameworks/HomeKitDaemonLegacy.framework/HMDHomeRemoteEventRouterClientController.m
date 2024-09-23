@implementation HMDHomeRemoteEventRouterClientController

- (HMDHomeRemoteEventRouterClientController)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 requestMessageName:(id)a6 updateMessageName:(id)a7 multiHopFetchResponseMessageName:(id)a8 clientUserMessagePolicy:(id)a9 currentAccessoryUUID:(id)a10 assertionController:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDHomeRemoteEventRouterClientFactory *v22;
  id v23;
  id v24;
  void *v26;
  id v27;
  id v28;
  void *v30;
  HMDHomeRemoteEventRouterClientController *v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v15 = a3;
  v16 = a4;
  v28 = a11;
  v27 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = objc_alloc_init(HMDHomeRemoteEventRouterClientFactory);
  +[HMDSecureRemoteMessageTransport defaultTransport](HMDSecureRemoteMessageTransport, "defaultTransport");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "startFuture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __226__HMDHomeRemoteEventRouterClientController_initWithMessageTargetUUID_workQueue_dataSource_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_clientUserMessagePolicy_currentAccessoryUUID_assertionController___block_invoke;
  v33[3] = &unk_1E89A6CC0;
  v34 = v15;
  v35 = v16;
  v23 = v16;
  v24 = v15;
  v32 = -[HMDHomeRemoteEventRouterClientController initWithMessageTargetUUID:workQueue:dataSource:routerClientFactory:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:clientUserMessagePolicy:currentAccessoryUUID:assertionController:remoteTransportStartFuture:delegatingRouterFactory:](self, "initWithMessageTargetUUID:workQueue:dataSource:routerClientFactory:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:clientUserMessagePolicy:currentAccessoryUUID:assertionController:remoteTransportStartFuture:delegatingRouterFactory:", v24, v23, v21, v22, v20, v19, v18, v17, v27, v28, v26, v33);

  return v32;
}

- (HMDHomeRemoteEventRouterClientController)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 routerClientFactory:(id)a6 requestMessageName:(id)a7 updateMessageName:(id)a8 multiHopFetchResponseMessageName:(id)a9 clientUserMessagePolicy:(id)a10 currentAccessoryUUID:(id)a11 assertionController:(id)a12 remoteTransportStartFuture:(id)a13 delegatingRouterFactory:(id)a14
{
  id v19;
  id v20;
  void (**v21)(id, HMDHomeRemoteEventRouterClientController *);
  HMDHomeRemoteEventRouterClientController *v22;
  HMDHomeRemoteEventRouterClientController *v23;
  uint64_t v24;
  NSMutableArray *residentClients;
  uint64_t v26;
  HMEDelegatingEventRouter *residentDelegatingEventRouter;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  HMDRemoteEventRouterPrimaryResidentClient *remoteEventRouterPrimaryResidentClient;
  HMDRemoteEventRouterPrimaryResidentClient *v34;
  uint64_t v35;
  uint64_t v36;
  SEL v37;
  void *v38;
  void (**v39)(id, HMDHomeRemoteEventRouterClientController *);
  id v40;
  void *v41;
  HMEDelegatingEventRouter *v42;
  void *v43;
  void *v44;
  HMEDelegatingEventRouter *v45;
  id obj;
  void *v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;
  id v63[3];

  v63[1] = *(id *)MEMORY[0x1E0C80C00];
  v61 = a3;
  obj = a4;
  v60 = a4;
  v55 = a5;
  v19 = a8;
  v59 = a6;
  v58 = a7;
  v57 = a8;
  v56 = a9;
  v54 = a10;
  v53 = a11;
  v20 = a12;
  v52 = a13;
  v21 = (void (**)(id, HMDHomeRemoteEventRouterClientController *))a14;
  v62.receiver = self;
  v62.super_class = (Class)HMDHomeRemoteEventRouterClientController;
  v22 = -[HMDHomeRemoteEventRouterClientController init](&v62, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v22->_workQueue, obj);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    residentClients = v23->_residentClients;
    v23->_residentClients = (NSMutableArray *)v24;

    objc_storeStrong((id *)&v23->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v23->_currentAccessoryUUID, a11);
    objc_storeWeak((id *)&v23->_dataSource, v55);
    objc_storeStrong((id *)&v23->_requestMessageName, a7);
    objc_storeStrong((id *)&v23->_updateMessageName, v19);
    objc_storeStrong((id *)&v23->_multiHopFetchResponseMessageName, a9);
    objc_storeStrong((id *)&v23->_clientUserMessagePolicy, a10);
    objc_storeStrong((id *)&v23->_routerClientFactory, a6);
    v21[2](v21, v23);
    v26 = objc_claimAutoreleasedReturnValue();
    residentDelegatingEventRouter = v23->_residentDelegatingEventRouter;
    v23->_residentDelegatingEventRouter = (HMEDelegatingEventRouter *)v26;

    objc_storeStrong((id *)&v23->_remoteTransportStartFuture, a13);
    objc_msgSend(v55, "messageDispatcherForRemoteEventRouterClientController:", v23);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "notificationCenterForRemoteEventRouterClientController:", v23);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v20;
    objc_msgSend(v55, "eventStoreReadHandleForRemoteEventRouterClientController:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "eventStoreWriteHandleForRemoteEventRouterClientController:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v28;
    objc_msgSend(v59, "primaryResidentClientWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:", v61, v60, v23, v28, v49, v58, v57, v56, v29, v30);
    v32 = objc_claimAutoreleasedReturnValue();
    remoteEventRouterPrimaryResidentClient = v23->_remoteEventRouterPrimaryResidentClient;
    v23->_remoteEventRouterPrimaryResidentClient = (HMDRemoteEventRouterPrimaryResidentClient *)v32;

    v34 = v23->_remoteEventRouterPrimaryResidentClient;
    v35 = -[HMDHomeRemoteEventRouterClientController isCurrentDevicePrimaryResident](v23, "isCurrentDevicePrimaryResident");
    v36 = -[HMDHomeRemoteEventRouterClientController isNetworkAvailable](v23, "isNetworkAvailable");
    v63[0] = objc_getProperty(v23, v37, 80, 1);
    v38 = (void *)MEMORY[0x1E0C99D20];
    v39 = v21;
    v40 = v63[0];
    objc_msgSend(v38, "arrayWithObjects:count:", v63, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterClient configureIsPrimaryResident:networkAvailable:additionalPolicies:](v34, "configureIsPrimaryResident:networkAvailable:additionalPolicies:", v35, v36, v41);

    objc_msgSend(v51, "registerClient:", v23->_remoteEventRouterPrimaryResidentClient);
    v42 = v23->_residentDelegatingEventRouter;
    -[HMDRemoteEventRouterClient eventRouter](v23->_remoteEventRouterPrimaryResidentClient, "eventRouter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "synchronousSubscriptionProvider");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v42;
    v21 = v39;
    -[HMEDelegatingEventRouter registerSubRouter:](v45, "registerSubRouter:", v44);

    -[HMDHomeRemoteEventRouterClientController _sendNetworkAvailableOnStartingMessaging:]((uint64_t)v23, v23->_remoteEventRouterPrimaryResidentClient);
    v20 = v51;

  }
  return v23;
}

- (NSUUID)homeUUID
{
  if (self)
    self = (HMDHomeRemoteEventRouterClientController *)objc_getProperty(self, a2, 40, 1);
  return (NSUUID *)self;
}

- (void)updateCurrentAccessoryUUID:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HMDHomeRemoteEventRouterClientController_updateCurrentAccessoryUUID___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)createResidentRouterForAccessoryUUID:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__HMDHomeRemoteEventRouterClientController_createResidentRouterForAccessoryUUID___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)removeResidentRouterForAccessoryUUID:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__HMDHomeRemoteEventRouterClientController_removeResidentRouterForAccessoryUUID___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)networkAvailabilityDidChange:(BOOL)a3
{
  HMDHomeRemoteEventRouterClientController *v4;
  _QWORD v5[5];
  BOOL v6;

  v4 = self;
  if (self)
    self = (HMDHomeRemoteEventRouterClientController *)objc_getProperty(self, a2, 32, 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__HMDHomeRemoteEventRouterClientController_networkAvailabilityDidChange___block_invoke;
  v5[3] = &unk_1E89C2758;
  v5[4] = v4;
  v6 = a3;
  dispatch_async(&self->super, v5);
}

- (BOOL)isPrimaryResidentClientConnected
{
  if (self)
    self = (HMDHomeRemoteEventRouterClientController *)objc_getProperty(self, a2, 96, 1);
  return -[HMDHomeRemoteEventRouterClientController isConnected](self, "isConnected");
}

- (id)dumpStateDescription
{
  const char *v3;
  void *v4;
  void *v5;
  SEL v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("[HMDHomeRemoteEventRouterClientController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 96, 1), "dumpStateDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" primary resident client:%@"), v5);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    Property = objc_getProperty(self, v6, 104, 1);
  }
  else
  {
    objc_msgSend(0, "dumpStateDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" primary resident client:%@"), v16);

    Property = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
  }
  v8 = Property;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "dumpStateDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" resident client:%@"), v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "appendString:", CFSTR("]"));
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (void)fetchWithFilters:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 32, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HMDHomeRemoteEventRouterClientController_fetchWithFilters_completion___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(Property, block);

}

- (id)routerClientMessageDestination:(id)a3 serverIdentifier:(id *)a4
{
  const char *v6;
  id v7;
  NSObject *Property;
  SEL v9;
  id v10;
  SEL v11;
  const char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  HMDRemoteDeviceMessageDestination *v23;
  void *v24;
  HMDHomeRemoteEventRouterClientController *v25;
  NSObject *v26;
  void *v27;
  id *v29;
  id WeakRetained;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v6, 32, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v10 = objc_getProperty(self, v9, 40, 1);
    if (objc_getProperty(self, v11, 96, 1) != v7)
    {
      v29 = a4;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = objc_getProperty(self, v12, 104, 1);
      goto LABEL_4;
    }
  }
  else
  {
    v29 = a4;
    dispatch_assert_queue_V2(0);
    if (v7)
    {
      v10 = 0;
      WeakRetained = 0;
      v13 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
LABEL_4:
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v18)
              objc_enumerationMutation(v14);
            if (*(id *)(*((_QWORD *)&v31 + 1) + 8 * i) == v7)
            {
              objc_msgSend(v7, "accessoryUUID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "deviceForAccessoryUUID:forRemoteEventRouterClientController:", v20, self);
              v21 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "identifier");
              v22 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v21;
              v10 = (id)v22;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v16);
      }
      else
      {
        v17 = 0;
      }

      a4 = v29;
      if (v17)
        goto LABEL_16;
      goto LABEL_21;
    }
    WeakRetained = 0;
    v10 = 0;
  }
  objc_msgSend(WeakRetained, "deviceForPrimaryResidentForRemoteEventRouterClientController:", self, v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
LABEL_16:
    objc_msgSend(v17, "identifier", v29);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:]([HMDRemoteDeviceMessageDestination alloc], "initWithTarget:device:", v10, v17);
    goto LABEL_24;
  }
LABEL_21:
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v27;
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine destination for event router client: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v23 = 0;
LABEL_24:

  return v23;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  id WeakRetained;
  char v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  v4 = objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResidentForRemoteEventRouterClientController:", self);

  return v4;
}

- (BOOL)isNetworkAvailable
{
  id WeakRetained;
  char v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  v4 = objc_msgSend(WeakRetained, "isNetworkAvailableForRemoteEventRouterClientController:", self);

  return v4;
}

- (id)routerClientPrimaryResidentDeviceIdentifier:(id)a3
{
  id WeakRetained;
  void *v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "primaryResidentDeviceIdentifierForRemoteEventRouterClientController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)primaryResidentChangeMonitorForRouterClient:(id)a3
{
  id WeakRetained;
  void *v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "primaryResidentChangeMonitorForRemoteEventRouterClientController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)routerClientSupportsFragmentMessageForServerIdentifier:(id)a3
{
  return 1;
}

- (BOOL)routerClientShouldRestrictMessagingToLocalOnly:(id)a3
{
  return 0;
}

- (id)client:(id)a3 forwardingTopicsForTopics:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[HMDHomeRemoteEventRouterClientController homeManager](self, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeEventsGenerated expandedTopicsWithTopics:homeManager:](HMDHomeEventsGenerated, "expandedTopicsWithTopics:homeManager:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)discoverPrimaryResidentForEventRouterClient:(id)a3
{
  HMDHomeRemoteEventRouterClientController *v3;
  HMDHomeRemoteEventRouterClientController *v4;

  v3 = self;
  if (self)
    self = (HMDHomeRemoteEventRouterClientController *)objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = self;
  -[HMDHomeRemoteEventRouterClientController discoverPrimaryResidentForEventRouterClientController:](self, "discoverPrimaryResidentForEventRouterClientController:", v3);

}

- (BOOL)clientIsEnabled:(id)a3
{
  id WeakRetained;
  char v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  v5 = objc_msgSend(WeakRetained, "isCurrentUserRestrictedForRemoteEventRouterClientController:", self) ^ 1;

  return v5;
}

- (BOOL)client:(id)a3 isIdsIdentifier:(id)a4 ofAccessory:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v7 = a4;
  v8 = a5;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "deviceForAccessoryUUID:forRemoteEventRouterClientController:", v8, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hmf_isEqualToUUID:", v7);

  return v13;
}

- (void)client:(id)a3 connectionStatusDidChange:(BOOL)a4
{
  _BOOL8 v4;
  char isKindOfClass;
  void *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v9 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v9;
  if (v9 && (isKindOfClass & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "clientController:connectionStatusDidChange:", self, v4);

    v7 = v9;
  }

}

- (void)client:(id)a3 connectDidFailWithError:(id)a4
{
  id v6;
  char isKindOfClass;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v9 && (isKindOfClass & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "clientController:primaryClientConnectMessageFailWithError:", self, v6);

  }
}

- (void)client:(id)a3 didReceiveFetchedCachedEvents:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "clientController:didReceiveFetchedCachedEvents:source:", self, v6, self);

}

- (BOOL)isCachedEventSourceCurrentProcess
{
  return 0;
}

- (id)delegatingRouter:(id)a3 filteredTopics:(id)a4 forRouter:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  id v11;
  id Property;
  id v13;
  const char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v11 = v9;
  if (!v11)
  {
LABEL_19:
    v23 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  if (self)
    Property = objc_getProperty(self, v10, 96, 1);
  else
    Property = 0;
  objc_msgSend(Property, "eventRouterClient");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v13)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    if (self)
      v15 = objc_getProperty(self, v14, 104, 1);
    else
      v15 = 0;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v21, "eventRouterClient", (_QWORD)v29);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 == v11)
          {
            objc_msgSend(v21, "accessoryUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDHomeRemoteEventRouterClientController homeUUID](self, "homeUUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDAccessoryEventsGenerated forwardingTopicsForTopics:residentAccessoryUUID:homeUUID:](HMDAccessoryEventsGenerated, "forwardingTopicsForTopics:residentAccessoryUUID:homeUUID:", v7, v24, v25);
            v23 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v18)
          continue;
        break;
      }
    }

    goto LABEL_19;
  }
  if (self && (v26 = objc_getProperty(self, v14, 112, 1)) != 0)
  {
    v16 = v26;
    +[HMDAccessoryEventsGenerated topicsRemovingAccessoryTopics:accessoryUUID:](HMDAccessoryEventsGenerated, "topicsRemovingAccessoryTopics:accessoryUUID:", v7, objc_getProperty(self, v27, 112, 1));
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  }
  else
  {
    v23 = v7;
  }
LABEL_25:

  return v23;
}

- (id)delegatingRouter:(id)a3 upstreamTopicsFor:(id)a4
{
  return +[HMDHomeEventsGenerated upstreamTopicsForTopic:](HMDHomeEventsGenerated, "upstreamTopicsForTopic:", a4);
}

- (void)delegatingRouter:(id)a3 fetchCachedEventsForTopics:(id)a4 forRouter:(id)a5 cachedEventCollection:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  uint64_t v18;
  const char *v19;
  HMDHomeRemoteEventRouterClientController *v20;
  id Property;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[6];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[HMDHomeRemoteEventRouterClientController isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (!v14
      || (!self ? (v16 = 0) : (v16 = objc_getProperty(self, v15, 96, 1)),
          objc_msgSend(v16, "eventRouterClient"),
          v17 = (id)objc_claimAutoreleasedReturnValue(),
          v17,
          v14 == v17))
    {
      v18 = (uint64_t)v9;
    }
    else
    {
      objc_msgSend(v9, "na_filter:", &__block_literal_global_80);
      v18 = objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v10;
      if (self)
      {
        v20 = self;
        Property = objc_getProperty(self, v19, 104, 1);
      }
      else
      {
        v20 = 0;
        Property = 0;
      }
      v22 = Property;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v27, "eventRouterClient", v30);
            v28 = (id)objc_claimAutoreleasedReturnValue();

            if (v14 == v28)
            {
              objc_msgSend(v11, "willAddAdditionalEvents");
              objc_msgSend(v27, "eventRouterClient");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke_2;
              v31[3] = &unk_1E89A6DC0;
              v31[4] = v20;
              v31[5] = v27;
              v32 = v11;
              objc_msgSend(v27, "client:fetchWithFilters:isMultiHop:completion:", v29, v18, 0, v31);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v24);
      }

      v10 = v30;
    }

    v9 = (id)v18;
  }

}

- (HMEDelegatingEventRouter)residentDelegatingEventRouter
{
  return (HMEDelegatingEventRouter *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTransportStartFuture, 0);
  objc_storeStrong((id *)&self->_currentAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_residentClients, 0);
  objc_storeStrong((id *)&self->_remoteEventRouterPrimaryResidentClient, 0);
  objc_storeStrong((id *)&self->_routerClientFactory, 0);
  objc_storeStrong((id *)&self->_clientUserMessagePolicy, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_multiHopFetchResponseMessageName, 0);
  objc_storeStrong((id *)&self->_updateMessageName, 0);
  objc_storeStrong((id *)&self->_requestMessageName, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_residentDelegatingEventRouter, 0);
}

void __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v17 = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch events from router: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  v15 = *(void **)(a1 + 48);
  objc_msgSend(v8, "na_map:", &__block_literal_global_83);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEventInfoItems:", v16);

  objc_msgSend(*(id *)(a1 + 48), "didFinishAddingAdditionalEvents");
}

id __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D32D30];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithEvent:topic:", v5, v6);

  return v7;
}

uint64_t __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIndexTopic") ^ 1;

  return v3;
}

void __72__HMDHomeRemoteEventRouterClientController_fetchWithFilters_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const char *v3;
  NSObject *Property;
  const char *v5;
  NSObject *v6;
  SEL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SEL v18;
  NSObject *v19;
  id v20;
  SEL v21;
  void *v22;
  id v23;
  id obj;
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[6];
  NSObject *v30;
  _QWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v25 = *(id *)(a1 + 40);
  v23 = v2;
  if (v1)
  {
    Property = objc_getProperty(v1, v3, 32, 1);
    dispatch_assert_queue_V2(Property);
    if ((objc_msgSend(v1, "isCurrentDevicePrimaryResident") & 1) != 0)
    {
      v6 = dispatch_group_create();
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__20726;
      v36[4] = __Block_byref_object_dispose__20727;
      v37 = 0;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = objc_getProperty(v1, v7, 104, 1);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v33;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v33 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
            objc_msgSend(v1, "residentDelegatingEventRouter");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "eventRouter");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "synchronousSubscriptionProvider");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1, "delegatingRouter:filteredTopics:forRouter:", v12, v25, v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "na_filter:", &__block_literal_global_20728);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "count"))
            {
              dispatch_group_enter(v6);
              objc_msgSend(v11, "eventRouterClient");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v29[0] = MEMORY[0x1E0C809B0];
              v29[1] = 3221225472;
              v29[2] = __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_3;
              v29[3] = &unk_1E89A6D58;
              v31 = v36;
              v29[4] = v1;
              v29[5] = v11;
              v30 = v6;
              objc_msgSend(v11, "client:fetchWithFilters:isMultiHop:completion:", v17, v16, 0, v29);

            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v8);
      }

      v19 = objc_getProperty(v1, v18, 32, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_74;
      block[3] = &unk_1E89BCAA8;
      v27 = v23;
      v28 = v36;
      dispatch_group_notify(v6, v19, block);

      _Block_object_dispose(v36, 8);
    }
    else
    {
      v20 = objc_getProperty(v1, v5, 96, 1);
      objc_msgSend(objc_getProperty(v1, v21, 96, 1), "eventRouterClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke;
      v38[3] = &unk_1E89A6D10;
      v39 = v23;
      objc_msgSend(v20, "client:fetchWithFilters:isMultiHop:completion:", v22, v25, 1, v38);

      v6 = v39;
    }

  }
}

uint64_t __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(_QWORD *)(v11 + 40);
  v12 = (id *)(v11 + 40);
  if (!v13)
    objc_storeStrong(v12, a4);
  os_unfair_lock_unlock(v10);
  if (v9)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch events from router: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIndexTopic") ^ 1;

  return v3;
}

uint64_t __73__HMDHomeRemoteEventRouterClientController_networkAvailabilityDidChange___block_invoke(uint64_t result, const char *a2)
{
  void *v2;
  int v3;
  NSObject *Property;
  SEL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SEL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(result + 32);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(result + 40);
    Property = objc_getProperty(*(id *)(result + 32), a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_getProperty(v2, v5, 104, 1);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "networkAvailabilityDidChange:", v3 != 0, (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    return objc_msgSend(objc_getProperty(v2, v11, 96, 1), "networkAvailabilityDidChange:", v3 != 0);
  }
  return result;
}

void __81__HMDHomeRemoteEventRouterClientController_removeResidentRouterForAccessoryUUID___block_invoke(uint64_t a1)
{
  id *v1;
  const char *v2;
  id v3;
  NSObject *Property;
  id WeakRetained;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id *v23;
  NSObject *v24;
  void *v25;
  SEL v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 32, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained(v1 + 9);
    v6 = WeakRetained;
    if (WeakRetained)
    {
      if (objc_msgSend(WeakRetained, "isMessagedHomepodSettingsEnabledForClientController:", v1)
        && objc_msgSend(v6, "isCurrentDeviceResidentCapableForRemoteEventRouterClientController:", v1))
      {
        v27 = v6;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v8 = (void *)objc_msgSend(objc_getProperty(v1, v7, 104, 1), "copy");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v14, "accessoryUUID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "hmf_isEqualToUUID:", v3);

              if (v16)
              {
                v17 = v14;

                v11 = v17;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
          }
          while (v10);
        }
        else
        {
          v11 = 0;
        }

        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = v1;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v32 = 138543874;
          v33 = v25;
          v34 = 2112;
          v35 = v11;
          v36 = 2112;
          v37 = v3;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Removing %@ client resident event router(s) for accessory: %@", v32, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(objc_getProperty(v23, v26, 104, 1), "removeObject:", v11);

        v6 = v27;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v21;
        v40 = 2112;
        v41 = v3;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot create resident router for accessory: %@ due to nil datasource", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }

  }
}

void __81__HMDHomeRemoteEventRouterClientController_createResidentRouterForAccessoryUUID___block_invoke(uint64_t a1)
{
  id *v1;
  const char *v2;
  id v3;
  NSObject *Property;
  id WeakRetained;
  void *v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  SEL v17;
  id v18;
  SEL v19;
  id v20;
  SEL v21;
  id v22;
  SEL v23;
  id v24;
  SEL v25;
  id v26;
  SEL v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  SEL v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SEL v38;
  uint64_t v39;
  void *v40;
  id *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  id v65;
  uint8_t v66[4];
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 32, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained(v1 + 9);
    v6 = WeakRetained;
    if (WeakRetained)
    {
      if (objc_msgSend(WeakRetained, "isMessagedHomepodSettingsEnabledForClientController:", v1)
        && objc_msgSend(v6, "isCurrentDeviceResidentCapableForRemoteEventRouterClientController:", v1))
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v8 = objc_getProperty(v1, v7, 104, 1);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v56;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v56 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "accessoryUUID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "hmf_isEqualToUUID:", v3);

              if (v14)
              {
                v48 = (void *)MEMORY[0x1D17BA0A0]();
                v49 = v1;
                HMFGetOSLogHandle();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v60 = v51;
                  v61 = 2112;
                  v62 = v3;
                  _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@Not creating resident router for accessory (%@) as it already exists.", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v48);

                goto LABEL_22;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
            if (v10)
              continue;
            break;
          }
        }

        objc_msgSend(v6, "messageDispatcherForRemoteEventRouterClientController:", v1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationCenterForRemoteEventRouterClientController:", v1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "eventStoreReadHandleForRemoteEventRouterClientController:", v1);
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "eventStoreWriteHandleForRemoteEventRouterClientController:", v1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_getProperty(v1, v17, 88, 1);
        v20 = objc_getProperty(v1, v19, 40, 1);
        v22 = objc_getProperty(v1, v21, 32, 1);
        v24 = objc_getProperty(v1, v23, 48, 1);
        v26 = objc_getProperty(v1, v25, 56, 1);
        v52 = (void *)v15;
        objc_msgSend(v18, "residentClientWithAccessoryUUID:homeUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:", v3, v20, v22, v1, v54, v53, v24, v26, objc_getProperty(v1, v27, 64, 1), v15, v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v1, "isCurrentDevicePrimaryResident");
        v30 = objc_msgSend(v1, "isNetworkAvailable");
        v65 = objc_getProperty(v1, v31, 80, 1);
        v32 = (void *)MEMORY[0x1E0C99D20];
        v33 = v65;
        objc_msgSend(v32, "arrayWithObjects:count:", &v65, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "configureIsPrimaryResident:networkAvailable:additionalPolicies:", v29, v30, v34);
        -[HMDHomeRemoteEventRouterClientController _sendNetworkAvailableOnStartingMessaging:]((uint64_t)v1, v28);
        objc_msgSend(v1, "residentDelegatingEventRouter");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "eventRouter");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "synchronousSubscriptionProvider");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "registerSubRouter:", v37);

        v39 = objc_msgSend(objc_getProperty(v1, v38, 104, 1), "addObject:", v28);
        v40 = (void *)MEMORY[0x1D17BA0A0](v39);
        v41 = v1;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = v43;
          v61 = 2112;
          v62 = v3;
          v63 = 2112;
          v64 = v28;
          _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Created resident router for accessory: %@, client: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v40);

      }
    }
    else
    {
      v44 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v1;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v66 = 138543618;
        v67 = v47;
        v68 = 2112;
        v69 = v3;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot create resident router for accessory: %@ due to nil datasource", v66, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
    }
LABEL_22:

  }
}

- (void)_sendNetworkAvailableOnStartingMessaging:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__20726;
  v9[4] = __Block_byref_object_dispose__20727;
  v4 = *(id *)(a1 + 120);
  v10 = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__HMDHomeRemoteEventRouterClientController__sendNetworkAvailableOnStartingMessaging___block_invoke;
  v6[3] = &unk_1E89A6CE8;
  v6[4] = a1;
  v5 = v3;
  v7 = v5;
  v8 = v9;
  objc_msgSend(v4, "getResultWithCompletion:", v6);

  _Block_object_dispose(v9, 8);
}

void __85__HMDHomeRemoteEventRouterClientController__sendNetworkAvailableOnStartingMessaging___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 72));
      v9 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
      WeakRetained = 0;
    }
    v10 = objc_msgSend(WeakRetained, "isNetworkAvailableForRemoteEventRouterClientController:", v9);

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        v18 = 138543618;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Mark network as available on transport start %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(*(id *)(a1 + 40), "networkAvailabilityDidChange:", 1);
    }
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

}

void __71__HMDHomeRemoteEventRouterClientController_updateCurrentAccessoryUUID___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  void *v5;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 112, 1);
  if ((objc_msgSend(Property, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
      objc_setProperty_atomic(v5, v4, *(id *)(a1 + 40), 112);
  }
}

id __226__HMDHomeRemoteEventRouterClientController_initWithMessageTargetUUID_workQueue_dataSource_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_clientUserMessagePolicy_currentAccessoryUUID_assertionController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Client.EventRouter.Delegating."), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D32D20]);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_retainAutorelease(v6);
  v10 = (void *)objc_msgSend(v7, "initWithQueue:dataSource:storeReadHandle:logCategory:identifier:", v8, v4, 0, objc_msgSend(v9, "UTF8String"), *(_QWORD *)(a1 + 32));

  return v10;
}

@end
