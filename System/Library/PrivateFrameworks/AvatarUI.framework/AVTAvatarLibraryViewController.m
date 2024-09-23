@implementation AVTAvatarLibraryViewController

- (AVTAvatarLibraryViewController)initWithAvatarStore:(id)a3
{
  id v4;
  void *v5;
  AVTAvatarLibraryViewController *v6;

  v4 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTAvatarLibraryViewController initWithAvatarStore:environment:](self, "initWithAvatarStore:environment:", v4, v5);

  return v6;
}

- (AVTAvatarLibraryViewController)initWithAvatarStore:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  id v8;
  AVTViewSessionProvider *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  AVTViewSessionProvider *v15;
  AVTAvatarLibraryModel *v16;
  _AVTAvatarRecordImageProvider *v17;
  AVTAvatarLibraryViewController *v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Store %@ isn't valid"), v6);
  v8 = v6;
  v9 = [AVTViewSessionProvider alloc];
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v7);
  v11 = v10;
  v13 = v12;
  +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v9, "initWithAVTViewBackingSize:viewCreator:environment:", v14, v7, v11, v13);

  v16 = -[AVTAvatarLibraryModel initWithAvatarStore:avtViewSessionProvider:environment:]([AVTAvatarLibraryModel alloc], "initWithAvatarStore:avtViewSessionProvider:environment:", v8, v15, v7);
  v17 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v7);
  v18 = -[AVTAvatarLibraryViewController initWithModel:imageProvider:environment:](self, "initWithModel:imageProvider:environment:", v16, v17, v7);

  return v18;
}

- (AVTAvatarLibraryViewController)initWithModel:(id)a3 imageProvider:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  AVTUIEnvironment *v11;
  AVTAvatarLibraryViewController *v12;
  AVTAvatarLibraryViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = (AVTUIEnvironment *)a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarLibraryViewController;
  v12 = -[AVTAvatarLibraryViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageProvider, a4);
    objc_storeStrong((id *)&v13->_model, a3);
    v13->_environment = v11;
    -[AVTAvatarLibraryModel setDelegate:](v13->_model, "setDelegate:", v13);
    -[AVTAvatarLibraryModel load](v13->_model, "load");
  }

  return v13;
}

- (BOOL)shouldUseLargeLayout
{
  void *v3;
  char v4;
  void *v5;

  -[AVTAvatarLibraryViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "deviceIsPad") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[AVTAvatarLibraryViewController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "deviceIsMac");

  }
  return v4;
}

- (void)loadView
{
  id v3;
  void *v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v8, "setScrollDirection:", 0);
  objc_msgSend(v8, "setItemSize:", 102.0, 102.0);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v8);

  objc_msgSend(v8, "setMinimumInteritemSpacing:", 14.0);
  objc_msgSend(v8, "setMinimumLineSpacing:", 14.0);
  if (!-[AVTAvatarLibraryViewController shouldUseLargeLayout](self, "shouldUseLargeLayout"))
    -[UICollectionView setContentInset:](v5, "setContentInset:", 40.0, 20.0, 0.0, 20.0);
  -[UICollectionView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[UICollectionView setDelegate:](v5, "setDelegate:", self);
  -[UICollectionView setDataSource:](v5, "setDataSource:", self);
  collectionView = self->_collectionView;
  self->_collectionView = v5;
  v7 = v5;

  -[AVTAvatarLibraryViewController setView:](self, "setView:", v7);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVTAvatarLibraryViewController;
  -[AVTAvatarLibraryViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AVTAvatarLibraryViewController shouldUseLargeLayout](self, "shouldUseLargeLayout"))
  {
    objc_msgSend(v4, "minimumInteritemSpacing");
    v6 = v5 + v5 + 459.0;
    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = (v8 - v6) * 0.5;

    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentInset:", 40.0, v9, 0.0, v9);

    v11 = 153.0;
  }
  else
  {
    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentInset");
    v17 = v14 - v16;
    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentInset");
    v20 = v17 - v19;
    objc_msgSend(v4, "minimumInteritemSpacing");
    v22 = v20 + v21 * -2.0;

    v11 = floor(v22 / 3.0);
  }
  objc_msgSend(v4, "setItemSize:", v11, v11);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarLibraryViewController;
  -[AVTAvatarLibraryViewController viewDidLoad](&v19, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDoneButton_);
  -[AVTAvatarLibraryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  +[AVTAvatarLibraryCollectionViewCell cellIdentifier](AVTAvatarLibraryCollectionViewCell, "cellIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  +[AVTAvatarLibraryCollectionViewAddCell cellIdentifier](AVTAvatarLibraryCollectionViewAddCell, "cellIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = *MEMORY[0x1E0CEB3B8];
  +[AVTAvatarLibraryHeaderView reuseIdentifier](AVTAvatarLibraryHeaderView, "reuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v14, v15, v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel_didLongPress_);
  objc_msgSend(v17, "setDelaysTouchesBegan:", 1);
  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addGestureRecognizer:", v17);

}

- (void)didLongPress:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 1)
  {
    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItemAtPoint:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarLibraryViewController model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performActionOnItemAtIndex:", objc_msgSend(v10, "item"));

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AVTAvatarLibraryViewController model](self, "model", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
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

  v6 = a4;
  v7 = a3;
  -[AVTAvatarLibraryViewController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "cellIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarLibraryViewController imageProvider](self, "imageProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureCell:imageProvider:", v12, v13);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = *MEMORY[0x1E0CEB3B8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if ((objc_msgSend(v10, "isEqual:", v8) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Only registered for headers!"));
  +[AVTAvatarLibraryHeaderView reuseIdentifier](AVTAvatarLibraryHeaderView, "reuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarLibraryViewController model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  updateCountLabel(v13, v14);

  return v13;
}

- (void)updateVisibleHeaders
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AVTAvatarLibraryViewController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CEB3B8];
  objc_msgSend(v3, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "supplementaryViewForElementKind:atIndexPath:", v4, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVTAvatarLibraryViewController model](self, "model");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        updateCountLabel(v12, v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = 25.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  -[AVTAvatarLibraryViewController model](self, "model");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item");

  objc_msgSend(v7, "performActionOnItemAtIndex:", v6);
}

