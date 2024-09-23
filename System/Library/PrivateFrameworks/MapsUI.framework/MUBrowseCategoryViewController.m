@implementation MUBrowseCategoryViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUBrowseCategoryViewController)initWithMapItem:(id)a3
{
  id v5;
  MUBrowseCategoryViewController *v6;
  MUBrowseCategoryViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUBrowseCategoryViewController;
  v6 = -[MUBrowseCategoryViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MUBrowseCategoryItem *v16;
  void *v17;
  MUBrowseCategoryItem *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)MUBrowseCategoryViewController;
  -[MUBrowseCategoryViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[MUBrowseCategoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  -[MUBrowseCategoryViewController willStartDisplayCategoriesNotificationName](self, "willStartDisplayCategoriesNotificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController _ppt_postNotificationName:object:](self, "_ppt_postNotificationName:object:", v4, 0);

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MUBrowseCategoryViewController mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_browseCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v7, "count"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MUBrowseCategoryViewController mapItem](self, "mapItem", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_browseCategories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        v16 = [MUBrowseCategoryItem alloc];
        -[MUBrowseCategoryViewController traitCollection](self, "traitCollection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MUBrowseCategoryItem initWithCategory:nightMode:](v16, "initWithCategory:nightMode:", v15, objc_msgSend(v17, "userInterfaceStyle") == 2);
        objc_msgSend(v8, "addObject:", v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController setBrowseItems:](self, "setBrowseItems:", v19);

  -[MUBrowseCategoryViewController setupCollectionView](self, "setupCollectionView");
}

- (void)setupCollectionView
{
  MUFixedToTopCollectionViewFlowLayout *v3;
  void *v4;
  void *v5;
  void *v6;
  MUBrowseCategoryCollectionView *v7;
  void *v8;
  MUBrowseCategoryCollectionView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];

  v50[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MUFixedToTopCollectionViewFlowLayout);
  -[MUBrowseCategoryViewController setCollectionViewFlowLayout:](self, "setCollectionViewFlowLayout:", v3);

  -[MUBrowseCategoryViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollDirection:", 0);

  -[MUBrowseCategoryViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumLineSpacing:", 15.0);

  -[MUBrowseCategoryViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumInteritemSpacing:", 0.0);

  v7 = [MUBrowseCategoryCollectionView alloc];
  -[MUBrowseCategoryViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MUBrowseCategoryCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MUBrowseCategoryViewController setCollectionView:](self, "setCollectionView:", v9);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("VenuesBrowseCategoryView"));

  -[MUBrowseCategoryViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDataSource:", self);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  +[MUBrowseCategoryCollectionViewCell reuseIdentifier](MUBrowseCategoryCollectionViewCell, "reuseIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellWithReuseIdentifier:", v19, v20);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScrollEnabled:", 0);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClipsToBounds:", 0);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController collectionViewBottomPadding](self, "collectionViewBottomPadding");
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v27, -v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController setCollectionViewBottomConstraint:](self, "setCollectionViewBottomConstraint:", v29);

  v42 = (void *)MEMORY[0x1E0CB3718];
  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutMarginsGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v44;
  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v32;
  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v37;
  -[MUBrowseCategoryViewController collectionViewBottomConstraint](self, "collectionViewBottomConstraint");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v39);

}

- (double)collectionViewBottomPadding
{
  BOOL v2;
  double result;
  void *v4;
  void *v5;
  void *v6;

  v2 = -[MUBrowseCategoryViewController disableBottomPadding](self, "disableBottomPadding");
  result = 0.0;
  if (!v2)
  {
    if (qword_1EE23BB90 != -1)
      dispatch_once(&qword_1EE23BB90, &__block_literal_global_28);
    v4 = (void *)_MergedGlobals_1_1;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

    result = 15.0;
    if ((_DWORD)v4)
      return 18.0;
  }
  return result;
}

void __61__MUBrowseCategoryViewController_collectionViewBottomPadding__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC4908];
  v5[0] = *MEMORY[0x1E0DC4938];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0DC4920];
  v5[2] = *MEMORY[0x1E0DC4930];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0DC4900];
  v5[4] = *MEMORY[0x1E0DC4918];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0DC48F8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_1_1;
  _MergedGlobals_1_1 = v3;

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double Width;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)MUBrowseCategoryViewController;
  -[MUBrowseCategoryViewController viewWillLayoutSubviews](&v26, sel_viewWillLayoutSubviews);
  if (qword_1EE23BBA0 != -1)
    dispatch_once(&qword_1EE23BBA0, &__block_literal_global_27_0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  if (v6 <= 320.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  -[MUBrowseCategoryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  v12 = v11;

  -[MUBrowseCategoryViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  Width = CGRectGetWidth(v27);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredContentSizeCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0)
  {
    v17 = 85.0;
  }
  else if (objc_msgSend((id)qword_1EE23BB98, "containsObject:", v16))
  {
    objc_msgSend(v3, "pointSize");
    v17 = 110.0;
    if (v18 > 27.0)
    {
      objc_msgSend(v3, "fontWithSize:", 27.0);
      v19 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v19;
    }
  }
  else
  {
    v17 = (Width - v10 - v12 + -3.0) * 0.25;
  }
  -[MUBrowseCategoryViewController preferredCellTitleLabelFont](self, "preferredCellTitleLabelFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isEqual:", v3))
  {

    -[MUBrowseCategoryViewController setPreferredCellSize:](self, "setPreferredCellSize:", v17, 56.0);
    -[MUBrowseCategoryViewController setPreferredCellTitleLabelFont:](self, "setPreferredCellTitleLabelFont:", v3);
LABEL_16:
    -[MUBrowseCategoryViewController collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reloadData");

    goto LABEL_17;
  }
  -[MUBrowseCategoryViewController preferredCellSize](self, "preferredCellSize");
  v22 = v21;
  v24 = v23;

  -[MUBrowseCategoryViewController setPreferredCellSize:](self, "setPreferredCellSize:", v17, 56.0);
  -[MUBrowseCategoryViewController setPreferredCellTitleLabelFont:](self, "setPreferredCellTitleLabelFont:", v3);
  if (v22 != v17 || v24 != 56.0)
    goto LABEL_16;
LABEL_17:

}

void __56__MUBrowseCategoryViewController_viewWillLayoutSubviews__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC48D0];
  v4[0] = *MEMORY[0x1E0DC48D8];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0DC48C0];
  v4[2] = *MEMORY[0x1E0DC48C8];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E0DC48B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EE23BB98;
  qword_1EE23BB98 = v2;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)MUBrowseCategoryViewController;
  -[MUBrowseCategoryViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (v4 >= 1)
  {
    -[MUBrowseCategoryViewController browseItems](self, "browseItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[MUBrowseCategoryViewController browseItems](self, "browseItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "searchCategory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subcategories");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15)
          {

            goto LABEL_12;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = v7;
LABEL_12:

    -[MUBrowseCategoryViewController didDisplayCategoriesNotificationName](self, "didDisplayCategoriesNotificationName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryViewController _ppt_postNotificationName:object:](self, "_ppt_postNotificationName:object:", v16, v13);

    -[MUBrowseCategoryViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[MUBrowseCategoryViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "categoryBrowseViewControllerDidDisplayBrowseCategories:", self);

    }
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[MUBrowseCategoryViewController collectionViewBottomPadding](self, "collectionViewBottomPadding", a3);
  v5 = -v4;
  -[MUBrowseCategoryViewController collectionViewBottomConstraint](self, "collectionViewBottomConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayout");

}

- (void)setPreferredCellSize:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  if (a3.width != self->_preferredCellSize.width || a3.height != self->_preferredCellSize.height)
  {
    self->_preferredCellSize = a3;
    -[MUBrowseCategoryViewController collectionViewFlowLayout](self, "collectionViewFlowLayout");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEstimatedItemSize:", width, height);

  }
}

- (int)placeCardTypeForAnalytics
{
  void *v2;
  int v3;

  -[MUBrowseCategoryViewController mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_browseCategory_placeCardType");

  return v3;
}

- (NSArray)buttons
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MUBrowseCategoryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (v4 < 1)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[MUBrowseCategoryViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUBrowseCategoryViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v6, "addObject:", v10);

    }
    v11 = (void *)objc_msgSend(v6, "copy");

  }
  return (NSArray *)v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double Current;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MUBrowseCategoryViewController browseItems](self, "browseItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[MUBrowseCategoryViewController browseItems](self, "browseItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "searchCategory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryViewController mapItem](self, "mapItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v19 = -[MUBrowseCategoryViewController placeCardTypeForAnalytics](self, "placeCardTypeForAnalytics");
  v20 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "searchCategory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:placeCardType:categoriesDisplayed:categorySelected:", 2004, 201, v16, v17, v19, v20, Current, v21);

  objc_msgSend(v7, "searchCategory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MUBrowseCategoryViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      -[MUBrowseCategoryViewController delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchCategory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "categoryBrowseViewController:didTapOnSearchCategory:", self, v26);

    }
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[MUBrowseCategoryViewController browseItems](self, "browseItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  +[MUBrowseCategoryCollectionViewCell reuseIdentifier](MUBrowseCategoryCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUBrowseCategoryViewController preferredCellSize](self, "preferredCellSize");
  objc_msgSend(v9, "setPreferredSize:");
  -[MUBrowseCategoryViewController preferredCellTitleLabelFont](self, "preferredCellTitleLabelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredTitleLabelFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleLabelTextColor:", v11);

  -[MUBrowseCategoryViewController browseItems](self, "browseItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "row");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBrowseItem:", v14);

  return v9;
}

