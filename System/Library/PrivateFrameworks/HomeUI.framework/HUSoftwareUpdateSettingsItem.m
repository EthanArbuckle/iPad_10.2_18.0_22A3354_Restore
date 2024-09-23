@implementation HUSoftwareUpdateSettingsItem

- (HUSoftwareUpdateSettingsItem)initWithHome:(id)a3
{
  id v5;
  HUSoftwareUpdateSettingsItem *v6;
  HUSoftwareUpdateSettingsItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSoftwareUpdateSettingsItem;
  v6 = -[HUSoftwareUpdateSettingsItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  __CFString *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = (void *)objc_opt_new();
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationSoftwareUpdateTitle"), CFSTR("HUEditLocationSoftwareUpdateTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  v6 = *MEMORY[0x1E0D30BB8];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E70419B0, *MEMORY[0x1E0D30BB8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.SoftwareUpdate"), *MEMORY[0x1E0D30BA0]);
  if (-[HUSoftwareUpdateSettingsItem _shouldShowSoftwareUpdateIcon](self, "_shouldShowSoftwareUpdateIcon"))
  {
    v7 = objc_alloc(MEMORY[0x1E0D31460]);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSystemImageNamed:configuration:", CFSTR("square.and.arrow.down.fill"), v8);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30C60]);

  }
  v10 = objc_alloc(MEMORY[0x1E0D31830]);
  -[HUSoftwareUpdateSettingsItem home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithAccessories:", v12);

  -[HUSoftwareUpdateSettingsItem home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate");

  -[HUSoftwareUpdateSettingsItem home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");

  v18 = (uint64_t *)MEMORY[0x1E0D30BF8];
  if (v15 && v17)
  {
    -[HUSoftwareUpdateSettingsItem home](self, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isAutomaticSoftwareUpdateEnabled") & 1) != 0)
    {
      -[HUSoftwareUpdateSettingsItem home](self, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

      if ((v21 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

    }
    -[HUSoftwareUpdateSettingsItem home](self, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isAutomaticSoftwareUpdateEnabled");

    if ((v23 & 1) != 0)
    {
      v24 = CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty");
    }
    else
    {
      -[HUSoftwareUpdateSettingsItem home](self, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

      if ((v26 & 1) == 0)
        goto LABEL_26;
      v24 = CFSTR("HUSoftwareUpdateAutomaticSetting_ThirdParty");
    }
    goto LABEL_24;
  }
  if (v15)
  {
    -[HUSoftwareUpdateSettingsItem home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isAutomaticSoftwareUpdateEnabled"))
    {

      goto LABEL_23;
    }
    if ((v17 & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }
  else if (!v17)
  {
    goto LABEL_26;
  }
  -[HUSoftwareUpdateSettingsItem home](self, "home");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

  if (!v15)
  {
    if (!v28)
      goto LABEL_26;
    goto LABEL_23;
  }

  if ((v28 & 1) != 0)
  {
LABEL_23:
    v24 = CFSTR("HUSoftwareUpdateAutomaticSetting_All");
LABEL_24:
    _HULocalizedStringWithDefaultValue(v24, v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, *v18);
    goto LABEL_25;
  }
LABEL_26:
  v29 = *v18;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    if (objc_msgSend(v13, "updatesReadyToInstall"))
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E70419C8, v6);
      v31 = objc_msgSend(v13, "updatesReadyToInstall");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D30BA8]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v29);
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateAutomaticSetting_Off"), CFSTR("HUSoftwareUpdateAutomaticSetting_Off"), 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, v29);

    }
  }
  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D30B78]);

  v38 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoftwareUpdateSettingsItem home](self, "home");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setWithObject:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D30B80]);

  v41 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D60]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30CF0]);
  if (!objc_msgSend(v13, "allUpdates"))
  {
    -[HUSoftwareUpdateSettingsItem home](self, "home");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "hf_shouldShowSoftwareUpdateSettings");

    if ((v43 & 1) == 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  v44 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "futureWithResult:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

+ (id)footerTitleForHome:(id)a3
{
  id v3;
  int v4;
  int v5;
  __CFString *v6;
  void *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v3 = a3;
  v4 = objc_msgSend(v3, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate");
  v5 = objc_msgSend(v3, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");
  if (v4 && v5)
  {
    if (objc_msgSend(v3, "isAutomaticSoftwareUpdateEnabled")
      && objc_msgSend(v3, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
    {
      v6 = CFSTR("HUSoftwareUpdateAutomaticSetting_All_Footer");
LABEL_21:
      _HULocalizedStringWithDefaultValue(v6, v6, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v3, "isAutomaticSoftwareUpdateEnabled"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty_On_Footer"), CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty_On_Footer"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_msgSend(v3, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty_Off_Footer"), CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty_Off_Footer"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = CFSTR("HUSoftwareUpdateAutomaticSetting_ThirdParty_On_Footer");
LABEL_17:
        _HULocalizedStringWithDefaultValue(v9, v9, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateAutomaticSettingFooterFormat"), CFSTR("%@%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
    }
    v9 = CFSTR("HUSoftwareUpdateAutomaticSetting_ThirdParty_Off_Footer");
    goto LABEL_17;
  }
  if (v4)
  {
    if (objc_msgSend(v3, "isAutomaticSoftwareUpdateEnabled"))
      v6 = CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty_On_Footer");
    else
      v6 = CFSTR("HUSoftwareUpdateAutomaticSetting_FirstParty_Off_Footer");
    goto LABEL_21;
  }
  if (v5)
  {
    if (objc_msgSend(v3, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
      v6 = CFSTR("HUSoftwareUpdateAutomaticSetting_ThirdParty_On_Footer");
    else
      v6 = CFSTR("HUSoftwareUpdateAutomaticSetting_ThirdParty_Off_Footer");
    goto LABEL_21;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateSettingsItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), CFSTR("hidden"), 1);

  -[HUSoftwareUpdateSettingsItem latestResults](self, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("title"));

  -[HUSoftwareUpdateSettingsItem latestResults](self, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v10, CFSTR("description"), 1);

  -[HUSoftwareUpdateSettingsItem latestResults](self, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v12, CFSTR("badgeCount"), 1);

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_shouldShowSoftwareUpdateIcon
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOptedToHH2") ^ 1;

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
