@implementation HMDModernMessagingHandler

- (HMDModernMessagingHandler)init
{
  HMDModernMessagingHandler *v2;
  uint64_t v3;
  NSMutableDictionary *registrationsByMessageName;
  uint64_t v5;
  NSMutableArray *pendingMessages;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDModernMessagingHandler;
  v2 = -[HMDModernMessagingHandler init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    registrationsByMessageName = v2->_registrationsByMessageName;
    v2->_registrationsByMessageName = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 30);
    v5 = objc_claimAutoreleasedReturnValue();
    pendingMessages = v2->_pendingMessages;
    v2->_pendingMessages = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)_createRemoteMessageDispatcher
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (_os_feature_enabled_impl())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HMDModernMessagingHandler__createRemoteMessageDispatcher__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    if (_createRemoteMessageDispatcher_onceToken != -1)
      dispatch_once(&_createRemoteMessageDispatcher_onceToken, block);
    v3 = _createRemoteMessageDispatcher_remoteDispatcher;
    -[HMDModernMessagingHandler modernTransport](self, "modernTransport");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v3);

    v5 = (id)_createRemoteMessageDispatcher_remoteDispatcher;
  }
  else
  {
    -[HMDModernMessagingHandler localMessageDispatcher](self, "localMessageDispatcher");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_createEnergyRemoteMessageDispatcher
{
  id v3;
  _QWORD block[5];

  if (_os_feature_enabled_impl())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDModernMessagingHandler__createEnergyRemoteMessageDispatcher__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    if (_createEnergyRemoteMessageDispatcher_onceToken != -1)
      dispatch_once(&_createEnergyRemoteMessageDispatcher_onceToken, block);
    v3 = (id)_createEnergyRemoteMessageDispatcher_dispatcher;
  }
  else
  {
    -[HMDModernMessagingHandler localMessageDispatcher](self, "localMessageDispatcher");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_createModernTransportInstance
{
  if (_os_feature_enabled_impl())
  {
    if (_createModernTransportInstance_onceToken != -1)
      dispatch_once(&_createModernTransportInstance_onceToken, &__block_literal_global_38_164805);
    -[HMDModernMessagingHandler setModernTransport:](self, "setModernTransport:", _createModernTransportInstance_modernTransport);
  }
}

- (void)_createModernTransportEnergyInstance
{
  if (_os_feature_enabled_impl())
  {
    if (_createModernTransportEnergyInstance_onceToken != -1)
      dispatch_once(&_createModernTransportEnergyInstance_onceToken, &__block_literal_global_43_164801);
    -[HMDModernMessagingHandler setModernTransportEnergyInstance:](self, "setModernTransportEnergyInstance:", _createModernTransportEnergyInstance_modernTransport);
  }
}

- (void)configureWithHome:(id)a3 xpcEventPublisher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[HMDModernMessagingHandler setHome:](self, "setHome:", v7);
  objc_msgSend(v7, "messageTargetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setHomeUUID:](self, "setHomeUUID:", v8);

  objc_msgSend(v7, "messageReceiveQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setWorkQueue:](self, "setWorkQueue:", v9);

  objc_msgSend(v7, "msgDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setLocalMessageDispatcher:](self, "setLocalMessageDispatcher:", v10);

  -[HMDModernMessagingHandler _createModernTransportInstance](self, "_createModernTransportInstance");
  -[HMDModernMessagingHandler _createModernTransportEnergyInstance](self, "_createModernTransportEnergyInstance");
  -[HMDModernMessagingHandler _createRemoteMessageDispatcher](self, "_createRemoteMessageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setRemoteMessageDispatcher:](self, "setRemoteMessageDispatcher:", v11);

  -[HMDModernMessagingHandler _createEnergyRemoteMessageDispatcher](self, "_createEnergyRemoteMessageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setEnergyRemoteMessageDispatcher:](self, "setEnergyRemoteMessageDispatcher:", v12);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 3, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setOwnerPolicy:](self, "setOwnerPolicy:", v13);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler setAdminPolicy:](self, "setAdminPolicy:", v14);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernMessagingHandler setUserPolicy:](self, "setUserPolicy:", v15);
  -[HMDModernMessagingHandler setEventPublisher:](self, "setEventPublisher:", v6);

  -[HMDModernMessagingHandler registerForMessages](self, "registerForMessages");
}

- (void)configureWithHome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[HMDModernMessagingXPCEventPublisher shared](HMDModernMessagingXPCEventPublisher, "shared");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler configureWithHome:xpcEventPublisher:](self, "configureWithHome:xpcEventPublisher:", v4, v5);

}

- (void)registerForMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  -[HMDModernMessagingHandler localMessageDispatcher](self, "localMessageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD6598];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 4194309);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:](HMDXPCBackgroundMessagePolicy, "policyWithEntitlementRequirement:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v7, sel_handleSendHMMMMessage_);

  -[HMDModernMessagingHandler localMessageDispatcher](self, "localMessageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDD6588];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 4194309);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:](HMDXPCBackgroundMessagePolicy, "policyWithEntitlementRequirement:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", v9, self, v12, sel_handleRegisterHMMMMessage_);

  -[HMDModernMessagingHandler localMessageDispatcher](self, "localMessageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDD65A0];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 4194309);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:](HMDXPCBackgroundMessagePolicy, "policyWithEntitlementRequirement:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v14, self, v17, sel_handleUnregisterHMMMMessage_);

  -[HMDModernMessagingHandler _policiesForHMMMRequestHandlerRestriction:](self, "_policiesForHMMMRequestHandlerRestriction:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernMessagingHandler eventPublisher](self, "eventPublisher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "launchOnDemandClientBundleIDsByMessageName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __48__HMDModernMessagingHandler_registerForMessages__block_invoke;
  v22[3] = &unk_24E78B320;
  v22[4] = self;
  v23 = v18;
  v21 = v18;
  objc_msgSend(v20, "na_each:", v22);

}

- (id)_policiesForHMMMRequestHandlerRestriction:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    -[HMDModernMessagingHandler userPolicy](self, "userPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    v6 = v10;
  }
  else if (a3 == 1)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    -[HMDModernMessagingHandler adminPolicy](self, "adminPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    v6 = v11;
  }
  else if (a3)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    -[HMDModernMessagingHandler ownerPolicy](self, "ownerPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    v6 = v9;
  }
  else
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    -[HMDModernMessagingHandler ownerPolicy](self, "ownerPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v5;
    v6 = v12;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cleanupHMMMHandlersForClientConnection:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@cleanupHMMMHandlersForClientConnection with bundle id: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[HMDModernMessagingHandler registrationsByMessageName](v6, "registrationsByMessageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__HMDModernMessagingHandler_cleanupHMMMHandlersForClientConnection___block_invoke;
  v17[3] = &unk_24E78B348;
  v13 = v4;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  objc_msgSend(v11, "na_each:", v17);

  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __68__HMDModernMessagingHandler_cleanupHMMMHandlersForClientConnection___block_invoke_2;
  v16[3] = &unk_24E7997D0;
  v16[4] = v6;
  objc_msgSend(v14, "na_each:", v16);

  os_unfair_recursive_lock_unlock();
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __68__HMDModernMessagingHandler_cleanupHMMMHandlersForClientConnection___block_invoke_3;
  v15[3] = &unk_24E7997D0;
  v15[4] = v6;
  objc_msgSend(v14, "na_each:", v15);

}

- (void)registerHMMMMessageHandlerWithMessageName:(id)a3 userRestriction:(int64_t)a4 clientConnection:(id)a5 message:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMDModernMessagingHandler *v13;
  NSObject *v14;
  void *v15;
  HMDModernMessagingRegistration *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  HMDModernMessagingHandler *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v35 = a6;
  objc_msgSend(v11, "applicationBundleIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v15;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v36;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering message name %@ for client bundle %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = -[HMDModernMessagingRegistration initWithMessageName:xpcConnection:]([HMDModernMessagingRegistration alloc], "initWithMessageName:xpcConnection:", v10, v11);
  -[HMDModernMessagingHandler _policiesForHMMMRequestHandlerRestriction:](v13, "_policiesForHMMMRequestHandlerRestriction:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[HMDModernMessagingHandler registrationsByMessageName](v13, "registrationsByMessageName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v10);

  os_unfair_recursive_lock_unlock();
  -[HMDModernMessagingHandler eventPublisher](v13, "eventPublisher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "launchOnDemandClientBundleIDsByMessageName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  v23 = (void *)MEMORY[0x227676638]();
  v24 = v13;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (v22)
  {
    if (v26)
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HMMMUserRestrictionToString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v29;
      v39 = 2112;
      v40 = v10;
      v41 = 2112;
      v42 = v30;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Registering HMMM request handler for message name: %@ with userRestriction: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDModernMessagingHandler remoteMessageDispatcher](v24, "remoteMessageDispatcher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernMessagingRegistration prefixedMessageName](v16, "prefixedMessageName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "registerForMessage:receiver:policies:selector:", v32, v24, v17, sel__handleHMMMRemoteMessage_);

    -[HMDModernMessagingHandler energyRemoteMessageDispatcher](v24, "energyRemoteMessageDispatcher");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernMessagingRegistration prefixedMessageName](v16, "prefixedMessageName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "registerForMessage:receiver:policies:selector:", v34, v24, v17, sel__handleHMMMRemoteMessage_);

  }
  else
  {
    if (v26)
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HMMMUserRestrictionToString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v27;
      v39 = 2112;
      v40 = v10;
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Not registering HMMM request handler for message name: %@ with userRestriction: %@, already registered via launch on demand", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
  }
  objc_msgSend(v35, "respondWithSuccess");
  -[HMDModernMessagingHandler _sendPendingHMMMRemoteMessagesForClientBundleID:](v24, "_sendPendingHMMMRemoteMessagesForClientBundleID:", v36);

}

- (void)handleRegisterHMMMMessage:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDModernMessagingHandler *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernMessagingHandler messageTargetUUID](v6, "messageTargetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@handleRegisterHMMMMessage with message: %@ for target: %@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x24BDD6560]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_dictionaryForKey:", *MEMORY[0x24BDD6570]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_numberForKey:", *MEMORY[0x24BDD6548]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "transport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16 && v11)
  {
    -[HMDModernMessagingHandler registerHMMMMessageHandlerWithMessageName:userRestriction:clientConnection:message:](v6, "registerHMMMMessageHandlerWithMessageName:userRestriction:clientConnection:message:", v11, objc_msgSend(v13, "integerValue"), v16, v4);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error while registering HMMM request handler: could not determine XPC client or message name", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);

  }
}

- (void)_sendHMMMRemoteMessageToClient:(id)a3 clientMessageName:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDModernMessagingHandler *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDModernMessagingHandler *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDModernMessagingHandler *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  HMDModernMessagingHandler *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  BOOL v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v62 = v11;
      objc_msgSend(v12, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BDD6578];
      objc_msgSend(v15, "hmf_dataForKey:", *MEMORY[0x24BDD6578]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x24BE3F1B8]);
      -[HMDModernMessagingHandler messageTargetUUID](self, "messageTargetUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

      objc_msgSend(v12, "destination");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v22 = v21;

      if (v22)
      {
        v60 = v15;
        v61 = v8;
        objc_msgSend(v22, "device");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deviceAddress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend(v14, "type") == 3;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD6560]);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v16);
        v56 = v25;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDD6568]);

        objc_msgSend(v24, "idsIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "UUIDString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDD6550]);

        v59 = v24;
        objc_msgSend(v24, "idsDestination");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BDD6558]);

        -[HMDModernMessagingHandler home](self, "home");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v12, "userForHome:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BDD6580]);

        }
        v58 = (void *)v31;
        objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:qualityOfService:destination:payload:", *MEMORY[0x24BDD6590], objc_msgSend(v12, "qualityOfService"), v63, v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTransport:", v61);
        v64[0] = MEMORY[0x24BDAC760];
        v64[1] = 3221225472;
        v64[2] = __86__HMDModernMessagingHandler__sendHMMMRemoteMessageToClient_clientMessageName_message___block_invoke;
        v64[3] = &unk_24E78B370;
        v66 = v56;
        v65 = v12;
        v35 = (void *)MEMORY[0x227676638](objc_msgSend(v34, "setResponseHandler:", v64));
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "identifier");
          v57 = v17;
          v39 = v22;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v68 = v38;
          v69 = 2112;
          v70 = v40;
          v71 = 2112;
          v72 = v9;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Dispatching HMMM message %@ with name: %@ to client", buf, 0x20u);

          v22 = v39;
          v17 = v57;

        }
        objc_autoreleasePoolPop(v35);
        -[HMDModernMessagingHandler localMessageDispatcher](v36, "localMessageDispatcher");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sendMessage:", v34);

        v15 = v60;
        v8 = v61;
        v42 = v59;
      }
      else
      {
        v51 = (void *)MEMORY[0x227676638]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = v15;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v55;
          v69 = 2112;
          v70 = v12;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Invalid sender for HMMT request: %@", buf, 0x16u);

          v15 = v54;
        }

        objc_autoreleasePoolPop(v51);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "respondWithError:", v42);
        v22 = 0;
      }

      v11 = v62;
    }
    else
    {
      v47 = (void *)MEMORY[0x227676638]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v50;
        v69 = 2112;
        v70 = v12;
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Invalid message for HMMT request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "respondWithError:", v15);
    }

  }
  else
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v46;
      v69 = 2112;
      v70 = v11;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@HMMM message received without valid prefix. Discarding: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "respondWithError:", v14);
  }

}

