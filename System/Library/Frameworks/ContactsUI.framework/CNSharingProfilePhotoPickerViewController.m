@implementation CNSharingProfilePhotoPickerViewController

- (CNSharingProfilePhotoPickerViewController)initWithContact:(id)a3 avatarRecord:(id)a4 avatarItemProviderConfiguration:(id)a5 logger:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNSharingProfilePhotoPickerViewController *v15;
  CNSharingProfilePhotoPickerViewController *v16;
  CNSharingProfilePhotoPickerViewController *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  v15 = -[CNSharingProfilePhotoPickerViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contact, a3);
    objc_storeStrong((id *)&v16->_avatarRecord, a4);
    objc_storeStrong((id *)&v16->_avatarItemProviderConfiguration, a5);
    objc_storeStrong((id *)&v16->_logger, a6);
    v17 = v16;
  }

  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *v11;
  UIImageView *previewView;
  double v13;
  double v14;
  void *v15;
  void *v16;
  UICollectionViewFlowLayout *v17;
  UICollectionViewFlowLayout *selectorLayout;
  UICollectionView *v19;
  UICollectionView *selectorView;
  void *v21;
  void *v22;
  UICollectionView *v23;
  uint64_t v24;
  void *v25;
  CNSharingProfileAvatarItemProvider *v26;
  CNSharingProfileAvatarItemProvider *itemProvider;
  CNSharingProfilePhotoPickerItem *v28;
  CNSharingProfilePhotoPickerItem *selectedItem;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  -[CNSharingProfilePhotoPickerViewController viewDidLoad](&v30, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  self->_isSmallScreenDevice = v5 <= 568.0;
  v6 = objc_alloc(MEMORY[0x1E0DC3890]);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  previewView = self->_previewView;
  self->_previewView = v11;

  -[UIImageView setContentMode:](self->_previewView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_previewView, "setClipsToBounds:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_previewView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSharingProfilePhotoPickerViewController previewEdgeSize](self, "previewEdgeSize");
  v14 = floor(v13 * 0.5);
  -[UIImageView layer](self->_previewView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v14);

  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_previewView);

  v17 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0DC3610]);
  selectorLayout = self->_selectorLayout;
  self->_selectorLayout = v17;

  -[UICollectionViewFlowLayout setScrollDirection:](self->_selectorLayout, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setItemSize:](self->_selectorLayout, "setItemSize:", dbl_18AF8B870[!self->_isSmallScreenDevice], dbl_18AF8B870[!self->_isSmallScreenDevice]);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_selectorLayout, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_selectorLayout, "setMinimumLineSpacing:", 0.0);
  v19 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", self->_selectorLayout, v7, v8, v9, v10);
  selectorView = self->_selectorView;
  self->_selectorView = v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_selectorView, "setBackgroundColor:", v21);

  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_selectorView, "setContentInsetAdjustmentBehavior:", 2);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_selectorView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_selectorView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setDataSource:](self->_selectorView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_selectorView, "setDelegate:", self);
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", self->_selectorView);

  v23 = self->_selectorView;
  v24 = objc_opt_class();
  +[CNSharingProfilePhotoPickerItemCell reuseIdentifier](CNSharingProfilePhotoPickerItemCell, "reuseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

  v26 = -[CNSharingProfileAvatarItemProvider initWithContact:avatarRecord:logger:]([CNSharingProfileAvatarItemProvider alloc], "initWithContact:avatarRecord:logger:", self->_contact, self->_avatarRecord, 0);
  itemProvider = self->_itemProvider;
  self->_itemProvider = v26;

  -[CNSharingProfileAvatarItemProvider setConfiguration:](self->_itemProvider, "setConfiguration:", self->_avatarItemProviderConfiguration);
  -[CNSharingProfilePhotoPickerViewController reloadItems](self, "reloadItems");
  -[CNSharingProfilePhotoPickerViewController updateInteritemSpacing](self, "updateInteritemSpacing");
  if (-[NSArray count](self->_items, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", 0);
    v28 = (CNSharingProfilePhotoPickerItem *)objc_claimAutoreleasedReturnValue();
    selectedItem = self->_selectedItem;
    self->_selectedItem = v28;

  }
  -[CNSharingProfilePhotoPickerViewController setupConstraints](self, "setupConstraints");
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_previewView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController previewEdgeSize](self, "previewEdgeSize");
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v4);

  -[UIImageView widthAnchor](self->_previewView, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_previewView, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v7);

  -[UIImageView centerXAnchor](self->_previewView, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v11);

  -[UIImageView topAnchor](self->_previewView, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 28.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v15);

  -[UICollectionView leadingAnchor](self->_selectorView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v19);

  -[UICollectionView trailingAnchor](self->_selectorView, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v23);

  -[UICollectionView topAnchor](self->_selectorView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_previewView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController previewToSelectorSpacing](self, "previewToSelectorSpacing");
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v26);

  -[UICollectionView heightAnchor](self->_selectorView, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", 100.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v28);

  -[UICollectionView bottomAnchor](self->_selectorView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v32);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
}

