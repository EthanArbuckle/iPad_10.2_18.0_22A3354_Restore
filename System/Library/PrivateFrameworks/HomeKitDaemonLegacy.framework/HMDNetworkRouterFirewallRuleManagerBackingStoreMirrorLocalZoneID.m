@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID)initWithToken:(id)a3
{
  id v5;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *v6;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *v7;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID;
  v6 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    v8 = v7;
  }

  return v7;
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
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID token](self, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Token"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)labels
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_98378 != -1)
    dispatch_once(&sharedInstance_onceToken_98378, &__block_literal_global_98379);
  return (id)sharedInstance_sharedInstance;
}

void __82__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID_sharedInstance__block_invoke()
{
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("6270b380-05e5-4f4d-b453-9c48242b1611"), "dataUsingEncoding:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v0 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID initWithToken:]([HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID alloc], "initWithToken:", v2);
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;

  }
}

@end
