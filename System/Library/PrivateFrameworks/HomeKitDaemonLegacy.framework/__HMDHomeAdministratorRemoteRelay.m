@implementation __HMDHomeAdministratorRemoteRelay

- (void)__handleXPCMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  __HMDHomeAdministratorRemoteRelay *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  void *v21;
  __HMDHomeAdministratorRemoteRelay *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  void (**v26)(_QWORD, _QWORD, _QWORD);
  id v27;
  id v28;
  _BYTE location[12];
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[__HMDHomeAdministratorReceiver receiver](self, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[__HMDHomeAdministratorReceiver handler](self, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v6, "operationForMessage:error:", v4, &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;
    if (v7)
    {
      objc_msgSend(v7, "setShouldSuspendSyncing:", 1);
      v9 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke;
      v25[3] = &unk_1E89C21C0;
      v10 = v6;
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
      v11 = v4;
      v27 = v11;
      objc_msgSend(v7, "setSendCompletionBlock:", v25);
      objc_msgSend(v7, "setResponseHandler:", 0);
      objc_initWeak((id *)location, v7);
      v18 = v9;
      v19 = 3221225472;
      v20 = __56____HMDHomeAdministratorRemoteRelay___handleXPCMessage___block_invoke_2;
      v21 = &unk_1E89BD988;
      objc_copyWeak(&v24, (id *)location);
      v22 = self;
      v23 = v11;
      objc_msgSend(v7, "setCompletionBlock:", &v18);
      objc_msgSend(v10, "addOperation:", v7, v18, v19, v20, v21, v22);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)location);

      v12 = v26;
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v16;
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create operation with error: %@", location, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v4, "responseHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_9;
      objc_msgSend(v4, "responseHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v12)[2](v12, v8, 0);
    }

LABEL_9:
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_162026 != -1)
    dispatch_once(&logCategory__hmf_once_t16_162026, &__block_literal_global_148_162027);
  return (id)logCategory__hmf_once_v17_162028;
}

@end
