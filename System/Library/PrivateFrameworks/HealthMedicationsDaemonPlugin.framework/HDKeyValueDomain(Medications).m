@implementation HDKeyValueDomain(Medications)

+ (id)hdmd_defaultDomainWithProfile:()Medications
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D294B8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", HDEntityCategoryForKeyValueCategory(), *MEMORY[0x1E0D2C2D8], v4);

  return v6;
}

+ (id)hdmd_timeZoneDomainWithProfile:()Medications
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D294B8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", HDEntityCategoryForKeyValueCategory(), *MEMORY[0x1E0D2C368], v4);

  return v6;
}

- (uint64_t)hdmd_numberValueAsBoolForKey:()Medications
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  objc_msgSend(a1, "numberForKey:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v12 = a1;
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = v6;
    }

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "BOOLValue");
  }

  return v8;
}

@end