- (void)_storePendingHMMMRemoteMessage:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Storing pending HMMM message: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_recursive_lock_lock_with_options();
  -[HMDModernMessagingHandler pendingMessages](v6, "pendingMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v4);
  while (1)
  {

    -[HMDModernMessagingHandler pendingMessages](v6, "pendingMessages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (unint64_t)objc_msgSend(v11, "count") > 0x1E;

    if (!v12)
      break;
    -[HMDModernMessagingHandler pendingMessages](v6, "pendingMessages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_removeFirstObject");
  }
  os_unfair_recursive_lock_unlock();

}

- (void)_sendPendingHMMMRemoteMessagesForClientBundleID:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending pending HMMM messages to client with bundle ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_recursive_lock_lock_with_options();
  -[HMDModernMessagingHandler pendingMessages](v6, "pendingMessages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientBundleID___block_invoke;
  v17[3] = &unk_24E78B398;
  v17[4] = v6;
  v11 = v4;
  v18 = v11;
  objc_msgSend(v9, "na_filter:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernMessagingHandler pendingMessages](v6, "pendingMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectsInArray:", v12);

  os_unfair_recursive_lock_unlock();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __77__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientBundleID___block_invoke_2;
  v15[3] = &unk_24E795E50;
  v15[4] = v6;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "na_each:", v15);

}

- (void)_handleHMMMRemoteMessage:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDModernMessagingHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received hm modern messaging remote message: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDModernMessagingRegistration clientHMMMMessageNameFromPrefixedMessageName:](HMDModernMessagingRegistration, "clientHMMMMessageNameFromPrefixedMessageName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    os_unfair_recursive_lock_lock_with_options();
    -[HMDModernMessagingHandler registrationsByMessageName](v6, "registrationsByMessageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_recursive_lock_unlock();
    if (v13)
    {
      -[HMDModernMessagingHandler _sendHMMMRemoteMessageToClient:clientMessageName:message:](v6, "_sendHMMMRemoteMessageToClient:clientMessageName:message:", v13, v10, v4);
    }
    else
    {
      -[HMDModernMessagingHandler eventPublisher](v6, "eventPublisher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "launchOnDemandClientBundleIDsByMessageName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HMDModernMessagingHandler _storePendingHMMMRemoteMessage:](v6, "_storePendingHMMMRemoteMessage:", v4);
        -[HMDModernMessagingHandler eventPublisher](v6, "eventPublisher");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "publishLaunchEventForBundleID:", v20);

      }
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v17;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@HMMM message received without valid prefix. Discarding: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)handleUnregisterHMMMMessage:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDModernMessagingHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDModernMessagingHandler *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@handleUnregisterHMMMMessage with message: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x24BDD6560]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_recursive_lock_lock_with_options();
    -[HMDModernMessagingHandler registrationsByMessageName](v6, "registrationsByMessageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v10);

    v13 = os_unfair_recursive_lock_unlock();
    v14 = (void *)MEMORY[0x227676638](v13);
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDModernMessagingHandler messageTargetUUID](v15, "messageTargetUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v17;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@(2) Deregistering for remote message with name: %@ for target: %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDModernMessagingHandler remoteMessageDispatcher](v15, "remoteMessageDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deregisterForMessage:receiver:", v11, v15);

    -[HMDModernMessagingHandler energyRemoteMessageDispatcher](v15, "energyRemoteMessageDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deregisterForMessage:receiver:", v11, v15);

    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v6;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v24;
      v27 = 2112;
      v28 = 0;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Error unregistering HMMT request handler with message name: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (void)handleSendHMMMMessage:(id)a3
{
  id v4;
  void *v5;
  HMDModernMessagingHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDModernMessagingHandler *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDDeviceAddress *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  HMDRemoteDeviceMessageDestination *v34;
  void *v35;
  uint64_t v36;
  HMDRemoteMessage *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  HMDModernMessagingHandler *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDModernMessagingHandler *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  HMDDeviceAddress *v55;
  void *v56;
  void *v57;
  HMDModernMessagingHandler *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  HMDRemoteMessage *v64;
  HMDDeviceAddress *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  int v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[6];
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernMessagingHandler messageTargetUUID](v6, "messageTargetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v85 = v8;
    v86 = 2112;
    v87 = (uint64_t)v4;
    v88 = 2112;
    v89 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@handleSendHMMMMessage with message: %@ for target: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDD6560];
  objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x24BDD6560]);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x24BDD6550]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x24BDD6558]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDD6578];
  objc_msgSend(v10, "hmf_dataForKey:", *MEMORY[0x24BDD6578]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_dictionaryForKey:", *MEMORY[0x24BDD6570]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x24BDD6540]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x24BDD6538]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x24BDD6530]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v12;
  v75 = v18;
  if (v12 && v13 && v14 && v18)
  {
    if (!v17)
    {
      v19 = v18;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v19;
    }
    v73 = v13;
    v20 = v78;
    if (!v78)
      v20 = &unk_24E96C020;
    v78 = v20;
    v71 = objc_msgSend(v18, "BOOLValue");
    +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v77);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v76, v15);
    v72 = v22;
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, v11);
    v23 = v17;
    if (objc_msgSend(v17, "intValue"))
    {
      if (objc_msgSend(v17, "intValue") == 1)
        v24 = 8;
      else
        v24 = -1;
    }
    else
    {
      v24 = 1;
    }
    v67 = v23;
    v66 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v73);
    v69 = v14;
    v30 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:]([HMDDeviceAddress alloc], "initWithIDSIdentifier:idsDestination:", v66, v14);
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v31 = objc_claimAutoreleasedReturnValue();
    v65 = v30;
    objc_msgSend((id)v31, "deviceForAddress:", v30);
    v32 = objc_claimAutoreleasedReturnValue();

    v83 = 0;
    LOBYTE(v31) = +[HMDSecureRemoteMessageTransport isDeviceValidDestination:error:](HMDSecureRemoteMessageTransport, "isDeviceValidDestination:error:", v32, &v83);
    v70 = v83;
    v68 = (void *)v32;
    if ((v31 & 1) == 0)
    {
      v50 = (void *)MEMORY[0x227676638]();
      v51 = v6;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v85 = v53;
        v86 = 2112;
        v87 = (uint64_t)v70;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Device is not a valid destination for HMMM Messages, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v50);
      v48 = v70;
      objc_msgSend(v4, "respondWithError:", v70);
      v13 = v73;
      v14 = v69;
      v54 = (void *)v66;
      v17 = v67;
      v55 = v65;
      goto LABEL_40;
    }
    if (v71)
      v33 = 3;
    else
      v33 = 0;
    v34 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDModernMessagingHandler messageTargetUUID](v6, "messageTargetUUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v34, "initWithTarget:device:", v35, v32);

    v37 = [HMDRemoteMessage alloc];
    v38 = objc_msgSend(v4, "qualityOfService");
    objc_msgSend(v78, "doubleValue");
    v62 = v24;
    v39 = (void *)v36;
    v64 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:](v37, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", v21, v38, v36, v72, v33, 1, v62);
    v40 = (void *)MEMORY[0x227676638]();
    v41 = v6;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v63 = v40;
      v44 = v39;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteMessage identifier](v64, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v43;
      v86 = 2112;
      v87 = (uint64_t)v45;
      v88 = 2112;
      v89 = v46;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Routing source hmmm message %@ as remote message %@", buf, 0x20u);

      v39 = v44;
      v40 = v63;

    }
    objc_autoreleasePoolPop(v40);
    v13 = v73;
    v14 = v69;
    if ((v71 & 1) == 0)
    {
      -[HMDRemoteMessage identifier](v64, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = __51__HMDModernMessagingHandler_handleSendHMMMMessage___block_invoke;
      v79[3] = &unk_24E78B3C0;
      v79[4] = v41;
      v79[5] = v47;
      v80 = v73;
      v81 = v69;
      v82 = v4;
      -[HMDRemoteMessage setResponseHandler:](v64, "setResponseHandler:", v79);

    }
    v48 = v70;
    if (objc_msgSend(v77, "isEqualToString:", CFSTR("com.apple.DistributedTimers.request")))
    {
      -[HMDModernMessagingHandler remoteMessageDispatcher](v41, "remoteMessageDispatcher");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v77, "isEqualToString:", CFSTR("EnergyKitShareRequest_v1")))
      {
        v57 = (void *)MEMORY[0x227676638]();
        v58 = v41;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v60;
          v86 = 2112;
          v87 = (uint64_t)v77;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unknown message name: %@, discarding message", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v57);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v61);

        v14 = v69;
        v48 = v70;
        v55 = v65;
        v54 = (void *)v66;
        goto LABEL_39;
      }
      -[HMDModernMessagingHandler energyRemoteMessageDispatcher](v41, "energyRemoteMessageDispatcher");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v56 = v49;
    objc_msgSend(v49, "sendMessage:", v64);

    v55 = v65;
    v54 = (void *)v66;
    if (v71)
      objc_msgSend(v4, "respondWithSuccess");
