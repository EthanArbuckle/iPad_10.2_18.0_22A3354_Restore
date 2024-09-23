@implementation HUItemCollectionViewController

uint64_t __73__HUItemCollectionViewController_cleanupRecentlyRemovedModuleControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "moduleIdentifier");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (id)_layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[6];

  v6 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__HUItemCollectionViewController__layoutSectionForSection_layoutEnvironment___block_invoke;
  v15[3] = &unk_1E6F59850;
  v15[4] = self;
  v15[5] = a3;
  __77__HUItemCollectionViewController__layoutSectionForSection_layoutEnvironment___block_invoke((uint64_t)v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedSectionIdentifierForSectionIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "collectionLayoutSectionForSectionWithIdentifier:layoutEnvironment:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[HUItemCollectionViewController layoutSectionForSection:layoutEnvironment:](self, "layoutSectionForSection:layoutEnvironment:", a3, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

id __77__HUItemCollectionViewController__layoutSectionForSection_layoutEnvironment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedItemsInSection:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  _QWORD v25[8];

  v6 = a4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__HUItemCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v25[3] = &unk_1E6F59878;
  v25[4] = v9;
  v10 = v8;
  v25[5] = v10;
  v25[6] = self;
  v11 = v6;
  v25[7] = v11;
  v12 = (objc_class *)__72__HUItemCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke((uint64_t)v25);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemCollectionViewController.m"), 589, CFSTR("No cell class specified for item: %@"), v10);

  }
  -[HUItemCollectionViewController registeredCellClasses](self, "registeredCellClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v12);

  if ((v14 & 1) == 0)
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", v12, v16);

    -[HUItemCollectionViewController registeredCellClasses](self, "registeredCellClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

  }
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EF2424C8))
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;
  objc_msgSend(v22, "setItem:", v10);
  -[HUItemCollectionViewController _routeUpdateForCell:forItem:](self, "_routeUpdateForCell:forItem:", v20, v10);
  objc_msgSend(v22, "updateUIWithAnimation:", 0);

  return v20;
}

- (void)_routeUpdateForCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HUItemCollectionViewController _performStandardUpdateForCell:forItem:](self, "_performStandardUpdateForCell:forItem:", v7, v6);
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = self;
  objc_msgSend(v8, "configureCell:forItem:", v7, v6);

}

- (void)_performStandardUpdateForCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  void *v20;
  HUItemCollectionViewController *v21;
  HUItemCollectionViewController *v22;
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
  id v33;
  id v34;

  v34 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v34;
    v8 = -[HUItemCollectionViewController automaticDisablingReasonsForItem:](self, "automaticDisablingReasonsForItem:", v6);
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

    if ((v11 & 1) != 0)
    {
      LODWORD(v12) = 0;
    }
    else
    {
      objc_msgSend(v6, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CE8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        LODWORD(v12) = objc_msgSend(v14, "BOOLValue");
      else
        v12 = (v8 >> 1) & 1;

    }
    objc_msgSend(v6, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v7, "setDisabled:", v17 | v12);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v6))
  {
    v18 = v34;
    -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v6);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (HUItemCollectionViewController *)v19;
    else
      v21 = self;
    v22 = v21;

    objc_msgSend(v18, "textField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController defaultTextForTextField:item:](v22, "defaultTextForTextField:item:", v23, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "textField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController currentTextForTextField:item:](v22, "currentTextForTextField:item:", v25, v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "textField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController placeholderTextForTextField:item:](v22, "placeholderTextForTextField:item:", v27, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "textField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPlaceholder:", v28);

    if (v26)
      v30 = v26;
    else
      v30 = v24;
    objc_msgSend(v18, "textField");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

    objc_msgSend(v18, "textField");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setAutocapitalizationType:", 1);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v33 = v34;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v33, "setResizingDelegate:", self);

  }
}

- (void)cleanupRecentlyRemovedModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  HUItemCollectionViewController *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HUItemCollectionViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allDisplayedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_188);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v4;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  v11 = v8;
  if (!v9)
  {
LABEL_15:

    goto LABEL_16;
  }
  v12 = v9;
  v13 = 0;
  v14 = *(_QWORD *)v26;
  *(_QWORD *)&v10 = 138412802;
  v24 = v10;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v26 != v14)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v16, "moduleIdentifier", v24, (_QWORD)v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v7, "containsObject:", v17);

      if ((v18 & 1) == 0)
      {
        HFLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "moduleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v30 = self;
          v31 = 2112;
          v32 = v16;
          v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@: Finishing removal of module controller %@ (%@) because no items refer to it anymore", buf, 0x20u);

        }
        -[HUItemCollectionViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v16);

        v13 = 1;
      }
    }
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  }
  while (v12);

  if ((v13 & 1) != 0)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HUItemCollectionViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "na_map:", &__block_literal_global_191);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: Module controllers awaiting removal remaining: %@", buf, 0x16u);

    }
    goto LABEL_15;
  }
LABEL_16:

}

- (id)moduleControllerForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HUItemCollectionViewController itemModuleControllers](self, "itemModuleControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HUItemCollectionViewController_moduleControllerForItem___block_invoke;
  v11[3] = &unk_1E6F59928;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableSet)recentlyRemovedItemModuleControllers
{
  return self->_recentlyRemovedItemModuleControllers;
}

- (id)itemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (NSMutableSet)registeredCellClasses
{
  return self->_registeredCellClasses;
}

