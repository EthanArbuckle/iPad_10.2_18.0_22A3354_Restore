@implementation CNMeCardSharingOnboardingAvatarCarouselViewController

- (CNMeCardSharingOnboardingAvatarCarouselViewController)initWithContact:(id)a3 avatarRecord:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNMeCardSharingOnboardingAvatarCarouselViewController *v12;
  CNMeCardSharingOnboardingAvatarCarouselViewController *v13;
  void *v14;
  uint64_t v15;
  PRMonogramColor *monogramColor;
  CNMeCardSharingOnboardingAvatarCarouselViewController *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  v12 = -[CNMeCardSharingOnboardingAvatarCarouselViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarRecord, a4);
    objc_storeStrong((id *)&v13->_contact, a3);
    objc_storeStrong((id *)&v13->_logger, a5);
    objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    monogramColor = v13->_monogramColor;
    v13->_monogramColor = (PRMonogramColor *)v15;

    v17 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  CNMeCardSharingOnboardingAvatarCarouselLayout *v3;
  CNMeCardSharingOnboardingAvatarCarouselLayout *layout;
  id v5;
  void *v6;
  UICollectionView *v7;
  UICollectionView *collectionView;
  void *v9;
  void *v10;
  UICollectionView *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = objc_alloc_init(CNMeCardSharingOnboardingAvatarCarouselLayout);
  layout = self->_layout;
  self->_layout = v3;

  -[UICollectionViewFlowLayout setScrollDirection:](self->_layout, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_layout, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_layout, "setMinimumLineSpacing:", 0.0);
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", self->_layout);
  collectionView = self->_collectionView;
  self->_collectionView = v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v9);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setPagingEnabled:](self->_collectionView, "setPagingEnabled:", 1);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_collectionView);

  v11 = self->_collectionView;
  v12 = objc_opt_class();
  +[CNMeCardSharingOnboardingAvatarCarouselCell cellIdentifier](CNMeCardSharingOnboardingAvatarCarouselCell, "cellIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  -[CNMeCardSharingOnboardingAvatarCarouselViewController buildItems](self, "buildItems");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController notifyDelegateOfUpdateToCenterMostItem](self, "notifyDelegateOfUpdateToCenterMostItem");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController viewWillLayoutSubviews](&v27, sel_viewWillLayoutSubviews);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = floor(v5 - v7);

  v9 = floor(v8 * 0.5 * 0.5) + -10.0;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v12, v14);

  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_layout, "setMinimumLineSpacing:", v9);
  -[CNMeCardSharingOnboardingAvatarCarouselLayout invalidateLayout](self->_layout, "invalidateLayout");
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");

  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 0.0, 0.0, v8 * 0.5);
  -[UICollectionViewFlowLayout itemSize](self->_layout, "itemSize");
  v17 = v9 + v16;
  -[UICollectionView bounds](self->_collectionView, "bounds");
  v19 = v18;
  v20 = -(v18 - v17);
  -[UICollectionViewFlowLayout itemSize](self->_layout, "itemSize");
  v22 = v19 - v21;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setInterpageSpacing:", v20, 0.0);

  -[CNMeCardSharingOnboardingAvatarCarouselViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_setPagingOrigin:", v22 * -0.5, 0.0);

  -[CNMeCardSharingOnboardingAvatarCarouselViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setFirstPageOffset:", -(v8 * 0.5), 0.0);

  -[CNMeCardSharingOnboardingAvatarCarouselViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentOffset:", -(v8 * 0.5), 0.0);

}

- (void)buildItems
{
  NSArray *v3;
  NSArray *items;

  if (self->_avatarRecord || -[CNContact imageDataAvailable](self->_contact, "imageDataAvailable"))
  {
    -[CNMeCardSharingOnboardingAvatarCarouselViewController standardItems](self, "standardItems");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNMeCardSharingOnboardingAvatarCarouselViewController itemsForNoAnimojiAndNoPhoto](self, "itemsForNoAnimojiAndNoPhoto");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  items = self->_items;
  self->_items = v3;

}

- (id)itemsForNoAnimojiAndNoPhoto
{
  CNMeCardSharingOnboardingAvatarCarouselItem *v3;
  void *v4;
  void *v5;
  CNMeCardSharingOnboardingAvatarCarouselItem *v6;
  CNMeCardSharingOnboardingAvatarCarouselItem *monogramItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *v8;
  CNMeCardSharingOnboardingAvatarCarouselItem *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARING_ONBOARDING_ADD_PHOTO"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNMeCardSharingOnboardingAvatarCarouselItem initWithTitle:](v3, "initWithTitle:", v5);

  objc_storeStrong((id *)&self->_photoPickerItem, v6);
  monogramItem = self->_monogramItem;
  if (!monogramItem)
  {
    -[CNMeCardSharingOnboardingAvatarCarouselViewController monogramImageItemWithContact:](self, "monogramImageItemWithContact:", self->_contact);
    v8 = (CNMeCardSharingOnboardingAvatarCarouselItem *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingOnboardingAvatarCarouselItem setShouldShowVariants:](v8, "setShouldShowVariants:", 1);
    v9 = self->_monogramItem;
    self->_monogramItem = v8;

    monogramItem = self->_monogramItem;
  }
  v12[0] = self->_photoPickerItem;
  v12[1] = monogramItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)standardItems
{
  void *v3;
  _BOOL4 v4;
  CNMeCardSharingOnboardingAvatarCarouselItem *animojiItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *v6;
  CNMeCardSharingOnboardingAvatarCarouselItem *v7;
  CNMeCardSharingOnboardingAvatarCarouselItem *photoItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *v9;
  CNMeCardSharingOnboardingAvatarCarouselItem *v10;
  CNMeCardSharingOnboardingAvatarCarouselItem *monogramItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *v12;
  CNMeCardSharingOnboardingAvatarCarouselItem *v13;
  CNMeCardSharingOnboardingAvatarCarouselItem *v14;
  void *v15;
  void *v16;
  CNMeCardSharingOnboardingAvatarCarouselItem *v17;
  CNMeCardSharingOnboardingAvatarCarouselItem *photoPickerItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContact imageDataAvailable](self->_contact, "imageDataAvailable"))
    v4 = -[CNContact rawImageType](self->_contact, "rawImageType") != 2;
  else
    v4 = 0;
  if (self->_avatarRecord
    && (!-[CNContact imageDataAvailable](self->_contact, "imageDataAvailable")
     || -[CNContact imageDataAvailable](self->_contact, "imageDataAvailable")
     && !-[CNContact hasImageOfType:](self->_contact, "hasImageOfType:", 3)))
  {
    animojiItem = self->_animojiItem;
    if (!animojiItem)
    {
      -[CNMeCardSharingOnboardingAvatarCarouselViewController animojiItemWithRecord:](self, "animojiItemWithRecord:", self->_avatarRecord);
      v6 = (CNMeCardSharingOnboardingAvatarCarouselItem *)objc_claimAutoreleasedReturnValue();
      -[CNMeCardSharingOnboardingAvatarCarouselItem setShouldShowVariants:](v6, "setShouldShowVariants:", 1);
      v7 = self->_animojiItem;
      self->_animojiItem = v6;

      animojiItem = self->_animojiItem;
    }
    objc_msgSend(v3, "addObject:", animojiItem);
  }
  if (v4)
  {
    photoItem = self->_photoItem;
    if (!photoItem)
    {
      -[CNMeCardSharingOnboardingAvatarCarouselViewController contactImageItemWithContact:](self, "contactImageItemWithContact:", self->_contact);
      v9 = (CNMeCardSharingOnboardingAvatarCarouselItem *)objc_claimAutoreleasedReturnValue();
      -[CNMeCardSharingOnboardingAvatarCarouselItem setShouldShowVariants:](v9, "setShouldShowVariants:", 0);
      v10 = self->_photoItem;
      self->_photoItem = v9;

      photoItem = self->_photoItem;
    }
    objc_msgSend(v3, "addObject:", photoItem);
  }
  monogramItem = self->_monogramItem;
  if (!monogramItem)
  {
    -[CNMeCardSharingOnboardingAvatarCarouselViewController monogramImageItemWithContact:](self, "monogramImageItemWithContact:", self->_contact);
    v12 = (CNMeCardSharingOnboardingAvatarCarouselItem *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingOnboardingAvatarCarouselItem setShouldShowVariants:](v12, "setShouldShowVariants:", 1);
    v13 = self->_monogramItem;
    self->_monogramItem = v12;

    monogramItem = self->_monogramItem;
  }
  objc_msgSend(v3, "addObject:", monogramItem);
  v14 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHARING_ONBOARDING_VIEW_MORE"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNMeCardSharingOnboardingAvatarCarouselItem initWithTitle:](v14, "initWithTitle:", v16);

  photoPickerItem = self->_photoPickerItem;
  self->_photoPickerItem = v17;
  v19 = v17;

  objc_msgSend(v3, "addObject:", v19);
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (void)reloadForUpdatedContactPhoto
{
  CNMeCardSharingOnboardingAvatarCarouselItem **p_photoItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *photoItem;
  CNMeCardSharingOnboardingAvatarCarouselItem *monogramItem;
  void *v6;
  double v7;
  double v8;
  double v9;
  CNMeCardSharingOnboardingAvatarCarouselItem *v10;

  p_photoItem = &self->_photoItem;
  photoItem = self->_photoItem;
  self->_photoItem = 0;

  monogramItem = self->_monogramItem;
  self->_monogramItem = 0;

  -[CNMeCardSharingOnboardingAvatarCarouselViewController buildItems](self, "buildItems");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  if (!-[CNContact imageDataAvailable](self->_contact, "imageDataAvailable")
    || -[CNContact rawImageType](self->_contact, "rawImageType") == 2)
  {
    p_photoItem = &self->_monogramItem;
  }
  v10 = *p_photoItem;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageOffsetForIndex:", -[NSArray indexOfObject:](self->_items, "indexOfObject:", v10));
  v8 = v7;

  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  if (v9 == v8)
    -[CNMeCardSharingOnboardingAvatarCarouselViewController notifyDelegateOfUpdateToCenterMostItem](self, "notifyDelegateOfUpdateToCenterMostItem");
  else
    -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v8, 0.0);

}

