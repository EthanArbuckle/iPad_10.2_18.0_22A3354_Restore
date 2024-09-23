@implementation HUCharacteristicTriggerEventItemManager

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
  HUCharacteristicTriggerEventUnknownItem *v25;
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
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUCharacteristicTriggerEventItemManager.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventBuilderItem"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUCharacteristicTriggerEventItemManager.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

LABEL_3:
  v10 = objc_alloc_init(MEMORY[0x1E0D315E8]);
  objc_msgSend(v7, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global_190);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __87__HUCharacteristicTriggerEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_2;
  v30[3] = &unk_1E6F517A8;
  v13 = v9;
  v31 = v13;
  objc_msgSend(v12, "na_flatMap:", v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_map:", &__block_literal_global_69_0);
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
      v25 = objc_alloc_init(HUCharacteristicTriggerEventUnknownItem);
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
  v25 = (HUCharacteristicTriggerEventUnknownItem *)v20;

LABEL_22:
  return v25;
}

id __87__HUCharacteristicTriggerEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke(uint64_t a1, void *a2)
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

id __87__HUCharacteristicTriggerEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_2(uint64_t a1, uint64_t a2)
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

id __87__HUCharacteristicTriggerEventItemManager_serviceVendorItemForEventBuilderItem_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HUCharacteristicTriggerEventItemManager)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HUCharacteristicTriggerEventItemManager *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HFServiceVendor *serviceVendingItem;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUCharacteristicTriggerEventItemManager;
  v11 = -[HFItemManager initWithDelegate:](&v17, sel_initWithDelegate_, a5);
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

  -[HUCharacteristicTriggerEventItemManager optionProvider](self, "optionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  HUTriggerConditionEditorItemModule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUTriggerConditionEditorItemModule *v10;
  HUTriggerConditionEditorItemModule *conditionModule;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = [HUTriggerConditionEditorItemModule alloc];
  -[HUCharacteristicTriggerEventItemManager triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerEventItemManager triggerBuilder](self, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conditionCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:](v4, "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", self, v6, v8, v9);
  conditionModule = self->_conditionModule;
  self->_conditionModule = v10;

  -[HUCharacteristicTriggerEventItemManager conditionModule](self, "conditionModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v5;
  HUInstructionsItem *v6;
  uint64_t v7;
  HUInstructionsItem *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HUCharacteristicEventOptionProvider *v22;
  void *v23;
  HUCharacteristicEventOptionProvider *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HUInstructionsItem alloc];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerEventOptionInstructionsHeader"), CFSTR("HUCharacteristicTriggerEventOptionInstructionsHeader"), 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[HUInstructionsItem initWithStyle:title:description:](v6, "initWithStyle:title:description:", 0, v7, 0);
  -[HUCharacteristicTriggerEventItemManager setInstructionsItem:](self, "setInstructionsItem:", v8);

  -[HUCharacteristicTriggerEventItemManager serviceVendingItem](self, "serviceVendingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerEventItemManager triggerBuilder](self, "triggerBuilder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trigger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uniqueIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerEventItemManager eventBuilderItem](self, "eventBuilderItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerEventItemManager eventBuilderItem](self, "eventBuilderItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "eventBuilders");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicTriggerEventItemManager.m"), 139, CFSTR("Tried to display a HUCharacteristicTriggerEventUnknownItem which can't produce results. Trigger %@, Event builder item: %@, event builders: %@"), v34, v35, v37);

  }
  v10 = objc_alloc(MEMORY[0x1E0D31920]);
  -[HUCharacteristicTriggerEventItemManager serviceVendingItem](self, "serviceVendingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = *MEMORY[0x1E0D30B80];
  v39[0] = *MEMORY[0x1E0D30D18];
  v39[1] = v13;
  v39[2] = *MEMORY[0x1E0D30C60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithSourceItem:resultKeyFilter:", v12, v14);
  -[HUCharacteristicTriggerEventItemManager setServiceNameItem:](self, "setServiceNameItem:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D31848]);
  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HUCharacteristicTriggerEventItemManager instructionsItem](self, "instructionsItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerEventItemManager serviceNameItem](self, "serviceNameItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObjects:", v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v16, "initWithItems:", v20);
  -[HUCharacteristicTriggerEventItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v21);

  v22 = [HUCharacteristicEventOptionProvider alloc];
  -[HUCharacteristicTriggerEventItemManager serviceVendingItem](self, "serviceVendingItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HUCharacteristicEventOptionProvider initWithServiceVendingItem:home:](v22, "initWithServiceVendingItem:home:", v23, v5);

  -[HUCharacteristicTriggerEventItemManager setOptionProvider:](self, "setOptionProvider:", v24);
  -[HUCharacteristicTriggerEventItemManager eventBuilderItem](self, "eventBuilderItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerEventItemManager optionProvider](self, "optionProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEventBuilderItem:", v25);

  -[HUCharacteristicTriggerEventItemManager staticItemProvider](self, "staticItemProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v27;
  -[HUCharacteristicTriggerEventItemManager optionProvider](self, "optionProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
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
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUCharacteristicTriggerEventItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCharacteristicTriggerEventSectionIdentifierInstructions"));
    -[HUCharacteristicTriggerEventItemManager instructionsItem](self, "instructionsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v10);

    objc_msgSend(v5, "addObject:", v8);
  }
  -[HUCharacteristicTriggerEventItemManager serviceNameItem](self, "serviceNameItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "containsObject:", v11);

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCharacteristicTriggerEventSectionIdentifierService"));
    -[HUCharacteristicTriggerEventItemManager serviceNameItem](self, "serviceNameItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v15);

    objc_msgSend(v5, "addObject:", v13);
  }
  -[HUCharacteristicTriggerEventItemManager optionProvider](self, "optionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_setByIntersectingWithSet:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCharacteristicTriggerEventSectionIdentifierOptions"));
    objc_msgSend(v18, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_optionItemComparator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingComparator:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_opt_class();
    -[HUCharacteristicTriggerEventItemManager activeOptionItem](self, "activeOptionItem");
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
  -[HUCharacteristicTriggerEventItemManager conditionModule](self, "conditionModule");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "buildSectionsWithDisplayedItems:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v33);

  return v5;
}

+ (id)_optionItemComparator
{
  return &__block_literal_global_89_0;
}

uint64_t __64__HUCharacteristicTriggerEventItemManager__optionItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;

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
    v18 = objc_msgSend(v8, "compare:", v11);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "containsObject:", v8)
    || (objc_msgSend(v4, "thresholdValueRange"), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_9:
    objc_msgSend(v4, "representativeTriggerValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "representativeTriggerValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        objc_msgSend(v5, "representativeTriggerValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "representativeTriggerValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v22, "compare:", v23);

        goto LABEL_14;
      }
    }
    else
    {

    }
    v18 = 0;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  objc_msgSend(v5, "thresholdValueRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_9;
  v16 = triggerRangeTypeForEventItem(v4);
  v17 = triggerRangeTypeForEventItem(v5);
  if (v16 == 1)
    v18 = -1;
  else
    v18 = v17 == 1;
LABEL_14:

  return v18;
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
  objc_msgSend(v4, "na_map:", &__block_literal_global_94_1);
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

id __64__HUCharacteristicTriggerEventItemManager__titleForItemSection___block_invoke(uint64_t a1, void *a2)
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
