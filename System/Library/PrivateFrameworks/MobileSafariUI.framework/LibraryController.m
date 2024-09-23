@implementation LibraryController

- (LibraryViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (void)setSidebarUIProxy:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarUIProxy, a3);
}

- (LibraryController)initWithConfiguration:(id)a3
{
  id v5;
  LibraryController *v6;
  LibraryController *v7;
  LibraryController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LibraryController;
  v6 = -[LibraryController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (void)reloadExpansionStateForTabGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  LibraryController *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[LibraryViewController sectionControllers](self->_sidebarViewController, "sectionControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v22 = self;
    v24 = v5;
    v20 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      v21 = v7;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v23 = v10;
          objc_msgSend(v10, "filteredItemControllers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v26;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v26 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v16, "tab");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v17)
                  {

                  }
                  else
                  {
                    objc_msgSend(v16, "tabGroup");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = objc_msgSend(v4, "isEqual:", v18);

                    if ((v19 & 1) != 0)
                    {
                      -[LibraryViewController reloadExpansionStateForItem:inSection:](v22->_sidebarViewController, "reloadExpansionStateForItem:inSection:", v16, v23);

                      v5 = v24;
                      goto LABEL_23;
                    }
                  }
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v13)
                continue;
              break;
            }
          }

          v5 = v24;
          v8 = v20;
          v7 = v21;
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }
LABEL_23:

}