- (void)reloadForUpdatedMonogram
{
  CNMeCardSharingOnboardingAvatarCarouselItem *monogramItem;

  monogramItem = self->_monogramItem;
  self->_monogramItem = 0;

  -[CNMeCardSharingOnboardingAvatarCarouselViewController buildItems](self, "buildItems");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (id)contactImageItemWithContact:(id)a3
{
  id v4;
  CNMeCardSharingContactAvatarProvider *v5;
  CNMeCardSharingOnboardingAvatarCarouselLayout *v6;
  CNMeCardSharingOnboardingAvatarCarouselItem *v7;
  CNMeCardSharingOnboardingAvatarCarouselLayout *v8;
  CNMeCardSharingContactAvatarProvider *v9;
  CNMeCardSharingOnboardingAvatarCarouselItem *v10;
  _QWORD v12[4];
  CNMeCardSharingContactAvatarProvider *v13;
  CNMeCardSharingOnboardingAvatarCarouselLayout *v14;
  CNMeCardSharingOnboardingAvatarCarouselViewController *v15;

  v4 = a3;
  v5 = -[CNMeCardSharingContactAvatarProvider initWithContact:]([CNMeCardSharingContactAvatarProvider alloc], "initWithContact:", v4);

  v6 = self->_layout;
  v7 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke;
  v12[3] = &unk_1E2049E48;
  v13 = v5;
  v14 = v6;
  v15 = self;
  v8 = v6;
  v9 = v5;
  v10 = -[CNMeCardSharingOnboardingAvatarCarouselItem initWithImageInsetPercentage:imageProvider:](v7, "initWithImageInsetPercentage:imageProvider:", v12, 0.0);
  -[CNMeCardSharingOnboardingAvatarCarouselItem setImageType:](v10, "setImageType:", -[CNContact rawImageType](self->_contact, "rawImageType"));

  return v10;
}

- (id)monogramImageItemWithContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNAvatarImageRenderer *v7;
  void *v8;
  CNMeCardSharingOnboardingAvatarCarouselLayout *v9;
  CNMeCardSharingOnboardingAvatarCarouselItem *v10;
  id v11;
  CNAvatarImageRenderer *v12;
  id v13;
  CNMeCardSharingOnboardingAvatarCarouselLayout *v14;
  CNMeCardSharingOnboardingAvatarCarouselItem *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  CNMeCardSharingOnboardingAvatarCarouselLayout *v21;
  id v22;
  CNAvatarImageRenderer *v23;
  id v24;

  -[CNMeCardSharingOnboardingAvatarCarouselViewController contact](self, "contact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removePhoto");
  +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v6);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController monogramColor](self, "monogramColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_layout;
  v10 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke;
  v20 = &unk_1E2049E70;
  v21 = v9;
  v22 = v8;
  v23 = v7;
  v24 = v5;
  v11 = v5;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = -[CNMeCardSharingOnboardingAvatarCarouselItem initWithImageInsetPercentage:imageProvider:](v10, "initWithImageInsetPercentage:imageProvider:", &v17, 0.0);
  -[CNMeCardSharingOnboardingAvatarCarouselItem setImageType:](v15, "setImageType:", 2, v17, v18, v19, v20);

  return v15;
}

