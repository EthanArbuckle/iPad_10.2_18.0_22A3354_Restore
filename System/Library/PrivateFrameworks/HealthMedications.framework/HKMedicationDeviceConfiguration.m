@implementation HKMedicationDeviceConfiguration

- (HKMedicationDeviceConfiguration)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)supportsOntologyBackedMedications
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isSupportedLocale:", v3);

  return (char)a1;
}

+ (BOOL)_isSupportedLocale:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(a1, "_isSupportedRegion:", v6);
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = a1;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1B77D4000, v8, OS_LOG_TYPE_ERROR, "%{public}@: passing a locale without country code (%{public}@) to %{public}@, will return NO", (uint8_t *)&v11, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_isSupportedRegion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB4AC8];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4, v7, v8);

  return (char)v3;
}

@end
