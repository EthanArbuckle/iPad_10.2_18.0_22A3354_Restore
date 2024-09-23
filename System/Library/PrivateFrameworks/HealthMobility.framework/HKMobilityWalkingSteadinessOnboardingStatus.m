@implementation HKMobilityWalkingSteadinessOnboardingStatus

- (HKMobilityWalkingSteadinessOnboardingStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 dateOnboarded:(id)a5 shouldOnboardingTileBeAdvertised:(BOOL)a6 isLocaleValidOnLocalDevice:(BOOL)a7 isClassificationAvailable:(BOOL)a8
{
  id v15;
  HKMobilityWalkingSteadinessOnboardingStatus *v16;
  HKMobilityWalkingSteadinessOnboardingStatus *v17;
  HKMobilityWalkingSteadinessOnboardingStatus *v18;
  objc_super v20;

  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKMobilityWalkingSteadinessOnboardingStatus;
  v16 = -[HKMobilityWalkingSteadinessOnboardingStatus init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_state = a3;
    v16->_onboardingUnavailableReasons = a4;
    objc_storeStrong((id *)&v16->_dateOnboarded, a5);
    v17->_shouldAdvertiseOnboarding = a6;
    v17->_isLocaleValidOnLocalDevice = a7;
    v17->_isClassificationAvailable = a8;
    v18 = v17;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HKMobilityWalkingSteadinessOnboardingStatus *v4;
  HKMobilityWalkingSteadinessOnboardingStatus *v5;
  unsigned __int8 *v6;
  BOOL v7;

  v4 = (HKMobilityWalkingSteadinessOnboardingStatus *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (unsigned __int8 *)v5;
      v7 = self->_state == v5->_state
        && self->_onboardingUnavailableReasons == v5->_onboardingUnavailableReasons
        && -[NSDate isEqual:](self->_dateOnboarded, "isEqual:", v5->_dateOnboarded)
        && self->_shouldAdvertiseOnboarding == v6[8]
        && self->_isLocaleValidOnLocalDevice == v6[9]
        && self->_isClassificationAvailable == v6[10];

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = self->_onboardingUnavailableReasons ^ self->_state;
  v4 = v3 ^ -[NSDate hash](self->_dateOnboarded, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldAdvertiseOnboarding);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocaleValidOnLocalDevice);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isClassificationAvailable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("State"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_onboardingUnavailableReasons, CFSTR("OnboardingUnavailableReasons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOnboarded, CFSTR("DateOnboarded"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAdvertiseOnboarding, CFSTR("ShouldAdvertiseOnboarding"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocaleValidOnLocalDevice, CFSTR("IsLocaleValidOnLocalDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isClassificationAvailable, CFSTR("IsClassificationAvailableKey"));

}

- (HKMobilityWalkingSteadinessOnboardingStatus)initWithCoder:(id)a3
{
  id v4;
  HKMobilityWalkingSteadinessOnboardingStatus *v5;
  uint64_t v6;
  NSDate *dateOnboarded;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMobilityWalkingSteadinessOnboardingStatus;
  v5 = -[HKMobilityWalkingSteadinessOnboardingStatus init](&v9, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    v5->_onboardingUnavailableReasons = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OnboardingUnavailableReasons"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateOnboarded"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateOnboarded = v5->_dateOnboarded;
    v5->_dateOnboarded = (NSDate *)v6;

    v5->_shouldAdvertiseOnboarding = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShouldAdvertiseOnboarding"));
    v5->_isLocaleValidOnLocalDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsLocaleValidOnLocalDevice"));
    v5->_isClassificationAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsClassificationAvailableKey"));
  }

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)onboardingUnavailableReasons
{
  return self->_onboardingUnavailableReasons;
}

- (NSDate)dateOnboarded
{
  return self->_dateOnboarded;
}

- (BOOL)shouldAdvertiseOnboarding
{
  return self->_shouldAdvertiseOnboarding;
}

- (BOOL)isLocaleValidOnLocalDevice
{
  return self->_isLocaleValidOnLocalDevice;
}

- (BOOL)isClassificationAvailable
{
  return self->_isClassificationAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOnboarded, 0);
}

@end
