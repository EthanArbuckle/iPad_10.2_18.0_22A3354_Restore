@implementation HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures

- (HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures)initWithPrerequisiteFeatureIdentifiers:(id)a3
{
  id v5;
  HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures *v6;
  HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures;
  v6 = -[HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_prerequisiteFeatureIdentifiers, a3);

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("OnboardingRecordsArePresentForPrerequisiteFeatures");
}

- (NSString)requirementDescription
{
  NSUInteger v3;
  void *v4;
  NSArray *prerequisiteFeatureIdentifiers;
  void *v6;
  void *v7;

  v3 = -[NSArray count](self->_prerequisiteFeatureIdentifiers, "count");
  v4 = (void *)MEMORY[0x1E0CB3940];
  prerequisiteFeatureIdentifiers = self->_prerequisiteFeatureIdentifiers;
  if (v3 == 1)
  {
    -[NSArray firstObject](prerequisiteFeatureIdentifiers, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("An onboarding record must be present for %@"), v6);
  }
  else
  {
    -[NSArray componentsJoinedByString:](prerequisiteFeatureIdentifiers, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Onboarding records must be present for %@"), v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_prerequisiteFeatureIdentifiers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0C9AAB0];
    goto LABEL_15;
  }
  v9 = v8;
  v10 = *(_QWORD *)v18;
  v11 = (void *)MEMORY[0x1E0C9AAA0];
  v12 = (void *)MEMORY[0x1E0C9AAB0];
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(v6, "onboardingRecordForFeatureWithIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a4, (_QWORD)v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        v12 = 0;
LABEL_14:

        goto LABEL_15;
      }
      if (objc_msgSend(v14, "onboardingState") == 1)
      {
        v12 = v11;
        goto LABEL_14;
      }

    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
      continue;
    break;
  }
LABEL_15:

  return v12;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSArray *obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD aBlock[5];
  id v22;
  id location;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v7);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E37EA350;
  objc_copyWeak(&v22, &location);
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_prerequisiteFeatureIdentifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "featureAvailabilityProvidingDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke_10;
        v15[3] = &unk_1E37EE2B0;
        v16 = v8;
        objc_msgSend(v13, "registerObserver:forKey:newValueHandler:", v6, v12, v15);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v9);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
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

uint64_t __117__HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures_registerObserver_forDataSource___block_invoke_10(uint64_t a1)
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
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_prerequisiteFeatureIdentifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(v7, "featureAvailabilityProvidingDataSource", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "unregisterObserver:forKey:", v6, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
    v5 = -[NSArray isEqual:](self->_prerequisiteFeatureIdentifiers, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_prerequisiteFeatureIdentifiers, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_prerequisiteFeatureIdentifiers, CFSTR("prerequisiteFeatureIdentifiers"));
}

- (HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("prerequisiteFeatureIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures initWithPrerequisiteFeatureIdentifiers:](self, "initWithPrerequisiteFeatureIdentifiers:", v8);
  return v9;
}

- (NSArray)prerequisiteFeatureIdentifiers
{
  return self->_prerequisiteFeatureIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerequisiteFeatureIdentifiers, 0);
}

@end
