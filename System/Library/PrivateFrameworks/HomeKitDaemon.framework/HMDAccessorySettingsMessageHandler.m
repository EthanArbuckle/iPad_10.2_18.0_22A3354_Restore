@implementation HMDAccessorySettingsMessageHandler

- (HMDAccessorySettingsMessageHandler)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HMDAccessorySettingsMessageHandler *v9;
  HMDAccessorySettingsMessageHandler *v10;
  uint64_t v11;
  NSMapTable *settingMessageMap;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessorySettingsMessageHandler;
  v9 = -[HMDAccessorySettingsMessageHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeWeak((id *)&v10->_messageController, v8);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    settingMessageMap = v10->_settingMessageMap;
    v10->_settingMessageMap = (NSMapTable *)v11;

  }
  return v10;
}

- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[HMDAccessorySettingsMessageHandler setMessageDispatcher:](self, "setMessageDispatcher:", a3);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsMessageHandler setOnlyOwnerAllowedUserPolicy:](self, "setOnlyOwnerAllowedUserPolicy:", v7);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingsMessageHandler setSharedAdminAllowedUserPolicy:](self, "setSharedAdminAllowedUserPolicy:", v8);
  -[HMDAccessorySettingsMessageHandler registerForMessages](self, "registerForMessages");
}

- (void)configureForSetting:(id)a3 allowSharedAdminEditConstraints:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  HMDAccessorySettingMessageMapper *v7;
  void *v8;
  HMDAccessorySettingMessageMapper *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  -[HMDAccessorySettingsMessageHandler messageMapperForSetting:](self, "messageMapperForSetting:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [HMDAccessorySettingMessageMapper alloc];
    -[HMDAccessorySettingsMessageHandler workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDAccessorySettingMessageMapper initWithIdentifier:queue:allowSharedAdminEditConstraints:](v7, "initWithIdentifier:queue:allowSharedAdminEditConstraints:", v13, v8, v4);

    -[HMDAccessorySettingsMessageHandler settingMessageMap](self, "settingMessageMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v13);

  }
  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  if (v11)
  {
    -[HMDAccessorySettingsMessageHandler registerForSettingMessages:](self, "registerForSettingMessages:", v13);
    v12 = v13;
  }

}

- (void)unconfigureFromSetting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDAccessorySettingsMessageHandler messageMapperForSetting:](self, "messageMapperForSetting:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deregisterFromAllMessages");

  }
  -[HMDAccessorySettingsMessageHandler settingMessageMap](self, "settingMessageMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _QWORD v40[3];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[HMDAccessorySettingsMessageHandler settingMessageMap](self, "settingMessageMap", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        -[HMDAccessorySettingsMessageHandler registerForSettingMessages:](self, "registerForSettingMessages:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v6);
  }

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v9;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v10;
  -[HMDAccessorySettingsMessageHandler sharedAdminAllowedUserPolicy](self, "sharedAdminAllowedUserPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDD4E80];
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v14, self, v16, sel__handleSettingUpdateValueByKeyPath_);

  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD4E58];
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerForMessage:receiver:policies:selector:", v18, self, v20, sel__handleReplaceConstraintsForKeyPath_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDD4DD0];
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", v24, self, v26, sel__handleAddConstraint_);

  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BDD4E50];
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObject:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "registerForMessage:receiver:policies:selector:", v28, self, v30, sel__handleRemoveConstraint_);

  -[HMDAccessorySettingsMessageHandler messageDispatcher](self, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BDD4E78];
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObject:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerForMessage:receiver:policies:selector:", v32, self, v34, sel__handleUpdatedConstraints_);

}