LABEL_39:

    v17 = v67;
LABEL_40:

    goto LABEL_41;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = v6;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v74 = v4;
    v28 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v85 = v29;
    v86 = 2112;
    v87 = v12;
    v88 = 2112;
    v89 = v13;
    v90 = 2112;
    v91 = v28;
    v92 = 2112;
    v93 = v75;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot send HMMM message, missing required data: messageName: %@, idsIdentifier: %@, tokenURI: %@, oneWayNumber: %@", buf, 0x34u);

    v14 = v28;
    v4 = v74;
  }

  objc_autoreleasePoolPop(v25);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v21);
LABEL_41:

}

- (HMDModernMessagingXPCEventPublisher)eventPublisher
{
  return self->_eventPublisher;
}

- (void)setEventPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_eventPublisher, a3);
}

- (NSMutableDictionary)registrationsByMessageName
{
  return self->_registrationsByMessageName;
}

- (os_unfair_recursive_lock_s)lock
{
  os_unfair_recursive_lock_s dest;

  objc_copyStruct(&dest, &self->_lock, 8, 1, 0);
  return dest;
}

- (void)setLock:(os_unfair_recursive_lock_s)a3
{
  os_unfair_recursive_lock_s src;

  src = a3;
  objc_copyStruct(&self->_lock, &src, 8, 1, 0);
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_homeUUID, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)localMessageDispatcher
{
  return self->_localMessageDispatcher;
}

