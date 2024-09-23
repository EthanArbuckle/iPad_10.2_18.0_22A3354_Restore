@implementation HUTriggerDurationItemModule

- (HUTriggerDurationItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUTriggerDurationItemModule *v8;
  HUTriggerDurationItemModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerDurationItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);

  return v9;
}

- (id)_staticItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D31940]);
  -[HUTriggerDurationItemModule triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTriggerBuilder:", v5);
  -[HUTriggerDurationItemModule setDurationSummaryItem:](self, "setDurationSummaryItem:", v6);

  -[HUTriggerDurationItemModule durationSummaryItem](self, "durationSummaryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v7);

  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D31840]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __43__HUTriggerDurationItemModule__staticItems__block_invoke;
  v15 = &unk_1E6F4C4E8;
  objc_copyWeak(&v16, &location);
  v9 = (void *)objc_msgSend(v8, "initWithResultsBlock:", &v12);
  -[HUTriggerDurationItemModule setDurationPickerItem:](self, "setDurationPickerItem:", v9, v12, v13, v14, v15);

  -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v3;
}

id __43__HUTriggerDurationItemModule__staticItems__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v9 = *MEMORY[0x1E0D30D70];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(WeakRetained, "_shouldShowDurationItems"))
    v4 = objc_msgSend(WeakRetained, "durationPickerShown") ^ 1;
  else
    v4 = 1;
  objc_msgSend(v3, "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v4;
  NSSet *v5;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    -[HUTriggerDurationItemModule _buildItemProviders](self, "_buildItemProviders");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerDurationItemModuleSection"));
  -[HUTriggerDurationItemModule durationSummaryItem](self, "durationSummaryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HUTriggerDurationItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v14[3] = &unk_1E6F504A0;
  v14[4] = self;
  __63__HUTriggerDurationItemModule_buildSectionsWithDisplayedItems___block_invoke((uint64_t)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFooterTitle:", v11);

  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __63__HUTriggerDurationItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;

  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_supportsSharedEventAutomation");

  if ((v4 & 1) == 0)
  {
    v20 = CFSTR("HUTriggerSummaryDurationUpdateHomeHubFooter");
LABEL_6:
    _HULocalizedStringWithDefaultValue(v20, v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    return v19;
  }
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "designatedDurationEventBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v20 = CFSTR("HUTriggerSummaryDurationNotSetFooter");
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1E0CBA4D0];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "designatedDurationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duration");
  objc_msgSend(v8, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_naturalLanguageTurnOffAfterDuration:style:", v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HULocalizedStringWithFormat(CFSTR("HUTriggerSummaryDurationSetFooterFormat"), CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setDurationPickerShown:(BOOL)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  if (self->_durationPickerShown != a3)
  {
    self->_durationPickerShown = a3;
    -[HFItemModule allItems](self, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0D314C0];
      v9 = (void *)MEMORY[0x1E0C99E60];
      -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestToUpdateItems:senderSelector:", v11, a2);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[HFItemModule itemUpdater](self, "itemUpdater");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "performItemUpdateRequest:", v14);

    }
  }
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HUTriggerDurationItemModule durationPickerShown](self, "durationPickerShown")
    || !-[HUTriggerDurationItemModule _shouldShowDurationItems](self, "_shouldShowDurationItems"))
  {
    -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "containsObject:", v8);

      if (v9)
      {
        -[HUTriggerDurationItemModule durationPickerItem](self, "durationPickerItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

      }
    }
  }

  return v5;
}

- (BOOL)_shouldShowDurationItems
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;

  -[HUTriggerDurationItemModule triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "allowDurationEditing") & 1) != 0)
  {
    -[HUTriggerDurationItemModule triggerBuilder](self, "triggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsEndEvents");

    if (!v6)
      return 0;
    -[HUTriggerDurationItemModule triggerBuilder](self, "triggerBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "areActionsAffectedByEndEvents");
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D31848]);
  -[HUTriggerDurationItemModule _staticItems](self, "_staticItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithItems:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HFItemManager)itemManager
{
  return (HFItemManager *)objc_loadWeakRetained((id *)&self->_itemManager);
}

- (void)setItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_itemManager, a3);
}

- (HFTriggerDurationSummaryItem)durationSummaryItem
{
  return self->_durationSummaryItem;
}

- (void)setDurationSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_durationSummaryItem, a3);
}

- (HFItem)durationPickerItem
{
  return self->_durationPickerItem;
}

- (void)setDurationPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_durationPickerItem, a3);
}

- (BOOL)durationPickerShown
{
  return self->_durationPickerShown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationPickerItem, 0);
  objc_storeStrong((id *)&self->_durationSummaryItem, 0);
  objc_destroyWeak((id *)&self->_itemManager);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
