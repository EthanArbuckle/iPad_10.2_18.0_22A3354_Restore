@implementation HUSelectableServiceGridViewController

+ (id)itemServiceTypesToHide
{
  return (id)objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_serviceTypesHiddenFromScenesOrAutomations");
}

+ (id)transformationBlockWithOptions:(unint64_t)a3
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke;
  aBlock[3] = &__block_descriptor_40_e33___HFTransformItem_16__0__HFItem_8l;
  aBlock[4] = a3;
  return _Block_copy(aBlock);
}

id __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC378))
    v4 = (objc_class *)objc_opt_class();
  v5 = [v4 alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke_2;
  v10[3] = &unk_1E6F51D80;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v6;
  v7 = v3;
  v8 = (void *)objc_msgSend(v5, "initWithSourceItem:transformationBlock:", v7, v10);

  return v8;
}

id __72__HUSelectableServiceGridViewController_transformationBlockWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E70418C0, *MEMORY[0x1E0D30E20]);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x1E0D30BF8]);
  if (objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EF2AC8C8)
    && (objc_msgSend(*(id *)(a1 + 32), "containsActions") & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if ((v4 & 2) != 0)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSceneServicePickerItemDescriptionNoActionableCharacteristics"), CFSTR("HUSceneServicePickerItemDescriptionNoActionableCharacteristics"), 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30BF8]);

      v4 = *(_QWORD *)(a1 + 40);
    }
    if ((v4 & 4) != 0)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  if ((*(_BYTE *)(a1 + 40) & 8) != 0)
  {
    v6 = *MEMORY[0x1E0D30C60];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (objc_class *)MEMORY[0x1E0D31470];
      v9 = v7;
      v10 = [v8 alloc];
      objc_msgSend(v9, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v10, "initWithIdentifier:incrementalState:", v11, &unk_1E7043668);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = (objc_class *)MEMORY[0x1E0D311C8];
      v14 = v7;
      v15 = [v13 alloc];
      objc_msgSend(v14, "packageIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v15, "initWithPackageIdentifier:state:", v11, *MEMORY[0x1E0D304D8]);
    }
    v16 = (void *)v12;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v6);
    goto LABEL_15;
  }
LABEL_16:
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

+ (id)defaultItemProviderCreatorWithOptions:(unint64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__HUSelectableServiceGridViewController_defaultItemProviderCreatorWithOptions___block_invoke;
  v4[3] = &__block_descriptor_48_e25___NSArray_16__0__HMHome_8l;
  v4[4] = a1;
  v4[5] = a3;
  return _Block_copy(v4);
}

id __79__HUSelectableServiceGridViewController_defaultItemProviderCreatorWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "transformationBlockWithOptions:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D315E8]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317D8]), "initWithHome:serviceTypes:", v3, 0);
  objc_msgSend(v7, "setValueSource:", v6);
  v17 = v7;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v7, v4);
  objc_msgSend(v5, "addObject:");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317C0]), "initWithHome:", v3);
  v18 = v6;
  objc_msgSend(v8, "setValueSource:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v8, v4);
  objc_msgSend(v5, "addObject:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D316B0]), "initWithHome:", v3);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v10, v4);
  objc_msgSend(v5, "addObject:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31510]), "initWithHome:includeSiriEndPointProfiles:", v3, 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v12, v4);
  objc_msgSend(v5, "addObject:", v13);
  if ((*(_BYTE *)(a1 + 40) & 0x10) != 0)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31150]), "initWithHome:actionSetItemStyle:", v3, 0);
    objc_msgSend(v14, "setValueSource:", v18);
    objc_msgSend(v5, "addObject:", v14);

  }
  return v5;
}

- (HUSelectableServiceGridViewController)initWithServiceGridItemManager:(id)a3
{
  id v4;
  HUSelectableServiceGridViewController *v5;
  HUSelectableServiceGridViewController *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HFMutableSetDiff *mutableSelectedItems;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUSelectableServiceGridViewController;
  v5 = -[HUServiceGridViewController initWithItemManager:](&v12, sel_initWithItemManager_, v4);
  v6 = v5;
  if (v5)
  {
    -[HUServiceGridViewController setShouldShowLoadingState:](v5, "setShouldShowLoadingState:", 0);
    objc_storeWeak((id *)&v6->_serviceGridItemManager, v4);
    v7 = objc_alloc(MEMORY[0x1E0D31580]);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFromSet:", v8);
    mutableSelectedItems = v6->_mutableSelectedItems;
    v6->_mutableSelectedItems = (HFMutableSetDiff *)v9;

    v6->_allowsEmptySelection = 1;
    v6->_allowsMultipleSelection = 1;
  }

  return v6;
}

