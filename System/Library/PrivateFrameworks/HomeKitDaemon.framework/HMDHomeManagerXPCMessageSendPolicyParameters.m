@implementation HMDHomeManagerXPCMessageSendPolicyParameters

- (id)signature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
  -[HMDXPCMessageSendPolicyParameters signature](&v8, sel_signature);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeManagerXPCMessageSendPolicyParameters options](self, "options");
  HMHomeManagerOptionsShortDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@O:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDHomeManagerXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4
{
  HMDHomeManagerXPCMessageSendPolicyParameters *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
  result = -[HMDXPCMessageSendPolicyParameters initWithEntitlements:](&v6, sel_initWithEntitlements_, a3);
  if (result)
    result->_options = a4;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableHomeManagerXPCMessageSendPolicyParameters *v4;

  v4 = -[HMDHomeManagerXPCMessageSendPolicyParameters initWithEntitlements:options:](+[HMDMutableHomeManagerXPCMessageSendPolicyParameters allocWithZone:](HMDMutableHomeManagerXPCMessageSendPolicyParameters, "allocWithZone:", a3), "initWithEntitlements:options:", -[HMDXPCMessageSendPolicyParameters entitlements](self, "entitlements"), -[HMDHomeManagerXPCMessageSendPolicyParameters options](self, "options"));
  -[HMDHomeManagerXPCMessageSendPolicyParameters setActive:](v4, "setActive:", -[HMDHomeManagerXPCMessageSendPolicyParameters isActive](self, "isActive"));
  return v4;
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isEqual:(id)a3
{
  HMDHomeManagerXPCMessageSendPolicyParameters *v4;
  HMDHomeManagerXPCMessageSendPolicyParameters *v5;
  HMDHomeManagerXPCMessageSendPolicyParameters *v6;
  HMDHomeManagerXPCMessageSendPolicyParameters *v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  objc_super v12;

  v4 = (HMDHomeManagerXPCMessageSendPolicyParameters *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
    if (-[HMDXPCMessageSendPolicyParameters isEqual:](&v12, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7
        && (v8 = -[HMDHomeManagerXPCMessageSendPolicyParameters options](self, "options"),
            v8 == -[HMDHomeManagerXPCMessageSendPolicyParameters options](v7, "options")))
      {
        v9 = -[HMDHomeManagerXPCMessageSendPolicyParameters isActive](self, "isActive");
        v10 = v9 ^ -[HMDHomeManagerXPCMessageSendPolicyParameters isActive](v7, "isActive") ^ 1;
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

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
  -[HMDXPCMessageSendPolicyParameters attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerXPCMessageSendPolicyParameters options](self, "options");
  HMHomeManagerOptionsToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Options"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerXPCMessageSendPolicyParameters isActive](self, "isActive");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Active"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

@end
