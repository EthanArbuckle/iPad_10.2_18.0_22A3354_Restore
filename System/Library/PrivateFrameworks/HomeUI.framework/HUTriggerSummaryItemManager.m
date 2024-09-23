@implementation HUTriggerSummaryItemManager

- (HUTriggerSummaryItemManager)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUTriggerBuilderItem *v12;
  HUTriggerSummaryItemManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[HUTriggerBuilderItem initWithTriggerBuilder:nameType:]([HUTriggerBuilderItem alloc], "initWithTriggerBuilder:nameType:", v9, 4);
  v15.receiver = self;
  v15.super_class = (Class)HUTriggerSummaryItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v15, sel_initWithDelegate_sourceItem_, v11, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_triggerBuilder, a3);
    objc_storeStrong((id *)&v13->_currentFlow, a4);
  }

  return v13;
}

- (void)triggerBuilderDidChange
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalLanguageNameOfType:", 2);
  v5 = objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayName:", v5);

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "nameIsConfigured");

  if ((v5 & 1) == 0)
  {
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "naturalLanguageNameOfType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v9);

  }
  v11 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
}

- (int64_t)unsupportedItemSectionIndex
{
  return -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](self, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierUnsupportedItems"));
}

- (int64_t)actionSetsSection
{
  return -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](self, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUTriggerActionSetsItemModuleSectionIdentifierActionSets"));
}

- (int64_t)serviceActionsSection
{
  return -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](self, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUTriggerActionSetsItemModuleSectionIdentifierServiceActions"));
}

- (id)instructionSections
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
}

- (id)triggerCurrentDisplayedName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nameIsConfigured");
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "name");
  else
    objc_msgSend(v5, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setPrioritizedAccessories:(id)a3
{
  void *v4;
  void *v5;
  NSSet *prioritizedAccessories;
  NSSet *v7;
  id v8;

  v8 = a3;
  -[HUTriggerSummaryItemManager actionsModule](self, "actionsModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUTriggerSummaryItemManager actionsModule](self, "actionsModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrioritizedAccessories:", v8);

    prioritizedAccessories = self->_prioritizedAccessories;
    self->_prioritizedAccessories = 0;
  }
  else
  {
    v7 = (NSSet *)v8;
    prioritizedAccessories = self->_prioritizedAccessories;
    self->_prioritizedAccessories = v7;
  }

}

- (NSSet)prioritizedAccessories
{
  void *v3;
  void *prioritizedAccessories;
  void *v5;
  NSSet *v6;

  -[HUTriggerSummaryItemManager actionsModule](self, "actionsModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prioritizedAccessories");
  prioritizedAccessories = (void *)objc_claimAutoreleasedReturnValue();
  v5 = prioritizedAccessories;
  if (!prioritizedAccessories)
    prioritizedAccessories = self->_prioritizedAccessories;
  v6 = prioritizedAccessories;

  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_supportsSharedEventAutomation");

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    -[HFItemManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_INFO, "Home %@ supports shared event automation", buf, 0xCu);
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    -[HFItemManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "residentDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_prettyDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_INFO, "No resident on home %@ supports shared event automation; residents: %@",
      buf,
      0x16u);

  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryItemManager _staticItemsForHome:](self, "_staticItemsForHome:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v15);
    objc_msgSend(v14, "na_safeAddObject:", v16);

  }
  -[HUTriggerSummaryItemManager _unsupportedTriggers](self, "_unsupportedTriggers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
    goto LABEL_12;
  v18 = -[HUTriggerSummaryItemManager _isInEditMode](self, "_isInEditMode");

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0D31848]);
    -[HUTriggerSummaryItemManager _unsupportedTriggers](self, "_unsupportedTriggers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__HUTriggerSummaryItemManager__buildItemProvidersForHome___block_invoke;
    v25[3] = &unk_1E6F5E858;
    v26 = v4;
    objc_msgSend(v20, "na_map:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithItems:", v21);
    -[HUTriggerSummaryItemManager setUnsupportedItemProvider:](self, "setUnsupportedItemProvider:", v22);

    -[HUTriggerSummaryItemManager unsupportedItemProvider](self, "unsupportedItemProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_safeAddObject:", v23);

    v17 = v26;
LABEL_12:

  }
  return v14;
}

