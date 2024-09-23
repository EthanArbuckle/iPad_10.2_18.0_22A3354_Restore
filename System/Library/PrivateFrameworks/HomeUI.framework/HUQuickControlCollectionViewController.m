@implementation HUQuickControlCollectionViewController

- (HUQuickControlCollectionViewController)initWithItemManager:(id)a3
{
  id v4;
  HUQuickControlCollectionViewLayout *v5;
  HUQuickControlCollectionViewController *v6;
  uint64_t v7;
  NSMapTable *viewControllersKeyedByItem;
  HUQuickControlContentCharacteristicWritingUpdateAdapter *v9;
  HUQuickControlContentCharacteristicWritingUpdateAdapter *characteristicWritingAdapter;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = objc_alloc_init(HUQuickControlCollectionViewLayout);
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlCollectionViewController;
  v6 = -[HUItemCollectionViewController initWithItemManager:collectionViewLayout:](&v13, sel_initWithItemManager_collectionViewLayout_, v4, v5);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    viewControllersKeyedByItem = v6->_viewControllersKeyedByItem;
    v6->_viewControllersKeyedByItem = (NSMapTable *)v7;

    v9 = -[HUQuickControlContentCharacteristicWritingUpdateAdapter initWithItemManager:]([HUQuickControlContentCharacteristicWritingUpdateAdapter alloc], "initWithItemManager:", v4);
    characteristicWritingAdapter = v6->_characteristicWritingAdapter;
    v6->_characteristicWritingAdapter = v9;

    v6->_disableItemUpdatesForOverrideCharacteristicValueChanges = 0;
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAccessoryObserver:", v6);

  }
  return v6;
}

- (HUQuickControlCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemManager_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlCollectionViewController.m"), 84, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlCollectionViewController initWithItemManager:collectionViewLayout:]",
    v7);

  return 0;
}

- (void)loadView
{
  HUQuickControlCollectionView *v3;
  void *v4;
  HUQuickControlCollectionView *v5;
  HUQuickControlGridLayoutManager *v6;
  void *v7;
  void *v8;
  void *v9;
  HUQuickControlGridLayoutManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionViewController;
  -[HUQuickControlCollectionViewController loadView](&v19, sel_loadView);
  v3 = [HUQuickControlCollectionView alloc];
  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUQuickControlCollectionViewController setCollectionView:](self, "setCollectionView:", v5);

  v6 = [HUQuickControlGridLayoutManager alloc];
  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController layoutOptions](self, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUQuickControlGridLayoutManager initWithCollectionView:itemManager:layoutOptions:](v6, "initWithCollectionView:itemManager:layoutOptions:", v7, v8, v9);
  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutManager:", v10);

  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  objc_msgSend(v13, "constraintEqualToConstant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHeightConstraint:", v16);

  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0CEB3B8], CFSTR("HUQuickControlSectionHeaderViewReuseIdentifier"));

}

- (void)viewDidLoad
{
  void *v2;
  void *v3;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionViewController;
  -[HUItemCollectionViewController viewDidLoad](&v19, sel_viewDidLoad);
  v5 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  }
  else
  {
    -[HUQuickControlCollectionViewController view](self, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  if ((v6 & 1) == 0)
  {

    v7 = v2;
  }

  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", 0);

  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowsHorizontalScrollIndicator:", 0);

  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelaysContentTouches:", 1);

  -[HUQuickControlCollectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  +[HUQuickControlCollectionViewControllerLayoutOptions defaultOptionsForViewSize:](HUQuickControlCollectionViewControllerLayoutOptions, "defaultOptionsForViewSize:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController setLayoutOptions:](self, "setLayoutOptions:", v15);

  -[HUQuickControlCollectionViewController _reconfigureLayoutOptions](self, "_reconfigureLayoutOptions");
  -[HUItemCollectionViewController setWantsPreferredContentSize:](self, "setWantsPreferredContentSize:", 1);
  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__handleCoordinationReachableStatusChanged_, *MEMORY[0x1E0D30580], 0);

}

- (void)viewWillDismiss
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "tearDown");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlCollectionViewController;
  -[HUQuickControlCollectionViewController viewLayoutMarginsDidChange](&v13, sel_viewLayoutMarginsDidChange);
  -[HUQuickControlCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentInset:", v5, v7, v9, v11);

}

- (void)setDisableItemUpdatesForOverrideCharacteristicValueChanges:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_disableItemUpdatesForOverrideCharacteristicValueChanges != a3)
  {
    self->_disableItemUpdatesForOverrideCharacteristicValueChanges = a3;
    v3 = !a3;
    -[HUQuickControlCollectionViewController characteristicWritingAdapter](self, "characteristicWritingAdapter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldIssueItemUpdatesOnCharacteristicOverrideValueChanges:", v3);

  }
}