id __72__HUItemCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (!v2 || (v3 = (void *)objc_msgSend(v2, "collectionCellClassForItem:", *(_QWORD *)(a1 + 40))) == 0)
    v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "cellClassForItem:indexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return v3;
}

id __64__HUItemCollectionViewController__prioritizeIconPreloadIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 1;
}

id __75__HUItemCollectionViewController__displayedPackageIconDescriptorsForItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v2, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v6 = v9;

  }
  return v6;
}

- (BOOL)shouldPerformUpdateWithAnimationForDiffableDataItemManager:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUItemCollectionViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)itemManager:(id)a3 didUpdateItemModules:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  HUItemCollectionViewController *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUItemCollectionViewController itemModuleControllers](self, "itemModuleControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_173);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D317F0];
  v34 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v7;
  objc_msgSend(v8, "diffFromSet:toSet:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v10, "additions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  v13 = &OBJC_IVAR___HUMatterHomeConnectedEcosystemItemProvider__home;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[HUItemCollectionViewController buildItemModuleControllerForModule:](self, "buildItemModuleControllerForModule:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "setHost:", self);
          objc_msgSend(v19, "setHostType:", 2);
          -[NSMutableSet addObject:](self->_internalItemModuleControllers, "addObject:", v19);
        }
        else
        {
          NSLog(CFSTR("No module controller provided for item module %@ in HUItemCollectionViewController subclass %@!"), v17, self);
        }

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v14);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v10, "deletions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        v25 = v13[987];
        v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __67__HUItemCollectionViewController_itemManager_didUpdateItemModules___block_invoke_2;
        v36[3] = &unk_1E6F59928;
        v36[4] = v24;
        objc_msgSend(v26, "na_firstObjectPassingTest:", v36);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = v13;
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v25), "removeObject:", v27);
          HFLogForCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "moduleIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v46 = self;
            v47 = 2112;
            v48 = v27;
            v49 = 2112;
            v50 = v30;
            _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@: Starting removal of module controller %@ (%@) because module was deleted. Adding to recently removed for safety", buf, 0x20u);

          }
          -[NSMutableSet addObject:](self->_recentlyRemovedItemModuleControllers, "addObject:", v27);
          v13 = v28;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v21);
  }

  objc_msgSend(v10, "additions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNeedsLayout");

  }
}

uint64_t __58__HUItemCollectionViewController_moduleControllerForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsItem:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "moduleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "moduleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  return v5;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUItemCollectionViewController;
  -[HUCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v19, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, v9);
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF258718))
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && -[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v11))
    {
      v12 = v8;
      objc_msgSend(v12, "textField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      -[HUItemCollectionViewController textFieldToCellMap](self, "textFieldToCellMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v12, v15);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = v8;
    if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF2652F8))
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "reclaimIconIfPossible");
  }

}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v8;
  _QWORD v9[5];

  v8 = a4;
  -[HUItemCollectionViewController itemManagerDidUpdate:](self, "itemManagerDidUpdate:", a3);
  -[HUItemCollectionViewController cleanupRecentlyRemovedModuleControllers](self, "cleanupRecentlyRemovedModuleControllers");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__HUItemCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v9[3] = &unk_1E6F51390;
  v9[4] = self;
  objc_msgSend(v8, "na_each:", v9);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUItemCollectionViewController;
  -[HUItemCollectionViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (-[HUItemCollectionViewController wantsPreferredContentSize](self, "wantsPreferredContentSize"))
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSize");
    -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](self, "preferredContentSizeForCollectionViewContentSize:");
    -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
  -[HUItemCollectionViewController _prioritizeIconPreloadIfNeeded](self, "_prioritizeIconPreloadIfNeeded");
}

- (void)itemManagerDidUpdate:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[HUItemCollectionViewController wantsPreferredContentSize](self, "wantsPreferredContentSize", a3))
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentSize");
    -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](self, "preferredContentSizeForCollectionViewContentSize:");
    -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
  if (!-[HUItemCollectionViewController hasFinishedInitialLoad](self, "hasFinishedInitialLoad"))
  {
    -[HUItemCollectionViewController setHasFinishedInitialLoad:](self, "setHasFinishedInitialLoad:", 1);
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: finished initial load", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (BOOL)wantsPreferredContentSize
{
  return self->_wantsPreferredContentSize;
}

- (BOOL)hasFinishedInitialLoad
{
  return self->_hasFinishedInitialLoad;
}

- (void)_prioritizeIconPreloadIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  if (!-[HUItemCollectionViewController iconPreloadIsPrioritized](self, "iconPreloadIsPrioritized"))
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[HUItemCollectionViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathsForVisibleItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__HUItemCollectionViewController__prioritizeIconPreloadIfNeeded__block_invoke;
      v12[3] = &unk_1E6F52650;
      v12[4] = self;
      objc_msgSend(v7, "na_map:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemCollectionViewController _displayedPackageIconDescriptorsForItems:](self, "_displayedPackageIconDescriptorsForItems:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D33708], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "prioritizeIconDescriptors:", v10);

      -[HUItemCollectionViewController setIconPreloadIsPrioritized:](self, "setIconPreloadIsPrioritized:", 1);
    }
  }
}

- (BOOL)iconPreloadIsPrioritized
{
  return self->_iconPreloadIsPrioritized;
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController _routeUpdateForCell:forItem:](self, "_routeUpdateForCell:forItem:", v10, v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "updateUIWithAnimation:", 1);

}

