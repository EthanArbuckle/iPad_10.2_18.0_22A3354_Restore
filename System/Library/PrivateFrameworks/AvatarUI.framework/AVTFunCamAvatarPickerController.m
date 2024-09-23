@implementation AVTFunCamAvatarPickerController

+ (id)itemsFromRecords:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVTAvatarListRecordItem *v11;
  AVTAvatarListRecordItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
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
        v11 = [AVTAvatarListRecordItem alloc];
        v12 = -[AVTAvatarListRecordItem initWithAvatar:](v11, "initWithAvatar:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)newGridLayout
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v2, "setScrollDirection:", 0);
  objc_msgSend(v2, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v2, "setMinimumLineSpacing:", 0.0);
  return v2;
}

+ (id)sessionProviderWithEnvironment:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  AVTViewSessionProvider *v12;

  v5 = a4;
  v6 = a3;
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v6);
  v8 = v7;
  v10 = v9;
  +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:]([AVTViewSessionProvider alloc], "initWithAVTViewBackingSize:viewCreator:environment:", v11, v6, v8, v10);

  -[AVTViewSessionProvider setDelegate:](v12, "setDelegate:", v5);
  return v12;
}

+ (id)createClippingViewForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  void *v7;
  AVTGradientView *v8;

  height = a3.height;
  width = a3.width;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", *MEMORY[0x1E0C9D648], v6, a3.width, a3.height);
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);
  v8 = -[AVTGradientView initWithFrame:]([AVTGradientView alloc], "initWithFrame:", v5, v6, width, height);
  -[AVTGradientView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "addSubview:", v8);

  return v7;
}

+ (id)funCamAvatarPickerControllerForStore:(id)a3 style:(id)a4
{
  id v5;
  id v6;
  void *v7;
  AVTFunCamAvatarPickerController *v8;

  v5 = a4;
  v6 = a3;
  +[AVTUIEnvironment createFunCamEnvironment](AVTUIEnvironment, "createFunCamEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTFunCamAvatarPickerController initWithStore:environment:style:]([AVTFunCamAvatarPickerController alloc], "initWithStore:environment:style:", v6, v7, v5);

  return v8;
}

+ (id)funCamAvatarPickerControllerForStore:(id)a3 style:(id)a4 allowsCreation:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  AVTFunCamAvatarPickerController *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  +[AVTUIEnvironment createFunCamEnvironment](AVTUIEnvironment, "createFunCamEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTFunCamAvatarPickerController initWithStore:environment:style:allowsCreation:]([AVTFunCamAvatarPickerController alloc], "initWithStore:environment:style:allowsCreation:", v8, v9, v7, v5);

  return v10;
}

- (AVTFunCamAvatarPickerController)initWithStore:(id)a3 environment:(id)a4 style:(id)a5
{
  return -[AVTFunCamAvatarPickerController initWithStore:environment:style:allowsCreation:](self, "initWithStore:environment:style:allowsCreation:", a3, a4, a5, 0);
}

- (AVTFunCamAvatarPickerController)initWithStore:(id)a3 environment:(id)a4 style:(id)a5 allowsCreation:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  AVTFunCamAvatarPickerController *v14;
  uint64_t v15;
  AVTUILogger *logger;
  _AVTAvatarRecordImageProvider *v17;
  _AVTAvatarRecordImageProvider *imageProvider;
  uint64_t v19;
  AVTRenderingScope *editableRecordsListRenderingScope;
  uint64_t v21;
  AVTRenderingScope *gridRenderingScope;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)AVTFunCamAvatarPickerController;
  v14 = -[AVTFunCamAvatarPickerController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  if (v14)
  {
    if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v11);
    objc_storeStrong((id *)&v14->_store, a3);
    objc_msgSend(v12, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    logger = v14->_logger;
    v14->_logger = (AVTUILogger *)v15;

    v17 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v12);
    imageProvider = v14->_imageProvider;
    v14->_imageProvider = v17;

    +[AVTRenderingScope funCamCarouselThumbnailScope](AVTRenderingScope, "funCamCarouselThumbnailScope");
    v19 = objc_claimAutoreleasedReturnValue();
    editableRecordsListRenderingScope = v14->_editableRecordsListRenderingScope;
    v14->_editableRecordsListRenderingScope = (AVTRenderingScope *)v19;

    +[AVTRenderingScope gridThumbnailScope](AVTRenderingScope, "gridThumbnailScope");
    v21 = objc_claimAutoreleasedReturnValue();
    gridRenderingScope = v14->_gridRenderingScope;
    v14->_gridRenderingScope = (AVTRenderingScope *)v21;

    objc_storeStrong((id *)&v14->_environment, a4);
    objc_storeStrong((id *)&v14->_style, a5);
    v14->_allowsCreation = a6;
    -[AVTFunCamAvatarPickerController preloadAll](v14, "preloadAll");
    -[AVTFunCamAvatarPickerController reloadModel](v14, "reloadModel");
  }

  return v14;
}