- (HULayoutAnchorProviding)preferredFrameLayoutGuide
{
  HULayoutAnchorProviding *preferredFrameLayoutGuide;

  preferredFrameLayoutGuide = self->_preferredFrameLayoutGuide;
  if (preferredFrameLayoutGuide)
    return preferredFrameLayoutGuide;
  -[HUQuickControlCollectionViewController view](self, "view");
  return (HULayoutAnchorProviding *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLayoutOptions:(id)a3
{
  void *v3;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    -[HUQuickControlCollectionViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    +[HUQuickControlCollectionViewControllerLayoutOptions defaultOptionsForViewSize:](HUQuickControlCollectionViewControllerLayoutOptions, "defaultOptionsForViewSize:", v6, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_layoutOptions, v5);
  if (!v9)
  {

  }
  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutOptions:", v9);

  if (-[HUQuickControlCollectionViewController isViewLoaded](self, "isViewLoaded"))
    -[HUQuickControlCollectionViewController _reconfigureLayoutOptions](self, "_reconfigureLayoutOptions");

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  HUQuickControlCollectionViewController *v16;
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUQuickControlCollectionViewController;
  -[HUItemCollectionViewController configureCell:forItem:](&v18, sel_configureCell_forItem_, v6, v7);
  v8 = v6;
  -[HUQuickControlCollectionViewController _viewControllerForItem:](self, "_viewControllerForItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__HUQuickControlCollectionViewController_configureCell_forItem___block_invoke;
  v15 = &unk_1E6F54AD0;
  v16 = self;
  v17 = v7;
  v10 = v7;
  __64__HUQuickControlCollectionViewController_configureCell_forItem___block_invoke((uint64_t)&v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v11, v12, v13, v14, v15, v16);

  objc_msgSend(v8, "setViewController:", v9);
}

id __64__HUQuickControlCollectionViewController_configureCell_forItem___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleForItem:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "latestResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    objc_msgSend(*(id *)(a1 + 40), "latestResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  if (!v6)
    goto LABEL_6;
  return v6;
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend((id)+[HUQuickControlCollectionViewController superclass](HUQuickControlCollectionViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v16.receiver = self;
    v16.super_class = (Class)HUQuickControlCollectionViewController;
    -[HUItemCollectionViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v16, sel_itemManager_didUpdateResultsForItem_atIndexPath_, v9, v10, v11);
  }
  -[HUQuickControlCollectionViewController viewControllersKeyedByItem](self, "viewControllersKeyedByItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlCollectionViewController _controlItemsForItem:](self, "_controlItemsForItem:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quickControlItemUpdater:didUpdateResultsForControlItems:", self, v15);

}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend((id)+[HUQuickControlCollectionViewController superclass](HUQuickControlCollectionViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlCollectionViewController;
    -[HUItemCollectionViewController itemManager:didRemoveItem:atIndexPath:](&v13, sel_itemManager_didRemoveItem_atIndexPath_, v9, v10, v11);
  }
  -[HUQuickControlCollectionViewController viewControllersKeyedByItem](self, "viewControllersKeyedByItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v10);

}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HUQuickControlCollectionViewController;
  -[HUItemCollectionViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v20, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, v10, v11, v12, v13);
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v17[3] = &unk_1E6F52988;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v11, "na_each:", v17);
  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2;
  v15[3] = &unk_1E6F52988;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v13, "na_each:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "viewControllersKeyedByItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_controlItemsForItem:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "quickControlItemUpdater:didUpdateResultsForControlItems:", WeakRetained, v7);
}

void __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "viewControllersKeyedByItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  HUQuickControlCollectionViewController *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", *MEMORY[0x1E0CEB3B8], CFSTR("HUQuickControlSectionHeaderViewReuseIdentifier"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedTitleForSection:", objc_msgSend(v6, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "setAttributedTitleText:", v12);
  }
  else
  {
    if (!v8)
      NSLog(CFSTR("Asked for header for a section without a title: %@"), v6);
    objc_msgSend(v10, "setTitleText:", v8);
  }
  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v36 = v12;
    v37 = v8;
    objc_msgSend(v15, "itemSectionForSectionIndex:", objc_msgSend(v6, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "headerAccessoryButtonTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryButtonTitleText:", v17);

    objc_msgSend(v16, "headerAccessoryButtonDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v16, "items");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlCollectionViewController _viewControllerForItem:](self, "_viewControllerForItem:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contentViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EF2840A0))
        v23 = v22;
      else
        v23 = 0;
      objc_msgSend(v16, "setHeaderAccessoryButtonDelegate:", v23);

      HFLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v39 = "-[HUQuickControlCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]";
        v40 = 2112;
        v41 = self;
        v42 = 2112;
        v43 = v6;
        v44 = 2112;
        v45 = v16;
        _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "%s(%@) headerAccessoryButtonDelegate should not be nil (indexPath = %@ / section = %@)", buf, 0x2Au);
      }

    }
    objc_msgSend(v16, "headerAccessoryButtonDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryButtonTarget:", v25);

    objc_msgSend(v10, "setItemSection:", v16);
    objc_msgSend(v10, "setHideAccessoryButton:", objc_msgSend(v16, "hideAccessoryButton"));
    objc_msgSend(v10, "setHideHeaderText:", objc_msgSend(v16, "hideHeaderText"));
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayedItemAtIndexPath:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "latestResults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      v30 = objc_msgSend(v29, "category") == 1;
    else
      v30 = -[HUQuickControlCollectionViewController _determineReachabilityForIndexPath:](self, "_determineReachabilityForIndexPath:", v6);
    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "-[HUQuickControlCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]";
      v40 = 2112;
      v41 = self;
      v42 = 2112;
      v43 = v32;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%s(%@) Setting  reachabilityState = %@ ", buf, 0x20u);

    }
    objc_msgSend(v10, "updateUIForReachabilityState:", v30);

    v12 = v36;
    v8 = v37;
  }
  objc_msgSend(v15, "allDisplayedItems");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34 == 1)
    objc_msgSend(v10, "setHideSeparator:", 1);

  return v10;
}