void __94__HUItemCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItem:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_routeUpdateForCell:forItem:", v6, v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "updateUIWithAnimation:", 1);
  }

}

- (void)setIconPreloadIsPrioritized:(BOOL)a3
{
  self->_iconPreloadIsPrioritized = a3;
}

- (void)setHasFinishedInitialLoad:(BOOL)a3
{
  self->_hasFinishedInitialLoad = a3;
}

id __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
    v11 = WeakRetained == 0;
  else
    v11 = 0;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 48);
    v19 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, 0, CFSTR("HUItemCollectionViewController.m"), 157, CFSTR("attempting to get cell for item: %@ in itemManager: %@ type: %@ for collectionView: %@ when the collectionViewController: %@ has dealloc already type: %@"), v9, v19, *(_QWORD *)(a1 + 56), v7, 0, *(_QWORD *)(a1 + 64));

  }
  objc_msgSend(WeakRetained, "collectionView:cellForItemAtIndexPath:", v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 40));
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413570;
      v21 = v9;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = WeakRetained;
      _os_log_fault_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_FAULT, "Failed to get cell for item: %@ at index %@ in itemManager: %@ type: %@ for collectionView: %@ collectionViewController: %@", buf, 0x3Eu);

    }
    v12 = objc_alloc_init(MEMORY[0x1E0CEA468]);
  }

  return v12;
}

id __78__HUItemCollectionViewController_initUsingCompositionalLayoutWithItemManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_layoutSectionForSection:layoutEnvironment:", a2, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!WeakRetained || v7)
  {
    if (v7)
      goto LABEL_8;
  }
  else
  {
    NSLog(CFSTR("%@ (nonnull) returned nil section for index %lu. This is a programming error"), WeakRetained, a2);
  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = WeakRetained;
    v17 = 2048;
    v18 = a2;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@ produced nil section; self=%@ sectionIndex=%lu",
      buf,
      0x20u);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithListConfiguration:layoutEnvironment:", v11, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (void)diffableDataItemManager:(id)a3 prefetchResourcesForItems:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard") & 1) == 0)
    -[HUItemCollectionViewController _preloadIconsIfNeededWithItems:](self, "_preloadIconsIfNeededWithItems:", v5);

}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  HUItemCollectionViewController *v10;
  HUItemCollectionViewController *v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0CEA428]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__HUItemCollectionViewController_initUsingCompositionalLayoutWithItemManager___block_invoke;
  v14[3] = &unk_1E6F596D8;
  objc_copyWeak(&v16, &location);
  v8 = v6;
  v15 = v8;
  v9 = (void *)objc_msgSend(v7, "initWithSectionProvider:", v14);
  v13.receiver = self;
  v13.super_class = (Class)HUItemCollectionViewController;
  v10 = -[HUCollectionViewController initWithCollectionViewLayout:](&v13, sel_initWithCollectionViewLayout_, v9);
  v11 = v10;
  if (v10)
    -[HUItemCollectionViewController _commonInitWithItemManager:](v10, "_commonInitWithItemManager:", v4);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_commonInitWithItemManager:(id)a3
{
  NSMutableArray *v5;
  NSMutableArray *foregroundUpdateFutures;
  NSMutableArray *v7;
  NSMutableArray *viewVisibleFutures;
  NSMutableSet *v9;
  NSMutableSet *registeredCellClasses;
  NSMutableSet *v11;
  NSMutableSet *internalItemModuleControllers;
  NSMutableSet *v13;
  NSMutableSet *recentlyRemovedItemModuleControllers;
  NSMapTable *v15;
  NSMapTable *textFieldToCellMap;
  void *v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_itemManager, a3);
  -[HFItemManager setDelegate:](self->_itemManager, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  foregroundUpdateFutures = self->_foregroundUpdateFutures;
  self->_foregroundUpdateFutures = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  viewVisibleFutures = self->_viewVisibleFutures;
  self->_viewVisibleFutures = v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  registeredCellClasses = self->_registeredCellClasses;
  self->_registeredCellClasses = v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  internalItemModuleControllers = self->_internalItemModuleControllers;
  self->_internalItemModuleControllers = v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  recentlyRemovedItemModuleControllers = self->_recentlyRemovedItemModuleControllers;
  self->_recentlyRemovedItemModuleControllers = v13;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  textFieldToCellMap = self->_textFieldToCellMap;
  self->_textFieldToCellMap = v15;

  self->_iconPreloadIsPrioritized = 0;
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:", self);

  if (!objc_msgSend((id)objc_opt_class(), "updateMode"))
    objc_msgSend(v18, "disableExternalUpdatesWithReason:", CFSTR("HUItemCollectionViewController_NotVisible"));
  -[HUItemCollectionViewController _updateTitle](self, "_updateTitle");

}

