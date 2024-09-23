@implementation HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled

- (HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled;
  return -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:](&v3, sel_initWithUserDefaultsKey_, CFSTR("BackgroundMeasurementsEnabled"));
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
  return (id)objc_msgSend(a3, "respiratoryPreferencesDataSource");
}

+ (id)requirementIdentifier
{
  return CFSTR("BloodOxygenRecordingsAreEnabled");
}

- (id)requirementDescription
{
  return CFSTR("Blood Oxygen Recordings must be enabled");
}

@end
