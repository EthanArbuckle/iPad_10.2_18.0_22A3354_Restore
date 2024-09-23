@implementation HKFeatureAvailabilityRequirementNoOngoingPregnancy

+ (id)requirementIdentifier
{
  return CFSTR("NoOngoingPregnancy");
}

- (id)requirementDescription
{
  return CFSTR("No ongoing pregnancy sample.");
}

@end
