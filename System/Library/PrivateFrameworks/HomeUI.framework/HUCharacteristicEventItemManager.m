@implementation HUCharacteristicEventItemManager

+ (id)serviceVendorItemForEventBuilderItem:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  HUCharacteristicEventUnknownItem *v25;
  void *v27;
  void *v28;
  uint8_t buf[8];
  _QWORD v30[4];
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUCharacteristicEventItemManager.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventBuilderItem"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUCharacteristicEventItemManager.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

LABEL_3:
  v10 = objc_alloc_init(MEMORY[0x1E0D315E8]);
  objc_msgSend(v7, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global_146);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_2;
  v30[3] = &unk_1E6F517A8;
  v13 = v9;
  v31 = v13;
  objc_msgSend(v12, "na_flatMap:", v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_map:", &__block_literal_global_67_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Found multiple matching service groups that will cause a characteristic trigger to fire. This is supported in the HomeKit API, but not in Home.app. Arbitarily picking one to show", buf, 2u);
      }

    }
    v18 = objc_alloc(MEMORY[0x1E0D317B8]);
    objc_msgSend(v14, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithValueSource:serviceGroup:", v10, v19);
  }
  else if (objc_msgSend(v12, "count"))
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "Found multiple matching services that will cause a characteristic trigger to fire. This is supported in the HomeKit API, but not in Home.app. Arbitarily picking one to show", buf, 2u);
      }

    }
    v22 = (void *)MEMORY[0x1E0D317D0];
    objc_msgSend(v12, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serviceItemForService:valueSource:", v19, v10);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v16, "count"))
    {
      v25 = objc_alloc_init(HUCharacteristicEventUnknownItem);
      goto LABEL_22;
    }
    if ((unint64_t)objc_msgSend(v16, "count") >= 2)
    {
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "Found multiple matching accessories that will cause a characteristic trigger to fire. This is supported in the HomeKit API, but not in Home.app. Arbitarily picking one to show", buf, 2u);
      }

    }
    v24 = objc_alloc(MEMORY[0x1E0D310A8]);
    objc_msgSend(v16, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v24, "initWithAccessory:valueSource:", v19, v10);
  }
  v25 = (HUCharacteristicEventUnknownItem *)v20;

LABEL_22:
  return v25;
}

