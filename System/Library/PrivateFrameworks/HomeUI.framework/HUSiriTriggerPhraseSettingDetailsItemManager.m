@implementation HUSiriTriggerPhraseSettingDetailsItemManager

- (HUSiriTriggerPhraseSettingDetailsItemManager)initWithSourceItem:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  HUSiriTriggerPhraseSettingDetailsItemManager *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v12.receiver = self;
  v12.super_class = (Class)HUSiriTriggerPhraseSettingDetailsItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v12, sel_initWithDelegate_sourceItem_, v6, v7);

  if (v8)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HUSiriTriggerPhraseSettingDetailsItemManager home](v8, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[HUSiriTriggerPhraseSettingDetailsItemManager initWithSourceItem:delegate:]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%s Current home = [%@]", buf, 0x16u);

    }
  }
  return v8;
}

- (id)updateSiriTriggerPhrase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUSiriTriggerPhraseSettingDetailsItemManager hsOrJSItem](self, "hsOrJSItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
    v7 = 3;
  else
    v7 = 1;

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[HUSiriTriggerPhraseSettingDetailsItemManager updateSiriTriggerPhrase:]";
    v19 = 2048;
    v20 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s Now Updating Siri Trigger Phrase Options to [%lu]", buf, 0x16u);
  }

  -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke;
  v14[3] = &unk_1E6F570B8;
  v14[4] = self;
  v16 = v7;
  v10 = v5;
  v15 = v10;
  objc_msgSend(v9, "updateSiriPhraseOptions:completion:", v7, v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

void __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[HUSiriTriggerPhraseSettingDetailsItemManager updateSiriTriggerPhrase:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri Trigger Phrase Options Update finished with error [%@]", buf, 0x16u);
  }

  if (v3)
  {
    v5 = MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke_2;
    v8[3] = &unk_1E6F600F8;
    v7 = *(_QWORD *)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 32);
    v8[5] = v7;
    objc_msgSend(v6, "dispatchHomeObserverMessage:sender:", v8, 0);

    v5 = MEMORY[0x1E0C9AAB0];
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v3);

}

void __72__HUSiriTriggerPhraseSettingDetailsItemManager_updateSiriTriggerPhrase___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home:didUpdateSiriTriggerPhraseOptions:", v5, *(_QWORD *)(a1 + 40));

}

