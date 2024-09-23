@implementation HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch

- (HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch)init
{
  void *v3;
  HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch *v4;
  objc_super v6;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch;
  v4 = -[HKFeatureAvailabilityMustBeTrueRequirement initWithWhatMustBeTrue:](&v6, sel_initWithWhatMustBeTrue_, objc_msgSend(v3, "isCompanionCapable"));

  return v4;
}

+ (id)requirementIdentifier
{
  return CFSTR("LocalDeviceIsCapableOfPairingWithWatch");
}

- (id)requirementDescription
{
  return CFSTR("The local device must be able to pair with a watch");
}

@end
