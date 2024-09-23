@implementation HMDCloudPairedMetadataVersionConfiguration

- (HMDCloudPairedMetadataVersionConfiguration)initWithAccessoryIdentifier:(id)a3 diagnostics:(id)a4
{
  id v7;
  id v8;
  HMDCloudPairedMetadataVersionConfiguration *v9;
  HMDCloudPairedMetadataVersionConfiguration *v10;
  HMDCloudPairedMetadataVersionConfiguration *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudPairedMetadataVersionConfiguration;
  v9 = -[HMDCloudPairedMetadataVersionConfiguration init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v10->_diagnostics, a4);
    v11 = v10;
  }

  return v10;
}

- (HMDCloudPairedMetadataVersionConfiguration)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  HMDCloudPairedMetadataDiagnostics *v15;
  HMDCloudPairedMetadataVersionConfiguration *v16;
  HMDCloudPairedMetadataVersionConfiguration *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[__CFString firmwareVersion](v6, "firmwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("d"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      objc_opt_class();
      v12 = objc_opt_isKindOfClass() & 1;
      if (v12)
        v13 = v11;
      else
        v13 = 0;
      v14 = v13;

      if (v12)
      {
        v15 = -[HMDCloudPairedMetadataDiagnostics initWithAccessoryIdentifier:jsonDictionary:]([HMDCloudPairedMetadataDiagnostics alloc], "initWithAccessoryIdentifier:jsonDictionary:", v6, v11);
        if (v15)
        {
          v16 = -[HMDCloudPairedMetadataVersionConfiguration initWithAccessoryIdentifier:diagnostics:](self, "initWithAccessoryIdentifier:diagnostics:", v6, v15);
          v17 = v16;
        }
        else
        {
          v27 = (void *)MEMORY[0x227676638]();
          v16 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 138543874;
            v32 = v29;
            v33 = 2112;
            v34 = CFSTR("d");
            v35 = 2112;
            v36 = v7;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", (uint8_t *)&v31, 0x20u);

          }
          objc_autoreleasePoolPop(v27);
          v17 = 0;
        }

      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543874;
          v32 = v26;
          v33 = 2112;
          v34 = CFSTR("d");
          v35 = 2112;
          v36 = v7;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", (uint8_t *)&v31, 0x20u);

        }
        objc_autoreleasePoolPop(v24);
        v17 = 0;
      }

    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543874;
        v32 = v23;
        v33 = 2112;
        v34 = CFSTR("d");
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON contains no '%@' value: %@", (uint8_t *)&v31, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v17 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v20;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Version configuration must contain firmware version: %@", (uint8_t *)&v31, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudPairedMetadataVersionConfiguration accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryIdentifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudPairedMetadataVersionConfiguration diagnostics](self, "diagnostics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("diagnosticsConfiguration"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)prettyJSONDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("versionConfiguration");
  -[HMDCloudPairedMetadataVersionConfiguration diagnostics](self, "diagnostics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (HMDCloudPairedMetadataDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_183179 != -1)
    dispatch_once(&logCategory__hmf_once_t0_183179, &__block_literal_global_183180);
  return (id)logCategory__hmf_once_v1_183181;
}

void __57__HMDCloudPairedMetadataVersionConfiguration_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_183181;
  logCategory__hmf_once_v1_183181 = v0;

}

@end
