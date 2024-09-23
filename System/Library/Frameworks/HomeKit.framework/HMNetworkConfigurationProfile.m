@implementation HMNetworkConfigurationProfile

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (HMNetworkConfigurationProfile)initWithAccessoryIdentifier:(id)a3 targetProtection:(int64_t)a4 currentProtection:(int64_t)a5 networkAccessRestricted:(BOOL)a6 allowedHosts:(id)a7 accessViolation:(id)a8 supportsWiFiReconfiguration:(BOOL)a9 credentialType:(int64_t)a10
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  _HMNetworkConfigurationProfile *v18;
  HMNetworkConfigurationProfile *v19;
  uint64_t v21;
  objc_super v23;

  v11 = a6;
  v15 = a8;
  v16 = a7;
  v17 = a3;
  LOBYTE(v21) = a9;
  v18 = -[_HMNetworkConfigurationProfile initWithAccessoryIdentifier:targetProtection:currentProtection:networkAccessRestricted:allowedHosts:accessViolation:supportsWiFiReconfiguration:credentialType:]([_HMNetworkConfigurationProfile alloc], "initWithAccessoryIdentifier:targetProtection:currentProtection:networkAccessRestricted:allowedHosts:accessViolation:supportsWiFiReconfiguration:credentialType:", v17, a4, a5, v11, v16, v15, v21, a10);

  v23.receiver = self;
  v23.super_class = (Class)HMNetworkConfigurationProfile;
  v19 = -[HMAccessoryProfile initWithAccessoryProfile:](&v23, sel_initWithAccessoryProfile_, v18);
  if (v19)
    -[_HMNetworkConfigurationProfile setDelegate:](v18, "setDelegate:", v19);

  return v19;
}

uint64_t __76___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiCredentialType__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkConfigurationProfileDidUpdateWiFiCredentialType:", *(_QWORD *)(a1 + 40));
}

uint64_t __84___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiReconfigurationSupport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkConfigurationProfileDidUpdateWiFiReconfigurationSupport:", *(_QWORD *)(a1 + 40));
}

uint64_t __73___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAccessViolation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkConfigurationProfileDidUpdateAccessViolation:", *(_QWORD *)(a1 + 40));
}

uint64_t __70___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAllowedHosts__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkConfigurationProfileDidUpdateAllowedHosts:", *(_QWORD *)(a1 + 40));
}

uint64_t __75___HMNetworkConfigurationProfile__notifyDelegateOfNetworkAccessModeChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkConfigurationProfileDidUpdateNetworkAccessMode:", *(_QWORD *)(a1 + 40));
}

uint64_t __72___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedProtectionMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkConfigurationProfileDidUpdateProtectionMode:", *(_QWORD *)(a1 + 40));
}

void __96___HMNetworkConfigurationProfile_previewAllowedHostsForAutoProtectionModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *context;
  id v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("allowed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v11, v8, &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;
    if (v12)
    {
      v14 = (uint64_t)v5;
    }
    else
    {
      context = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = WeakRetained;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive NSArray<HMAccessoryAllowedHost *>: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (v13)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v25 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v17, "hmErrorWithCode:userInfo:", -1, v18);
      v14 = objc_claimAutoreleasedReturnValue();

      if (v13)
    }

    v5 = (id)v14;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(WeakRetained, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegateCaller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:obj:error:", *(_QWORD *)(a1 + 32), v12, v5);

}

void __79___HMNetworkConfigurationProfile_reconfigureWiFiWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __45___HMNetworkConfigurationProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26;
  logCategory__hmf_once_v26 = v0;

}

- (BOOL)isNetworkAccessRestricted
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "isNetworkAccessRestricted");
  return v5;
}

- (void)networkConfigurationProfileDidUpdateProtectionMode:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  -[HMNetworkConfigurationProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE459818))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateProtectionMode___block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)networkConfigurationProfileDidUpdateNetworkAccessMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  HMNetworkConfigurationProfile *v10;

  -[HMNetworkConfigurationProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateNetworkAccessMode___block_invoke;
    v8[3] = &unk_1E3AB5ED8;
    v9 = v4;
    v10 = self;
    objc_msgSend(v7, "invokeBlock:", v8);

  }
}

- (void)networkConfigurationProfileDidUpdateAllowedHosts:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMNetworkConfigurationProfile *v12;

  -[HMNetworkConfigurationProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE459818))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAllowedHosts___block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v6;
    v12 = self;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)networkConfigurationProfileDidUpdateAccessViolation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMNetworkConfigurationProfile *v12;

  -[HMNetworkConfigurationProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE459818))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAccessViolation___block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v6;
    v12 = self;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)networkConfigurationProfileDidUpdateWiFiReconfigurationSupport:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMNetworkConfigurationProfile *v12;

  -[HMNetworkConfigurationProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE459818))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __96__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiReconfigurationSupport___block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v6;
    v12 = self;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)networkConfigurationProfileDidUpdateWiFiCredentialType:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMNetworkConfigurationProfile *v12;

  -[HMNetworkConfigurationProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE459818))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiCredentialType___block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v6;
    v12 = self;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __88__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiCredentialType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "profileDidUpdateWiFiCredentialType:", *(_QWORD *)(a1 + 40));
}

uint64_t __96__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiReconfigurationSupport___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "profileDidUpdateWiFiReconfigurationSupport:", *(_QWORD *)(a1 + 40));
}

uint64_t __85__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAccessViolation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "profileDidUpdateAccessViolation:", *(_QWORD *)(a1 + 40));
}

uint64_t __82__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAllowedHosts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "profileDidUpdateAllowedHosts:", *(_QWORD *)(a1 + 40));
}

uint64_t __87__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateNetworkAccessMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "profileDidUpdateNetworkAccessMode:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateProtectionMode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Telling delegate that network configuration profile did update protection mode. Delegate: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "profileDidUpdateNetworkProtectionMode:", *(_QWORD *)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44 != -1)
    dispatch_once(&logCategory__hmf_once_t44, &__block_literal_global_218);
  return (id)logCategory__hmf_once_v45;
}

void __44__HMNetworkConfigurationProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v45;
  logCategory__hmf_once_v45 = v0;

}

- (int64_t)currentProtectionMode
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "currentProtectionMode");
  return v5;
}

- (int64_t)targetProtectionMode
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "targetProtectionMode");
  return v5;
}

- (NSArray)allowedHosts
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "allowedHosts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (HMAccessoryNetworkAccessViolation)accessViolation
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "accessViolation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessoryNetworkAccessViolation *)v5;
}

- (BOOL)supportsWiFiReconfiguration
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "supportsWiFiReconfiguration");
  return v5;
}

- (int64_t)credentialType
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "credentialType");
  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMNetworkConfigurationProfile;
  v5 = -[HMAccessoryProfile mergeFromNewObject:](&v15, sel_mergeFromNewObject_, v4);
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v8, "accessoryProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "mergeFromNewObject:", v12);

    v5 |= v13;
  }

  return v5;
}

- (void)reconfigureWiFiWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v10 = a3;
  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "reconfigureWiFiWithOptions:completionHandler:", v10, v6);
}

- (void)previewAllowedHostsForAutoProtectionModeWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "previewAllowedHostsForAutoProtectionModeWithCompletionHandler:", v7);
}

@end
