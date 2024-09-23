@implementation HKRegionAvailability

+ (id)uncheckedAvailability
{
  return objc_alloc_init(_HKUncheckedRegionAvailability);
}

+ (id)anyCountryAvailability
{
  return objc_alloc_init(_HKAnyCountryAvailability);
}

+ (id)allowedInSomeCountries:(id)a3
{
  id v3;
  _HKAllowedInSomeCountriesAvailability *v4;

  v3 = a3;
  v4 = -[_HKAllowedInSomeCountriesAvailability initWithAllowedCountries:]([_HKAllowedInSomeCountriesAvailability alloc], "initWithAllowedCountries:", v3);

  return v4;
}

- (_QWORD)_initWithCategory:(void *)a3 version:(void *)a4 allowedCountries:
{
  id v7;
  id v8;
  _QWORD *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HKRegionAvailability;
    v9 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v9;
    if (v9)
    {
      if ((unint64_t)(a2 - 4) > 0xFFFFFFFFFFFFFFFCLL)
      {
        if (a2 != 3 || v8)
        {
          v9[1] = a2;
          v13 = objc_msgSend(v7, "copy");
          v14 = (void *)a1[2];
          a1[2] = v13;

          v15 = objc_msgSend(v8, "copy");
          v12 = (void *)a1[3];
          a1[3] = v15;
          goto LABEL_14;
        }
        _HKInitializeLogging();
        HKLogInfrastructure();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[HKRegionAvailability _initWithCategory:version:allowedCountries:].cold.2();

      }
      else
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[HKRegionAvailability _initWithCategory:version:allowedCountries:].cold.1((uint64_t)a1, a2, v10);

      }
      v12 = a1;
      a1 = 0;
LABEL_14:

    }
  }

  return a1;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4;
  HKFeatureAvailabilityOnboardingEligibility *v5;
  unint64_t v6;
  void *v7;
  HKFeatureAvailabilityOnboardingEligibility *v8;

  v4 = a3;
  v5 = [HKFeatureAvailabilityOnboardingEligibility alloc];
  v6 = -[HKRegionAvailability ineligibilityReasonsForOnboardingCountryCode:](self, "ineligibilityReasonsForOnboardingCountryCode:", v4);

  -[HKRegionAvailability version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKFeatureAvailabilityOnboardingEligibility initWithIneligibilityReasons:countryAvailabilityVersion:](v5, "initWithIneligibilityReasons:countryAvailabilityVersion:", v6, v7);

  return v8;
}

- (NSString)prettyPrintedDescription
{
  id v3;
  void *v4;
  int64_t v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[HKRegionAvailability version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Version: %@\n"), v4);

  v5 = -[HKRegionAvailability category](self, "category");
  switch(v5)
  {
    case 3:
      -[HKRegionAvailability allowedCountries](self, "allowedCountries");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "prettyPrintedDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (const __CFString *)v8;
      else
        v10 = &stru_1E37FD4C0;
      objc_msgSend(v3, "appendString:", v10);

      break;
    case 2:
      v6 = CFSTR("All countries");
      goto LABEL_10;
    case 1:
      v6 = CFSTR("Unchecked");
LABEL_10:
      objc_msgSend(v3, "appendString:", v6);
      break;
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  HKAllowedCountries *allowedCountries;
  HKAllowedCountries *v8;
  NSString *version;
  NSString *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRegionAvailability;
  if (!-[HKRegionAvailability isEqual:](&v12, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_14;
    }
    v6 = v4;
    allowedCountries = self->_allowedCountries;
    v8 = (HKAllowedCountries *)v6[3];
    if (allowedCountries != v8 && (!v8 || !-[HKAllowedCountries isEqual:](allowedCountries, "isEqual:"))
      || self->_category != v6[1])
    {
      goto LABEL_12;
    }
    version = self->_version;
    v10 = (NSString *)v6[2];
    if (version == v10)
    {
      v5 = 1;
      goto LABEL_13;
    }
    if (v10)
      v5 = -[NSString isEqual:](version, "isEqual:");
    else
LABEL_12:
      v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v5 = 1;
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSString *version;
  int64_t v5;

  v3 = -[HKAllowedCountries hash](self->_allowedCountries, "hash");
  version = self->_version;
  v5 = self->_category ^ v3;
  return v5 ^ -[NSString hash](version, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKAllowedCountries *allowedCountries;
  id v5;

  allowedCountries = self->_allowedCountries;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", allowedCountries, CFSTR("allowedCountries"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));

}

- (HKRegionAvailability)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HKRegionAvailability *v8;
  NSObject *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowedCountries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[HKRegionAvailability _initWithCategory:version:allowedCountries:](self, v5, v6, v7);
    v8 = self;
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HKRegionAvailability initWithCoder:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)version
{
  return self->_version;
}

- (HKAllowedCountries)allowedCountries
{
  return self->_allowedCountries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedCountries, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)_initWithCategory:(uint64_t)a1 version:(uint64_t)a2 allowedCountries:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v5 = (void *)OUTLINED_FUNCTION_2_2();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = v5;
  objc_msgSend(v6, "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v5;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Unknown category value: %{public}@", (uint8_t *)&v9, 0x16u);

}

- (void)_initWithCategory:version:allowedCountries:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_2_2();
  v1 = OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_0_4(&dword_19A0E6000, v2, v3, "[%{public}@] Allowed countries is required when category is HKRegionAvailabilityCategoryAllowedInSomeCountries", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_2_2();
  v1 = OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_0_4(&dword_19A0E6000, v2, v3, "[%{public}@] Version is required", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