- (double)previewToSelectorSpacing
{
  return 36.0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int64_t v5;
  int64_t v6;
  UICollectionView *selectorView;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  -[CNSharingProfilePhotoPickerViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[CNSharingProfilePhotoPickerViewController updatePreviewForSelectedItem](self, "updatePreviewForSelectedItem");
  if (-[NSArray count](self->_items, "count"))
  {
    v5 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", self->_selectedItem);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      if (v5 < (int64_t)-[NSArray count](self->_items, "count"))
      {
        selectorView = self->_selectorView;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](selectorView, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);

        -[UICollectionView contentInset](self->_selectorView, "contentInset");
        -[UICollectionView setContentOffset:](self->_selectorView, "setContentOffset:", -v9, 0.0);
      }
    }
  }
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  -[CNSharingProfilePhotoPickerViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  if (-[NSArray count](self->_items, "count"))
  {
    -[CNSharingProfilePhotoPickerViewController updateInteritemSpacing](self, "updateInteritemSpacing");
    v3 = (double)-[NSArray count](self->_items, "count");
    -[UICollectionViewFlowLayout itemSize](self->_selectorLayout, "itemSize");
    v5 = v4;
    -[UICollectionViewFlowLayout minimumLineSpacing](self->_selectorLayout, "minimumLineSpacing");
    v7 = v6 * (double)(-[NSArray count](self->_items, "count") - 1) + v3 * v5;
    -[CNSharingProfilePhotoPickerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = CGRectGetWidth(v17) - v7;

    v10 = floor(v9 * 0.5);
    if (v10 >= 0.0)
      v11 = v10;
    else
      v11 = 0.0;
    -[UICollectionView contentInset](self->_selectorView, "contentInset");
    if (v15 != v11 || v12 != 0.0 || v14 != 0.0 || v13 != 0.0)
      -[UICollectionView setContentInset:](self->_selectorView, "setContentInset:", 0.0, v11, 0.0, 0.0);
  }
}

- (void)updateInteritemSpacing
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  CGFloat v8;
  CGRect v9;

  if (-[NSArray count](self->_items, "count"))
  {
    if (-[NSArray count](self->_items, "count") > 3)
    {
      v4 = (double)-[NSArray count](self->_items, "count");
      -[UICollectionViewFlowLayout itemSize](self->_selectorLayout, "itemSize");
      v6 = v5 * v4;
      -[CNSharingProfilePhotoPickerViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v8 = CGRectGetWidth(v9) - v6;

      v3 = floor(v8 / (double)-[NSArray count](self->_items, "count"));
      if (v3 < 0.0)
        v3 = 0.0;
    }
    else
    {
      v3 = 13.0;
    }
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_selectorLayout, "setMinimumLineSpacing:", v3);
    -[UICollectionViewFlowLayout invalidateLayout](self->_selectorLayout, "invalidateLayout");
  }
}

