@implementation HUEnergySettingsItemModule

- (HUEnergySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUEnergySettingsItemModule *v8;
  HUEnergySettingsItemModule *v9;
  void *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUEnergySettingsItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v12, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    -[HUEnergySettingsItemModule _buildItemProviders](v9, "_buildItemProviders");
    -[HUEnergySettingsItemModule setHasSentUtilityAnalytics:](v9, "setHasSentUtilityAnalytics:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel_subscriptionChanged_, CFSTR("hasUtilitySubscriptionDidChange"), 0);

  }
  return v9;
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31840]);
  v26[0] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D319D0], "isUsingiCloud") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v26[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtility"), CFSTR("HUEnergySettingsConnectUtility"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = *MEMORY[0x1E0D30C78];
  v27[1] = v5;
  v27[2] = CFSTR("plus");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithResults:", v6);
  -[HUEnergySettingsItemModule setConnectUtilityItem:](self, "setConnectUtilityItem:", v7);

  v8 = objc_alloc(MEMORY[0x1E0D31840]);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke;
  v22[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v23, &location);
  v10 = (void *)objc_msgSend(v8, "initWithResultsBlock:", v22);
  -[HUEnergySettingsItemModule setUtilityDetailsItem:](self, "setUtilityDetailsItem:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D31840]);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2_104;
  v20[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v21, &location);
  v12 = (void *)objc_msgSend(v11, "initWithResultsBlock:", v20);
  -[HUEnergySettingsItemModule setGridForecastItem:](self, "setGridForecastItem:", v12);

  -[HUEnergySettingsItemModule connectUtilityItem](self, "connectUtilityItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  -[HUEnergySettingsItemModule utilityDetailsItem](self, "utilityDetailsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  -[HUEnergySettingsItemModule gridForecastItem](self, "gridForecastItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithItems:", v18);
  -[HUEnergySettingsItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[4];
  _QWORD v32[4];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_hasUtilitySubscription");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      if ((v8 & 1) == 0)
      {
LABEL_5:
        v9 = (void *)MEMORY[0x1E0D519C0];
        v37 = *MEMORY[0x1E0D30D70];
        v38[0] = MEMORY[0x1E0C9AAB0];
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v38;
        v12 = &v37;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hf_currentUserIsOwner");

      if ((v14 & 1) == 0)
        goto LABEL_5;
    }
    objc_msgSend(WeakRetained, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hf_isHomeElectricitySupported");

    if ((v16 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "homeManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "hasOptedToHH2") & 1) != 0)
      {

      }
      else
      {
        v19 = objc_msgSend(MEMORY[0x1E0D319D0], "isUsingiCloud");

        if (v19)
        {
          v9 = (void *)MEMORY[0x1E0D519C0];
          v33 = *MEMORY[0x1E0D30D70];
          v34 = MEMORY[0x1E0C9AAB0];
          v10 = (void *)MEMORY[0x1E0C99D80];
          v11 = &v34;
          v12 = &v33;
          goto LABEL_13;
        }
      }
      objc_msgSend(WeakRetained, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hf_cachedHasEnergySite");

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0D519C0];
        v32[0] = MEMORY[0x1E0C9AAB0];
        v25 = *MEMORY[0x1E0D30D18];
        v31[0] = CFSTR("show-connect-utility-item");
        v31[1] = v25;
        _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilityTitle"), CFSTR("HUEnergySettingsConnectUtilityTitle"), 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v5;
        v31[2] = *MEMORY[0x1E0D30C08];
        _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilityDetail"), CFSTR("HUEnergySettingsConnectUtilityDetail"), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v26;
        v31[3] = *MEMORY[0x1E0D30C70];
        HUImageNamed(CFSTR("Onboarding-HomeUtilityLogo"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "futureWithResult:", v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      goto LABEL_2;
    }
    v9 = (void *)MEMORY[0x1E0D519C0];
    v35 = *MEMORY[0x1E0D30D70];
    v36 = MEMORY[0x1E0C9AAB0];
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v36;
    v12 = &v35;
LABEL_13:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithResult:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_2:
  v4 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2;
  v30[3] = &unk_1E6F4C660;
  v30[4] = WeakRetained;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_4;
  v29[3] = &unk_1E6F5D210;
  v29[4] = WeakRetained;
  objc_msgSend(v5, "flatMap:", v29);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v20 = (void *)v6;
LABEL_15:

  return v20;
}

void __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HUHomeEnergyManagerHelper *v4;
  void *v5;
  HUHomeEnergyManagerHelper *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = [HUHomeEnergyManagerHelper alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUHomeEnergyManagerHelper initWithHome:](v4, "initWithHome:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_3;
  v8[3] = &unk_1E6F520D0;
  v9 = v3;
  v7 = v3;
  -[HUHomeEnergyManagerHelper utilityDetailsWithCompletionHandler:](v6, "utilityDetailsWithCompletionHandler:", v8);

}

uint64_t __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_cachedHasEnergySite");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDetailsDict:", v3);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("utilitySubscriptionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0D519C0];
    if (v6)
    {
      v8 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_5;
      v21[3] = &unk_1E6F4C660;
      v9 = v3;
      v22 = v9;
      objc_msgSend(v7, "futureWithBlock:", v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_89;
      v19[3] = &unk_1E6F514A0;
      v20 = v9;
      objc_msgSend(v10, "flatMap:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v22;
    }
    else
    {
      v24[0] = MEMORY[0x1E0C9AAB0];
      v14 = *MEMORY[0x1E0D30D18];
      v23[0] = CFSTR("show-connect-utility-item");
      v23[1] = v14;
      _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilityTitle"), CFSTR("HUEnergySettingsConnectUtilityTitle"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v12;
      v23[2] = *MEMORY[0x1E0D30C08];
      _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilityDetail"), CFSTR("HUEnergySettingsConnectUtilityDetail"), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v15;
      v23[3] = *MEMORY[0x1E0D30C70];
      HUImageNamed(CFSTR("Onboarding-HomeUtilityLogo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "futureWithResult:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    v25 = *MEMORY[0x1E0D30D70];
    v26[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithResult:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("utilityArtworkURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_86;
    v14 = &unk_1E6F5D1E8;
    v15 = v3;
    v16 = v5;
    v7 = v5;
    objc_msgSend(v6, "dataTaskWithURL:completionHandler:", v7, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "resume", v11, v12, v13, v14);
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("utilityName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[HUEnergySettingsItemModule _buildItemProviders]_block_invoke_5";
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "(%s) missing artwork url for %@", buf, 0x16u);

    }
    objc_msgSend(v3, "finishWithNoResult");
  }

}

void __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 136315650;
    v19 = "-[HUEnergySettingsItemModule _buildItemProviders]_block_invoke";
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v9;
    v14 = "(%s) error occurred loading artwork url %@: %@";
    v15 = v10;
    v16 = 32;
LABEL_10:
    _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, v16);
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v11);

    goto LABEL_6;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v18 = 136315394;
    v19 = "-[HUEnergySettingsItemModule _buildItemProviders]_block_invoke";
    v20 = 2112;
    v21 = v13;
    v14 = "(%s) could not create image for %@";
    v15 = v10;
    v16 = 22;
    goto LABEL_10;
  }
LABEL_3:

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
LABEL_6:

}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("isDisconnected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityDetailsUtilityDisconnectedTitle"), CFSTR("HUUtilityDetailsUtilityDisconnectedTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30C08]);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("utilityAccountNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUEnergySettingsUtilityAccountNumber"), CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30C08]);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("utilityName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30D18]);

  objc_opt_class();
  v16 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v19 = v16;
  if (!v18)
  {
    HUImageNamed(CFSTR("Onboarding-HomeUtilityLogo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30C70]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2_104(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsShow_Title"), CFSTR("HUEnergySettingsShow_Title"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E0D30D70];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "hf_isGridForecastAvailable") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = *MEMORY[0x1E0D30CE8];
  v11[1] = v6;
  v11[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUEnergySettingsItemModule staticItemProvider](self, "staticItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUEnergySettingsItemModule utilityDetailsItem](self, "utilityDetailsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7 && _os_feature_enabled_impl())
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEnergySettingsUtilityDetailsIdentifier"));
    -[HUEnergySettingsItemModule utilityDetailsItem](self, "utilityDetailsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("show-connect-utility-item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    -[HUEnergySettingsItemModule utilityDetailsItem](self, "utilityDetailsItem");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      v31[0] = v13;
      -[HUEnergySettingsItemModule connectUtilityItem](self, "connectUtilityItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setItems:", v16);

      -[HUEnergySettingsItemModule connectUtilityItem](self, "connectUtilityItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "latestResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v20)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilitySignInFooter"), CFSTR("HUEnergySettingsConnectUtilitySignInFooter"), 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFooterTitle:", v21);

      }
      if (!-[HUEnergySettingsItemModule hasSentUtilityAnalytics](self, "hasSentUtilityAnalytics"))
      {
        +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingEntryPointInSettingsViewEvent](HUHomeEnergyAnalyticsHelper, "sendUtilityOnboardingEntryPointInSettingsViewEvent");
        -[HUEnergySettingsItemModule setHasSentUtilityAnalytics:](self, "setHasSentUtilityAnalytics:", 1);
      }
    }
    else
    {
      v30 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setItems:", v22);

    }
    objc_msgSend(v5, "addObject:", v8);

  }
  -[HUEnergySettingsItemModule gridForecastItem](self, "gridForecastItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "containsObject:", v23);

  if (v24)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEnergySettingsShowGridSectionIdentifier"));
    -[HUEnergySettingsItemModule gridForecastItem](self, "gridForecastItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setItems:", v27);

    objc_msgSend(v5, "addObject:", v25);
  }

  return v5;
}

- (void)subscriptionChanged:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0D314C0];
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HUEnergySettingsItemModule utilityDetailsItem](self, "utilityDetailsItem", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToUpdateItems:senderSelector:", v8, a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v11);

}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSDictionary)detailsDict
{
  return self->_detailsDict;
}

