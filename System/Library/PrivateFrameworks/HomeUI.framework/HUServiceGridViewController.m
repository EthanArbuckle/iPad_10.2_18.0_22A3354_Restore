@implementation HUServiceGridViewController

- (HUServiceGridViewController)initWithItemManager:(id)a3
{
  id v4;
  HUGridFlowLayout *v5;
  HUServiceGridViewController *v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_alloc_init(HUGridFlowLayout);
  v8.receiver = self;
  v8.super_class = (Class)HUServiceGridViewController;
  v6 = -[HUControllableItemCollectionViewController initWithItemManager:collectionViewLayout:](&v8, sel_initWithItemManager_collectionViewLayout_, v4, v5);

  if (v6)
  {
    -[HUControllableItemCollectionViewController setContentColorStyle:](v6, "setContentColorStyle:", 1);
    v6->_contentMargins = 11;
    v6->_scrollDirection = 0;
    v6->_shouldShowLoadingState = 1;
    if (-[HUServiceGridViewController isViewLoaded](v6, "isViewLoaded"))
      NSLog(&CFSTR("HUServiceGridViewController view was loaded too early in the initialization process. Something in the initi"
                   "alizer probably called something that loaded the view. This is bad, because it makes us do extra unnecessary work.").isa);
  }

  return v6;
}

- (HUServiceGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemManager_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceGridViewController.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceGridViewController initWithItemManager:collectionViewLayout:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUServiceGridViewController;
  -[HUControllableItemCollectionViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[HUServiceGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = *MEMORY[0x1E0CEB3B8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v7);

  -[HUServiceGridViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlwaysBounceVertical:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceGridViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUServiceGridViewController;
  -[HUControllableItemCollectionViewController viewWillAppear:](&v19, sel_viewWillAppear_, a3);
  -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewSize");
  v6 = v5;
  v8 = v7;
  -[HUServiceGridViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  if (v6 != v11 || v8 != v13)
  {
    -[HUServiceGridViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceGridViewController setLayoutOptions:](self, "setLayoutOptions:", v18);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUServiceGridViewController;
  -[HUServiceGridViewController viewWillLayoutSubviews](&v18, sel_viewWillLayoutSubviews);
  -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewSize");
  v5 = v4;
  v7 = v6;
  -[HUServiceGridViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    -[HUServiceGridViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceGridViewController setLayoutOptions:](self, "setLayoutOptions:", v17);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUServiceGridViewController;
  v7 = a4;
  -[HUServiceGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HUServiceGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6F4CB78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __82__HUServiceGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v2, "_defaultLayoutOptionsForViewSize:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLayoutOptions:", v5);

}

- (void)setScrollDirection:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  if (self->_scrollDirection != a3)
  {
    self->_scrollDirection = a3;
    -[HUServiceGridViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceGridViewController setLayoutOptions:](self, "setLayoutOptions:", v6);

  }
}

- (void)setContentMargins:(unint64_t)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  if (self->_contentMargins != a3)
  {
    self->_contentMargins = a3;
    -[HUServiceGridViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    -[HUServiceGridViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceGridViewController setLayoutOptions:](self, "setLayoutOptions:", v6);

  }
}

- (CGSize)preferredContentSizeForCollectionViewContentSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  v18.receiver = self;
  v18.super_class = (Class)HUServiceGridViewController;
  -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](&v18, sel_preferredContentSizeForCollectionViewContentSize_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (-[HUServiceGridViewController scrollDirection](self, "scrollDirection") == 1)
  {
    -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointWidthForNumberOfColumns:", 1);
    v10 = v9;
    -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionTopMargin");
    v13 = v10 + v12;
    -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionBottomMargin");
    v7 = v13 + v15;

  }
  v16 = v5;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (unint64_t)itemTypeForItem:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUServiceGridViewController;
  -[HUControllableItemCollectionViewController _performTapActionForItem:tappedArea:](&v16, sel__performTapActionForItem_tappedArea_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HUServiceGridViewController__performTapActionForItem_tappedArea___block_invoke;
  v12[3] = &unk_1E6F54D78;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v13 = v9;
  objc_msgSend(v8, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

id __67__HUServiceGridViewController__performTapActionForItem_tappedArea___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceGridViewController:didTapItem:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  void *v4;

  if (-[HUServiceGridViewController itemTypeForItem:](self, "itemTypeForItem:", a3, a4) > 1)
    v4 = 0;
  else
    v4 = (void *)objc_opt_class();
  return (Class)v4;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUServiceGridViewController;
  -[HUControllableItemCollectionViewController configureCell:forItem:](&v18, sel_configureCell_forItem_, v6, a4);
  v7 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF242610))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceCellOptions");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLayoutOptions:", v12);

    objc_msgSend(v10, "setShouldShowLoadingState:", -[HUServiceGridViewController shouldShowLoadingState](self, "shouldShowLoadingState"));
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v12) = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldShowRoomName:", objc_msgSend(v14, "shouldGroupByRoom") ^ 1);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneCellOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLayoutOptions:", v14);
    goto LABEL_9;
  }
LABEL_11:
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUServiceGridViewController traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceStyle");

    if (v16 == 1)
    {
      objc_msgSend(v9, "layoutOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOnStateBorderStyle:", 1);

    }
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v6 = a5;
  -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HUServiceGridViewController itemTypeForItem:](self, "itemTypeForItem:", v9);
  if (v10 == 1)
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
      objc_msgSend(v7, "pointWidthForNumberOfColumns:", 2);
    else
      objc_msgSend(v7, "pointWidthForFullWidthCell");
    v13 = v12;
    objc_msgSend(v7, "sceneCellOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellHeight");
    v14 = v16;

    objc_msgSend(v7, "sceneCellOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lineHeight");
    v20 = v19;
    objc_msgSend(v7, "sceneCellOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "descriptionFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lineHeight");
    v24 = v23 + v20 * 2.0;

    if (v14 < v24)
      v14 = v24;
  }
  else if (v10)
  {
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      objc_msgSend(v7, "fixedWidthForCell");
    else
      objc_msgSend(v7, "pointWidthForNumberOfColumns:", 1);
    v14 = v11;
    v13 = v11;
  }

  v25 = v13;
  v26 = v14;
  result.height = v26;
  result.width = v25;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleForSection:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfSections") - 1;

    v12 = 0.0;
    v13 = 0.0;
    if (v11 != a5)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "itemSectionForSectionIndex:", a5 + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
        v13 = 17.5;
      else
        v13 = 0.0;
    }
    objc_msgSend(v7, "sectionLeadingMargin");
    v19 = v18;
  }
  else
  {
    objc_msgSend(v7, "sectionTopMargin");
    v12 = v20;
    objc_msgSend(v7, "sectionLeadingMargin");
    v19 = v21;
    objc_msgSend(v7, "sectionBottomMargin");
    v13 = v22;
  }
  objc_msgSend(v7, "sectionTrailingMargin");
  v24 = v23;

  v25 = v12;
  v26 = v19;
  v27 = v13;
  v28 = v24;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[HUItemCollectionViewController itemManager](self, "itemManager", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleForSection:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = *MEMORY[0x1E0CEBC10];
    -[HUServiceGridViewController headerViewHeightForSectionIndex:](self, "headerViewHeightForSectionIndex:", a5);
    v11 = v10;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;

  -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowSpacing");
  v7 = v6;

  return v7;
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
  void *v27;

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

  -[HUServiceGridViewController layoutOptionsForSection:](self, "layoutOptionsForSection:", objc_msgSend(v9, "section"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v13);
  objc_msgSend(v20, "directionalLayoutMargins");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v19, "sectionTitleMargin");
  v26 = v25;
  objc_msgSend(v19, "sectionTitleMargin");
  objc_msgSend(v20, "setDirectionalLayoutMargins:", v22, v26, v24);
  if ((-[HUServiceGridViewController contentMargins](self, "contentMargins") & 0xA) == 0)
    objc_msgSend(v20, "setAxesPreservingSuperviewLayoutMargins:", 0);
  objc_msgSend(v18, "setContentConfiguration:", v20);
  objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundConfiguration:", v27);

  return v18;
}

