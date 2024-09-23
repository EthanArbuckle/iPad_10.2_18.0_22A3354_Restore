@implementation HMDXPCiCloudSwitchMessagePolicy

- (HMDXPCiCloudSwitchMessagePolicy)initWithBundleIdentifiers:(id)a3
{
  id v4;
  HMDXPCiCloudSwitchMessagePolicy *v5;
  uint64_t v6;
  NSSet *bundleIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDXPCiCloudSwitchMessagePolicy;
  v5 = -[HMDXPCiCloudSwitchMessagePolicy init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSSet *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDXPCiCloudSwitchMessagePolicy bundleIdentifiers](self, "bundleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToSet:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDXPCiCloudSwitchMessagePolicy bundleIdentifiers](self, "bundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSSet)bundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

+ (id)policyWithBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifiers:", v4);

  return v5;
}

@end
