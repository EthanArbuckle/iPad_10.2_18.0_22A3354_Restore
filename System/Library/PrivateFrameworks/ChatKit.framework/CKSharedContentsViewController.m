@implementation CKSharedContentsViewController

- (CKSharedContentsViewController)initWithAttachmentItems:(id)a3
{
  id v4;
  CKSharedContentsViewController *v5;
  CKSharedContentsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKSharedContentsViewController;
  v5 = -[CKSharedContentsViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CKSharedContentsViewController setAttachmentItems:](v5, "setAttachmentItems:", v4);

  return v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSharedContentsViewController;
  -[CKSharedContentsViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, a3);
  -[CKSharedContentsViewController collectionviewLayout](self, "collectionviewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareLayout");

  -[CKSharedContentsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedAssetsControllerContentSizeDidChange:", self);

}

- (void)dealloc
{
  void *v3;
  int v4;
  objc_super v5;

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_supportsForceTouch");

  if (v4)
    -[CKSharedContentsViewController unregisterPreviewSourceView:](self, "unregisterPreviewSourceView:", self->_collectionView);
  -[QLPreviewController setDelegate:](self->_qlPreviewController, "setDelegate:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKSharedContentsViewController;
  -[CKSharedContentsViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  -[CKSharedContentsViewController setCollectionviewLayout:](self, "setCollectionviewLayout:", v20);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v20);

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDragSourceDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = objc_opt_class();
  +[CKSharedContentsCollectionViewCell reuseIdentifier](CKSharedContentsCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  v9 = objc_opt_class();
  +[CKSharedContactsCollectionViewCell reuseIdentifier](CKSharedContactsCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v9, v10);

  v11 = objc_opt_class();
  +[CKSharedOtherTypesCollectionViewCell reuseIdentifier](CKSharedOtherTypesCollectionViewCell, "reuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  v13 = objc_opt_class();
  +[CKSharedAudioCollectionViewCell reuseIdentifier](CKSharedAudioCollectionViewCell, "reuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v13, v14);

  v15 = objc_opt_class();
  +[CKSharedLocationCollectionViewCell reuseIdentifier](CKSharedLocationCollectionViewCell, "reuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v15, v16);

  v17 = objc_opt_class();
  +[CKSharedQuickLookThumbnailCollectionViewCell reuseIdentifier](CKSharedQuickLookThumbnailCollectionViewCell, "reuseIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v17, v18);

  objc_msgSend(v5, "setScrollEnabled:", 0);
  objc_msgSend(v5, "setAllowsMultipleSelection:", 1);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v19, "_supportsForceTouch");

  if ((_DWORD)v18)
    -[CKSharedContentsViewController registerPreviewSourceView:previewingDelegate:](self, "registerPreviewSourceView:previewingDelegate:", v5, self);
  -[CKSharedContentsViewController setCollectionView:](self, "setCollectionView:", v5);
  -[CKSharedContentsViewController setView:](self, "setView:", v5);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double Width;
  double v17;
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
  void *v28;
  void *v29;
  objc_super v30;
  CGRect v31;

  v30.receiver = self;
  v30.super_class = (Class)CKSharedContentsViewController;
  -[CKSharedContentsViewController viewWillLayoutSubviews](&v30, sel_viewWillLayoutSubviews);
  -[CKSharedContentsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKSharedContentsViewController collectionviewLayout](self, "collectionviewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKSharedContentsViewController numberOfItemsInRow](self, "numberOfItemsInRow");
  -[CKSharedContentsViewController paddingLeftRightForCell](self, "paddingLeftRightForCell");
  v15 = v14;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  Width = CGRectGetWidth(v31);
  if (CKMainScreenScale_once_3 != -1)
    dispatch_once(&CKMainScreenScale_once_3, &__block_literal_global_5);
  v17 = *(double *)&CKMainScreenScale_sMainScreenScale_3;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_3 == 0.0)
    v17 = 1.0;
  v18 = fmin(round((Width - (double)(2 * v13) * v15) / (float)v13 * v17) / v17, 160.0);
  -[CKSharedContentsViewController cellAspectRatio](self, "cellAspectRatio");
  objc_msgSend(v12, "setItemSize:", v18, v19 * v18);
  -[CKSharedContentsViewController paddingLeftRightForCell](self, "paddingLeftRightForCell");
  objc_msgSend(v12, "setMinimumInteritemSpacing:");
  -[CKSharedContentsViewController paddingTopBottomForCell](self, "paddingTopBottomForCell");
  objc_msgSend(v12, "setMinimumLineSpacing:", v20 + v20);
  -[CKSharedContentsViewController paddingTopBottomForCell](self, "paddingTopBottomForCell");
  v22 = v21;
  -[CKSharedContentsViewController paddingLeftRightForCell](self, "paddingLeftRightForCell");
  v24 = v23;
  -[CKSharedContentsViewController paddingTopBottomForCell](self, "paddingTopBottomForCell");
  v26 = v25;
  -[CKSharedContentsViewController paddingLeftRightForCell](self, "paddingLeftRightForCell");
  objc_msgSend(v12, "setSectionInset:", v22, v24, v26, v27);
  -[CKSharedContentsViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSystemGroupedBackgroundColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v29);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSharedContentsViewController;
  -[CKSharedContentsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKSharedContentsViewController setSelectingAttachments:](self, "setSelectingAttachments:", 0);
}

- (BOOL)isJ99LandscapeModeFullScreen
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  double v12;
  BOOL v13;
  void *v14;
  double v15;
  BOOL v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  Width = CGRectGetWidth(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v12 = CGRectGetWidth(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v13 = v12 > CGRectGetHeight(v20);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_applicationFrame");
  v15 = CGRectGetWidth(v21);

  v16 = Width >= 1366.0 && v13;
  return v15 == 1366.0 && v16;
}

- (void)setAttachmentItems:(id)a3
{
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;

  v5 = (NSArray *)a3;
  if (self->_attachmentItems != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_attachmentItems, a3);
    -[CKSharedContentsViewController collectionviewLayout](self, "collectionviewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateLayout");

    -[CKSharedContentsViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    -[CKSharedContentsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedAssetsControllerContentSizeDidChange:", self);

    v5 = v9;
  }

}

- (void)setSelectingAttachments:(BOOL)a3
{
  id v4;

  if (self->_selectingAttachments != a3)
  {
    self->_selectingAttachments = a3;
    if (a3)
      -[CKSharedContentsViewController setupToolbar](self, "setupToolbar");
    else
      -[CKSharedContentsViewController teardownToolbar](self, "teardownToolbar");
    -[CKSharedContentsViewController updateToolbar](self, "updateToolbar");
    -[CKSharedContentsViewController collectionView](self, "collectionView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setupToolbar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 16, self, sel_deleteSelectedContents_);
  -[CKSharedContentsViewController setDeleteButton:](self, "setDeleteButton:", v3);
  -[CKSharedContentsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);
  objc_msgSend(v4, "toolbar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CEA380]);
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, sel_cancelSelectingContents_);

  -[CKSharedContentsViewController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "rightBarButtonItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedContentsViewController setParentRightBarButtonItemsToRestore:](self, "setParentRightBarButtonItemsToRestore:", v14);

  objc_msgSend(v13, "setRightBarButtonItem:animated:", v11, 1);
  objc_msgSend(v13, "backBarButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v13, "setHidesBackButton:", 1);

}

- (void)teardownToolbar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKSharedContentsViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToolbarHidden:animated:", 1, 1);
  -[CKSharedContentsViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSharedContentsViewController parentRightBarButtonItemsToRestore](self, "parentRightBarButtonItemsToRestore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItems:animated:", v5, 1);

  objc_msgSend(v4, "backBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "setHidesBackButton:", 0);
  objc_msgSend(v8, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", 0);

  -[CKSharedContentsViewController setSaveButton:](self, "setSaveButton:", 0);
  -[CKSharedContentsViewController setDeleteButton:](self, "setDeleteButton:", 0);

}

- (void)updateToolbar
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  id v16;

  -[CKSharedContentsViewController selectedAttachmentIndexes](self, "selectedAttachmentIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CKSharedContentsViewController saveButton](self, "saveButton");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSharedContentsViewController deleteButton](self, "deleteButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v4 != 0);
  objc_msgSend(v5, "setEnabled:", v4 != 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocalizedStringForNumber(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 >= 2)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SAVE_ATTACHMENTS"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceLayoutDirection");

    if (v13 == 1)
      v14 = CFSTR("\u200F");
    else
      v14 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setTitle:", v15);
  }

}

- (double)paddingLeftRightForCell
{
  return 5.0;
}

- (double)paddingTopBottomForCell
{
  return 10.0;
}

- (int64_t)numberOfItemsInRow
{
  if (-[CKSharedContentsViewController isJ99LandscapeModeFullScreen](self, "isJ99LandscapeModeFullScreen"))
    return 5;
  else
    return 3;
}

- (double)cellAspectRatio
{
  return 1.39130435;
}

- (unint64_t)assetType
{
  return 1;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  width = a3.width;
  v5 = -[CKSharedContentsViewController numberOfItemsInRow](self, "numberOfItemsInRow", a3.width, a3.height);
  -[CKSharedContentsViewController paddingLeftRightForCell](self, "paddingLeftRightForCell");
  v7 = v6;
  if (CKMainScreenScale_once_3 != -1)
    dispatch_once(&CKMainScreenScale_once_3, &__block_literal_global_5);
  v8 = *(double *)&CKMainScreenScale_sMainScreenScale_3;
  -[CKSharedContentsViewController cellAspectRatio](self, "cellAspectRatio");
  v10 = v9;
  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[CKSharedContentsViewController paddingTopBottomForCell](self, "paddingTopBottomForCell");
  v14 = v13;
  -[CKSharedContentsViewController paddingTopBottomForCell](self, "paddingTopBottomForCell");
  v16 = v15;
  if (CKMainScreenScale_once_3 != -1)
    dispatch_once(&CKMainScreenScale_once_3, &__block_literal_global_5);
  v17 = ceilf((float)v12 / (float)v5);
  if (v8 == 0.0)
    v18 = 1.0;
  else
    v18 = v8;
  v19 = v16
      + v16
      + v17 * (v10 * fmin(round((width - (double)(2 * v5) * v7) / (float)v5 * v18) / v18, 160.0))
      + (v17 + -1.0) * (v14 + v14);
  v20 = *(double *)&CKMainScreenScale_sMainScreenScale_3;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_3 == 0.0)
    v20 = 1.0;
  v21 = round(v19 * v20) / v20;
  v22 = width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (BOOL)isDisplayingAttachmentContent
{
  void *v2;
  BOOL v3;

  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)selectedAttachmentIndexes
{
  void *v2;
  void *v3;
  void *v4;

  -[CKSharedContentsViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__ck_indexSetForIndexPathItemsInSection:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  void *v4;
  CKSharedContentsViewController *v5;
  CKSharedContentsViewController *v6;

  -[CKSharedContentsViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKSharedContentsViewController parentViewController](self, "parentViewController");
    v5 = (CKSharedContentsViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0C97420]))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      v11 = *MEMORY[0x1E0C966A8];
      v12 = *MEMORY[0x1E0C967C0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v14, "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v11);

          if (v16)
          {
            objc_msgSend(v14, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v14, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v12);

            if (v19)
            {
              objc_msgSend(v14, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringValue");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v17 = 0;
            }
          }
          IMStripFormattingFromAddress();
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    v22 = (void *)v24;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (CKQLPreviewController)qlPreviewController
{
  CKQLPreviewController *qlPreviewController;
  CKQLPreviewController *v4;
  CKQLPreviewController *v5;

  qlPreviewController = self->_qlPreviewController;
  if (!qlPreviewController)
  {
    v4 = objc_alloc_init(CKQLPreviewController);
    -[QLPreviewController setDelegate:](v4, "setDelegate:", self);
    v5 = self->_qlPreviewController;
    self->_qlPreviewController = v4;

    qlPreviewController = self->_qlPreviewController;
  }
  return qlPreviewController;
}

- (id)invisibleInkEffectControllerForPreviewController:(id)a3
{
  return 0;
}

- (id)contextualCKChatItemsForPreviewController:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)previewControllerDidDismiss:(id)a3
{
  objc_msgSend(a3, "setCurrentOrbMode:", 0);
}

- (BOOL)previewController:(id)a3 shouldOpenURL:(id)a4 forPreviewItem:(id)a5
{
  return 0;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v7 = a4;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12 = v7;
  -[CKSharedContentsViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v12);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v8 = v19;
    v9 = v20;
    v10 = v21;
    v11 = v22;

  }
  if (a5)
LABEL_8:
    *a5 = objc_retainAutorelease(v16);
LABEL_9:

  v23 = v8;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5 realSize:(CGSize *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;

  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    -[CKSharedContentsViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfObject:", v10);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForItemAtIndexPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      a5->origin.x = v18;
      a5->origin.y = v19;
      a5->size.width = v20;
      a5->size.height = v21;

      *a6 = *(CGSize *)MEMORY[0x1E0C9D820];
      objc_msgSend(v16, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a4.y;
  x = a4.x;
  -[CKSharedContentsViewController collectionView](self, "collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKSharedContentsViewController isSelectingAttachments](self, "isSelectingAttachments"))
  {
    v9 = 0;
  }
  else
  {
    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreviewItems:", v12);

    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentPreviewItemIndex:", objc_msgSend(v8, "item"));

    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "refreshCurrentPreviewItem");

    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  -[CKSharedContentsViewController collectionView](self, "collectionView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathForItemAtPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForItemAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSourceView:", v10);
  objc_msgSend(v10, "bounds");
  objc_msgSend(v11, "setSourceRect:");
  -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentOrbMode:", 1);

}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  id v4;

  if (!a4)
  {
    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentOrbMode:", 0);

  }
}

- (id)committedViewControllerForPreviewViewController:(id)a3
{
  return a3;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v5 = (void *)MEMORY[0x1E0D39958];
  v6 = a4;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackEvent:", *MEMORY[0x1E0D387C8]);

  -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentOrbMode:", 2);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__CKSharedContentsViewController_previewingContext_commitViewController___block_invoke;
  v9[3] = &unk_1E274A208;
  v9[4] = self;
  -[CKSharedContentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 0, v9);

}

void __73__CKSharedContentsViewController_previewingContext_commitViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "qlPreviewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCurrentOrbMode:", 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  char isKindOfClass;
  BOOL v9;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CKSharedContentsViewController isSelectingAttachments](self, "isSelectingAttachments");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  v9 = !v7 & isKindOfClass;

  return v9;
}

- (void)sharedContentsCollectionViewCellDidTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CKQLPreviewControllerDataSource *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!-[CKSharedContentsViewController isSelectingAttachments](self, "isSelectingAttachments"))
  {
    -[CKSharedContentsViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSharedContentsViewController qlPreviewController](self, "qlPreviewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForCell:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "item");

    v8 = objc_alloc_init(CKQLPreviewControllerDataSource);
    objc_msgSend(v5, "setDataSource:", v8);
    -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKQLPreviewControllerDataSource setPreviewItems:](v8, "setPreviewItems:", v9);

    objc_msgSend(v5, "reloadData");
    objc_msgSend(v5, "setCurrentPreviewItemIndex:", v7);
    objc_msgSend(v5, "refreshCurrentPreviewItem");
    objc_msgSend(v5, "setModalPresentationStyle:", 0);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackEvent:", *MEMORY[0x1E0D387C8]);

    -[CKSharedContentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (void)performAction:(SEL)a3 forSharedContentsCollectionViewCell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CKSharedContentsViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "item");

  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (sel_delete_ == a3)
  {
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSharedContentsViewController deleteContents:](self, "deleteContents:", v12);
    goto LABEL_5;
  }
  if (sel_more_ == a3)
  {
    objc_msgSend(v7, "indexPathForCell:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSharedContentsViewController setSelectingAttachments:](self, "setSelectingAttachments:", 1);
    objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v12, 1, 0);
    -[CKSharedContentsViewController updateToolbar](self, "updateToolbar");
LABEL_5:

  }
}

- (void)deleteContents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_ATTACHMENT"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CKLocalizedStringForNumber(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_ATTACHMENTS"), &stru_1E276D870, CFSTR("ChatKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

      if (v17 == 1)
        v18 = CFSTR("\u200F");
      else
        v18 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CKSharedContentsViewController collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __49__CKSharedContentsViewController_deleteContents___block_invoke;
    v34[3] = &unk_1E274B2B8;
    v34[4] = self;
    v21 = v4;
    v35 = v21;
    v22 = v19;
    v36 = v22;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v10, 2, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v23);

    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v33, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v24);

    -[CKSharedContentsViewController deleteButton](self, "deleteButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEnabled"))
    {
      objc_msgSend(v26, "setBarButtonItem:", v25);
    }
    else
    {
      objc_msgSend(v21, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v7, "indexOfObject:", v27);

      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v28, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cellForItemAtIndexPath:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "contentView");
        v32 = v7;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setSourceView:", v31);
        objc_msgSend(v31, "bounds");
        objc_msgSend(v26, "setSourceRect:");

        v7 = v32;
      }
    }
    objc_msgSend(v20, "setPreferredStyle:", 0);
    -[CKSharedContentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

  }
}

uint64_t __49__CKSharedContentsViewController_deleteContents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAssetsController:didDeleteAttachmentItems:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "collectionviewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 48), "reloadData");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedAssetsControllerContentSizeDidChange:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setSelectingAttachments:", 0);
}

- (void)cancelSelectingContents:(id)a3
{
  -[CKSharedContentsViewController setSelectingAttachments:](self, "setSelectingAttachments:", 0);
}

- (void)deleteSelectedContents:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedContentsViewController selectedAttachmentIndexes](self, "selectedAttachmentIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKSharedContentsViewController deleteContents:](self, "deleteContents:", v6);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)_collectionView:(id)a3 dragItemsForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dragItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldShowMenuForItemAtIndexPath:(id)a4
{
  return !-[CKSharedContentsViewController isSelectingAttachments](self, "isSelectingAttachments", a3, a4);
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_saveAttachment_ == a4 || sel_more_ == a4 || sel_delete_ == a4 || sel_copy_ == a4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  __objc2_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __objc2_class *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;

  v6 = a3;
  v7 = a4;
  -[CKSharedContentsViewController attachmentItems](self, "attachmentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (const __CFString *)objc_msgSend(v9, "UTIType");
  +[CKLocationAttachmentItem UTITypes](CKLocationAttachmentItem, "UTITypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = UTTypeConformsTo(v10, (CFStringRef)objc_msgSend(v11, "firstObject"));

  v13 = UTTypeConformsTo(v10, (CFStringRef)*MEMORY[0x1E0CA5B10]);
  v14 = UTTypeConformsTo(v10, (CFStringRef)*MEMORY[0x1E0CA5AC8]);
  +[CKQuickLookThumbnailAttachmentItem UTITypes](CKQuickLookThumbnailAttachmentItem, "UTITypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = UTTypeConformsTo(v10, (CFStringRef)objc_msgSend(v15, "firstObject"));

  if (v12)
  {
    v17 = CKSharedLocationCollectionViewCell;
LABEL_3:
    -[__objc2_class reuseIdentifier](v17, "reuseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    objc_msgSend(v19, "configureWithAttachmentItem:", v9);
    goto LABEL_13;
  }
  if (!v13)
  {
    if (v14)
    {
      v28 = CKSharedAudioCollectionViewCell;
    }
    else
    {
      if (!v16)
      {
        v17 = CKSharedOtherTypesCollectionViewCell;
        goto LABEL_3;
      }
      v28 = CKSharedQuickLookThumbnailCollectionViewCell;
    }
    -[__objc2_class reuseIdentifier](v28, "reuseIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v32, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setDelegate:", self);
    goto LABEL_4;
  }
  +[CKSharedContactsCollectionViewCell reuseIdentifier](CKSharedContactsCollectionViewCell, "reuseIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v20, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fileURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v21, 8, &v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v36;
  v24 = v23;
  if (v23 || !v22)
  {
    v33 = v21;
    v34 = v23;
    _IMWarn();
  }
  else
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v22, &v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v35;
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configureWithContact:", v26);

    objc_msgSend(v19, "avatarView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", self);

  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v7, "row", v33, v34));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", v29);

  objc_msgSend(v19, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v7, "row"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", v30);

  objc_msgSend(v19, "setEditing:", -[CKSharedContentsViewController isSelectingAttachments](self, "isSelectingAttachments"));
  return v19;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CKSharedAssetsControllerDelegate)delegate
{
  return (CKSharedAssetsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionViewFlowLayout)collectionviewLayout
{
  return self->_collectionviewLayout;
}

- (void)setCollectionviewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionviewLayout, a3);
}

- (void)setQlPreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_qlPreviewController, a3);
}

- (UIView)topmostMarkerView
{
  return self->_topmostMarkerView;
}

- (void)setTopmostMarkerView:(id)a3
{
  objc_storeStrong((id *)&self->_topmostMarkerView, a3);
}

- (NSArray)attachmentItems
{
  return self->_attachmentItems;
}

- (BOOL)isSelectingAttachments
{
  return self->_selectingAttachments;
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (UIBarButtonItem)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (NSArray)parentRightBarButtonItemsToRestore
{
  return self->_parentRightBarButtonItemsToRestore;
}

- (void)setParentRightBarButtonItemsToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_parentRightBarButtonItemsToRestore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRightBarButtonItemsToRestore, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_attachmentItems, 0);
  objc_storeStrong((id *)&self->_topmostMarkerView, 0);
  objc_storeStrong((id *)&self->_qlPreviewController, 0);
  objc_storeStrong((id *)&self->_collectionviewLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
