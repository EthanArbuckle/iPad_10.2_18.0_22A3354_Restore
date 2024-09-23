@implementation HDKeyValueDomain(ElectrocardiogramRecording)

- (id)hdhr_electrocardiogramRecordingOnboardingHistoryWithError:()ElectrocardiogramRecording
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB4D28];
  v17 = 0;
  objc_msgSend(a1, "propertyListValueForKey:error:", v4, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = v5;
  }
  else
  {
    v10 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB52F0];
    v12 = *MEMORY[0x1E0CB52F0];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v11;
        v14 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        v15 = v14;
        _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine ECG onboarding history",
          buf,
          0xCu);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(ElectrocardiogramRecording) hdhr_electrocardiogramRecordingOnboardingHistoryWithError:].cold.1(v11);
    }
    if (a3)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v9 = 0;
    }
  }

  return v9;
}

- (id)hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB4D10];
  v17 = 0;
  objc_msgSend(a1, "dateForKey:error:", v4, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = v5;
  }
  else
  {
    v10 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB52F0];
    v12 = *MEMORY[0x1E0CB52F0];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v11;
        v14 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        v15 = v14;
        _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine first ECG onboarding completion date",
          buf,
          0xCu);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(ElectrocardiogramRecording) hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:].cold.1(v11);
    }
    if (a3)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v9 = 0;
    }
  }

  return v9;
}

- (uint64_t)hdhr_setElectrocardiogramRecordingFirstOnboardingCompletedDate:()ElectrocardiogramRecording error:
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;

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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+ElectrocardiogramRecording.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  v11 = objc_msgSend(a1, "setDate:forKey:error:", v7, *MEMORY[0x1E0CB4D10], a4);

  return v11;
}

- (id)hdhr_electrocardiogramRecordingOnboardingCompletionVersionWithError:()ElectrocardiogramRecording
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+ElectrocardiogramRecording.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  objc_msgSend(a1, "numberForKey:error:", *MEMORY[0x1E0CB4D30], a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "integerValue"))
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (id)hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:()ElectrocardiogramRecording
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+ElectrocardiogramRecording.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  v9 = *MEMORY[0x1E0CB4D20];
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
        _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine ECG onboarding country code",
          buf,
          0xCu);

      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(ElectrocardiogramRecording) hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:].cold.1(v16);
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

- (uint64_t)hdhr_resetElectrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (objc_msgSend(a1, "category") != 105
    || (objc_msgSend(a1, "domainName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7700]),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+ElectrocardiogramRecording.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB4D10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "removeValuesForKeys:error:", v9, a3);

  return v10;
}

- (uint64_t)hdhr_electrocardiogramRecordingCountryCodeProvenanceWithError:()ElectrocardiogramRecording
{
  void *v6;
  char v7;
  void *v9;
  void *v10;

  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+ElectrocardiogramRecording.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  objc_msgSend(a1, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7700]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+ElectrocardiogramRecording.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]"));

  }
  return objc_msgSend(a1, "numberForKey:error:", CFSTR("HKElectrocardiogramOnboardingCountryCodeProvenance"), a3);
}

- (void)hdhr_electrocardiogramRecordingOnboardingHistoryWithError:()ElectrocardiogramRecording .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error reading ECG onboarding history: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error reading first ECG onboarding completion date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:()ElectrocardiogramRecording .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error reading ECG onboarding country code: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

@end
