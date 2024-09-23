@implementation HMDXPCEventRouterServer

- (void)handleXPCConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDXPCEventRouterServer *v9;

  v4 = a3;
  -[HMDXPCEventRouterServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HMDXPCEventRouterServer_handleXPCConnectionInvalidated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__HMDXPCEventRouterServer_handleXPCConnectionInvalidated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentConnectionServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didInvalidateConnection:", v5);

  }
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMEPersistentConnectionServer)persistentConnectionServer
{
  return (HMEPersistentConnectionServer *)objc_getProperty(self, a2, 8, 1);
}

- (HMDXPCEventRouterServer)initWithMessageUUID:(id)a3 dataSource:(id)a4 changeRegistrationsMessageName:(id)a5 updateEventsMessageName:(id)a6 messageDispatcher:(id)a7 queue:(id)a8 notificationCenter:(id)a9 subscriptionProvider:(id)a10 registrationEventRouter:(id)a11 storeReadHandle:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDXPCEventRouterServer *v25;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;

  v17 = a8;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __217__HMDXPCEventRouterServer_initWithMessageUUID_dataSource_changeRegistrationsMessageName_updateEventsMessageName_messageDispatcher_queue_notificationCenter_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke;
  v28[3] = &unk_24E7755D8;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v32 = v20;
  v21 = v20;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = -[HMDXPCEventRouterServer initWithMessageUUID:dataSource:changeRegistrationsMessageName:updateEventsMessageName:messageDispatcher:queue:notificationCenter:persistentConnectionServerFactory:](self, "initWithMessageUUID:dataSource:changeRegistrationsMessageName:updateEventsMessageName:messageDispatcher:queue:notificationCenter:persistentConnectionServerFactory:", a3, a4, a5, a6, a7, v24, a9, v28);

  return v25;
}

- (HMDXPCEventRouterServer)initWithMessageUUID:(id)a3 dataSource:(id)a4 changeRegistrationsMessageName:(id)a5 updateEventsMessageName:(id)a6 messageDispatcher:(id)a7 queue:(id)a8 notificationCenter:(id)a9 persistentConnectionServerFactory:(id)a10
{
  id v17;
  id v18;
  void (**v19)(_QWORD);
  HMDXPCEventRouterServer *v20;
  HMDXPCEventRouterServer *v21;
  uint64_t v22;
  HMEPersistentConnectionServer *persistentConnectionServer;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v17 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v18 = a9;
  v19 = (void (**)(_QWORD))a10;
  v30.receiver = self;
  v30.super_class = (Class)HMDXPCEventRouterServer;
  v20 = -[HMDXPCEventRouterServer init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_messageUUID, a3);
    objc_storeWeak((id *)&v21->_dataSource, v17);
    objc_storeStrong((id *)&v21->_messageDispatcher, a7);
    objc_storeStrong((id *)&v21->_workQueue, a8);
    objc_storeStrong((id *)&v21->_notificationCenter, a9);
    objc_storeStrong((id *)&v21->_changeRegistrationsMessageName, a5);
    objc_storeStrong((id *)&v21->_updateEventsMessageName, a6);
    v19[2](v19);
    v22 = objc_claimAutoreleasedReturnValue();
    persistentConnectionServer = v21->_persistentConnectionServer;
    v21->_persistentConnectionServer = (HMEPersistentConnectionServer *)v22;

    -[HMEPersistentConnectionServer setDelegate:](v21->_persistentConnectionServer, "setDelegate:", v21);
    -[HMEPersistentConnectionServer setDataSource:](v21->_persistentConnectionServer, "setDataSource:", v21);
  }

  return v21;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDXPCEventRouterServer messageUUID](self, "messageUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HMDXPCEventRouterServer messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDXPCEventRouterServer changeRegistrationsMessageName](self, "changeRegistrationsMessageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handleChangeRegistrationsRequest_);

  -[HMDXPCEventRouterServer notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleXPCConnectionInvalidated_, CFSTR("HMDXPCClientConnectionInvalidatedNotification"), 0);

  -[HMDXPCEventRouterServer notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleConnectionActiveStateChange_, CFSTR("HMDHomeManagerConnectionActiveStateUpdatedNotification"), 0);

}

