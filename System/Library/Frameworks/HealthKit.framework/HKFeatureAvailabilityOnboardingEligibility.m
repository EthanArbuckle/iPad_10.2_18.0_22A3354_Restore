@implementation HKFeatureAvailabilityOnboardingEligibility

- (HKFeatureAvailabilityOnboardingEligibility)initWithIneligibilityReasons:(unint64_t)a3 countryAvailabilityVersion:(id)a4
{
  id v6;
  HKFeatureAvailabilityOnboardingEligibility *v7;
  HKFeatureAvailabilityOnboardingEligibility *v8;
  uint64_t v9;
  NSString *countryAvailabilityVersion;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureAvailabilityOnboardingEligibility;
  v7 = -[HKFeatureAvailabilityOnboardingEligibility init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_ineligibilityReasons = a3;
    v9 = objc_msgSend(v6, "copy");
    countryAvailabilityVersion = v8->_countryAvailabilityVersion;
    v8->_countryAvailabilityVersion = (NSString *)v9;

  }
  return v8;
}

- (BOOL)isEligible
{
  return self->_ineligibilityReasons == 0;
}

- (id)eligibilityRespectingOverridesForFeatureIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementSatisfactionOverrides *v5;
  unint64_t ineligibilityReasons;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HKFeatureAvailabilityOnboardingEligibility *v21;

  v4 = a3;
  v5 = -[HKFeatureAvailabilityRequirementSatisfactionOverrides initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementSatisfactionOverrides alloc], "initWithFeatureIdentifier:", v4);

  ineligibilityReasons = self->_ineligibilityReasons;
  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("ActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "BOOLValue"))
      ineligibilityReasons &= ~2uLL;
    else
      ineligibilityReasons |= 2uLL;
  }

  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("CapabilityIsSupportedOnActiveRemoteDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "BOOLValue"))
      ineligibilityReasons &= ~4uLL;
    else
      ineligibilityReasons |= 4uLL;
  }

  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("CountryIsSupportedOnLocalDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "BOOLValue"))
      ineligibilityReasons &= ~8uLL;
    else
      ineligibilityReasons |= 8uLL;
  }

  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("CountryIsSupportedOnActiveRemoteDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend(v13, "BOOLValue"))
      ineligibilityReasons &= ~0x10uLL;
    else
      ineligibilityReasons |= 0x10uLL;
  }

  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("CountryIsSupportedOnActiveRemoteDevice"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (objc_msgSend(v15, "BOOLValue"))
      ineligibilityReasons &= ~0x20uLL;
    else
      ineligibilityReasons |= 0x20uLL;
  }

  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("FeatureIsNotRemotelyDisabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "BOOLValue"))
      ineligibilityReasons &= ~0x40uLL;
    else
      ineligibilityReasons |= 0x40uLL;
  }

  -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:](v5, "overriddenSatisfactionOfRequirementWithIdentifier:", CFSTR("SeedIsNotExpired"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if (objc_msgSend(v19, "BOOLValue"))
      ineligibilityReasons &= ~0x80uLL;
    else
      ineligibilityReasons |= 0x80uLL;
  }

  v21 = -[HKFeatureAvailabilityOnboardingEligibility initWithIneligibilityReasons:countryAvailabilityVersion:]([HKFeatureAvailabilityOnboardingEligibility alloc], "initWithIneligibilityReasons:countryAvailabilityVersion:", ineligibilityReasons, self->_countryAvailabilityVersion);
  return v21;
}

- (int64_t)onboardedCountrySupportedState
{
  unint64_t ineligibilityReasons;
  int64_t v3;
  uint64_t v4;

  ineligibilityReasons = self->_ineligibilityReasons;
  v3 = 5;
  v4 = 3;
  if ((ineligibilityReasons & 0x40) != 0)
    v4 = 4;
  if ((ineligibilityReasons & 0x80) == 0)
    v3 = v4;
  if (ineligibilityReasons)
    return v3;
  else
    return 2;
}

