@implementation HMDNetworkRouterFirewallRuleWANAddressRange

- (HMDNetworkRouterFirewallRuleWANAddressRange)initWithAddressStart:(id)a3 addressEnd:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterFirewallRuleWANAddressRange *v9;
  HMDNetworkRouterFirewallRuleWANAddressRange *v10;
  HMDNetworkRouterFirewallRuleWANAddressRange *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDNetworkRouterFirewallRuleWANAddressRange;
  v9 = -[HMDNetworkRouterFirewallRuleWANAddressRange init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addressStart, a3);
    objc_storeStrong((id *)&v10->_addressEnd, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleWANAddressRange *v4;
  HMDNetworkRouterFirewallRuleWANAddressRange *v5;
  HMDNetworkRouterFirewallRuleWANAddressRange *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDNetworkRouterFirewallRuleWANAddressRange *)a3;
  if (self == v4)
  {
    v11 = 1;
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
      -[HMDNetworkRouterFirewallRuleWANAddressRange addressStart](self, "addressStart");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleWANAddressRange addressStart](v6, "addressStart");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDNetworkRouterFirewallRuleWANAddressRange addressEnd](self, "addressEnd");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleWANAddressRange addressEnd](v6, "addressEnd");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDNetworkRouterFirewallRuleWANAddressRange addressStart](self, "addressStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDNetworkRouterFirewallRuleWANAddressRange addressEnd](self, "addressEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
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
  -[HMDNetworkRouterFirewallRuleWANAddressRange addressStart](self, "addressStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("AddressStart"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleWANAddressRange addressEnd](self, "addressEnd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("AddressEnd"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)prettyJSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("addressStart");
  -[HMDNetworkRouterFirewallRuleWANAddressRange addressStart](self, "addressStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("addressEnd");
  v10[0] = v4;
  -[HMDNetworkRouterFirewallRuleWANAddressRange addressEnd](self, "addressEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addressString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMFNetAddress)addressStart
{
  return self->_addressStart;
}

- (HMFNetAddress)addressEnd
{
  return self->_addressEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressEnd, 0);
  objc_storeStrong((id *)&self->_addressStart, 0);
}

@end
