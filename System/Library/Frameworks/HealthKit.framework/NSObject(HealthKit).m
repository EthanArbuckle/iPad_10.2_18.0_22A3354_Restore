@implementation NSObject(HealthKit)

- (BOOL)hk_hasValueForKeyPath:()HealthKit
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "valueForKeyPath:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)hk_safeValueForKeyPath:()HealthKit class:error:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a1, "_hk_valueForSafeValueForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKSafeObject(v9, a4, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hk_safeArrayForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "_hk_valueForSafeValueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  HKSafeObject(v7, v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_safeDictionaryForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "_hk_valueForSafeValueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  HKSafeObject(v7, v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_safeStringForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "_hk_valueForSafeValueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  HKSafeObject(v7, v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_safeNumberForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "_hk_valueForSafeValueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  HKSafeObject(v7, v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hk_safeValueIfExistsForKeyPath:()HealthKit class:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "_hk_valueForSafeValueForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    HKSafeObject(v9, a4, v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)hk_safeArrayIfExistsForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "hk_safeValueIfExistsForKeyPath:class:error:", v6, objc_opt_class(), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hk_safeDictionaryIfExistsForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "hk_safeValueIfExistsForKeyPath:class:error:", v6, objc_opt_class(), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hk_safeStringIfExistsForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "hk_safeValueIfExistsForKeyPath:class:error:", v6, objc_opt_class(), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hk_safeNumberIfExistsForKeyPath:()HealthKit error:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "hk_safeValueIfExistsForKeyPath:class:error:", v6, objc_opt_class(), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hk_expectMissingKeyPath:()HealthKit error:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unexpected key path %@"), v6);

  return v7 == 0;
}

- (id)hk_classNameWithTag:()HealthKit
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
