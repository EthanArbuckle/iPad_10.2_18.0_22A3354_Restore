@implementation NSJSONSerialization(HealthKit)

+ (uint64_t)hk_JSONObjectFromFHIRData:()HealthKit options:error:
{
  return objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, a4 | 0x1000);
}

+ (__CFString)hk_stringForDisplayFromFHIRData:()HealthKit
{
  void *v4;
  id v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v15 = 0;
  objc_msgSend(a1, "hk_JSONObjectFromFHIRData:options:error:", a3, 0, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    objc_msgSend(a1, "hk_stringForDisplayFromFHIRJSONObject:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      +[NSJSONSerialization(HealthKit) hk_stringForDisplayFromFHIRData:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    v6 = &stru_1E37FD4C0;
  }

  return v6;
}

+ (__CFString)hk_stringForDisplayFromFHIRJSONObject:()HealthKit
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    objc_msgSend(v5, "hk_stringByUnescapingJSONCharactersForDisplay");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      +[NSJSONSerialization(HealthKit) hk_stringForDisplayFromFHIRJSONObject:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    v6 = &stru_1E37FD4C0;
  }

  return v6;
}

+ (id)hk_JSONObjectSecureCodingClasses
{
  if (hk_JSONObjectSecureCodingClasses_onceToken != -1)
    dispatch_once(&hk_JSONObjectSecureCodingClasses_onceToken, &__block_literal_global_80);
  return (id)hk_JSONObjectSecureCodingClasses_classes;
}

+ (void)hk_stringForDisplayFromFHIRData:()HealthKit .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Failed to create JSON object from FHIR data: %@", a5, a6, a7, a8, 2u);
}

+ (void)hk_stringForDisplayFromFHIRJSONObject:()HealthKit .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Failed to create data for display string from FHIR object: %@", a5, a6, a7, a8, 2u);
}

@end