- (void)setLocalMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_localMessageDispatcher, a3);
}

- (HMFMessageDispatcher)energyRemoteMessageDispatcher
{
  return self->_energyRemoteMessageDispatcher;
}

- (void)setEnergyRemoteMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_energyRemoteMessageDispatcher, a3);
}

- (HMDUserMessagePolicy)ownerPolicy
{
  return self->_ownerPolicy;
}

- (void)setOwnerPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_ownerPolicy, a3);
}

- (HMDUserMessagePolicy)adminPolicy
{
  return self->_adminPolicy;
}

- (void)setAdminPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_adminPolicy, a3);
}

- (HMDUserMessagePolicy)userPolicy
{
  return self->_userPolicy;
}

- (void)setUserPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_userPolicy, a3);
}

- (HMDModernRemoteMessageTransport)modernTransportEnergyInstance
{
  return self->_modernTransportEnergyInstance;
}

- (void)setModernTransportEnergyInstance:(id)a3
{
  objc_storeStrong((id *)&self->_modernTransportEnergyInstance, a3);
}

- (HMFMessageDispatcher)remoteMessageDispatcher
{
  return self->_remoteMessageDispatcher;
}

- (void)setRemoteMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMessageDispatcher, a3);
}

- (HMDModernRemoteMessageTransport)modernTransport
{
  return self->_modernTransport;
}

