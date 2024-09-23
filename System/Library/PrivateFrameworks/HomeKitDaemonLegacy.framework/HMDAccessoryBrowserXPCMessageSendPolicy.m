@implementation HMDAccessoryBrowserXPCMessageSendPolicy

- (HMDAccessoryBrowserXPCMessageSendPolicy)initWithRequiredEntitlements:(unint64_t)a3
{
  HMDAccessoryBrowserXPCMessageSendPolicy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicy;
  result = -[HMDAccessoryBrowserXPCMessageSendPolicy init](&v5, sel_init);
  if (result)
    result->_requiredEntitlements = a3 | 1;
  return result;
}

- (BOOL)canSendWithPolicyParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isBrowsing"))
  {
    v8 = -[HMDAccessoryBrowserXPCMessageSendPolicy requiredEntitlements](self, "requiredEntitlements");
    v9 = objc_msgSend(v7, "entitlements") & v8;
    v10 = v9 == -[HMDAccessoryBrowserXPCMessageSendPolicy requiredEntitlements](self, "requiredEntitlements");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryBrowserXPCMessageSendPolicy *v4;
  HMDAccessoryBrowserXPCMessageSendPolicy *v5;
  HMDAccessoryBrowserXPCMessageSendPolicy *v6;
  HMDAccessoryBrowserXPCMessageSendPolicy *v7;
  unint64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = (HMDAccessoryBrowserXPCMessageSendPolicy *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicy;
    if (-[HMDXPCMessageSendPolicy isEqual:](&v11, sel_isEqual_, v4))
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
        v8 = -[HMDAccessoryBrowserXPCMessageSendPolicy requiredEntitlements](self, "requiredEntitlements");
        v9 = v8 == -[HMDAccessoryBrowserXPCMessageSendPolicy requiredEntitlements](v7, "requiredEntitlements");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryBrowserXPCMessageSendPolicy requiredEntitlements](self, "requiredEntitlements");
  HMXPCClientEntitlementsShortDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Entitlements"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)requiredEntitlements
{
  return self->_requiredEntitlements;
}

@end