- (void)registerForSettingMessages:(id)a3
{
  void *v4;
  HMDAccessorySettingsMessageHandler *v5;
  NSObject *v6;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v7;
    v31 = 2112;
    v32 = v22;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering for setting messages %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  -[HMDAccessorySettingsMessageHandler sharedAdminAllowedUserPolicy](v5, "sharedAdminAllowedUserPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, v5);
  -[HMDAccessorySettingsMessageHandler messageMapperForSetting:](v5, "messageMapperForSetting:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsMessageHandler messageDispatcher](v5, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __65__HMDAccessorySettingsMessageHandler_registerForSettingMessages___block_invoke;
  v25[3] = &unk_24E79AF28;
  objc_copyWeak(&v26, (id *)buf);
  objc_msgSend(v11, "registerForMessage:policies:messageDispatcher:messageHandler:", *MEMORY[0x24BDD4E80], v13, v14, v25);

  if ((objc_msgSend(v11, "shouldAllowSharedAdminToEditConstraints") & 1) == 0)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    -[HMDAccessorySettingsMessageHandler onlyOwnerAllowedUserPolicy](v5, "onlyOwnerAllowedUserPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsMessageHandler messageDispatcher](v5, "messageDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __65__HMDAccessorySettingsMessageHandler_registerForSettingMessages___block_invoke_2;
  v23[3] = &unk_24E79AF28;
  objc_copyWeak(&v24, (id *)buf);
  objc_msgSend(v11, "registerForMessage:policies:messageDispatcher:messageHandler:", *MEMORY[0x24BDD4E58], v20, v21, v23);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak((id *)buf);
}

- (id)messageMapperForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDAccessorySettingsMessageHandler settingMessageMap](self, "settingMessageMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_decodeUpdateValueMessagePayload:(id)a3 outValue:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  HMDAccessorySettingsMessageHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDAccessorySettingsMessageHandler *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x24BDD4E90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v22 = 0;
    +[HMDAccessorySetting decodedValue:error:](HMDAccessorySetting, "decodedValue:error:", v7, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    v10 = v8 != 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v11)
      {

        v8 = 0;
      }
      v12 = objc_retainAutorelease(v8);
      *a4 = v12;

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting supported value from value data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
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
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized value from payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v10 = 0;
  }

  return v10;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)_handleSettingUpdateValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v6 = -[HMDAccessorySettingsMessageHandler _decodeUpdateValueMessagePayload:outValue:](self, "_decodeUpdateValueMessagePayload:outValue:", v5, &v19);
  v7 = v19;

  if (v6)
  {
    -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteSourceDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteSourceDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "productInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "productClass");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__HMDAccessorySettingsMessageHandler__handleSettingUpdateValue___block_invoke;
    v17[3] = &unk_24E79AF50;
    v17[4] = self;
    v18 = v4;
    objc_msgSend(v16, "onMessageUpdateValue:settingIdentifier:senderVersion:senderProductClass:completion:", v7, v9, v11, v14, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);

    v7 = (id)v15;
  }

}

- (void)_handleSettingUpdateValueByKeyPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v6 = -[HMDAccessorySettingsMessageHandler _decodeUpdateValueMessagePayload:outValue:](self, "_decodeUpdateValueMessagePayload:outValue:", v5, &v21);
  v7 = v21;

  if (v6)
  {
    objc_msgSend(v4, "messagePayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x24BDD6CD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteSourceDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "version");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteSourceDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "productInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "productClass");
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __73__HMDAccessorySettingsMessageHandler__handleSettingUpdateValueByKeyPath___block_invoke;
      v18[3] = &unk_24E79AF78;
      v18[4] = self;
      v16 = v9;
      v19 = v16;
      v20 = v4;
      objc_msgSend(v10, "onMessageUpdateValue:settingKeyPath:senderVersion:senderProductClass:completion:", v7, v16, v12, v15, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v17);

      v16 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v16);
  }

}

