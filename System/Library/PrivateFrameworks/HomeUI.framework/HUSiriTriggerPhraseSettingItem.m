@implementation HUSiriTriggerPhraseSettingItem

- (HUSiriTriggerPhraseSettingItem)initWithHome:(id)a3
{
  id v5;
  HUSiriTriggerPhraseSettingItem *v6;
  HUSiriTriggerPhraseSettingItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSiriTriggerPhraseSettingItem;
  v6 = -[HUSiriTriggerPhraseSettingItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x1E0C99E20];
  -[HUSiriTriggerPhraseSettingItem home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_allHomePodsOrStereoPairs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSiriTriggerPhraseSettingItem home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_siriEndPointAccessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  -[HUSiriTriggerPhraseSettingItem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "siriPhraseOptions") == 3)
  {
    -[HUSiriTriggerPhraseSettingItem home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v14, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

    if ((_DWORD)v3)
      v15 = CFSTR("HUJustSiriOrHeySiri_Home_Level_Setting_Title");
    else
      v15 = CFSTR("HUHeySiri_Home_Level_Setting_Title");
  }
  else
  {

    v15 = CFSTR("HUHeySiri_Home_Level_Setting_Title");
  }
  v16 = 1;
  _HULocalizedStringWithDefaultValue(v15, v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("HUJustSiriOrHeySiri_Home_Level_Setting_Title"), *MEMORY[0x1E0D30D20]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.SiriPhraseSetting"), *MEMORY[0x1E0D30BA0]);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = _os_feature_enabled_impl();
  if (v19)
  {
    -[HUSiriTriggerPhraseSettingItem home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hf_atleastOneMediaAccessorySupportingJustSiri"))
    {
      -[HUSiriTriggerPhraseSettingItem home](self, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v4, "hf_hasAtLeastOneHomePodWithSettings") ^ 1;
      v20 = 1;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v18, "numberWithInt:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30D70]);

  if (v20)
  if (v19)

  -[HUSiriTriggerPhraseSettingItem home](self, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "hf_atleastOneMediaAccessoryHasSiriEnabled"))
    v23 = CFSTR("HUSiriSetting_On");
  else
    v23 = CFSTR("HUSiriSetting_Off");
  _HULocalizedStringWithDefaultValue(v23, v23, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30B80]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30CF0]);
  v25 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "futureWithResult:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
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

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriTriggerPhraseSettingItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), CFSTR("hidden"), 1);

  -[HUSiriTriggerPhraseSettingItem latestResults](self, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("title"));

  -[HUSiriTriggerPhraseSettingItem latestResults](self, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v10, CFSTR("description"), 1);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
