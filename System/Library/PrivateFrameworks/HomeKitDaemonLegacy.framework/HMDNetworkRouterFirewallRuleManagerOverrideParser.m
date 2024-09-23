@implementation HMDNetworkRouterFirewallRuleManagerOverrideParser

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_12224 != -1)
    dispatch_once(&logCategory__hmf_once_t0_12224, &__block_literal_global_12225);
  return (id)logCategory__hmf_once_v1_12226;
}

+ (id)parseFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *, _BYTE *);
  void *v32;
  id v33;
  _BYTE *v34;
  id v35;
  id v36;
  uint8_t v37[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE buf[24];
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v36;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v14 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v42 = 0;
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke;
      v32 = &unk_1E89A5830;
      v34 = buf;
      v35 = a1;
      v19 = v18;
      v33 = v19;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v29);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        v13 = 0;
      }
      else
      {
        if (!objc_msgSend(v19, "count", v29, v30, v31, v32))
        {
          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = a1;
          HMFGetOSLogHandle();
          v26 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v37 = 138543618;
            v38 = v27;
            v39 = 2112;
            v40 = v14;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@JSON contains no overrides: %@", v37, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
        }
        v13 = (void *)objc_msgSend(v19, "copy");
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON is not a dictionary: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v13 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }

  return v13;
}

+ (id)_parseOverrideNetworkDeclarationsWithProductGroup:(id)a3 productNumber:(id)a4 productNumberDictionary:(id)a5 accessoryIdentifier:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v31;
  void *contexta;
  void *context;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  v12 = a6;
  -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, &v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v35;
    if (v16)
    {
      v18 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v12, v16, 1);
      if (v18)
      {
        v19 = v16;
      }
      else
      {
        context = (void *)MEMORY[0x1D17BA0A0]();
        v28 = a1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v37 = v31;
          v38 = 2112;
          v39 = v34;
          v40 = 2112;
          v41 = v10;
          v42 = 2112;
          v43 = v11;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' did not parse correctly: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(context);
        v19 = 0;
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        contexta = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v37 = v27;
        v38 = 2112;
        v39 = v34;
        v40 = 2112;
        v41 = v10;
        v42 = 2112;
        v43 = v11;
        v44 = 2112;
        v45 = v17;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' failed to convert to JSON: %@: %@", buf, 0x34u);

        v24 = contexta;
      }

      objc_autoreleasePoolPop(v24);
      v19 = 0;
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v37 = v23;
      v38 = 2112;
      v39 = v34;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = CFSTR("networkDeclarations");
      v44 = 2112;
      v45 = v13;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON for '%@':'%@' contains an invalid '%@' value: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

+ (id)_parseOverridePairedMetadataWithProductGroup:(id)a3 productNumber:(id)a4 productNumberDictionary:(id)a5 accessoryIdentifier:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  HMDCloudPairedMetadata *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v31;
  void *contexta;
  void *context;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  v12 = a6;
  -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, &v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v35;
    if (v16)
    {
      v18 = -[HMDCloudPairedMetadata initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDCloudPairedMetadata alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v12, v16, 1);
      if (v18)
      {
        v19 = v16;
      }
      else
      {
        context = (void *)MEMORY[0x1D17BA0A0]();
        v28 = a1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v37 = v31;
          v38 = 2112;
          v39 = v34;
          v40 = 2112;
          v41 = v10;
          v42 = 2112;
          v43 = v11;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' did not parse correctly: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(context);
        v19 = 0;
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        contexta = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v37 = v27;
        v38 = 2112;
        v39 = v34;
        v40 = 2112;
        v41 = v10;
        v42 = 2112;
        v43 = v11;
        v44 = 2112;
        v45 = v17;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' failed to convert to JSON: %@: %@", buf, 0x34u);

        v24 = contexta;
      }

      objc_autoreleasePoolPop(v24);
      v19 = 0;
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v37 = v23;
      v38 = 2112;
      v39 = v34;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = CFSTR("pairedMetadata");
      v44 = 2112;
      v45 = v13;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON for '%@':'%@' contains an invalid '%@' value: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

void __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke_6;
      v19[3] = &unk_1E89BB9E8;
      v22 = *(_QWORD *)(a1 + 40);
      v13 = v7;
      v14 = *(_QWORD *)(a1 + 48);
      v20 = v13;
      v23 = v14;
      v21 = *(id *)(a1 + 32);
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v19);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v18;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v10;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@JSON value for '%@' is not a dictionary: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

  }
}

