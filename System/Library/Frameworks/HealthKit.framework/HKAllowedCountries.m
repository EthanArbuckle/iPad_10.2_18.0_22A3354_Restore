@implementation HKAllowedCountries

+ (id)allowedCountriesInLocalSet:(id)a3
{
  id v3;
  _HKAllowedCountriesInLocalSet *v4;

  v3 = a3;
  v4 = -[_HKAllowedCountriesInLocalSet initWithLocalCountrySet:]([_HKAllowedCountriesInLocalSet alloc], "initWithLocalCountrySet:", v3);

  return v4;
}

+ (id)noRemoteDevice:(id)a3
{
  id v3;
  _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction *v4;

  v3 = a3;
  v4 = -[_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction initWithLocalCountrySet:remoteState:]([_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction alloc], "initWithLocalCountrySet:remoteState:", v3, 2);

  return v4;
}

+ (id)capabilityNotSupportedOnRemoteDevice:(id)a3
{
  id v3;
  _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction *v4;

  v3 = a3;
  v4 = -[_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction initWithLocalCountrySet:remoteState:]([_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction alloc], "initWithLocalCountrySet:remoteState:", v3, 3);

  return v4;
}

+ (id)allowedCountriesInIntersectionOfLocalAndRemoteSetPendingSync:(id)a3
{
  id v3;
  _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction *v4;

  v3 = a3;
  v4 = -[_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction initWithLocalCountrySet:remoteState:]([_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction alloc], "initWithLocalCountrySet:remoteState:", v3, 4);

  return v4;
}

+ (id)allowedCountriesInIntersectionOfLocalSet:(id)a3 remoteSet:(id)a4
{
  id v5;
  id v6;
  _HKAllowedCountriesInIntersectionOfLocalAndRemoteSet *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet initWithLocalCountrySet:remoteCountrySet:]([_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet alloc], "initWithLocalCountrySet:remoteCountrySet:", v6, v5);

  return v7;
}

- (_QWORD)_initWithCategory:(void *)a3 version:(void *)a4 localCountrySet:(uint64_t)a5 remoteState:(void *)a6 remoteCountrySet:
{
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)HKAllowedCountries;
    v14 = objc_msgSendSuper2(&v23, sel_init);
    a1 = v14;
    if (v14)
    {
      if (a5 != 5 || v13)
      {
        v14[1] = a2;
        v17 = objc_msgSend(v11, "copy");
        v18 = (void *)a1[2];
        a1[2] = v17;

        v19 = objc_msgSend(v12, "copy");
        v20 = (void *)a1[3];
        a1[3] = v19;

        a1[4] = a5;
        v21 = objc_msgSend(v13, "copy");
        v16 = (void *)a1[5];
        a1[5] = v21;
      }
      else
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:].cold.1((uint64_t)a1, v15);

        v16 = a1;
        a1 = 0;
      }

    }
  }

  return a1;
}