- (id)ineligibilityReasonsDescription
{
  void *v3;
  void *v4;
  unint64_t ineligibilityReasons;
  __CFString *v6;

  if (!self->_ineligibilityReasons)
  {
    v6 = CFSTR("None");
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ineligibilityReasons = self->_ineligibilityReasons;
  if ((ineligibilityReasons & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("A country code is required"));
    ineligibilityReasons = self->_ineligibilityReasons;
    if ((ineligibilityReasons & 2) == 0)
    {
LABEL_4:
      if ((ineligibilityReasons & 4) == 0)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  else if ((ineligibilityReasons & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v4, "addObject:", CFSTR("An active remote device is required"));
  ineligibilityReasons = self->_ineligibilityReasons;
  if ((ineligibilityReasons & 4) == 0)
  {
LABEL_5:
    if ((ineligibilityReasons & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v4, "addObject:", CFSTR("Active remote device is unsupported"));
  ineligibilityReasons = self->_ineligibilityReasons;
  if ((ineligibilityReasons & 8) == 0)
  {
LABEL_6:
    if ((ineligibilityReasons & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v4, "addObject:", CFSTR("Country is not supported on this device"));
  ineligibilityReasons = self->_ineligibilityReasons;
  if ((ineligibilityReasons & 0x10) == 0)
  {
LABEL_7:
    if ((ineligibilityReasons & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "addObject:", CFSTR("Country list is missing for the active remote device"));
  ineligibilityReasons = self->_ineligibilityReasons;
  if ((ineligibilityReasons & 0x20) == 0)
  {
LABEL_8:
    if ((ineligibilityReasons & 0x40) == 0)
      goto LABEL_9;
LABEL_20:
    objc_msgSend(v4, "addObject:", CFSTR("Feature is remotely disabled"));
    if ((self->_ineligibilityReasons & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  objc_msgSend(v4, "addObject:", CFSTR("Country is not supported on the active remote device"));
  ineligibilityReasons = self->_ineligibilityReasons;
  if ((ineligibilityReasons & 0x40) != 0)
    goto LABEL_20;
LABEL_9:
  if ((ineligibilityReasons & 0x80) != 0)
LABEL_10:
    objc_msgSend(v4, "addObject:", CFSTR("Seed has expired"));
LABEL_11:
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("; "));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *countryAvailabilityVersion;
  NSString *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_ineligibilityReasons != v5[1])
      goto LABEL_7;
    countryAvailabilityVersion = self->_countryAvailabilityVersion;
    v7 = (NSString *)v5[2];
    if (countryAvailabilityVersion == v7)
    {
      v8 = 1;
      goto LABEL_9;
    }
    if (v7)
      v8 = -[NSString isEqual:](countryAvailabilityVersion, "isEqual:");
    else
LABEL_7:
      v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  unint64_t ineligibilityReasons;

  ineligibilityReasons = self->_ineligibilityReasons;
  return -[NSString hash](self->_countryAvailabilityVersion, "hash") ^ ineligibilityReasons;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_ineligibilityReasons);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p reasons:%@ version:%@>"), v4, self, v5, self->_countryAvailabilityVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAvailabilityOnboardingEligibility)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HKFeatureAvailabilityOnboardingEligibility *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ineligibilityReasons"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryAvailabilityVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKFeatureAvailabilityOnboardingEligibility initWithIneligibilityReasons:countryAvailabilityVersion:](self, "initWithIneligibilityReasons:countryAvailabilityVersion:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t ineligibilityReasons;
  id v5;

  ineligibilityReasons = self->_ineligibilityReasons;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", ineligibilityReasons, CFSTR("ineligibilityReasons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryAvailabilityVersion, CFSTR("countryAvailabilityVersion"));

}

- (unint64_t)ineligibilityReasons
{
  return self->_ineligibilityReasons;
}

- (NSString)countryAvailabilityVersion
{
  return self->_countryAvailabilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryAvailabilityVersion, 0);
}

@end
