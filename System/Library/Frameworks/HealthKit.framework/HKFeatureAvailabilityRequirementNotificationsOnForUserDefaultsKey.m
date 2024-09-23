@implementation HKFeatureAvailabilityRequirementNotificationsOnForUserDefaultsKey

+ (id)requirementIdentifier
{
  return CFSTR("NotificationsOnForUserDefaultsKey");
}

- (id)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator userDefaultsKey](self, "userDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("The value of the notifications user defaults key %@ must be YES"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 0;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return a3;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)objc_msgSend(a3, "userNotificationSettingsDataSource");
}

@end