- (void)didTapDoneButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVTAvatarLibraryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTAvatarLibraryViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarLibraryControllerDidFinish:", self);

  }
}

- (void)didAddRecord:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTAvatarLibraryViewController updateVisibleHeaders](self, "updateVisibleHeaders");
  -[AVTAvatarLibraryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTAvatarLibraryViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarLibraryController:didChange:avatar:", self, 0, v7);

  }
}

- (void)didDeleteRecord:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTAvatarLibraryViewController updateVisibleHeaders](self, "updateVisibleHeaders");
  -[AVTAvatarLibraryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTAvatarLibraryViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarLibraryController:didChange:avatar:", self, 1, v7);

  }
}

- (void)didEditRecord:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTAvatarLibraryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTAvatarLibraryViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarLibraryController:didChange:avatar:", self, 2, v7);

  }
}

- (void)didUpdateLibraryItems:(id)a3
{
  id v3;

  -[AVTAvatarLibraryViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)presetEditorViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CEA7B8];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[AVTAvatarLibraryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)presentUIViewController:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarLibraryViewController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v6);

  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v12);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v23);

  objc_msgSend(v23, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v7, "popoverPresentationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  -[AVTAvatarLibraryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)dismissController:(id)a3 completion:(id)a4
{
  -[AVTAvatarLibraryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a4);
}

- (void)insertItemsAtIndexes:(id)a3 deleteItemsAtIndexes:(id)a4 reloadItemsAtIndexes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AVTAvatarLibraryViewController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AVTAvatarLibraryViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__AVTAvatarLibraryViewController_insertItemsAtIndexes_deleteItemsAtIndexes_reloadItemsAtIndexes___block_invoke;
  v15[3] = &unk_1EA51EA70;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBatchUpdates:completion:", v15, 0);

}

void __97__AVTAvatarLibraryViewController_insertItemsAtIndexes_deleteItemsAtIndexes_reloadItemsAtIndexes___block_invoke(void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1[4])
  {
    objc_msgSend(a1[5], "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(uint64_t, void *))sIndexSetToIndexPaths + 2))((uint64_t)sIndexSetToIndexPaths, a1[4]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertItemsAtIndexPaths:", v3);

  }
  if (a1[6])
  {
    objc_msgSend(a1[5], "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(uint64_t, void *))sIndexSetToIndexPaths + 2))((uint64_t)sIndexSetToIndexPaths, a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteItemsAtIndexPaths:", v5);

  }
  if (a1[7])
  {
    objc_msgSend(a1[5], "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(uint64_t, void *))sIndexSetToIndexPaths + 2))((uint64_t)sIndexSetToIndexPaths, a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadItemsAtIndexPaths:", v6);

  }
}

- (AVTAvatarLibraryViewControllerDelegate)delegate
{
  return (AVTAvatarLibraryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (AVTAvatarLibraryModel)model
{
  return self->_model;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
