@implementation HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice

- (HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice;
  return -[HKFeatureAvailabilityMustBeTrueRequirement initWithWhatMustBeTrue:](&v3, sel_initWithWhatMustBeTrue_, objc_msgSend(MEMORY[0x1E0CA5710], "isWalkingSteadinessAvailable"));
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("WalkingSteadinessCapabilityIsSupportedOnLocalDevice");
}

- (NSString)requirementDescription
{
  return (NSString *)CFSTR("The local device must be able to support walking steadiness classifications");
}

@end
