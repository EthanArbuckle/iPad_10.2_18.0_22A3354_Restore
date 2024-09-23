@implementation HUAccessorySettingsSiriOutputVoiceItemManager

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_groupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsSiriOutputVoiceItemManager.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_groupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsSiriOutputVoiceItemManager.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 groupItem:(id)a4
{
  id v6;
  void *v7;
  HUAccessorySettingsSiriOutputVoiceItemManager *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HFAccessorySettingSiriLanguageAdapter *adapter;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *siriLanguageOptionsManager;
  void *v21;
  id v22;
  void *v23;
  SiriTTSServiceSession *v24;
  SiriTTSServiceSession *session;
  objc_super v27;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v27.receiver = self;
  v27.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v27, sel_initWithDelegate_sourceItem_, v6, v7);

  if (v8)
  {
    objc_msgSend(v7, "homeKitSettingsVendor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_settingsAdapterManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adapterForIdentifier:", *MEMORY[0x1E0D30140]);
    v11 = objc_claimAutoreleasedReturnValue();
    adapter = v8->_adapter;
    v8->_adapter = (HFAccessorySettingSiriLanguageAdapter *)v11;

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasOptedToHH2");

    if (v15)
    {
      objc_opt_class();
      objc_msgSend(v7, "homeKitSettingsVendor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      if (v18)
      {
        objc_msgSend(v18, "hf_siriLanguageOptionsManager");
        v19 = objc_claimAutoreleasedReturnValue();
        siriLanguageOptionsManager = v8->_siriLanguageOptionsManager;
        v8->_siriLanguageOptionsManager = (HFSiriLanguageOptionsManager *)v19;
      }
      else
      {
        objc_opt_class();
        objc_msgSend(v7, "homeKitSettingsVendor");
        siriLanguageOptionsManager = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = siriLanguageOptionsManager;
        else
          v21 = 0;
        v22 = v21;

        if (v22)
        {
          objc_msgSend(v22, "hf_siriLanguageOptionsManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        objc_storeStrong((id *)&v8->_siriLanguageOptionsManager, v23);
        if (v22)

        else
          siriLanguageOptionsManager = 0;
      }

    }
    v24 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x1E0DA78E8]);
    session = v8->_session;
    v8->_session = v24;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_previewRequest)
    -[SiriTTSServiceSession cancelWithRequest:](self->_session, "cancelWithRequest:");
  v3.receiver = self;
  v3.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  -[HFItemManager dealloc](&v3, sel_dealloc);
}

- (HUAccessorySettingsSiriOutputVoiceItemManager)initWithDelegate:(id)a3 siriLanguageOptionsManager:(id)a4 sourceItem:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HUAccessorySettingsSiriOutputVoiceItemManager *v12;
  SiriTTSServiceSession *v13;
  SiriTTSServiceSession *session;
  objc_super v16;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a5, "copy");
  v16.receiver = self;
  v16.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  v12 = -[HFItemManager initWithDelegate:sourceItem:](&v16, sel_initWithDelegate_sourceItem_, v10, v11);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_siriLanguageOptionsManager, a4);
    v13 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x1E0DA78E8]);
    session = v12->_session;
    v12->_session = v13;

  }
  return v12;
}

- (id)updateSelectionWithOptionItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SiriTTSPreviewRequest *v13;
  SiriTTSPreviewRequest *previewRequest;
  SiriTTSServiceSession *session;
  SiriTTSPreviewRequest *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "languageOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "languageOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7908]), "initWithLanguage:name:", v9, v11);
    v13 = (SiriTTSPreviewRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78E0]), "initWithVoice:previewType:", v12, 0);
    previewRequest = self->_previewRequest;
    self->_previewRequest = v13;

    session = self->_session;
    v16 = self->_previewRequest;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __79__HUAccessorySettingsSiriOutputVoiceItemManager_updateSelectionWithOptionItem___block_invoke;
    v28 = &unk_1E6F4D1B0;
    v29 = v9;
    v30 = v11;
    v17 = v11;
    v18 = v9;
    -[SiriTTSServiceSession speakWithPreviewRequest:didFinish:](session, "speakWithPreviewRequest:didFinish:", v16, &v25);
    -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager", v25, v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    else
      -[HUAccessorySettingsSiriOutputVoiceItemManager adapter](self, "adapter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageOption");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateSelectedLanguageOption:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

