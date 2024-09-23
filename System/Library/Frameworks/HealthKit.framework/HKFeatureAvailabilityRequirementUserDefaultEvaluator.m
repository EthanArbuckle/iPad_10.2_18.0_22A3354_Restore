@implementation HKFeatureAvailabilityRequirementUserDefaultEvaluator

- (HKFeatureAvailabilityRequirementUserDefaultEvaluator)initWithUserDefaultsKey:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementUserDefaultEvaluator *v5;
  uint64_t v6;
  NSString *userDefaultsKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementUserDefaultEvaluator;
  v5 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userDefaultsKey = v5->_userDefaultsKey;
    v5->_userDefaultsKey = (NSString *)v6;

  }
  return v5;
}

- (id)defaultValueWhenKeyIsMissing
{
  return 0;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator whichUserDefaultsDataSourceInDataSource:](self, "whichUserDefaultsDataSourceInDataSource:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", self->_userDefaultsKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    -[HKFeatureAvailabilityRequirementUserDefaultEvaluator defaultValueWhenKeyIsMissing](self, "defaultValueWhenKeyIsMissing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "numberWithBool:", -[HKFeatureAvailabilityRequirementUserDefaultEvaluator isSatisfiedForValue:](self, "isSatisfiedForValue:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  return v10;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  void *v7;
  NSString *userDefaultsKey;
  _QWORD v9[5];

  v6 = a3;
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator whichUserDefaultsDataSourceInDataSource:](self, "whichUserDefaultsDataSourceInDataSource:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  userDefaultsKey = self->_userDefaultsKey;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__HKFeatureAvailabilityRequirementUserDefaultEvaluator_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E37E9E48;
  v9[4] = self;
  objc_msgSend(v7, "registerObserver:forKey:newValueHandler:", v6, userDefaultsKey, v9);

}

void __87__HKFeatureAvailabilityRequirementUserDefaultEvaluator_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator _notifyObserver:forNewValue:](*(_QWORD **)(a1 + 32), a2, a3);
}

- (void)_notifyObserver:(void *)a3 forNewValue:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v6)
    {
      v7 = objc_msgSend(a1, "isSatisfiedForValue:", v6);
    }
    else
    {
      objc_msgSend(a1, "defaultValueWhenKeyIsMissing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(a1, "isSatisfiedForValue:", v8);

    }
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      HKLogInfrastructure();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)objc_opt_class();
        v13 = a1[1];
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = v12;
        objc_msgSend(v14, "numberWithBool:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138544130;
        v18 = v12;
        v19 = 2114;
        v20 = v5;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v16;
        _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ of satisfaction for key %{public}@: %{public}@", (uint8_t *)&v17, 0x2Au);

      }
    }
    objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", a1, v7);
  }

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator whichUserDefaultsDataSourceInDataSource:](self, "whichUserDefaultsDataSourceInDataSource:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:forKey:", v6, self->_userDefaultsKey);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSString isEqualToString:](self->_userDefaultsKey, "isEqualToString:", v4[1]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_userDefaultsKey, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_userDefaultsKey, CFSTR("UserDefaultsKey"));
}

- (HKFeatureAvailabilityRequirementUserDefaultEvaluator)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementUserDefaultEvaluator *v5;
  uint64_t v6;
  NSString *userDefaultsKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementUserDefaultEvaluator;
  v5 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserDefaultsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    userDefaultsKey = v5->_userDefaultsKey;
    v5->_userDefaultsKey = (NSString *)v6;

  }
  return v5;
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsKey, 0);
}

- (BOOL)isSatisfiedForValue:(id)a3
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

+ (NSString)requirementIdentifier
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return (NSString *)&stru_1E37FD4C0;
}

- (NSString)requirementDescription
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return (NSString *)&stru_1E37FD4C0;
}

@end
