@implementation HKFeatureAvailabilityRequirementAgeIsPresent

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("AgeIsPresent");
}

- (NSString)requirementDescription
{
  return (NSString *)CFSTR("An age must be set in Health Details");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v5 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierDateOfBirth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v7, "userCharacteristicForDataType:error:", v6, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HKFeatureAvailabilityRequirementAgeIsPresent isSatisfiedWithDataSource:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError(v9);
    v11 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.healthd.user-characteristics.did-change");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E37EA350;
  objc_copyWeak(&v16, &location);
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  objc_msgSend(v7, "darwinNotificationDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_8;
  v13[3] = &unk_1E37EC480;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "registerObserver:forKey:newValueHandler:", v6, v8, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (_QWORD *)(a1 + 32);
    v10 = 0;
    objc_msgSend(v6, "isSatisfiedWithDataSource:error:", WeakRetained, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v7)
    {
      objc_msgSend(v3, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v5, objc_msgSend(v7, "BOOLValue"));
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_cold_1();

    }
  }

}

uint64_t __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", "com.apple.healthd.user-characteristics.did-change");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "darwinNotificationDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unregisterObserver:forKey:", v7, v9);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)isSatisfiedWithDataSource:error:.cold.1()
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

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v2, v3, "[%{public}@] Error while pulling date of birth characteristic: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __79__HKFeatureAvailabilityRequirementAgeIsPresent_registerObserver_forDataSource___block_invoke_cold_1()
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

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v2, v3, "[%{public}@]: Error determining satisfaction in response to change in feature availability: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
