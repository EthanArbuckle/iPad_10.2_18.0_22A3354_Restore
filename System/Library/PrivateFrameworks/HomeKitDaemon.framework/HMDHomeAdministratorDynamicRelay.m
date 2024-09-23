@implementation HMDHomeAdministratorDynamicRelay

uint64_t __60____HMDHomeAdministratorDynamicRelay___handleRemoteMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchMessage:", a2);
}

void __57____HMDHomeAdministratorDynamicRelay___handleXPCMessage___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 && HMDIsAllowedFallbackRemoteError(v5))
  {
    objc_msgSend(a1[4], "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceHomeKitSetupSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markHasFailedRelayAttempt");

    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1[5];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Allowing local fallback processing of message %{public}@ due to error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = a1[6];
    v15.receiver = a1[5];
    v15.super_class = (Class)__HMDHomeAdministratorDynamicRelay;
    objc_msgSendSuper2(&v15, sel___handleXPCMessage_, v14);
  }
  else
  {
    objc_msgSend(a1[6], "respondWithPayload:error:", v6, v5);
  }

}

uint64_t __66____HMDHomeAdministratorDynamicRelay_registerForMessage_policies___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

void __49____HMDHomeAdministratorDynamicRelay_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_225327;
  logCategory__hmf_once_v13_225327 = v0;

}

@end
