@implementation HMDNetworkRouterFirewallRuleCloudNetworkDeclarations

- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 name:(id)a4 lastModifiedTime:(id)a5 ruleConfigurationsByVersionString:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v15;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v16;
  uint64_t v17;
  NSDictionary *ruleConfigurationsByVersionString;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDNetworkRouterFirewallRuleCloudNetworkDeclarations;
  v15 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_baseAccessoryIdentifier, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    objc_storeStrong((id *)&v16->_lastModifiedTime, a5);
    v17 = objc_msgSend(v14, "copy");
    ruleConfigurationsByVersionString = v16->_ruleConfigurationsByVersionString;
    v16->_ruleConfigurationsByVersionString = (NSDictionary *)v17;

    v19 = v16;
  }

  return v16;
}

- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4
{
  return -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:allowUnzippedData:](self, "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", a3, a4, 0);
}

- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4 allowUnzippedData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v17;
  id v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  id v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (v13)
  {
    v18 = v10;
    objc_opt_class();
    v19 = objc_opt_isKindOfClass() & 1;
    if (v19)
      v20 = v18;
    else
      v20 = 0;
    v32 = v20;

    if (v19)
    {
      v34 = 0;
      v22 = decodeStringFromJSONDictionary(v18, CFSTR("n"), 1, &v34);
      v23 = v34;
      if (v22)
      {
        v33 = 0;
        v24 = decodeTimeFromJSONDictionary(v18, CFSTR("t"), &v33);
        v25 = v33;
        if (v24)
        {
          v26 = v25;
          objc_msgSend((id)objc_opt_class(), "__decodeRuleConfigurationsFromJSONDictionary:baseAccessoryIdentifier:allowUnzippedData:", v18, v8, v5, v32);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            self = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:name:lastModifiedTime:ruleConfigurationsByVersionString:](self, "initWithBaseAccessoryIdentifier:name:lastModifiedTime:ruleConfigurationsByVersionString:", v8, v23, v26, v27);
            v17 = self;
          }
          else
          {
            v17 = 0;
          }

          v25 = v26;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v28 = (void *)MEMORY[0x1D17BA0A0](v21);
      self = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v30;
        v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON is not a dictionary: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v17 = 0;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    self = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v16;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v17 = 0;
  }

  return v17;
}

