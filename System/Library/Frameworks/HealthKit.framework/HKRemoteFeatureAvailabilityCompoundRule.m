@implementation HKRemoteFeatureAvailabilityCompoundRule

+ (id)ruleIdentifier
{
  return CFSTR("CompoundRule");
}

- (void)processUserInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grouping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityCompoundRule setGrouping:](self, "setGrouping:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKRemoteFeatureAvailabilityCompoundRule setRules:](self, "setRules:", v6);

  v24 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rules"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v17 = +[HKRemoteFeatureAvailabilityBaseRule ruleClassForRawValue:](HKRemoteFeatureAvailabilityBaseRule, "ruleClassForRawValue:", v16);
        if (v17)
        {
          v18 = v17;
          -[HKRemoteFeatureAvailabilityCompoundRule rules](self, "rules");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = [v18 alloc];
          -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithRawValue:dataSource:", v16, v21);
          objc_msgSend(v19, "addObject:", v22);

        }
        else
        {
          _HKInitializeLogging();
          v23 = HKLogDefault;
          if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v16;
            _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_INFO, "Unknown HKRemoteFeatureAvailabilityRule for raw payload: %{public}@", buf, 0xCu);
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v13);
  }

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;

  -[HKRemoteFeatureAvailabilityCompoundRule rules](self, "rules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "evaluate");

  -[HKRemoteFeatureAvailabilityCompoundRule rules](self, "rules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    v8 = 1;
    do
    {
      -[HKRemoteFeatureAvailabilityCompoundRule rules](self, "rules");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "evaluate");
      -[HKRemoteFeatureAvailabilityCompoundRule grouping](self, "grouping");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AND"));

      if (v13)
      {
        v5 &= v11;
      }
      else
      {
        -[HKRemoteFeatureAvailabilityCompoundRule grouping](self, "grouping");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("OR"));

        if (v15)
          v5 |= v11;
      }

      ++v8;
      -[HKRemoteFeatureAvailabilityCompoundRule rules](self, "rules");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v8 < v17);
  }
  return v5 & 1;
}

- (NSString)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
  objc_storeStrong((id *)&self->_grouping, a3);
}

- (NSMutableArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
}

@end