- (id)home
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HUSiriTriggerPhraseSettingDetailsItemManager;
    -[HFItemManager home](&v10, sel_home);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  _QWORD v49[5];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[3];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[5];

  v70[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = (const char *)objc_msgSend(v4, "siriPhraseOptions");
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "siriPhraseOptions = [%lu]", buf, 0xCu);
  }

  v6 = objc_alloc(MEMORY[0x1E0D31840]);
  v7 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke;
  v59[3] = &unk_1E6F4C518;
  v8 = v4;
  v60 = v8;
  v9 = (void *)objc_msgSend(v6, "initWithResultsBlock:", v59);
  -[HUSiriTriggerPhraseSettingDetailsItemManager setHsOrJSItem:](self, "setHsOrJSItem:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  v57[3] = &unk_1E6F4C518;
  v45 = v8;
  v58 = v45;
  v11 = (void *)objc_msgSend(v10, "initWithResultsBlock:", v57);
  -[HUSiriTriggerPhraseSettingDetailsItemManager setHsItem:](self, "setHsItem:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D31848]);
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HUSiriTriggerPhraseSettingDetailsItemManager hsOrJSItem](self, "hsOrJSItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v14;
  -[HUSiriTriggerPhraseSettingDetailsItemManager hsItem](self, "hsItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v12, "initWithItems:", v17);
  -[HUSiriTriggerPhraseSettingDetailsItemManager setSiriTriggerPhraseSelectionItemProvider:](self, "setSiriTriggerPhraseSelectionItemProvider:", v18);

  v19 = (void *)objc_opt_new();
  -[HUSiriTriggerPhraseSettingDetailsItemManager setUnsupportedMediaAccessories:](self, "setUnsupportedMediaAccessories:", v19);

  v20 = (void *)objc_opt_new();
  -[HUSiriTriggerPhraseSettingDetailsItemManager setUnsupportedLanguageCodes:](self, "setUnsupportedLanguageCodes:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31510]), "initWithHome:", v45);
  v56[0] = v7;
  v56[1] = 3221225472;
  v56[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
  v56[3] = &unk_1E6F4D8E8;
  v56[4] = self;
  objc_msgSend(v21, "setFilter:", v56);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 1;
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  v25 = objc_alloc(MEMORY[0x1E0D31928]);
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_278;
  v49[3] = &unk_1E6F60148;
  v49[4] = self;
  v26 = v24;
  v50 = v26;
  v51 = &v52;
  v27 = (void *)objc_msgSend(v25, "initWithSourceProvider:transformationBlock:", v21, v49);
  -[HUSiriTriggerPhraseSettingDetailsItemManager setSiriDeviceItemProvider:](self, "setSiriDeviceItemProvider:", v27);

  v28 = objc_alloc(MEMORY[0x1E0D310B0]);
  -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithHome:", v29);

  objc_msgSend(v30, "setFilter:", &__block_literal_global_291);
  v53[3] = 1;
  v31 = objc_alloc(MEMORY[0x1E0D31928]);
  v46[0] = v7;
  v46[1] = 3221225472;
  v46[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_307;
  v46[3] = &unk_1E6F601B8;
  v32 = v26;
  v47 = v32;
  v48 = &v52;
  v33 = (void *)objc_msgSend(v31, "initWithSourceProvider:transformationBlock:", v30, v46);
  -[HUSiriTriggerPhraseSettingDetailsItemManager setSiriOtherDeviceItemProvider:](self, "setSiriOtherDeviceItemProvider:", v33);

  HFLogForCategory();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriTriggerPhraseSettingDetailsItemManager siriDeviceItemProvider](self, "siriDeviceItemProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "items");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriTriggerPhraseSettingDetailsItemManager siriOtherDeviceItemProvider](self, "siriOtherDeviceItemProvider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "items");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v63 = "-[HUSiriTriggerPhraseSettingDetailsItemManager _buildItemProvidersForHome:]";
    v64 = 2112;
    v65 = v35;
    v66 = 2112;
    v67 = v37;
    v68 = 2112;
    v69 = v39;
    _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%s unsupportedMediaAccessories = %@ -  siriDeviceItems = %@, sidekick items = %@", buf, 0x2Au);

  }
  -[HUSiriTriggerPhraseSettingDetailsItemManager siriTriggerPhraseSelectionItemProvider](self, "siriTriggerPhraseSelectionItemProvider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v40;
  -[HUSiriTriggerPhraseSettingDetailsItemManager siriDeviceItemProvider](self, "siriDeviceItemProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v41;
  -[HUSiriTriggerPhraseSettingDetailsItemManager siriOtherDeviceItemProvider](self, "siriOtherDeviceItemProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v52, 8);
  return v43;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUJustSiriOrHeySiri_Setting_Title"), CFSTR("HUJustSiriOrHeySiri_Setting_Title"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("1"), *MEMORY[0x1E0D30DA8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "siriPhraseOptions") == 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30DA0]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUHeySiri_Setting_Title"), CFSTR("HUHeySiri_Setting_Title"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("2"), *MEMORY[0x1E0D30DA8]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(*(id *)(a1 + 32), "siriPhraseOptions") != 1)
    v3 = objc_msgSend(*(id *)(a1 + 32), "siriPhraseOptions") == 0;
  objc_msgSend(v5, "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30DA0]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = &unk_1EF347468;
  if (objc_msgSend(v3, "conformsToProtocol:", v4))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "accessories");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_4;
    v33[3] = &unk_1E6F4E5D8;
    v33[4] = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_all:", v33);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_28;
    }
    v7 = v3;
    objc_msgSend(v7, "mediaProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30648]);
    v11 = objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "hf_siriEndpointProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = (uint64_t)v7;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "accessory = [%@] hf_siriEndpointProfile [%@]", buf, 0x16u);

    }
    if (!objc_msgSend(v7, "supportsJustSiri"))
    {
      if (v11)
      {
        objc_msgSend((id)v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "unsupportedMediaAccessories");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v7);

        }
      }
    }
    objc_msgSend(v7, "hf_siriEndpointProfile");
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "mediaProfile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hf_mediaAccessoryCommonSettingsManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "settingForKeyPath:", *MEMORY[0x1E0D301B8]);
      v17 = objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "supportsJustSiri") & 1) == 0)
      {
        if (v17)
        {
          objc_msgSend((id)v17, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "BOOLValue");

          if (v21)
          {
            objc_msgSend(*(id *)(a1 + 32), "unsupportedMediaAccessories");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v7);

          }
        }
      }
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v17;
        v36 = 2112;
        v37 = v7;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "allowHSImmutableSetting = [%@] for accessory [%@]", buf, 0x16u);
      }

    }
    if (objc_msgSend(v7, "supportsJustSiri"))
    {
      objc_msgSend(v7, "mediaProfile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D31530], "siriLanguageOptionFor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "recognitionLanguage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
        v32 = v24;
        v27 = v11;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isCompactVoiceTriggerAvailableForLanguageCode:", v26);

        v11 = v27;
        v24 = v32;
        if ((v29 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "unsupportedLanguageCodes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v26);

        }
      }

    }
    v8 = (v11 | v17) != 0;

  }
