@implementation HKFeatureAvailabilityRequirementNotificationAuthorized

- (HKFeatureAvailabilityRequirementNotificationAuthorized)initWithBundleIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementNotificationAuthorized *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementNotificationAuthorized;
  v5 = -[HKFeatureAvailabilityRequirementNotificationAuthorized init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (id)requirementIdentifier
{
  return CFSTR("NotificationAuthorized");
}

- (id)requirementDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ must be authorized for notification"), self->_bundleIdentifier);
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "userNotificationsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "areNotificationsAuthorizedWithBundleIdentifier:", self->_bundleIdentifier));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", v4[1]);

  return v5;
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
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementNotificationAuthorized;
  v4 = a3;
  -[HKFeatureAvailabilityBaseRequirement encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifierKey"), v5.receiver, v5.super_class);

}

- (HKFeatureAvailabilityRequirementNotificationAuthorized)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKFeatureAvailabilityRequirementNotificationAuthorized *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKFeatureAvailabilityRequirementNotificationAuthorized initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v5);
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
