@implementation HUAudioAnalysisDetectionSettingsModule

- (HUAudioAnalysisDetectionSettingsModule)initWithItemUpdater:(id)a3 accessory:(id)a4
{
  id v7;
  HUAudioAnalysisDetectionSettingsModule *v8;
  HUAudioAnalysisDetectionSettingsModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAudioAnalysisDetectionSettingsModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_accessory, a4);

  return v9;
}

- (HUAudioAnalysisDetectionSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_accessory_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAudioAnalysisDetectionSettingsModule.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAudioAnalysisDetectionSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  HUAudioAnalysisDetectionSettingsItemProvider *v4;
  void *v5;
  HFItemProvider *v6;
  HFItemProvider *audioDetectionSettingsItemProvider;
  NSSet *v8;
  NSSet *v9;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = [HUAudioAnalysisDetectionSettingsItemProvider alloc];
    -[HUAudioAnalysisDetectionSettingsModule accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUAudioAnalysisDetectionSettingsItemProvider initWithAccessory:](v4, "initWithAccessory:", v5);
    audioDetectionSettingsItemProvider = self->_audioDetectionSettingsItemProvider;
    self->_audioDetectionSettingsItemProvider = v6;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_audioDetectionSettingsItemProvider, 0);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_itemProviders;
    self->_itemProviders = v8;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  -[HUAudioAnalysisDetectionSettingsModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
  v24[3] = &unk_1E6F57F28;
  v25 = v4;
  v7 = v4;
  objc_msgSend(v5, "na_flatMap:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  -[HUAudioAnalysisDetectionSettingsModule audioDetectionSettingsItemProvider](self, "audioDetectionSettingsItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAudioAnalysisDetectionSettingsSoundDetectionSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUAudioAnalysisEventSettings_Title"), CFSTR("HUAudioAnalysisEventSettings_Title"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHeaderTitle:", v12);

  v19 = v6;
  v20 = 3221225472;
  v21 = __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v22 = &unk_1E6F4DAD8;
  v23 = v10;
  v13 = v10;
  objc_msgSend(v8, "na_filter:", &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects", v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "itemResultManualSortComparator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItems:", v17);

  objc_msgSend(v9, "addObject:", v11);
  return v9;
}

id __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __74__HUAudioAnalysisDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFItemProvider)audioDetectionSettingsItemProvider
{
  return self->_audioDetectionSettingsItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDetectionSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
