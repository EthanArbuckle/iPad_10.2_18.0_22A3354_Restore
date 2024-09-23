@implementation HUAccessorySettingsSiriRecognitionLanguageItemManager

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_groupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsSiriRecognitionLanguageItemManager.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsSiriRecognitionLanguageItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_groupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsSiriRecognitionLanguageItemManager.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsSiriRecognitionLanguageItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 groupItem:(id)a4
{
  id v6;
  void *v7;
  HUAccessorySettingsSiriRecognitionLanguageItemManager *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HFAccessorySettingSiriLanguageAdapter *adapter;
  objc_super v14;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v6, v7);

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

  }
  return v8;
}

- (HUAccessorySettingsSiriRecognitionLanguageItemManager)initWithDelegate:(id)a3 accessorySettingItem:(id)a4 accessoryItem:(id)a5
{
  HFServiceLikeItem *v8;
  id v9;
  void *v10;
  HFServiceLikeItem *accessoryItem;
  HFServiceLikeItem *v12;
  HUAccessorySettingsSiriRecognitionLanguageItemManager *v13;
  objc_super v15;

  v8 = (HFServiceLikeItem *)a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(a4, "copy");
  accessoryItem = self->_accessoryItem;
  self->_accessoryItem = v8;
  v12 = v8;

  v15.receiver = self;
  v15.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v15, sel_initWithDelegate_sourceItem_, v9, v10);

  return v13;
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  HUAccessorySettingsSiriRecognitionLanguageItemManager *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUAccessorySettingsSiriRecognitionLanguageItemManager mediaProfileContainer](self, "mediaProfileContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasOptedToHH2"))
    {

LABEL_8:
      objc_msgSend(v6, "hf_siriLanguageOptionsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    objc_msgSend(v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hf_isSiriEndpoint");

    if (v10)
      goto LABEL_8;
  }
  objc_opt_class();
  -[HUAccessorySettingsSiriRecognitionLanguageItemManager mediaProfileContainer](self, "mediaProfileContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14
    && (objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "homeManager"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "hasOptedToHH2"),
        v16,
        v15,
        v17))
  {
    objc_msgSend(v14, "hf_siriLanguageOptionsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsSiriRecognitionLanguageItemManager mediaProfileContainer](self, "mediaProfileContainer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = self;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri Language Options Manager not found for mediaProfileContainer %@", (uint8_t *)&v22, 0x20u);

    }
    v11 = 0;
  }

LABEL_19:
  return (HFSiriLanguageOptionsManager *)v11;
}

- (id)mediaProfileContainer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "homeKitSettingsVendor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager accessoryItem](self, "accessoryItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
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
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    else
      -[HUAccessorySettingsSiriRecognitionLanguageItemManager adapter](self, "adapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageOption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSelectedLanguageOption:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  HUSiriLanguageOptionItemProvider *v5;
  void *v6;
  HUSiriLanguageOptionItemProvider *v7;
  HUSiriLanguageOptionItemProvider *v8;
  void *v9;
  HUSiriLanguageOptionItemProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [HUSiriLanguageOptionItemProvider alloc];
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager sourceItem](self, "sourceItem");
    v7 = (HUSiriLanguageOptionItemProvider *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUSiriLanguageOptionItemProvider initWithSiriLanguageOptionsManager:sourceItem:optionStyle:](v5, "initWithSiriLanguageOptionsManager:sourceItem:optionStyle:", v6, v7, 0);
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager setOptionItemProvider:](self, "setOptionItemProvider:", v8);

  }
  else
  {
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager adapter](self, "adapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    v10 = [HUSiriLanguageOptionItemProvider alloc];
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager adapter](self, "adapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUSiriLanguageOptionItemProvider initWithAdapter:optionStyle:](v10, "initWithAdapter:optionStyle:", v6, 0);
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager setOptionItemProvider:](self, "setOptionItemProvider:", v7);
  }

LABEL_6:
  -[HUAccessorySettingsSiriRecognitionLanguageItemManager optionItemProvider](self, "optionItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager optionItemProvider](self, "optionItemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("Languages"));
  -[HUAccessorySettingsSiriRecognitionLanguageItemManager optionItemProvider](self, "optionItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByIntersectingWithSet:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v12);

  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  -[HFItemManager _registerForExternalUpdates](&v6, sel__registerForExternalUpdates);
  -[HUAccessorySettingsSiriRecognitionLanguageItemManager adapter](self, "adapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", self);

  }
}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HUAccessorySettingsSiriRecognitionLanguageItemManager adapter](self, "adapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUAccessorySettingsSiriRecognitionLanguageItemManager siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v6, sel__unregisterForExternalUpdates);
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

- (HUSiriLanguageOptionItemProvider)optionItemProvider
{
  return self->_optionItemProvider;
}

- (void)setOptionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_optionItemProvider, a3);
}

- (HFServiceLikeItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_optionItemProvider, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
}

@end