LABEL_28:

  return v8;
}

BOOL __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  _BOOL8 v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30648]);
  v6 = objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "hf_siriEndpointProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = (uint64_t)v3;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "accessory = [%@] hf_siriEndpointProfile [%@]", (uint8_t *)&v26, 0x16u);

  }
  if (objc_msgSend(v3, "hf_isMediaAccessory"))
  {
    if ((objc_msgSend(v3, "supportsJustSiri") & 1) == 0)
    {
      if (v6)
      {
        objc_msgSend((id)v6, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "unsupportedMediaAccessories");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v3);

        }
      }
    }
  }
  objc_msgSend(v3, "hf_siriEndpointProfile");
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "mediaProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_mediaAccessoryCommonSettingsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settingForKeyPath:", *MEMORY[0x1E0D301B8]);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "mediaProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_mediaAccessoryCommonSettingsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:", *(_QWORD *)(a1 + 32));

    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412546;
      v27 = v12;
      v28 = 2112;
      v29 = v3;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "allowHSImmutableSetting = [%@] for accessory [%@]", (uint8_t *)&v26, 0x16u);
    }

  }
  if (objc_msgSend(v3, "supportsJustSiri"))
  {
    objc_msgSend(v3, "mediaProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31530], "siriLanguageOptionFor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recognitionLanguage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isCompactVoiceTriggerAvailableForLanguageCode:", v20);

      if ((v22 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "unsupportedLanguageCodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v20);

      }
    }

  }
  if (objc_msgSend(v3, "hf_isMediaAccessory"))
    v24 = (v6 | v12) != 0;
  else
    v24 = 0;

  return v24;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_278(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_280;
  v12[3] = &unk_1E6F60120;
  v5 = a1[4];
  v6 = (void *)a1[5];
  v13 = v3;
  v14 = v5;
  v7 = v6;
  v8 = a1[6];
  v15 = v7;
  v16 = v8;
  v9 = v3;
  v10 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v9, v12);

  return v10;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_280(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = *(void **)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  v9 = v7;
  if (objc_msgSend(v9, "conformsToProtocol:", v8))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &stru_1E6F60E80, *MEMORY[0x1E0D30BF8]);
  v16 = *(void **)(a1 + 48);
  v17 = 0x1E0CB3000;
  if (!v14)
  {
    if (!v16)
      goto LABEL_22;
    goto LABEL_18;
  }
  if (v16)
  {
LABEL_18:
    objc_msgSend(v16, "accessoryIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProfileContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hf_backingAccessory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v26, "isEqual:", v29);

    if (v30)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSelectedSiriEndpointDescriptionText"), CFSTR("HUSelectedSiriEndpointDescriptionText"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v15);

      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7041E18, *MEMORY[0x1E0D30DA8]);
      v17 = 0x1E0CB3000;
      goto LABEL_22;
    }
    v17 = 0x1E0CB3000uLL;
LABEL_21:
    objc_msgSend(*(id *)(v17 + 2024), "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D30DA8]);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    goto LABEL_22;
  }
  objc_msgSend(v14, "homeKitSettingsVendor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF347468))
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_msgSend(v20, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "mediaProfileContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "isEqual:", v23);

  if (!v24)
    goto LABEL_21;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSelectedHomePodDescriptionText"), CFSTR("HUSelectedHomePodDescriptionText"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, v15);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7041E18, *MEMORY[0x1E0D30DA8]);
LABEL_22:
  v33 = *(void **)(v17 + 2024);
  objc_msgSend(v11, "isSiriDisabled");
  objc_msgSend(v33, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D30E20]);

  return v6;
}

uint64_t __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_306(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5 && (objc_msgSend(v5, "hf_siriEndpointProfile"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "hf_primaryService");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "mediaProfile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hf_mediaAccessoryCommonSettingsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "settingForKeyPath:", *MEMORY[0x1E0D301B8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_siriEndpointProfile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v5;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "accessory = [%@] hf_siriEndpointProfile [%@]", (uint8_t *)&v15, 0x16u);

      }
      v8 = v11 != 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_307(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_308;
  v10[3] = &unk_1E6F60190;
  v11 = v3;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v7 = v3;
  v8 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v7, v10);

  return v8;
}

id __75__HUSiriTriggerPhraseSettingDetailsItemManager__buildItemProvidersForHome___block_invoke_2_308(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = *(id *)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    objc_msgSend(v11, "accessoryIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSelectedSiriEndpointDescriptionText"), CFSTR("HUSelectedSiriEndpointDescriptionText"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30BF8]);

      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7041E18, *MEMORY[0x1E0D30DA8]);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30DA8]);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
  }
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "isSiriDisabled");
  objc_msgSend(v18, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30E20]);

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  HUSiriTriggerPhraseSettingDetailsItemManager *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  __CFString *v51;
  __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  BOOL v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  unint64_t v145;
  __CFString *v146;
  __CFString *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  void *v155;
  HUSiriTriggerPhraseSettingDetailsItemManager *v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  id obj;
  _QWORD v164[4];
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint8_t v170[128];
  uint8_t buf[4];
  const char *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  int v176;
  __int16 v177;
  int v178;
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_atleastOneMediaAccessorySupportingJustSiri");
    -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v172 = "-[HUSiriTriggerPhraseSettingDetailsItemManager _buildSectionsWithDisplayedItems:]";
    v173 = 2112;
    v174 = v7;
    v175 = 1024;
    v176 = v9;
    v177 = 1024;
    v178 = objc_msgSend(v10, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%s home [%@] atleastOneMediaAccessorySupportingJustSiri = %{BOOL}d, atLeastOneMediaAccessoryWithSupportingJustSiriLanguage = %{BOOL}d", buf, 0x22u);

  }
  -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSiriTriggerPhraseSettingItemSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriTriggerPhraseSelectionSection_Header"), CFSTR("HUSiriTriggerPhraseSelectionSection_Header"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHeaderTitle:", v14);

    -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "siriPhraseOptions");

    -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedSiriTriggerPhrase(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer"), CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    v161 = v25;
    if (v27 && v16 == 3)
    {
      v28 = v4;
      -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = self;
      -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "mediaProfile");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "hf_serviceNameComponents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "composedString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
        {
          v39 = v37;

          v31 = v39;
        }

      }
      -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](v32, "unsupportedMediaAccessories");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v40, "count") >= 2)
      {
        -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](v32, "unsupportedMediaAccessories");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "count");
        HULocalizedStringWithFormat(CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_SeveralAccessories"), CFSTR("%@%lu"), v42, v43, v44, v45, v46, v47, (uint64_t)v31);
        v48 = objc_claimAutoreleasedReturnValue();

        v31 = (void *)v48;
      }
      v4 = v28;

      -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](v32, "unsupportedMediaAccessories");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");
      v51 = CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessory");
      if (v50 > 1)
        v51 = CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessories");
      v52 = v51;

      HULocalizedStringWithFormat(v52, CFSTR("%@"), v53, v54, v55, v56, v57, v58, (uint64_t)v31);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v161, "stringByAppendingFormat:", CFSTR("\n• %@"), v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFooterTitle:", v60);

      v25 = v161;
      self = v32;
    }
    else
    {
      objc_msgSend(v13, "setFooterTitle:", v25);
    }
    -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedLanguageCodes](self, "unsupportedLanguageCodes");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");

    if (v62 && v16 == 3)
    {
      v158 = v13;
      v159 = v4;
      v63 = (void *)objc_opt_new();
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v157 = self;
      -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedLanguageCodes](self, "unsupportedLanguageCodes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v170, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v167;
        do
        {
          for (i = 0; i != v65; ++i)
          {
            if (*(_QWORD *)v167 != v66)
              objc_enumerationMutation(obj);
            v68 = *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "localizedNameForSiriLanguage:inDisplayLanguage:", v68, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "localizedTriggerPhraseForLanguageCode:", v68);
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            HULocalizedStringWithFormat(CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedSiriLanguage"), CFSTR(" %@%@"), v73, v74, v75, v76, v77, v78, (uint64_t)v70);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n• %@"), v79, v72);
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v63, "appendString:", v80);
          }
          v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v170, 16);
        }
        while (v65);
      }

      v13 = v158;
      objc_msgSend(v158, "footerTitle");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "length"))
      {
        objc_msgSend(v81, "stringByAppendingFormat:", CFSTR("%@"), v63);
        v82 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v158, "setFooterTitle:", v82);
        v81 = (void *)v82;
      }
      v25 = v161;
      v4 = v159;
      self = v157;

    }
    -[HUSiriTriggerPhraseSettingDetailsItemManager siriTriggerPhraseSelectionItemProvider](self, "siriTriggerPhraseSelectionItemProvider");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "items");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "allObjects");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "sortedArrayUsingComparator:", &__block_literal_global_338);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v164[3] = &unk_1E6F4DAD8;
    v165 = v4;
    objc_msgSend(v86, "na_filter:", v164);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v87);

    objc_msgSend(v5, "addObject:", v13);
  }
  v88 = (void *)objc_opt_new();
  -[HUSiriTriggerPhraseSettingDetailsItemManager siriDeviceItemProvider](self, "siriDeviceItemProvider");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "items");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "allObjects");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "sortedArrayUsingComparator:", &__block_literal_global_342);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v94 = v93;
  else
    v94 = 0;

  if (v94)
  {
    objc_msgSend(v92, "sortedArrayUsingComparator:", &__block_literal_global_341);
    v95 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v92, "count") < 3)
      goto LABEL_37;
    objc_msgSend(v92, "firstObject");
    v96 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "subarrayWithRange:", 1, objc_msgSend(v92, "count") - 1);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)objc_opt_new();
    objc_msgSend(v98, "addObject:", v96);
    objc_msgSend(v97, "sortedArrayUsingComparator:", &__block_literal_global_341);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addObjectsFromArray:", v99);

    v95 = objc_msgSend(v98, "copy");
    v92 = (void *)v96;
  }

  v92 = (void *)v95;