- (void)_updateTitle
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[HUItemCollectionViewController automaticallyUpdatesViewControllerTitle](self, "automaticallyUpdatesViewControllerTitle");

    if (!v5)
      return;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "updateMode"))
  {
    if (-[HUItemCollectionViewController visibilityUpdatesEnabled](self, "visibilityUpdatesEnabled"))
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "disableExternalUpdatesWithReason:", CFSTR("HUItemCollectionViewController_NotVisible"));

      -[HUItemCollectionViewController setVisibilityUpdatesEnabled:](self, "setVisibilityUpdatesEnabled:", 0);
    }
    -[HUItemCollectionViewController deferredVisibilityUpdate](self, "deferredVisibilityUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HUItemCollectionViewController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF230880))
          {
            objc_msgSend(v12, "itemManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "disableExternalUpdatesWithReason:", CFSTR("HUItemCollectionViewController_ParentNotVisible"));

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

  }
  -[HUItemCollectionViewController setChildViewControllersAtViewWillAppearTime:](self, "setChildViewControllersAtViewWillAppearTime:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBD20], 0);

  v27.receiver = self;
  v27.super_class = (Class)HUItemCollectionViewController;
  -[HUItemCollectionViewController viewWillDisappear:](&v27, sel_viewWillDisappear_, v3);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController setChildViewControllersAtViewWillDisappearTime:](self, "setChildViewControllersAtViewWillDisappearTime:", v15);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HUItemCollectionViewController childViewControllers](self, "childViewControllers", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        -[HUItemCollectionViewController childViewControllersAtViewWillDisappearTime](self, "childViewControllersAtViewWillDisappearTime");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v21);

        objc_msgSend(v21, "beginAppearanceTransition:animated:", 0, v3);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v18);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _QWORD v23[5];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[HUItemCollectionViewController _cancelIconPreload](self, "_cancelIconPreload");
  -[HUItemCollectionViewController childViewControllersAtViewWillDisappearTime](self, "childViewControllersAtViewWillDisappearTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)objc_opt_class(), "updateMode"))
  {
    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", MEMORY[0x1E0C80D38]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __49__HUItemCollectionViewController_viewWillAppear___block_invoke;
    v23[3] = &unk_1E6F597C8;
    v23[4] = self;
    v24 = v5;
    objc_msgSend(v6, "performCancelableBlock:", v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController setDeferredVisibilityUpdate:](self, "setDeferredVisibilityUpdate:", v7);

  }
  -[HUItemCollectionViewController setChildViewControllersAtViewWillDisappearTime:](self, "setChildViewControllersAtViewWillDisappearTime:", 0);
  v22.receiver = self;
  v22.super_class = (Class)HUItemCollectionViewController;
  -[HUItemCollectionViewController viewWillAppear:](&v22, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController setChildViewControllersAtViewWillAppearTime:](self, "setChildViewControllersAtViewWillAppearTime:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUItemCollectionViewController childViewControllers](self, "childViewControllers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[HUItemCollectionViewController childViewControllersAtViewWillAppearTime](self, "childViewControllersAtViewWillAppearTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v14);

        objc_msgSend(v14, "beginAppearanceTransition:animated:", 1, v3);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v11);
  }

  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibleCells");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_each:", &__block_literal_global_181);

}

+ (unint64_t)updateMode
{
  return 0;
}

- (void)_cancelIconPreload
{
  void *v3;

  -[HUItemCollectionViewController iconPreloadCancelable](self, "iconPreloadCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[HUItemCollectionViewController setIconPreloadCancelable:](self, "setIconPreloadCancelable:", 0);
}

- (NACancelable)iconPreloadCancelable
{
  return self->_iconPreloadCancelable;
}

- (void)setChildViewControllersAtViewWillDisappearTime:(id)a3
{
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillDisappearTime, a3);
}

- (void)setChildViewControllersAtViewWillAppearTime:(id)a3
{
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillAppearTime, a3);
}

- (void)setDeferredVisibilityUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_deferredVisibilityUpdate, a3);
}

- (NSHashTable)childViewControllersAtViewWillDisappearTime
{
  return self->_childViewControllersAtViewWillDisappearTime;
}

- (void)_preloadIconsIfNeededWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUItemCollectionViewController _cancelIconPreload](self, "_cancelIconPreload");
  -[HUItemCollectionViewController _displayedPackageIconDescriptorsForItems:](self, "_displayedPackageIconDescriptorsForItems:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D33708], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prefetchIconDescriptors:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController setIconPreloadCancelable:](self, "setIconPreloadCancelable:", v6);

  }
  -[HUItemCollectionViewController _prioritizeIconPreloadIfNeeded](self, "_prioritizeIconPreloadIfNeeded");

}

- (void)setIconPreloadCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_iconPreloadCancelable, a3);
}

- (id)_displayedPackageIconDescriptorsForItems:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_193);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUItemCollectionViewController;
  -[HUItemCollectionViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[HUItemCollectionViewController setUpDiffableDataItemManagerIfNeeded](self, "setUpDiffableDataItemManagerIfNeeded");
  -[HUItemCollectionViewController _configureLayout](self, "_configureLayout");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefetchDataSource:", self);

  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefetchingEnabled:", 1);

  if (objc_msgSend((id)objc_opt_class(), "updateMode") == 1)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  }
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0CEB3B8], CFSTR("HUItemCollectionViewHeader"));

  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0CEB3B0], CFSTR("HUItemCollectionViewFooter"));

}

- (void)setUpDiffableDataItemManagerIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26[4];
  id from;
  id location;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "diffableDataSourceDisabled"))
  {

  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "diffableDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_opt_class();

      v8 = (void *)objc_opt_class();
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v9);

      objc_initWeak(&from, self);
      v10 = objc_alloc(MEMORY[0x1E0CEA440]);
      -[HUItemCollectionViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke;
      v24[3] = &unk_1E6F59700;
      objc_copyWeak(&v25, &from);
      v26[1] = (id)a2;
      objc_copyWeak(v26, &location);
      v26[2] = v7;
      v26[3] = v8;
      v13 = (void *)objc_msgSend(v10, "initWithCollectionView:cellProvider:", v11, v24);

      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_27;
      v22[3] = &unk_1E6F59728;
      objc_copyWeak(&v23, &from);
      objc_msgSend(v13, "setSupplementaryViewProvider:", v22);
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_2;
      v20[3] = &unk_1E6F59750;
      objc_copyWeak(&v21, &from);
      objc_msgSend(v13, "reorderingHandlers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCanReorderItemHandler:", v20);

      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_3;
      v18[3] = &unk_1E6F59778;
      objc_copyWeak(&v19, &from);
      objc_msgSend(v13, "reorderingHandlers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDidReorderHandler:", v18);

      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDiffableDataSource:", v13);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);

      objc_destroyWeak(v26);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_configureLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  -[HUItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v8 = v4;

  if (v8)
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController compositionalLayoutConfigurationForTraitCollection:](self, "compositionalLayoutConfigurationForTraitCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConfiguration:", v7);

  }
}

- (id)hu_preloadContent
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[HUItemCollectionViewController hasFinishedInitialLoad](self, "hasFinishedInitialLoad"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "diffableDataSourceDisabled");

    if ((v5 & 1) == 0)
      -[HUItemCollectionViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    if (!objc_msgSend((id)objc_opt_class(), "updateMode")
      && !-[HUItemCollectionViewController visibilityUpdatesEnabled](self, "visibilityUpdatesEnabled"))
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDisableExternalUpdatesWithReason:", CFSTR("HUItemCollectionViewController_NotVisible"));

      -[HUItemCollectionViewController setVisibilityUpdatesEnabled:](self, "setVisibilityUpdatesEnabled:", 1);
    }
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "diffableDataSourceDisabled");

    if (v8)
      -[HUItemCollectionViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v9 = (void *)MEMORY[0x1E0C99DE8];
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstFastUpdateFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[HUItemCollectionViewController childViewControllersToPreload](self, "childViewControllersToPreload", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "hu_preloadContent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "na_safeAddObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    return v21;
  }
}

- (void)setVisibilityUpdatesEnabled:(BOOL)a3
{
  self->_visibilityUpdatesEnabled = a3;
}

void __49__HUItemCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "visibilityUpdatesEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endDisableExternalUpdatesWithReason:", CFSTR("HUItemCollectionViewController_NotVisible"));

    objc_msgSend(*(id *)(a1 + 32), "setVisibilityUpdatesEnabled:", 1);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF230880, (_QWORD)v10))
        {
          objc_msgSend(v8, "itemManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "endDisableExternalUpdatesWithReason:", CFSTR("HUItemCollectionViewController_ParentNotVisible"));

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)visibilityUpdatesEnabled
{
  return self->_visibilityUpdatesEnabled;
}

- (id)childViewControllersToPreload
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NACancelable)deferredVisibilityUpdate
{
  return self->_deferredVisibilityUpdate;
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  HUItemCollectionViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a5;
  objc_msgSend(v6, "arrayWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "BOOLValue");
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "runningState");

    if (v11)
    {
      HFLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the application is active", buf, 2u);
      }

      v13 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      objc_msgSend(v8, "addObject:", v13);
      -[HUItemCollectionViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v13);

    }
    if (!-[HUItemCollectionViewController isViewVisible](self, "isViewVisible"))
    {
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = self;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Delaying full item update for view controller %@ as we are not visible.", buf, 0xCu);
      }

      v16 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      objc_msgSend(v8, "addObject:", v16);
      v17 = (void *)MEMORY[0x1E0D519C0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke;
      v23[3] = &unk_1E6F4C660;
      v24 = v16;
      v18 = v16;
      objc_msgSend(v17, "futureWithBlock:", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemCollectionViewController viewVisibleFutures](self, "viewVisibleFutures");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v19);

    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HUItemCollectionViewController;
  -[HUItemCollectionViewController viewDidAppear:](&v17, sel_viewDidAppear_, a3);
  -[HUItemCollectionViewController setViewVisible:](self, "setViewVisible:", 1);
  if (!-[HUItemCollectionViewController hasFinishedInitialLoad](self, "hasFinishedInitialLoad"))
  {
    -[HUItemCollectionViewController setHasFinishedInitialLoad:](self, "setHasFinishedInitialLoad:", 1);
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: finished initial load", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_textFieldDidChange_, *MEMORY[0x1E0CEBD20], 0);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HUItemCollectionViewController childViewControllersAtViewWillAppearTime](self, "childViewControllersAtViewWillAppearTime", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "endAppearanceTransition");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)setViewVisible:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  BOOL v8;

  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    -[HUItemCollectionViewController viewVisibleFutures](self, "viewVisibleFutures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__HUItemCollectionViewController_setViewVisible___block_invoke;
    v7[3] = &__block_descriptor_33_e18_v16__0__NAFuture_8l;
    v8 = a3;
    objc_msgSend(v5, "na_each:", v7);

    -[HUItemCollectionViewController viewVisibleFutures](self, "viewVisibleFutures");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

  }
}

- (NSMutableArray)viewVisibleFutures
{
  return self->_viewVisibleFutures;
}

- (NSHashTable)childViewControllersAtViewWillAppearTime
{
  return self->_childViewControllersAtViewWillAppearTime;
}

uint64_t __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void __49__HUItemCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = v5;
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2652F8))
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    objc_msgSend(v4, "reclaimIconIfPossible");
  }

}

