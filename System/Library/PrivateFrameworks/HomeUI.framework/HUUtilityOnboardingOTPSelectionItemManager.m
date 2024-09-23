@implementation HUUtilityOnboardingOTPSelectionItemManager

- (HUUtilityOnboardingOTPSelectionItemManager)initWithDelegate:(id)a3 context:(id)a4
{
  id v7;
  HUUtilityOnboardingOTPSelectionItemManager *v8;
  HUUtilityOnboardingOTPSelectionItemManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSArray *factors;
  objc_super v22;
  uint8_t buf[4];
  HUUtilityOnboardingOTPSelectionItemManager *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  NSArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUUtilityOnboardingOTPSelectionItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v22, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    objc_msgSend(v7, "otpFactors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v7, "otpFactors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "addObject:", v11);
      objc_msgSend(v14, "removeObject:", v11);
      objc_msgSend(v14, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v16);

      objc_storeStrong((id *)&v9->_factors, v15);
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        factors = v9->_factors;
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        v25 = 2080;
        v26 = "-[HUUtilityOnboardingOTPSelectionItemManager initWithDelegate:context:]";
        v27 = 2112;
        v28 = factors;
        _os_log_debug_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEBUG, "%@:%s SORTED FACTORS %@", buf, 0x20u);
      }

    }
    else
    {
      objc_msgSend(v7, "otpFactors");
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = v9->_factors;
      v9->_factors = (NSArray *)v18;
    }

    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      v25 = 2080;
      v26 = "-[HUUtilityOnboardingOTPSelectionItemManager initWithDelegate:context:]";
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%s intialized item manager", buf, 0x16u);
    }

  }
  return v9;
}

uint64_t __71__HUUtilityOnboardingOTPSelectionItemManager_initWithDelegate_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("factorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SMS"));

  return v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[3];
  int v16;
  void *v17;
  uint8_t buf[4];
  HUUtilityOnboardingOTPSelectionItemManager *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  -[HUUtilityOnboardingOTPSelectionItemManager factors](self, "factors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__HUUtilityOnboardingOTPSelectionItemManager__buildItemProvidersForHome___block_invoke;
  v14[3] = &unk_1E6F4CA30;
  v14[4] = self;
  v14[5] = v15;
  objc_msgSend(v5, "na_map:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithItems:", v8);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v19 = self;
    v20 = 2080;
    v21 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildItemProvidersForHome:]";
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%s item provider: %@ with items %@\nfield items %@", buf, 0x34u);

  }
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v15, 8);
  return v12;
}

id __73__HUUtilityOnboardingOTPSelectionItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v25 = v5;
    v26 = 2080;
    v27 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildItemProvidersForHome:]_block_invoke";
    v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s Each factor  %@", buf, 0x20u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("factorType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Home.OnboardingView.Utility.OTP.%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("HUUtilityOnboardingOTPFactorTitle."), "stringByAppendingString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30D18]);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, CFSTR("factor-type"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("destination"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_links"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("send"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E0D30EE0]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_links"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("verify"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v15, *MEMORY[0x1E0D30EF0]);

  v16 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!(_DWORD)v16)
  {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30DA0]);
    v16 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v17, *MEMORY[0x1E0D30DA8]);

  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, CFSTR("factor-type"));
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E0D30BA0]);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v25 = v19;
    v26 = 2080;
    v27 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildItemProvidersForHome:]_block_invoke";
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%s result %@", buf, 0x20u);
  }

  v20 = objc_alloc(MEMORY[0x1E0D31840]);
  v21 = (void *)objc_msgSend(v6, "copy");
  v22 = (void *)objc_msgSend(v20, "initWithResults:", v21);

  return v22;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint8_t buf[4];
  HUUtilityOnboardingOTPSelectionItemManager *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager allItems](self, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = self;
    v40 = 2080;
    v41 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildSectionsWithDisplayedItems:]";
    v42 = 2112;
    v43 = v4;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s with displayed items %@\n%@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_80);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("field-identifier"));
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_84);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_85);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    -[UtilityOnboardingContext config](self->_context, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUtilityOnboardingOTPSelectionFooter"), CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  }
  else if (v12)
  {
    -[UtilityOnboardingContext config](self->_context, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUtilityOnboardingOTPSelectionFooterSMS"), CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v15);
  }
  else
  {
    if (!v13)
      goto LABEL_12;
    -[UtilityOnboardingContext config](self->_context, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUtilityOnboardingOTPSelectionFooterEmail"), CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v15);
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v11, "setFooterTitle:", v34);

  }
LABEL_12:
  objc_msgSend(v11, "setItems:", v10);
  HFLogForCategory();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v39 = self;
    v40 = 2080;
    v41 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildSectionsWithDisplayedItems:]";
    v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@:%s created field section %@", buf, 0x20u);
  }

  objc_msgSend(v7, "addObject:", v11);
  HFLogForCategory();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v39 = self;
    v40 = 2080;
    v41 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildSectionsWithDisplayedItems:]";
    v42 = 2112;
    v43 = v7;
    _os_log_impl(&dword_1B8E1E000, v36, OS_LOG_TYPE_DEFAULT, "%@:%s All sections %@", buf, 0x20u);
  }

  return v7;
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30DA8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30DA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = -1;
  else
    v10 = v9 != 0;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("factor-type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SMS"));

  return v4;
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("factor-type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("EMAIL"));

  return v4;
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
  objc_storeStrong((id *)&self->_factors, a3);
}

- (HFItem)selectedFactor
{
  return self->_selectedFactor;
}

- (void)setSelectedFactor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFactor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFactor, 0);
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