LABEL_37:
  -[HUSiriTriggerPhraseSettingDetailsItemManager siriOtherDeviceItemProvider](self, "siriOtherDeviceItemProvider");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "items");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "allObjects");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "sortedArrayUsingComparator:", &__block_literal_global_343);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    objc_msgSend(v103, "sortedArrayUsingComparator:", &__block_literal_global_341);
    v104 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v103, "count") < 3)
      goto LABEL_42;
    objc_msgSend(v103, "firstObject");
    v105 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "subarrayWithRange:", 1, objc_msgSend(v103, "count") - 1);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_opt_new();
    objc_msgSend(v107, "addObject:", v105);
    objc_msgSend(v106, "sortedArrayUsingComparator:", &__block_literal_global_341);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "addObjectsFromArray:", v108);

    v104 = objc_msgSend(v107, "copy");
    v103 = (void *)v105;
  }

  v103 = (void *)v104;
LABEL_42:
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v110 = v109;
  else
    v110 = 0;
  v111 = v110;

  objc_opt_class();
  objc_msgSend(v111, "sourceItem");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v113 = v112;
  else
    v113 = 0;

  if (v111)
    v114 = v113 == 0;
  else
    v114 = 0;
  if (v114)
    v115 = v103;
  else
    v115 = v92;
  if (v114)
    v116 = v92;
  else
    v116 = v103;
  objc_msgSend(v88, "na_safeAddObjectsFromArray:", v115);
  objc_msgSend(v88, "na_safeAddObjectsFromArray:", v116);
  if (objc_msgSend(v88, "count"))
  {
    v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSiriDevicesItemSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriDevicesSection_Header"), CFSTR("HUSiriDevicesSection_Header"), 1);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setHeaderTitle:", v118);

    -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v119, "hf_atleastOneMediaAccessorySupportingJustSiri");

    if ((v120 & 1) == 0)
    {
      v162 = v5;
      -[HUSiriTriggerPhraseSettingDetailsItemManager home](self, "home");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedSiriTriggerPhrase(v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUJustSiriListenOn_Setting_Section_Footer"), CFSTR("%@"), v123, v124, v125, v126, v127, v128, (uint64_t)v122);
      v129 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "count");

      if (v131)
      {
        v160 = v4;
        -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "firstObject");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "name");
        v134 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v135, "count") >= 2)
        {
          -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "count");
          HULocalizedStringWithFormat(CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_SeveralAccessories"), CFSTR("%@%lu"), v137, v138, v139, v140, v141, v142, (uint64_t)v134);
          v143 = objc_claimAutoreleasedReturnValue();

          v134 = (void *)v143;
        }

        -[HUSiriTriggerPhraseSettingDetailsItemManager unsupportedMediaAccessories](self, "unsupportedMediaAccessories");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = objc_msgSend(v144, "count");
        v146 = CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessory");
        if (v145 > 1)
          v146 = CFSTR("HUJustSiriOrHeySiri_Setting_Section_Footer_UnsupportedAccessories");
        v147 = v146;

        HULocalizedStringWithFormat(v147, CFSTR("%@"), v148, v149, v150, v151, v152, v153, (uint64_t)v134);
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v129, "stringByAppendingFormat:", CFSTR(" %@"), v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setFooterTitle:", v155);

        v4 = v160;
      }
      else
      {
        objc_msgSend(v117, "setFooterTitle:", v129);
      }

      v5 = v162;
    }
    objc_msgSend(v117, "setItems:", v88);
    objc_msgSend(v5, "addObject:", v117);

  }
  return v5;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);

  return v10;
}

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
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

