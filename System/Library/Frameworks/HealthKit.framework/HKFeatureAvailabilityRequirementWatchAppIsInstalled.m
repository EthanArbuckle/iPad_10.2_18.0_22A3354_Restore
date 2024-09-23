@implementation HKFeatureAvailabilityRequirementWatchAppIsInstalled

- (HKFeatureAvailabilityRequirementWatchAppIsInstalled)initWithBundleIdentifier:(id)a3
{
  id v5;
  HKFeatureAvailabilityRequirementWatchAppIsInstalled *v6;
  HKFeatureAvailabilityRequirementWatchAppIsInstalled *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementWatchAppIsInstalled;
  v6 = -[HKFeatureAvailabilityRequirementWatchAppIsInstalled init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("WatchAppIsInstalled");
}

- (NSString)requirementDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The app with the specified bundle ID %@ must be installed on the watch"), self->_bundleIdentifier);
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "isWatchAppInstalledWithBundleIdentifier:error:", self->_bundleIdentifier, a4);
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  void *v7;
  NSString *bundleIdentifier;
  _QWORD v9[5];

  v6 = a3;
  objc_msgSend(a4, "watchAppInstallationDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HKFeatureAvailabilityRequirementWatchAppIsInstalled_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E37EC678;
  v9[4] = self;
  objc_msgSend(v7, "registerObserver:forKey:newValueHandler:", v6, bundleIdentifier, v9);

}

void __86__HKFeatureAvailabilityRequirementWatchAppIsInstalled_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v4, objc_msgSend(a3, "BOOLValue"));

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "watchAppInstallationDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:forKey:", v6, self->_bundleIdentifier);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleIdentifier;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    bundleIdentifier = self->_bundleIdentifier;
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](bundleIdentifier, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[NSString hash](self->_bundleIdentifier, "hash") ^ v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
}

- (HKFeatureAvailabilityRequirementWatchAppIsInstalled)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKFeatureAvailabilityRequirementWatchAppIsInstalled *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKFeatureAvailabilityRequirementWatchAppIsInstalled initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v5);
  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