- (id)animojiItemWithRecord:(id)a3
{
  id v3;
  CNMeCardSharingOnboardingAvatarCarouselItem *v4;
  id v5;
  CNMeCardSharingOnboardingAvatarCarouselItem *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CNMeCardSharingOnboardingAvatarCarouselViewController_animojiItemWithRecord___block_invoke;
  v8[3] = &unk_1E2049E98;
  v9 = v3;
  v5 = v3;
  v6 = -[CNMeCardSharingOnboardingAvatarCarouselItem initWithImageInsetPercentage:imageProvider:](v4, "initWithImageInsetPercentage:imageProvider:", v8, 0.1);
  -[CNMeCardSharingOnboardingAvatarCarouselItem setImageType:](v6, "setImageType:", 3);

  return v6;
}

- (void)notifyDelegateOfUpdateToCenterMostItem
{
  void *v3;
  id v4;

  -[CNMeCardSharingOnboardingAvatarCarouselViewController selectedItem](self, "selectedItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNMeCardSharingOnboardingAvatarCarouselViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avatarCarouselViewControllerDidUpdateCenterMostItem:", v4);

  }
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)selectedItem
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[CNMeCardSharingOnboardingAvatarCarouselViewController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedPageIndex");

  if (v4 >= -[NSArray count](self->_items, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CNMeCardSharingOnboardingAvatarCarouselItem *)v5;
}

- (void)scrollToItemAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionView *collectionView;
  id v8;

  v4 = a4;
  if (-[NSArray count](self->_items, "count") > a3)
  {
    collectionView = self->_collectionView;
    -[CNMeCardSharingOnboardingAvatarCarouselViewController layout](self, "layout");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageOffsetForIndex:", a3);
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", v4);

  }
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  +[CNMeCardSharingOnboardingAvatarCarouselCell cellIdentifier](CNMeCardSharingOnboardingAvatarCarouselCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageInsetPercentage");
  objc_msgSend(v9, "setImageInsetPercentage:");
  objc_msgSend(v9, "setDisplaySessionUUID:", v11);
  objc_msgSend(v10, "cachedImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "cachedImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v13);

  }
  else
  {
    objc_msgSend(v9, "setImage:", 0);
    objc_initWeak(&location, v10);
    objc_msgSend(v10, "imageProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v10, "imageProvider");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __95__CNMeCardSharingOnboardingAvatarCarouselViewController_collectionView_cellForItemAtIndexPath___block_invoke;
      v21 = &unk_1E2049EC0;
      objc_copyWeak(&v24, &location);
      v22 = v9;
      v23 = v11;
      ((void (**)(_QWORD, uint64_t *))v15)[2](v15, &v18);

      objc_destroyWeak(&v24);
    }
    objc_destroyWeak(&location);
  }
  objc_msgSend(v10, "title", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v16);

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  int64_t v6;
  NSUInteger v7;
  BOOL v8;
  void *v9;
  CNMeCardSharingOnboardingAvatarCarouselItem *v10;
  CNMeCardSharingOnboardingAvatarCarouselItem *v11;
  uint64_t v12;
  void *v13;
  UICollectionView *collectionView;
  id v15;

  v15 = a4;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedPageIndex");

  v7 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", self->_photoPickerItem);
  v8 = v6 < (int64_t)-[NSArray count](self->_items, "count");
  v9 = v15;
  if (v8)
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v6);
    v10 = (CNMeCardSharingOnboardingAvatarCarouselItem *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 == self->_photoPickerItem)
    {
      v12 = objc_msgSend(v15, "row");

      if (v12 == v7)
      {
        -[CNMeCardSharingOnboardingAvatarCarouselViewController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "avatarCarouselViewControllerDidTapPhotoPickerCell:", self);
LABEL_8:

        v9 = v15;
        goto LABEL_9;
      }
    }
    else
    {

    }
    collectionView = self->_collectionView;
    -[CNMeCardSharingOnboardingAvatarCarouselViewController layout](self, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pageOffsetForIndex:", objc_msgSend(v15, "row"));
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", 1);
    goto LABEL_8;
  }