- (unint64_t)_determineReachabilityForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v28;
  const char *v29;
  __int16 v30;
  HUQuickControlCollectionViewController *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_msgSend(v4, "section");
  objc_msgSend(v9, "itemSectionForSectionIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "mediaProfileContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 136315650;
      v29 = "-[HUQuickControlCollectionViewController _determineReachabilityForIndexPath:]";
      v30 = 2112;
      v31 = self;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%s(%@) Fetching  reachability for MediaAccessory = %@ ", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(v14, "mediaProfileContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewController _fetchReachabilityStateForMediaAccessory:accessType:itemSectionIdentifier:](self, "_fetchReachabilityStateForMediaAccessory:accessType:itemSectionIdentifier:", v17, 0, v18);

    v19 = 1;
  }
  else
  {
    v19 = 2;
  }
  objc_opt_class();
  v20 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v22, "mediaProfileContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1;
    -[HUQuickControlCollectionViewController _fetchReachabilityStateForMediaAccessory:accessType:itemSectionIdentifier:](self, "_fetchReachabilityStateForMediaAccessory:accessType:itemSectionIdentifier:", v23, 1, v24);

  }
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315650;
    v29 = "-[HUQuickControlCollectionViewController _determineReachabilityForIndexPath:]";
    v30 = 2112;
    v31 = self;
    v32 = 2112;
    v33 = v26;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%s(%@) Returning reachabilityState = %@ ", (uint8_t *)&v28, 0x20u);

  }
  return v19;
}