- (BOOL)isDisplayingGridLayout
{
  return -[AVTFunCamAvatarPickerController mode](self, "mode") == 1;
}

- (id)selectedIndexPath
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[AVTFunCamAvatarPickerController selectedAvatarRecord](self, "selectedAvatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[AVTFunCamAvatarPickerController selectedAvatarRecord](self, "selectedAvatarRecord"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = -[AVTFunCamAvatarPickerController indexForRecord:](self, "indexForRecord:", v4),
        v4,
        v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[AVTFunCamAvatarPickerController indexPathForNoneItem](self, "indexPathForNoneItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (id)objc_msgSend(v3, "initWithFrame:");

  -[AVTFunCamAvatarPickerController setView:](self, "setView:", v5);
  -[AVTFunCamAvatarPickerController buildCollectionView](self, "buildCollectionView");
  -[AVTFunCamAvatarPickerController updateViewForCurrentMode](self, "updateViewForCurrentMode");

}

- (void)preloadAll
{
  void *v3;
  id v4;

  if (AVTUIAvatarPreLoadOnLaunch())
  {
    v3 = (void *)MEMORY[0x1E0D00858];
    -[AVTFunCamAvatarPickerController store](self, "store");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preloadAllAvatarsWithStore:completionHandler:", v4, 0);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTFunCamAvatarPickerController;
  -[AVTFunCamAvatarPickerController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  if (-[AVTFunCamAvatarPickerController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadData");

    }
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTFunCamAvatarPickerController;
  -[AVTFunCamAvatarPickerController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (void)viewWillLayoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)AVTFunCamAvatarPickerController;
  -[AVTFunCamAvatarPickerController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[AVTFunCamAvatarPickerController lastUpdateViewBounds](self, "lastUpdateViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVTFunCamAvatarPickerController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v16 = CGRectEqualToRect(v18, v19);

  if (!v16)
    -[AVTFunCamAvatarPickerController updateViewForCurrentMode](self, "updateViewForCurrentMode");
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (-[AVTFunCamAvatarPickerController isViewLoaded](self, "isViewLoaded"))
      -[AVTFunCamAvatarPickerController updateViewForCurrentMode](self, "updateViewForCurrentMode");
  }
}

- (void)setStyle:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_storeStrong((id *)&self->_style, a3);
  -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[AVTFunCamAvatarPickerController isViewLoaded](self, "isViewLoaded");

    if (v6)
    {
      -[AVTFunCamAvatarPickerController buildCollectionViewLayout](self, "buildCollectionViewLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTFunCamAvatarPickerController setListLayout:](self, "setListLayout:", v7);

      -[AVTFunCamAvatarPickerController listLayout](self, "listLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCollectionViewLayout:", v8);

      -[AVTFunCamAvatarPickerController buildTitlesCollectionViewLayout](self, "buildTitlesCollectionViewLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTFunCamAvatarPickerController titlesCollectionView](self, "titlesCollectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCollectionViewLayout:", v10);

      -[AVTFunCamAvatarPickerController updateViewForCurrentMode](self, "updateViewForCurrentMode");
    }
  }
}

- (id)buildCollectionViewLayout
{
  AVTEngagementLayout *v3;
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
  void *v14;
  double v15;
  AVTEngagementLayout *v16;
  AVTFunCamAvatarPickerCollectionViewLayout *v17;

  v3 = [AVTEngagementLayout alloc];
  -[AVTFunCamAvatarPickerController style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellSize");
  v6 = v5;
  v8 = v7;
  -[AVTFunCamAvatarPickerController style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "engagedCellSize");
  v11 = v10;
  v13 = v12;
  -[AVTFunCamAvatarPickerController style](self, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "interitemSpacing");
  v16 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:](v3, "initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:", v6, v8, v11, v13, v15);

  v17 = -[AVTEngagementListCollectionViewLayout initWithEngagementLayout:]([AVTFunCamAvatarPickerCollectionViewLayout alloc], "initWithEngagementLayout:", v16);
  return v17;
}

- (id)buildTitlesCollectionViewLayout
{
  AVTEngagementLayout *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  AVTEngagementLayout *v17;
  AVTFunCamAvatarPickerCollectionViewLayout *v18;

  v3 = [AVTEngagementLayout alloc];
  -[AVTFunCamAvatarPickerController style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellSize");
  v6 = v5;
  -[AVTFunCamAvatarPickerController style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "engagedCellSize");
  v9 = v8;
  -[AVTFunCamAvatarPickerController style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "engagedCellSize");
  v12 = v11;
  v14 = v13;
  -[AVTFunCamAvatarPickerController style](self, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interitemSpacing");
  v17 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:](v3, "initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:", v6, v9, v12, v14, v16);

  v18 = -[AVTEngagementListCollectionViewLayout initWithEngagementLayout:]([AVTFunCamAvatarPickerCollectionViewLayout alloc], "initWithEngagementLayout:", v17);
  return v18;
}

- (void)buildCollectionView
{
  id v3;
  void *v4;
  void *v5;
  AVTCenteringCollectionViewDelegate *v6;
  void *v7;
  AVTCenteringCollectionViewDelegate *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat v15;
  void *v16;
  double Width;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  CGRect v39;
  CGRect v40;

  -[AVTFunCamAvatarPickerController buildCollectionViewLayout](self, "buildCollectionViewLayout");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTFunCamAvatarPickerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v38);

  v6 = [AVTCenteringCollectionViewDelegate alloc];
  -[AVTFunCamAvatarPickerController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTCenteringCollectionViewDelegate initWithCollectionView:delegate:environment:](v6, "initWithCollectionView:delegate:environment:", v5, self, v7);
  -[AVTFunCamAvatarPickerController setCenteringDelegate:](self, "setCenteringDelegate:", v8);

  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v9);

  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "_setTransfersScrollToContainer:", 0);
  v10 = objc_opt_class();
  +[AVTFunCamAvatarPickerCollectionViewCell cellIdentifier](AVTFunCamAvatarPickerCollectionViewCell, "cellIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v10, v11);

  -[AVTFunCamAvatarPickerController setCollectionView:](self, "setCollectionView:", v5);
  -[AVTFunCamAvatarPickerController setListLayout:](self, "setListLayout:", v38);
  v12 = (void *)objc_msgSend((id)objc_opt_class(), "newGridLayout");
  -[AVTFunCamAvatarPickerController setGridLayout:](self, "setGridLayout:", v12);

  -[AVTFunCamAvatarPickerController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v5);

  -[AVTFunCamAvatarPickerController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v15 = CGRectGetMaxY(v39) + -14.0;
  -[AVTFunCamAvatarPickerController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  Width = CGRectGetWidth(v40);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, v15, Width, 14.0);
  -[AVTFunCamAvatarPickerController setTitlesContainer:](self, "setTitlesContainer:", v18);

  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserInteractionEnabled:", 0);

  v20 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[AVTFunCamAvatarPickerController buildTitlesCollectionViewLayout](self, "buildTitlesCollectionViewLayout");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v20, "initWithFrame:collectionViewLayout:", v30, v23, v25, v27, v29);

  objc_msgSend(v31, "setUserInteractionEnabled:", 0);
  objc_msgSend(v31, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v32);

  objc_msgSend(v31, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v31, "setAutoresizingMask:", 18);
  v33 = objc_opt_class();
  +[AVTFunCamAvatarPickerTitleCell cellIdentifier](AVTFunCamAvatarPickerTitleCell, "cellIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerClass:forCellWithReuseIdentifier:", v33, v34);

  -[AVTFunCamAvatarPickerController setTitlesCollectionView:](self, "setTitlesCollectionView:", v31);
  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v31);

  -[AVTFunCamAvatarPickerController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v37);

  -[AVTFunCamAvatarPickerController updateTitlesClippingViewMask](self, "updateTitlesClippingViewMask");
}

- (void)updateTitlesClippingViewMask
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_opt_class();
  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "createClippingViewForSize:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController setTitlesClippingView:](self, "setTitlesClippingView:", v7);

  -[AVTFunCamAvatarPickerController titlesClippingView](self, "titlesClippingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 10);

  -[AVTFunCamAvatarPickerController titlesClippingView](self, "titlesClippingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaskView:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTFunCamAvatarPickerController;
  -[AVTFunCamAvatarPickerController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[AVTFunCamAvatarPickerController selectedIndexPath](self, "selectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController selectItemAtIndexPath:animated:notifyDelegate:](self, "selectItemAtIndexPath:animated:notifyDelegate:", v4, 0, 0);

}

- (void)startObservingChangesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[AVTFunCamAvatarPickerController changeNotificationToken](self, "changeNotificationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    -[AVTFunCamAvatarPickerController environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D006D8];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke;
    v11 = &unk_1EA51DB40;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFunCamAvatarPickerController setChangeNotificationToken:](self, "setChangeNotificationToken:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke_2;
  block[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadModel");

}

- (void)reloadData
{
  void *v3;
  id v4;

  if (-[AVTFunCamAvatarPickerController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

    -[AVTFunCamAvatarPickerController selectedIndexPath](self, "selectedIndexPath");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTFunCamAvatarPickerController selectItemAtIndexPath:animated:notifyDelegate:](self, "selectItemAtIndexPath:animated:notifyDelegate:", v4, 0, 0);

  }
}

- (BOOL)canCreateAvatar
{
  void *v2;
  char v3;

  -[AVTFunCamAvatarPickerController store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canCreateAvatarWithError:", 0);

  return v3;
}

- (void)reloadModel
{
  void *v3;
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AVTAvatarListImageItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;

  -[AVTFunCamAvatarPickerController startObservingChangesIfNeeded](self, "startObservingChangesIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTFunCamAvatarPickerController allowsCreation](self, "allowsCreation");
  v5 = CFSTR("none");
  if (v4)
    v5 = CFSTR("add");
  v6 = v5;
  v7 = -[AVTFunCamAvatarPickerController allowsCreation](self, "allowsCreation");
  AVTAvatarUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v10 = CFSTR("ADD");
  else
    v10 = CFSTR("NONE");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1EA5207B8, CFSTR("Localized"));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageNamed:inBundle:compatibleWithTraitCollection:", v6, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_imageThatSuppressesAccessibilityHairlineThickening");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)v11;
  v16 = -[AVTAvatarListImageItem initWithImage:title:]([AVTAvatarListImageItem alloc], "initWithImage:title:", v15, v11);
  -[AVTFunCamAvatarPickerController setNoneItem:](self, "setNoneItem:", v16);

  -[AVTFunCamAvatarPickerController noneItem](self, "noneItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0D00840], "requestForCustomAvatars");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController store](self, "store");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v19, "avatarsForFetchRequest:error:", v18, &v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v39;

  if (!v20)
  {
    -[AVTFunCamAvatarPickerController logger](self, "logger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logErrorFetchingRecords:", v23);

  }
  objc_msgSend(v20, "reverseObjectEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTFunCamAvatarPickerController setEditableRecords:](self, "setEditableRecords:", v25);
  objc_msgSend((id)objc_opt_class(), "itemsFromRecords:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v26);

  objc_msgSend(MEMORY[0x1E0D00840], "requestForPredefinedAvatars");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTFunCamAvatarPickerController store](self, "store");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v28, "avatarsForFetchRequest:error:", v27, &v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v38;

  if (!v29)
  {
    -[AVTFunCamAvatarPickerController logger](self, "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "description");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logErrorFetchingRecords:", v32);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTFunCamAvatarPickerController setPuppetRecords:](self, "setPuppetRecords:", v34);
  objc_msgSend((id)objc_opt_class(), "itemsFromRecords:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v35);

  v36 = (void *)objc_msgSend(v3, "copy");
  -[AVTFunCamAvatarPickerController setItems:](self, "setItems:", v36);

  -[AVTFunCamAvatarPickerController reloadData](self, "reloadData");
}

uint64_t __46__AVTFunCamAvatarPickerController_reloadModel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ghost")) ^ 1;

  return v3;
}

- (void)updateViewForCurrentMode
{
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;

  -[AVTFunCamAvatarPickerController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVTFunCamAvatarPickerController setLastUpdateViewBounds:](self, "setLastUpdateViewBounds:");

  v4 = -[AVTFunCamAvatarPickerController mode](self, "mode");
  -[AVTFunCamAvatarPickerController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v4 == 1);

  v13 = v11 + -1.0;
  if (v4 == 1)
  {
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, 1.0, v9, v13);

    -[AVTFunCamAvatarPickerController gridLayout](self, "gridLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCollectionViewLayout:", v15);

    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

  }
  else
  {
    -[AVTFunCamAvatarPickerController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safeAreaInsets");
    v20 = v7 + v19;
    v22 = v21 + 1.0;
    v24 = v9 - (v19 + v23);
    v26 = v13 - (v21 + v25);

    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    -[AVTFunCamAvatarPickerController listLayout](self, "listLayout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCollectionViewLayout:", v28);

    -[AVTFunCamAvatarPickerController centeringDelegate](self, "centeringDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", v30);

    -[AVTFunCamAvatarPickerController style](self, "style");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "engagedCellSize");
    v34 = v26 + (v26 - v33) * -0.5 + -14.0;

    -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", 0.0, v34, v24, 14.0);

    -[AVTFunCamAvatarPickerController titlesContainer](self, "titlesContainer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAutoresizingMask:", 10);

    -[AVTFunCamAvatarPickerController updateTitlesClippingViewMask](self, "updateTitlesClippingViewMask");
  }
  -[AVTFunCamAvatarPickerController reloadData](self, "reloadData");
}

- (void)selectItemForAvatarRecord:(id)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  -[AVTFunCamAvatarPickerController setSelectedAvatarRecord:](self, "setSelectedAvatarRecord:", a3);
  if (-[AVTFunCamAvatarPickerController isViewLoaded](self, "isViewLoaded"))
  {
    -[AVTFunCamAvatarPickerController selectedIndexPath](self, "selectedIndexPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTFunCamAvatarPickerController selectItemAtIndexPath:animated:notifyDelegate:](self, "selectItemAtIndexPath:animated:notifyDelegate:", v8, v6, v5);

  }
}

- (void)selectItemAtCenterNotifyDelegate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  if (!-[AVTFunCamAvatarPickerController isDisplayingGridLayout](self, "isDisplayingGridLayout"))
  {
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v10, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v11, "item");
      -[AVTFunCamAvatarPickerController items](self, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v12 < v14)
      {
        -[AVTFunCamAvatarPickerController items](self, "items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v11, "item"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy__10;
        v22 = __Block_byref_object_dispose__10;
        v23 = 0;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __68__AVTFunCamAvatarPickerController_selectItemAtCenterNotifyDelegate___block_invoke;
        v17[3] = &unk_1EA51DF20;
        v17[4] = &v18;
        objc_msgSend(v16, "downcastWithRecordHandler:imageHandler:viewHandler:", v17, 0, 0);
        -[AVTFunCamAvatarPickerController selectItemForAvatarRecord:animated:notifyDelegate:](self, "selectItemForAvatarRecord:animated:notifyDelegate:", v19[5], 1, v3);
        _Block_object_dispose(&v18, 8);

      }
    }

  }
}

void __68__AVTFunCamAvatarPickerController_selectItemAtCenterNotifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "avatar");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;

  v5 = a5;
  v6 = a4;
  v31 = a3;
  if (-[AVTFunCamAvatarPickerController isDisplayingGridLayout](self, "isDisplayingGridLayout"))
  {
    v8 = 2;
  }
  else
  {
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v31, "item");
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    objc_msgSend(v10, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v11, v14, v16, v18, v19);
    v21 = v20;
    v23 = v22;

    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v24, v21, v23);
    v26 = v25;
    v28 = v27;

    -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContentOffset:animated:", v6, v26, v28);

    v8 = 0;
  }
  -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "selectItemAtIndexPath:animated:scrollPosition:", v31, v6, v8);

  if (v5)
    -[AVTFunCamAvatarPickerController sendSelectionEventToDelegateForItemAtIndexPath:](self, "sendSelectionEventToDelegateForItemAtIndexPath:", v31);

}

- (void)sendSelectionEventToDelegateForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[AVTFunCamAvatarPickerController avatarPickerDelegate](self, "avatarPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTFunCamAvatarPickerController items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__10;
    v15 = __Block_byref_object_dispose__10;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__AVTFunCamAvatarPickerController_sendSelectionEventToDelegateForItemAtIndexPath___block_invoke;
    v10[3] = &unk_1EA51DF20;
    v10[4] = &v11;
    objc_msgSend(v8, "downcastWithRecordHandler:imageHandler:viewHandler:", v10, 0, 0);
    -[AVTFunCamAvatarPickerController avatarPickerDelegate](self, "avatarPickerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarPicker:didSelectAvatarRecord:", self, v12[5]);

    _Block_object_dispose(&v11, 8);
  }

}

void __82__AVTFunCamAvatarPickerController_sendSelectionEventToDelegateForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "avatar");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  int64_t v7;

  v4 = a3;
  -[AVTFunCamAvatarPickerController titlesCollectionView](self, "titlesCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {

LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  v6 = -[AVTFunCamAvatarPickerController isDisplayingGridLayout](self, "isDisplayingGridLayout");

  if (!v6)
    goto LABEL_5;
  v7 = 0;
LABEL_6:

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTFunCamAvatarPickerController items](self, "items", a3, a4);
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
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v6 = a3;
  v7 = a4;
  -[AVTFunCamAvatarPickerController items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTFunCamAvatarPickerController titlesCollectionView](self, "titlesCollectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    +[AVTFunCamAvatarPickerTitleCell cellIdentifier](AVTFunCamAvatarPickerTitleCell, "cellIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke;
    v29[3] = &unk_1EA51E668;
    v16 = v15;
    v30 = v16;
    objc_msgSend(v9, "downcastWithRecordHandler:imageHandler:viewHandler:", 0, v29, 0);
    v17 = v30;
  }
  else
  {
    +[AVTFunCamAvatarPickerCollectionViewCell cellIdentifier](AVTFunCamAvatarPickerCollectionViewCell, "cellIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = !-[AVTFunCamAvatarPickerController allowsCreation](self, "allowsCreation")
       && -[AVTFunCamAvatarPickerController isDisplayingGridLayout](self, "isDisplayingGridLayout");
    objc_msgSend(v12, "setSelectionVisible:", v13);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplaySessionUUID:", v18);
    objc_msgSend(v12, "setShowsTitle:", -[AVTFunCamAvatarPickerController isDisplayingGridLayout](self, "isDisplayingGridLayout") ^ 1);
    -[AVTFunCamAvatarPickerController style](self, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "engagedCellSize");
    objc_msgSend(v12, "setEngagedSize:");

    v20 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v26[3] = &unk_1EA51E6B8;
    v26[4] = self;
    v27 = v12;
    v28 = v18;
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_4;
    v24[3] = &unk_1EA51E6E0;
    v24[4] = self;
    v21 = v27;
    v25 = v21;
    v17 = v18;
    objc_msgSend(v9, "downcastWithRecordHandler:imageHandler:viewHandler:", v26, v24, 0);
    v22 = v25;
    v16 = v21;

  }
  return v16;
}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "title");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithTitle:", v3);

}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t (**v24)(_QWORD, _QWORD, _QWORD);
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v3 = a2;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v3, "avatar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEditable") && (objc_msgSend(a1[4], "isDisplayingGridLayout") & 1) == 0)
  {
    objc_msgSend(a1[4], "editableRecordsListRenderingScope");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[4], "gridRenderingScope");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  objc_msgSend(v3, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEditable"))
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v6, "adaptedFramingModeForObjectType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = a1[5];
  +[AVTRenderingScope extraMagnifyingFactorForFramingMode:](AVTRenderingScope, "extraMagnifyingFactorForFramingMode:", v9);
  objc_msgSend(v10, "setImageZoomFactor:");
  if (objc_msgSend(a1[4], "isDisplayingGridLayout"))
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(a1[5], "setImageContentMode:", v11);
  v12 = 0.0;
  if (objc_msgSend(a1[4], "isDisplayingGridLayout"))
  {
    objc_msgSend(a1[4], "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interitemSpacing");
    v12 = v14 * 0.5;

  }
  +[AVTFunCamAvatarPickerStyle insetProviderForConstant:](AVTFunCamAvatarPickerStyle, "insetProviderForConstant:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setImageInsetProvider:", v15);

  objc_msgSend(a1[5], "setRoundImageCorners:", objc_msgSend(a1[4], "isDisplayingGridLayout"));
  objc_msgSend(v3, "avatar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEditable");

  if (v17)
  {
    v18 = a1[5];
    +[AVTUIColorRepository placeholderBackgroundColor](AVTUIColorRepository, "placeholderBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateWithTintColor:", v19);

    v20 = a1[5];
    AVTAvatarEditorPlaceholderSilhouette();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWithImage:animated:", v21, 0);

  }
  objc_msgSend(a1[4], "imageProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "providerForRecord:scope:", v23, v6);
  v24 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v26[3] = &unk_1EA51E690;
  v27 = a1[5];
  v28 = a1[6];
  v29 = &v30;
  v25 = (id)((uint64_t (**)(_QWORD, _QWORD *, _QWORD))v24)[2](v24, v26, 0);

  *((_BYTE *)v31 + 24) = 1;
  _Block_object_dispose(&v30, 8);

}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "updateWithImage:animated:", v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "updateWithTintColor:", v12);
  v6 = objc_msgSend(*(id *)(a1 + 32), "isDisplayingGridLayout");
  objc_msgSend(*(id *)(a1 + 32), "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "imageItemInsetsForGrid");
  else
    objc_msgSend(v7, "imageItemInsetsForList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setImageInsetProvider:", v9);

  objc_msgSend(*(id *)(a1 + 40), "setImageContentMode:", 1);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v4, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateWithImage:animated:", v11, 0);
  objc_msgSend(*(id *)(a1 + 40), "setRoundImageCorners:", 0);

}

