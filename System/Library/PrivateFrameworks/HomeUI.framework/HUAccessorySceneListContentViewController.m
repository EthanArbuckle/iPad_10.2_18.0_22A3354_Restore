@implementation HUAccessorySceneListContentViewController

+ (id)computeNumberOfItemsToDisplayForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5
{
  return +[HUAccessorySceneListContentItemManager computeNumberOfItemsToDisplayForContentSource:serviceLikeItem:home:](HUAccessorySceneListContentItemManager, "computeNumberOfItemsToDisplayForContentSource:serviceLikeItem:home:", a3, a4, a5);
}

- (HUAccessorySceneListContentViewController)initWithServiceLikeItem:(id)a3 contentSource:(unint64_t)a4 selectionType:(unint64_t)a5
{
  id v9;
  HUAccessorySceneListContentItemManager *v10;
  HUAccessorySceneListContentViewController *v11;
  HUAccessorySceneListContentViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = -[HUAccessorySceneListContentItemManager initWithDelegate:contentSource:serviceLikeItem:]([HUAccessorySceneListContentItemManager alloc], "initWithDelegate:contentSource:serviceLikeItem:", self, a4, v9);
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySceneListContentViewController;
  v11 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v14, sel_initWithServiceGridItemManager_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceLikeItem, a3);
    v12->_contentSource = a4;
    v12->_selectionType = a5;
    v12->_includeTopMargin = 1;
  }

  return v12;
}

- (id)commitChangesToSelectedActionBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitSelectionChangesWithSelectedItems:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)selectedActionSetBuilders
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HUAccessorySceneListContentViewController_selectedActionSetBuilders__block_invoke;
  v7[3] = &unk_1E6F52F58;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

id __70__HUAccessorySceneListContentViewController_selectedActionSetBuilders__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSetBuilderForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_persistAddedSuggestions = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersistAddedSuggestions:", v3);

}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  return -[HUAccessorySceneListContentViewController selectionType](self, "selectionType", a3, a4) == 1;
}

- (void)didChangeSelection
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUAccessorySceneListContentViewController;
  -[HUSelectableServiceGridViewController didChangeSelection](&v7, sel_didChangeSelection);
  -[HUAccessorySceneListContentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HUAccessorySceneListContentViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySceneListContentViewController selectedActionSetBuilders](self, "selectedActionSetBuilders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneListContentViewController:didUpdateSelectedActionSetBuilders:", self, v6);

  }
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySceneListContentViewController;
  -[HUServiceGridViewController layoutOptionsForSection:](&v6, sel_layoutOptionsForSection_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionLeadingMargin:", 0.0);
  objc_msgSend(v4, "setSectionTrailingMargin:", 0.0);
  if (!-[HUAccessorySceneListContentViewController includeTopMargin](self, "includeTopMargin"))
    objc_msgSend(v4, "setSectionTopMargin:", 0.0);
  return v4;
}

- (unint64_t)itemTypeForItem:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUAccessorySceneListContentViewController;
    v5 = -[HUServiceGridViewController itemTypeForItem:](&v7, sel_itemTypeForItem_, v4);
  }

  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUAccessorySceneListContentViewController;
  -[HUSelectableServiceGridViewController configureCell:forItem:](&v16, sel_configureCell_forItem_, v6, a4);
  v7 = objc_opt_class();
  v8 = v6;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

LABEL_7:
    v10 = 0;
  }

  if (!-[HUAccessorySceneListContentViewController selectionType](self, "selectionType"))
  {
    if (_MergedGlobals_2 != -1)
      dispatch_once(&_MergedGlobals_2, &__block_literal_global_18);
    v13 = (id)qword_1EF226A00;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v13);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    objc_msgSend(v10, "setAccessoryView:", v14);
    objc_msgSend(v10, "setUseDefaultCellBackgroundColor:", 1);

  }
}

void __67__HUAccessorySceneListContentViewController_configureCell_forItem___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.forward"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226A00;
  qword_1EF226A00 = v0;

}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  HUSceneActionEditorViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  if (-[HUAccessorySceneListContentViewController selectionType](self, "selectionType"))
  {
    v26.receiver = self;
    v26.super_class = (Class)HUAccessorySceneListContentViewController;
    -[HUSelectableServiceGridViewController collectionView:didSelectItemAtIndexPath:](&v26, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAccessorySceneListContentViewController setCurrentlyOpenedItem:](self, "setCurrentlyOpenedItem:", v9);
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionSetBuilderForItem:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "actionSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") == 0;

    v15 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", v11, v14);
    -[HUSceneActionEditorViewController setSceneEditorDelegate:](v15, "setSceneEditorDelegate:", self);
    -[UIViewController hu_delegateForModalPresentation](self, "hu_delegateForModalPresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneActionEditorViewController setPresentationDelegate:](v15, "setPresentationDelegate:", v16);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySceneListContentViewController serviceLikeItem](self, "serviceLikeItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "homeKitObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF347348))
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      objc_msgSend(v17, "addObject:", v21);
    }
    else
    {
      -[HUAccessorySceneListContentViewController serviceLikeItem](self, "serviceLikeItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "services");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unionSet:", v23);

    }
    -[HUSceneActionEditorViewController setPrioritizedAccessories:](v15, "setPrioritizedAccessories:", v17);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v15);
    objc_msgSend(v24, "setModalPresentationStyle:", 2);
    v25 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v24, 1);

  }
}

- (void)sceneEditor:(id)a3 didCommitActionSet:(id)a4
{
  void *v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[HUAccessorySceneListContentViewController currentlyOpenedItem](self, "currentlyOpenedItem", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E28]);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[HUAccessorySceneListContentViewController setCurrentlyOpenedItem:](self, "setCurrentlyOpenedItem:", 0);
  v7 = v20;
  if (v20)
  {
    -[HUAccessorySceneListContentViewController serviceLikeItem](self, "serviceLikeItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_151_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D33550];
    -[HUAccessorySceneListContentViewController serviceLikeItem](self, "serviceLikeItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryCategoryAnalyticsDescription:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "analyticsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v16 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30368]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D302F8]);
    if (v13)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D302D8]);
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30350]);

    }
    -[HUAccessorySceneListContentViewController analyticsPresentationContext](self, "analyticsPresentationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[HUAccessorySceneListContentViewController analyticsPresentationContext](self, "analyticsPresentationContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30338]);

    }
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 14, v15);

    v7 = v20;
  }

}

uint64_t __76__HUAccessorySceneListContentViewController_sceneEditor_didCommitActionSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceType");
}

- (HUAccessorySceneListContentViewControllerDelegate)delegate
{
  return (HUAccessorySceneListContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)contentSource
{
  return self->_contentSource;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (NSString)analyticsPresentationContext
{
  return self->_analyticsPresentationContext;
}

- (void)setAnalyticsPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsPresentationContext, a3);
}

- (BOOL)includeTopMargin
{
  return self->_includeTopMargin;
}

- (void)setIncludeTopMargin:(BOOL)a3
{
  self->_includeTopMargin = a3;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (HFItem)currentlyOpenedItem
{
  return self->_currentlyOpenedItem;
}

- (void)setCurrentlyOpenedItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyOpenedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyOpenedItem, 0);
  objc_storeStrong((id *)&self->_analyticsPresentationContext, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
