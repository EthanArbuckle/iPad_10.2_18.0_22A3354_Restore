@implementation HMDAccessCodeManagerUtilities

+ (id)addedAccessoryAccessCodesFromModificationResponses:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_249);
}

+ (id)updatedAccessoryAccessCodesFromModificationResponses:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_250);
}

+ (id)removedAccessoryAccessCodesFromModificationResponses:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_251);
}

+ (id)filteredFetchResponses:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isAdministrator");
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@User: %@ is an admin, so we can safely send all the fetch responses.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v15 = v6;
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@User: %@ is not an admin, so redact all access codes except the user's own.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke;
    v19[3] = &unk_24E773D08;
    v20 = v7;
    objc_msgSend(v6, "na_map:", v19);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

+ (BOOL)anyModificationFailed:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_256);
}

+ (BOOL)allModificationRequests:(id)a3 areAddingAccessCode:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__HMDAccessCodeManagerUtilities_allModificationRequests_areAddingAccessCode___block_invoke;
  v8[3] = &unk_24E774288;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "na_all:", v8);

  return (char)a3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1)
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_259);
  return (id)logCategory__hmf_once_v10;
}

void __44__HMDAccessCodeManagerUtilities_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10;
  logCategory__hmf_once_v10 = v0;

}

uint64_t __77__HMDAccessCodeManagerUtilities_allModificationRequests_areAddingAccessCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "accessCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __55__HMDAccessCodeManagerUtilities_anyModificationFailed___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "accessoryAccessCodeValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke_2;
  v11[3] = &unk_24E78F610;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_filter:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD7320]);
  objc_msgSend(v3, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v7, v5, v8);
  return v9;
}

uint64_t __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "accessCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

id __86__HMDAccessCodeManagerUtilities_removedAccessoryAccessCodesFromModificationResponses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "operationType");
  objc_msgSend(v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v3 == 2 && !v4)
  {
    objc_msgSend(v2, "accessoryAccessCodeValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __86__HMDAccessCodeManagerUtilities_updatedAccessoryAccessCodesFromModificationResponses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "operationType");
  objc_msgSend(v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v3 == 1 && !v4)
  {
    objc_msgSend(v2, "accessoryAccessCodeValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __84__HMDAccessCodeManagerUtilities_addedAccessoryAccessCodesFromModificationResponses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "operationType");
  objc_msgSend(v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (!v3 && !v4)
  {
    objc_msgSend(v2, "accessoryAccessCodeValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