void __79__HUAccessorySettingsSiriOutputVoiceItemManager_updateSelectionWithOptionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v3 == 0;
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Voice Preview completed successfully:%d for language:%@ voiceName:%@", (uint8_t *)v7, 0x1Cu);
  }

}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  HUSiriLanguageOptionItemProvider *v5;
  void *v6;
  void *v7;
  HUSiriLanguageOptionItemProvider *v8;
  HUSiriLanguageOptionItemProvider *v9;
  void *v10;
  HUSiriLanguageOptionItemProvider *v11;
  HUSiriLanguageOptionItemProvider *v12;
  void *v13;
  HUSiriLanguageOptionItemProvider *v14;
  HUSiriLanguageOptionItemProvider *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[HUAccessorySettingsSiriOutputVoiceItemManager setAccentOptionItemProvider:](self, "setAccentOptionItemProvider:", 0);
  -[HUAccessorySettingsSiriOutputVoiceItemManager setGenderOptionItemProvider:](self, "setGenderOptionItemProvider:", 0);
  -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HUSiriLanguageOptionItemProvider alloc];
  if (v4)
  {
    -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager sourceItem](self, "sourceItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUSiriLanguageOptionItemProvider initWithSiriLanguageOptionsManager:sourceItem:optionStyle:](v5, "initWithSiriLanguageOptionsManager:sourceItem:optionStyle:", v6, v7, 1);
    -[HUAccessorySettingsSiriOutputVoiceItemManager setAccentOptionItemProvider:](self, "setAccentOptionItemProvider:", v8);

    v9 = [HUSiriLanguageOptionItemProvider alloc];
    -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager sourceItem](self, "sourceItem");
    v11 = (HUSiriLanguageOptionItemProvider *)objc_claimAutoreleasedReturnValue();
    v12 = -[HUSiriLanguageOptionItemProvider initWithSiriLanguageOptionsManager:sourceItem:optionStyle:](v9, "initWithSiriLanguageOptionsManager:sourceItem:optionStyle:", v10, v11, 2);
    -[HUAccessorySettingsSiriOutputVoiceItemManager setGenderOptionItemProvider:](self, "setGenderOptionItemProvider:", v12);

  }
  else
  {
    -[HUAccessorySettingsSiriOutputVoiceItemManager adapter](self, "adapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUSiriLanguageOptionItemProvider initWithAdapter:optionStyle:](v5, "initWithAdapter:optionStyle:", v13, 1);
    -[HUAccessorySettingsSiriOutputVoiceItemManager setAccentOptionItemProvider:](self, "setAccentOptionItemProvider:", v14);

    v15 = [HUSiriLanguageOptionItemProvider alloc];
    -[HUAccessorySettingsSiriOutputVoiceItemManager adapter](self, "adapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUSiriLanguageOptionItemProvider initWithAdapter:optionStyle:](v15, "initWithAdapter:optionStyle:", v10, 2);
    -[HUAccessorySettingsSiriOutputVoiceItemManager setGenderOptionItemProvider:](self, "setGenderOptionItemProvider:", v11);
  }

  -[HUAccessorySettingsSiriOutputVoiceItemManager accentOptionItemProvider](self, "accentOptionItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[HUAccessorySettingsSiriOutputVoiceItemManager genderOptionItemProvider](self, "genderOptionItemProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[HUAccessorySettingsSiriOutputVoiceItemManager accentOptionItemProvider](self, "accentOptionItemProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      -[HUAccessorySettingsSiriOutputVoiceItemManager genderOptionItemProvider](self, "genderOptionItemProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("Accents"));
  -[HUAccessorySettingsSiriOutputVoiceItemManager accentOptionItemProvider](self, "accentOptionItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByIntersectingWithSet:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsSiriOutputVoiceVarietySectionTitle"), CFSTR("HUAccessorySettingsSiriOutputVoiceVarietySectionTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v13);

  objc_msgSend(v6, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 >= 2)
    objc_msgSend(v5, "addObject:", v6);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("Genders"));
  -[HUAccessorySettingsSiriOutputVoiceItemManager genderOptionItemProvider](self, "genderOptionItemProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "items");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_156);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setItems:", v19);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsSiriOutputVoiceSectionTitle"), CFSTR("HUAccessorySettingsSiriOutputVoiceSectionTitle"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHeaderTitle:", v20);

  objc_msgSend(v16, "items");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 >= 2)
    objc_msgSend(v5, "addObject:", v16);

  return v5;
}

uint64_t __82__HUAccessorySettingsSiriOutputVoiceItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = (void *)MEMORY[0x1E0CFE900];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputVoiceComparator");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "outputVoice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "outputVoice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = ((uint64_t (**)(_QWORD, void *, void *))v8)[2](v8, v10, v12);

  return v13;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  -[HFItemManager _registerForExternalUpdates](&v5, sel__registerForExternalUpdates);
  -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  -[HUAccessorySettingsSiriOutputVoiceItemManager adapter](self, "adapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUAccessorySettingsSiriOutputVoiceItemManager adapter](self, "adapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HUAccessorySettingsSiriOutputVoiceItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HUAccessorySettingsSiriOutputVoiceItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v5, sel__unregisterForExternalUpdates);
}

- (void)siriLanguageAdapter:(id)a3 selectedLanguageOptionDidChange:(id)a4
{
  id v4;

  v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (void)siriLanguageAdapter:(id)a3 availableLanguageOptionsDidChange:(id)a4
{
  id v4;

  v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4
{
  id v4;

  v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4
{
  id v4;

  v4 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2, a4);
}

- (HFAccessorySettingSiriLanguageAdapter)adapter
{
  return self->_adapter;
}

- (HUSiriLanguageOptionItemProvider)accentOptionItemProvider
{
  return self->_accentOptionItemProvider;
}

- (void)setAccentOptionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accentOptionItemProvider, a3);
}

- (HUSiriLanguageOptionItemProvider)genderOptionItemProvider
{
  return self->_genderOptionItemProvider;
}

- (void)setGenderOptionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_genderOptionItemProvider, a3);
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  return self->_siriLanguageOptionsManager;
}

- (void)setSiriLanguageOptionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, a3);
}

- (SiriTTSServiceSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (SiriTTSPreviewRequest)previewRequest
{
  return self->_previewRequest;
}

- (void)setPreviewRequest:(id)a3
{
  objc_storeStrong((id *)&self->_previewRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, 0);
  objc_storeStrong((id *)&self->_genderOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_accentOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
}

@end