- (void)_handleChangeRegistrationsRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  HMDXPCEventRouterServer *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  HMDXPCEventRouterServer *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMDXPCEventRouterServer *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDXPCEventRouterServer *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDXPCEventRouterServer *v46;
  NSObject *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDXPCEventRouterServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v33;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@No transport on message.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Did not find transport"), CFSTR("Need xpc connection"), 0);
    v34 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if ((objc_msgSend(v4, "isEntitledForSPIAccess") & 1) == 0)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v38;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Not entitled.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v9 = (id)v34;
    objc_msgSend(v4, "respondWithError:", v34);
    goto LABEL_25;
  }
  objc_msgSend(v4, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = -[HMDXPCEventRouterServer isConnectionActive:]((uint64_t)self, v9);
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Found xpc connection in message", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD72A8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7AB0]), "initWithData:", v16);
        objc_msgSend(v17, "topicFilterAdditions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "na_map:", &__block_literal_global_22);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = (void *)MEMORY[0x24BDBD1A8];
        if (v19)
          v22 = (void *)v19;
        else
          v22 = (void *)MEMORY[0x24BDBD1A8];
        v23 = v22;

        objc_msgSend(v17, "topicFilterRemovals");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "na_map:", &__block_literal_global_24_11010);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          v27 = (void *)v25;
        else
          v27 = v21;
        v28 = v27;

        -[HMDXPCEventRouterServer persistentConnectionServer](v12, "persistentConnectionServer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_3;
        v49[3] = &unk_24E78B610;
        v49[4] = v12;
        v50 = v4;
        objc_msgSend(v29, "changeRegistrationsForConnection:topicFilterAdditions:topicFilterRemovals:completion:", v9, v23, v28, v49);

      }
      else
      {
        v45 = (void *)MEMORY[0x227676638]();
        v46 = v12;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v52 = v48;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@No message payload present.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v45);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v17);
      }

    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v44;
        v53 = 2112;
        v54 = v9;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Connection is not active %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v4, "respondWithSuccess");
    }
  }
  else
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v42;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Transport is not XPC connection.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v39);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Transport is not XPC"), CFSTR("Need xpc connection"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v43);

    v9 = 0;
  }
LABEL_25:

}

- (void)handleConnectionActiveStateChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDXPCEventRouterServer *v9;

  v4 = a3;
  -[HMDXPCEventRouterServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDXPCEventRouterServer_handleConnectionActiveStateChange___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendUpdatedEvents:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDXPCEventRouterServer *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDXPCEventRouterServer *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      v33 = 2048;
      v34 = objc_msgSend(v6, "count");
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Sending events: %ld to connection: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      v33 = 2112;
      v34 = (uint64_t)v6;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Sending events: %@ to connection: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v6, "na_map:", &__block_literal_global_33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x24BDD7AB8]);
    v21 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v20, "setEvents:", v21);

    objc_msgSend(v20, "data", *MEMORY[0x24BDD72A0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BE3F1B0];
    -[HMDXPCEventRouterServer updateEventsMessageName](v16, "updateEventsMessageName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDXPCEventRouterServer messageTargetUUID](v16, "messageTargetUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "entitledMessageWithName:identifier:messagePayload:", v25, v26, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sendMessage:completionHandler:", v27, 0);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v28;
      v33 = 2112;
      v34 = (uint64_t)v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain xpc connection from %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)sendUpdatedCachedEvents:(id)a3 toConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDXPCEventRouterServer *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDXPCEventRouterServer *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      v33 = 2048;
      v34 = objc_msgSend(v6, "count");
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Sending cached events: %ld to connection: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      v33 = 2112;
      v34 = (uint64_t)v6;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Sending cached events: %@ to connection: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v6, "na_map:", &__block_literal_global_35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x24BDD7AB8]);
    v21 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v20, "setCachedEvents:", v21);

    objc_msgSend(v20, "data", *MEMORY[0x24BDD72A0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BE3F1B0];
    -[HMDXPCEventRouterServer updateEventsMessageName](v16, "updateEventsMessageName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDXPCEventRouterServer messageTargetUUID](v16, "messageTargetUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "entitledMessageWithName:identifier:messagePayload:", v25, v26, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sendMessage:completionHandler:", v27, 0);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v28;
      v33 = 2112;
      v34 = (uint64_t)v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain xpc connection from %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (BOOL)shouldAllowEvent:(id)a3 topic:(id)a4 connection:(id)a5
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  v5 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "isEntitledForSPIAccess");
  else
    v9 = 0;

  return v9;
}