void __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke_6(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  const char *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *contextb;
  void *context;
  void *contexta;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[HMDAccessory validateProductData:](HMDAccessory, "validateProductData:", v9))
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = (uint64_t)v20;
        v53 = 2112;
        v54 = v9;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Computed product data is invalid: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_39;
    }
    v10 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", *(_QWORD *)(a1 + 32), v7, 0);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v52 = (uint64_t)v15;
        v53 = 2112;
        v54 = v16;
        v55 = 2112;
        v56 = v7;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Overrides contain multiple entries for '%@':'%@'", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_38;
    }
    v21 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    if (!v23)
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        contextb = v31;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v52 = (uint64_t)v34;
        v53 = 2112;
        v54 = v35;
        v55 = 2112;
        v56 = v7;
        v57 = 2112;
        v58 = v21;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@JSON value for '%@':'%@' is not a dictionary: %@", buf, 0x2Au);

        v31 = contextb;
      }

      objc_autoreleasePoolPop(v31);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      +[HMDNetworkRouterFirewallRuleManagerOverrideParser _parseOverrideNetworkDeclarationsWithProductGroup:productNumber:productNumberDictionary:accessoryIdentifier:](HMDNetworkRouterFirewallRuleManagerOverrideParser, "_parseOverrideNetworkDeclarationsWithProductGroup:productNumber:productNumberDictionary:accessoryIdentifier:", *(_QWORD *)(a1 + 32), v7, v23, v10);
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          context = v36;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          v52 = (uint64_t)v39;
          v53 = 2112;
          v54 = v40;
          v55 = 2112;
          v56 = v7;
          v57 = 2112;
          v58 = v23;
          v41 = "%{public}@JSON dictionary for '%@':'%@' did not parse network declarations correctly: %@";
LABEL_34:
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x2Au);

          v36 = context;
        }
LABEL_35:

        objc_autoreleasePoolPop(v36);
LABEL_36:

LABEL_37:
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      v27 = (void *)v26;
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("networkDeclarations"));

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
LABEL_21:
      if (objc_msgSend(v23, "count"))
      {
        v30 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v30, v10);

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        contexta = (void *)MEMORY[0x1D17BA0A0]();
        v42 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          v52 = v44;
          v46 = (void *)v44;
          v53 = 2112;
          v54 = v45;
          v55 = 2112;
          v56 = v7;
          v57 = 2112;
          v58 = v23;
          _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' did not have network declaration or pairedMetadata: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(contexta);
      }

      goto LABEL_36;
    }
    +[HMDNetworkRouterFirewallRuleManagerOverrideParser _parseOverridePairedMetadataWithProductGroup:productNumber:productNumberDictionary:accessoryIdentifier:](HMDNetworkRouterFirewallRuleManagerOverrideParser, "_parseOverridePairedMetadataWithProductGroup:productNumber:productNumberDictionary:accessoryIdentifier:", *(_QWORD *)(a1 + 32), v7, v23, v10);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v28 = (void *)v29;
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("pairedMetadata"));
      goto LABEL_21;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      context = v36;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v52 = (uint64_t)v39;
      v53 = 2112;
      v54 = v47;
      v55 = 2112;
      v56 = v7;
      v57 = 2112;
      v58 = v23;
      v41 = "%{public}@JSON dictionary for '%@':'%@' did not parse pairedMetadata correctly: %@";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  *a4 = 1;
LABEL_40:

}

void __64__HMDNetworkRouterFirewallRuleManagerOverrideParser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_12226;
  logCategory__hmf_once_v1_12226 = v0;

}

@end
