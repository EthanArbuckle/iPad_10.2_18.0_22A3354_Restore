@implementation HMDMediaGroupsAggregatorBackupReceiver

- (HMDMediaGroupsAggregatorBackupReceiver)init
{
  HMDMediaGroupsAggregatorBackupReceiver *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDMediaGroupsAggregatorBackupReceiver;
  v2 = -[HMDMediaGroupsAggregatorBackupReceiver init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

  }
  return v2;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregatorBackupReceiver setIdentifier:](self, "setIdentifier:", v7);

  -[HMDMediaGroupsAggregatorBackupReceiver registerForMessagesWithHome:messageDispatcher:](self, "registerForMessagesWithHome:messageDispatcher:", v8, v6);
}

- (void)registerForMessagesWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = v9;
  v12[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("HMDMediaGroupsBackupDataMessage"), self, v11, sel_handleGroupsBackupDataMessage_);

}

- (void)handleGroupsBackupDataMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregatorBackupReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaGroupsAggregatorBackupReceiver *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDMediaGroupsAggregatorBackupReceiver *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDMediaGroupsAggregatorBackupReceiver *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v8;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling backup group data message: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "hmf_arrayForKey:", CFSTR("HMDMediaGroupsBackupDataKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HMDMediaGroupsAggregatorBackupReceiver delegate](v6, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v12, "didReceiveBackupData:forBackupReceiver:", v11, v6);
        objc_msgSend(v4, "respondWithSuccess");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x227676638]();
        v24 = v6;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543618;
          v28 = v26;
          v29 = 2112;
          v30 = v22;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify delegate of received backup due to unconfigured delegate error: %@", (uint8_t *)&v27, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(v4, "respondWithError:", v22);

        v13 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v21;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to decode group backup data payload: %@ error: %@", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v4, "respondWithError:", v13);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v17;
      v29 = 2112;
      v30 = v4;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from group backup data message: %@ error: %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregatorBackupReceiver identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsAggregatorBackupReceiverDelegate)delegate
{
  return (HMDMediaGroupsAggregatorBackupReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_6302 != -1)
    dispatch_once(&logCategory__hmf_once_t4_6302, &__block_literal_global_6303);
  return (id)logCategory__hmf_once_v5_6304;
}

void __53__HMDMediaGroupsAggregatorBackupReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_6304;
  logCategory__hmf_once_v5_6304 = v0;

}

@end
