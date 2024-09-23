@implementation HMDNetworkRouterFirewallRuleWANSubject

- (HMDNetworkRouterFirewallRuleWANSubject)initWithHostnames:(id)a3 addresses:(id)a4 addressRange:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDNetworkRouterFirewallRuleWANSubject *v12;
  HMDNetworkRouterFirewallRuleWANSubject *v13;
  HMDNetworkRouterFirewallRuleWANSubject *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDNetworkRouterFirewallRuleWANSubject;
  v12 = -[HMDNetworkRouterFirewallRuleWANSubject init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hostnames, a3);
    objc_storeStrong((id *)&v13->_addresses, a4);
    objc_storeStrong((id *)&v13->_addressRange, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleWANSubject *v4;
  HMDNetworkRouterFirewallRuleWANSubject *v5;
  HMDNetworkRouterFirewallRuleWANSubject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (HMDNetworkRouterFirewallRuleWANSubject *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_9;
    -[HMDNetworkRouterFirewallRuleWANSubject hostnames](self, "hostnames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleWANSubject hostnames](v6, "hostnames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_9;
    -[HMDNetworkRouterFirewallRuleWANSubject addresses](self, "addresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleWANSubject addresses](v6, "addresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (v12)
    {
      -[HMDNetworkRouterFirewallRuleWANSubject addressRange](self, "addressRange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleWANSubject addressRange](v6, "addressRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v15 = 0;
    }

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDNetworkRouterFirewallRuleWANSubject hostnames](self, "hostnames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDNetworkRouterFirewallRuleWANSubject addresses](self, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDNetworkRouterFirewallRuleWANSubject addressRange](self, "addressRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
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
  -[HMDNetworkRouterFirewallRuleWANSubject hostnames](self, "hostnames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Hostnames"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleWANSubject addresses](self, "addresses", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Addresses"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleWANSubject addressRange](self, "addressRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("AddressRange"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)prettyJSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  const __CFString **v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterFirewallRuleWANSubject hostnames](self, "hostnames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v16 = CFSTR("hostnames");
    -[HMDNetworkRouterFirewallRuleWANSubject hostnames](self, "hostnames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v17;
    v7 = &v16;
LABEL_5:
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[HMDNetworkRouterFirewallRuleWANSubject addresses](self, "addresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDNetworkRouterFirewallRuleWANSubject addresses](self, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_137943);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("addresses");
    v15 = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v15;
    v7 = &v14;
    goto LABEL_5;
  }
  -[HMDNetworkRouterFirewallRuleWANSubject addressRange](self, "addressRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    return MEMORY[0x1E0C9AA70];
  -[HMDNetworkRouterFirewallRuleWANSubject addressRange](self, "addressRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prettyJSONDictionary");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = (void *)v10;

  return v11;
}

- (NSArray)hostnames
{
  return self->_hostnames;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (HMDNetworkRouterFirewallRuleWANAddressRange)addressRange
{
  return self->_addressRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressRange, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_hostnames, 0);
}

uint64_t __62__HMDNetworkRouterFirewallRuleWANSubject_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addressString");
}

@end
