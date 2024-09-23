@implementation HMDXPCEntitlementMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "proxyConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", objc_opt_class(), v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "entitlements");
        objc_msgSend(v8, "proxyConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13 & ~objc_msgSend(v14, "entitlements");

        if (!v15)
        {
          v22 = 1;
          goto LABEL_15;
        }
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = a1;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          HMXPCClientEntitlementsToComponents(v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543874;
          v29 = v19;
          v30 = 2112;
          v31 = v20;
          v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message, %@, client is missing the following entitlements: %@", (uint8_t *)&v28, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 80);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = a1;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543362;
          v29 = v26;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing XPC policy", (uint8_t *)&v28, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
      }
      v22 = -1;
LABEL_15:

      goto LABEL_16;
    }
  }
  v22 = 0;
LABEL_16:

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_118380 != -1)
    dispatch_once(&logCategory__hmf_once_t2_118380, &__block_literal_global_118381);
  return (id)logCategory__hmf_once_v3_118382;
}

void __45__HMDXPCEntitlementMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_118382;
  logCategory__hmf_once_v3_118382 = v0;

}

@end
