@implementation HUTriggerEventsItemModule

- (HUTriggerEventsItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUTriggerEventsItemModule *v8;
  HUTriggerEventsItemModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerEventsItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
    v9->_hideAddEventButton = 0;
  }

  return v9;
}

- (id)_buildItemProviders
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HUTriggerBuilderItem *v9;
  void *v10;
  HUTriggerBuilderItem *v11;
  HUTriggerBuilderItem *triggerBuilderItem;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HUTriggerEventsItemModule triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (_os_feature_enabled_impl() && v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D313B8]), "initWithTriggerBuilder:", v6);
    -[HUTriggerEventsItemModule setTriggerEventsItemProvider:](self, "setTriggerEventsItemProvider:", v7);

    -[HUTriggerEventsItemModule triggerEventsItemProvider](self, "triggerEventsItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNameType:", 1);
  }
  else
  {
    v9 = [HUTriggerBuilderItem alloc];
    -[HUTriggerEventsItemModule triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUTriggerBuilderItem initWithTriggerBuilder:nameType:](v9, "initWithTriggerBuilder:nameType:", v10, 1);
    triggerBuilderItem = self->_triggerBuilderItem;
    self->_triggerBuilderItem = v11;

    -[HUTriggerEventsItemModule triggerBuilderItem](self, "triggerBuilderItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);
  }

  v13 = objc_alloc(MEMORY[0x1E0D31840]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__HUTriggerEventsItemModule__buildItemProviders__block_invoke;
  v22[3] = &unk_1E6F4C518;
  v22[4] = self;
  v14 = (void *)objc_msgSend(v13, "initWithResultsBlock:", v22);
  -[HUTriggerEventsItemModule setAddEventButtonItem:](self, "setAddEventButtonItem:", v14);

  -[HUTriggerEventsItemModule addEventButtonItem](self, "addEventButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v3);
  -[HUTriggerEventsItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v16);

  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerEventsItemModule staticItemProvider](self, "staticItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerEventsItemModule triggerEventsItemProvider](self, "triggerEventsItemProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObjects:", v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __48__HUTriggerEventsItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  v3 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryTriggerNewEventButtonTitle"), CFSTR("HUTriggerSummaryTriggerNewEventButtonTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = *MEMORY[0x1E0D30D70];
  v11[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  if ((objc_msgSend(*(id *)(a1 + 32), "hideAddEventButton") & 1) == 0)
    v3 = _os_feature_enabled_impl() ^ 1;
  objc_msgSend(v5, "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v4;
  NSSet *v5;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    -[HUTriggerEventsItemModule _buildItemProviders](self, "_buildItemProviders");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("triggerEventsSection"));
  -[HUTriggerEventsItemModule triggerEventsItemProvider](self, "triggerEventsItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUTriggerEventsItemModule triggerEventsItemProvider](self, "triggerEventsItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItems:", v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99D20];
    -[HUTriggerEventsItemModule triggerBuilderItem](self, "triggerBuilderItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_arrayWithSafeObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItems:", v9);
  }

  objc_msgSend(v6, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerEventsItemModule addEventButtonItem](self, "addEventButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v14);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryTriggersInstructionTitle"), CFSTR("HUTriggerSummaryTriggersInstructionTitle"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v15);

  v16 = (void *)MEMORY[0x1E0D314B0];
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterSections:toDisplayedItems:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_itemsToHideInSet:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFItem)addEventButtonItem
{
  return self->_addEventButtonItem;
}

- (void)setAddEventButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addEventButtonItem, a3);
}

- (BOOL)hideAddEventButton
{
  return self->_hideAddEventButton;
}

- (void)setHideAddEventButton:(BOOL)a3
{
  self->_hideAddEventButton = a3;
}

- (HFEventBuilderItemProvider)triggerEventsItemProvider
{
  return self->_triggerEventsItemProvider;
}

- (void)setTriggerEventsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_triggerEventsItemProvider, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HUTriggerBuilderItem)triggerBuilderItem
{
  return self->_triggerBuilderItem;
}

- (void)setTriggerBuilderItem:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilderItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilderItem, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_triggerEventsItemProvider, 0);
  objc_storeStrong((id *)&self->_addEventButtonItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
