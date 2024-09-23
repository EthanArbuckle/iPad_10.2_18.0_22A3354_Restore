@implementation HUGridActionSetListViewController

- (HUGridActionSetListViewController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRoom_onlyShowFavorites_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUGridActionSetListViewController.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUGridActionSetListViewController init]",
    v5);

  return 0;
}

- (HUGridActionSetListViewController)initWithRoom:(id)a3 onlyShowFavorites:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HUGridFlowLayout *v7;
  HUGridActionSetItemManager *v8;
  HUGridActionSetListViewController *v9;
  HUGridActionSetListViewController *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HUGridFlowLayout);
  v8 = -[HUGridActionSetItemManager initWithDelegate:]([HUGridActionSetItemManager alloc], "initWithDelegate:", self);
  -[HUGridActionSetItemManager setRoom:](v8, "setRoom:", v6);

  -[HUGridActionSetItemManager setOnlyShowsFavorites:](v8, "setOnlyShowsFavorites:", v4);
  v12.receiver = self;
  v12.super_class = (Class)HUGridActionSetListViewController;
  v9 = -[HUControllableItemCollectionViewController initWithItemManager:collectionViewLayout:](&v12, sel_initWithItemManager_collectionViewLayout_, v8, v7);
  v10 = v9;
  if (v9)
    -[HUGridActionSetListViewController setShouldAllowItemPresentation:](v9, "setShouldAllowItemPresentation:", 1);

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUGridActionSetListViewController;
  -[HUControllableItemCollectionViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetListViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[HUGridActionSetListViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);

  -[HUGridActionSetListViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);

  -[HUGridActionSetListViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentInsetAdjustmentBehavior:", 2);

}

- (HUGridLayoutOptions)layoutOptions
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class();
  -[HUGridActionSetListViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  objc_msgSend(v6, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUGridLayoutOptions *)v9;
}

- (void)setLayoutOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "setScrollDirection:", -[HUGridActionSetListViewController _scrollDirectionForLayoutOptions:](self, "_scrollDirectionForLayoutOptions:", v5));
  objc_msgSend(v5, "setSectionBottomMargin:", 0.0);
  if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
    v4 = &unk_1E7040FA8;
  else
    v4 = 0;
  objc_msgSend(v5, "setOverrideNumberOfColumns:", v4);
  -[HUGridActionSetListViewController _internalSetLayoutOptions:](self, "_internalSetLayoutOptions:", v5);

}

- (void)_internalSetLayoutOptions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  v5 = objc_opt_class();
  -[HUGridActionSetListViewController collectionViewLayout](self, "collectionViewLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  objc_msgSend(v8, "layoutOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v4);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v8, "setLayoutOptions:", v4);
    if (-[HUGridActionSetListViewController isViewLoaded](self, "isViewLoaded"))
    {
      v24 = v4;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[HUGridActionSetListViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexPathsForVisibleItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
            -[HUGridActionSetListViewController collectionView](self, "collectionView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "cellForItemAtIndexPath:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUItemCollectionViewController itemManager](self, "itemManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "displayedItemAtIndexPath:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUGridActionSetListViewController configureCell:forItem:](self, "configureCell:forItem:", v21, v23);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v16);
      }

      v4 = v24;
    }
  }

}