uint64_t __81__HUSiriTriggerPhraseSettingDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
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

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v12, 0x16u);
  }

  v11 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
}

- (HFStaticItemProvider)siriTriggerPhraseSelectionItemProvider
{
  return self->_siriTriggerPhraseSelectionItemProvider;
}

- (void)setSiriTriggerPhraseSelectionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriTriggerPhraseSelectionItemProvider, a3);
}

- (HFStaticItem)hsOrJSItem
{
  return self->_hsOrJSItem;
}

- (void)setHsOrJSItem:(id)a3
{
  objc_storeStrong((id *)&self->_hsOrJSItem, a3);
}

- (HFStaticItem)hsItem
{
  return self->_hsItem;
}

- (void)setHsItem:(id)a3
{
  objc_storeStrong((id *)&self->_hsItem, a3);
}

- (HFTransformItemProvider)siriDeviceItemProvider
{
  return self->_siriDeviceItemProvider;
}

- (void)setSiriDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriDeviceItemProvider, a3);
}

- (HFTransformItemProvider)siriOtherDeviceItemProvider
{
  return self->_siriOtherDeviceItemProvider;
}

- (void)setSiriOtherDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriOtherDeviceItemProvider, a3);
}

- (NSMutableOrderedSet)unsupportedMediaAccessories
{
  return self->_unsupportedMediaAccessories;
}

- (void)setUnsupportedMediaAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedMediaAccessories, a3);
}

- (NSMutableSet)unsupportedLanguageCodes
{
  return self->_unsupportedLanguageCodes;
}

- (void)setUnsupportedLanguageCodes:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedLanguageCodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedLanguageCodes, 0);
  objc_storeStrong((id *)&self->_unsupportedMediaAccessories, 0);
  objc_storeStrong((id *)&self->_siriOtherDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_siriDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_hsItem, 0);
  objc_storeStrong((id *)&self->_hsOrJSItem, 0);
  objc_storeStrong((id *)&self->_siriTriggerPhraseSelectionItemProvider, 0);
}

@end
