@implementation HKRemoteFeatureAvailabilityBaseRule

+ (Class)ruleClassForRawValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (ruleClassForRawValue__onceToken != -1)
    dispatch_once(&ruleClassForRawValue__onceToken, &__block_literal_global_58);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ruleIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)ruleClassForRawValue__allRules, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

void __60__HKRemoteFeatureAvailabilityBaseRule_ruleClassForRawValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[25];
  _QWORD v28[27];

  v28[25] = *MEMORY[0x1E0C80C00];
  +[HKRemoteFeatureAvailabilityAlwaysFalseRule ruleIdentifier](HKRemoteFeatureAvailabilityAlwaysFalseRule, "ruleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  v28[0] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityAlwaysTrueRule ruleIdentifier](HKRemoteFeatureAvailabilityAlwaysTrueRule, "ruleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  v28[1] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule, "ruleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  v28[2] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionGreaterThanRule ruleIdentifier](HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionGreaterThanRule, "ruleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v23;
  v28[3] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionLessThanRule ruleIdentifier](HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionLessThanRule, "ruleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v22;
  v28[4] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityCompoundRule ruleIdentifier](HKRemoteFeatureAvailabilityCompoundRule, "ruleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v21;
  v28[5] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityDeviceClassEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityDeviceClassEqualsRule, "ruleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v20;
  v28[6] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule, "ruleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v19;
  v28[7] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityIOSBuildVersionGreaterThanRule ruleIdentifier](HKRemoteFeatureAvailabilityIOSBuildVersionGreaterThanRule, "ruleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v18;
  v28[8] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityIOSBuildVersionLessThanRule ruleIdentifier](HKRemoteFeatureAvailabilityIOSBuildVersionLessThanRule, "ruleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v17;
  v28[9] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityIOSVersionEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityIOSVersionEqualsRule, "ruleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  v28[10] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityIOSVersionGreaterThanRule ruleIdentifier](HKRemoteFeatureAvailabilityIOSVersionGreaterThanRule, "ruleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v15;
  v28[11] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityIOSVersionLessThanRule ruleIdentifier](HKRemoteFeatureAvailabilityIOSVersionLessThanRule, "ruleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v14;
  v28[12] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityOnboardingCountryCodeRule ruleIdentifier](HKRemoteFeatureAvailabilityOnboardingCountryCodeRule, "ruleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v13;
  v28[13] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule, "ruleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v12;
  v28[14] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchOSBuildVersionEqualsRule, "ruleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v11;
  v28[15] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule, "ruleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v0;
  v28[16] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchOSBuildVersionLessThanRule, "ruleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v27[17] = v1;
  v28[17] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchOSVersionEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchOSVersionEqualsRule, "ruleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[18] = v2;
  v28[18] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchOSVersionGreaterThanRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchOSVersionGreaterThanRule, "ruleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[19] = v3;
  v28[19] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule, "ruleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[20] = v4;
  v28[20] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule, "ruleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[21] = v5;
  v28[21] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule, "ruleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[22] = v6;
  v28[22] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchRegionEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchRegionEqualsRule, "ruleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[23] = v7;
  v28[23] = objc_opt_class();
  +[HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule ruleIdentifier](HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule, "ruleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[24] = v8;
  v28[24] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 25);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)ruleClassForRawValue__allRules;
  ruleClassForRawValue__allRules = v9;

}

- (HKRemoteFeatureAvailabilityBaseRule)initWithRawValue:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HKRemoteFeatureAvailabilityBaseRule *v8;
  HKRemoteFeatureAvailabilityBaseRule *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKRemoteFeatureAvailabilityBaseRule;
  v8 = -[HKRemoteFeatureAvailabilityBaseRule init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = v10;
    else
      v12 = MEMORY[0x1E0C9AA70];
    -[HKRemoteFeatureAvailabilityBaseRule processUserInfo:](v9, "processUserInfo:", v12);

  }
  return v9;
}

- (HKRemoteFeatureAvailabilityDataSource)dataSource
{
  return (HKRemoteFeatureAvailabilityDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)processUserInfo:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
}

- (BOOL)evaluate
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
  return 0;
}

@end
