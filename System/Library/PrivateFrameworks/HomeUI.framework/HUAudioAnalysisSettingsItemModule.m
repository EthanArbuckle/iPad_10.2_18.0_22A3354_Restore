@implementation HUAudioAnalysisSettingsItemModule

- (HUAudioAnalysisSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUAudioAnalysisSettingsItemModule *v9;
  HUAudioAnalysisSettingsItemModule *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAudioAnalysisSettingsItemModule.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HUAudioAnalysisSettingsItemModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    -[HUAudioAnalysisSettingsItemModule _buildItemProviders](v10, "_buildItemProviders");
  }

  return v10;
}

- (HUAudioAnalysisSettingsItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAudioAnalysisSettingsItemModule.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAudioAnalysisSettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HUHomeAudioAnalysisDetectionSettingsItemProvider *v7;
  void *v8;
  HUHomeAudioAnalysisDetectionSettingsItemProvider *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v3 = objc_alloc(MEMORY[0x1E0D31510]);
  -[HUAudioAnalysisSettingsItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);
  -[HUAudioAnalysisSettingsItemModule setMediaAccessoryItemProvider:](self, "setMediaAccessoryItemProvider:", v5);

  -[HUAudioAnalysisSettingsItemModule mediaAccessoryItemProvider](self, "mediaAccessoryItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilter:", &__block_literal_global_171);

  v7 = [HUHomeAudioAnalysisDetectionSettingsItemProvider alloc];
  -[HUAudioAnalysisSettingsItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUHomeAudioAnalysisDetectionSettingsItemProvider initWithHome:](v7, "initWithHome:", v8);
  -[HUAudioAnalysisSettingsItemModule setSoundsItemProvider:](self, "setSoundsItemProvider:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D31928]);
  -[HUAudioAnalysisSettingsItemModule mediaAccessoryItemProvider](self, "mediaAccessoryItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_3;
  v16[3] = &unk_1E6F58CB0;
  v16[4] = self;
  v12 = (void *)objc_msgSend(v10, "initWithSourceProvider:transformationBlock:", v11, v16);
  -[HUAudioAnalysisSettingsItemModule setAudioAnalysisDeviceItemProvider:](self, "setAudioAnalysisDeviceItemProvider:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D310B0]);
  -[HUAudioAnalysisSettingsItemModule home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithHome:", v14);

  objc_msgSend(v15, "setFilter:", &__block_literal_global_283);
}

uint64_t __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF347468))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_259);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v2, "supportsAudioAnalysis");
    else
      v7 = 0;
  }

  return v7;
}

uint64_t __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAudioAnalysis");
}

id __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_4;
  v9[3] = &unk_1E6F554C8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v6, v9);

  return v7;
}

id __56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
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

  if (objc_msgSend(v10, "isSiriEndpointAccessory"))
  {
    objc_msgSend(v10, "commonSettingsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "commonSettingsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:", *(_QWORD *)(a1 + 40));

    }
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "isAudioAnalysisEnabled");
  objc_msgSend(v13, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30E20]);

  return v6;
}

