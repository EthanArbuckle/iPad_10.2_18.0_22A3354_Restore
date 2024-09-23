@implementation HUTriggerMediaItemModule

- (HUTriggerMediaItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUTriggerMediaItemModule *v8;
  HUTriggerMediaItemModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerMediaItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);

  return v9;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  id v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = objc_alloc(MEMORY[0x1E0D31848]);
    -[HUTriggerMediaItemModule _staticItems](self, "_staticItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithItems:", v5);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_itemProviders;
    self->_itemProviders = v7;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)_staticItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__HUTriggerMediaItemModule__staticItems__block_invoke;
  v8[3] = &unk_1E6F4C518;
  v8[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v8);
  -[HUTriggerMediaItemModule setMediaRowItem:](self, "setMediaRowItem:", v5);

  -[HUTriggerMediaItemModule mediaRowItem](self, "mediaRowItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  return v3;
}

id __40__HUTriggerMediaItemModule__staticItems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymousActionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryMediaButtonTitle"), CFSTR("HUTriggerSummaryMediaButtonTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v6, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUTriggerMediaItemModuleSection"));
  -[HUTriggerMediaItemModule mediaRowItem](self, "mediaRowItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryMediaInstructionsTitle"), CFSTR("HUTriggerSummaryMediaInstructionsTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v9);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryMediaInstructionsDescription"), CFSTR("HUTriggerSummaryMediaInstructionsDescription"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderSecondaryText:", v10);

  v11 = (void *)MEMORY[0x1E0D314B0];
  v15 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filterSections:toDisplayedItems:", v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerMediaItemModule triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anonymousActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[HUTriggerMediaItemModule mediaRowItem](self, "mediaRowItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  objc_msgSend(v5, "intersectSet:", v4);

  return v5;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFItem)mediaRowItem
{
  return self->_mediaRowItem;
}

- (void)setMediaRowItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRowItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRowItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