id __58__HUTriggerSummaryItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D31950];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithHome:trigger:", *(_QWORD *)(a1 + 32), v4);

  return v5;
}

- (id)_staticItemsForHome:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D31920]);
  -[HFItemManager sourceItem](self, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke;
  v27[3] = &unk_1E6F5E880;
  v27[4] = self;
  v9 = (void *)objc_msgSend(v5, "initWithSourceItem:transformationBlock:", v7, v27);
  -[HUTriggerSummaryItemManager setEnableItem:](self, "setEnableItem:", v9);

  -[HUTriggerSummaryItemManager enableItem](self, "enableItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_2;
  v26[3] = &unk_1E6F4C518;
  v26[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v26);
  -[HUTriggerSummaryItemManager setNamingRowItem:](self, "setNamingRowItem:", v11);

  -[HUTriggerSummaryItemManager namingRowItem](self, "namingRowItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_3;
  v25[3] = &unk_1E6F4C518;
  v25[4] = self;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v25);
  -[HUTriggerSummaryItemManager setCreateActionButtonItem:](self, "setCreateActionButtonItem:", v13);

  -[HUTriggerSummaryItemManager createActionButtonItem](self, "createActionButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_4;
  v24[3] = &unk_1E6F4C518;
  v24[4] = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v24);
  -[HUTriggerSummaryItemManager setTestTriggerItem:](self, "setTestTriggerItem:", v15);

  -[HUTriggerSummaryItemManager testTriggerItem](self, "testTriggerItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  v17 = objc_alloc(MEMORY[0x1E0D31840]);
  v28[0] = *MEMORY[0x1E0D30D18];
  -[HUTriggerSummaryItemManager _triggerDeleteInstructionItemString](self, "_triggerDeleteInstructionItemString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v28[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HUTriggerSummaryItemManager _shouldShowDeleteItem](self, "_shouldShowDeleteItem") ^ 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithResults:", v20);
  -[HUTriggerSummaryItemManager setDeleteTriggerItem:](self, "setDeleteTriggerItem:", v21);

  -[HUTriggerSummaryItemManager deleteTriggerItem](self, "deleteTriggerItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v22);

  return v4;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a2;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryEnableSwitchTitle"), CFSTR("HUTriggerSummaryEnableSwitchTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("HUTriggerSummaryEnableSwitchTitle"), *MEMORY[0x1E0D30D20]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeForceDisableReasons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "hf_currentUserIsAdministrator") ^ 1;
  }
  objc_msgSend(v8, "numberWithInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30C80]);

  if (!v10)
  v12 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(*(id *)(a1 + 32), "_isInEditMode"))
    v13 = objc_msgSend(*(id *)(a1 + 32), "_showEnableSwitch") ^ 1;
  else
    v13 = 1;
  objc_msgSend(v12, "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30D70]);

  return v5;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
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

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nameIsConfigured");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  }
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D28]);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "currentFlow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isStandalone"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30D70]);

  v12 = (void *)MEMORY[0x1E0D519C0];
  v13 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_3(id *a1)
{
  void *v1;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v2 = a1;
  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = *MEMORY[0x1E0D30D18];
  objc_msgSend(a1[4], "_triggerServiceActionsInstructionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = *MEMORY[0x1E0D30D70];
  v14[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v2[4], "_isInEditMode");
  if (v6)
  {
    objc_msgSend(v2[4], "home");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hf_currentUserIsAdministrator"))
    {
      objc_msgSend(v2[4], "triggerBuilder");
      v2 = (id *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v2, "isShortcutOwned");
      v8 = 1;
    }
    else
    {
      v8 = 0;
      v7 = 1;
    }
  }
  else
  {
    v8 = 0;
    v7 = 1;
  }
  objc_msgSend(v5, "numberWithInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  if (v6)

  return v11;
}

id __51__HUTriggerSummaryItemManager__staticItemsForHome___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = *MEMORY[0x1E0D30D18];
  objc_msgSend(*(id *)(a1 + 32), "_triggerTestActionsInstructionDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x1E0D30D70];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "_shouldShowTestItem") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v4;
  HUTriggerEventsItemModule *v5;
  void *v6;
  HUTriggerEventsItemModule *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HUTriggerDurationItemModule *v12;
  void *v13;
  HUTriggerDurationItemModule *v14;
  void *v15;
  void *v16;
  HUTriggerActionSetsItemModule *v17;
  void *v18;
  void *v19;
  HUTriggerActionSetsItemModule *v20;
  NSSet *prioritizedAccessories;
  void *v22;
  NSSet *v23;
  void *v24;
  HUTriggerMediaItemModule *v25;
  void *v26;
  HUTriggerMediaItemModule *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  int v39;
  HUTriggerConditionEditorItemModule *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HUTriggerConditionEditorItemModule *v45;
  void *v46;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HUTriggerEventsItemModule alloc];
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUTriggerEventsItemModule initWithTriggerBuilder:itemUpdater:](v5, "initWithTriggerBuilder:itemUpdater:", v6, self);
  -[HUTriggerSummaryItemManager setEventsModule:](self, "setEventsModule:", v7);

  v8 = -[HUTriggerSummaryItemManager _isInEditMode](self, "_isInEditMode");
  if (v8)
  {
    -[HFItemManager home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "hf_currentUserIsAdministrator") ^ 1;
  }
  else
  {
    v9 = 1;
  }
  -[HUTriggerSummaryItemManager eventsModule](self, "eventsModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHideAddEventButton:", v9);

  if (v8)
  -[HUTriggerSummaryItemManager eventsModule](self, "eventsModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v11);

  v12 = [HUTriggerDurationItemModule alloc];
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUTriggerDurationItemModule initWithTriggerBuilder:itemUpdater:](v12, "initWithTriggerBuilder:itemUpdater:", v13, self);
  -[HUTriggerSummaryItemManager setDurationModule:](self, "setDurationModule:", v14);

  -[HUTriggerSummaryItemManager durationModule](self, "durationModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItemManager:", self);

  -[HUTriggerSummaryItemManager durationModule](self, "durationModule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v16);

  v17 = [HUTriggerActionSetsItemModule alloc];
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HUTriggerActionSetsItemModule initWithTriggerBuilder:flow:itemUpdater:](v17, "initWithTriggerBuilder:flow:itemUpdater:", v18, v19, self);
  -[HUTriggerSummaryItemManager setActionsModule:](self, "setActionsModule:", v20);

  prioritizedAccessories = self->_prioritizedAccessories;
  -[HUTriggerSummaryItemManager actionsModule](self, "actionsModule");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPrioritizedAccessories:", prioritizedAccessories);

  v23 = self->_prioritizedAccessories;
  self->_prioritizedAccessories = 0;

  -[HUTriggerSummaryItemManager actionsModule](self, "actionsModule");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v24);

  v25 = [HUTriggerMediaItemModule alloc];
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HUTriggerMediaItemModule initWithTriggerBuilder:itemUpdater:](v25, "initWithTriggerBuilder:itemUpdater:", v26, self);
  -[HUTriggerSummaryItemManager setMediaModule:](self, "setMediaModule:", v27);

  -[HUTriggerSummaryItemManager mediaModule](self, "mediaModule");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v28);

  objc_opt_class();
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  if (_os_feature_enabled_impl() && v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "eventTypes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34 == 1)
    {
      objc_msgSend(v31, "eventTypes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "containsObject:", *MEMORY[0x1E0D305E0]);

      if ((v36 & 1) != 0)
      {
        v37 = &unk_1E7041C38;
LABEL_16:
        objc_msgSend(v32, "addObject:", v37);
        goto LABEL_17;
      }
      objc_msgSend(v31, "eventTypes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "containsObject:", *MEMORY[0x1E0D305D8]);

      if (v39)
      {
        v37 = &unk_1E7041C50;
        goto LABEL_16;
      }
    }
LABEL_17:
    v40 = [HUTriggerConditionEditorItemModule alloc];
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "home");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "conditionCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:](v40, "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", self, v42, v44, v32);
    -[HUTriggerSummaryItemManager setConditionModule:](self, "setConditionModule:", v45);

    -[HUTriggerSummaryItemManager conditionModule](self, "conditionModule");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeAddObject:", v46);

  }
  return v4;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[13];

  v49[11] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryItemManager eventsModule](self, "eventsModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildSectionsWithDisplayedItems:", v5);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryItemManager actionsModule](self, "actionsModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildSectionsWithDisplayedItems:", v5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryItemManager mediaModule](self, "mediaModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buildSectionsWithDisplayedItems:", v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryItemManager durationModule](self, "durationModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v5;
  objc_msgSend(v9, "buildSectionsWithDisplayedItems:", v5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryItemManager conditionModule](self, "conditionModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buildSectionsWithDisplayedItems:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = (void *)v11;
  v43 = v13;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierEnable"));
  v15 = (void *)MEMORY[0x1E0C99D20];
  -[HUTriggerSummaryItemManager enableItem](self, "enableItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_arrayWithSafeObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItems:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierNamingSection"));
  v19 = (void *)MEMORY[0x1E0C99D20];
  -[HUTriggerSummaryItemManager namingRowItem](self, "namingRowItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_arrayWithSafeObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setItems:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierAdd"));
  v23 = (void *)MEMORY[0x1E0C99D20];
  -[HUTriggerSummaryItemManager createActionButtonItem](self, "createActionButtonItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "na_arrayWithSafeObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setItems:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierTest"));
  v27 = (void *)MEMORY[0x1E0C99D20];
  -[HUTriggerSummaryItemManager testTriggerItem](self, "testTriggerItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_arrayWithSafeObject:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setItems:", v29);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierUnsupportedItems"));
  -[HUTriggerSummaryItemManager unsupportedItemProvider](self, "unsupportedItemProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "items");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "allObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setItems:", v33);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerSummarySectionIdentifierDelete"));
  v35 = (void *)MEMORY[0x1E0C99D20];
  -[HUTriggerSummaryItemManager deleteTriggerItem](self, "deleteTriggerItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "na_arrayWithSafeObject:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setItems:", v37);

  v49[0] = v14;
  v49[1] = v18;
  v49[2] = v45;
  v49[3] = v22;
  v49[4] = v42;
  v49[5] = v46;
  v49[6] = v26;
  v49[7] = v44;
  v49[8] = v43;
  v49[9] = v30;
  v49[10] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "na_arrayByFlattening");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObjectsFromArray:", v39);

  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v48, v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTriggerSummaryItemManager;
  -[HFItemManager _itemsToHideInSet:](&v6, sel__itemsToHideInSet_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)overviewItemModules
{
  void *v2;
  void *v3;

  -[HFItemManager itemModules](self, "itemModules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_263);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __50__HUTriggerSummaryItemManager_overviewItemModules__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2890A0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)_showTriggerSummary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showTriggerSummary"))
  {
    -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStandalone") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_showEnableSwitch
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showTriggerEnableSwitch"))
  {
    -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStandalone") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_shouldShowDurationItems
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "allowDurationEditing") & 1) != 0)
  {
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsEndEvents");

    if (!v6)
      return 0;
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "areActionsAffectedByEndEvents");
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)_isInEditMode
{
  void *v2;
  char v3;

  -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSingleFlow");

  return v3;
}