- (double)headerViewHeightForSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
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

- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3
{
  double height;
  double width;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a3.height;
  width = a3.width;
  v6 = objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom");
  v7 = &unk_1E7040F90;
  if (!v6)
    v7 = 0;
  v8 = (void *)MEMORY[0x1E0D319D0];
  v9 = v7;
  +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", objc_msgSend(v8, "isAMac"), v9, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setContentColorStyle:", -[HUControllableItemCollectionViewController contentColorStyle](self, "contentColorStyle"));
  if ((-[HUServiceGridViewController contentMargins](self, "contentMargins") & 1) == 0)
    objc_msgSend(v10, "setSectionTopMargin:", 0.0);
  if ((-[HUServiceGridViewController contentMargins](self, "contentMargins") & 2) == 0)
    objc_msgSend(v10, "setSectionLeadingMargin:", 0.0);
  if ((-[HUServiceGridViewController contentMargins](self, "contentMargins") & 4) == 0)
    objc_msgSend(v10, "setSectionBottomMargin:", 0.0);
  if ((-[HUServiceGridViewController contentMargins](self, "contentMargins") & 8) == 0)
    objc_msgSend(v10, "setSectionTrailingMargin:", 0.0);
  objc_msgSend(v10, "sectionTitleMargin");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "sectionLeadingMargin");
  v16 = v15;
  objc_msgSend(v10, "sectionTrailingMargin");
  objc_msgSend(v10, "setSectionTitleMargin:", v12, v16, v14, v17);
  objc_msgSend(v10, "setSectionBottomToNextSectionTitleBaselineDistance:", 38.0);
  objc_msgSend(v10, "setScrollDirection:", -[HUServiceGridViewController scrollDirection](self, "scrollDirection"));
  return v10;
}

- (HUGridLayoutOptions)layoutOptions
{
  void *v2;
  void *v3;
  void *v4;

  -[HUServiceGridViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUGridLayoutOptions *)v4;
}

- (void)setLayoutOptions:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  -[HUServiceGridViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutOptions:", v4);

  if ((v6 & 1) == 0)
    -[HUServiceGridViewController layoutOptionsDidChange](self, "layoutOptionsDidChange");
}

- (void)layoutOptionsDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HUServiceGridViewController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "serviceCellOptions");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          -[HUServiceGridViewController layoutOptions](self, "layoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sceneCellOptions");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (void *)v11;
        objc_msgSend(v9, "setLayoutOptions:", v11);

LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (unint64_t)contentMargins
{
  return self->_contentMargins;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (BOOL)shouldShowLoadingState
{
  return self->_shouldShowLoadingState;
}

- (void)setShouldShowLoadingState:(BOOL)a3
{
  self->_shouldShowLoadingState = a3;
}

- (HUServiceGridViewControllerDelegate)delegate
{
  return (HUServiceGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