- (void)itemManager:(id)a3 didChangeHome:(id)a4
{
  id v5;

  if (-[HUItemCollectionViewController hasFinishedInitialLoad](self, "hasFinishedInitialLoad", a3, a4))
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

uint64_t __49__HUItemCollectionViewController_setViewVisible___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "finishWithNoResult");
  else
    return objc_msgSend(a2, "cancel");
}

void __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0D28698], "mainScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v5 = *(id *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "performWithQualityOfService:block:", 17, v4);

}

- (HUItemCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v6;
  HUItemCollectionViewController *v7;
  HUItemCollectionViewController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUItemCollectionViewController;
  v7 = -[HUCollectionViewController initWithCollectionViewLayout:](&v10, sel_initWithCollectionViewLayout_, a4);
  v8 = v7;
  if (v7)
    -[HUItemCollectionViewController _commonInitWithItemManager:](v7, "_commonInitWithItemManager:", v6);

  return v8;
}

- (void)setWantsPreferredContentSize:(BOOL)a3
{
  id v4;

  if (self->_wantsPreferredContentSize != a3)
  {
    self->_wantsPreferredContentSize = a3;
    if (a3)
    {
      -[HUItemCollectionViewController collectionView](self, "collectionView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentSize");
      -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](self, "preferredContentSizeForCollectionViewContentSize:");
      -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
    else
    {
      -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    }
  }
}

id __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(WeakRetained, "collectionView:canMoveItemAtIndexPath:", v7, v6);

  return v8;
}

void __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_sortedItemMapFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "didReorderItemWithSortedItemsBySectionID:", v4);
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)_sortedItemMapFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "sectionTransactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HUItemCollectionViewController__sortedItemMapFrom___block_invoke;
  v8[3] = &unk_1E6F597A0;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "na_each:", v8);

  return v6;
}

void __53__HUItemCollectionViewController__sortedItemMapFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v10 = v5;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "finalSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, v9);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[HUItemCollectionViewController setViewVisible:](self, "setViewVisible:", 0);
  v16.receiver = self;
  v16.super_class = (Class)HUItemCollectionViewController;
  -[HUItemCollectionViewController viewDidDisappear:](&v16, sel_viewDidDisappear_, v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUItemCollectionViewController childViewControllersAtViewWillDisappearTime](self, "childViewControllersAtViewWillDisappearTime", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "endAppearanceTransition");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_each:", &__block_literal_global_109_3);

}

void __51__HUItemCollectionViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "renounceIcon");

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;

  -[HUItemCollectionViewController itemModuleControllers](self, "itemModuleControllers", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemCollectionViewController.m"), 395, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUItemCollectionViewController cellClassForItem:indexPath:]", objc_opt_class());

  }
  return 0;
}

- (BOOL)isLayoutDependentOnItemState
{
  return 0;
}

- (void)performBatchCollectionViewUpdatesForUpdateRequest:(id)a3 reloadOnly:(BOOL)a4
{
  objc_msgSend(a3, "performWithOptions:", a4);
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return -1;
}

- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  -[HUItemCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA430], "defaultConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ doesn't implement %@. This is required if using initUsingCompositionalLayoutWithItemManager initializer"), v5, v6);

  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("sourceItem"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  if ((id)*MEMORY[0x1E0CEB3B8] == a3)
    objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0CEA718], "groupedFooterConfiguration");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HUItemCollectionViewController itemManager](self, "itemManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[HUItemCollectionViewController itemManager](self, "itemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemsInSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUItemCollectionViewController;
  -[HUCollectionViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:](&v19, sel_collectionView_didEndDisplayingCell_forItemAtIndexPath_, a3, v8, v9);
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF258718))
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && -[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v11))
    {
      v12 = v8;
      objc_msgSend(v12, "textField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", 0);

      -[HUItemCollectionViewController textFieldToCellMap](self, "textFieldToCellMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "removeObjectForKey:", v15);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = v8;
    if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF2652F8))
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "renounceIcon");
  }

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v8 = a5;
  v9 = (id)*MEMORY[0x1E0CEB3B8];
  if ((id)*MEMORY[0x1E0CEB3B8] == a4)
    v10 = CFSTR("HUItemCollectionViewHeader");
  else
    v10 = CFSTR("HUItemCollectionViewFooter");
  v11 = a4;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "section");
  if (v9 == a4)
  {
    objc_msgSend(v13, "titleForSection:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedTitleForSection:", objc_msgSend(v8, "section"));
  }
  else
  {
    objc_msgSend(v13, "footerTitleForSection:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedFooterTitleForSection:", objc_msgSend(v8, "section"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v18 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  -[HUItemCollectionViewController listContentConfigurationForSupplementaryElementOfKind:atIndexPath:](self, "listContentConfigurationForSupplementaryElementOfKind:atIndexPath:", v11, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == a4 || !v17)
    objc_msgSend(v21, "setText:", v15);
  else
    objc_msgSend(v21, "setAttributedText:", v17);
  objc_msgSend(v20, "setContentConfiguration:", v21);

  return v20;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  HUItemCollectionViewController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)+[HUItemCollectionViewController superclass](HUItemCollectionViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v14.receiver = self;
    v14.super_class = (Class)HUItemCollectionViewController;
    -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v14, sel_collectionView_didSelectItemAtIndexPath_, v7, v8);
  }
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: User tapped item: %@", buf, 0x16u);
  }

  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && !objc_msgSend(v12, "didSelectItem:", v10))
    objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v8, 1);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "canSelectItem:", v7);
  else
    v10 = 1;

  return v10;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HUItemCollectionViewController *v16;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(a3, "indexPathsForVisibleItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HUItemCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke;
  v14[3] = &unk_1E6F598A0;
  v13 = v9;
  v15 = v13;
  v16 = self;
  objc_msgSend(v7, "na_map:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D33708], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "prefetchIconDescriptors:", v10);

  }
}