- (id)indexPathForNoneItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[AVTFunCamAvatarPickerController items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController noneItem](self, "noneItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0);
}

- (int64_t)indexForRecordIdentifier:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[AVTFunCamAvatarPickerController items](self, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke;
    v8[3] = &unk_1EA51DEF8;
    v9 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke_2;
  v6[3] = &unk_1EA51DED0;
  v8 = &v9;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "downcastWithRecordHandler:viewHandler:", v6, 0);
  v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "avatar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

}

- (int64_t)indexForRecord:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVTFunCamAvatarPickerController indexForRecordIdentifier:](self, "indexForRecordIdentifier:", v4);

  return v5;
}

- (CGSize)gridItemSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[AVTFunCamAvatarPickerController style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  -[AVTFunCamAvatarPickerController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "edgeLengthFittingWidth:environment:", v7, v6);
  v9 = v8;

  v10 = v9;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  double v8;
  double v9;
  CGSize result;

  v6 = a4;
  -[AVTFunCamAvatarPickerController gridLayout](self, "gridLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Custom layout for list mode shouldn't call this method"));
  -[AVTFunCamAvatarPickerController gridItemSize](self, "gridItemSize");
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v6 = a4;
  -[AVTFunCamAvatarPickerController gridLayout](self, "gridLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Custom layout for list mode shouldn't call this method"));
  -[AVTFunCamAvatarPickerController style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridEdgeInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = a4;
  -[AVTFunCamAvatarPickerController items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__AVTFunCamAvatarPickerController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v10[3] = &unk_1EA51DF20;
  v10[4] = &v11;
  objc_msgSend(v9, "downcastWithRecordHandler:imageHandler:viewHandler:", v10, 0, 0);
  -[AVTFunCamAvatarPickerController selectItemForAvatarRecord:animated:notifyDelegate:](self, "selectItemForAvatarRecord:animated:notifyDelegate:", v12[5], 1, 1);
  _Block_object_dispose(&v11, 8);

}

void __75__AVTFunCamAvatarPickerController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "avatar");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  -[AVTFunCamAvatarPickerController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 == v11)
  {
    objc_msgSend(v11, "contentOffset");
    v7 = v6;
    v9 = v8;
    -[AVTFunCamAvatarPickerController titlesCollectionView](self, "titlesCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentOffset:", v7, v9);

    v5 = v11;
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[AVTFunCamAvatarPickerController selectItemAtCenterNotifyDelegate:](self, "selectItemAtCenterNotifyDelegate:", 1);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isDragging") & 1) == 0 && (objc_msgSend(v4, "isTracking") & 1) == 0)
    -[AVTFunCamAvatarPickerController selectItemAtCenterNotifyDelegate:](self, "selectItemAtCenterNotifyDelegate:", 1);

}

