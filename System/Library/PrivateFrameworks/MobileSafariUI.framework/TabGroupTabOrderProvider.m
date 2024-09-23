@implementation TabGroupTabOrderProvider

- (TabGroupTabOrderProvider)initWithTabGroup:(id)a3
{
  id v5;
  TabGroupTabOrderProvider *v6;
  TabGroupTabOrderProvider *v7;
  TabGroupTabOrderProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TabGroupTabOrderProvider;
  v6 = -[TabGroupTabOrderProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabGroup, a3);
    v8 = v7;
  }

  return v7;
}

- (id)wbTabForOrderedTab:(id)a3
{
  id v4;
  void *v5;
  WBTabGroup *tabGroup;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "tab");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    tabGroup = self->_tabGroup;
    objc_msgSend(v4, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();

    -[WBTabGroup tabWithUUID:](tabGroup, "tabWithUUID:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v7;
  }

  return v5;
}

- (id)orderedTabsForTabs:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_47);
}

OrderedWBTabWrapper *__47__TabGroupTabOrderProvider_orderedTabsForTabs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  OrderedWBTabWrapper *v3;

  v2 = a2;
  v3 = -[OrderedWBTabWrapper initWithWBTab:]([OrderedWBTabWrapper alloc], "initWithWBTab:", v2);

  return v3;
}

- (unint64_t)indexForTab:(id)a3
{
  WBTabGroup *tabGroup;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  tabGroup = self->_tabGroup;
  v5 = a3;
  -[WBTabGroup tabs](tabGroup, "tabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabGroupTabOrderProvider wbTabForOrderedTab:](self, "wbTabForOrderedTab:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "indexOfObject:", v7);
  return v8;
}

- (unint64_t)indexOfSelectedTab
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[WBTabGroup tabs](self->_tabGroup, "tabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabGroupTabOrderProvider selectedTabForTabOrderProvider](self, "selectedTabForTabOrderProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabGroupTabOrderProvider wbTabForOrderedTab:](self, "wbTabForOrderedTab:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "indexOfObject:", v5);

  return v6;
}

- (unint64_t)numberOfTabs
{
  void *v2;
  unint64_t v3;

  -[WBTabGroup tabs](self->_tabGroup, "tabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)originatingTabForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OrderedWBTabWrapper *v7;
  void *v8;
  OrderedWBTabWrapper *v9;

  v4 = a3;
  if (objc_msgSend(v4, "shouldSelectOriginatingTabWhenClosed"))
  {
    objc_msgSend(v4, "ancestorTabIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [OrderedWBTabWrapper alloc];
      -[WBTabGroup tabWithUUID:](self->_tabGroup, "tabWithUUID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[OrderedWBTabWrapper initWithWBTab:](v7, "initWithWBTab:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WBSOrderedTab)selectedTabForTabOrderProvider
{
  WBTabGroup *v2;
  OrderedWBTabWrapper *v3;
  void *v4;
  void *v5;
  OrderedWBTabWrapper *v6;

  v2 = self->_tabGroup;
  v3 = [OrderedWBTabWrapper alloc];
  -[WBTabGroup lastSelectedTabUUID](v2, "lastSelectedTabUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup tabWithUUID:](v2, "tabWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[OrderedWBTabWrapper initWithWBTab:](v3, "initWithWBTab:", v5);
  return (WBSOrderedTab *)v6;
}

- (id)tabAtIndex:(unint64_t)a3
{
  OrderedWBTabWrapper *v5;
  void *v6;
  void *v7;
  OrderedWBTabWrapper *v8;

  v5 = [OrderedWBTabWrapper alloc];
  -[WBTabGroup tabs](self->_tabGroup, "tabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OrderedWBTabWrapper initWithWBTab:](v5, "initWithWBTab:", v7);

  return v8;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_overrideActiveTabGroupUUID, 0);
}

@end
