@implementation HMDXPCBackgroundMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "proxyConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v8, "isBackground");
    v12 = 0;
    if (v10 && v11)
    {
      objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", objc_opt_class(), v9, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", objc_opt_class(), v9, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if (!objc_msgSend(v14, "requiresEntitlement")
            || (objc_msgSend(v8, "proxyConnection"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "entitlements"),
                v16,
                (v17 & 2) != 0))
          {
            v12 = 1;
LABEL_19:

            goto LABEL_20;
          }
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = a1;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138543362;
            v28 = v21;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Handler does not support background access", (uint8_t *)&v27, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 80, 0, CFSTR("Handler does not support background access"), 0);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v22 = (void *)MEMORY[0x1D17BA0A0]();
          v23 = a1;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138543362;
            v28 = v25;
            _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing background policy", (uint8_t *)&v27, 0xCu);

          }
          objc_autoreleasePoolPop(v22);
        }
        v12 = -1;
        goto LABEL_19;
      }
      v12 = -1;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_20:

  return v12;
}

@end