- (void)reloadData
{
  void *v3;
  id v4;

  -[UICollectionView indexPathsForSelectedItems](self->_selectorView, "indexPathsForSelectedItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[CNSharingProfileAvatarItemProvider clearCachedItems](self->_itemProvider, "clearCachedItems");
  -[CNSharingProfilePhotoPickerViewController reloadItems](self, "reloadItems");
  -[CNSharingProfilePhotoPickerViewController updateInteritemSpacing](self, "updateInteritemSpacing");
  if (v3)
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_selectorView, "selectItemAtIndexPath:animated:scrollPosition:", v3, 0, 0);

}

- (double)previewEdgeSize
{
  double result;

  result = 160.0;
  if (!self->_isSmallScreenDevice)
    return 200.0;
  return result;
}

- (void)reloadItems
{
  NSArray *v3;
  NSArray *items;

  -[CNSharingProfilePhotoPickerViewController buildItems](self, "buildItems");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v3;

  -[UICollectionView reloadData](self->_selectorView, "reloadData");
}

- (id)buildItems
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CNSharingProfilePhotoPickerItem *v10;
  CNSharingProfilePhotoPickerItem *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CNSharingProfileAvatarItemProvider avatarItems](self->_itemProvider, "avatarItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = objc_alloc_init(CNSharingProfilePhotoPickerItem);
        -[CNSharingProfilePhotoPickerItem setAvatarItem:](v10, "setAvatarItem:", v9, (_QWORD)v14);
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v11 = objc_alloc_init(CNSharingProfilePhotoPickerItem);
  -[CNSharingProfilePhotoPickerItem setSymbolImageName:](v11, "setSymbolImageName:", CFSTR("ellipsis"));
  objc_msgSend(v3, "addObject:", v11);
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (void)updateWithContact:(id)a3 fromFullPhotoPicker:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *items;
  id v12;
  uint64_t v13;
  uint64_t v14;
  CNSharingProfilePhotoPickerItem *v15;
  CNSharingProfilePhotoPickerItem *selectedItem;
  UICollectionView *selectorView;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a4;
  v19 = a3;
  -[CNSharingProfileAvatarItemProvider updateWithContact:fromFullPhotoPicker:](self->_itemProvider, "updateWithContact:fromFullPhotoPicker:", v19, v4);
  -[CNSharingProfilePhotoPickerViewController reloadItems](self, "reloadItems");
  -[CNSharingProfilePhotoPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  v7 = objc_msgSend(v19, "imageDataAvailable");
  v8 = v19;
  if (v7)
  {
    v9 = objc_msgSend(v19, "rawImageType");
    if (v9 == 1 || v9 == 4)
    {
      -[CNSharingProfileAvatarItemProvider photoItem](self->_itemProvider, "photoItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == 2)
        -[CNSharingProfileAvatarItemProvider monogramItem](self->_itemProvider, "monogramItem");
      else
        -[CNSharingProfileAvatarItemProvider animojiItem](self->_itemProvider, "animojiItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v19;
    if (v10)
    {
      items = self->_items;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__CNSharingProfilePhotoPickerViewController_updateWithContact_fromFullPhotoPicker___block_invoke;
      v20[3] = &unk_1E2048D00;
      v12 = v10;
      v21 = v12;
      v13 = -[NSArray _cn_indexOfFirstObjectPassingTest:](items, "_cn_indexOfFirstObjectPassingTest:", v20);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = v13;
        -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v13);
        v15 = (CNSharingProfilePhotoPickerItem *)objc_claimAutoreleasedReturnValue();
        selectedItem = self->_selectedItem;
        self->_selectedItem = v15;

        selectorView = self->_selectorView;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v14, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](selectorView, "selectItemAtIndexPath:animated:scrollPosition:", v18, 0, 0);

        -[CNSharingProfilePhotoPickerViewController updatePreviewForSelectedItem](self, "updatePreviewForSelectedItem");
      }

      v8 = v19;
    }
  }

}

- (void)updatePreviewForSelectedItem
{
  void *v3;
  uint64_t v4;
  id v5;
  CNSharingProfilePhotoPickerItem *selectedItem;
  double v7;
  double v8;
  id v9;
  id v10;

  -[CNSharingProfilePhotoPickerItem avatarItem](self->_selectedItem, "avatarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNSharingProfilePhotoPickerItem cachedPreviewImage](self->_selectedItem, "cachedPreviewImage");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (id)v4;
    }
    else
    {
      selectedItem = self->_selectedItem;
      -[UIImageView bounds](self->_previewView, "bounds");
      -[CNSharingProfilePhotoPickerItem compositeImageWithSize:](selectedItem, "compositeImageWithSize:", v7, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfilePhotoPickerItem setCachedPreviewImage:](self->_selectedItem, "setCachedPreviewImage:", v9);
      v5 = v9;
    }
    v10 = v5;
    -[UIImageView setImage:](self->_previewView, "setImage:", v5);

  }
}