id __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_isVisible"))
  {
    objc_msgSend(v2, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "hf_serviceGroupsForService:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__HUCharacteristicEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HUCharacteristicEventItemManager)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HUCharacteristicEventItemManager *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HFServiceVendor *serviceVendingItem;
  HUTriggerConditionEditorItemModule *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HUTriggerConditionEditorItemModule *conditionModule;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUCharacteristicEventItemManager;
  v11 = -[HFItemManager initWithDelegate:](&v23, sel_initWithDelegate_, a5);
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend(v9, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceVendorItemForEventBuilderItem:inHome:", v10, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    serviceVendingItem = v11->_serviceVendingItem;
    v11->_serviceVendingItem = (HFServiceVendor *)v14;

    objc_storeStrong((id *)&v11->_eventBuilderItem, a4);
    objc_storeStrong((id *)&v11->_triggerBuilder, a3);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v16 = [HUTriggerConditionEditorItemModule alloc];
      objc_msgSend(v9, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "conditionCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:](v16, "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", v11, v17, v18, v19);
      conditionModule = v11->_conditionModule;
      v11->_conditionModule = (HUTriggerConditionEditorItemModule *)v20;

    }
  }

  return v11;
}

- (void)setActiveOptionItem:(id)a3
{
  id v6;
  HFItem *activeOptionItem;
  HFItem *v8;
  char v9;
  void *v10;
  id v11;
  HFItem *v12;

  v6 = a3;
  activeOptionItem = self->_activeOptionItem;
  v12 = (HFItem *)v6;
  v8 = activeOptionItem;
  if (v8 == v12)
  {

    v10 = v12;
  }
  else
  {
    if (v12)
    {
      v9 = -[HFItem isEqual:](v12, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_activeOptionItem, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v10, a2);
  }

LABEL_9:
}

- (id)optionItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUCharacteristicEventItemManager optionProvider](self, "optionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  HUInstructionsItem *v5;
  void *v6;
  HUInstructionsItem *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HUCharacteristicEventOptionProvider *v20;
  void *v21;
  HUCharacteristicEventOptionProvider *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v33[2];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUInstructionsItem alloc];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicEventOptionInstructionsHeader"), CFSTR("HUCharacteristicEventOptionInstructionsHeader"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUInstructionsItem initWithStyle:title:description:](v5, "initWithStyle:title:description:", 0, v6, 0);
  -[HUCharacteristicEventItemManager setInstructionsItem:](self, "setInstructionsItem:", v7);

  v8 = objc_alloc(MEMORY[0x1E0D31920]);
  -[HUCharacteristicEventItemManager serviceVendingItem](self, "serviceVendingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = *MEMORY[0x1E0D30B80];
  v34[0] = *MEMORY[0x1E0D30D18];
  v34[1] = v11;
  v34[2] = *MEMORY[0x1E0D30C60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithSourceItem:resultKeyFilter:", v10, v12);
  -[HUCharacteristicEventItemManager setServiceNameItem:](self, "setServiceNameItem:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D31848]);
  v15 = (void *)MEMORY[0x1E0C99E60];
  -[HUCharacteristicEventItemManager instructionsItem](self, "instructionsItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventItemManager serviceNameItem](self, "serviceNameItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObjects:", v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithItems:", v18);
  -[HUCharacteristicEventItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v19);

  v20 = [HUCharacteristicEventOptionProvider alloc];
  -[HUCharacteristicEventItemManager serviceVendingItem](self, "serviceVendingItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HUCharacteristicEventOptionProvider initWithServiceVendingItem:home:](v20, "initWithServiceVendingItem:home:", v21, v4);

  -[HUCharacteristicEventItemManager setOptionProvider:](self, "setOptionProvider:", v22);
  -[HUCharacteristicEventItemManager staticItemProvider](self, "staticItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  -[HUCharacteristicEventItemManager optionProvider](self, "optionProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventItemManager conditionModule](self, "conditionModule");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "itemProviders");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = v28;
  else
    v30 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
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
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUCharacteristicEventItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCharacteristicEventSectionIdentifierInstructions"));
    -[HUCharacteristicEventItemManager instructionsItem](self, "instructionsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v10);

    objc_msgSend(v5, "addObject:", v8);
  }
  -[HUCharacteristicEventItemManager serviceNameItem](self, "serviceNameItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "containsObject:", v11);

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCharacteristicEventSectionIdentifierService"));
    -[HUCharacteristicEventItemManager serviceNameItem](self, "serviceNameItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v15);

    objc_msgSend(v5, "addObject:", v13);
  }
  -[HUCharacteristicEventItemManager optionProvider](self, "optionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_setByIntersectingWithSet:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCharacteristicEventSectionIdentifierOptions"));
    objc_msgSend(v18, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_optionItemComparator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingComparator:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_opt_class();
    -[HUCharacteristicEventItemManager activeOptionItem](self, "activeOptionItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    if (v26)
    {
      v27 = objc_msgSend(v23, "indexOfObject:", v26);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v27;
        objc_msgSend(v26, "childItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v26, "childItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "insertObject:atIndex:", v30, v28 + 1);

        }
      }
    }
    objc_msgSend(v19, "setItems:", v23);
    objc_msgSend((id)objc_opt_class(), "_titleForItemSection:", v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHeaderTitle:", v31);

    objc_msgSend(v5, "addObject:", v19);
  }
  -[HUCharacteristicEventItemManager conditionModule](self, "conditionModule");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[HUCharacteristicEventItemManager conditionModule](self, "conditionModule");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "buildSectionsWithDisplayedItems:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v34);

  }
  return v5;
}

+ (id)_optionItemComparator
{
  return &__block_literal_global_87;
}

uint64_t __57__HUCharacteristicEventItemManager__optionItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristicType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "characteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "characteristicType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isEqualToString:", v11))
  {
    v17 = objc_msgSend(v8, "compare:", v11);
    goto LABEL_8;
  }
  objc_msgSend(v4, "representativeTriggerValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v5, "representativeTriggerValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "representativeTriggerValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representativeTriggerValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

LABEL_8:
  return v17;
}

+ (id)_titleForItemSection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_91_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristicType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CBA4D0], "hf_naturalLanguageDescriptionForCharacteristic:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __57__HUCharacteristicEventItemManager__titleForItemSection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "mainCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFServiceVendor)serviceVendingItem
{
  return self->_serviceVendingItem;
}

- (void)setServiceVendingItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceVendingItem, a3);
}

- (HFItem)activeOptionItem
{
  return self->_activeOptionItem;
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (HFItem)serviceNameItem
{
  return self->_serviceNameItem;
}

- (void)setServiceNameItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNameItem, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HUCharacteristicEventOptionProvider)optionProvider
{
  return self->_optionProvider;
}

- (void)setOptionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_optionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceNameItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_activeOptionItem, 0);
  objc_storeStrong((id *)&self->_serviceVendingItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end