LABEL_9:

}

- (CNMeCardSharingOnboardingAvatarCarouselViewControllerDelegate)delegate
{
  return (CNMeCardSharingOnboardingAvatarCarouselViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

- (void)setMonogramColor:(id)a3
{
  objc_storeStrong((id *)&self->_monogramColor, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)photoPickerItem
{
  return self->_photoPickerItem;
}

- (void)setPhotoPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerItem, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)animojiItem
{
  return self->_animojiItem;
}

- (void)setAnimojiItem:(id)a3
{
  objc_storeStrong((id *)&self->_animojiItem, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)photoItem
{
  return self->_photoItem;
}

- (void)setPhotoItem:(id)a3
{
  objc_storeStrong((id *)&self->_photoItem, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)monogramItem
{
  return self->_monogramItem;
}

- (void)setMonogramItem:(id)a3
{
  objc_storeStrong((id *)&self->_monogramItem, a3);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_monogramItem, 0);
  objc_storeStrong((id *)&self->_photoItem, 0);
  objc_storeStrong((id *)&self->_animojiItem, 0);
  objc_storeStrong((id *)&self->_photoPickerItem, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_monogramColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __95__CNMeCardSharingOnboardingAvatarCarouselViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCachedImage:", v6);
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v6);

}

void __79__CNMeCardSharingOnboardingAvatarCarouselViewController_animojiItemWithRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getAVTAvatarRecordImageProviderClass_softClass_19013;
  v18 = getAVTAvatarRecordImageProviderClass_softClass_19013;
  if (!getAVTAvatarRecordImageProviderClass_softClass_19013)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __getAVTAvatarRecordImageProviderClass_block_invoke_19014;
    v13 = &unk_1E204EBC0;
    v14 = &v15;
    __getAVTAvatarRecordImageProviderClass_block_invoke_19014((uint64_t)&v10);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v6 = objc_alloc_init(v5);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)getAVTRenderingScopeClass_softClass_19015;
  v18 = getAVTRenderingScopeClass_softClass_19015;
  if (!getAVTRenderingScopeClass_softClass_19015)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __getAVTRenderingScopeClass_block_invoke_19016;
    v13 = &unk_1E204EBC0;
    v14 = &v15;
    __getAVTRenderingScopeClass_block_invoke_19016((uint64_t)&v10);
    v7 = (void *)v16[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v8, "largeThumbnailScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForRecord:scope:handler:", *(_QWORD *)(a1 + 32), v9, v3);

}

void __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemSize");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", 0, 0, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 48);
  v11[0] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_2;
  v9[3] = &unk_1E204D070;
  v10 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v5, "renderAvatarsForContacts:scope:imageHandler:", v6, v4, v9);

}

void __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_3;
  v6[3] = &unk_1E204F9B0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemSize");
  v6 = v5;
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_2;
  v10[3] = &unk_1E2049E20;
  v10[4] = *(_QWORD *)(a1 + 48);
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "generateAvatarImageOfSize:imageHandler:", v10, v6, v8);

}

void __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  if (a3)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logOnboardingAvatarCarouselErrorCreatingContactImageWithDescription:", v7);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_3;
  v10[3] = &unk_1E204F9B0;
  v8 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