- (void)setModernTransport:(id)a3
{
  objc_storeStrong((id *)&self->_modernTransport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernTransport, 0);
  objc_storeStrong((id *)&self->_remoteMessageDispatcher, 0);
  objc_storeStrong((id *)&self->_modernTransportEnergyInstance, 0);
  objc_storeStrong((id *)&self->_userPolicy, 0);
  objc_storeStrong((id *)&self->_adminPolicy, 0);
  objc_storeStrong((id *)&self->_ownerPolicy, 0);
  objc_storeStrong((id *)&self->_energyRemoteMessageDispatcher, 0);
  objc_storeStrong((id *)&self->_localMessageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_registrationsByMessageName, 0);
  objc_storeStrong((id *)&self->_eventPublisher, 0);
}

void __51__HMDModernMessagingHandler_handleSendHMMMMessage___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for HMMM message: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *MEMORY[0x24BDD6550]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *MEMORY[0x24BDD6558]);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "respondWithPayload:error:", v14, v5);

}

uint64_t __77__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientBundleID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDModernMessagingRegistration clientHMMMMessageNameFromPrefixedMessageName:](HMDModernMessagingRegistration, "clientHMMMMessageNameFromPrefixedMessageName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchOnDemandClientBundleIDsByMessageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));
  return v8;
}

