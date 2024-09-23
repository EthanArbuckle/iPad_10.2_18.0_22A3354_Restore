@implementation HUUtilityOnboardingTAFItemManager

- (HUUtilityOnboardingTAFItemManager)initWithDelegate:(id)a3 fields:(id)a4 sections:(id)a5
{
  id v9;
  id v10;
  HUUtilityOnboardingTAFItemManager *v11;
  HUUtilityOnboardingTAFItemManager *v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  HUUtilityOnboardingTAFItemManager *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUUtilityOnboardingTAFItemManager;
  v11 = -[HFItemManager initWithDelegate:sourceItem:](&v16, sel_initWithDelegate_sourceItem_, a3, 0);
  v12 = v11;
  if (v11)
  {
    if (v9)
      objc_storeStrong((id *)&v11->_TAFfields, a4);
    if (v10)
      objc_storeStrong((id *)&v12->_TAFSections, a5);
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v18 = v12;
      v19 = 2080;
      v20 = "-[HUUtilityOnboardingTAFItemManager initWithDelegate:fields:sections:]";
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%s intialized item manager with taf type %@ ", buf, 0x20u);
    }

  }
  return v12;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *TAFfields;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSArray *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[4];
  NSArray *v18;
  uint8_t buf[4];
  HUUtilityOnboardingTAFItemManager *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSArray *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    TAFfields = self->_TAFfields;
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2080;
    v22 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]";
    v23 = 2112;
    v24 = TAFfields;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "*** %@:%s  TAF fields as set %@", buf, 0x20u);
  }

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  -[HUUtilityOnboardingTAFItemManager TAFfields](self, "TAFfields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HUUtilityOnboardingTAFItemManager__buildItemProvidersForHome___block_invoke;
  v16[3] = &unk_1E6F4FCC8;
  v16[4] = self;
  v16[5] = v17;
  objc_msgSend(v7, "na_map:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSArray *)objc_msgSend(v9, "initWithItems:", v10);

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[NSArray items](v11, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v20 = self;
    v21 = 2080;
    v22 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s item provider: %@ with items %@ ", buf, 0x2Au);

  }
  v18 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v17, 8);
  return v14;
}

id __64__HUUtilityOnboardingTAFItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v18 = 138412802;
    v19 = v5;
    v20 = 2080;
    v21 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]_block_invoke";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s Each field  %@", (uint8_t *)&v18, 0x20u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "formKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E0D30C08]);

  if (objc_msgSend(v3, "required"))
    v9 = CFSTR("HUUtilityOnboardingTAF_RequiredField");
  else
    v9 = CFSTR("HUUtilityOnboardingTAF_OptionalField");
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30D28]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D30DA8]);

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v18 = 138412802;
    v19 = v13;
    v20 = 2080;
    v21 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]_block_invoke";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s result %@", (uint8_t *)&v18, 0x20u);
  }

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v14 = objc_alloc(MEMORY[0x1E0D31840]);
  v15 = (void *)objc_msgSend(v6, "copy");
  v16 = (void *)objc_msgSend(v14, "initWithResults:", v15);

  return v16;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  SEL v18;
  uint8_t v19[4];
  HUUtilityOnboardingTAFItemManager *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  _BYTE buf[24];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[HUUtilityOnboardingTAFItemManager _buildSectionsWithDisplayedItems:]";
    *(_WORD *)&buf[22] = 2112;
    v26 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s with displayed items %@", buf, 0x20u);
  }

  -[HFItemManager allItems](self, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_45);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v26 = 0;
  -[HUUtilityOnboardingTAFItemManager TAFSections](self, "TAFSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v15[3] = &unk_1E6F4FD10;
  v17 = buf;
  v18 = a2;
  v15[4] = self;
  v11 = v9;
  v16 = v11;
  objc_msgSend(v10, "na_map:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v19 = 138412802;
    v20 = self;
    v21 = 2080;
    v22 = "-[HUUtilityOnboardingTAFItemManager _buildSectionsWithDisplayedItems:]";
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "*** %@:%s All sections %@", v19, 0x20u);
  }

  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
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

id __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "*** %@:%@ Each single section %@", buf, 0x20u);

  }
  objc_msgSend(CFSTR("HUUtilityOnboardingFieldsSectionIdentifier"), "stringByAppendingFormat:", CFSTR("-%lu"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v7);
  v9 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_70;
  v20[3] = &unk_1E6F4DAD8;
  v10 = v3;
  v21 = v10;
  objc_msgSend(v9, "na_filter:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "*** %@:%@ Filtered items %@", buf, 0x20u);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("header"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderTitle:", v15);

  objc_msgSend(v8, "setItems:", v11);
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v23 = v17;
    v24 = 2080;
    v25 = "-[HUUtilityOnboardingTAFItemManager _buildSectionsWithDisplayedItems:]_block_invoke";
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "*** %@:%s  created field section %@", buf, 0x20u);
  }

  v18 = v8;
  return v18;
}

uint64_t __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_70(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("fields"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSArray)TAFfields
{
  return self->_TAFfields;
}

- (void)setTAFfields:(id)a3
{
  objc_storeStrong((id *)&self->_TAFfields, a3);
}

- (NSArray)TAFSections
{
  return self->_TAFSections;
}

- (void)setTAFSections:(id)a3
{
  objc_storeStrong((id *)&self->_TAFSections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_TAFSections, 0);
  objc_storeStrong((id *)&self->_TAFfields, 0);
}

@end