- (void)sessionProviderDidEndCameraSession:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVTFunCamAvatarPickerController avatarPickerDelegate](self, "avatarPickerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTFunCamAvatarPickerController avatarPickerDelegate](self, "avatarPickerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarPickerDidEndCameraSession:", self);

  }
}

- (void)sessionProviderWillStartCameraSession:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVTFunCamAvatarPickerController avatarPickerDelegate](self, "avatarPickerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTFunCamAvatarPickerController avatarPickerDelegate](self, "avatarPickerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarPickerWillStartCameraSession:", self);

  }
}

- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v12 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AVTFunCamAvatarPickerController items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __77__AVTFunCamAvatarPickerController_selectAvatarRecordWithIdentifier_animated___block_invoke;
      v13[3] = &unk_1EA51E708;
      v14 = v5;
      v15 = &v20;
      objc_msgSend(v11, "downcastWithRecordHandler:imageHandler:viewHandler:", v13, 0, 0);
      LOBYTE(v11) = v21[5] == 0;

      if ((v11 & 1) == 0)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[AVTFunCamAvatarPickerController selectItemForAvatarRecord:animated:notifyDelegate:](self, "selectItemForAvatarRecord:animated:notifyDelegate:", v21[5], v12, 0);
  _Block_object_dispose(&v20, 8);

}