id __75__HUItemCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayedItemAtIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v4 = v9;

  }
  return v4;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v14 = a4;
  v6 = a3;
  objc_msgSend(v14, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_170_0);

  if ((objc_msgSend(v14, "isInitialUpdate") & 1) != 0
    || (-[HUItemCollectionViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    -[HUItemCollectionViewController performBatchCollectionViewUpdatesForUpdateRequest:reloadOnly:](self, "performBatchCollectionViewUpdatesForUpdateRequest:reloadOnly:", v14, 1);
    if (-[HUItemCollectionViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUItemCollectionViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

    }
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allDisplayedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController _preloadIconsIfNeededWithItems:](self, "_preloadIconsIfNeededWithItems:", v13);

  }
  else if (((-[HUItemCollectionViewController isLayoutDependentOnItemState](self, "isLayoutDependentOnItemState") | v9) & 1) != 0)
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__HUItemCollectionViewController_itemManager_performUpdateRequest___block_invoke_2;
    v15[3] = &unk_1E6F4C638;
    v15[4] = self;
    v16 = v14;
    objc_msgSend(v10, "performBatchUpdates:completion:", v15, 0);

  }
  else
  {
    objc_msgSend(v14, "performWithOptions:", 0);
  }
  -[HUItemCollectionViewController itemManagerDidUpdate:](self, "itemManagerDidUpdate:", v6);

}

BOOL __67__HUItemCollectionViewController_itemManager_performUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 0;
}

uint64_t __67__HUItemCollectionViewController_itemManager_performUpdateRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBatchCollectionViewUpdatesForUpdateRequest:reloadOnly:", *(_QWORD *)(a1 + 40), 0);
}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deleteItemsAtIndexPaths:", v8);
}

- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "insertItemsAtIndexPaths:", v8);
}

- (void)itemManager:(id)a3 didMoveItem:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = a6;
  if (!-[HUItemCollectionViewController suppressCollectionViewUpdatesForReorderCommit](self, "suppressCollectionViewUpdatesForReorderCommit"))
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "updateUIWithAnimation:", 1);
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "moveItemAtIndexPath:toIndexPath:", v12, v8);

  }
}

- (void)itemManager:(id)a3 didRemoveSections:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteSections:", v5);

}

- (void)itemManager:(id)a3 didInsertSections:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUItemCollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSections:", v5);

}

- (void)itemManager:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v7;

  -[HUItemCollectionViewController collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moveSection:toSection:", a4, a5);

}

uint64_t __67__HUItemCollectionViewController_itemManager_didUpdateItemModules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "module");
}

BOOL __67__HUItemCollectionViewController_itemManager_didUpdateItemModules___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)executionEnvironmentRunningStateDidChange:(id)a3
{
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "runningState"))
  {
    -[HUItemCollectionViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (self && v6 >= 4)
    {
      if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      {

LABEL_11:
        HFLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[HUItemCollectionViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 134218240;
          v16 = objc_msgSend(v12, "count");
          v17 = 2048;
          v18 = 3;
          _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%lu full item update(s) exceed threshold of %li. Canceling and doing full reload", (uint8_t *)&v15, 0x16u);

        }
        -[HUItemCollectionViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "na_each:", &__block_literal_global_179);

        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v9, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
LABEL_14:

        return;
      }
      v10 = objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard");

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HUItemCollectionViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134217984;
      v16 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Proceeding with %lu full item update(s)", (uint8_t *)&v15, 0xCu);

    }
    -[HUItemCollectionViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_each:", &__block_literal_global_181_0);
    goto LABEL_14;
  }
}

uint64_t __76__HUItemCollectionViewController_executionEnvironmentRunningStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

uint64_t __76__HUItemCollectionViewController_executionEnvironmentRunningStateDidChange___block_invoke_180(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

- (HFItem)hu_presentedItem
{
  void *v2;
  void *v3;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

- (void)recursivelyDisableItemUpdates:(BOOL)a3 withReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "disableExternalUpdatesWithReason:", v6);
  else
    objc_msgSend(v7, "endDisableExternalUpdatesWithReason:", v6);

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[HUItemCollectionViewController childViewControllers](self, "childViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController childViewControllersToPreload](self, "childViewControllersToPreload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "recursivelyDisableItemUpdates:withReason:", v4, v6, (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[HUItemCollectionViewController _transformViewControllerForRequest:](self, "_transformViewControllerForRequest:", v5);
  -[UIViewController hu_performPresentationRequest:](self, "hu_performPresentationRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_transformViewControllerForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v19 = v6;

  v7 = v19;
  if (v19)
  {
    v8 = objc_msgSend(v19, "preferredStyle");
    v7 = v19;
    if (!v8)
    {
      objc_msgSend(v19, "popoverPresentationController");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v19;
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v19, "popoverPresentationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sourceView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v19;
        if (!v12)
        {
          -[HUItemCollectionViewController collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "indexPathsForSelectedItems");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count") == 1)
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUItemCollectionViewController collectionView](self, "collectionView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "cellForItemAtIndexPath:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              -[HUItemCollectionViewController collectionView](self, "collectionView");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v19, "popoverPresentationController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSourceView:", v17);

          }
          else
          {
            -[HUItemCollectionViewController collectionView](self, "collectionView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "popoverPresentationController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSourceView:", v15);
          }

          v7 = v19;
        }
      }
    }
  }

}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performDismissalRequest:](self, "hu_performDismissalRequest:", a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return -[HUItemCollectionViewController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", a4);
}

- (void)updateCellForItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "diffableDataSourceDisabled");

  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__HUItemCollectionViewController_updateCellForItems___block_invoke;
    v10[3] = &unk_1E6F599B0;
    v10[4] = self;
    objc_msgSend(v4, "na_map:", v10);
    v7 = objc_claimAutoreleasedReturnValue();

    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItemsAtIndexPaths:", v7);

    v4 = (id)v7;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__HUItemCollectionViewController_updateCellForItems___block_invoke_2;
    v9[3] = &unk_1E6F51390;
    v9[4] = self;
    objc_msgSend(v4, "na_each:", v9);
  }

}

