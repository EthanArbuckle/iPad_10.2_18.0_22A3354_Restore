@implementation HDKeyValueDomain(HKHeartRhythm)

- (id)hdhr_irregularRhythmNotificationsOnboardingCompletionForFeatureIdentifier:()HKHeartRhythm error:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  id v18;

  v6 = a3;
  v18 = 0;
  objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCompletionVersionWithError:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = v8;
  if (!v7)
  {
    v14 = v8;
    v10 = v14;
    if (v14)
    {
      if (a4)
      {
        v10 = objc_retainAutorelease(v14);
        v13 = 0;
        *a4 = v10;
        v11 = v10;
LABEL_17:

        v9 = v11;
        goto LABEL_18;
      }
      _HKLogDroppedError();
    }
    v13 = 0;
    v11 = v10;
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "integerValue"))
  {
    v17 = v9;
    objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCompletedDateWithError:", &v17);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    if (v10)
    {
      objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCountryCodeWithError:", 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6990]), "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v6, objc_msgSend(v7, "integerValue"), v10, v12, 0);
LABEL_16:

      goto LABEL_17;
    }
    v15 = v11;
    v12 = v15;
    if (v15)
    {
      if (a4)
      {
        v12 = objc_retainAutorelease(v15);
        v13 = 0;
        *a4 = v12;
        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
    v13 = 0;
    goto LABEL_16;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (id)hdhr_atrialFibrillationOnboardingCompletionVersionWithError:()HKHeartRhythm
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  if (objc_msgSend(a1, "category") != 105
    || (objc_msgSend(a1, "domainName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7700]),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKHeartRhythm.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  objc_msgSend(a1, "numberForKey:error:", *MEMORY[0x1E0CB47A0], a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "integerValue"))
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

+ (id)hdhr_heartRhythmProtectedSyncedDomainForProfile:()HKHeartRhythm
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = [a1 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 105, *MEMORY[0x1E0CB7700], v4);

  return v6;
}

+ (id)hdhr_heartRhythmProtectedLocalDomainForProfile:()HKHeartRhythm
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = [a1 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 100, *MEMORY[0x1E0CB7700], v4);

  return v6;
}

+ (id)hdhr_aFibBurdenProtectedLocalDomainForProfile:()HKHeartRhythm
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = [a1 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 100, *MEMORY[0x1E0D2FA68], v4);

  return v6;
}

+ (id)hdhr_aFibBurdenProtectedSyncedDomainForProfile:()HKHeartRhythm
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = [a1 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 105, *MEMORY[0x1E0D2FA68], v4);

  return v6;
}

- (id)hdhr_atrialFibrillationOnboardingCountryCodeWithError:()HKHeartRhythm
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "category") != 105
    || (objc_msgSend(a1, "domainName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7700]),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKHeartRhythm.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  v9 = *MEMORY[0x1E0CB4798];
  v22 = 0;
  objc_msgSend(a1, "stringForKey:error:", v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  v12 = v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  if (v13)
  {
    objc_msgSend(v10, "hk_copyNonEmptyString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = objc_msgSend(v11, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E0CB52F0];
    v17 = *MEMORY[0x1E0CB52F0];
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v16;
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        v20 = v19;
        _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine onboarding country code",
          buf,
          0xCu);

      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(HKHeartRhythm) hdhr_atrialFibrillationOnboardingCountryCodeWithError:].cold.1(v16);
    }
    if (a3)
    {
      v14 = 0;
      *a3 = objc_retainAutorelease(v12);
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }

  return v14;
}

- (id)hdhr_atrialFibrillationOnboardingCompletedDateWithError:()HKHeartRhythm
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "category") != 105
    || (objc_msgSend(a1, "domainName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7700]),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKHeartRhythm.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  v30[0] = *MEMORY[0x1E0CB47A0];
  v9 = v30[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(a1, "modificationDatesForKeys:error:", v10, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = 1;
  else
    v14 = v12 == 0;
  if (!v14)
  {
    v19 = objc_msgSend(v12, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB52F0];
    v21 = *MEMORY[0x1E0CB52F0];
    if (v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v20;
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v29 = v23;
        v24 = v23;
        _os_log_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine onboarding completion date",
          buf,
          0xCu);

        if (!a3)
          goto LABEL_22;
        goto LABEL_19;
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(HKHeartRhythm) hdhr_atrialFibrillationOnboardingCompletedDateWithError:].cold.1(v20);
      if (a3)
        goto LABEL_19;
      goto LABEL_22;
    }
    if (a3)
    {
LABEL_19:
      v12 = objc_retainAutorelease(v12);
      v18 = 0;
      *a3 = v12;
      goto LABEL_23;
    }
LABEL_22:
    _HKLogDroppedError();
    v18 = 0;
    goto LABEL_23;
  }
  if (v13)
  {
    v26 = v12;
    objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCompletionVersionWithError:", &v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v26;

    v17 = objc_msgSend(v15, "integerValue");
    if (!v17)
    {
      v18 = 0;
      v12 = v16;
      goto LABEL_23;
    }
    v12 = v16;
  }
  v18 = v13;
LABEL_23:

  return v18;
}

- (uint64_t)hdhr_setAtrialFibrillationDetectionCurrentOnboardingVersionCompletedInCountryCode:()HKHeartRhythm error:
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(a1, "category") != 105
    || (objc_msgSend(a1, "domainName"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB7700]),
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKHeartRhythm.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  v11 = *MEMORY[0x1E0CB47A0];
  v15[0] = *MEMORY[0x1E0CB4798];
  v15[1] = v11;
  v16[0] = v7;
  v16[1] = &unk_1E87FEC90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "setValuesWithDictionary:error:", v12, a4);

  return v13;
}

- (uint64_t)hdhr_resetAtrialFibrillationDetectionOnboardingWithError:()HKHeartRhythm
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "category") != 105
    || (objc_msgSend(a1, "domainName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7700]),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKHeartRhythm.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  v9 = *MEMORY[0x1E0CB47A0];
  v13[0] = *MEMORY[0x1E0CB4798];
  v13[1] = v9;
  v14[0] = &stru_1E87F0B08;
  v14[1] = &unk_1E87FECA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "setValuesWithDictionary:error:", v10, a3);

  return v11;
}

- (void)hdhr_atrialFibrillationOnboardingCountryCodeWithError:()HKHeartRhythm .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Error reading onboarding country code: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)hdhr_atrialFibrillationOnboardingCompletedDateWithError:()HKHeartRhythm .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Error reading onboarding completion date: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
