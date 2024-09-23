@implementation _HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice

- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithFeatureIdentifier:(id)a3
{
  return -[_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice initWithFeatureIdentifier:isSupportedIfCountryListMissing:](self, "initWithFeatureIdentifier:isSupportedIfCountryListMissing:", a3, 0);
}

- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithFeatureIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  _HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  result = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:](&v6, sel_initWithFeatureIdentifier_, a3);
  if (result)
    result->_isSupportedIfCountryListMissing = a4;
  return result;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  char v7;
  char v8;
  _BOOL8 isSupportedIfCountryListMissing;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "ineligibilityReasons");
  v7 = objc_msgSend(v5, "ineligibilityReasons");
  v8 = objc_msgSend(v5, "ineligibilityReasons");

  if ((v6 & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    isSupportedIfCountryListMissing = (v8 & 0x20) == 0;
    if ((v7 & 0x10) != 0)
      isSupportedIfCountryListMissing = self->_isSupportedIfCountryListMissing;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isSupportedIfCountryListMissing);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  v5 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement isEqual:](&v7, sel_isEqual_, v4)
    && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_isSupportedIfCountryListMissing == v4[16];

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  return -[HKFeatureAvailabilityOnboardingEligibilityRequirement hash](&v3, sel_hash) ^ self->_isSupportedIfCountryListMissing;
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
  v5.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  v4 = a3;
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSupportedIfCountryListMissing, CFSTR("isSupportedIfCountryListMissing"), v5.receiver, v5.super_class);

}

- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithCoder:(id)a3
{
  id v4;
  _HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  v5 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_isSupportedIfCountryListMissing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSupportedIfCountryListMissing"));

  return v5;
}

@end