+ (unint64_t)updateMode
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  objc_class *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (-[HUGridActionSetListViewController actionSetItemManager](self, "actionSetItemManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "actionSetPlaceholderItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "isEqual:", v7),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_opt_class();
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUGridActionSetListViewController;
  -[HUControllableItemCollectionViewController configureCell:forItem:](&v10, sel_configureCell_forItem_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUGridActionSetListViewController layoutOptions](self, "layoutOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeholderSceneCellOptions");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    objc_msgSend(v6, "setLayoutOptions:", v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUGridActionSetListViewController layoutOptions](self, "layoutOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneCellOptions");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[HUGridActionSetListViewController actionSetListViewControllerDelegate](self, "actionSetListViewControllerDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[HUGridActionSetListViewController actionSetListViewControllerDelegate](self, "actionSetListViewControllerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionSetListViewController:futureToUpdateItems:itemUpdateOptions:", self, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend((id)+[HUGridActionSetListViewController superclass](HUGridActionSetListViewController, "superclass"), "instancesRespondToSelector:", a2))
    {
      v18.receiver = self;
      v18.super_class = (Class)HUGridActionSetListViewController;
      -[HUItemCollectionViewController itemManager:futureToUpdateItems:itemUpdateOptions:](&v18, sel_itemManager_futureToUpdateItems_itemUpdateOptions_, v9, v10, v11);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v16;
  }

  return v15;
}

- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridActionSetListViewController;
  -[HUItemCollectionViewController itemManager:didInsertItem:atIndexPath:](&v6, sel_itemManager_didInsertItem_atIndexPath_, a3, a4, a5);
  -[HUGridActionSetListViewController _updateLayoutScrollDirectionIfNeeded](self, "_updateLayoutScrollDirectionIfNeeded");
}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridActionSetListViewController;
  -[HUItemCollectionViewController itemManager:didRemoveItem:atIndexPath:](&v6, sel_itemManager_didRemoveItem_atIndexPath_, a3, a4, a5);
  -[HUGridActionSetListViewController _updateLayoutScrollDirectionIfNeeded](self, "_updateLayoutScrollDirectionIfNeeded");
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  objc_super v13;

  v10 = a6;
  v13.receiver = self;
  v13.super_class = (Class)HUGridActionSetListViewController;
  v11 = a5;
  -[HUControllableItemCollectionViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v13, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, a4, v11, v10);
  v12 = objc_msgSend(v11, "count", v13.receiver, v13.super_class);

  if (v12 || objc_msgSend(v10, "count"))
    -[HUGridActionSetListViewController _updateLayoutScrollDirectionIfNeeded](self, "_updateLayoutScrollDirectionIfNeeded");

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[HUGridActionSetListViewController layoutOptions](self, "layoutOptions", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
    v7 = 1;
  else
    v7 = 2;
  objc_msgSend(v6, "pointWidthForNumberOfColumns:", v7);
  v9 = v8;

  -[HUGridActionSetListViewController layoutOptions](self, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneCellOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellHeight");
  v13 = v12;

  v14 = v9;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  -[HUGridActionSetListViewController layoutOptions](self, "layoutOptions", a3, a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v7, "pointWidthForNumberOfColumns:", v8);
  v10 = v9;
  -[HUGridActionSetListViewController layoutOptions](self, "layoutOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "columnSpacing");
  v13 = v10 + v12;

  a5->x = v13 * round(a5->x / v13);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  char v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)+[HUGridActionSetListViewController superclass](HUGridActionSetListViewController, "superclass"), "instancesRespondToSelector:", a2)&& (v11.receiver = self, v11.super_class = (Class)HUGridActionSetListViewController, -[HUControllableItemCollectionViewController collectionView:shouldHighlightItemAtIndexPath:](&v11, sel_collectionView_shouldHighlightItemAtIndexPath_, v7, v8)))
  {
    v9 = 1;
  }
  else
  {
    v9 = -[HUGridActionSetListViewController isEditing](self, "isEditing");
  }

  return v9;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)+[HUGridActionSetListViewController superclass](HUGridActionSetListViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v18.receiver = self;
    v18.super_class = (Class)HUGridActionSetListViewController;
    -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v18, sel_collectionView_didSelectItemAtIndexPath_, v7, v8);
  }
  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12 && -[HUGridActionSetListViewController isEditing](self, "isEditing"))
  {
    -[HUGridActionSetListViewController _detailsViewControllerForActionSetItem:](self, "_detailsViewControllerForActionSetItem:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController hu_delegateForModalPresentation](self, "hu_delegateForModalPresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPresentationDelegate:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v13);
    objc_msgSend(v15, "setModalPresentationStyle:", 2);
    -[HUGridActionSetListViewController parentViewController](self, "parentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "hu_presentPreloadableViewController:animated:", v15, 1);

  }
}

