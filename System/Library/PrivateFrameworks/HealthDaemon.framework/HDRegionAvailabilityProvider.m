@implementation HDRegionAvailabilityProvider

+ (id)uncheckedAvailability
{
  HDRegionAvailabilityProvider *v2;
  void *v3;
  _QWORD *v4;

  v2 = [HDRegionAvailabilityProvider alloc];
  objc_msgSend(MEMORY[0x1E0CB6AC8], "uncheckedAvailability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDRegionAvailabilityProvider _initWithRegionAvailability:](v2, v3);

  return v4;
}

- (_QWORD)_initWithRegionAvailability:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HDRegionAvailabilityProvider;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

+ (id)anyCountryAvailability
{
  HDRegionAvailabilityProvider *v2;
  void *v3;
  _QWORD *v4;

  v2 = [HDRegionAvailabilityProvider alloc];
  objc_msgSend(MEMORY[0x1E0CB6AC8], "anyCountryAvailability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDRegionAvailabilityProvider _initWithRegionAvailability:](v2, v3);

  return v4;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  return (id)-[HKRegionAvailability onboardingEligibilityForCountryCode:](self->_regionAvailability, "onboardingEligibilityForCountryCode:", a3);
}

- (id)regionAvailability
{
  return self->_regionAvailability;
}

- (id)regionAvailabilityForDevice:(id)a3
{
  return self->_regionAvailability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionAvailability, 0);
}

@end