- (BOOL)_shouldShowTestItem
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isStandalone") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allActionBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "count") != 0;

  }
  return v4;
}

- (BOOL)_shouldShowDeleteItem
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isStandalone") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "flowState") == 3)
    {
      -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "showTriggerDeleteButton"))
      {
        -[HFItemManager home](self, "home");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v8, "hf_currentUserIsAdministrator");

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)_showActionSetsInstructionItem
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showActionSetsInstructions"))
  {
    -[HUTriggerSummaryItemManager currentFlow](self, "currentFlow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isStandalone") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_unsupportedTriggers
{
  void *v2;
  void *v3;
  void *v4;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsupportedTriggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_triggerTestActionsInstructionDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "testActionsInstructionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_triggerServiceActionsInstructionDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceActionsInstructionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_triggerDeleteInstructionItemString
{
  void *v2;
  void *v3;
  void *v4;

  -[HUTriggerSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteInstructionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HUTriggerActionFlow)currentFlow
{
  return self->_currentFlow;
}

- (void)setCurrentFlow:(id)a3
{
  objc_storeStrong((id *)&self->_currentFlow, a3);
}

- (HFItem)enableItem
{
  return self->_enableItem;
}

- (void)setEnableItem:(id)a3
{
  objc_storeStrong((id *)&self->_enableItem, a3);
}

- (HFItem)testTriggerItem
{
  return self->_testTriggerItem;
}

- (void)setTestTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_testTriggerItem, a3);
}

- (HFItem)createActionButtonItem
{
  return self->_createActionButtonItem;
}

- (void)setCreateActionButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_createActionButtonItem, a3);
}