- (void)setDetailsDict:(id)a3
{
  objc_storeStrong((id *)&self->_detailsDict, a3);
}

- (HFItem)connectUtilityItem
{
  return self->_connectUtilityItem;
}

- (void)setConnectUtilityItem:(id)a3
{
  objc_storeStrong((id *)&self->_connectUtilityItem, a3);
}

- (HFItem)utilityDetailsItem
{
  return self->_utilityDetailsItem;
}

- (void)setUtilityDetailsItem:(id)a3
{
  objc_storeStrong((id *)&self->_utilityDetailsItem, a3);
}

- (HFItem)gridForecastItem
{
  return self->_gridForecastItem;
}

- (void)setGridForecastItem:(id)a3
{
  objc_storeStrong((id *)&self->_gridForecastItem, a3);
}

- (BOOL)hasSentUtilityAnalytics
{
  return self->_hasSentUtilityAnalytics;
}

- (void)setHasSentUtilityAnalytics:(BOOL)a3
{
  self->_hasSentUtilityAnalytics = a3;
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_gridForecastItem, 0);
  objc_storeStrong((id *)&self->_utilityDetailsItem, 0);
  objc_storeStrong((id *)&self->_connectUtilityItem, 0);
  objc_storeStrong((id *)&self->_detailsDict, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
