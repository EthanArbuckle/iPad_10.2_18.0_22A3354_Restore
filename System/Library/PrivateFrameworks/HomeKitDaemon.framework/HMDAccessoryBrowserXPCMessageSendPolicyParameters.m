@implementation HMDAccessoryBrowserXPCMessageSendPolicyParameters

- (HMDAccessoryBrowserXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3 browsing:(BOOL)a4
{
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
  result = -[HMDXPCMessageSendPolicyParameters initWithEntitlements:](&v6, sel_initWithEntitlements_, a3);
  if (result)
    result->_browsing = a4;
  return result;
}

- (id)signature
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
  -[HMDXPCMessageSendPolicyParameters signature](&v9, sel_signature);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDAccessoryBrowserXPCMessageSendPolicyParameters isBrowsing](self, "isBrowsing");
  v6 = &stru_24E79DB48;
  if (v5)
    v6 = CFSTR("B");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@AB:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v4;
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v5;
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v6;
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  objc_super v11;

  v4 = (HMDAccessoryBrowserXPCMessageSendPolicyParameters *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
    if (-[HMDXPCMessageSendPolicyParameters isEqual:](&v11, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
      {
        v8 = -[HMDAccessoryBrowserXPCMessageSendPolicyParameters isBrowsing](self, "isBrowsing");
        v9 = v8 ^ -[HMDAccessoryBrowserXPCMessageSendPolicyParameters isBrowsing](v7, "isBrowsing") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return -[HMDAccessoryBrowserXPCMessageSendPolicyParameters isBrowsing](self, "isBrowsing");
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
  -[HMDXPCMessageSendPolicyParameters attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBrowserXPCMessageSendPolicyParameters isBrowsing](self, "isBrowsing");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Browsing"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

@end
