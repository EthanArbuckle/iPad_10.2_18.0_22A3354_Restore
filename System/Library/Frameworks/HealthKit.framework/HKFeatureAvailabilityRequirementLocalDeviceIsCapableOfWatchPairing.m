@implementation HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing

- (HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing)init
{
  __objc2_class **v3;
  void *v4;
  char v5;
  uint64_t v6;
  HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing *v7;
  objc_super v9;

  v3 = off_1E37E5000;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCompanionCapable");
  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v3 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isAppleWatch");
  }
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing;
  v7 = -[HKFeatureAvailabilityMustBeTrueRequirement initWithWhatMustBeTrue:](&v9, sel_initWithWhatMustBeTrue_, v6);
  if ((v5 & 1) == 0)

  return v7;
}

+ (id)requirementIdentifier
{
  return CFSTR("LocalDeviceIsCapableOfWatchPairing");
}

- (id)requirementDescription
{
  return CFSTR("The local device must be able to pair with a watch or is a watch");
}

@end
