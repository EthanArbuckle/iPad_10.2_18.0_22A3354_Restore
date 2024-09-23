@implementation HMDAccessoryAllowedHost

- (HMDAccessoryAllowedHost)initWithJSONFirewallWANRule:(id)a3
{
  void *v4;
  HMDAccessoryAllowedHost *v5;

  wanRuleFromJSONRule(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[HMDAccessoryAllowedHost initWithWANRule:](self, "initWithWANRule:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HMDAccessoryAllowedHost)initWithWANRule:(id)a3
{
  id v4;
  HMDAccessoryAllowedHost *v5;
  HMDAccessoryAllowedHost *v6;
  uint64_t v7;
  NSString *jsonWANRule;
  HMDAccessoryAllowedHost *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryAllowedHost;
  v5 = -[HMDAccessoryAllowedHost init](&v11, sel_init);
  v6 = v5;
  if (v5
    && (objc_storeWeak((id *)&v5->_cachedWANRule, v4),
        objc_msgSend(v4, "jsonString"),
        v7 = objc_claimAutoreleasedReturnValue(),
        jsonWANRule = v6->_jsonWANRule,
        v6->_jsonWANRule = (NSString *)v7,
        jsonWANRule,
        !v6->_jsonWANRule))
  {
    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (HMDNetworkRouterFirewallRuleWAN)wanRule
{
  HMDNetworkRouterFirewallRuleWAN **p_cachedWANRule;
  void *WeakRetained;
  void *v5;

  p_cachedWANRule = &self->_cachedWANRule;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachedWANRule);
  if (!WeakRetained)
  {
    -[HMDAccessoryAllowedHost jsonWANRule](self, "jsonWANRule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    wanRuleFromJSONRule(v5);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_cachedWANRule, WeakRetained);

  }
  return (HMDNetworkRouterFirewallRuleWAN *)WeakRetained;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[HMDAccessoryAllowedHost wanRule](self, "wanRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSSet)addresses
{
  void *v2;
  void *v3;

  -[HMDAccessoryAllowedHost wanRule](self, "wanRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  addressesFromWANRule(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (unint64_t)purpose
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryAllowedHost wanRule](self, "wanRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "purpose");

  return v3;
}

- (HMDAccessoryAllowedHost)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryAllowedHost *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAAH.jsonWANRule"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[HMDAccessoryAllowedHost initWithJSONFirewallWANRule:](self, "initWithJSONFirewallWANRule:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDAccessoryAllowedHost wanRule](self, "wanRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(v6, "hmd_isForXPCTransport"))
    {
      if (objc_msgSend(v6, "hmd_isForXPCTransportEntitledForSPIAccess"))
        -[HMDAccessoryAllowedHost _encodeForSPIEntitledXPCTransportWithCoder:](self, "_encodeForSPIEntitledXPCTransportWithCoder:", v6);
    }
    else if ((objc_msgSend(v6, "hmd_isForLocalStore") & 1) != 0
           || objc_msgSend(v6, "hmd_isForRemoteTransport")
           && (objc_msgSend(v6, "hmd_isForRemoteTransportOnSameAccount") & 1) == 0
           && (objc_msgSend(v6, "hmd_isForRemoteUserAdministrator") & 1) != 0
           || objc_msgSend(v6, "hmd_isForRemoteTransportOnSameAccount")
           && (objc_msgSend(v6, "hmd_isForRemoteGatewayCoder") & 1) == 0)
    {
      -[HMDAccessoryAllowedHost jsonWANRule](self, "jsonWANRule");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMDAAH.jsonWANRule"));

    }
  }

}

- (void)_encodeForSPIEntitledXPCTransportWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryAllowedHost wanRule](self, "wanRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB7988]);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "purpose");
  if (!v8)
  {
    v11 = 0;
    goto LABEL_42;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  do
  {
    while (1)
    {
      if ((v12 & v8) == 0)
        goto LABEL_33;
      if (v12 > 127)
        break;
      if (v12 <= 15)
      {
        switch(v12)
        {
          case 1:
            v11 |= 1uLL;
            goto LABEL_33;
          case 2:
            v11 |= 2uLL;
            goto LABEL_33;
          case 4:
            v11 |= 4uLL;
            goto LABEL_33;
          case 8:
            v11 |= 8uLL;
            goto LABEL_33;
          default:
            goto LABEL_35;
        }
      }
      switch(v12)
      {
        case 16:
          v11 |= 0x10uLL;
          goto LABEL_33;
        case 32:
          v11 |= 0x20uLL;
          goto LABEL_33;
        case 64:
          v11 |= 0x40uLL;
          goto LABEL_33;
      }
LABEL_35:
      v11 |= 1uLL;
      v12 *= 2;
      v10 = 1;
      if (v12 - 1 >= v8)
        goto LABEL_38;
    }
    if (v12 <= 1023)
    {
      switch(v12)
      {
        case 128:
          v11 |= 0x80uLL;
          break;
        case 256:
          v11 |= 0x100uLL;
          break;
        case 512:
          v11 |= 0x200uLL;
          break;
        default:
          goto LABEL_35;
      }
    }
    else if (v12 > 4095)
    {
      if (v12 == 4096)
      {
        v11 |= 0x1000uLL;
      }
      else
      {
        if (v12 != 0x2000)
          goto LABEL_35;
        v11 |= 0x2000uLL;
      }
    }
    else
    {
      if (v12 != 1024)
      {
        if (v12 == 2048)
        {
          v11 |= 0x800uLL;
          goto LABEL_33;
        }
        goto LABEL_35;
      }
      v11 |= 0x400uLL;
    }
LABEL_33:
    v12 *= 2;
  }
  while (v12 - 1 < v8);
  if ((v10 & 1) == 0)
    goto LABEL_42;
LABEL_38:
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v15;
    v24 = 2048;
    v25 = v9;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@HMDNetworkRouterFirewallRuleWANPurpose value 0x%lx contains flags with no explicit mapping to HMAccessoryAllowedHostPurpose", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
LABEL_42:
  objc_msgSend(v7, "numberWithUnsignedInteger:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, *MEMORY[0x1E0CB7990]);

  v17 = (void *)MEMORY[0x1E0C99E60];
  addressesFromWANRule(v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, *MEMORY[0x1E0CB7980]);

  -[HMDAccessoryAllowedHost jsonWANRule](self, "jsonWANRule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("{\"f\":0,\"n\":\"Any Internet Destination\",\"r\":{\"i\":\"*\",\"it\":[{\"p\":1,\"t\":0}]},\"t\":5,\"u\":1}"));

  objc_msgSend(v4, "encodeBool:forKey:", v21, *MEMORY[0x1E0CB7998]);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryAllowedHost jsonWANRule](self, "jsonWANRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryAllowedHost *v4;
  HMDAccessoryAllowedHost *v5;
  HMDAccessoryAllowedHost *v6;
  HMDAccessoryAllowedHost *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDAccessoryAllowedHost *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      if (v6 == self)
      {
        v10 = 1;
      }
      else
      {
        -[HMDAccessoryAllowedHost jsonWANRule](self, "jsonWANRule");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryAllowedHost jsonWANRule](v7, "jsonWANRule");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
    }
    else
    {
      v10 = 0;
    }

  }
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
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryAllowedHost name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryAllowedHost addresses](self, "addresses", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Addresses"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAccessoryAllowedHost purpose](self, "purpose"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Purpose"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)jsonWANRule
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonWANRule, 0);
  objc_destroyWeak((id *)&self->_cachedWANRule);
}

+ (id)allowedHostForFullWANAccess
{
  return -[HMDAccessoryAllowedHost initWithJSONFirewallWANRule:]([HMDAccessoryAllowedHost alloc], "initWithJSONFirewallWANRule:", CFSTR("{\"f\":0,\"n\":\"Any Internet Destination\",\"r\":{\"i\":\"*\",\"it\":[{\"p\":1,\"t\":0}]},\"t\":5,\"u\":1}"));
}

+ (id)allowedHostsFromJSONFirewallWANRules:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "na_map:", &__block_literal_global_92605);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

+ (id)allowedHostsFromFirewallRuleConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  HMDAccessoryAllowedHost *v13;
  HMDAccessoryAllowedHost *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "wanRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = [HMDAccessoryAllowedHost alloc];
          v14 = -[HMDAccessoryAllowedHost initWithWANRule:](v13, "initWithWANRule:", v12, (_QWORD)v18);
          objc_msgSend(v6, "addObject:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v4, "hasFullAccessToWAN"))
    {
      +[HMDAccessoryAllowedHost allowedHostForFullWANAccess](HMDAccessoryAllowedHost, "allowedHostForFullWANAccess");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v15);

    }
    v16 = (void *)objc_msgSend(v6, "copy", (_QWORD)v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

HMDAccessoryAllowedHost *__64__HMDAccessoryAllowedHost_allowedHostsFromJSONFirewallWANRules___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDAccessoryAllowedHost *v3;

  v2 = a2;
  v3 = -[HMDAccessoryAllowedHost initWithJSONFirewallWANRule:]([HMDAccessoryAllowedHost alloc], "initWithJSONFirewallWANRule:", v2);

  return v3;
}

@end
