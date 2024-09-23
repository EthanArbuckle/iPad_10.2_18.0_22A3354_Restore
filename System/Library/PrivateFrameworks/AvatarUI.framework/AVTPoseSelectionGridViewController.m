@implementation AVTPoseSelectionGridViewController

- (AVTPoseSelectionGridViewController)initWithAvatarRecord:(id)a3 poseConfigurations:(id)a4 allowsCameraCapture:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  AVTPoseSelectionGridViewController *v11;
  AVTPoseSelectionGridViewController *v12;
  AVTCameraItemView *v13;
  uint64_t v14;
  UIColor *backgroundColor;
  objc_super v17;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTPoseSelectionGridViewController;
  v11 = -[AVTPoseSelectionGridViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarRecord, a3);
    if (AVTUIIsFacetrackingSupported() && v5)
    {
      v13 = -[AVTCameraItemView initWithFrame:]([AVTCameraItemView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
      -[AVTPoseSelectionGridViewController setCameraCellView:](v12, "setCameraCellView:", v13);

    }
    objc_storeStrong((id *)&v12->_stickerConfigurations, a4);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v12->_backgroundColor;
    v12->_backgroundColor = (UIColor *)v14;

  }
  return v12;
}

- (void)viewDidLoad
{
  UICollectionViewFlowLayout *v3;
  UICollectionViewFlowLayout *flowLayout;
  id v5;
  void *v6;
  UICollectionView *v7;
  UICollectionView *poseCollectionView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UICollectionView *v14;
  void *v15;
  void *v16;
  void *v17;
  AVTTaskScheduler *v18;
  AVTTaskScheduler *scheduler;
  AVTUIStickerGeneratorPool *v20;
  AVTUIStickerGeneratorPool *generatorPool;
  AVTUIStickerRenderer *v22;
  void *v23;
  AVTUIStickerRenderer *v24;
  AVTUIStickerRenderer *stickerRenderer;
  void *v26;
  void *v27;
  void *v28;
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
  AVTAvatarImageRenderer *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)AVTPoseSelectionGridViewController;
  -[AVTPoseSelectionGridViewController viewDidLoad](&v50, sel_viewDidLoad);
  v3 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0CEA450]);
  flowLayout = self->_flowLayout;
  self->_flowLayout = v3;

  v5 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTPoseSelectionGridViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", self->_flowLayout, 0.0, 0.0);
  poseCollectionView = self->_poseCollectionView;
  self->_poseCollectionView = v7;

  -[AVTPoseSelectionGridViewController contentInset](self, "contentInset");
  -[UICollectionView setContentInset:](self->_poseCollectionView, "setContentInset:");
  -[AVTPoseSelectionGridViewController backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_poseCollectionView, "setBackgroundColor:", v9);

  -[UICollectionView setDelegate:](self->_poseCollectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_poseCollectionView, "setDataSource:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_poseCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_poseCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_selectedStickerConfiguration)
  {
    -[AVTPoseSelectionGridViewController setSelectedStickerConfiguration:](self, "setSelectedStickerConfiguration:");
  }
  else
  {
    if (AVTDeviceIsGreenTea()
      && -[AVTPoseSelectionGridViewController willDisplayCameraItem](self, "willDisplayCameraItem"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_stickerConfigurations, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionGridViewController setSelectedStickerConfiguration:](self, "setSelectedStickerConfiguration:", v10);

      -[AVTPoseSelectionGridViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionGridViewController selectedStickerConfiguration](self, "selectedStickerConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "poseSelectionGridController:didSelectConfiguration:", self, v12);

      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    v14 = self->_poseCollectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](v14, "selectItemAtIndexPath:animated:scrollPosition:", v15, 0, 0);

  }
  -[AVTPoseSelectionGridViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_poseCollectionView);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  +[AVTSerialTaskScheduler fifoScheduler](AVTSerialTaskScheduler, "fifoScheduler");
  v18 = (AVTTaskScheduler *)objc_claimAutoreleasedReturnValue();
  scheduler = self->_scheduler;
  self->_scheduler = v18;

  v20 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:]([AVTUIStickerGeneratorPool alloc], "initWithMaxStickerGeneratorCount:", 2);
  generatorPool = self->_generatorPool;
  self->_generatorPool = v20;

  v22 = [AVTUIStickerRenderer alloc];
  -[AVTPoseSelectionGridViewController avatarRecord](self, "avatarRecord");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AVTUIStickerRenderer initWithAvatarRecord:stickerGeneratorPool:scheduler:](v22, "initWithAvatarRecord:stickerGeneratorPool:scheduler:", v23, self->_generatorPool, self->_scheduler);
  stickerRenderer = self->_stickerRenderer;
  self->_stickerRenderer = v24;

  v26 = (void *)MEMORY[0x1E0D00858];
  -[AVTPoseSelectionGridViewController avatarRecord](self, "avatarRecord");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "avatarForRecord:", v27);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_alloc_init(AVTAvatarImageRenderer);
  +[AVTRenderingScope gridThumbnailScope](AVTRenderingScope, "gridThumbnailScope");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarImageRenderer imageForAvatar:scope:](v48, "imageForAvatar:scope:", v49, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "imageWithRenderingMode:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController setPlaceholderImage:](self, "setPlaceholderImage:", v30);

  -[UICollectionView topAnchor](self->_poseCollectionView, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v44;
  -[UICollectionView leadingAnchor](self->_poseCollectionView, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v31;
  -[UICollectionView trailingAnchor](self->_poseCollectionView, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v35;
  -[UICollectionView bottomAnchor](self->_poseCollectionView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v40);
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
  v9.super_class = (Class)AVTPoseSelectionGridViewController;
  v7 = a4;
  -[AVTPoseSelectionGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__AVTPoseSelectionGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA51D1B0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __89__AVTPoseSelectionGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "poseCollectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTPoseSelectionGridViewController;
  -[AVTPoseSelectionGridViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AVTPoseSelectionGridViewController updateFlowLayoutItemSize](self, "updateFlowLayoutItemSize");
}

- (void)updateFlowLayoutItemSize
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[AVTPoseSelectionGridViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (v4 <= 430.0)
    v5 = 3;
  else
    v5 = 4;

  -[AVTPoseSelectionGridViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = (v7 + (double)(v5 + 1) * -10.0) / (double)v5;

  -[AVTPoseSelectionGridViewController flowLayout](self, "flowLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemSize:", v8, v8);

  -[AVTPoseSelectionGridViewController flowLayout](self, "flowLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateLayout");

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[AVTPoseSelectionGridViewController poseCollectionView](self, "poseCollectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentInset:", top, left, bottom, right);

  }
}

- (void)setBackgroundColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_backgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[AVTPoseSelectionGridViewController poseCollectionView](self, "poseCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (void)setSelectedStickerConfiguration:(id)a3
{
  AVTStickerConfiguration *v5;
  AVTStickerConfiguration *v6;
  AVTStickerConfiguration *selectedStickerConfiguration;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  UICollectionView *poseCollectionView;
  void *v13;
  void *v14;
  BOOL v15;
  UICollectionView *v16;
  void *v17;
  AVTStickerConfiguration *v18;
  _QWORD v19[4];
  AVTStickerConfiguration *v20;

  v5 = (AVTStickerConfiguration *)a3;
  v6 = v5;
  selectedStickerConfiguration = self->_selectedStickerConfiguration;
  if (selectedStickerConfiguration != v5)
  {
    v18 = v5;
    if (v5)
    {
      -[AVTPoseSelectionGridViewController stickerConfigurations](self, "stickerConfigurations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __70__AVTPoseSelectionGridViewController_setSelectedStickerConfiguration___block_invoke;
      v19[3] = &unk_1EA51DD30;
      v20 = v18;
      v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v19);

      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_storeStrong((id *)&self->_selectedStickerConfiguration, a3);
        -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = v9 + 1;
        else
          v11 = v9;

        poseCollectionView = self->_poseCollectionView;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](poseCollectionView, "selectItemAtIndexPath:animated:scrollPosition:", v13, 0, 0);

      }
      v14 = v20;
      goto LABEL_11;
    }
    self->_selectedStickerConfiguration = 0;

    v15 = -[AVTPoseSelectionGridViewController willDisplayCameraItem](self, "willDisplayCameraItem");
    v6 = 0;
    if (!v15)
    {
      v16 = self->_poseCollectionView;
      -[UICollectionView indexPathsForSelectedItems](v16, "indexPathsForSelectedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView deselectItemAtIndexPath:animated:](v16, "deselectItemAtIndexPath:animated:", v17, 1);

LABEL_11:
      v6 = v18;
    }
  }

}

uint64_t __70__AVTPoseSelectionGridViewController_setSelectedStickerConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (void)updateWithAvatarRecord:(id)a3 stickerConfigurations:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  AVTUIStickerRenderer *v9;
  void *v10;
  void *v11;
  void *v12;
  AVTUIStickerRenderer *v13;
  void *v14;
  void *v15;
  void *v16;
  AVTAvatarImageRenderer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[AVTPoseSelectionGridViewController avatarRecord](self, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTPoseSelectionGridViewController stickerConfigurations](self, "stickerConfigurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AVTPoseSelectionGridViewController setAvatarRecord:](self, "setAvatarRecord:", v24);
      -[AVTPoseSelectionGridViewController setStickerConfigurations:](self, "setStickerConfigurations:", v6);
      v9 = [AVTUIStickerRenderer alloc];
      -[AVTPoseSelectionGridViewController avatarRecord](self, "avatarRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionGridViewController generatorPool](self, "generatorPool");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionGridViewController scheduler](self, "scheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[AVTUIStickerRenderer initWithAvatarRecord:stickerGeneratorPool:scheduler:](v9, "initWithAvatarRecord:stickerGeneratorPool:scheduler:", v10, v11, v12);
      -[AVTPoseSelectionGridViewController setStickerRenderer:](self, "setStickerRenderer:", v13);

      v14 = (void *)MEMORY[0x1E0D00858];
      -[AVTPoseSelectionGridViewController avatarRecord](self, "avatarRecord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "avatarForRecord:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(AVTAvatarImageRenderer);
      +[AVTRenderingScope gridThumbnailScope](AVTRenderingScope, "gridThumbnailScope");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarImageRenderer imageForAvatar:scope:](v17, "imageForAvatar:scope:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageWithRenderingMode:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionGridViewController setPlaceholderImage:](self, "setPlaceholderImage:", v20);

      -[AVTPoseSelectionGridViewController poseCollectionView](self, "poseCollectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "reloadData");

      -[AVTPoseSelectionGridViewController poseCollectionView](self, "poseCollectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selectItemAtIndexPath:animated:scrollPosition:", v23, 0, 0);

    }
  }

}

- (BOOL)willDisplayCameraItem
{
  void *v2;
  BOOL v3;

  -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)configurationForIndex:(int64_t)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  -[AVTPoseSelectionGridViewController stickerConfigurations](self, "stickerConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3 - v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;

  -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController stickerConfigurations](self, "stickerConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v5)
    v8 = v7 + 1;
  else
    v8 = v7;

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double x;
  double y;
  double width;
  double height;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  CGRect v55;
  CGRect v56;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9 && (v10 = (void *)v9, v11 = objc_msgSend(v7, "item"), v10, !v11))
  {
    objc_msgSend(v8, "tintColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 != v28)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v29);

    }
    objc_msgSend(v8, "updateImage:animated:", 0, 0);
    objc_msgSend(v8, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v31);

    -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAutoresizingMask:", 18);

    objc_msgSend(v8, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v56 = CGRectInset(v55, 20.0, 20.0);
    x = v56.origin.x;
    y = v56.origin.y;
    width = v56.size.width;
    height = v56.size.height;
    -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", x, y, width, height);

  }
  else
  {
    objc_msgSend(v8, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v13)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v14);

    }
    -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
    {
      -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperview");

    }
    -[AVTPoseSelectionGridViewController configurationForIndex:](self, "configurationForIndex:", objc_msgSend(v7, "item"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionGridViewController stickerRenderer](self, "stickerRenderer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scheduledStickerResourceProviderForStickerConfiguration:correctClipping:", v19, 0);
    v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContextIdentifier:", v22);
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __76__AVTPoseSelectionGridViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v42 = &unk_1EA51DD58;
    v45 = &v47;
    v23 = v8;
    v43 = v23;
    v24 = v22;
    v44 = v24;
    v46 = &v51;
    v25 = (id)((uint64_t (**)(_QWORD, uint64_t *, uint64_t))v21)[2](v21, &v39, 1);
    if (!*((_BYTE *)v48 + 24))
    {
      *((_BYTE *)v52 + 24) = 1;
      -[AVTPoseSelectionGridViewController placeholderImage](self, "placeholderImage", v39, v40, v41, v42, v43);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateImage:animated:", v26, 0);

    }
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

  }
  return v8;
}

void __76__AVTPoseSelectionGridViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "contextIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != *(void **)(a1 + 40))
    goto LABEL_4;
  objc_msgSend(v7, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v7, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateImage:animated:", v3, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
LABEL_4:

    v5 = v7;
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[AVTPoseSelectionGridViewController cameraCellView](self, "cameraCellView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v11, "item"), v6, !v7))
  {
    -[AVTPoseSelectionGridViewController setSelectedStickerConfiguration:](self, "setSelectedStickerConfiguration:", 0);
    -[AVTPoseSelectionGridViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "poseSelectionGridControllerDidSelectCameraItem:", self);
  }
  else
  {
    -[AVTPoseSelectionGridViewController configurationForIndex:](self, "configurationForIndex:", objc_msgSend(v11, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionGridViewController setSelectedStickerConfiguration:](self, "setSelectedStickerConfiguration:", v8);

    -[AVTPoseSelectionGridViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionGridViewController selectedStickerConfiguration](self, "selectedStickerConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "poseSelectionGridController:didSelectConfiguration:", self, v10);

  }
}

- (AVTPoseSelectionGridViewControllerDelegate)delegate
{
  return (AVTPoseSelectionGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setWillDisplayCameraItem:(BOOL)a3
{
  self->_willDisplayCameraItem = a3;
}

- (AVTStickerConfiguration)selectedStickerConfiguration
{
  return self->_selectedStickerConfiguration;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (NSArray)stickerConfigurations
{
  return self->_stickerConfigurations;
}

- (void)setStickerConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurations, a3);
}

- (UIView)cameraCellView
{
  return self->_cameraCellView;
}

- (void)setCameraCellView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraCellView, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (UICollectionView)poseCollectionView
{
  return self->_poseCollectionView;
}

- (void)setPoseCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_poseCollectionView, a3);
}

- (AVTUIStickerRenderer)stickerRenderer
{
  return self->_stickerRenderer;
}

- (void)setStickerRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_stickerRenderer, a3);
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (AVTTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (OS_dispatch_queue)stickerGenerationQueue
{
  return self->_stickerGenerationQueue;
}

- (void)setStickerGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stickerGenerationQueue, a3);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_stickerGenerationQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_stickerRenderer, 0);
  objc_storeStrong((id *)&self->_poseCollectionView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_cameraCellView, 0);
  objc_storeStrong((id *)&self->_stickerConfigurations, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedStickerConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
