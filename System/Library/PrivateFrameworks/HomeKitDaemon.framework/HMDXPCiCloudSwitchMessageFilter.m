@implementation HMDXPCiCloudSwitchMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_28:
    _HMFPreconditionFailure();
  }
  v10 = v9;
  if (!v9)
    goto LABEL_28;
  objc_msgSend(v8, "proxyConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = 0;
    goto LABEL_26;
  }
  if ((objc_msgSend(a1, "isHomeiCloudSwitchEnabled") & 1) == 0)
  {
    objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", objc_opt_class(), v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Rejecting message because iCloud switch is disabled and no explicit policy exists: %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2013);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = -1;
      goto LABEL_25;
    }
    objc_msgSend(v8, "proxyConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v13, "bundleIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v16);

      if ((v18 & 1) != 0)
      {
        v12 = 1;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v27;
        v35 = 2112;
        v36 = v28;
        v37 = 2112;
        v38 = v16;
        v29 = "%{public}@Rejecting message because iCloud switch is disabled and bundle identifier is not allowed: %@ / %@";
        v30 = v26;
        v31 = 32;
        goto LABEL_20;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v27;
        v35 = 2112;
        v36 = v28;
        v29 = "%{public}@Rejecting message because iCloud switch is disabled and no bundle identifier was found: %@";
        v30 = v26;
        v31 = 22;
LABEL_20:
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, v29, (uint8_t *)&v33, v31);

      }
    }

    objc_autoreleasePoolPop(v24);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2013);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = -1;
    goto LABEL_24;
  }
  v12 = 1;
LABEL_26:

  return v12;
}

+ (void)setHomeiCloudSwitchEnabledOverride:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)homeiCloudSwitchEnabledOverrideNumber;
  homeiCloudSwitchEnabledOverrideNumber = v3;

}

+ (void)stopOverridingHomeiCloudSwitchEnabled
{
  void *v2;

  v2 = (void *)homeiCloudSwitchEnabledOverrideNumber;
  homeiCloudSwitchEnabledOverrideNumber = 0;

}

+ (BOOL)isHomeiCloudSwitchEnabled
{
  void *v3;
  char v4;

  if (homeiCloudSwitchEnabledOverrideNumber)
    return objc_msgSend((id)homeiCloudSwitchEnabledOverrideNumber, "BOOLValue");
  +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHomeEnabled");

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_104212 != -1)
    dispatch_once(&logCategory__hmf_once_t6_104212, &__block_literal_global_104213);
  return (id)logCategory__hmf_once_v7_104214;
}

void __46__HMDXPCiCloudSwitchMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_104214;
  logCategory__hmf_once_v7_104214 = v0;

}

@end