- (NSArray)ruleConfigurations
{
  void *v2;
  void *v3;

  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations ruleConfigurationsByVersionString](self, "ruleConfigurationsByVersionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v4;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v5;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v4 = (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations lastModifiedTime](self, "lastModifiedTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations lastModifiedTime](v6, "lastModifiedTime");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations ruleConfigurationsByVersionString](self, "ruleConfigurationsByVersionString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations ruleConfigurationsByVersionString](v6, "ruleConfigurationsByVersionString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToDictionary:", v12))
          {
            -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations baseAccessoryIdentifier](self, "baseAccessoryIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations baseAccessoryIdentifier](v6, "baseAccessoryIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v16, "isEqual:", v13);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations lastModifiedTime](self, "lastModifiedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations ruleConfigurations](self, "ruleConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations baseAccessoryIdentifier](self, "baseAccessoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations baseAccessoryIdentifier](self, "baseAccessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("BaseAccessoryIdentifier"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Name"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations lastModifiedTime](self, "lastModifiedTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("LastModifiedTime"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations ruleConfigurations](self, "ruleConfigurations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("RuleConfigurations"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSDictionary)prettyJSONDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations ruleConfigurations](self, "ruleConfigurations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "accessoryIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firmwareVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "versionString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "prettyJSONDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  v24[0] = CFSTR("name");
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v24[1] = CFSTR("lastModifiedTime");
  -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations lastModifiedTime](self, "lastModifiedTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  v24[2] = CFSTR("ruleConfigurations");
  v17 = (void *)objc_msgSend(v3, "copy");
  v25[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v18;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)baseAccessoryIdentifier
{
  return self->_baseAccessoryIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)lastModifiedTime
{
  return self->_lastModifiedTime;
}

- (NSDictionary)ruleConfigurationsByVersionString
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleConfigurationsByVersionString, 0);
  objc_storeStrong((id *)&self->_ruleConfigurations, 0);
  objc_storeStrong((id *)&self->_lastModifiedTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_baseAccessoryIdentifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_157532 != -1)
    dispatch_once(&logCategory__hmf_once_t0_157532, &__block_literal_global_157533);
  return (id)logCategory__hmf_once_v1_157534;
}

+ (id)__decodeRuleConfigurationsFromJSONDictionary:(id)a3 baseAccessoryIdentifier:(id)a4 allowUnzippedData:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  id v22;
  int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v40;
  id context;
  void *contexta;
  _QWORD v43[4];
  id v44;
  id v45;
  _BYTE *v46;
  id v47;
  id v48;
  id v49;
  _BYTE buf[24];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("v"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
    v12 = v11;

    if (v12)
      goto LABEL_31;
  }
  v49 = 0;
  v13 = decodeStringFromJSONDictionary(v8, CFSTR("v"), 1, &v49);
  v14 = v49;
  v15 = v14;
  if ((v13 & 1) == 0)
  {

LABEL_19:
    v10 = 0;
LABEL_30:
    v36 = 0;
    goto LABEL_35;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0);
  if (!v16)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("v");
      *(_WORD *)&buf[22] = 2112;
      v51 = v8;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not valid base64: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);

    goto LABEL_19;
  }
  v17 = v16;
  objc_msgSend(v16, "hmd_uncompressedData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v18, 0, &v48);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    context = v48;
    if (v19)
    {
      v10 = v19;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v21 = v10;
      else
        v21 = 0;
      v22 = v21;

      if ((isKindOfClass & 1) != 0)
      {
        v23 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = CFSTR("v");
        *(_WORD *)&buf[22] = 2112;
        v51 = v8;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@JSON contains a '%@' value that is not a dictionary: %@", buf, 0x20u);

      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = CFSTR("v");
        *(_WORD *)&buf[22] = 2112;
        v51 = v8;
        v52 = 2112;
        v53 = context;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not valid JSON: %@: %@", buf, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v40);
    v10 = 0;
    v23 = 1;
    goto LABEL_28;
  }
  contexta = (void *)MEMORY[0x1D17BA0A0]();
  v28 = a1;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = CFSTR("v");
    *(_WORD *)&buf[22] = 2112;
    v51 = v8;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not compressed properly: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(contexta);
  v10 = 0;
  v23 = 1;
LABEL_29:

  if (v23)
    goto LABEL_30;
LABEL_31:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v51) = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count", v40));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __143__HMDNetworkRouterFirewallRuleCloudNetworkDeclarations___decodeRuleConfigurationsFromJSONDictionary_baseAccessoryIdentifier_allowUnzippedData___block_invoke;
  v43[3] = &unk_1E89BB9E8;
  v47 = a1;
  v44 = v9;
  v46 = buf;
  v38 = v37;
  v45 = v38;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v43);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v36 = 0;
  else
    v36 = (void *)objc_msgSend(v38, "copy");

  _Block_object_dispose(buf, 8);
LABEL_35:

  return v36;
}

+ (id)__decodeRuleConfigurationWithVersionString:(id)a3 ruleConfigurationValue:(id)a4 baseAccessoryIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v15;
  void *v16;
  void *v17;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v18;
  HMDNetworkRouterFirewallRuleConfiguration *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v8);
  if (v11)
  {
    v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v15 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
      objc_msgSend(v10, "productGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "productNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:](v15, "initWithProductGroup:productNumber:firmwareVersion:", v16, v17, v11);

      v19 = -[HMDNetworkRouterFirewallRuleConfiguration initWithAccessoryIdentifier:jsonDictionary:]([HMDNetworkRouterFirewallRuleConfiguration alloc], "initWithAccessoryIdentifier:jsonDictionary:", v18, v14);
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
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v27;
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Rule configuration for version '%@' is not a dictionary: %@", (uint8_t *)&v29, 0x20u);

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
      v29 = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rule configuration contains an invalid version string: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

void __143__HMDNetworkRouterFirewallRuleCloudNetworkDeclarations___decodeRuleConfigurationsFromJSONDictionary_baseAccessoryIdentifier_allowUnzippedData___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "__decodeRuleConfigurationWithVersionString:ruleConfigurationValue:baseAccessoryIdentifier:", v9, v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);
  }
  else
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __67__HMDNetworkRouterFirewallRuleCloudNetworkDeclarations_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_157534;
  logCategory__hmf_once_v1_157534 = v0;

}

@end