- (void)_handleAddConstraint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessorySettingsMessageHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySettingsMessageHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAccessorySettingsMessageHandler *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD4DE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "deserializeObjectWithData:allowedClass:frameworkClasses:", v5, objc_opt_class(), MEMORY[0x24BDBD1A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "messagePayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x24BDD6CD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __59__HMDAccessorySettingsMessageHandler__handleAddConstraint___block_invoke;
        v24[3] = &unk_24E79BD80;
        v25 = v4;
        objc_msgSend(v9, "onMessageAddConstraint:keyPath:completion:", v6, v8, v24);

        v10 = v25;
      }
      else
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v23;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing key path in message payload", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v10);
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
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid constraint in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v8);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized constraint in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Constraint not found"), CFSTR("Missing serialized constraint in add message"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (void)_handleRemoveConstraint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessorySettingsMessageHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySettingsMessageHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAccessorySettingsMessageHandler *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD4DE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "deserializeObjectWithData:allowedClass:frameworkClasses:", v5, objc_opt_class(), MEMORY[0x24BDBD1A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "messagePayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x24BDD6CD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __62__HMDAccessorySettingsMessageHandler__handleRemoveConstraint___block_invoke;
        v24[3] = &unk_24E79BD80;
        v25 = v4;
        objc_msgSend(v9, "onMessageRemoveConstraint:keyPath:completion:", v6, v8, v24);

        v10 = v25;
      }
      else
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v23;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing key path in message payload", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v10);
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
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid constraint in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v8);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized constraint in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Constraint not found"), CFSTR("Missing serialized constraint in remove message"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (void)_handleUpdatedConstraints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsMessageHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessorySettingsMessageHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDAccessorySettingsMessageHandler *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD4DE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    v7 = (void *)MEMORY[0x24BDBCF20];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34;

    v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      objc_msgSend(v4, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmf_stringForKey:", *MEMORY[0x24BDD6CD0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __64__HMDAccessorySettingsMessageHandler__handleUpdatedConstraints___block_invoke;
        v32[3] = &unk_24E79BD80;
        v33 = v4;
        objc_msgSend(v17, "onMessageUpdateConstraints:keyPath:completion:", v14, v16, v32);

        v18 = v33;
      }
      else
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v31;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Missing key path in message payload", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v18);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive accessory setting constraint from constraints data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v22;
      v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Missing serialized constraints in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Constraint not found"), CFSTR("Missing serialized constraint in update message"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (BOOL)processReplaceConstraintMessage:(id)a3 outConstraintsToAdd:(id *)a4 outConstraintIdsToRemove:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  BOOL v27;
  void *v28;
  HMDAccessorySettingsMessageHandler *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMDAccessorySettingsMessageHandler *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDAccessorySettingsMessageHandler *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDAccessorySettingsMessageHandler *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id *v50;
  id *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayForKey:", *MEMORY[0x24BDD4DE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_msgSend(v10, "hmf_objectsAreKindOfClass:", objc_opt_class()) & 1) != 0)
    {
      v50 = a4;
      v51 = a5;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v54 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
            objc_msgSend(v9, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v13);
      }

      objc_msgSend(v8, "dataForKey:", *MEMORY[0x24BDD4DD8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)MEMORY[0x24BDD1620];
        v19 = (void *)MEMORY[0x24BDBCF20];
        v57[0] = objc_opt_class();
        v57[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setWithArray:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v21, v17, &v52);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v52;

        v24 = v22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if (v26)
        {

          *v50 = objc_retainAutorelease(v26);
          *v51 = (id)objc_msgSend(v9, "copy");
          v27 = 1;
          v23 = v24;
LABEL_30:

          goto LABEL_31;
        }
        v44 = (void *)MEMORY[0x227676638]();
        v45 = self;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v47;
          v61 = 2112;
          v62 = v23;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive accessory setting constraint from constraints to add data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v48);

      }
      else
      {
        v39 = (void *)MEMORY[0x227676638]();
        v40 = self;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "messagePayload");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v42;
          v61 = 2112;
          v62 = v43;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Missing serialized constraints to add in message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v23);
      }
      v27 = 0;
      goto LABEL_30;
    }
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v38;
      v61 = 2112;
      v62 = v10;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Invalid constraints classes: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v33 = (void *)MEMORY[0x24BDD1540];
    v34 = 43;
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
      objc_msgSend(v8, "messagePayload");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v31;
      v61 = 2112;
      v62 = v32;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Missing constraints to remove in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v33 = (void *)MEMORY[0x24BDD1540];
    v34 = 3;
  }
  objc_msgSend(v33, "hmErrorWithCode:", v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "respondWithError:", v17);
  v27 = 0;