void __77__AVTFunCamAvatarPickerController_selectAvatarRecordWithIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(v9, "avatar");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (AVTAvatarPickerDelegate)avatarPickerDelegate
{
  return (AVTAvatarPickerDelegate *)objc_loadWeakRetained((id *)&self->avatarPickerDelegate);
}

- (void)setAvatarPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->avatarPickerDelegate, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (AVTFunCamAvatarPickerStyle)style
{
  return self->_style;
}

- (BOOL)allowsCreation
{
  return self->_allowsCreation;
}

- (void)setAllowsCreation:(BOOL)a3
{
  self->_allowsCreation = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIView)titlesContainer
{
  return self->_titlesContainer;
}

- (void)setTitlesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_titlesContainer, a3);
}

- (UICollectionView)titlesCollectionView
{
  return self->_titlesCollectionView;
}

- (void)setTitlesCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_titlesCollectionView, a3);
}

- (UIView)titlesClippingView
{
  return self->_titlesClippingView;
}

- (void)setTitlesClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_titlesClippingView, a3);
}

- (CGRect)lastUpdateViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastUpdateViewBounds.origin.x;
  y = self->_lastUpdateViewBounds.origin.y;
  width = self->_lastUpdateViewBounds.size.width;
  height = self->_lastUpdateViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastUpdateViewBounds:(CGRect)a3
{
  self->_lastUpdateViewBounds = a3;
}