- (void)setMonogramColor:(id)a3
{
  -[CNSharingProfileAvatarItemProvider setMonogramColor:](self->_itemProvider, "setMonogramColor:", a3);
}

- (PRMonogramColor)monogramColor
{
  return -[CNSharingProfileAvatarItemProvider monogramColor](self->_itemProvider, "monogramColor");
}

- (void)setMemojiMetadata:(id)a3
{
  -[CNSharingProfileAvatarItemProvider setMemojiMetadata:](self->_itemProvider, "setMemojiMetadata:", a3);
}

- (NSData)memojiMetadata
{
  return -[CNSharingProfileAvatarItemProvider memojiMetadata](self->_itemProvider, "memojiMetadata");
}

- (void)didSelectCustomizeButton:(id)a3
{
  id v4;

  -[CNSharingProfilePhotoPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingPhotoPickerDidSelectAddItem:", self);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_items, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[CNSharingProfilePhotoPickerItemCell reuseIdentifier](CNSharingProfilePhotoPickerItemCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NSArray count](self->_items, "count");
  if (v10 > objc_msgSend(v6, "item"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsSmallScreen:", self->_isSmallScreenDevice);
    objc_msgSend(v9, "setPickerItem:", v11);

  }
  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  CNSharingProfilePhotoPickerItem *v9;
  CNSharingProfilePhotoPickerItem *selectedItem;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "cellForItemAtIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pickerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "pickerItem");
    v9 = (CNSharingProfilePhotoPickerItem *)objc_claimAutoreleasedReturnValue();
    selectedItem = self->_selectedItem;
    self->_selectedItem = v9;

    -[CNSharingProfilePhotoPickerViewController updatePreviewForSelectedItem](self, "updatePreviewForSelectedItem");
  }
  else
  {
    -[CNSharingProfilePhotoPickerViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sharingPhotoPickerDidSelectAddItem:", self);

    v12 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", self->_selectedItem);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = 0;
    else
      v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectItemAtIndexPath:animated:scrollPosition:", v14, 0, 0);

  }
}

- (CNSharingProfilePhotoPickerViewControllerDelegate)delegate
{
  return (CNSharingProfilePhotoPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNSharingProfilePhotoPickerItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItem, a3);
}

- (BOOL)isSmallScreenDevice
{
  return self->_isSmallScreenDevice;
}

- (void)setIsSmallScreenDevice:(BOOL)a3
{
  self->_isSmallScreenDevice = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (UICollectionViewFlowLayout)selectorLayout
{
  return self->_selectorLayout;
}

- (void)setSelectorLayout:(id)a3
{
  objc_storeStrong((id *)&self->_selectorLayout, a3);
}

- (UIImageView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (UICollectionView)selectorView
{
  return self->_selectorView;
}

- (void)setSelectorView:(id)a3
{
  objc_storeStrong((id *)&self->_selectorView, a3);
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, a3);
}

- (CNSharingProfileAvatarItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (UIButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_customizeButton, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNPhotoPickerColorVariant)animojiBackgroundColor
{
  return self->_animojiBackgroundColor;
}

- (void)setAnimojiBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_animojiBackgroundColor, a3);
}

- (PRMonogramColor)monogramBackgroundColor
{
  return self->_monogramBackgroundColor;
}

- (void)setMonogramBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_monogramBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramBackgroundColor, 0);
  objc_storeStrong((id *)&self->_animojiBackgroundColor, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_selectorView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_selectorLayout, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __83__CNSharingProfilePhotoPickerViewController_updateWithContact_fromFullPhotoPicker___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "avatarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end