- (void)_fetchReachabilityStateForMediaAccessory:(id)a3 accessType:(unint64_t)a4 itemSectionIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  objc_msgSend(a3, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    NSLog(CFSTR("Accessory can't be nil!"));
  +[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:](HUAlarmsAndTimersAccessUtility, "canAccess:for:withManager:", v10, a4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __116__HUQuickControlCollectionViewController__fetchReachabilityStateForMediaAccessory_accessType_itemSectionIdentifier___block_invoke;
  v14[3] = &unk_1E6F54A58;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  v13 = (id)objc_msgSend(v11, "flatMap:", v14);

}

id __116__HUQuickControlCollectionViewController__fetchReachabilityStateForMediaAccessory_accessType_itemSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 136315906;
    v10 = "-[HUQuickControlCollectionViewController _fetchReachabilityStateForMediaAccessory:accessType:itemSectionIdenti"
          "fier:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) Updating reachability for section %@ to %{BOOL}d", (uint8_t *)&v9, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setReachabilityForHeaderForIdentifier:to:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "BOOLValue"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setReachabilityForHeaderForIdentifier:(id)a3 to:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  HUQuickControlCollectionViewController *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__HUQuickControlCollectionViewController__setReachabilityForHeaderForIdentifier_to___block_invoke;
  v15[3] = &unk_1E6F54AF8;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[HUQuickControlCollectionViewController _setReachabilityForHeaderForIdentifier:to:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%s(%@) Could not find section %@", buf, 0x20u);
    }

  }
  if (v4)
    v12 = 2;
  else
    v12 = 1;
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v18 = "-[HUQuickControlCollectionViewController _setReachabilityForHeaderForIdentifier:to:]";
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@) Setting  reachabilityState = %@ ", buf, 0x20u);

  }
  objc_msgSend(v10, "updateUIForReachabilityState:", v12);

}

uint64_t __84__HUQuickControlCollectionViewController__setReachabilityForHeaderForIdentifier_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "itemSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v9;
}

- (void)_handleCoordinationReachableStatusChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30578];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D30578]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  objc_msgSend(v14, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D30570];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D30570]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v14, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewController _setReachabilityForHeaderForIdentifier:to:](self, "_setReachabilityForHeaderForIdentifier:to:", v11, objc_msgSend(v13, "BOOLValue"));

LABEL_4:
  }

}

- (id)_controlItemsForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "childItemsForItem:ofClass:", v5, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_reconfigureLayoutOptions
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[HUQuickControlCollectionViewController viewControllersKeyedByItem](self, "viewControllersKeyedByItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__HUQuickControlCollectionViewController__reconfigureLayoutOptions__block_invoke;
  v5[3] = &unk_1E6F51390;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);

}

void __67__HUQuickControlCollectionViewController__reconfigureLayoutOptions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "viewControllersKeyedByItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "_titlePositionForItem:", v4);
  objc_msgSend(v7, "setTitlePosition:", v6);

}

