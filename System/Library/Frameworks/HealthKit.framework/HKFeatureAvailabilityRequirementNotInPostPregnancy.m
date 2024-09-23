@implementation HKFeatureAvailabilityRequirementNotInPostPregnancy

+ (id)requirementIdentifier
{
  return CFSTR("NotInPostPregnancy");
}

- (id)requirementDescription
{
  return CFSTR("No pregnancy cycle factor sample that has ended within the last 12 weeks");
}

@end