void __77__HMDModernMessagingHandler__sendPendingHMMMRemoteMessagesForClientBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending pending message: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDModernMessagingRegistration clientHMMMMessageNameFromPrefixedMessageName:](HMDModernMessagingRegistration, "clientHMMMMessageNameFromPrefixedMessageName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "registrationsByMessageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = os_unfair_recursive_lock_unlock();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendHMMMRemoteMessageToClient:clientMessageName:message:", v13, v10, v3);
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638](v14);
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 40);
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to send pending HMMM Remote message to client with bundle id: %@ ... XPC Client is nil", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

uint64_t __86__HMDModernMessagingHandler__sendHMMMRemoteMessageToClient_clientMessageName_message___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "respondWithPayload:error:", a3, a2);
  return result;
}

void __68__HMDModernMessagingHandler_cleanupHMMMHandlersForClientConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __68__HMDModernMessagingHandler_cleanupHMMMHandlersForClientConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "registrationsByMessageName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v3);

}

void __68__HMDModernMessagingHandler_cleanupHMMMHandlersForClientConnection___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "eventPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchOnDemandClientBundleIDsByMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messageTargetUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@(Cleanup) Deregistering for remote message with name: %@ for target: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "remoteMessageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deregisterForMessage:receiver:", v13, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "energyRemoteMessageDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deregisterForMessage:receiver:", v15, *(_QWORD *)(a1 + 32));

  }
}

