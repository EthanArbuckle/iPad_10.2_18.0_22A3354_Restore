@implementation HMDAccessorySettingsLegacyMessageReceiver

- (HMDAccessorySettingsLegacyMessageReceiver)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDAccessorySettingsLegacyMessageReceiver *v10;
  HMDAccessorySettingsLegacyMessageReceiver *v11;
  HMDAccessorySettingsLegacyMessageReceiver *result;
  HMDAccessorySettingsLegacyMessageReceiver *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDAccessorySettingsLegacyMessageReceiver *)_HMFPreconditionFailure();
    -[HMDAccessorySettingsLegacyMessageReceiver registerForMessagesWithHome:](v13, v14, v15);
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessorySettingsLegacyMessageReceiver;
  v10 = -[HMDAccessorySettingsLegacyMessageReceiver init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

- (void)registerForMessagesWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingsLegacyMessageReceiver messageDispatcher](self, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB7EF0];
  v16[0] = v5;
  v16[1] = v6;
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", v10, self, v11, sel_routeAccessorySettingsFetchRequestMessage_);

  -[HMDAccessorySettingsLegacyMessageReceiver messageDispatcher](self, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB7F00];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", v13, self, v14, sel_routeAccessorySettingsUpdateRequestMessage_);

}

- (void)routeAccessorySettingsFetchRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingsLegacyMessageReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessorySettingsLegacyMessageReceiver *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing legacy fetch request message: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessorySettingsLegacyMessageReceiver messenger](v6, "messenger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "routeAccessorySettingsFetchRequestMessage:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle legacy fetch request message due to unconfigured messenger error: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v4, "respondWithError:", v11);

  }
}

- (void)routeAccessorySettingsUpdateRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingsLegacyMessageReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessorySettingsLegacyMessageReceiver *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing legacy update request message: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessorySettingsLegacyMessageReceiver messenger](v6, "messenger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "routeAccessorySettingsUpdateRequestMessage:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle legacy update request message due to unconfigured messenger error: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v4, "respondWithError:", v11);

  }
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (HMDAccessorySettingsMessenger)messenger
{
  return (HMDAccessorySettingsMessenger *)objc_loadWeakRetained((id *)&self->_messenger);
}

- (void)setMessenger:(id)a3
{
  objc_storeWeak((id *)&self->_messenger, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_messenger);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

@end
