@implementation CNUINavigationListViewController

- (void)reloadNavigationListView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (-[CNUINavigationListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNUINavigationListViewController expandedItem](self, "expandedItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewController setDisplayedExpandedItem:](self, "setDisplayedExpandedItem:", v3);

    -[CNUINavigationListViewController navigationListView](self, "navigationListView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

    -[CNUINavigationListViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNUINavigationListViewController parentViewController](self, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transitionCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__CNUINavigationListViewController_reloadNavigationListView__block_invoke;
      v9[3] = &unk_1E204B480;
      v9[4] = self;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v9);

    }
    else
    {
      -[CNUINavigationListViewController updateNavigationListView](self, "updateNavigationListView");
    }
  }
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (void)setExpandedItem:(id)a3
{
  objc_storeStrong((id *)&self->_expandedItem, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNUINavigationListViewController)init
{
  CNUINavigationListViewController *v2;
  CNUINavigationListViewController *v3;
  uint64_t v4;
  CNUINavigationListStyle *navigationListStyle;
  CNUINavigationListViewCellHeightEstimator *v6;
  CNUINavigationListViewCellHeightEstimator *cellHeightEstimator;
  CNUINavigationListViewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNUINavigationListViewController;
  v2 = -[CNUINavigationListViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
  {
    v2->_contentAlignment = 0;
    +[CNUINavigationListStyleProvider defaultStyle](CNUINavigationListStyleProvider, "defaultStyle");
    v4 = objc_claimAutoreleasedReturnValue();
    navigationListStyle = v3->_navigationListStyle;
    v3->_navigationListStyle = (CNUINavigationListStyle *)v4;

    v6 = -[CNUINavigationListViewCellHeightEstimator initWithNavigationListStyle:]([CNUINavigationListViewCellHeightEstimator alloc], "initWithNavigationListStyle:", v3->_navigationListStyle);
    cellHeightEstimator = v3->_cellHeightEstimator;
    v3->_cellHeightEstimator = v6;

    v8 = v3;
  }

  return v3;
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListStyle, a3);
  -[CNUINavigationListViewController styleUpdated](self, "styleUpdated");
}

- (void)styleUpdated
{
  CNUINavigationListViewCellHeightEstimator *v3;
  void *v4;
  CNUINavigationListViewCellHeightEstimator *v5;

  v3 = [CNUINavigationListViewCellHeightEstimator alloc];
  -[CNUINavigationListViewController navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNUINavigationListViewCellHeightEstimator initWithNavigationListStyle:](v3, "initWithNavigationListStyle:", v4);
  -[CNUINavigationListViewController setCellHeightEstimator:](self, "setCellHeightEstimator:", v5);

  -[CNUINavigationListViewController reloadNavigationListView](self, "reloadNavigationListView");
}

- (void)loadView
{
  CNUINavigationListView *v3;
  CNUINavigationListView *v4;

  v3 = [CNUINavigationListView alloc];
  v4 = -[CNUINavigationListView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNUINavigationListView setDataSource:](v4, "setDataSource:", self);
  -[CNUINavigationListView setDelegate:](v4, "setDelegate:", self);
  -[CNUINavigationListView setNavigationListViewDataSource:](v4, "setNavigationListViewDataSource:", self);
  -[CNUINavigationListView setNavigationListViewDelegate:](v4, "setNavigationListViewDelegate:", self);
  -[CNUINavigationListView setSeparatorStyle:](v4, "setSeparatorStyle:", 1);
  -[CNUINavigationListViewController setView:](self, "setView:", v4);
  -[CNUINavigationListViewController setNavigationListView:](self, "setNavigationListView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNUINavigationListViewController;
  -[CNUINavigationListViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[CNUINavigationListViewController navigationListView](self, "navigationListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[CNUINavigationListViewController cellHeightEstimator](self, "cellHeightEstimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "estimatedCellHeight");
  v7 = v6;
  -[CNUINavigationListViewController cellSeparatorHeight](self, "cellSeparatorHeight");
  objc_msgSend(v3, "setEstimatedRowHeight:", v7 + v8);

  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTableFooterView:", v10);

  -[CNUINavigationListViewController updateNavigationListView](self, "updateNavigationListView");
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
  v9.super_class = (Class)CNUINavigationListViewController;
  v7 = a4;
  -[CNUINavigationListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__CNUINavigationListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E204B480;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_693);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSComparisonResult v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  -[CNUINavigationListViewController itemAtIndexPath:](self, "itemAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "itemRequiresDetailCell:", v5))
  {
    -[CNUINavigationListViewController dequeueReusableDetailCell](self, "dequeueReusableDetailCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentAlignment:", -[CNUINavigationListViewController contentAlignment](self, "contentAlignment"));
  }
  else
  {
    -[CNUINavigationListViewController dequeueReusableStandardCell](self, "dequeueReusableStandardCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[CNUINavigationListViewController canExpandItem:](self, "canExpandItem:", v5))
  {
    objc_msgSend(v5, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNUINavigationListViewController canExpandItem:](self, "canExpandItem:", v7) ^ 1;

  }
  else
  {
    v8 = 1;
  }
  -[CNUINavigationListViewController navigationListStyle](self, "navigationListStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationListStyle:", v9);

  objc_msgSend(v6, "accessoryImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = UIContentSizeCategoryCompareToCategory(v11, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]);
  v13 = (uint64_t *)MEMORY[0x1E0DC4CD0];
  if (v12 != NSOrderedAscending)
    v13 = (uint64_t *)MEMORY[0x1E0DC4CD8];
  v14 = *v13;

  objc_msgSend(v5, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithConfiguration:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v17);

  objc_msgSend(v5, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  objc_msgSend(v5, "subtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryControlExpanded:animated:", v5 == v23, 0);

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  -[CNUINavigationListViewController items](self, "items", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewController itemsForItem:](self, "itemsForItem:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  v9 = objc_msgSend(v5, "count");

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return objc_msgSend(a3, "numberOfSections") - 1 != a4;
}

- (double)cellSeparatorHeight
{
  double result;
  char v3;
  void *v4;
  double v5;
  double v6;

  if (!dyld_program_sdk_at_least()
    || (v3 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"),
        result = 1.0,
        (v3 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", result);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    return 1.0 / v6;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return !a4
      && -[CNUINavigationListViewController showFirstSectionTopSeparator](self, "showFirstSectionTopSeparator", a3);
}

- (void)expandItem:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {
    -[CNUINavigationListViewController setExpandedItem:](self, "setExpandedItem:", v5);
    -[CNUINavigationListViewController updateNavigationListView](self, "updateNavigationListView");
  }

}

- (void)toggleItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v9)
  {
    objc_msgSend(v9, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNUINavigationListViewController canExpandItem:](self, "canExpandItem:", v6);

    v5 = v9;
    if (v7)
    {
      objc_msgSend(v9, "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUINavigationListViewController expandItem:](self, "expandItem:", v8);

      goto LABEL_7;
    }
  }
  else
  {

    v5 = v9;
  }
  if (-[CNUINavigationListViewController canExpandItem:](self, "canExpandItem:", v5))
    -[CNUINavigationListViewController expandItem:](self, "expandItem:", v9);
LABEL_7:

}

- (BOOL)canExpandItem:(id)a3
{
  void *v3;
  BOOL v4;

  if (a3)
  {
    objc_msgSend(a3, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;
  }
  else
  {
    -[CNUINavigationListViewController items](self, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v3, "count") > 1;
  }

  return v4;
}

- (void)navigationListView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;

  -[CNUINavigationListViewController itemAtIndexPath:](self, "itemAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewController toggleItem:](self, "toggleItem:", v5);

}

- (id)dequeueReusableStandardCell
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUINavigationListViewController navigationListView](self, "navigationListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUINavigationListViewCell reuseIdentifier](CNUINavigationListViewCell, "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dequeueReusableDetailCell
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUINavigationListViewController navigationListView](self, "navigationListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUINavigationListViewDetailCell reuseIdentifier](CNUINavigationListViewDetailCell, "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)itemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewController itemsForItem:](self, "itemsForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemAtIndexPath:(id)a3
{
  return -[CNUINavigationListViewController itemAtIndex:](self, "itemAtIndex:", objc_msgSend(a3, "row"));
}

- (id)itemsForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNUINavigationListViewController items](self, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (CGSize)contentSizeForExpandedItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  __objc2_class *v14;
  void *v15;
  void *v16;
  void *v17;
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
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGSize result;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUINavigationListViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  -[CNUINavigationListViewController itemsForItem:](self, "itemsForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "itemRequiresDetailCell:", v13))
          v14 = CNUINavigationListViewDetailCell;
        else
          v14 = CNUINavigationListViewCell;
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subtitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNUINavigationListViewController navigationListStyle](self, "navigationListStyle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class desiredContentSizeForTitle:subTitle:navigationListStyle:](v14, "desiredContentSizeForTitle:subTitle:navigationListStyle:", v15, v16, v17);
        v19 = v18;
        v21 = v20;

        -[CNUINavigationListViewController cellSeparatorHeight](self, "cellSeparatorHeight");
        v23 = v21 + v22;
        if (v6 < v19)
          v6 = v19;
        v11 = v11 + v23;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }
  -[CNUINavigationListViewController cellSeparatorHeight](self, "cellSeparatorHeight");
  v25 = ceil(v11 + v24);
  -[CNUINavigationListViewController cellSeparatorHeight](self, "cellSeparatorHeight");
  v27 = v26 + 54.0;
  if (v27 >= v25)
    v25 = v27;

  v28 = v6;
  v29 = v25;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)updateNavigationListView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  -[CNUINavigationListViewController expandedItem](self, "expandedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewController contentSizeForExpandedItem:](self, "contentSizeForExpandedItem:", v3);
  v5 = v4;
  v7 = v6;

  -[CNUINavigationListViewController preferredContentSize](self, "preferredContentSize");
  v10 = v5 == v9 && v7 == v8;
  if (!v10 && !-[CNUINavigationListViewController ignoreParentControllerResize](self, "ignoreParentControllerResize"))
    -[CNUINavigationListViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  -[CNUINavigationListViewController updateNavigationListViewStateAnimated:](self, "updateNavigationListViewStateAnimated:", 1);
}

- (void)updateNavigationListViewStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(void *, void *);
  void *v33;
  uint64_t v34;
  void (**v35)(void *, void *);
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void (**v52)(void *, void *);
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  _QWORD aBlock[5];

  v3 = a3;
  -[CNUINavigationListViewController expandedItem](self, "expandedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewController expandedItem](self, "expandedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v10 = 0;
    else
      v10 = 5;
    -[CNUINavigationListViewController navigationListView](self, "navigationListView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginUpdates");

    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke;
    aBlock[3] = &unk_1E2047E10;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    v65[0] = v12;
    v65[1] = 3221225472;
    v65[2] = __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke_2;
    v65[3] = &unk_1E2047E38;
    v65[4] = self;
    v14 = _Block_copy(v65);
    -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewController itemsForItem:](self, "itemsForItem:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUINavigationListViewController expandedItem](self, "expandedItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewController itemsForItem:](self, "itemsForItem:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v16;
    v64 = v13;
    v60 = v14;
    v62 = v10;
    if (v7 == v9)
    {
      -[CNUINavigationListViewController expandedItem](self, "expandedItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v16, "indexOfObject:", v19);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForNavigationListItemIndex:", v44);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      -[CNUINavigationListViewController navigationListView](self, "navigationListView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "cellForRowAtIndexPath:", v29);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v47 = v46;
      else
        v47 = 0;
      v48 = v47;

      -[CNUINavigationListViewController navigationListStyle](self, "navigationListStyle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setNavigationListStyle:", v49);

      -[CNUINavigationListViewController expandedItem](self, "expandedItem");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setAccessoryControlExpanded:animated:", v19 == v50, 1);

      v28 = v18;
      v51 = objc_msgSend(v18, "indexOfObject:", v19);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForNavigationListItemIndex:", v51);
      v52 = (void (**)(void *, void *))v14;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v13 + 2))(v13, v19);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2](v52, v19);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "compare:", v33))
      {
        -[CNUINavigationListViewController navigationListView](self, "navigationListView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "moveRowAtIndexPath:toIndexPath:", v29, v33);

      }
      -[CNUINavigationListViewController navigationListView](self, "navigationListView", v60);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "first");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "deleteRowsAtIndexPaths:withRowAnimation:", v55, v62);

      -[CNUINavigationListViewController navigationListView](self, "navigationListView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "second");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "deleteRowsAtIndexPaths:withRowAnimation:", v57, v62);

      -[CNUINavigationListViewController navigationListView](self, "navigationListView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "insertRowsAtIndexPaths:withRowAnimation:", v37, v62);
    }
    else
    {
      -[CNUINavigationListViewController displayedExpandedItem](self, "displayedExpandedItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "indexOfObject:", v19);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForNavigationListItemIndex:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      -[CNUINavigationListViewController navigationListView](self, "navigationListView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cellForRowAtIndexPath:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
      v25 = v24;

      -[CNUINavigationListViewController navigationListStyle](self, "navigationListStyle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setNavigationListStyle:", v26);

      -[CNUINavigationListViewController expandedItem](self, "expandedItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAccessoryControlExpanded:animated:", v19 == v27, 1);

      v28 = v18;
      v29 = v21;
      v30 = objc_msgSend(v18, "indexOfObject:", v19);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForNavigationListItemIndex:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void (**)(void *, void *))v14;
      v33 = (void *)v31;
      v32[2](v32, v19);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void (**)(void *, void *))v13;
      v36 = (void *)v34;
      v35[2](v35, v19);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "compare:", v33))
      {
        -[CNUINavigationListViewController navigationListView](self, "navigationListView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "moveRowAtIndexPath:toIndexPath:", v21, v33);

      }
      -[CNUINavigationListViewController navigationListView](self, "navigationListView", v60);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "deleteRowsAtIndexPaths:withRowAnimation:", v36, v62);

      -[CNUINavigationListViewController navigationListView](self, "navigationListView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "first");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "insertRowsAtIndexPaths:withRowAnimation:", v41, v62);

      -[CNUINavigationListViewController navigationListView](self, "navigationListView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "second");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "insertRowsAtIndexPaths:withRowAnimation:", v43, v62);

    }
    -[CNUINavigationListViewController expandedItem](self, "expandedItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewController setDisplayedExpandedItem:](self, "setDisplayedExpandedItem:", v58);

    -[CNUINavigationListViewController navigationListView](self, "navigationListView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "endUpdates");

  }
}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;

  v4 = a3;
  -[CNUINavigationListViewController items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    if (!-[CNUINavigationListViewController canExpandItem:](self, "canExpandItem:", v4))
      goto LABEL_3;
LABEL_6:
    v10 = 1;
    goto LABEL_9;
  }
  -[CNUINavigationListViewController items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v4, "defaultItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;

  }
LABEL_9:

  return v10;
}

- (void)startTrackingRolloverWithGestureRecognizer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNUINavigationListViewController navigationListView](self, "navigationListView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTrackingSelectionFromGestureRecognizer:", v4);

}

- (BOOL)navigationListView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  CNUINavigationListViewController *v4;
  void *v5;

  v4 = self;
  -[CNUINavigationListViewController itemAtIndexPath:](self, "itemAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[CNUINavigationListViewController canSelectItem:](v4, "canSelectItem:", v5);

  return (char)v4;
}

- (BOOL)navigationListView:(id)a3 shouldSelectRowAtIndexPath:(id)a4
{
  CNUINavigationListViewController *v4;
  void *v5;

  v4 = self;
  -[CNUINavigationListViewController itemAtIndexPath:](self, "itemAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[CNUINavigationListViewController canSelectItem:](v4, "canSelectItem:", v5);

  return (char)v4;
}

- (void)navigationListView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[CNUINavigationListViewController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CNUINavigationListViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNUINavigationListViewController itemAtIndexPath:](self, "itemAtIndexPath:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUINavigationListViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationListController:didSelectItem:", self, v9);

    }
  }

}

- (CNUINavigationListView)navigationListView
{
  return self->_navigationListView;
}

- (void)setNavigationListView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListView, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (CNUINavigationListItem)expandedItem
{
  return self->_expandedItem;
}

- (CNUINavigationListViewControllerDelegate)delegate
{
  return (CNUINavigationListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (BOOL)showFirstSectionTopSeparator
{
  return self->_showFirstSectionTopSeparator;
}

- (void)setShowFirstSectionTopSeparator:(BOOL)a3
{
  self->_showFirstSectionTopSeparator = a3;
}

- (CNUINavigationListViewCellHeightEstimator)cellHeightEstimator
{
  return self->_cellHeightEstimator;
}

- (void)setCellHeightEstimator:(id)a3
{
  objc_storeStrong((id *)&self->_cellHeightEstimator, a3);
}

- (CNUINavigationListItem)displayedExpandedItem
{
  return self->_displayedExpandedItem;
}

- (void)setDisplayedExpandedItem:(id)a3
{
  objc_storeStrong((id *)&self->_displayedExpandedItem, a3);
}

- (BOOL)ignoreParentControllerResize
{
  return self->_ignoreParentControllerResize;
}

- (void)setIgnoreParentControllerResize:(BOOL)a3
{
  self->_ignoreParentControllerResize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedExpandedItem, 0);
  objc_storeStrong((id *)&self->_cellHeightEstimator, 0);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandedItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_navigationListView, 0);
}

id __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemsForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    v10 = v6;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v3)
      {
        v13 = v10;
        v10 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForNavigationListItemIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);
      }

      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }
  v14 = (void *)MEMORY[0x1E0D13AF8];
  v15 = (void *)objc_msgSend(v6, "copy");
  v16 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v14, "pairWithFirst:second:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemsForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 != v3)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForNavigationListItemIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

uint64_t __60__CNUINavigationListViewController_reloadNavigationListView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNavigationListView");
}

uint64_t __87__CNUINavigationListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNavigationListViewStateAnimated:", 1);
}

+ (BOOL)itemRequiresDetailCell:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  v4 = *MEMORY[0x1E0D13848];
  objc_msgSend(v3, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") == 0;

  }
  return v6;
}

@end