void __48__HMDModernMessagingHandler_registerForMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messageTargetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering for launch on demand message with name: %@ for target: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "remoteMessageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), sel__handleHMMMRemoteMessage_);

  objc_msgSend(*(id *)(a1 + 32), "energyRemoteMessageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), sel__handleHMMMRemoteMessage_);

}

void __65__HMDModernMessagingHandler__createModernTransportEnergyInstance__block_invoke()
{
  HMDRapportMessageTransport *v0;
  void *v1;
  HMDIDSMessageTransport *v2;
  void *v3;
  id v4;
  HMDModernRemoteMessageTransport *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  HMDRapportMessageTransport *v10;

  v0 = [HMDRapportMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRapportMessageTransport initWithAccountRegistry:](v0, "initWithAccountRegistry:", v1);

  v2 = [HMDIDSMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDIDSMessageTransport initHMMMEnergyWithAccountRegistry:](v2, "initHMMMEnergyWithAccountRegistry:", v3);

  v5 = [HMDModernRemoteMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDModernRemoteMessageTransport initWithAccountRegistry:rapportTransport:idsTransport:](v5, "initWithAccountRegistry:rapportTransport:idsTransport:", v6, v10, v4);
  v8 = (void *)_createModernTransportEnergyInstance_modernTransport;
  _createModernTransportEnergyInstance_modernTransport = v7;

  objc_msgSend((id)_createModernTransportEnergyInstance_modernTransport, "setIsHMModernMessagingEnergyInstance:", 1);
  v9 = (id)objc_msgSend((id)_createModernTransportEnergyInstance_modernTransport, "startHMMMEnergy");

}