void *__56__HUAudioAnalysisSettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "hf_primaryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = (void *)objc_msgSend(v5, "supportsAudioAnalysis");
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUAudioAnalysisSettingsItemModule soundsItemProvider](self, "soundsItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAudioAnalysisSettingsItemModule audioAnalysisDeviceItemProvider](self, "audioAnalysisDeviceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAudioAnalysisSettingsItemModule accessoryItemProvider](self, "accessoryItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  _QWORD v26[4];
  id v27;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAudioAnalysisSettingsAudioAnalysisSoundsItemSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUListenSettingsSoundsSection_Header"), CFSTR("HUListenSettingsSoundsSection_Header"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v7);

  v8 = (void *)objc_opt_new();
  -[HUAudioAnalysisSettingsItemModule soundsItemProvider](self, "soundsItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v11);

  objc_msgSend(v6, "setItems:", v8);
  objc_msgSend(v5, "addObject:", v6);
  -[HUAudioAnalysisSettingsItemModule home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "audioAnalysisClassifierOptions");

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAudioAnalysisSettingsAudioAnalysisDeviceItemSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUListenSettingsHomePodSection_Header"), CFSTR("HUListenSettingsHomePodSection_Header"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHeaderTitle:", v15);

    _HULocalizedStringWithDefaultValue(CFSTR("HUListenSettingsHomePodSection_Footer"), CFSTR("HUListenSettingsHomePodSection_Footer"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFooterTitle:", v16);

    v17 = (void *)objc_opt_new();
    -[HUAudioAnalysisSettingsItemModule audioAnalysisDeviceItemProvider](self, "audioAnalysisDeviceItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_safeAddObjectsFromArray:", v20);

    v21 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend((id)objc_opt_class(), "_audioAnalysisDeviceItemComparator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingComparator:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69__HUAudioAnalysisSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v26[3] = &unk_1E6F4DAD8;
    v27 = v4;
    objc_msgSend(v23, "na_filter:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setItems:", v24);

    objc_msgSend(v5, "addObject:", v14);
  }

  return v5;
}

uint64_t __69__HUAudioAnalysisSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)enableAudioAnalysisSetting:(BOOL)a3 forItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  objc_msgSend(a4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &unk_1EF2AC1D8;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke;
    v12[3] = &unk_1E6F51990;
    v13 = v8;
    v14 = a3;
    objc_msgSend(v9, "futureWithBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setEnableAudioAnalysis:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6F4C610;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

}

void __72__HUAudioAnalysisSettingsItemModule_enableAudioAnalysisSetting_forItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Failed to update enable audio analysis setting : %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v5, v6);

}

+ (id)_audioAnalysisDeviceItemComparator
{
  return &__block_literal_global_302_0;
}

uint64_t __71__HUAudioAnalysisSettingsItemModule__audioAnalysisDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0D314B0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "defaultItemComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id, id))v7)[2](v7, v6, v5);

  return v8;
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v16, 0x16u);
  }

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D314C0];
  -[HUAudioAnalysisSettingsItemModule itemProviders](self, "itemProviders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestToReloadItemProviders:senderSelector:", v13, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v11, "performItemUpdateRequest:", v14);

}

- (id)updateAudioAnalysisDetectionSettings:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];

  v4 = a3;
  v7 = a4;
  -[HUAudioAnalysisSettingsItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "audioAnalysisClassifierOptions");

  v10 = objc_msgSend(v7, "audioDetectionType");
  v11 = v10 | v9;
  if (!v4)
    v11 = v9 & ~v10;
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke;
  v17[3] = &unk_1E6F53720;
  v17[4] = self;
  v17[5] = v11;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_306;
  v16[3] = &unk_1E6F4F960;
  v16[4] = self;
  v16[5] = a2;
  objc_msgSend(v13, "addCompletionBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_2;
  v8[3] = &unk_1E6F4D1B0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v7 = v3;
  objc_msgSend(v4, "updateAudioAnalysisClassifierOptions:completion:", v6, v8);

}

void __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error setting audio analysis classifier setting: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated audio analysis classifier settings", (uint8_t *)&v10, 2u);
    }

    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "audioAnalysisClassifierOptions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:error:", v9, 0);

  }
}

void __82__HUAudioAnalysisSettingsItemModule_updateAudioAnalysisDetectionSettings_forItem___block_invoke_306(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v4);

}

- (HFItemProvider)audioAnalysisDeviceItemProvider
{
  return self->_audioAnalysisDeviceItemProvider;
}

- (void)setAudioAnalysisDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioAnalysisDeviceItemProvider, a3);
}

- (HFMediaAccessoryItemProvider)mediaAccessoryItemProvider
{
  return self->_mediaAccessoryItemProvider;
}

- (void)setMediaAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccessoryItemProvider, a3);
}

- (HFItemProvider)soundsItemProvider
{
  return self->_soundsItemProvider;
}

- (void)setSoundsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_soundsItemProvider, a3);
}

- (HFAccessoryItemProvider)accessoryItemProvider
{
  return self->_accessoryItemProvider;
}

- (void)setAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItemProvider, a3);
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
  objc_storeStrong((id *)&self->_accessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_soundsItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_audioAnalysisDeviceItemProvider, 0);
}

@end