id __53__HUItemCollectionViewController_updateCellForItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __53__HUItemCollectionViewController_updateCellForItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItem:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemManager:didUpdateResultsForItem:atIndexPath:", v6, v7, v4);

  }
}

- (void)reloadCellForItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "diffableDataSourceDisabled");

  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__HUItemCollectionViewController_reloadCellForItems___block_invoke;
    v10[3] = &unk_1E6F599B0;
    v10[4] = self;
    objc_msgSend(v9, "na_map:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadItemsAtIndexPaths:", v6);

  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadUIRepresentationForItems:withAnimation:", v9, 0);

  }
}

id __53__HUItemCollectionViewController_reloadCellForItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUItemCollectionViewController _itemForTextField:](self, "_itemForTextField:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v5, "textFieldDidBeginEditing:item:", v7, v4);
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if (-[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v4))
    -[HUItemCollectionViewController textFieldDidBeginEditing:item:](self, "textFieldDidBeginEditing:item:", v7, v4);
LABEL_7:

}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUItemCollectionViewController _itemForTextField:](self, "_itemForTextField:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "shouldManageTextFieldForItem:", v5))
      objc_msgSend(v7, "textDidChange:forTextField:item:", &stru_1E6F60E80, v4, v5);
    if (-[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v5))
      -[HUItemCollectionViewController textDidChange:forTextField:item:](self, "textDidChange:forTextField:item:", &stru_1E6F60E80, v4, v5);
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController _itemForTextField:](self, "_itemForTextField:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "User finished editing text field for %@, entered: %@", (uint8_t *)&v10, 0x16u);

  }
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (objc_msgSend(v8, "shouldManageTextFieldForItem:", v5))
      objc_msgSend(v9, "textFieldDidEndEditing:item:", v4, v5);
    if (-[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v5))
      -[HUItemCollectionViewController textFieldDidEndEditing:item:](self, "textFieldDidEndEditing:item:", v4, v5);
  }

}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController _itemForTextField:](self, "_itemForTextField:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (objc_msgSend(v5, "shouldManageTextFieldForItem:", v4))
    {
      objc_msgSend(v9, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textDidChange:forTextField:item:", v7, v9, v4);

    }
    if (-[HUItemCollectionViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v4))
    {
      objc_msgSend(v9, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemCollectionViewController textDidChange:forTextField:item:](self, "textDidChange:forTextField:item:", v8, v9, v4);

    }
  }

}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "shouldManageTextFieldForItem:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)textFieldForVisibleItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF258718))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "currentTextForTextField:item:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "defaultTextForTextField:item:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "placeholderTextForTextField:item:", v7, v6);
  else
    -[HUItemCollectionViewController defaultTextForTextField:item:](self, "defaultTextForTextField:item:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __73__HUItemCollectionViewController_cleanupRecentlyRemovedModuleControllers__block_invoke_189(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "moduleIdentifier");
}

- (id)_itemForTextField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[HUItemCollectionViewController textFieldToCellMap](self, "textFieldToCellMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2424C8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForCell:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayedItemAtIndexPath:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (BOOL)suppressCollectionViewUpdatesForReorderCommit
{
  return self->_suppressCollectionViewUpdatesForReorderCommit;
}

- (void)setSuppressCollectionViewUpdatesForReorderCommit:(BOOL)a3
{
  self->_suppressCollectionViewUpdatesForReorderCommit = a3;
}

- (NSMutableSet)internalItemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (NSMapTable)textFieldToCellMap
{
  return self->_textFieldToCellMap;
}

- (NSMutableArray)foregroundUpdateFutures
{
  return self->_foregroundUpdateFutures;
}

- (void)setForegroundUpdateFutures:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundUpdateFutures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillDisappearTime, 0);
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillAppearTime, 0);
  objc_storeStrong((id *)&self->_iconPreloadCancelable, 0);
  objc_storeStrong((id *)&self->_deferredVisibilityUpdate, 0);
  objc_storeStrong((id *)&self->_viewVisibleFutures, 0);
  objc_storeStrong((id *)&self->_foregroundUpdateFutures, 0);
  objc_storeStrong((id *)&self->_registeredCellClasses, 0);
  objc_storeStrong((id *)&self->_textFieldToCellMap, 0);
  objc_storeStrong((id *)&self->_recentlyRemovedItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_internalItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
}

@end