- (AVTAvatarRecord)selectedAvatarRecord
{
  return self->_selectedAvatarRecord;
}

- (void)setSelectedAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAvatarRecord, a3);
}

- (AVTFunCamAvatarPickerCollectionViewLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
  objc_storeStrong((id *)&self->_listLayout, a3);
}

- (UICollectionViewFlowLayout)gridLayout
{
  return self->_gridLayout;
}

- (void)setGridLayout:(id)a3
{
  objc_storeStrong((id *)&self->_gridLayout, a3);
}

- (AVTCenteringCollectionViewDelegate)centeringDelegate
{
  return self->_centeringDelegate;
}

- (void)setCenteringDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_centeringDelegate, a3);
}

- (NSArray)puppetRecords
{
  return self->_puppetRecords;
}

- (void)setPuppetRecords:(id)a3
{
  objc_storeStrong((id *)&self->_puppetRecords, a3);
}

- (NSArray)editableRecords
{
  return self->_editableRecords;
}

- (void)setEditableRecords:(id)a3
{
  objc_storeStrong((id *)&self->_editableRecords, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (AVTAvatarListImageItem)noneItem
{
  return self->_noneItem;
}

- (void)setNoneItem:(id)a3
{
  objc_storeStrong((id *)&self->_noneItem, a3);
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTRenderingScope)editableRecordsListRenderingScope
{
  return self->_editableRecordsListRenderingScope;
}

- (AVTRenderingScope)gridRenderingScope
{
  return self->_gridRenderingScope;
}

- (NSObject)changeNotificationToken
{
  return self->_changeNotificationToken;
}

- (void)setChangeNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_changeNotificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotificationToken, 0);
  objc_storeStrong((id *)&self->_gridRenderingScope, 0);
  objc_storeStrong((id *)&self->_editableRecordsListRenderingScope, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_noneItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_editableRecords, 0);
  objc_storeStrong((id *)&self->_puppetRecords, 0);
  objc_storeStrong((id *)&self->_centeringDelegate, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_selectedAvatarRecord, 0);
  objc_storeStrong((id *)&self->_titlesClippingView, 0);
  objc_storeStrong((id *)&self->_titlesCollectionView, 0);
  objc_storeStrong((id *)&self->_titlesContainer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end
