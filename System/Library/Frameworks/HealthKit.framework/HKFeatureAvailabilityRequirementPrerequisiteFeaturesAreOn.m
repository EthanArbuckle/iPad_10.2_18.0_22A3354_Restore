@implementation HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn

- (HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn)initWithPrerequisiteFeatureSettings:(id)a3
{
  id v5;
  HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn *v6;
  HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn;
  v6 = -[HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_prerequisiteFeatureSettings, a3);

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("PrerequisiteFeaturesAreOn");
}

- (NSString)requirementDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[NSArray count](self->_prerequisiteFeatureSettings, "count") == 1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray firstObject](self->_prerequisiteFeatureSettings, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ must be on"), v5);
  }
  else
  {
    -[NSArray hk_map:](self->_prerequisiteFeatureSettings, "hk_map:", &__block_literal_global_47);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ must all be on"), v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

uint64_t __83__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_requirementDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureIdentifier");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_prerequisiteFeatureSettings;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "featureIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "onboardingRecordForFeatureWithIdentifier:error:", v12, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "featureSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else if ((objc_msgSend(v11, "isOnWhenSettingIsAbsent") & 1) == 0)
        {
          goto LABEL_17;
        }
        objc_msgSend(v13, "featureSettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "settingsOnKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if ((objc_msgSend(v17, "BOOLValue") & 1) == 0)
            goto LABEL_16;
        }
        else if ((objc_msgSend(v11, "isOnWhenSettingIsAbsent") & 1) == 0)
        {
LABEL_16:

LABEL_17:
          v18 = (void *)MEMORY[0x1E0C9AAA0];
          goto LABEL_18;
        }

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = (void *)MEMORY[0x1E0C9AAB0];
LABEL_18:

  return v18;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSArray *obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD aBlock[5];
  id v23;
  id location;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v7);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E37EA350;
  objc_copyWeak(&v23, &location);
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_prerequisiteFeatureSettings;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "featureAvailabilityProvidingDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "featureIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_11;
        v16[3] = &unk_1E37EE2B0;
        v17 = v8;
        objc_msgSend(v13, "registerObserver:forKey:newValueHandler:", v6, v14, v16);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v9);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
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
        __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);

    }
  }

}

uint64_t __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_prerequisiteFeatureSettings;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        objc_msgSend(v7, "featureAvailabilityProvidingDataSource", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "featureIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "unregisterObserver:forKey:", v6, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSArray isEqual:](self->_prerequisiteFeatureSettings, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_prerequisiteFeatureSettings, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_prerequisiteFeatureSettings, CFSTR("prerequisiteFeatureSettings"));
}

- (HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("prerequisiteFeatureSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn initWithPrerequisiteFeatureSettings:](self, "initWithPrerequisiteFeatureSettings:", v8);
  return v9;
}

- (NSArray)prerequisiteFeatureSettings
{
  return self->_prerequisiteFeatureSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerequisiteFeatureSettings, 0);
}

void __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error determining satisfaction in response to change in feature availability: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