- (HFItem)deleteTriggerItem
{
  return self->_deleteTriggerItem;
}

- (void)setDeleteTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteTriggerItem, a3);
}

- (HFStaticItem)namingRowItem
{
  return self->_namingRowItem;
}

- (void)setNamingRowItem:(id)a3
{
  objc_storeStrong((id *)&self->_namingRowItem, a3);
}

- (HUTriggerEventsItemModule)eventsModule
{
  return self->_eventsModule;
}

- (void)setEventsModule:(id)a3
{
  objc_storeStrong((id *)&self->_eventsModule, a3);
}

- (HUTriggerDurationItemModule)durationModule
{
  return self->_durationModule;
}

- (void)setDurationModule:(id)a3
{
  objc_storeStrong((id *)&self->_durationModule, a3);
}

- (HUTriggerActionSetsItemModule)actionsModule
{
  return self->_actionsModule;
}

- (void)setActionsModule:(id)a3
{
  objc_storeStrong((id *)&self->_actionsModule, a3);
}

- (HUTriggerMediaItemModule)mediaModule
{
  return self->_mediaModule;
}

- (void)setMediaModule:(id)a3
{
  objc_storeStrong((id *)&self->_mediaModule, a3);
}

- (HFStaticItemProvider)unsupportedItemProvider
{
  return self->_unsupportedItemProvider;
}

- (void)setUnsupportedItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedItemProvider, a3);
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (void)setConditionModule:(id)a3
{
  objc_storeStrong((id *)&self->_conditionModule, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_unsupportedItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaModule, 0);
  objc_storeStrong((id *)&self->_actionsModule, 0);
  objc_storeStrong((id *)&self->_durationModule, 0);
  objc_storeStrong((id *)&self->_eventsModule, 0);
  objc_storeStrong((id *)&self->_namingRowItem, 0);
  objc_storeStrong((id *)&self->_deleteTriggerItem, 0);
  objc_storeStrong((id *)&self->_createActionButtonItem, 0);
  objc_storeStrong((id *)&self->_testTriggerItem, 0);
  objc_storeStrong((id *)&self->_enableItem, 0);
  objc_storeStrong((id *)&self->_currentFlow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_prioritizedAccessories, 0);
}

@end
