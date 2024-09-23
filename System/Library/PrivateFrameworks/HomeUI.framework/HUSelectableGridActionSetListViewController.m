@implementation HUSelectableGridActionSetListViewController

- (HUSelectableGridActionSetListViewController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRoom_selectedActionSets_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSelectableGridActionSetListViewController.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSelectableGridActionSetListViewController init]",
    v5);

  return 0;
}

- (HUSelectableGridActionSetListViewController)initWithRoom:(id)a3 selectedActionSets:(id)a4
{
  id v6;
  id v7;
  HUGridFlowLayout *v8;
  HUGridActionSetItemManager *v9;
  HUSelectableGridActionSetListViewController *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HUGridFlowLayout);
  v9 = -[HUGridActionSetItemManager initWithDelegate:actionSetStyle:room:]([HUGridActionSetItemManager alloc], "initWithDelegate:actionSetStyle:room:", self, 0, v7);

  v13.receiver = self;
  v13.super_class = (Class)HUSelectableGridActionSetListViewController;
  v10 = -[HUControllableItemCollectionViewController initWithItemManager:collectionViewLayout:](&v13, sel_initWithItemManager_collectionViewLayout_, v9, v8);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    -[HUSelectableGridActionSetListViewController setMutableSelectedActionSets:](v10, "setMutableSelectedActionSets:", v11);

  }
  return v10;
}

- (void)selectedActionSetStateChanged:(id)a3 isSelected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v6 = a3;
  -[HUGridActionSetListViewController actionSetItemManager](self, "actionSetItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSetItemAssociatedWithActionSet:", v6);
  v16 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v16;
  if (v16)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItem:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      && (-[HUSelectableGridActionSetListViewController collectionView](self, "collectionView"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "indexPathsForVisibleItems"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsObject:", v10),
          v12,
          v11,
          v13))
    {
      -[HUSelectableGridActionSetListViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cellForItemAtIndexPath:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    -[HUSelectableGridActionSetListViewController _selectedItemStateChanged:isSelected:accessoryViewCell:](self, "_selectedItemStateChanged:isSelected:accessoryViewCell:", v16, v4, v15);

    v8 = (void *)v16;
  }

}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  HUCheckmarkAccessoryView *v9;
  HUCheckmarkAccessoryView *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUSelectableGridActionSetListViewController;
  -[HUGridActionSetListViewController configureCell:forItem:](&v15, sel_configureCell_forItem_, v6, v7);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF265270))
  {
    v8 = v6;
    v9 = [HUCheckmarkAccessoryView alloc];
    v10 = -[HUCheckmarkAccessoryView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "setAccessoryView:", v10);

    -[HUSelectableGridActionSetListViewController mutableSelectedActionSets](self, "mutableSelectedActionSets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    -[HUSelectableGridActionSetListViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", v14, v8);
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  HUSelectableGridActionSetListViewController *v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUSelectableGridActionSetListViewController;
  -[HUGridActionSetListViewController collectionView:didSelectItemAtIndexPath:](&v22, sel_collectionView_didSelectItemAtIndexPath_, a3, v6);
  -[HUSelectableGridActionSetListViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF265270))
  {
    v9 = v8;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedItemAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "actionSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[HUSelectableGridActionSetListViewController mutableSelectedActionSets](self, "mutableSelectedActionSets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if (v16)
    {
      -[HUSelectableGridActionSetListViewController _selectedItemStateChanged:isSelected:accessoryViewCell:](self, "_selectedItemStateChanged:isSelected:accessoryViewCell:", v11, 0, v9);
      -[HUSelectableGridActionSetListViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = self;
      v20 = v12;
      v21 = 0;
    }
    else
    {
      -[HUSelectableGridActionSetListViewController _selectedItemStateChanged:isSelected:accessoryViewCell:](self, "_selectedItemStateChanged:isSelected:accessoryViewCell:", v11, 1, v9);
      -[HUSelectableGridActionSetListViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = self;
      v20 = v12;
      v21 = 1;
    }
    objc_msgSend(v17, "selectableGridActionSetListViewController:didChangeStateForActionSet:isSelected:", v19, v20, v21);

  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (void)_selectedItemStateChanged:(id)a3 isSelected:(BOOL)a4 accessoryViewCell:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  -[HUSelectableGridActionSetListViewController mutableSelectedActionSets](self, "mutableSelectedActionSets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v9, "addObject:", v10);
  else
    objc_msgSend(v9, "deleteObject:", v10);

  if (v8 && objc_msgSend(v8, "conformsToProtocol:", &unk_1EF265270))
    -[HUSelectableGridActionSetListViewController _updateSelectionState:forCell:](self, "_updateSelectionState:forCell:", v6, v8);

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

- (HUSelectableGridActionSetListViewControllerDelegate)delegate
{
  return (HUSelectableGridActionSetListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFMutableSetDiff)mutableSelectedActionSets
{
  return self->_mutableSelectedActionSets;
}

- (void)setMutableSelectedActionSets:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSelectedActionSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSelectedActionSets, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
