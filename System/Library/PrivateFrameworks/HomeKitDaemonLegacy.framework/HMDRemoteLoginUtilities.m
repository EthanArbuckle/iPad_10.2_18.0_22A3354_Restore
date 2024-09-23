@implementation HMDRemoteLoginUtilities

+ (int64_t)serviceTypeForAccountService:(unint64_t)a3
{
  return 2 * (a3 == 0);
}

+ (ACAccount)primaryITunesAccount
{
  void *v2;
  void *v3;
  void *v4;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v4;
}

+ (void)fetchIsTwoFactorAuthenticationEnabledForAccountWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alternateDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v14, "setUsername:", v10);
  objc_msgSend(v14, "setAltDSID:", v13);
  objc_msgSend(v14, "setIsUsernameEditable:", 0);
  objc_msgSend(v14, "setReason:", v6);
  objc_msgSend(v14, "setServiceType:", 0);
  v15 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v14, "setShouldPreventInteractiveAuth:", 1));
  v16 = a1;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v18;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Querying 2FA status with username: %@ altDSID: %@ reason: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  v19 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __103__HMDRemoteLoginUtilities_fetchIsTwoFactorAuthenticationEnabledForAccountWithReason_completionHandler___block_invoke;
  v21[3] = &unk_1E89BF370;
  v22 = v7;
  v23 = v16;
  v20 = v7;
  objc_msgSend(v19, "authenticateWithContext:completion:", v14, v21);

}

+ (BOOL)isTwoFactorAuthenticationEnabledForAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)objc_msgSend(v5, "securityLevelForAccount:", v6) > 2;

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_173687 != -1)
    dispatch_once(&logCategory__hmf_once_t4_173687, &__block_literal_global_173688);
  return (id)logCategory__hmf_once_v5_173689;
}

void __38__HMDRemoteLoginUtilities_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_173689;
  logCategory__hmf_once_v5_173689 = v0;

}

void __103__HMDRemoteLoginUtilities_fetchIsTwoFactorAuthenticationEnabledForAccountWithReason_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "hmf_BOOLForKey:", *MEMORY[0x1E0CFFF88]);
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v12 = "%{public}@Authentication result shows isTwoFactorAuthorizationEnabled=%@";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 0x16u);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Unable to directly determine 2FA authentication status: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 40), "isTwoFactorAuthenticationEnabledForAccount");
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v12 = "%{public}@Account security level shows isTwoFactorAuthorizationEnabled=%@";
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