- (NSString)prettyPrintedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[HKAllowedCountries localCountrySet](self, "localCountrySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCountryCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKAllowedCountries category](self, "category");
  if (v8 == 2)
  {
    objc_msgSend(v3, "appendString:", CFSTR("Available based on the intersection of countries specified by the local and remote devices:\n"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Local : %@\n"), v7);
    -[HKAllowedCountries localCountrySet](self, "localCountrySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKCountrySetProvenance(objc_msgSend(v11, "provenance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("(Provenance: %@)\n"), v12);

    objc_msgSend(v3, "appendString:", CFSTR("Remote: "));
    switch(-[HKAllowedCountries remoteState](self, "remoteState"))
    {
      case 2:
        v13 = CFSTR("No device");
        goto LABEL_9;
      case 3:
        v13 = CFSTR("Device capability not supported");
        goto LABEL_9;
      case 4:
        v13 = CFSTR("Awaiting sync of countries");
LABEL_9:
        objc_msgSend(v3, "appendString:", v13);
        break;
      case 5:
        -[HKAllowedCountries remoteCountrySet](self, "remoteCountrySet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allCountryCodes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (const __CFString *)v19;
        else
          v21 = &stru_1E37FD4C0;
        objc_msgSend(v3, "appendString:", v21);

        -[HKAllowedCountries remoteCountrySet](self, "remoteCountrySet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromHKCountrySetProvenance(objc_msgSend(v9, "provenance"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n(Provenance: %@)\n"), v10);
        goto LABEL_4;
      default:
        break;
    }
  }
  else if (v8 == 1)
  {
    objc_msgSend(v3, "appendString:", CFSTR("Available only in countries specified by this device:\n"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v7);
    -[HKAllowedCountries localCountrySet](self, "localCountrySet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKCountrySetProvenance(objc_msgSend(v9, "provenance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("(Provenance: %@)\n"), v10);
LABEL_4:

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  HKCountrySet *localCountrySet;
  HKCountrySet *v8;
  HKCountrySet *remoteCountrySet;
  HKCountrySet *v10;
  NSString *version;
  NSString *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKAllowedCountries;
  if (!-[HKAllowedCountries isEqual:](&v14, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_18;
    }
    v6 = v4;
    if (self->_category != v6[1])
      goto LABEL_16;
    localCountrySet = self->_localCountrySet;
    v8 = (HKCountrySet *)v6[3];
    if (localCountrySet != v8 && (!v8 || !-[HKCountrySet isEqual:](localCountrySet, "isEqual:")))
      goto LABEL_16;
    remoteCountrySet = self->_remoteCountrySet;
    v10 = (HKCountrySet *)v6[5];
    if (remoteCountrySet != v10 && (!v10 || !-[HKCountrySet isEqual:](remoteCountrySet, "isEqual:")))
      goto LABEL_16;
    if (self->_remoteState != v6[4])
      goto LABEL_16;
    version = self->_version;
    v12 = (NSString *)v6[2];
    if (version == v12)
    {
      v5 = 1;
      goto LABEL_17;
    }
    if (v12)
      v5 = -[NSString isEqual:](version, "isEqual:");
    else
LABEL_16:
      v5 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v5 = 1;
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  int64_t category;
  unint64_t v4;
  unint64_t v5;

  category = self->_category;
  v4 = -[HKCountrySet hash](self->_localCountrySet, "hash") ^ category;
  v5 = v4 ^ -[HKCountrySet hash](self->_remoteCountrySet, "hash") ^ self->_remoteState;
  return v5 ^ -[NSString hash](self->_version, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localCountrySet, CFSTR("localCountrySet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteCountrySet, CFSTR("remoteCountrySet"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remoteState, CFSTR("remoteState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));

}

- (HKAllowedCountries)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HKAllowedCountries *v10;
  NSObject *v11;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  if ((unint64_t)(v5 - 1) >= 2)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HKAllowedCountries initWithCoder:].cold.2((uint64_t)self, v5);
    goto LABEL_10;
  }
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteState"));
  if ((unint64_t)(v6 - 1) >= 5)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HKAllowedCountries initWithCoder:].cold.1((uint64_t)self, v6);
LABEL_10:
    v10 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localCountrySet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteCountrySet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && v8)
  {
    self = -[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, v5, v7, v8, v6, v9);
    v10 = self;
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543874;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      v13 = v15;
      _os_log_error_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Missing required fields: %{public}@ %{public}@", (uint8_t *)&v14, 0x20u);

    }
    v10 = 0;
  }

LABEL_15:
  return v10;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)version
{
  return self->_version;
}

- (HKCountrySet)localCountrySet
{
  return self->_localCountrySet;
}

- (int64_t)remoteState
{
  return self->_remoteState;
}

- (HKCountrySet)remoteCountrySet
{
  return self->_remoteCountrySet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCountrySet, 0);
  objc_storeStrong((id *)&self->_localCountrySet, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3();
  return 0;
}

- (BOOL)someRegionIsSupported
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3();
  return 0;
}

- (void)_initWithCategory:(uint64_t)a1 version:(NSObject *)a2 localCountrySet:remoteState:remoteCountrySet:.cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v4 = 138543362;
  v5 = (id)OUTLINED_FUNCTION_2_2();
  v3 = v5;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] activeRemoteCountries is required when remoteState is HKRemoteAllowedCountriesStateReady", (uint8_t *)&v4, 0xCu);

}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = (void *)OUTLINED_FUNCTION_2_2();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = v3;
  objc_msgSend(v4, "numberWithInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v7, v8, "[%{public}@] Unsupported remote state: %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_8();
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = (void *)OUTLINED_FUNCTION_2_2();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = v3;
  objc_msgSend(v4, "numberWithInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v7, v8, "[%{public}@] Unsupported category: %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_8();
}

@end
