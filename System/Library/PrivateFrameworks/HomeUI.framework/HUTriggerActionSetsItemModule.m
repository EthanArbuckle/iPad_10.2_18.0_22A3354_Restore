@implementation HUTriggerActionSetsItemModule

- (HUTriggerActionSetsItemModule)initWithTriggerBuilder:(id)a3 flow:(id)a4 itemUpdater:(id)a5
{
  id v9;
  id v10;
  HUTriggerActionSetsItemModule *v11;
  HUTriggerActionSetsItemModule *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTriggerActionSetsItemModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v14, sel_initWithItemUpdater_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_triggerBuilder, a3);
    objc_storeStrong((id *)&v12->_flow, a4);
  }

  return v12;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v4;
  NSSet *v5;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    -[HUTriggerActionSetsItemModule _buildItemProviders](self, "_buildItemProviders");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D31848]);
  -[HUTriggerActionSetsItemModule _staticItems](self, "_staticItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithItems:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_staticItems
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  HUShortcutItem *v15;
  void *v16;
  HUShortcutItem *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v5 = MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(v4, "initWithResults:", MEMORY[0x1E0C9AA70]);
  -[HUTriggerActionSetsItemModule setActionSetsGridItem:](self, "setActionSetsGridItem:", v6);

  -[HUTriggerActionSetsItemModule actionSetsGridItem](self, "actionSetsGridItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResults:", v5);
  -[HUTriggerActionSetsItemModule setServiceActionsGridItem:](self, "setServiceActionsGridItem:", v8);

  -[HUTriggerActionSetsItemModule serviceActionsGridItem](self, "serviceActionsGridItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResults:", v5);
  -[HUTriggerActionSetsItemModule setPrioritizedServiceActionsGridItem:](self, "setPrioritizedServiceActionsGridItem:", v10);

  -[HUTriggerActionSetsItemModule prioritizedServiceActionsGridItem](self, "prioritizedServiceActionsGridItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v11);

  -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "isShortcutOwned");

  if ((_DWORD)v9)
  {
    -[HUTriggerActionSetsItemModule flow](self, "flow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "flowState") == 3;

    v15 = [HUShortcutItem alloc];
    -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HUShortcutItem initWithTriggerBuilder:selectable:](v15, "initWithTriggerBuilder:selectable:", v16, v14);
    -[HUTriggerActionSetsItemModule setShortcutItem:](self, "setShortcutItem:", v17);

    -[HUTriggerActionSetsItemModule shortcutItem](self, "shortcutItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  return v3;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isShortcutOwned");

  if ((v7 & 1) != 0)
  {
    -[HUTriggerActionSetsItemModule actionSetsGridItem](self, "actionSetsGridItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    -[HUTriggerActionSetsItemModule serviceActionsGridItem](self, "serviceActionsGridItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    -[HUTriggerActionSetsItemModule prioritizedServiceActionsGridItem](self, "prioritizedServiceActionsGridItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);
  }
  else
  {
    -[HUTriggerActionSetsItemModule _itemsToHideForStandardTriggerInSet:](self, "_itemsToHideForStandardTriggerInSet:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v11);

    -[HUTriggerActionSetsItemModule shortcutItem](self, "shortcutItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v10);
  }

  if (!-[HUTriggerActionSetsItemModule shouldShowPrioritizedActions](self, "shouldShowPrioritizedActions"))
  {
    -[HUTriggerActionSetsItemModule prioritizedServiceActionsGridItem](self, "prioritizedServiceActionsGridItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  __CFString *v13;
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
  _QWORD v29[4];
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUTriggerActionSetsItemModuleSectionIdentifierActionSets"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerActionSetsItemModuleSectionIdentifierPrioritizedServiceActions"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerActionSetsItemModuleSectionIdentifierServiceActions"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerActionSetsItemModuleSectionIdentifierShortcuts"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryActionSetsInstructionTitle"), CFSTR("HUTriggerSummaryActionSetsInstructionTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v10);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryActionSetsInstructionDescription"), CFSTR("HUTriggerSummaryActionSetsInstructionDescription"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderSecondaryText:", v11);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryPrioritizedServiceActionsInstructionTitle_Single"), CFSTR("HUTriggerSummaryPrioritizedServiceActionsInstructionTitle_Single"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderTitle:", v12);

  if (-[HUTriggerActionSetsItemModule shouldShowPrioritizedActions](self, "shouldShowPrioritizedActions"))
    v13 = CFSTR("HUTriggerSummaryOtherServiceActionsInstructionTitle");
  else
    v13 = CFSTR("HUTriggerSummaryServiceActionsInstructionTitle");
  _HULocalizedStringWithDefaultValue(v13, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderTitle:", v14);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryShortcutsInstructionTitle"), CFSTR("HUTriggerSummaryShortcutsInstructionTitle"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeaderTitle:", v15);

  -[HUTriggerActionSetsItemModule actionSetsGridItem](self, "actionSetsGridItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v17);

  -[HUTriggerActionSetsItemModule prioritizedServiceActionsGridItem](self, "prioritizedServiceActionsGridItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v19);

  -[HUTriggerActionSetsItemModule serviceActionsGridItem](self, "serviceActionsGridItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v21);

  v22 = (void *)MEMORY[0x1E0C99D20];
  -[HUTriggerActionSetsItemModule shortcutItem](self, "shortcutItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_arrayWithSafeObject:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v24);

  v25 = (void *)MEMORY[0x1E0D314B0];
  v29[0] = v6;
  v29[1] = v7;
  v29[2] = v8;
  v29[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filterSections:toDisplayedItems:", v26, v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_itemsToHideForStandardTriggerInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  _QWORD v29[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "namedActionSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_filter:", &__block_literal_global_35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
  {
    -[HUTriggerActionSetsItemModule actionSetsGridItem](self, "actionSetsGridItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "containsObject:", v10);

    if (v11)
    {
      -[HUTriggerActionSetsItemModule actionSetsGridItem](self, "actionSetsGridItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
  }
  -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "triggerActionSets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anonymousActionSetBuilder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {

  }
  else
  {
    -[HUTriggerActionSetsItemModule serviceActionsGridItem](self, "serviceActionsGridItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "containsObject:", v17);

    if (!v18)
      goto LABEL_9;
    -[HUTriggerActionSetsItemModule serviceActionsGridItem](self, "serviceActionsGridItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);
  }

LABEL_9:
  if (-[HUTriggerActionSetsItemModule shouldShowPrioritizedActions](self, "shouldShowPrioritizedActions"))
  {
    -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "triggerActionSets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anonymousActionSetBuilder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "actions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69__HUTriggerActionSetsItemModule__itemsToHideForStandardTriggerInSet___block_invoke_2;
    v29[3] = &unk_1E6F4EFD8;
    v29[4] = self;
    v23 = objc_msgSend(v22, "na_any:", v29);

    if ((v23 & 1) == 0)
    {
      -[HUTriggerActionSetsItemModule serviceActionsGridItem](self, "serviceActionsGridItem");
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v27 = (void *)v24;
      objc_msgSend(v5, "addObject:", v24);

    }
  }
  else
  {
    -[HUTriggerActionSetsItemModule prioritizedServiceActionsGridItem](self, "prioritizedServiceActionsGridItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v4, "containsObject:", v25);

    if (v26)
    {
      -[HUTriggerActionSetsItemModule prioritizedServiceActionsGridItem](self, "prioritizedServiceActionsGridItem");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }

  return v5;
}

BOOL __69__HUTriggerActionSetsItemModule__itemsToHideForStandardTriggerInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __69__HUTriggerActionSetsItemModule__itemsToHideForStandardTriggerInSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "characteristic");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "prioritizedAccessoriesContainsServices:", v11);

  }
  else
  {
    objc_opt_class();
    v9 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v9;
    else
      v13 = 0;
    v14 = v13;

    if (!v14)
    {
      v9 = 0;
      v16 = 1;
      goto LABEL_12;
    }
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v14, "mediaProfiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "prioritizedAccessoriesContainsMediaProfiles:", v10);
  }
  v16 = v12 ^ 1u;

LABEL_12:
  return v16;
}

- (BOOL)prioritizedAccessoriesContainsServices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUTriggerActionSetsItemModule prioritizedAccessories](self, "prioritizedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsServices___block_invoke;
  v9[3] = &unk_1E6F4F000;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __72__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_containedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)prioritizedAccessoriesContainsMediaProfiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUTriggerActionSetsItemModule prioritizedAccessories](self, "prioritizedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke;
  v9[3] = &unk_1E6F4F000;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke_2;
  v8[3] = &unk_1E6F4EF10;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hf_containedProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "intersectsSet:", v5);
  return v6;
}

- (BOOL)shouldShowPrioritizedActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[5];

  -[HUTriggerActionSetsItemModule prioritizedAccessories](self, "prioritizedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HUTriggerActionSetsItemModule triggerBuilder](self, "triggerBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerActionSets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anonymousActionSetBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__HUTriggerActionSetsItemModule_shouldShowPrioritizedActions__block_invoke;
    v10[3] = &unk_1E6F4EFD8;
    v10[4] = self;
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __61__HUTriggerActionSetsItemModule_shouldShowPrioritizedActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "characteristic");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "prioritizedAccessoriesContainsServices:", v11);

  }
  else
  {
    objc_opt_class();
    v9 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v9;
    else
      v13 = 0;
    v14 = v13;

    if (!v14)
    {
      v9 = 0;
      v12 = 0;
      goto LABEL_12;
    }
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v14, "mediaProfiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "prioritizedAccessoriesContainsMediaProfiles:", v10);
  }

LABEL_12:
  return v12;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HUTriggerActionFlow)flow
{
  return self->_flow;
}

- (HFStaticItem)actionSetsGridItem
{
  return self->_actionSetsGridItem;
}

- (void)setActionSetsGridItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetsGridItem, a3);
}

- (HFStaticItem)serviceActionsGridItem
{
  return self->_serviceActionsGridItem;
}

- (void)setServiceActionsGridItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceActionsGridItem, a3);
}

- (HFStaticItem)prioritizedServiceActionsGridItem
{
  return self->_prioritizedServiceActionsGridItem;
}

- (void)setPrioritizedServiceActionsGridItem:(id)a3
{
  objc_storeStrong((id *)&self->_prioritizedServiceActionsGridItem, a3);
}

- (HUShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)setShortcutItem:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutItem, a3);
}

- (NSSet)prioritizedAccessories
{
  return self->_prioritizedAccessories;
}

- (void)setPrioritizedAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedAccessories, 0);
  objc_storeStrong((id *)&self->_shortcutItem, 0);
  objc_storeStrong((id *)&self->_prioritizedServiceActionsGridItem, 0);
  objc_storeStrong((id *)&self->_serviceActionsGridItem, 0);
  objc_storeStrong((id *)&self->_actionSetsGridItem, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