- (id)willStartDisplayCategoriesNotificationName
{
  return CFSTR("WillStartDisplayBrowseCategories");
}

- (id)didDisplayCategoriesNotificationName
{
  return CFSTR("DidDisplayBrowseCategories");
}

- (void)_ppt_postNotificationName:(id)a3 object:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", v7, v6);

}

- (MUBrowseCategoryViewControllerDelegate)delegate
{
  return (MUBrowseCategoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disableBottomPadding
{
  return self->_disableBottomPadding;
}

- (void)setDisableBottomPadding:(BOOL)a3
{
  self->_disableBottomPadding = a3;
}

- (NSArray)browseItems
{
  return self->_browseItems;
}

- (void)setBrowseItems:(id)a3
{
  objc_storeStrong((id *)&self->_browseItems, a3);
}

- (MUBrowseCategoryCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (MUFixedToTopCollectionViewFlowLayout)collectionViewFlowLayout
{
  return self->_collectionViewFlowLayout;
}

- (void)setCollectionViewFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, a3);
}

- (NSLayoutConstraint)collectionViewBottomConstraint
{
  return self->_collectionViewBottomConstraint;
}

- (void)setCollectionViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewBottomConstraint, a3);
}

- (CGSize)preferredCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredCellSize.width;
  height = self->_preferredCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIFont)preferredCellTitleLabelFont
{
  return self->_preferredCellTitleLabelFont;
}

- (void)setPreferredCellTitleLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_preferredCellTitleLabelFont, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_preferredCellTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_collectionViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_browseItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
