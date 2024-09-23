@implementation HMDXPCMessagePolicy

- (HMDXPCMessagePolicy)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)__initWithEntitlements:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  HMDXPCMessagePolicy *v6;
  NSObject *v7;
  void *v8;
  id result;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x227676638](self, a2);
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Adding missing developer client entitlement requirement", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v3 |= 1uLL;
  }
  v10.receiver = self;
  v10.super_class = (Class)HMDXPCMessagePolicy;
  result = -[HMDXPCMessagePolicy init](&v10, sel_init);
  if (result)
    *((_QWORD *)result + 1) = v3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HMDXPCMessagePolicy *v4;
  HMDXPCMessagePolicy *v5;
  HMDXPCMessagePolicy *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMDXPCMessagePolicy *)a3;
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
      v7 = -[HMDXPCMessagePolicy entitlements](self, "entitlements");
      v8 = v7 == -[HMDXPCMessagePolicy entitlements](v6, "entitlements");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

+ (id)policyWithEntitlements:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "__initWithEntitlements:", a3);
}

+ (id)defaultPolicy
{
  return (id)objc_msgSend(a1, "policyWithEntitlements:", 1);
}

@end