LABEL_31:

  return v27;
}

- (void)_handleReplaceConstraints:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  v17 = 0;
  v18 = 0;
  v5 = -[HMDAccessorySettingsMessageHandler processReplaceConstraintMessage:outConstraintsToAdd:outConstraintIdsToRemove:](self, "processReplaceConstraintMessage:outConstraintsToAdd:outConstraintIdsToRemove:", v4, &v18, &v17);
  v6 = v18;
  v7 = v17;
  if (v5)
  {
    -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteSourceDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "productClass");
    v14 = objc_msgSend(v4, "isRemote");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__HMDAccessorySettingsMessageHandler__handleReplaceConstraints___block_invoke;
    v15[3] = &unk_24E79BD80;
    v16 = v4;
    objc_msgSend(v8, "onMessageReplaceConstraintsWithAdditions:constraintIdsToRemove:settingIdentifier:senderProductClass:isRemote:completion:", v6, v7, v10, v13, v14, v15);

  }
}

- (void)_handleReplaceConstraintsForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDAccessorySettingsMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x24BDD6CD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAccessorySettingsMessageHandler messageController](self, "messageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isRemote"))
    {
LABEL_7:
      v26 = 0;
      v27 = 0;
      v11 = -[HMDAccessorySettingsMessageHandler processReplaceConstraintMessage:outConstraintsToAdd:outConstraintIdsToRemove:](self, "processReplaceConstraintMessage:outConstraintsToAdd:outConstraintIdsToRemove:", v4, &v27, &v26);
      v12 = v27;
      v13 = v26;
      if (v11)
      {
        objc_msgSend(v4, "remoteSourceDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "productInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "productClass");
        v17 = objc_msgSend(v4, "isRemote");
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __74__HMDAccessorySettingsMessageHandler__handleReplaceConstraintsForKeyPath___block_invoke;
        v24[3] = &unk_24E79BD80;
        v25 = v4;
        objc_msgSend(v7, "onMessageReplaceConstraintsWithAdditions:constraintIdsToRemove:keyPath:senderProductClass:isRemote:completion:", v12, v13, v6, v16, v17, v24);

      }
      goto LABEL_15;
    }
    objc_msgSend(v7, "home");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
LABEL_15:

      goto LABEL_16;
    }
    v9 = (void *)v8;
    objc_msgSend(v4, "userForHome:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && objc_msgSend(v7, "canUser:editConstraintsForSettingWithKeyPath:", v10, v6))
    {

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v23);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing key path from accessory settings update message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);
  }
LABEL_16:

}

- (void)relayUpdateValue:(id)a3 keyPath:(id)a4 destination:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessorySettingsMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessorySettingsMessageHandler *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v31;
  id location;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v27 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (v11)
  {
    v37 = *MEMORY[0x24BDD4E90];
    v14 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    encodeRootObject();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", *MEMORY[0x24BDD4E80], 25, v11, v16, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke;
    v29[3] = &unk_24E79AFA0;
    objc_copyWeak(&v31, &location);
    v30 = v13;
    v18 = (void *)MEMORY[0x227676638](objc_msgSend(v17, "setResponseHandler:", v29));
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Relaying update value message. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDAccessorySettingsMessageHandler messageDispatcher](v19, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:completionHandler:", v17, 0);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638](v12);
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54, v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v13)[2](v13, 0, 0, v16);
  }

}

