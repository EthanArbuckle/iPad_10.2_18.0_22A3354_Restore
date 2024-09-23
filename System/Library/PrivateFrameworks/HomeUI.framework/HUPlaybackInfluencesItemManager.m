@implementation HUPlaybackInfluencesItemManager

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_groupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPlaybackInfluencesItemManager.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPlaybackInfluencesItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_groupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPlaybackInfluencesItemManager.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPlaybackInfluencesItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 settingItem:(id)a4
{
  id v6;
  void *v7;
  HUPlaybackInfluencesItemManager *v8;
  objc_super v10;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v10.receiver = self;
  v10.super_class = (Class)HUPlaybackInfluencesItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v10, sel_initWithDelegate_sourceItem_, v6, v7);

  return v8;
}

- (HUPlaybackInfluencesItemManager)initWithDelegate:(id)a3 module:(id)a4 homeKitAccessorySettingItem:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HUPlaybackInfluencesItemManager *v12;
  objc_super v14;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a5, "copy");
  v14.receiver = self;
  v14.super_class = (Class)HUPlaybackInfluencesItemManager;
  v12 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v10, v11);

  if (v12)
    objc_storeStrong((id *)&v12->_accessorySettingsModule, a4);

  return v12;
}

- (id)playbackInfluencesSetting
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HUPlaybackInfluencesItemManager settingItem](self, "settingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30730]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)playbackInfluencesFollowUser
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_opt_class();
  -[HUPlaybackInfluencesItemManager settingItem](self, "settingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "settingValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    -[HUPlaybackInfluencesItemManager settingItem](self, "settingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeKitSettingsVendor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_settingsValueManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUPlaybackInfluencesItemManager playbackInfluencesSetting](self, "playbackInfluencesSetting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForSetting:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "BOOLValue");

  }
  return v7;
}

- (id)updateUseListeningHistorySetting:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  -[HUPlaybackInfluencesItemManager settingItem](self, "settingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__HUPlaybackInfluencesItemManager__buildItemProvidersForHome___block_invoke;
  v13[3] = &unk_1E6F4C518;
  v13[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v13);
  -[HUPlaybackInfluencesItemManager setUseListeningHistoryItem:](self, "setUseListeningHistoryItem:", v5);

  v6 = objc_alloc(MEMORY[0x1E0D31848]);
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUPlaybackInfluencesItemManager useListeningHistoryItem](self, "useListeningHistoryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithItems:", v9);

  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __62__HUPlaybackInfluencesItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E0D30B80];
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithArray:", v8);
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E0D30E20];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "playbackInfluencesFollowUser");
  objc_msgSend(v10, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  BOOL v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPlaybackInfluencesItemManager accessorySettingsModule](self, "accessorySettingsModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPlaybackInfluencesItemManager accessorySettingsModule](self, "accessorySettingsModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "mediaProfile");
  }
  else
  {
    -[HUPlaybackInfluencesItemManager settingItem](self, "settingItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeKitSettingsVendor");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF347468))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v12)
  {

    v13 = v3;
  }

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D31530], "siriLanguageOptionFor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[HUHomeFeatureOnboardingUtilities home:voiceRecognitionIsSupportedForCurrentUserOnMediaAccessory:languageOption:](HUHomeFeatureOnboardingUtilities, "home:voiceRecognitionIsSupportedForCurrentUserOnMediaAccessory:languageOption:", v18, v16, v17);

  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x1E0C99E60];
  -[HUPlaybackInfluencesItemManager useListeningHistoryItem](self, "useListeningHistoryItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "intersectsSet:", v22);

  if (v23)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("UpdateListeningHistory"));
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __68__HUPlaybackInfluencesItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v29[3] = &__block_descriptor_33_e32___NSMutableAttributedString_8__0l;
    v30 = v19;
    __68__HUPlaybackInfluencesItemManager__buildSectionsWithDisplayedItems___block_invoke((uint64_t)v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttributedFooterTitle:", v25);

    -[HUPlaybackInfluencesItemManager useListeningHistoryItem](self, "useListeningHistoryItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setItems:", v27);

    objc_msgSend(v7, "addObject:", v24);
  }

  return v7;
}

id __68__HUPlaybackInfluencesItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  HFLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 32))
  {
    HFLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v21 = *MEMORY[0x1E0CEA0C0];
    objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v2, v10);
    objc_msgSend(v7, "appendAttributedString:", v11);

    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" \n\n%@"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, 0);
    objc_msgSend(v7, "appendAttributedString:", v14);

  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3778]);
    HFLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v15, "initWithString:", v16);

    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = *MEMORY[0x1E0CEA0C0];
    objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v17, "initWithString:attributes:", v2, v4);
    objc_msgSend(v7, "appendAttributedString:", v13);
  }

  return v7;
}

- (NSArray)playbackInfluencesOptionItems
{
  return self->_playbackInfluencesOptionItems;
}

- (HFStaticItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItem, a3);
}

- (HFStaticItem)useListeningHistoryItem
{
  return self->_useListeningHistoryItem;
}

- (void)setUseListeningHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_useListeningHistoryItem, a3);
}

- (HUHomeKitAccessorySettingsItemModule)accessorySettingsModule
{
  return self->_accessorySettingsModule;
}

- (void)setAccessorySettingsModule:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsModule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingsModule, 0);
  objc_storeStrong((id *)&self->_useListeningHistoryItem, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_playbackInfluencesOptionItems, 0);
}

@end
