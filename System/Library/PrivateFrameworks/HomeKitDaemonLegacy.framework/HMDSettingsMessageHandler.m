@implementation HMDSettingsMessageHandler

- (HMDSettingsMessageHandler)initWithQueue:(id)a3
{
  id v5;
  HMDSettingsMessageHandler *v6;
  HMDSettingsMessageHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSettingsMessageHandler;
  v6 = -[HMDSettingsMessageHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4
{
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  HMDSettingsMessageHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  SEL v16;
  void *v17;
  id v18;
  void *v19;
  SEL v20;
  id newValue;
  __int128 buf;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  newValue = a3;
  v7 = a4;
  if (self)
    objc_setProperty_atomic(self, v6, newValue, 16);
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingsMessageHandler setMessageTargetUUID:](self, "setMessageTargetUUID:", v8);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_setProperty_atomic(self, v9, v10, 32);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering for setting messages.", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v15;
    *((_QWORD *)&buf + 1) = objc_getProperty(v12, v16, 32, 1);
    v23 = v10;
    v17 = (void *)MEMORY[0x1E0C99D20];
    v18 = *((id *)&buf + 1);
    objc_msgSend(v17, "arrayWithObjects:count:", &buf, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(objc_getProperty(v12, v20, 16, 1), "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9B68], v12, v19, sel__handleUpdateValue_);
  }

}

- (void)_handleUpdateValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  HMDSettingsMessageHandler *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDSettingsMessageHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMDSettingsMessageHandler *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDSettingsMessageHandler *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDSettingsMessageHandler *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E0CB9B60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CBA050]))
  {
    -[HMDSettingsMessageHandler sharedMessageController](self, "sharedMessageController");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB9FD0]))
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v30;
        v50 = 2112;
        v51 = v6;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Settings update message target type (%@) is unknown", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = 3;
      goto LABEL_22;
    }
    -[HMDSettingsMessageHandler privateMessageController](self, "privateMessageController");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (!v7)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v24;
      v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@No message controller to update value for message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = 2;
LABEL_22:
    objc_msgSend(v25, "hmErrorWithCode:", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v31);
    v11 = 0;
    goto LABEL_36;
  }
  v9 = v4;
  v10 = v8;
  v11 = v10;
  if (self)
  {
    v11 = v10;
    objc_msgSend(v9, "messagePayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_UUIDForKey:", CFSTR("kUserUUIDKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13
      && (objc_msgSend(v11, "userUUID"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "hmf_isEqualToUUID:", v13),
          v14,
          (v15 & 1) != 0))
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Only current user may make changes", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v9, "respondWithError:", v16);

      goto LABEL_15;
    }

    objc_msgSend(v5, "hmf_dataForKey:", *MEMORY[0x1E0CB7EE8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v9, "messagePayload");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hmf_stringForKey:", *MEMORY[0x1E0CB9B58]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v33)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = v34;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v38;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Received request to update value.", buf, 0xCu);

          v34 = v44;
        }

        objc_autoreleasePoolPop(v34);
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __48__HMDSettingsMessageHandler__handleUpdateValue___block_invoke;
        v46[3] = &unk_1E89C2350;
        v47 = v9;
        objc_msgSend(v11, "updateWithEncodedValue:onSettingKeyPath:completion:", v31, v33, v46);
        v39 = v47;
      }
      else
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v45;
          v50 = 2112;
          v51 = v5;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Missing key path from user settings update message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "respondWithError:", v39);
      }

    }
    else
    {
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v43;
        v50 = 2112;
        v51 = v5;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Missing updated serialized value from payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "respondWithError:", v33);
    }

LABEL_36:
    goto LABEL_37;
  }
LABEL_15:

LABEL_37:
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDSettingsMessageHandler *)objc_getProperty(self, a2, 24, 1);
  return (OS_dispatch_queue *)self;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (void)setMessageTargetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageTargetUUID, a3);
}

- (HMDSettingsMessageController)privateMessageController
{
  return (HMDSettingsMessageController *)objc_loadWeakRetained((id *)&self->_privateMessageController);
}

- (void)setPrivateMessageController:(id)a3
{
  objc_storeWeak((id *)&self->_privateMessageController, a3);
}

- (HMDSettingsMessageController)sharedMessageController
{
  return (HMDSettingsMessageController *)objc_loadWeakRetained((id *)&self->_sharedMessageController);
}

- (void)setSharedMessageController:(id)a3
{
  objc_storeWeak((id *)&self->_sharedMessageController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sharedMessageController);
  objc_destroyWeak((id *)&self->_privateMessageController);
  objc_storeStrong((id *)&self->_anyUserAllowedPolicy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

uint64_t __48__HMDSettingsMessageHandler__handleUpdateValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_19306 != -1)
    dispatch_once(&logCategory__hmf_once_t7_19306, &__block_literal_global_19307);
  return (id)logCategory__hmf_once_v8_19308;
}

void __40__HMDSettingsMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_19308;
  logCategory__hmf_once_v8_19308 = v0;

}

@end
