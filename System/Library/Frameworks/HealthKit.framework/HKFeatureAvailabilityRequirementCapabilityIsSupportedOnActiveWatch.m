@implementation HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch)initWithFeatureIdentifier:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  result = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:](&v6, sel_initWithFeatureIdentifier_, a3);
  if (result)
    result->_supportedOnLocalDevice = a4;
  return result;
}

+ (id)requirementIdentifier
{
  return CFSTR("CapabilityIsSupportedOnActiveWatch");
}

- (id)requirementDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The Mobile Gestalt capability must be supported"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKFeatureAvailabilityOnboardingEligibilityRequirement featureIdentifier](self, "featureIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("The paired device capability for %@ must be supported"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportedOnLocalDevice);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
    -[HKFeatureAvailabilityOnboardingEligibilityRequirement isSatisfiedWithDataSource:error:](&v12, sel_isSatisfiedWithDataSource_error_, v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
    -[_HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice registerObserver:forDataSource:](&v10, sel_registerObserver_forDataSource_, v6, v7);
  }

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
    -[_HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice unregisterObserver:fromDataSource:](&v10, sel_unregisterObserver_fromDataSource_, v6, v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  v5 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_supportedOnLocalDevice == v4[16];

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  return -[HKFeatureAvailabilityOnboardingEligibilityRequirement hash](&v3, sel_hash) ^ self->_supportedOnLocalDevice;
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
  v5.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  v4 = a3;
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportedOnLocalDevice, CFSTR("supportedOnLocalDevice"), v5.receiver, v5.super_class);

}

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  v5 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_supportedOnLocalDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportedOnLocalDevice"));

  return v5;
}

- (BOOL)supportedOnLocalDevice
{
  return self->_supportedOnLocalDevice;
}

@end
