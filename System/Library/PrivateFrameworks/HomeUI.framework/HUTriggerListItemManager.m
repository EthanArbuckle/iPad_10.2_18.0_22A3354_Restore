@implementation HUTriggerListItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HUTriggerListSubheadlineItem *v7;
  void *v8;
  HUTriggerListSubheadlineItem *v9;
  void *v10;
  HUAddTriggerItem *v11;
  void *v12;
  HUAddTriggerItem *v13;
  void *v14;
  void *v15;
  HUTriggerItemProvider *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUTriggerUtilities preloadShortcuts](HUTriggerUtilities, "preloadShortcuts");
  v7 = [HUTriggerListSubheadlineItem alloc];
  -[HFItemManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUTriggerListSubheadlineItem initWithRemoteAccessInfo:](v7, "initWithRemoteAccessInfo:", v8);
  -[HUTriggerListItemManager setSubheadlineItem:](self, "setSubheadlineItem:", v9);

  -[HUTriggerListItemManager subheadlineItem](self, "subheadlineItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  v11 = [HUAddTriggerItem alloc];
  -[HFItemManager home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HUAddTriggerItem initWithHome:mode:](v11, "initWithHome:mode:", v12, 0);
  -[HUTriggerListItemManager setAddTriggerItem:](self, "setAddTriggerItem:", v13);

  -[HUTriggerListItemManager addTriggerItem](self, "addTriggerItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v6);
  v16 = -[HUTriggerItemProvider initWithHome:]([HUTriggerItemProvider alloc], "initWithHome:", v5);

  -[HUTriggerItemProvider setUsesRichIconDescriptors:](v16, "setUsesRichIconDescriptors:", 1);
  -[HUTriggerItemProvider setFilter:](v16, "setFilter:", &__block_literal_global_246);
  v19[0] = v15;
  v19[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __55__HUTriggerListItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "hf_shouldDisplayTrigger");
  return v6;
}

- (unint64_t)_numberOfSections
{
  void *v2;
  unint64_t v3;

  -[HUTriggerListItemManager _currentSectionIdentifiers](self, "_currentSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v7;

  if (a3 < 4)
    return off_1E6F5D7D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerListItemManager.m"), 78, CFSTR("Couldn't find an identifier for section: %lu"), a3);

  return 0;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  char v10;
  void *v11;

  v5 = a3;
  -[HUTriggerListItemManager subheadlineItem](self, "subheadlineItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("HOTriggerListSectionIdentifierSubheadline");
  }
  else
  {
    -[HUTriggerListItemManager addTriggerItem](self, "addTriggerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      v8 = CFSTR("HOTriggerListSectionIdentifierAddTrigger");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = CFSTR("HOTriggerListSectionIdentifierTriggers");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerListItemManager.m"), 90, CFSTR("Couldn't find a section for item: %@"), v5);

        v8 = 0;
      }
    }
  }

  return (id)v8;
}

- (id)_currentSectionIdentifiers
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5[0] = CFSTR("HOTriggerListSectionIdentifierHeadline");
  v5[1] = CFSTR("HOTriggerListSectionIdentifierSubheadline");
  v5[2] = CFSTR("HOTriggerListSectionIdentifierTriggers");
  v5[3] = CFSTR("HOTriggerListSectionIdentifierAddTrigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

- (HUTriggerListSubheadlineItem)subheadlineItem
{
  return self->_subheadlineItem;
}

- (void)setSubheadlineItem:(id)a3
{
  objc_storeStrong((id *)&self->_subheadlineItem, a3);
}

- (HUAddTriggerItem)addTriggerItem
{
  return self->_addTriggerItem;
}

- (void)setAddTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_addTriggerItem, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HUTriggerItemProvider)triggerItemProvider
{
  return self->_triggerItemProvider;
}

- (void)setTriggerItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_triggerItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_addTriggerItem, 0);
  objc_storeStrong((id *)&self->_subheadlineItem, 0);
}

@end