void __59__HMDModernMessagingHandler__createModernTransportInstance__block_invoke()
{
  HMDRapportMessageTransport *v0;
  void *v1;
  HMDIDSMessageTransport *v2;
  void *v3;
  id v4;
  HMDModernRemoteMessageTransport *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  HMDRapportMessageTransport *v10;

  v0 = [HMDRapportMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRapportMessageTransport initWithAccountRegistry:](v0, "initWithAccountRegistry:", v1);

  v2 = [HMDIDSMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDIDSMessageTransport initHMMMWithAccountRegistry:](v2, "initHMMMWithAccountRegistry:", v3);

  v5 = [HMDModernRemoteMessageTransport alloc];
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDModernRemoteMessageTransport initWithAccountRegistry:rapportTransport:idsTransport:](v5, "initWithAccountRegistry:rapportTransport:idsTransport:", v6, v10, v4);
  v8 = (void *)_createModernTransportInstance_modernTransport;
  _createModernTransportInstance_modernTransport = v7;

  objc_msgSend((id)_createModernTransportInstance_modernTransport, "setIsHMModernMessagingInstance:", 1);
  v9 = (id)objc_msgSend((id)_createModernTransportInstance_modernTransport, "startHMMM");

}

void __65__HMDModernMessagingHandler__createEnergyRemoteMessageDispatcher__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE3F1C0]);
  objc_msgSend(*(id *)(a1 + 32), "modernTransportEnergyInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithTransport:", v3);
  v5 = (void *)_createEnergyRemoteMessageDispatcher_dispatcher;
  _createEnergyRemoteMessageDispatcher_dispatcher = v4;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_createEnergyRemoteMessageDispatcher_dispatcher, "setFilterClasses:", v8);

  v9 = _createEnergyRemoteMessageDispatcher_dispatcher;
  objc_msgSend(*(id *)(a1 + 32), "modernTransportEnergyInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

}

void __59__HMDModernMessagingHandler__createRemoteMessageDispatcher__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE3F1C0]);
  objc_msgSend(*(id *)(a1 + 32), "modernTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithTransport:", v3);
  v5 = (void *)_createRemoteMessageDispatcher_remoteDispatcher;
  _createRemoteMessageDispatcher_remoteDispatcher = v4;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_createRemoteMessageDispatcher_remoteDispatcher, "setFilterClasses:", v8);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_164812 != -1)
    dispatch_once(&logCategory__hmf_once_t0_164812, &__block_literal_global_164813);
  return (id)logCategory__hmf_once_v1_164814;
}

void __40__HMDModernMessagingHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_164814;
  logCategory__hmf_once_v1_164814 = v0;

}

@end