- (void)_updateSidebarButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  LibraryViewController *v7;
  void *v8;
  id v9;

  -[SidebarUIProxy leadingSidebarButtonItem](self->_sidebarUIProxy, "leadingSidebarButtonItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[LibraryViewController navigationItem](self->_sidebarViewController, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v9);

  -[SidebarUIProxy trailingSidebarButtonItem](self->_sidebarUIProxy, "trailingSidebarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryViewController navigationItem](self->_sidebarViewController, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  -[LibraryViewController navigationController](self->_sidebarViewController, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (LibraryViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 != self->_sidebarViewController)
  {
    -[LibraryViewController navigationItem](v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v9);

  }
}

- (void)setSidebarViewController:(id)a3
{
  LibraryViewController *v5;
  LibraryViewController *sidebarViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MainLibrarySectionController *v12;
  TabGroupLibrarySectionController *v13;
  TabGroupLibrarySectionController *v14;
  SharedWithYouSectionController *v15;
  ProfilesSectionController *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *itemsByCollection;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v5 = (LibraryViewController *)a3;
  sidebarViewController = self->_sidebarViewController;
  if (sidebarViewController != v5)
  {
    -[LibraryViewController navigationController](sidebarViewController, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    -[LibraryViewController setDelegate:](self->_sidebarViewController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_sidebarViewController, a3);
    -[LibraryController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LibraryViewController setConfiguration:](self->_sidebarViewController, "setConfiguration:", v8);

    -[LibraryViewController setDelegate:](self->_sidebarViewController, "setDelegate:", self);
    -[LibraryViewController navigationController](self->_sidebarViewController, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[LibraryViewController navigationController](self->_sidebarViewController, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrefersLargeTitles:", 1);

    v12 = -[MainLibrarySectionController initWithConfiguration:]([MainLibrarySectionController alloc], "initWithConfiguration:", self->_configuration);
    objc_storeWeak((id *)&self->_mainLibrarySectionController, v12);
    v13 = -[TabGroupLibrarySectionController initWithConfiguration:forNamedGroups:]([TabGroupLibrarySectionController alloc], "initWithConfiguration:forNamedGroups:", self->_configuration, 0);
    v30[0] = v13;
    v14 = -[TabGroupLibrarySectionController initWithConfiguration:forNamedGroups:]([TabGroupLibrarySectionController alloc], "initWithConfiguration:forNamedGroups:", self->_configuration, 1);
    v30[1] = v14;
    v30[2] = v12;
    v15 = -[SharedWithYouSectionController initWithConfiguration:]([SharedWithYouSectionController alloc], "initWithConfiguration:", self->_configuration);
    v30[3] = v15;
    v16 = -[ProfilesSectionController initWithConfiguration:]([ProfilesSectionController alloc], "initWithConfiguration:", self->_configuration);
    v30[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LibraryViewController setSectionControllers:](self->_sidebarViewController, "setSectionControllers:", v17);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    itemsByCollection = self->_itemsByCollection;
    self->_itemsByCollection = v18;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[LibraryViewController sectionControllers](self->_sidebarViewController, "sectionControllers", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v26;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24++), "registerItemsWithRegistration:", self);
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v22);
    }

    -[LibraryController _updateSidebarButton](self, "_updateSidebarButton");
  }

}

- (NSString)currentCollection
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  int v14;
  NSMutableDictionary *itemsByCollection;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  -[LibraryViewController presentedItemController](self->_sidebarViewController, "presentedItemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[LibraryViewController selectedItemController](self->_sidebarViewController, "selectedItemController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForLastSelectedItemController);
  v8 = objc_loadWeakRetained((id *)&self->_lastSelectedItemController);
  v9 = v8;
  if (v6)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (!v10 && WeakRetained != 0)
  {
    -[LibraryViewController navigationController](self->_sidebarViewController, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", WeakRetained);

    if (v14)
      v6 = v9;
    else
      v6 = 0;
  }
  itemsByCollection = self->_itemsByCollection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __38__LibraryController_currentCollection__block_invoke;
  v20[3] = &unk_1E9CF62B8;
  v21 = v6;
  v16 = v6;
  -[NSMutableDictionary keysOfEntriesPassingTest:](itemsByCollection, "keysOfEntriesPassingTest:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

uint64_t __38__LibraryController_currentCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)setCurrentCollection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[LibraryController currentCollection](self, "currentCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByCollection, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LibraryViewController setSelectedItemController:](self->_sidebarViewController, "setSelectedItemController:", v6);

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  LibraryViewController *v9;
  _BOOL8 v10;
  id WeakRetained;
  LibraryViewController *v12;
  LibraryViewController *v13;

  v13 = (LibraryViewController *)a4;
  v7 = a3;
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (LibraryViewController *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == v13;

  objc_msgSend(v7, "setToolbarHidden:animated:", v10, 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mainLibrarySectionController);
    objc_msgSend(WeakRetained, "updateToolbarIfNeeded");

  }
  -[LibraryController _updateSidebarButton](self, "_updateSidebarButton");
  v12 = v13;
  if (self->_sidebarViewController == v13)
  {
    -[LibraryViewController setPresentedItemController:](v13, "setPresentedItemController:", 0);
    v12 = v13;
  }

}

- (void)registerItem:(id)a3 forCollectionType:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsByCollection, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)libraryViewController:(id)a3 didSelectItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  id obj;

  obj = a4;
  objc_msgSend(obj, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_storeWeak((id *)&self->_lastSelectedItemController, obj);
    objc_storeWeak((id *)&self->_viewControllerForLastSelectedItemController, v5);
    -[LibraryViewController navigationController](self->_sidebarViewController, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v5)
    {
      v11 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 1);
    }
    else
    {
      objc_msgSend(v6, "viewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v5);

      if (v9)
      {
        v10 = (id)objc_msgSend(v6, "popToViewController:animated:", v5, 0);
      }
      else
      {
        objc_msgSend(v6, "viewControllers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count") == 1;

        v14 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 0);
        objc_msgSend(v6, "pushViewController:animated:", v5, v13);
      }
    }
    -[LibraryController _reportSelectedItemForAnalytics:](self, "_reportSelectedItemForAnalytics:", obj);

  }
  else
  {
    objc_msgSend(obj, "didSelectItem");
  }

}

- (void)_reportSelectedItemForAnalytics:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 6;
LABEL_7:
    objc_msgSend(v3, "didUseSidebarAction:", v5);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 7;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 10;
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)libraryViewController:(id)a3 shouldPersistSelectionForItem:(id)a4
{
  return objc_msgSend(a4, "shouldPersistSelection", a3);
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (SidebarUIProxy)sidebarUIProxy
{
  return self->_sidebarUIProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_sidebarUIProxy, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_mainLibrarySectionController);
  objc_destroyWeak((id *)&self->_viewControllerForLastSelectedItemController);
  objc_destroyWeak((id *)&self->_lastSelectedItemController);
  objc_storeStrong((id *)&self->_itemsByCollection, 0);
}

@end
