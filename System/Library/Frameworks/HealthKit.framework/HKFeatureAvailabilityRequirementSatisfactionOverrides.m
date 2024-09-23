@implementation HKFeatureAvailabilityRequirementSatisfactionOverrides

- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithFeatureIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HKFeatureAvailabilityRequirementSatisfactionOverrides *v7;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "hk_featureAvailabilityRequirementEvaluationOverridesUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKFeatureAvailabilityRequirementSatisfactionOverrides initWithUserDefaults:featureIdentifier:](self, "initWithUserDefaults:featureIdentifier:", v6, v5);

  return v7;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithUserDefaults:(id)a3 featureIdentifier:(id)a4
{
  return -[HKFeatureAvailabilityRequirementSatisfactionOverrides initWithUserDefaults:featureIdentifier:requirementOverridableEvaluator:](self, "initWithUserDefaults:featureIdentifier:requirementOverridableEvaluator:", a3, a4, &__block_literal_global_114);
}

uint64_t __96__HKFeatureAvailabilityRequirementSatisfactionOverrides_initWithUserDefaults_featureIdentifier___block_invoke()
{
  return 1;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverrides)initWithUserDefaults:(id)a3 featureIdentifier:(id)a4 requirementOverridableEvaluator:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKFeatureAvailabilityRequirementSatisfactionOverrides *v12;
  HKFeatureAvailabilityRequirementSatisfactionOverrides *v13;
  uint64_t v14;
  NSString *featureIdentifier;
  void *v16;
  id requirementOverridableEvaluator;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFeatureAvailabilityRequirementSatisfactionOverrides;
  v12 = -[HKFeatureAvailabilityRequirementSatisfactionOverrides init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    v14 = objc_msgSend(v10, "copy");
    featureIdentifier = v13->_featureIdentifier;
    v13->_featureIdentifier = (NSString *)v14;

    v16 = _Block_copy(v11);
    requirementOverridableEvaluator = v13->_requirementOverridableEvaluator;
    v13->_requirementOverridableEvaluator = v16;

  }
  return v13;
}

- (id)overriddenSatisfactionOfRequirementWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureRequirementOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleInternalInstall");

  if ((v8 & 1) == 0)
  {
    if (!v6)
      goto LABEL_15;
    _HKInitializeLogging();
    HKLogInfrastructure();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

    if (!v24)
      goto LABEL_15;
    HKLogInfrastructure();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_14;
  }
  -[HKFeatureAvailabilityRequirementSatisfactionOverrides requirementOverridableEvaluator](self, "requirementOverridableEvaluator");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, NSString *, id))v9)[2](v9, self->_featureIdentifier, v4);

  if ((v10 & 1) != 0)
  {
    if (v6)
    {
      +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "featureRequirementOverrides");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", self->_featureIdentifier);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureRequirementOverrides");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", self->_featureIdentifier);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "featureRequirementOverrides");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", self->_featureIdentifier);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v4);
          v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), self->_featureIdentifier, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v22 = v20;
    else
      v22 = 0;
    goto LABEL_21;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);

  if (v34)
  {
    HKLogInfrastructure();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[HKFeatureAvailabilityRequirementSatisfactionOverrides overriddenSatisfactionOfRequirementWithIdentifier:].cold.1(v25, v35, v36, v37, v38, v39, v40, v41);
LABEL_14:

  }
LABEL_15:
  v22 = 0;
LABEL_22:

  return v22;
}

- (id)overriddenRequirementIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *featureIdentifier;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD);
  int v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSUserDefaults dictionaryRepresentation](self->_userDefaults, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        featureIdentifier = self->_featureIdentifier;
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_"), featureIdentifier);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(featureIdentifier) = objc_msgSend(v10, "hasPrefix:", v11);

        if ((_DWORD)featureIdentifier)
        {
          objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("_"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") == 2)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[HKFeatureAvailabilityRequirementSatisfactionOverrides requirementOverridableEvaluator](self, "requirementOverridableEvaluator");
              v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v15 = ((uint64_t (**)(_QWORD, NSString *, void *))v14)[2](v14, self->_featureIdentifier, v13);

              if (v15)
                objc_msgSend(v18, "addObject:", v13);
            }
          }
          else
          {

            v13 = 0;
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)overrideSatisfactionOfRequirementWithIdentifier:(id)a3 isSatisfied:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;

  v6 = a3;
  v7 = a4;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleInternalInstall");

  if (v9)
  {
    -[HKFeatureAvailabilityRequirementSatisfactionOverrides requirementOverridableEvaluator](self, "requirementOverridableEvaluator");
    v10 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11 = ((uint64_t (**)(_QWORD, NSString *, id))v10)[2](v10, self->_featureIdentifier, v6);

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), self->_featureIdentifier, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v7, v12);

    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

      if (v14)
      {
        HKLogInfrastructure();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[HKFeatureAvailabilityRequirementSatisfactionOverrides overrideSatisfactionOfRequirementWithIdentifier:isSatisfied:].cold.1((uint64_t)v6, v15);

      }
    }
  }

}

- (void)resetAllRequirementSatisfactionOverrides
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *featureIdentifier;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSUserDefaults dictionaryRepresentation](self->_userDefaults, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        featureIdentifier = self->_featureIdentifier;
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_"), featureIdentifier);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(featureIdentifier) = objc_msgSend(v10, "hasPrefix:", v11);

        if ((_DWORD)featureIdentifier)
          -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (id)requirementOverridableEvaluator
{
  return self->_requirementOverridableEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requirementOverridableEvaluator, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)overriddenSatisfactionOfRequirementWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_16(&dword_19A0E6000, a1, a3, "Override ignored since this is not an overridable requirement.", a5, a6, a7, a8, 0);
}

- (void)overriddenSatisfactionOfRequirementWithIdentifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_16(&dword_19A0E6000, a1, a3, "Feature availability overrides ignored since this is not an internal installation.", a5, a6, a7, a8, 0);
}

- (void)overrideSatisfactionOfRequirementWithIdentifier:(uint64_t)a1 isSatisfied:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_DEBUG, "Override for %@ is ignored since it is not an overridable requirement.", (uint8_t *)&v2, 0xCu);
}

@end
