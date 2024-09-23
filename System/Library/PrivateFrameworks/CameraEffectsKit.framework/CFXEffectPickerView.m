@implementation CFXEffectPickerView

- (CFXEffectPickerView)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CFXEffectPickerView *v6;
  CFXEffectPickerView *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB0];
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("cannot initialize abstract class %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)CFXEffectPickerView;
  v6 = -[CFXEffectPickerView initWithCoder:](&v16, sel_initWithCoder_, v4);
  v7 = v6;
  if (v6)
    -[CFXEffectPickerView sharedInit](v6, "sharedInit");

  return v7;
}

- (CFXEffectPickerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  CFXEffectPickerView *v9;
  CFXEffectPickerView *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB0];
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("cannot initialize abstract class %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CFXEffectPickerView;
  v9 = -[CFXEffectPickerView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
    -[CFXEffectPickerView sharedInit](v9, "sharedInit");
  return v10;
}

- (void)sharedInit
{
  void *v3;
  void *v4;
  id v5;
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
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  -[CFXEffectPickerView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[CFXEffectPickerView effectPickerNibName](self, "effectPickerNibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "loadNibNamed:owner:options:", v3, self, 0);

    -[CFXEffectPickerView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView addSubview:](self, "addSubview:", v6);

    -[CFXEffectPickerView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v24 = (void *)MEMORY[0x24BDD1628];
    -[CFXEffectPickerView contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView leadingAnchor](self, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    -[CFXEffectPickerView contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v23;
    -[CFXEffectPickerView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v32 = v3;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v11;
    -[CFXEffectPickerView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView bottomAnchor](self, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v16);

    -[CFXEffectPickerView effectPickerCellNibName](self, "effectPickerCellNibName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDF6C08];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nibWithNibName:bundle:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[CFXEffectPickerView collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView effectPickerCellReuseIdentifier](self, "effectPickerCellReuseIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerNib:forCellWithReuseIdentifier:", v20, v22);

    v3 = v32;
  }
  else
  {
    -[CFXEffectPickerView effectPickerCellNibName](self, "effectPickerCellNibName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  self->_cellSize = (CGSize)kDefaultCellSize;
  -[CFXEffectPickerView subviewsDidLoad](self, "subviewsDidLoad");

}

- (void)subviewsDidLoad
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[CFXEffectPickerView collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (id)effectPickerNibName
{
  return 0;
}

- (id)effectPickerCellNibName
{
  return 0;
}

- (void)reloadData
{
  void *v3;

  -[CFXEffectPickerView previewManager](self, "previewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!-[CFXEffectPickerView previewingIsWaitingForConfiguration](self, "previewingIsWaitingForConfiguration"))
  {
    return;
  }
  -[CFXEffectPickerView stopPreviewing](self, "stopPreviewing");
  -[CFXEffectPickerView startPreviewing](self, "startPreviewing");
}

- (void)setContinuousPreviewEnabled:(BOOL)a3
{
  void *v4;

  if (self->_continuousPreviewEnabled != a3)
  {
    self->_continuousPreviewEnabled = a3;
    -[CFXEffectPickerView previewManager](self, "previewManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[CFXEffectPickerView reloadData](self, "reloadData");
  }
}

- (void)setUseCameraForContinuousPreview:(BOOL)a3
{
  void *v4;
  int v5;

  if (self->_useCameraForContinuousPreview != a3)
  {
    self->_useCameraForContinuousPreview = a3;
    -[CFXEffectPickerView previewManager](self, "previewManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isContinouslyPreviewing");

    if (v5)
      -[CFXEffectPickerView reloadData](self, "reloadData");
  }
}

- (void)setPreviewBackgroundImage:(id)a3
{
  UIImage *v5;
  void *v6;
  int v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  if (self->_previewBackgroundImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_previewBackgroundImage, a3);
    -[CFXEffectPickerView previewManager](self, "previewManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isContinouslyPreviewing");

    v5 = v8;
    if (v7)
    {
      -[CFXEffectPickerView reloadData](self, "reloadData");
      v5 = v8;
    }
  }

}

- (CGSize)previewSizeInPixels
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CFXEffectPickerView thumbnailSize](self, "thumbnailSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  v9 = v3 * v8;
  v10 = v5 * v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  void *v5;

  if (a3.width != self->_thumbnailSize.width || a3.height != self->_thumbnailSize.height)
  {
    self->_thumbnailSize = a3;
    -[CFXEffectPickerView previewManager](self, "previewManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[CFXEffectPickerView reloadData](self, "reloadData");
  }
}

- (void)setCellSize:(CGSize)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3.width != self->_cellSize.width || a3.height != self->_cellSize.height)
  {
    if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      a3.width = 1.0;
      a3.height = 1.0;
    }
    self->_cellSize = a3;
    -[CFXEffectPickerView collectionViewLayout](self, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "invalidationContextClass");
    v7 = (id)objc_opt_new();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setInvalidateFlowLayoutDelegateMetrics:", 1);
    -[CFXEffectPickerView collectionViewLayout](self, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateLayoutWithContext:", v7);

    if (-[CFXEffectPickerView previewingIsWaitingForConfiguration](self, "previewingIsWaitingForConfiguration"))
      -[CFXEffectPickerView reloadData](self, "reloadData");

  }
}

- (void)startPreviewing
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  BOOL v9;
  JFXEffectPreviewManager *v10;
  JFXEffectPreviewManager *v11;
  void *v12;
  id v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[CFXEffectPickerView previewManager](self, "previewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CFXEffectPickerView thumbnailSize](self, "thumbnailSize");
    v6 = v5 == *MEMORY[0x24BDBF148] && v4 == *(double *)(MEMORY[0x24BDBF148] + 8);
    if (v6 || ((-[CFXEffectPickerView cellSize](self, "cellSize"), v8 == 1.0) ? (v9 = v7 == 1.0) : (v9 = 0), v9))
    {
      -[CFXEffectPickerView setPreviewingIsWaitingForConfiguration:](self, "setPreviewingIsWaitingForConfiguration:", 1);
      return;
    }
    v10 = [JFXEffectPreviewManager alloc];
    v11 = -[JFXEffectPreviewManager initWithName:callbackQueue:](v10, "initWithName:callbackQueue:", CFSTR("FilterPicker"), MEMORY[0x24BDAC9B8]);
    -[CFXEffectPickerView setPreviewManager:](self, "setPreviewManager:", v11);

    -[CFXEffectPickerView previewManager](self, "previewManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[CFXEffectPickerView setPreviewingIsWaitingForConfiguration:](self, "setPreviewingIsWaitingForConfiguration:", 0);
    if (-[CFXEffectPickerView isContinuousPreviewEnabled](self, "isContinuousPreviewEnabled"))
    {
      if (-[CFXEffectPickerView isUsingCameraForContinuousPreview](self, "isUsingCameraForContinuousPreview"))
      {
        v13 = -[JFXEffectContinousLiveCapturePreviewOptions initLiveCaptureOptions]([JFXEffectContinousLiveCapturePreviewOptions alloc], "initLiveCaptureOptions");
      }
      else
      {
        v13 = -[JFXEffectContinousPreviewImageOptions initImageOptionsWithFrameRate:]([JFXEffectContinousPreviewImageOptions alloc], "initImageOptionsWithFrameRate:", 15);
        -[CFXEffectPickerView previewBackgroundImage](self, "previewBackgroundImage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[CFXEffectPickerView previewBackgroundImage](self, "previewBackgroundImage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = (void *)MEMORY[0x24BDF6AC8];
          objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXEffectPickerView thumbnailSize](self, "thumbnailSize");
          objc_msgSend(v21, "imageWithColor:andSize:", v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        +[JTImage jtImageWithUIImage:](JTImage, "jtImageWithUIImage:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackgroundImage:", v23);

      }
      -[CFXEffectPickerView previewManager](self, "previewManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectPickerView previewSizeInPixels](self, "previewSizeInPixels");
      objc_msgSend(v24, "startPreparingPreviewsContinuouslyAtSize:options:", v13);

    }
    else
    {
      -[CFXEffectPickerView previewBackgroundImage](self, "previewBackgroundImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_22:
        -[CFXEffectPickerView collectionView](self, "collectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDataSource:", self);

        -[CFXEffectPickerView collectionView](self, "collectionView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "reloadData");

        -[CFXEffectPickerView collectionView](self, "collectionView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setHidden:", 0);

        -[CFXEffectPickerView collectionView](self, "collectionView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "layoutIfNeeded");

        -[CFXEffectPickerView updatePreviewEffectsWhenReloadComplete](self, "updatePreviewEffectsWhenReloadComplete");
        return;
      }
      v15 = -[JFXEffectStaticPreviewOptions initStaticPreviewOptions]([JFXEffectStaticPreviewOptions alloc], "initStaticPreviewOptions");
      -[CFXEffectPickerView setStaticPreviewOptions:](self, "setStaticPreviewOptions:", v15);

      -[CFXEffectPickerView previewBackgroundImage](self, "previewBackgroundImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[JTImage jtImageWithUIImage:](JTImage, "jtImageWithUIImage:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectPickerView staticPreviewOptions](self, "staticPreviewOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRenderBackgroundImage:", v17);

      -[CFXEffectPickerView staticPreviewOptions](self, "staticPreviewOptions");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDontCacheToDisk:", 1);
    }

    goto LABEL_22;
  }
}

- (void)updatePreviewEffectsWhenReloadComplete
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 30000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CFXEffectPickerView_updatePreviewEffectsWhenReloadComplete__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __61__CFXEffectPickerView_updatePreviewEffectsWhenReloadComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v5, "updatePreviewEffects");
  else
    return objc_msgSend(v5, "updatePreviewEffectsWhenReloadComplete");
}

- (void)updatePreviewEffects
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CFXEffectPickerView previewManager](self, "previewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectPickerView previewManager](self, "previewManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isContinouslyPreviewing") & 1) != 0)
    {

    }
    else
    {
      v5 = -[CFXEffectPickerView isContinuousPreviewEnabled](self, "isContinuousPreviewEnabled");

      if (!v5)
        return;
    }
    -[CFXEffectPickerView collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "effect", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (objc_msgSend(v14, "jtEffect"),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(),
                  v16 = objc_msgSend(v15, "isEmoji"),
                  v15,
                  (v16 & 1) == 0))
            {
              objc_msgSend(v14, "jtEffect");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v17);

            }
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    -[CFXEffectPickerView previewManager](self, "previewManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContinousPreviewEffects:", v8);

  }
}

- (void)stopPreviewing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[CFXEffectPickerView previewManager](self, "previewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectPickerView setPreviewManager:](self, "setPreviewManager:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CFXEffectPickerView collectionView](self, "collectionView", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "setImage:", 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[CFXEffectPickerView collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSource:", 0);

    -[CFXEffectPickerView collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

  }
}

- (void)applyEffectAtCellIndex:(unint64_t)a3
{
  unint64_t v4;
  id v5;

  v4 = -[CFXEffectPickerView effectIndexForCellIndex:](self, "effectIndexForCellIndex:", a3);
  -[CFXEffectPickerView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectPickerView:didPickEffectAtIndex:", self, v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[CFXEffectPickerView didSelectItemAtCellIndex:](self, "didSelectItemAtCellIndex:", objc_msgSend(a4, "item", a3));
}

- (void)didScrollCollectionView
{
  void *v3;

  -[CFXEffectPickerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectPickerViewDidScroll:", self);

  -[CFXEffectPickerView updatePreviewEffects](self, "updatePreviewEffects");
}

- (unint64_t)numberOfCollectionViewItems
{
  void *v3;
  unint64_t v4;

  -[CFXEffectPickerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfEffectsInPickerView:", self);

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  CFXEffectPickerView *v23;

  v5 = a4;
  -[CFXEffectPickerView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerView effectPickerCellReuseIdentifier](self, "effectPickerCellReuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "item");
  v10 = -[CFXEffectPickerView effectIndexForCellIndex:](self, "effectIndexForCellIndex:", v9);
  -[CFXEffectPickerView dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectPickerView:effectIdentifierAtIndex:", self, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setEffectIdentifier:", v12);
  -[CFXEffectPickerView configureCell:](self, "configureCell:", v8);
  -[CFXEffectPickerView dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerView previewSizeInPixels](self, "previewSizeInPixels");
  v15 = v14;
  v17 = v16;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __61__CFXEffectPickerView_collectionView_cellForItemAtIndexPath___block_invoke;
  v21[3] = &unk_24EE58ED0;
  v18 = v8;
  v22 = v18;
  v23 = self;
  objc_msgSend(v13, "effectPickerView:effectAtIndex:forPreviewingAtSizeInPixels:completionBlock:", self, v10, v21, v15, v17);

  v19 = v18;
  return v19;
}

void __61__CFXEffectPickerView_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "effectIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "effectDidLoadForCell:effect:", *(_QWORD *)(a1 + 32), v6);
  }

}

- (unint64_t)effectIndexForCellIndex:(unint64_t)a3
{
  return a3;
}

- (void)effectDidLoadForCell:(id)a3 effect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setEffect:", v7);
  objc_msgSend(v7, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v7, "jtEffect"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEmoji"),
        v10,
        v11))
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("face.smiling.fill"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[JTImage jtImageWithUIImage:](JTImage, "jtImageWithUIImage:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v13);

  }
  else
  {
    objc_msgSend(v7, "jtEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "type");

    if (v15 == 1)
    {
      +[CFXEffectHostAppDelegate sharedInstance](CFXEffectHostAppDelegate, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferredDisplayColorSpace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isHDRSpace");

      objc_msgSend(v7, "jtEffect");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHDR:", v18);

    }
    -[CFXEffectPickerView previewManager](self, "previewManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jtEffect");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectPickerView previewSizeInPixels](self, "previewSizeInPixels");
    v23 = v22;
    v25 = v24;
    -[CFXEffectPickerView staticPreviewOptions](self, "staticPreviewOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __51__CFXEffectPickerView_effectDidLoadForCell_effect___block_invoke;
    v47[3] = &unk_24EE58EF8;
    v48 = v6;
    v27 = v7;
    v49 = v27;
    objc_msgSend(v20, "previewForEffect:atSize:options:completion:", v21, v26, v47, v23, v25);

    -[CFXEffectPickerView updatePreviewEffects](self, "updatePreviewEffects");
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[CFXEffectPickerView previewManager](self, "previewManager", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "continousPreviewEffects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v44;
LABEL_8:
      v33 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v33);
        objc_msgSend(v27, "jtEffect");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35 == v34)
          break;
        if (v31 == ++v33)
        {
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v31)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      -[CFXEffectPickerView previewManager](self, "previewManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "continousPreviewEffects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v37, "mutableCopy");

      objc_msgSend(v27, "jtEffect");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v38);

      -[CFXEffectPickerView previewManager](self, "previewManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setContinousPreviewEffects:", v29);

      JFXLog_pickerUI();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "jtEffect");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "accessibilityName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v42;
        _os_log_impl(&dword_2269A9000, v40, OS_LOG_TYPE_DEFAULT, "Missing entry for %@, adding here as a workaround", buf, 0xCu);

      }
    }

  }
}

void __51__CFXEffectPickerView_effectDidLoadForCell_effect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "effectIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v6);

}

- (void)effectPreviewManager:(id)a3 didUpdateContinousPreviewsForEffectIDs:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v5 = a4;
  -[CFXEffectPickerView previewManager](self, "previewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__CFXEffectPickerView_effectPreviewManager_didUpdateContinousPreviewsForEffectIDs___block_invoke;
  v7[3] = &unk_24EE58F20;
  v7[4] = self;
  objc_msgSend(v6, "continousPreviewsForEffectIDs:completion:", v5, v7);

}

void __83__CFXEffectPickerView_effectPreviewManager_didUpdateContinousPreviewsForEffectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x24BE79298];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "effect");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "setImage:", v14);
        }
        else
        {
          objc_msgSend(v3, "objectForKey:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setImage:", v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)didResizeCollectionViewToSize:(CGSize)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CFXEffectPickerView_didResizeCollectionViewToSize___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __53__CFXEffectPickerView_didResizeCollectionViewToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePreviewEffects");
}

- (id)effectPickerCellReuseIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)collectionView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)collectionViewLayout
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)contentView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)isContinuousPreviewEnabled
{
  return self->_continuousPreviewEnabled;
}

- (UIImage)previewBackgroundImage
{
  return self->_previewBackgroundImage;
}

- (BOOL)isUsingCameraForContinuousPreview
{
  return self->_useCameraForContinuousPreview;
}

- (CFXEffectPickerViewDataSource)dataSource
{
  return (CFXEffectPickerViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (CFXEffectPickerViewDelegate)delegate
{
  return (CFXEffectPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (JFXEffectStaticPreviewOptions)staticPreviewOptions
{
  return self->_staticPreviewOptions;
}

- (void)setStaticPreviewOptions:(id)a3
{
  objc_storeStrong((id *)&self->_staticPreviewOptions, a3);
}

- (BOOL)previewingIsWaitingForConfiguration
{
  return self->_previewingIsWaitingForConfiguration;
}

- (void)setPreviewingIsWaitingForConfiguration:(BOOL)a3
{
  self->_previewingIsWaitingForConfiguration = a3;
}

- (JFXEffectPreviewManager)previewManager
{
  return self->_previewManager;
}

- (void)setPreviewManager:(id)a3
{
  objc_storeStrong((id *)&self->_previewManager, a3);
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewManager, 0);
  objc_storeStrong((id *)&self->_staticPreviewOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_previewBackgroundImage, 0);
}

@end
