@implementation HUUtilityOnboardingConnectionItemManager

- (HUUtilityOnboardingConnectionItemManager)initWithDelegate:(id)a3 data:(id)a4
{
  id v6;
  HUUtilityOnboardingConnectionItemManager *v7;
  HUUtilityOnboardingConnectionItemManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  HUUtilityOnboardingConnectionItemManager *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUUtilityOnboardingConnectionItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  v8 = v7;
  if (v7)
  {
    -[HUUtilityOnboardingConnectionItemManager setData:](v7, "setData:", v6);
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2080;
      v15 = "-[HUUtilityOnboardingConnectionItemManager initWithDelegate:data:]";
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s intialized item manager", buf, 0x16u);
    }

  }
  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  HUUtilityOnboardingConnectionItemManager *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUUtilityOnboardingConnectionItemManager data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2080;
    v22 = "-[HUUtilityOnboardingConnectionItemManager _buildItemProvidersForHome:]";
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s  data %@", buf, 0x20u);

  }
  v7 = (void *)objc_opt_new();
  if (a3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", CFSTR("homeName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E0D30D18]);

    -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", CFSTR("utilityName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E0D30C08]);

    objc_msgSend(v7, "na_safeSetObject:forKey:", CFSTR("Home.OnboardingView.Utility.SubscriptionInfo"), *MEMORY[0x1E0D30BA0]);
  }
  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v11 = (void *)objc_msgSend(v7, "copy");
  v12 = (void *)objc_msgSend(v10, "initWithResults:", v11);

  v13 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithItems:", v14);

  v18 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("subscriptionIdentifier"));
  -[HFItemManager allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v6);

  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