- (void)relayReplaceConstraints:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 destination:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessorySettingsMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessorySettingsMessageHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v29 = a4;
  v30 = a5;
  v13 = a6;
  v14 = a7;
  v28 = v12;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD7AD0], "_encodedConstraintsToAdd:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "na_map:", &__block_literal_global_55_247951);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD7AD0], "_replaceConstraintsPayloadWithAdditions:removals:keyPath:", v15, v27, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", *MEMORY[0x24BDD4E58], 25, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2;
    v31[3] = &unk_24E79AFA0;
    objc_copyWeak(&v33, &location);
    v32 = v14;
    v18 = (void *)MEMORY[0x227676638](objc_msgSend(v17, "setResponseHandler:", v31));
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v21;
      v37 = 2112;
      v38 = v17;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Relaying replace constraints message. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDAccessorySettingsMessageHandler messageDispatcher](v19, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:completionHandler:", v17, 0);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

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
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v15);
  }

}

- (HMDAccessorySettingsMessageController)messageController
{
  return (HMDAccessorySettingsMessageController *)objc_loadWeakRetained((id *)&self->_messageController);
}

- (NSMapTable)settingMessageMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (HMDUserMessagePolicy)onlyOwnerAllowedUserPolicy
{
  return (HMDUserMessagePolicy *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOnlyOwnerAllowedUserPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMDUserMessagePolicy)sharedAdminAllowedUserPolicy
{
  return (HMDUserMessagePolicy *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedAdminAllowedUserPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sharedAdminAllowedUserPolicy, 0);
  objc_storeStrong((id *)&self->_onlyOwnerAllowedUserPolicy, 0);
  objc_storeStrong((id *)&self->_settingMessageMap, 0);
  objc_destroyWeak((id *)&self->_messageController);
}

void __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3;
    v7[3] = &unk_24E79C2B8;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

void __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke_2;
    block[3] = &unk_24E79B440;
    block[4] = v6;
    v9 = v4;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
}

void __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  v4 = objc_msgSend(v2, "_decodeUpdateValueMessagePayload:outValue:", v3, &v14);
  v5 = v14;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", CFSTR("cv"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v6 + 16))(v6, v5, objc_msgSend(v7, "unsignedIntegerValue"), 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode response %@ of relayed update value message.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v7);
  }

}

uint64_t __74__HMDAccessorySettingsMessageHandler__handleReplaceConstraintsForKeyPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

uint64_t __64__HMDAccessorySettingsMessageHandler__handleReplaceConstraints___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

uint64_t __64__HMDAccessorySettingsMessageHandler__handleUpdatedConstraints___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

uint64_t __62__HMDAccessorySettingsMessageHandler__handleRemoveConstraint___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

uint64_t __59__HMDAccessorySettingsMessageHandler__handleAddConstraint___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

void __73__HMDAccessorySettingsMessageHandler__handleSettingUpdateValueByKeyPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v8);
  }
  else
  {
    v29[0] = *MEMORY[0x24BDD4E90];
    v9 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    encodeRootObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("cv");
    v30[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = 0;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding to the original update value request for target %@ with value: %@, configNum: %@, error: %@", (uint8_t *)&v19, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 48), "respondWithPayload:", v12);

  }
}

void __64__HMDAccessorySettingsMessageHandler__handleSettingUpdateValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v8);
  }
  else
  {
    v32[0] = *MEMORY[0x24BDD4E90];
    v9 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    encodeRootObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("cv");
    v33[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "destination");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "target");
      v21 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v23 = v16;
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = 0;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding to the original update value request for target %@ with value: %@, configNum: %@, error: %@", buf, 0x34u);

      v13 = v21;
    }

    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v12);

  }
}

void __65__HMDAccessorySettingsMessageHandler_registerForSettingMessages___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSettingUpdateValue:", v3);

}

void __65__HMDAccessorySettingsMessageHandler_registerForSettingMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleReplaceConstraints:", v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_248011 != -1)
    dispatch_once(&logCategory__hmf_once_t0_248011, &__block_literal_global_248012);
  return (id)logCategory__hmf_once_v1_248013;
}

void __49__HMDAccessorySettingsMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_248013;
  logCategory__hmf_once_v1_248013 = v0;

}

@end