+ (double)requiredHeightWithLayoutOptions:(id)a3 numberOfItems:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = a3;
  if (objc_msgSend(v5, "scrollDirection"))
  {
    v6 = 2;
  }
  else
  {
    objc_msgSend(v5, "overrideNumberOfColumns");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "overrideNumberOfColumns");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

    }
    else
    {
      v10 = floorf((float)objc_msgSend(v5, "numberOfColumns") * 0.5);
    }

    v11 = vcvtps_s32_f32((float)a4 / (float)(uint64_t)v10);
    if (v11 <= 2)
      v6 = 2;
    else
      v6 = v11;
  }
  objc_msgSend(v5, "sceneCellOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellHeight");
  v14 = v13;
  objc_msgSend(v5, "rowSpacing");
  v16 = v15 * (double)(v6 - 1) + v14 * (double)v6;

  return v16;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUGridActionSetListViewController actionSetItemManager](self, "actionSetItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemReorderableAtIndex:", v4);

  return v6;
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HUGridActionSetListViewController actionSetItemManager](self, "actionSetItemManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reorderableActionSetList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v9;
  else
    v6 = 0;
  v7 = v6;

  -[HUGridActionSetListViewController actionSetItemManager](self, "actionSetItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReorderableActionSetList:", v7);

}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[HUGridActionSetListViewController _detailsViewControllerForActionSetItem:](self, "_detailsViewControllerForActionSetItem:", v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSLog(CFSTR("No details view controller for item: %@"), v5);
    v6 = 0;
  }

  return v6;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[HUGridActionSetListViewController actionSetItemManager](self, "actionSetItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionSetPlaceholderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
  {
    -[HUGridActionSetListViewController actionSetListViewControllerDelegate](self, "actionSetListViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HUGridActionSetListViewController actionSetListViewControllerDelegate](self, "actionSetListViewControllerDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSceneTileAction:", self);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HUGridActionSetListViewController;
    -[HUControllableItemCollectionViewController _performTapActionForItem:tappedArea:](&v16, sel__performTapActionForItem_tappedArea_, v6, v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;

  v5 = a4;
  if (-[HUGridActionSetListViewController shouldAllowItemPresentation](self, "shouldAllowItemPresentation"))
  {
    objc_msgSend(v5, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_detailsViewControllerForActionSetItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUSceneActionEditorViewController *v11;

  v4 = a3;
  objc_msgSend(v4, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31140]);
    objc_msgSend(v4, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithExistingObject:inHome:", v7, v9);

    v11 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", v10, 0);
  }
  else
  {
    NSLog(CFSTR("actionSet must not be nil to show the editor"));
    v11 = 0;
  }

  return v11;
}

- (void)_updateLayoutScrollDirectionIfNeeded
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  id v11;

  v3 = objc_opt_class();
  -[HUGridActionSetListViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v11 = v4;
    if (v5)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

  }
  v11 = 0;
LABEL_8:

  v8 = objc_msgSend(v11, "scrollDirection");
  objc_msgSend(v11, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUGridActionSetListViewController _scrollDirectionForLayoutOptions:](self, "_scrollDirectionForLayoutOptions:", v9);

  if (v8 != v10)
    objc_msgSend(v11, "setScrollDirection:", v10);

}

- (int64_t)_scrollDirectionForLayoutOptions:(id)a3
{
  return (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac", a3) & 1) == 0
      && (!objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService")
       || (objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad") & 1) == 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HUGridActionSetListViewControllerDelegate)actionSetListViewControllerDelegate
{
  return (HUGridActionSetListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionSetListViewControllerDelegate);
}

- (void)setActionSetListViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionSetListViewControllerDelegate, a3);
}

- (BOOL)shouldAllowItemPresentation
{
  return self->_shouldAllowItemPresentation;
}

- (void)setShouldAllowItemPresentation:(BOOL)a3
{
  self->_shouldAllowItemPresentation = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_actionSetListViewControllerDelegate);
}

@end