- (HUSelectableServiceGridViewController)initWithItemManager:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceGridItemManager_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSelectableServiceGridViewController.m"), 149, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSelectableServiceGridViewController initWithItemManager:]",
    v6);

  return 0;
}

- (HFSetDiff)selectedItems
{
  void *v2;
  void *v3;

  -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (HFSetDiff *)v3;
}

- (void)setSelectedItems:(id)a3
{
  HFMutableSetDiff *v4;
  HFMutableSetDiff *mutableSelectedItems;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v4 = (HFMutableSetDiff *)objc_msgSend(v31, "mutableCopy");
  mutableSelectedItems = self->_mutableSelectedItems;
  self->_mutableSelectedItems = v4;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForVisibleItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && objc_msgSend(v14, "conformsToProtocol:", &unk_1EF265270))
        {
          -[HUItemCollectionViewController itemManager](self, "itemManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displayedItemAtIndexPath:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "toSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v16);

          -[HUSelectableServiceGridViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", v18, v14);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CEB3B8];
  objc_msgSend(v19, "indexPathsForVisibleSupplementaryElementsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_opt_class();
        -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "supplementaryViewForElementKind:atIndexPath:", v20, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
        v30 = v29;

        if (v30)
          -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", objc_msgSend(v26, "section"), v30);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v23);
  }

}

- (void)_addAllServicesInSectionFromButton:(id)a3
{
  -[HUSelectableServiceGridViewController _setSelected:forItemsInSection:](self, "_setSelected:forItemsInSection:", 1, objc_msgSend(a3, "tag"));
}

- (void)_removeAllServicesInSectionFromButton:(id)a3
{
  -[HUSelectableServiceGridViewController _setSelected:forItemsInSection:](self, "_setSelected:forItemsInSection:", 0, objc_msgSend(a3, "tag"));
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  HUCheckmarkAccessoryView *v12;
  HUCheckmarkAccessoryView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUSelectableServiceGridViewController;
  -[HUServiceGridViewController configureCell:forItem:](&v17, sel_configureCell_forItem_, v6, v7);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF265270))
  {
    v8 = v6;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItem:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUSelectableServiceGridViewController canSelectItem:indexPath:](self, "canSelectItem:indexPath:", v7, v10);

    if (v11)
    {
      v12 = [HUCheckmarkAccessoryView alloc];
      v13 = -[HUCheckmarkAccessoryView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v8, "setAccessoryView:", v13);

      -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "toSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v7);

    }
    else
    {
      objc_msgSend(v8, "setAccessoryView:", 0);
      v16 = 0;
    }
    -[HUSelectableServiceGridViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", v16, v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "setDisableContinuousIconAnimation:", 1);

  }
}

- (void)itemManagerDidUpdate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)HUSelectableServiceGridViewController;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v21, sel_itemManagerDidUpdate_, a3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CEB3B8];
  objc_msgSend(v4, "indexPathsForVisibleSupplementaryElementsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "supplementaryViewForElementKind:atIndexPath:", v5, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
          -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", objc_msgSend(v11, "section"), v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

}

