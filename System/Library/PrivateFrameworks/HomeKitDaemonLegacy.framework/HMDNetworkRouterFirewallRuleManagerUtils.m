@implementation HMDNetworkRouterFirewallRuleManagerUtils

+ (id)dumpTLVsFromJSONData:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[2];
  _QWORD v66[2];
  uint8_t v67[128];
  uint8_t buf[4];
  id v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  +[HMDNetworkRouterFirewallRuleManagerOverrideParser parseFromData:](HMDNetworkRouterFirewallRuleManagerOverrideParser, "parseFromData:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__107560;
    v59 = __Block_byref_object_dispose__107561;
    v60 = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __71__HMDNetworkRouterFirewallRuleManagerUtils_dumpTLVsFromJSONData_error___block_invoke;
    v52[3] = &unk_1E89B31A8;
    v54 = &v55;
    v44 = v4;
    v53 = v44;
    objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v52);
    v5 = (void *)v56[5];
    if (v5)
    {
      if (a4)
      {
        v6 = objc_retainAutorelease(v5);
LABEL_12:
        v7 = 0;
        *a4 = v6;
LABEL_43:

        _Block_object_dispose(&v55, 8);
        goto LABEL_44;
      }
    }
    else
    {
      if (!objc_msgSend(v44, "hmf_isEmpty"))
      {
        if ((unint64_t)objc_msgSend(v44, "count") >= 2)
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v44, "count");
            *(_DWORD *)buf = 138543618;
            v69 = v13;
            v70 = 2048;
            v71 = v14;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Multiple declarations (%lu) found, choosing the first", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v11);
        }
        objc_msgSend(v44, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ruleConfigurations");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "hmf_isEmpty"))
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v17;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@No rule configurations were found", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
            v7 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = 0;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          obj = v38;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
          if (v18)
          {
            v42 = *(_QWORD *)v49;
            while (2)
            {
              v19 = 0;
              v41 = v18;
              do
              {
                if (*(_QWORD *)v49 != v42)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v19);
                +[HMDNetworkRouterWANFirewallConfiguration configurationFromFirewallRuleConfiguration:](HMDNetworkRouterWANFirewallConfiguration, "configurationFromFirewallRuleConfiguration:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                +[HMDNetworkRouterLANFirewallConfiguration configurationFromFirewallRuleConfiguration:](HMDNetworkRouterLANFirewallConfiguration, "configurationFromFirewallRuleConfiguration:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "serializeWithError:", a4);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  objc_msgSend(v22, "serializeWithError:", a4);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v24)
                  {
                    v65[0] = CFSTR("wan");
                    objc_msgSend(v23, "hmf_hexadecimalStringWithOptions:", 2);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v65[1] = CFSTR("lan");
                    v66[0] = v43;
                    objc_msgSend(v24, "hmf_hexadecimalStringWithOptions:", 2);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v66[1] = v25;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "accessoryIdentifier");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "firmwareVersion");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "versionString");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "setObject:forKeyedSubscript:", v26, v29);

                    v30 = 0;
                  }
                  else
                  {
                    v30 = 1;
                  }

                }
                else
                {
                  v30 = 1;
                }

                if (v30)
                {
                  v7 = 0;
                  goto LABEL_40;
                }
                ++v19;
              }
              while (v41 != v19);
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
              if (v18)
                continue;
              break;
            }
          }

          objc_msgSend(v37, "baseAccessoryIdentifier");
          obj = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "productGroup");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v31;
          objc_msgSend(obj, "productNumber");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v32;
          v33 = (void *)objc_msgSend(v39, "copy");
          v62 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v35, 3, a4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
        }

        goto LABEL_43;
      }
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@No network declarations were found", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v7 = 0;
    goto LABEL_43;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_44:

  return v7;
}

void __71__HMDNetworkRouterFirewallRuleManagerUtils_dumpTLVsFromJSONData_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v7, v10, 1);
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid declarations found", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      *a4 = 1;
    }

  }
}

@end