- (unint64_t)debounceTimeForConnection:(id)a3
{
  return 10;
}

- (id)server:(id)a3 upstreamTopicsForTopic:(id)a4
{
  void *v4;
  void *v5;

  +[HMDHomeEventsGenerated upstreamClientTopicForTopic:](HMDHomeEventsGenerated, "upstreamClientTopicForTopic:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "na_setWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)server:(id)a3 expandedTopicsForTopics:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  -[HMDXPCEventRouterServer dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandedTopicsForTopics:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)dumpStateDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDXPCEventRouterServer persistentConnectionServer](self, "persistentConnectionServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dumpStateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDXPCEventRouterServer server: %@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)messageUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)changeRegistrationsMessageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)updateEventsMessageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMDXPCEventRouterServerDataSource)dataSource
{
  return (HMDXPCEventRouterServerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_updateEventsMessageName, 0);
  objc_storeStrong((id *)&self->_changeRegistrationsMessageName, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistentConnectionServer, 0);
}

uint64_t __64__HMDXPCEventRouterServer_sendUpdatedCachedEvents_toConnection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

uint64_t __58__HMDXPCEventRouterServer_sendUpdatedEvents_toConnection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbEventInfo");
}

void __61__HMDXPCEventRouterServer_handleConnectionActiveStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMDXPCEventRouterSever] Received notification that connection active state changed: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    v9 = *(void **)(a1 + 40);
    v10 = v4;
    if (v9)
    {
      objc_msgSend(v9, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v11);

      if ((-[HMDXPCEventRouterServer isConnectionActive:]((uint64_t)v9, v10) & 1) == 0)
      {
        objc_msgSend(v9, "persistentConnectionServer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "disconnectConnection:", v10);

      }
    }

  }
}

- (uint64_t)isConnectionActive:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  char v12;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "sendPolicyParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldMonitor");

  if (!v9 || (objc_msgSend(v7, "isActive") & 1) != 0)
    goto LABEL_7;
  if ((objc_msgSend(v4, "isAdaptive") & 1) != 0)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isForegrounded") & 1) == 0)
  {

    goto LABEL_13;
  }
  v12 = objc_msgSend(v4, "isActivated");

  if ((v12 & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v10 = 1;
LABEL_14:

LABEL_15:
  return v10;
}

void __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "na_map:", &__block_literal_global_26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BDD7AB8]);
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setCachedEvents:", v10);

    v13 = *MEMORY[0x24BDD72A0];
    objc_msgSend(v9, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v12);
  }

}

id __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE4ED88];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithEvent:topic:", v5, v6);

  objc_msgSend(v7, "pbEventInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", a2);
}

uint64_t __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", a2);
}

id __217__HMDXPCEventRouterServer_initWithMessageUUID_dataSource_changeRegistrationsMessageName_updateEventsMessageName_messageDispatcher_queue_notificationCenter_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke(_QWORD *a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE4EDB8]), "initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:", a1[4], a1[5], a1[6], a1[7], "XPCEventRouter.Server");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_11030 != -1)
    dispatch_once(&logCategory__hmf_once_t0_11030, &__block_literal_global_11031);
  return (id)logCategory__hmf_once_v1_11032;
}

void __38__HMDXPCEventRouterServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_11032;
  logCategory__hmf_once_v1_11032 = v0;

}

@end
