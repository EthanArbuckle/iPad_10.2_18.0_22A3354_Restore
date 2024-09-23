@implementation HKRemoteFeatureAvailabilityRuleSet

- (HKRemoteFeatureAvailabilityRuleSet)initWithRawValue:(id)a3 dataSource:(id)a4 supportedConditions:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKRemoteFeatureAvailabilityRuleSet *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *conditions;
  uint64_t v14;
  NSSet *supportedConditions;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKRemoteFeatureAvailabilityRuleSet;
  v11 = -[HKRemoteFeatureAvailabilityRuleSet init](&v17, sel_init);
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    conditions = v11->_conditions;
    v11->_conditions = v12;

    v14 = objc_msgSend(v10, "copy");
    supportedConditions = v11->_supportedConditions;
    v11->_supportedConditions = (NSSet *)v14;

    -[HKRemoteFeatureAvailabilityRuleSet _parseRulesFromRawValue:dataSource:](v11, "_parseRulesFromRawValue:dataSource:", v8, v9);
  }

  return v11;
}

- (void)_parseRulesFromRawValue:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138543362;
    v20 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        -[HKRemoteFeatureAvailabilityRuleSet supportedConditions](self, "supportedConditions", v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if (v15)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[HKRemoteFeatureAvailabilityBaseRule ruleClassForRawValue:](HKRemoteFeatureAvailabilityBaseRule, "ruleClassForRawValue:", v16))
          {
            v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRawValue:dataSource:", v16, v7);
            -[HKRemoteFeatureAvailabilityRuleSet conditions](self, "conditions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v13);

          }
          else
          {
            _HKInitializeLogging();
            v19 = HKLogDefault;
            if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v20;
              v26 = v16;
              _os_log_impl(&dword_19A0E6000, v19, OS_LOG_TYPE_INFO, "Unknown HKRemoteFeatureAvailabilityRule for raw payload: %{public}@", buf, 0xCu);
            }
          }

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

}

- (id)evaluateAll
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HKRemoteFeatureAvailabilityRuleSet conditions](self, "conditions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        -[HKRemoteFeatureAvailabilityRuleSet conditions](self, "conditions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "evaluate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (NSMutableDictionary)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (NSSet)supportedConditions
{
  return self->_supportedConditions;
}

- (void)setSupportedConditions:(id)a3
{
  objc_storeStrong((id *)&self->_supportedConditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedConditions, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