- (unint64_t)_titlePositionForItem:(id)a3
{
  void *v3;
  unint64_t v4;

  -[HUQuickControlCollectionViewController layoutOptions](self, "layoutOptions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "titlePosition");

  return v4;
}

- (id)_viewControllerForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HUQuickControlViewControllerConfiguration *v20;
  HUQuickControlViewControllerConfiguration *v21;
  HUQuickControlViewControllerConfiguration *v22;
  uint64_t v23;
  HUQuickControlViewControllerConfiguration *v24;
  void *v25;
  void *v26;
  HUQuickControlViewControllerConfiguration *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v47;
  void *v48;
  void *v49;
  id v50;
  HUQuickControlViewControllerConfiguration *v51;
  void *v52;

  v4 = a3;
  -[HUQuickControlCollectionViewController viewControllersKeyedByItem](self, "viewControllersKeyedByItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0
      && (-[HUItemCollectionViewController itemManager](self, "itemManager"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "quickControlContextForItem:", v4),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      v11 = objc_alloc((Class)objc_msgSend(v10, "quickControlClass"));
      objc_msgSend(v10, "controlItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemUpdater");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v11, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v12, v13, v14, objc_msgSend(v10, "controlOrientation"), objc_msgSend(v10, "preferredControl"));

      objc_msgSend(v15, "setPreferredControl:", objc_msgSend(v10, "preferredControl"));
      objc_msgSend(v15, "setControlOrientation:", objc_msgSend(v10, "controlOrientation"));
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "indexPathForItem:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "itemSectionForSectionIndex:", objc_msgSend(v17, "section"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v15;
      if (-[HUQuickControlViewControllerConfiguration conformsToProtocol:](v20, "conformsToProtocol:", &unk_1EF2840A0))v21 = v20;
      else
        v21 = 0;
      v22 = v21;

      objc_msgSend(v19, "setHeaderAccessoryButtonDelegate:", v22);
      -[HUQuickControlCollectionViewController _createCellContainerForViewController:forItem:](self, "_createCellContainerForViewController:forItem:", v20, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUQuickControlCollectionViewController _controlItemsForItem:](self, "_controlItemsForItem:", v4);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = [HUQuickControlViewControllerConfiguration alloc];
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[HUQuickControlViewControllerConfiguration initWithHome:](v24, "initWithHome:", v26);

      -[HUQuickControlViewControllerConfiguration setItemUpdater:](v27, "setItemUpdater:", self);
      -[HUQuickControlViewControllerConfiguration setCopyItems:](v27, "setCopyItems:", 0);
      v51 = v27;
      v52 = (void *)v23;
      objc_msgSend(MEMORY[0x1E0D31328], "hu_preferredQuickControlGroupContextForControlItems:configuration:", v23, v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "primaryQuickControlContext");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_alloc((Class)objc_msgSend(v49, "quickControlClass"));
      objc_msgSend(v17, "primaryQuickControlContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "controlItems");
      v50 = v4;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "primaryQuickControlContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "home");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "primaryQuickControlContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "itemUpdater");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "primaryQuickControlContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "controlOrientation");
      objc_msgSend(v17, "primaryQuickControlContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v47, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v28, v30, v32, v34, objc_msgSend(v35, "preferredControl"));

      v19 = (void *)v36;
      objc_msgSend(v17, "primaryQuickControlContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPreferredControl:", objc_msgSend(v37, "preferredControl"));

      objc_msgSend(v17, "primaryQuickControlContext");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setControlOrientation:", objc_msgSend(v38, "controlOrientation"));

      if (v19)
      {
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "indexPathForItem:", v50);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "itemSectionForSectionIndex:", objc_msgSend(v40, "section"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v19;
        if (objc_msgSend(v43, "conformsToProtocol:", &unk_1EF2840A0))
          v44 = v43;
        else
          v44 = 0;
        v45 = v44;

        objc_msgSend(v42, "setHeaderAccessoryButtonDelegate:", v45);
        -[HUQuickControlCollectionViewController _createCellContainerForViewController:forItem:](self, "_createCellContainerForViewController:forItem:", v43, v50);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v50;
      }
      else
      {
        v6 = 0;
        v4 = v50;
      }
      v20 = v51;
      v10 = v52;
    }

  }
  return v6;
}

