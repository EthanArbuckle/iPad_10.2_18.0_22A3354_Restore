@implementation HUSiriHistoryItemManager

- (HUSiriHistoryItemManager)initWithDelegate:(id)a3 groupItem:(id)a4
{
  id v6;
  void *v7;
  HUSiriHistoryItemManager *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v13.receiver = self;
  v13.super_class = (Class)HUSiriHistoryItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v13, sel_initWithDelegate_sourceItem_, v6, v7);

  if (v8)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Home.DeleteSiriHistory", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

  }
  return v8;
}

- (HUSiriHistoryItemManager)initWithDelegate:(id)a3 accessorySettingItem:(id)a4
{
  HUSiriHistoryItemManager *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUSiriHistoryItemManager;
  v4 = -[HFItemManager initWithDelegate:sourceItem:](&v9, sel_initWithDelegate_sourceItem_, a3, a4);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.Home.DeleteSiriHistory", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

  }
  return v4;
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
  v13[2] = __55__HUSiriHistoryItemManager__buildItemProvidersForHome___block_invoke;
  v13[3] = &unk_1E6F4C518;
  v13[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v13);
  -[HUSiriHistoryItemManager setDeleteSiriHistoryItem:](self, "setDeleteSiriHistoryItem:", v5);

  v6 = objc_alloc(MEMORY[0x1E0D31848]);
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUSiriHistoryItemManager deleteSiriHistoryItem](self, "deleteSiriHistoryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithItems:", v9);

  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __55__HUSiriHistoryItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
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
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = *MEMORY[0x1E0D30B80];
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_mediaAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithArray:", v8);
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUSiriHistoryItemManager deleteSiriHistoryItem](self, "deleteSiriHistoryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "intersectsSet:", v9);

  if (v10)
  {
    v46 = v6;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("deleteSiriHistory"));
    objc_opt_class();
    -[HFItemManager sourceItem](self, "sourceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v14, "homeKitSettingsVendor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF347468))
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v45 = v14;
    objc_msgSend(v14, "homeKitSettingsVendor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30710]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v44 = v20;
    objc_msgSend(v20, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    objc_opt_class();
    -[HFItemManager sourceItem](self, "sourceItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    objc_msgSend(v26, "settingValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "BOOLValue");
    objc_msgSend(v17, "accessories");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hf_userFriendlyLocalizedLowercaseDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedStringWithFormat();
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "sourceItem", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "conformsToProtocol:", &unk_1EF2AC470))
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;

    objc_msgSend(v34, "accessories");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "anyObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v36, "hf_isSiriEndpoint"))
    {
      objc_msgSend(v27, "BOOLValue");
      objc_msgSend(v36, "hf_categoryOrPrimaryServiceType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedCategoryOrPrimaryServiceTypeString();
      v38 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v38;
    }
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __61__HUSiriHistoryItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v47[3] = &unk_1E6F4C540;
    v48 = v31;
    v39 = v31;
    __61__HUSiriHistoryItemManager__buildSectionsWithDisplayedItems___block_invoke((uint64_t)v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedFooterTitle:", v40);

    -[HUSiriHistoryItemManager deleteSiriHistoryItem](self, "deleteSiriHistoryItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setItems:", v42);

    v6 = v46;
    objc_msgSend(v46, "addObject:", v11);

  }
  return v6;
}

id __61__HUSiriHistoryItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", *(_QWORD *)(a1 + 32));
  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CEA0C0];
  objc_msgSend(MEMORY[0x1E0D31970], "aboutImproveSiriAndDictationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithString:attributes:", v3, v5);
  objc_msgSend(v1, "appendAttributedString:", v6);

  return v1;
}

- (id)didSelectItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  -[HFItemManager displayedItemAtIndexPath:](self, "displayedItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriHistoryItemManager deleteSiriHistoryItem](self, "deleteSiriHistoryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    HFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HFItemManager sourceItem](self, "sourceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC470))
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "accessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "hf_isSiriEndpoint"))
    {
      objc_msgSend(v15, "hf_categoryOrPrimaryServiceType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedCategoryOrPrimaryServiceTypeString();
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v17;
    }
    v24[0] = *MEMORY[0x1E0D30D18];
    HFLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0D30BF8];
    v25[0] = v18;
    v25[1] = v7;
    v20 = *MEMORY[0x1E0D30BC0];
    v24[1] = v19;
    v24[2] = v20;
    HFLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)didUpdateItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v9[5];

  -[HFItemManager displayedItemAtIndexPath:](self, "displayedItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriHistoryItemManager deleteSiriHistoryItem](self, "deleteSiriHistoryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke;
    v9[3] = &unk_1E6F4C660;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "homeKitSettingsVendor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v6, "homeKitSettingsVendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v20 = (void *)v14;

    v7 = v20;
    goto LABEL_15;
  }
  objc_msgSend(v6, "homeKitSettingsVendor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v6, "homeKitSettingsVendor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    objc_msgSend(v19, "components");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "na_map:", &__block_literal_global_3);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "sourceItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v25 = objc_opt_isKindOfClass();

  if ((v25 & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "sourceItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    objc_msgSend(v28, "sourceItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "accessories");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v31;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_3;
  v32[3] = &unk_1E6F4C638;
  v33 = v7;
  v34 = v3;
  v22 = v7;
  v23 = v3;
  dispatch_async(v21, v32);

}

id __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_304);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_6;
  v5[3] = &unk_1E6F4C610;
  v6 = *(id *)(a1 + 40);
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v5);

}

id __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_5;
  v7[3] = &unk_1E6F4C5E8;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "futureWithErrorOnlyHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteSiriHistoryWithCompletion:", a2);
}

void __53__HUSiriHistoryItemManager_didUpdateItemAtIndexPath___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *MEMORY[0x1E0D30BF8];
  v10[0] = *MEMORY[0x1E0D30D18];
  v10[1] = v8;
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v9, v4);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HFStaticItem)deleteSiriHistoryItem
{
  return self->_deleteSiriHistoryItem;
}

- (void)setDeleteSiriHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteSiriHistoryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteSiriHistoryItem, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