- (double)headerViewHeightForSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForSection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA720]), "initWithConfiguration:", v5);
  objc_msgSend(v8, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v10 = v9;

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUSelectableServiceGridViewController;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v20, sel_collectionView_didSelectItemAtIndexPath_, a3, v6);
  -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF265270))
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedItemAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HUSelectableServiceGridViewController canSelectItem:indexPath:](self, "canSelectItem:indexPath:", v10, v6))
    {
      -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "toSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v10);

      if (v13)
        -[HUSelectableServiceGridViewController deleteItemFromSelection:](self, "deleteItemFromSelection:", v10);
      else
        -[HUSelectableServiceGridViewController addItemToSelection:](self, "addItemToSelection:", v10);
      -[HUSelectableServiceGridViewController didChangeSelection](self, "didChangeSelection");
    }
    objc_opt_class();
    -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CEB3B8];
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v6, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "supplementaryViewForElementKind:atIndexPath:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19)
      -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", objc_msgSend(v6, "section"), v19);

  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0CEB3B8];
  v11 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) == 0)
    NSLog(CFSTR("Asked for a view for an unexpected kind: %@"), v8);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleForSection:", objc_msgSend(v9, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    NSLog(CFSTR("Asked for header for a section without a title: %@"), v9);
  objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", objc_msgSend(v9, "section"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "directionalLayoutMargins");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v20, "sectionLeadingMargin");
  objc_msgSend(v19, "setDirectionalLayoutMargins:", v22, v24 + v29, v26, v28);
  objc_msgSend(v19, "setText:", v13);
  objc_msgSend(v18, "setContentConfiguration:", v19);
  objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundConfiguration:", v30);

  objc_msgSend(v18, "directionalLayoutMargins");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(v20, "sectionTrailingMargin");
  objc_msgSend(v18, "setDirectionalLayoutMargins:", v32, v34, v36, v38 + v39);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "secondaryTextProperties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "font");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFont:", v42);

  objc_msgSend(v40, "setTag:", objc_msgSend(v9, "section"));
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA3E0]), "initWithCustomView:placement:", v40, 1);
  objc_msgSend(v43, "setReservedLayoutWidth:", 0.0);
  objc_msgSend(v43, "setMaintainsFixedSize:", 0);
  objc_msgSend(v43, "setHidden:", -[HUSelectableServiceGridViewController _shouldShowToggleButtonForSection:](self, "_shouldShowToggleButtonForSection:", objc_msgSend(v9, "section")) ^ 1);
  v46[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessories:", v44);

  -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", objc_msgSend(v9, "section"), v18);
  return v18;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUSelectableServiceGridViewController;
  v8 = a5;
  v9 = a4;
  -[HUControllableItemCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v15, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v9, v8);
  -[HUItemCollectionViewController itemManager](self, "itemManager", v15.receiver, v15.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedItemAtIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v11);

  -[HUSelectableServiceGridViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", v14, v9);
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  return 1;
}

- (void)deleteItemFromSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;

  v13 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF265270))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    if (-[HUSelectableServiceGridViewController allowsEmptySelection](self, "allowsEmptySelection")
      || (-[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "toSet"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "count"),
          v11,
          v10,
          v12 >= 2))
    {
      -[HUSelectableServiceGridViewController _deleteItemFromSelection:](self, "_deleteItemFromSelection:", v13);
      -[HUSelectableServiceGridViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", 0, v9);
    }
  }

}

- (void)addItemToSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF265270))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    if (!-[HUSelectableServiceGridViewController allowsMultipleSelection](self, "allowsMultipleSelection"))
    {
      v23 = v6;
      v24 = v4;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "toSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            -[HUSelectableServiceGridViewController _deleteItemFromSelection:](self, "_deleteItemFromSelection:", v18);
            -[HUItemCollectionViewController itemManager](self, "itemManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "indexPathForItem:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "cellForItemAtIndexPath:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22 && objc_msgSend(v22, "conformsToProtocol:", &unk_1EF265270))
                -[HUSelectableServiceGridViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", 0, v22);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }

      v6 = v23;
      v4 = v24;
    }
    -[HUSelectableServiceGridViewController _addItemToSelection:](self, "_addItemToSelection:", v4);
    -[HUSelectableServiceGridViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", 1, v10);
  }

}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a4;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC378))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_239);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "itemServiceTypesToHide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intersectsSet:", v9);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __79__HUSelectableServiceGridViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceType");
}

- (void)_updateSelectionState:(BOOL)a3 forCell:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a4;
  objc_opt_class();
  objc_msgSend(v5, "accessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "setChecked:", v4);
}

- (void)_setSelected:(BOOL)a3 forItemsInSection:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[6];
  BOOL v21;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemsInSection:", a4);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
    goto LABEL_4;
  if (-[HUSelectableServiceGridViewController allowsEmptySelection](self, "allowsEmptySelection"))
    goto LABEL_4;
  -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = objc_msgSend(v10, "count");
  if (v12)
  {
LABEL_4:
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__HUSelectableServiceGridViewController__setSelected_forItemsInSection___block_invoke;
    v20[3] = &unk_1E6F5CA88;
    v21 = a3;
    v20[4] = self;
    v20[5] = a4;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v20, v19);
    objc_opt_class();
    -[HUSelectableServiceGridViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CEB3B8];
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "supplementaryViewForElementKind:atIndexPath:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
      -[HUSelectableServiceGridViewController _updateToggleStateForSection:headerViewCell:](self, "_updateToggleStateForSection:headerViewCell:", a4, v18);
    -[HUSelectableServiceGridViewController didChangeSelection](self, "didChangeSelection");

  }
}

void __72__HUSelectableServiceGridViewController__setSelected_forItemsInSection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "canSelectItem:indexPath:", v8, v5))
    objc_msgSend(*(id *)(a1 + 32), "_addItemToSelection:", v8);
  else
    objc_msgSend(*(id *)(a1 + 32), "_deleteItemFromSelection:", v8);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "conformsToProtocol:", &unk_1EF265270))
    objc_msgSend(*(id *)(a1 + 32), "_updateSelectionState:forCell:", *(unsigned __int8 *)(a1 + 48), v7);

}