- (id)_createCellContainerForViewController:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUQuickControlCollectionViewCellContainerViewController *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[HUQuickControlCollectionViewCellContainerViewController initWithContentViewController:]([HUQuickControlCollectionViewCellContainerViewController alloc], "initWithContentViewController:", v7);

  -[HUQuickControlCollectionViewCellContainerViewController setTitlePosition:](v8, "setTitlePosition:", -[HUQuickControlCollectionViewController _titlePositionForItem:](self, "_titlePositionForItem:", v6));
  -[HUQuickControlCollectionViewController viewControllersKeyedByItem](self, "viewControllersKeyedByItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v6);

  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController _propagateInteractiveContentStateForChildViewControllers:](self, "_propagateInteractiveContentStateForChildViewControllers:", v10);

  return v8;
}

- (void)_propagateInteractiveContentStateForChildViewControllers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "contentViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlCollectionViewController characteristicWritingAdapter](self, "characteristicWritingAdapter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCharacteristicWritingDelegate:", v10);

        -[HUQuickControlCollectionViewController quickControlHost](self, "quickControlHost");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setQuickControlHost:", v11);

        objc_msgSend(v9, "setUserInteractionEnabled:", -[HUQuickControlCollectionViewController isUserInteractionEnabled](self, "isUserInteractionEnabled"));
        objc_msgSend(v9, "childVCThatRequiresHelper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setQuickControlContentHelper:", self);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)_allViewControllers
{
  void *v2;
  void *v3;
  void *v4;

  -[HUQuickControlCollectionViewController viewControllersKeyedByItem](self, "viewControllersKeyedByItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_allContentViewControllers
{
  void *v2;
  void *v3;

  -[HUQuickControlCollectionViewController _allViewControllers](self, "_allViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_116);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __68__HUQuickControlCollectionViewController__allContentViewControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentViewController");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewController;
  -[HUQuickControlCollectionViewController preferredContentSizeDidChangeForChildContentContainer:](&v6, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[HUQuickControlCollectionViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateLayout");

  }
}

- (id)viewForTouchContinuation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayedItemsInSection:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HUQuickControlCollectionViewController_viewForTouchContinuation__block_invoke;
  v10[3] = &unk_1E6F54B60;
  v10[4] = self;
  objc_msgSend(v4, "na_map:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_109);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForTouchContinuation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __66__HUQuickControlCollectionViewController_viewForTouchContinuation__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_viewControllerForItem:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __66__HUQuickControlCollectionViewController_viewForTouchContinuation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "viewProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (objc_msgSend(v6, "supportsTouchContinuation"))
  {
    v8 = v3;
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF27C0F0))
      v9 = v8;
    else
      v9 = 0;
    v7 = v9;

  }
  return v7;
}

- (id)intrinsicSizeDescriptorForItemAtIndexPath:(id)a3 itemSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlCollectionViewController _viewControllerForItem:](self, "_viewControllerForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicSizeDescriptorForControlSize:", +[HUQuickControlViewControllerCollectionViewCell quickControlSizeForItemSize:](HUQuickControlViewControllerCollectionViewCell, "quickControlSizeForItemSize:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)heightForSupplementaryViewAtIndexPath:(id)a3
{
  double result;

  +[HUQuickControlSectionHeaderView estimatedHeight](HUQuickControlSectionHeaderView, "estimatedHeight", a3);
  return result;
}

- (void)setCharacteristicWritingDelegate:(id)a3
{
  HUQuickControlContentCharacteristicWritingDelegate **p_characteristicWritingDelegate;
  id v5;
  id v6;

  p_characteristicWritingDelegate = &self->_characteristicWritingDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_characteristicWritingDelegate, v5);
  -[HUQuickControlCollectionViewController characteristicWritingAdapter](self, "characteristicWritingAdapter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForwardingCharacteristicWritingDelegate:", v5);

}

- (void)invalidateContentViewLayout
{
  id v2;

  -[HUQuickControlCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

- (void)shouldHideQuickControlHeaderButton:(BOOL)a3 forSectionIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v6 = a4;
  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderButton_forSectionIdentifier___block_invoke;
  v12[3] = &unk_1E6F54AF8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "itemSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHideAccessoryButton:", v4);

  objc_msgSend(v9, "setHideAccessoryButton:", v4);
}

uint64_t __98__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderButton_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "itemSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v9;
}

