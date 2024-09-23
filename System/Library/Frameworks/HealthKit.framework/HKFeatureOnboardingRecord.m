@implementation HKFeatureOnboardingRecord

- (HKFeatureOnboardingRecord)initWithOnboardingState:(int64_t)a3 onboardingCompletion:(id)a4 featureSettings:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKFeatureOnboardingRecord *v15;
  HKFeatureOnboardingRecord *v16;
  id v17;
  HKFeatureOnboardingRecord *v18;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = a5;
    objc_msgSend(v9, "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    v12 = (void *)objc_msgSend(v8, "copy");
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKFeatureOnboardingRecord initWithOnboardingState:onboardingCompletionsByState:featureSettings:](self, "initWithOnboardingState:onboardingCompletionsByState:featureSettings:", a3, v14, v10);

    v16 = v15;
  }
  else
  {
    v17 = a5;
    v18 = -[HKFeatureOnboardingRecord initWithOnboardingState:onboardingCompletionsByState:featureSettings:](self, "initWithOnboardingState:onboardingCompletionsByState:featureSettings:", a3, MEMORY[0x1E0C9AA70], v17);

    v16 = v18;
  }

  return v16;
}

- (HKFeatureOnboardingRecord)initWithOnboardingState:(int64_t)a3 onboardingCompletionsByState:(id)a4 featureSettings:(id)a5
{
  id v8;
  id v9;
  HKFeatureOnboardingRecord *v10;
  HKFeatureOnboardingRecord *v11;
  uint64_t v12;
  NSDictionary *onboardingCompletionsByState;
  uint64_t v14;
  HKFeatureSettings *featureSettings;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKFeatureOnboardingRecord;
  v10 = -[HKFeatureOnboardingRecord init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_onboardingState = a3;
    v12 = objc_msgSend(v8, "copy");
    onboardingCompletionsByState = v11->_onboardingCompletionsByState;
    v11->_onboardingCompletionsByState = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    featureSettings = v11->_featureSettings;
    v11->_featureSettings = (HKFeatureSettings *)v14;

  }
  return v11;
}

- (HKOnboardingCompletion)onboardingCompletion
{
  NSDictionary *onboardingCompletionsByState;
  void *v3;
  void *v4;
  void *v5;

  onboardingCompletionsByState = self->_onboardingCompletionsByState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_onboardingState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](onboardingCompletionsByState, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKOnboardingCompletion *)v5;
}

- (NSDate)earliestDateOfAnyOnboardingCompletion
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSDictionary allValues](self->_onboardingCompletionsByState, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "completionDate");
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = (void *)v13;
              if (v4)
              {
                objc_msgSend(v4, "earlierDate:", v13);
                v15 = objc_claimAutoreleasedReturnValue();

                v4 = (void *)v15;
              }
              else
              {
                v4 = (void *)v13;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (BOOL)isOnboardingPresent
{
  return self->_onboardingState != 1;
}

- (NSSet)onboardedCountryCodesForOnboardingState
{
  void *v2;
  NSDictionary *onboardingCompletionsByState;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  onboardingCompletionsByState = self->_onboardingCompletionsByState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_onboardingState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](onboardingCompletionsByState, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_map:", &__block_literal_global_59);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

uint64_t __68__HKFeatureOnboardingRecord_onboardedCountryCodesForOnboardingState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "countryCode");
}

- (NSSet)allOnboardedCountryCodesRegardlessOfSupportedState
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSDictionary allValues](self->_onboardingCompletionsByState, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "hk_map:", &__block_literal_global_9);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v10;
}

uint64_t __79__HKFeatureOnboardingRecord_allOnboardedCountryCodesRegardlessOfSupportedState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "countryCode");
}

- (NSArray)allOnboardingCompletionsRegardlessOfSupportedState
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSDictionary allValues](self->_onboardingCompletionsByState, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  NSDictionary *onboardingCompletionsByState;
  NSDictionary *v8;
  HKFeatureSettings *featureSettings;
  HKFeatureSettings *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureOnboardingRecord;
  if (!-[HKFeatureOnboardingRecord isEqual:](&v12, sel_isEqual_, v4))
  {
    if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = 0;
      goto LABEL_14;
    }
    v6 = v4;
    if (self->_onboardingState != v6[2])
      goto LABEL_12;
    onboardingCompletionsByState = self->_onboardingCompletionsByState;
    v8 = (NSDictionary *)v6[3];
    if (onboardingCompletionsByState != v8
      && (!v8 || !-[NSDictionary isEqual:](onboardingCompletionsByState, "isEqual:")))
    {
      goto LABEL_12;
    }
    featureSettings = self->_featureSettings;
    v10 = (HKFeatureSettings *)v6[1];
    if (featureSettings == v10)
    {
      v5 = 1;
      goto LABEL_13;
    }
    if (v10)
      v5 = -[HKFeatureSettings isEqual:](featureSettings, "isEqual:");
    else
LABEL_12:
      v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v5 = 1;
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  int64_t onboardingState;
  uint64_t v4;

  onboardingState = self->_onboardingState;
  v4 = -[NSDictionary hash](self->_onboardingCompletionsByState, "hash") ^ onboardingState;
  return v4 ^ -[HKFeatureSettings hash](self->_featureSettings, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p completionsByState:%@ settings:%@>"), objc_opt_class(), self, self->_onboardingCompletionsByState, self->_featureSettings);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureOnboardingRecord)initWithCoder:(id)a3
{
  id v4;
  HKFeatureOnboardingRecord *v5;
  uint64_t v6;
  HKFeatureSettings *featureSettings;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *onboardingCompletionsByState;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKFeatureOnboardingRecord;
  v5 = -[HKFeatureOnboardingRecord init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureSettings"));
    v6 = objc_claimAutoreleasedReturnValue();
    featureSettings = v5->_featureSettings;
    v5->_featureSettings = (HKFeatureSettings *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("onboardingCompletionsByState"));
    v13 = objc_claimAutoreleasedReturnValue();
    onboardingCompletionsByState = v5->_onboardingCompletionsByState;
    v5->_onboardingCompletionsByState = (NSDictionary *)v13;

    v5->_onboardingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("onboardingState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKFeatureSettings *featureSettings;
  id v5;

  featureSettings = self->_featureSettings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureSettings, CFSTR("featureSettings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_onboardingCompletionsByState, CFSTR("onboardingCompletionsByState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_onboardingState, CFSTR("onboardingState"));

}

- (HKFeatureSettings)featureSettings
{
  return self->_featureSettings;
}

- (int64_t)onboardingState
{
  return self->_onboardingState;
}

- (NSDictionary)onboardingCompletionsByState
{
  return self->_onboardingCompletionsByState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingCompletionsByState, 0);
  objc_storeStrong((id *)&self->_featureSettings, 0);
}

@end
