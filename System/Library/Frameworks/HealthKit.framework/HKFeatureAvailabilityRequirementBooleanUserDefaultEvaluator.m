@implementation HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator

- (id)defaultValueWhenKeyIsMissing
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator defaultBoolValueWhenKeyIsMissing](self, "defaultBoolValueWhenKeyIsMissing"));
}

- (BOOL)isSatisfiedForValue:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator isSatisfiedForValue:].cold.1(self, (uint64_t)v4, v6);

    v5 = -[HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator defaultBoolValueWhenKeyIsMissing](self, "defaultBoolValueWhenKeyIsMissing");
  }
  v7 = -[HKFeatureAvailabilityRequirementBooleanUserDefaultEvaluator isSatisfiedForBoolValue:](self, "isSatisfiedForBoolValue:", v5);

  return v7;
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  HKUserDefaultsDataSource *v3;
  void *v4;
  HKUserDefaultsDataSource *v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  v3 = [HKUserDefaultsDataSource alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKUserDefaultsDataSource initWithUserDefaults:](v3, "initWithUserDefaults:", v4);

  return v5;
}

- (void)isSatisfiedForValue:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = v6;
  objc_msgSend(a1, "userDefaultsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = a2;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: Unexpected value %{public}@ for key %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