- (void)_updateToggleStateForSection:(int64_t)a3 headerViewCell:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id *v28;
  id *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  void *v39;
  _QWORD v40[2];
  id v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;

  v37 = a4;
  if (-[HUSelectableServiceGridViewController _wantsToggleButtonForSection:](self, "_wantsToggleButtonForSection:", a3))
  {
    objc_opt_class();
    objc_msgSend(v37, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_opt_class();
    objc_msgSend(v9, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "removeTarget:action:forControlEvents:", self, 0, 64);
    if (-[HUSelectableServiceGridViewController _shouldShowToggleButtonForSection:](self, "_shouldShowToggleButtonForSection:", a3))
    {
      v35 = v12;
      v36 = v9;
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayedItemsInSection:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      v16 = 0;
      if (v15)
      {
        v17 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, a3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUItemCollectionViewController itemManager](self, "itemManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "displayedItemAtIndexPath:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "toSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v20);

          v16 += v23;
          ++v17;
          -[HUItemCollectionViewController itemManager](self, "itemManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "displayedItemsInSection:", a3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

        }
        while (v17 < v26);
      }
      v27 = (void *)MEMORY[0x1E0CEABB0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke_2;
      v38[3] = &unk_1E6F5CAB0;
      v28 = &v39;
      v29 = (id *)v40;
      v12 = v35;
      v9 = v36;
      v39 = v36;
      v40[0] = v35;
      v42 = v16;
      v40[1] = self;
      v41 = v37;
      v30 = v35;
      v31 = v36;
      objc_msgSend(v27, "performWithoutAnimation:", v38);

    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CEABB0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke;
      v43[3] = &unk_1E6F4C638;
      v28 = &v44;
      v29 = &v45;
      v44 = v12;
      v45 = v9;
      v33 = v12;
      v34 = v9;
      objc_msgSend(v32, "performWithoutAnimation:", v43);
    }

  }
}

uint64_t __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitle:forState:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
}

uint64_t __85__HUSelectableServiceGridViewController__updateToggleStateForSection_headerViewCell___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  char **v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 40);
  if (v2)
    v4 = CFSTR("HUSelectableServiceGridSectionButtonRemoveAll");
  else
    v4 = CFSTR("HUSelectableServiceGridSectionButtonAddAll");
  if (v2)
    v5 = &selRef__removeAllServicesInSectionFromButton_;
  else
    v5 = &selRef__addAllServicesInSectionFromButton_;
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v6, 0);

  objc_msgSend(*(id *)(a1 + 40), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), *v5, 64);
  return objc_msgSend(*(id *)(a1 + 56), "setNeedsLayout");
}

- (BOOL)_shouldShowToggleButtonForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  if (!-[HUSelectableServiceGridViewController _wantsToggleButtonForSection:](self, "_wantsToggleButtonForSection:"))
    return 0;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemsInSection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
    return 0;
  -[HUSelectableServiceGridViewController serviceGridItemManager](self, "serviceGridItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "actionSetSectionIndex") != a3
    && -[HUSelectableServiceGridViewController allowsMultipleSelection](self, "allowsMultipleSelection");

  return v9;
}

- (BOOL)_wantsToggleButtonForSection:(unint64_t)a3
{
  return 1;
}

- (void)_addItemToSelection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[HUSelectableServiceGridViewController didSelectItem:](self, "didSelectItem:", v5);
}

- (void)_deleteItemFromSelection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HUSelectableServiceGridViewController mutableSelectedItems](self, "mutableSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v5);

  -[HUSelectableServiceGridViewController didDeselectItem:](self, "didDeselectItem:", v5);
}

- (BOOL)allowsEmptySelection
{
  return self->_allowsEmptySelection;
}

- (void)setAllowsEmptySelection:(BOOL)a3
{
  self->_allowsEmptySelection = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->_allowsMultipleSelection = a3;
}

- (HUServiceGridItemManager)serviceGridItemManager
{
  return (HUServiceGridItemManager *)objc_loadWeakRetained((id *)&self->_serviceGridItemManager);
}

- (void)setServiceGridItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_serviceGridItemManager, a3);
}

- (HFMutableSetDiff)mutableSelectedItems
{
  return self->_mutableSelectedItems;
}

- (void)setMutableSelectedItems:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSelectedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSelectedItems, 0);
  objc_destroyWeak((id *)&self->_serviceGridItemManager);
}

@end
