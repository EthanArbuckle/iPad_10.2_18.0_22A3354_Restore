@implementation HUSiriLanguageOptionItemProvider

- (HUSiriLanguageOptionItemProvider)initWithAdapter:(id)a3 optionStyle:(unint64_t)a4
{
  id v7;
  HUSiriLanguageOptionItemProvider *v8;
  HUSiriLanguageOptionItemProvider *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSSet *items;
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HUSiriLanguageOptionItemProvider;
  v8 = -[HFItemProvider init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adapter, a3);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasOptedToHH2");

    if (v12)
    {
      objc_opt_class();
      objc_msgSend(v7, "homeKitSettingsVendor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      objc_opt_class();
      objc_msgSend(v7, "homeKitSettingsVendor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      if (v15)
        v19 = v15;
      else
        v19 = v18;
      objc_msgSend(v19, "hf_siriLanguageOptionsManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v9->_siriLanguageOptionsManager, v20);

    }
    v9->_optionStyle = a4;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    items = v9->_items;
    v9->_items = (NSSet *)v21;

  }
  return v9;
}

- (HUSiriLanguageOptionItemProvider)initWithSiriLanguageOptionsManager:(id)a3 sourceItem:(id)a4 optionStyle:(unint64_t)a5
{
  id v9;
  id v10;
  HUSiriLanguageOptionItemProvider *v11;
  HUSiriLanguageOptionItemProvider *v12;
  uint64_t v13;
  NSSet *items;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUSiriLanguageOptionItemProvider;
  v11 = -[HFItemProvider init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_siriLanguageOptionsManager, a3);
    objc_storeStrong((id *)&v12->_sourceItem, a4);
    v12->_optionStyle = a5;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    items = v12->_items;
    v12->_items = (NSSet *)v13;

  }
  return v12;
}

- (id)reloadItems
{
  void *v3;

  -[HUSiriLanguageOptionItemProvider siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HUSiriLanguageOptionItemProvider _reloadItemsWithSiriLanguageOptionsManager](self, "_reloadItemsWithSiriLanguageOptionsManager");
  else
    -[HUSiriLanguageOptionItemProvider _reloadItemsWithAdapter](self, "_reloadItemsWithAdapter");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_reloadItemsWithAdapter
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HUSiriLanguageOptionItemProvider__reloadItemsWithAdapter__block_invoke;
  v6[3] = &unk_1E6F4D018;
  v6[4] = self;
  __59__HUSiriLanguageOptionItemProvider__reloadItemsWithAdapter__block_invoke((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriLanguageOptionItemProvider _createSiriLanguageOptionItems:](self, "_createSiriLanguageOptionItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__HUSiriLanguageOptionItemProvider__reloadItemsWithAdapter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "optionStyle");
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "adapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "adapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLanguageOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredOutputVoiceOptionsForSelectedOption:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "adapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "adapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLanguageOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredOutputVoiceAccentOptionsForSelectedOption:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    objc_msgSend(*(id *)(a1 + 32), "adapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "adapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLanguageOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredRecognitionLanguageOptionsForSelectedOption:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_reloadItemsWithSiriLanguageOptionsManager
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke;
  v8[3] = &unk_1E6F4C518;
  v8[4] = self;
  __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke((uint64_t)v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke_2;
  v7[3] = &unk_1E6F4F9C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "optionStyle");
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "siriLanguageOptionsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredOutputVoiceOptionsForSelectedOption");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "siriLanguageOptionsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredOutputVoiceAccentOptionsForSelectedOption");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "siriLanguageOptionsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredRecognitionLanguageOptionsForSelectedOption");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

uint64_t __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSiriLanguageOptionItems:", a2);
}

- (id)_createSiriLanguageOptionItems:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  HUSiriLanguageOptionItemProvider *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke;
  aBlock[3] = &unk_1E6F58D68;
  aBlock[4] = self;
  v5 = a3;
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_dictionaryWithKeyGenerator:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_2;
  v21[3] = &unk_1E6F58D90;
  v10 = v6;
  v22 = v10;
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_3;
  v20[3] = &unk_1E6F58DB8;
  v20[4] = self;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v9, v10, v21, 0, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_4;
  v16[3] = &unk_1E6F58E08;
  v18 = self;
  v19 = v10;
  v17 = v8;
  v12 = v10;
  v13 = v8;
  objc_msgSend(v11, "addSuccessBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  +[HUSiriLanguageOptionItem selectionKeyForLanguageOption:withOptionStyle:](HUSiriLanguageOptionItem, "selectionKeyForLanguageOption:withOptionStyle:", v3, objc_msgSend(v2, "optionStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "languageOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  HUSiriLanguageOptionItem *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "siriLanguageOptionsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HUSiriLanguageOptionItem alloc];
  v7 = objc_msgSend(*(id *)(a1 + 32), "optionStyle");
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v8, "siriLanguageOptionsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUSiriLanguageOptionItem initWithStyle:siriLanguageOptionsManager:languageOption:](v6, "initWithStyle:siriLanguageOptionsManager:languageOption:", v7, v9, v4);
  }
  else
  {
    objc_msgSend(v8, "adapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUSiriLanguageOptionItem initWithStyle:adapter:languageOption:](v6, "initWithStyle:adapter:languageOption:", v7, v9, v4);
  }
  v11 = (void *)v10;

  return v11;
}

void __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "existingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_5;
  v9 = &unk_1E6F58DE0;
  v10 = a1[4];
  v11 = a1[6];
  objc_msgSend(v4, "na_each:", &v6);

  objc_msgSend(v3, "allItems", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "setItems:", v5);
}

void __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "languageOption");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguageOption:", v6);

}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (unint64_t)optionStyle
{
  return self->_optionStyle;
}

- (HFAccessorySettingSiriLanguageAdapter)adapter
{
  return self->_adapter;
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  return self->_siriLanguageOptionsManager;
}

- (void)setSiriLanguageOptionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, a3);
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
