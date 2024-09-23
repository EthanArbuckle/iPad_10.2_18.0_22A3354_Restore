@implementation HMDXPCBackgroundMessagePolicy

- (HMDXPCBackgroundMessagePolicy)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)__initWithEntitlementRequirement:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDXPCBackgroundMessagePolicy;
  result = -[HMDXPCBackgroundMessagePolicy init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HMDXPCBackgroundMessagePolicy *v4;
  HMDXPCBackgroundMessagePolicy *v5;
  HMDXPCBackgroundMessagePolicy *v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (HMDXPCBackgroundMessagePolicy *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
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
      v7 = -[HMDXPCBackgroundMessagePolicy requiresEntitlement](self, "requiresEntitlement");
      v8 = v7 ^ -[HMDXPCBackgroundMessagePolicy requiresEntitlement](v6, "requiresEntitlement") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  return -[HMDXPCBackgroundMessagePolicy requiresEntitlement](self, "requiresEntitlement");
}

- (BOOL)requiresEntitlement
{
  return self->_requiresEntitlement;
}

+ (id)policyWithEntitlementRequirement:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "__initWithEntitlementRequirement:", a3);
}

+ (id)defaultPolicy
{
  return (id)objc_msgSend(a1, "policyWithEntitlementRequirement:", 1);
}

@end
