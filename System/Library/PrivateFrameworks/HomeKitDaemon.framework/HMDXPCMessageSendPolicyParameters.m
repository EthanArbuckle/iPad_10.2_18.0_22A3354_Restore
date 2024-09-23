@implementation HMDXPCMessageSendPolicyParameters

- (NSString)signature
{
  return (NSString *)&stru_24E79DB48;
}

- (HMDXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3
{
  HMDXPCMessageSendPolicyParameters *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDXPCMessageSendPolicyParameters;
  result = -[HMDXPCMessageSendPolicyParameters init](&v5, sel_init);
  if (result)
    result->_entitlements = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HMDXPCMessageSendPolicyParameters *v4;
  HMDXPCMessageSendPolicyParameters *v5;
  HMDXPCMessageSendPolicyParameters *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMDXPCMessageSendPolicyParameters *)a3;
  if (self == v4)
  {
    v8 = 1;
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
      v7 = -[HMDXPCMessageSendPolicyParameters entitlements](self, "entitlements");
      v8 = v7 == -[HMDXPCMessageSendPolicyParameters entitlements](v6, "entitlements");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDXPCMessageSendPolicyParameters entitlements](self, "entitlements");
  HMXPCClientEntitlementsShortDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Entitlements"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

@end
