@implementation HMDNetworkRouterFirewallRule

- (HMDNetworkRouterFirewallRule)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5
{
  id v9;
  id v10;
  HMDNetworkRouterFirewallRule *v11;
  HMDNetworkRouterFirewallRule *v12;
  HMDNetworkRouterFirewallRule *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDNetworkRouterFirewallRule;
  v11 = -[HMDNetworkRouterFirewallRule init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a4);
    v12->_critical = a5;
    objc_storeStrong((id *)&v12->_jsonDictionary, a3);
    v13 = v12;
  }

  return v12;
}

- (HMDNetworkRouterFirewallRule)initWithJSONDictionary:(id)a3 critical:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  id v8;
  HMDNetworkRouterFirewallRule *v9;
  id v11;

  v4 = a4;
  v6 = a3;
  v11 = 0;
  v7 = decodeStringFromJSONDictionary(v6, CFSTR("n"), 1, &v11);
  v8 = v11;
  if (v7)
  {
    self = -[HMDNetworkRouterFirewallRule initWithJSONDictionary:name:critical:](self, "initWithJSONDictionary:name:critical:", v6, v8, v4);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRule *v4;
  HMDNetworkRouterFirewallRule *v5;
  HMDNetworkRouterFirewallRule *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (HMDNetworkRouterFirewallRule *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
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
      -[HMDNetworkRouterFirewallRule name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRule name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = -[HMDNetworkRouterFirewallRule isCritical](self, "isCritical");
        v10 = v9 ^ -[HMDNetworkRouterFirewallRule isCritical](v6, "isCritical") ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[HMDNetworkRouterFirewallRule name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4 ^ -[HMDNetworkRouterFirewallRule isCritical](self, "isCritical");
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

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRule name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDNetworkRouterFirewallRule isCritical](self, "isCritical"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("IsCritical"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)prettyJSONDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("name");
  -[HMDNetworkRouterFirewallRule name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)jsonString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HMDNetworkRouterFirewallRule *v8;
  NSObject *v9;
  void *v10;
  HMDAssertionLogEvent *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  HMDNetworkRouterFirewallRule *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterFirewallRule jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 2, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v4)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v16 = v10;
        v17 = 2112;
        v18 = v8;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to convert firewall WAN rule %@ to JSON: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      v11 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Failed to convert firewall WAN rule %@ to JSON: %@"), v8, v5);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "submitLogEvent:", v11);

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isCritical
{
  return self->_critical;
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_85666 != -1)
    dispatch_once(&logCategory__hmf_once_t0_85666, &__block_literal_global_85667);
  return (id)logCategory__hmf_once_v1_85668;
}

+ (id)__transportProtocolToString:(unsigned __int8)a3
{
  if (a3 < 3u)
    return off_1E89B04A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__HMDNetworkRouterFirewallRule_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_85668;
  logCategory__hmf_once_v1_85668 = v0;

}

@end