- (void)shouldHideQuickControlHeaderText:(BOOL)a3 forSectionIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v6 = a4;
  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderText_forSectionIdentifier___block_invoke;
  v12[3] = &unk_1E6F54AF8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "itemSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHideHeaderText:", v4);

  objc_msgSend(v9, "setHideHeaderText:", v4);
}

uint64_t __96__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderText_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "itemSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v9;
}

- (void)setQuickControlHost:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_quickControlHost, a3);
  -[HUQuickControlCollectionViewController _allViewControllers](self, "_allViewControllers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController _propagateInteractiveContentStateForChildViewControllers:](self, "_propagateInteractiveContentStateForChildViewControllers:", v4);

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  id v4;

  self->_userInteractionEnabled = a3;
  -[HUQuickControlCollectionViewController _allViewControllers](self, "_allViewControllers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewController _propagateInteractiveContentStateForChildViewControllers:](self, "_propagateInteractiveContentStateForChildViewControllers:", v4);

}

- (NSSet)affectedCharacteristics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUQuickControlCollectionViewController _allContentViewControllers](self, "_allContentViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_115);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

uint64_t __65__HUQuickControlCollectionViewController_affectedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "affectedCharacteristics");
}

- (id)overrideValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUQuickControlCollectionViewController _allContentViewControllers](self, "_allContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HUQuickControlCollectionViewController_overrideValueForCharacteristic___block_invoke;
  v10[3] = &unk_1E6F54C08;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "overrideValueForCharacteristic:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __73__HUQuickControlCollectionViewController_overrideValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "affectedCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  HUQuickControlCollectionViewController *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  HUQuickControlCollectionViewController *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = self;
  -[HUQuickControlCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15 && objc_msgSend(v4, "hf_isHomePod"))
        {
          objc_msgSend(v4, "mediaProfile");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "settings");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isControllable"))
            v18 = 2;
          else
            v18 = 1;

          HFLogForCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v27 = "-[HUQuickControlCollectionViewController accessoryDidUpdateControllable:]";
            v28 = 2112;
            v29 = v21;
            v30 = 2112;
            v31 = v4;
            v32 = 2112;
            v33 = v20;
            _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%s(%@) accessory [%@]   reachabilityState = %@", buf, 0x2Au);

          }
          objc_msgSend(v15, "updateUIForReachabilityState:", v18);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v9);
  }

}

- (HUQuickControlContentCharacteristicWritingDelegate)characteristicWritingDelegate
{
  return (HUQuickControlContentCharacteristicWritingDelegate *)objc_loadWeakRetained((id *)&self->_characteristicWritingDelegate);
}

- (HUQuickControlContentHosting)quickControlHost
{
  return (HUQuickControlContentHosting *)objc_loadWeakRetained((id *)&self->_quickControlHost);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, a3);
}

- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (BOOL)disableItemUpdatesForOverrideCharacteristicValueChanges
{
  return self->_disableItemUpdatesForOverrideCharacteristicValueChanges;
}

- (NSMapTable)viewControllersKeyedByItem
{
  return self->_viewControllersKeyedByItem;
}

- (HUQuickControlContentCharacteristicWritingUpdateAdapter)characteristicWritingAdapter
{
  return self->_characteristicWritingAdapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicWritingAdapter, 0);
  objc_storeStrong((id *)&self->_viewControllersKeyedByItem, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_quickControlHost);
  objc_destroyWeak((id *)&self->_characteristicWritingDelegate);
}

@end
