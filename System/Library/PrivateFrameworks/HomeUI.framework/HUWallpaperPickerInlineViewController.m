@implementation HUWallpaperPickerInlineViewController

+ (BOOL)useWallpaperPickerCell
{
  return objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
}

- (HUWallpaperPickerInlineViewController)init
{
  id v3;
  HUWallpaperPickerInlineViewController *v4;
  HUWallpaperPickerInlineViewController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *imageCache;
  uint64_t v8;
  UIDropInteraction *dropInteraction;
  NSArray *v10;
  NSArray *namedWallpapers;
  NSMutableDictionary *v12;
  NSMutableDictionary *thumbnailCache;
  NSArray *v14;
  NSArray *namedWallpaperThumbnails;
  objc_super v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v3, "setScrollDirection:", 1);
  objc_msgSend(v3, "setMinimumLineSpacing:", 20.0);
  v17.receiver = self;
  v17.super_class = (Class)HUWallpaperPickerInlineViewController;
  v4 = -[HUWallpaperPickerInlineViewController initWithCollectionViewLayout:](&v17, sel_initWithCollectionViewLayout_, v3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_flowLayout, v3);
    v5->_imageSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    imageCache = v5->_imageCache;
    v5->_imageCache = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA588]), "initWithDelegate:", v5);
    dropInteraction = v5->_dropInteraction;
    v5->_dropInteraction = (UIDropInteraction *)v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    namedWallpapers = v5->_namedWallpapers;
    v5->_namedWallpapers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    thumbnailCache = v5->_thumbnailCache;
    v5->_thumbnailCache = v12;

    v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    namedWallpaperThumbnails = v5->_namedWallpaperThumbnails;
    v5->_namedWallpaperThumbnails = v14;

  }
  return v5;
}

- (void)viewDidLoad
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUWallpaperPickerInlineViewController;
  -[HUWallpaperPickerInlineViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("HUWallpaperPhotoCell"));

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsMultipleSelection:", 0);

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentInset:", 20.0, 20.0, 20.0, 20.0);

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController dropInteraction](self, "dropInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addInteraction:", v11);

  -[HUWallpaperPickerInlineViewController updateScrolling](self, "updateScrolling");
}

- (CGSize)preferredContentSize
{
  void *v3;
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
  double v14;
  double v15;
  CGSize result;

  -[HUWallpaperPickerInlineViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[HUWallpaperPickerInlineViewController imageSize](self, "imageSize");
  v7 = v6;
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v10 = v7 + v9;
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  v13 = v10 + v12;

  v14 = v5;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setCustomWallpaper:(id)a3 image:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *originalCustomImage;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_customWallpaper, a3);
  v7 = a4;
  -[HUWallpaperPickerInlineViewController imageCache](self, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v9);

  -[HUWallpaperPickerInlineViewController customWallpaperCell](self, "customWallpaperCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController configureCell:image:wallpaper:](self, "configureCell:image:wallpaper:", v10, v7, v13);

  v11 = v13;
  if (!v13)
  {
    originalCustomImage = self->_originalCustomImage;
    self->_originalCustomImage = 0;

    v11 = 0;
  }

}

- (void)setNamedWallpapers:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_namedWallpapers, a3);
  -[HUWallpaperPickerInlineViewController updateScrolling](self, "updateScrolling");
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)setNamedWallpaperThumbnails:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_namedWallpaperThumbnails, a3);
  -[HUWallpaperPickerInlineViewController updateScrolling](self, "updateScrolling");
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)setImageSize:(CGSize)a3
{
  void *v4;
  id v5;

  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    -[HUWallpaperPickerInlineViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    -[HUWallpaperPickerInlineViewController collectionViewLayout](self, "collectionViewLayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateLayout");

  }
}

- (void)setImageSizeToFitWidth:(double)a3 forNumberOfWallpapers:(unint64_t)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  -[HUWallpaperPickerInlineViewController flowLayout](self, "flowLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumLineSpacing");
  v9 = v8;

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = a3 - v11;
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  v15 = v12 - v14;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v18 / v20;

  v22 = (v15 - v9
             * (double)(-[HUWallpaperPickerInlineViewController numberOfWallpapers](self, "numberOfWallpapers") - 1))
      / (double)a4;
  -[HUWallpaperPickerInlineViewController setImageSize:](self, "setImageSize:", v22, round(v21 * v22));
  -[HUWallpaperPickerInlineViewController setNumberOfWallpapersFittingInWidth:](self, "setNumberOfWallpapersFittingInWidth:", a4);
  -[HUWallpaperPickerInlineViewController updateScrolling](self, "updateScrolling");
}

- (void)setSelectedWallpaper:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v4 = a4;
  v21 = a3;
  -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (!v6)
    goto LABEL_3;
  objc_msgSend(v21, "assetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  v7 = v21;
  if ((v11 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(v7, "assetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController customWallpaper](self, "customWallpaper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[HUWallpaperPickerInlineViewController numberOfWallpapers](self, "numberOfWallpapers") - 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUWallpaperPickerInlineViewController namedWallpapers](self, "namedWallpapers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "na_map:", &__block_literal_global_24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "assetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "indexOfObject:", v19);

      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v20, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v7 = v21;
    if (v16)
    {
      -[HUWallpaperPickerInlineViewController setSelectedIndexPath:animated:](self, "setSelectedIndexPath:animated:", v16, v4);

      v7 = v21;
    }
  }

}

uint64_t __71__HUWallpaperPickerInlineViewController_setSelectedWallpaper_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

- (void)setSelectedIndexPath:(id)a3
{
  -[HUWallpaperPickerInlineViewController setSelectedIndexPath:animated:](self, "setSelectedIndexPath:animated:", a3, 1);
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSIndexPath *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSIndexPath *selectedIndexPath;

  v4 = a4;
  v6 = (NSIndexPath *)a3;
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showBorder:animated:", 1, v4);

  -[HUWallpaperPickerInlineViewController selectedIndexPath](self, "selectedIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController selectedIndexPath](self, "selectedIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "showBorder:animated:", 0, v4);

  }
  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isScrollEnabled");

  if (v14)
  {
    -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 32, v4);

  }
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v6;

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)configureCell:(id)a3 image:(id)a4 wallpaper:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v12, "setEmpty:", v7 == 0);
  if (v7)
  {
    objc_msgSend(v12, "setImage:", v7);
    v9 = objc_msgSend(v8, "isCustomType");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("photo.on.rectangle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v10);

    v9 = 0;
  }
  objc_msgSend(v12, "setRemovable:", v9);
  if (v8)
  {
    objc_msgSend(v8, "assetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAssetIdentifier:", v11);

  }
  else
  {
    objc_msgSend(v12, "setAssetIdentifier:", 0);
  }
  objc_msgSend(v12, "setBusy:", 0);
  objc_msgSend(v12, "setHighlighted:", 0);
  objc_msgSend(v12, "setContentMode:", 2 * (objc_msgSend(v8, "type") != 2));

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  uint64_t v25;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("HUWallpaperPhotoCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController wallpaperForIndexPath:](self, "wallpaperForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_10;
  -[HUWallpaperPickerInlineViewController imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_13;
  if (!objc_msgSend(v8, "type")
    || objc_msgSend(v8, "type") == 2
    || objc_msgSend(v8, "type") == 3
    || objc_msgSend(v8, "type") == 4
    || objc_msgSend(v8, "type") == 5)
  {
    -[HUWallpaperPickerInlineViewController thumbnailWallpaperForIndexPath:](self, "thumbnailWallpaperForIndexPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController thumbnailCache](self, "thumbnailCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v11 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "wallpaperImageForWallpaper:variant:", v12, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[HUWallpaperPickerInlineViewController thumbnailCache](self, "thumbnailCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKey:", v11, v19);

  }
  else
  {
LABEL_10:
    v11 = 0;
  }
LABEL_13:
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setCornerRadius:", 10.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v20);

  -[HUWallpaperPickerInlineViewController configureCell:image:wallpaper:](self, "configureCell:image:wallpaper:", v7, v11, v8);
  -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v8, "assetIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "assetIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showBorder:animated:", objc_msgSend(v22, "isEqualToString:", v24), 0);

  }
  v25 = objc_msgSend(v6, "item");
  if (v25 == -[HUWallpaperPickerInlineViewController numberOfWallpapers](self, "numberOfWallpapers") - 1)
    -[HUWallpaperPickerInlineViewController setCustomWallpaperCell:](self, "setCustomWallpaperCell:", v7);

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v6 = a4;
  -[HUWallpaperPickerInlineViewController selectedIndexPath](self, "selectedIndexPath");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[HUWallpaperPickerInlineViewController selectedIndexPath](self, "selectedIndexPath"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "item"),
        v11 = objc_msgSend(v6, "item"),
        v9,
        v8,
        v10 != v11))
  {
    -[HUWallpaperPickerInlineViewController wallpaperForIndexPath:](self, "wallpaperForIndexPath:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[HUWallpaperPickerInlineViewController customWallpaper](self, "customWallpaper");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
        goto LABEL_25;
      v26 = objc_alloc_init(MEMORY[0x1E0CEA648]);
      -[HUWallpaperPickerInlineViewController setImagePicker:](self, "setImagePicker:", v26);

      -[HUWallpaperPickerInlineViewController imagePicker](self, "imagePicker");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelegate:", self);

      -[HUWallpaperPickerInlineViewController imagePicker](self, "imagePicker");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSourceType:", 0);

      -[HUWallpaperPickerInlineViewController imagePicker](self, "imagePicker");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setModalPresentationStyle:", 2);

      -[HUWallpaperPickerInlineViewController popoverPresentationController](self, "popoverPresentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "cellForItemAtIndexPath:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSourceView:", v30);

      -[HUWallpaperPickerInlineViewController imagePicker](self, "imagePicker");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPickerInlineViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v31, 1, 0);
LABEL_23:

      goto LABEL_24;
    }
    -[HUWallpaperPickerInlineViewController setSelectedIndexPath:animated:](self, "setSelectedIndexPath:animated:", v6, 1);
    -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_25;
    v16 = (void *)v15;
    -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_25;
    -[HUWallpaperPickerInlineViewController imageCache](self, "imageCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v13)
    {
      if ((objc_msgSend(v21, "isCustomType") & 1) != 0)
      {
        -[HUWallpaperPickerInlineViewController originalCustomImage](self, "originalCustomImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[HUWallpaperPickerInlineViewController originalCustomImage](self, "originalCustomImage");
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
      }
      else
      {

      }
LABEL_22:
      -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "wallpaperPicker:didSelectWallpaper:withImage:", self, v36, v13);

      goto LABEL_23;
    }
    if (objc_msgSend(v21, "type"))
    {
      -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "type") != 4)
      {
        -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "type");

        if (v34 != 5)
          goto LABEL_25;
        goto LABEL_20;
      }

    }
LABEL_20:
    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wallpaperImageForWallpaper:variant:", v35, 0);
    v24 = objc_claimAutoreleasedReturnValue();

LABEL_21:
    v13 = (void *)v24;
    if (!v24)
      goto LABEL_25;
    goto LABEL_22;
  }
  -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wallpaperPickerRequestOpenWallpaperEditor:", self);
LABEL_24:

  }
LABEL_25:

}

- (void)wallpaperPhotoCellDidPressDeleteButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCustomType");

  if (v5)
  {
    -[HUWallpaperPickerInlineViewController namedWallpapers](self, "namedWallpapers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController setSelectedWallpaper:animated:](self, "setSelectedWallpaper:animated:", v7, 1);

  }
  -[HUWallpaperPickerInlineViewController customWallpaper](self, "customWallpaper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUWallpaperPickerInlineViewController imageCache](self, "imageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController customWallpaper](self, "customWallpaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v11);

    -[HUWallpaperPickerInlineViewController setCustomWallpaper:](self, "setCustomWallpaper:", 0);
  }
  -[HUWallpaperPickerInlineViewController customWallpaperCell](self, "customWallpaperCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController configureCell:image:wallpaper:](self, "configureCell:image:wallpaper:", v12, 0, 0);

  -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HUWallpaperPickerInlineViewController imageCache](self, "imageCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "assetIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v18);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "wallpaperImageForWallpaper:variant:", v20, 0);
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPickerInlineViewController selectedWallpaper](self, "selectedWallpaper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "wallpaperPicker:didSelectWallpaper:withImage:", self, v22, v23);

    }
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4;
  char v5;

  v4 = a4;
  v5 = objc_msgSend(v4, "canLoadObjectsOfClass:", objc_opt_class());

  return v5;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a4, "items", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") < 2;

  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA590]), "initWithDropOperation:", 2 * v5);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[HUWallpaperPickerInlineViewController customWallpaperCell](self, "customWallpaperCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  objc_msgSend(v5, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke;
  v12[3] = &unk_1E6F4DF08;
  v12[4] = self;
  v11 = (id)objc_msgSend(v9, "loadObjectOfClass:completionHandler:", v10, v12);

}

void __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke_2;
    v8[3] = &unk_1E6F4C638;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperPicker:didReceiveDroppedImage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0CEB6D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
  {
    -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController customWallpaperCell](self, "customWallpaperCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPickerInlineViewController setSelectedIndexPath:animated:](self, "setSelectedIndexPath:animated:", v10, 1);
    -[HUWallpaperPickerInlineViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wallpaperPicker:didReceiveDroppedImage:", self, v6);

  }
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (unint64_t)numberOfWallpapers
{
  void *v2;
  unint64_t v3;

  -[HUWallpaperPickerInlineViewController namedWallpaperThumbnails](self, "namedWallpaperThumbnails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") + 1;

  return v3;
}

- (HFWallpaper)selectedWallpaper
{
  void *v3;
  void *v4;
  void *v5;

  -[HUWallpaperPickerInlineViewController selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUWallpaperPickerInlineViewController selectedIndexPath](self, "selectedIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerInlineViewController wallpaperForIndexPath:](self, "wallpaperForIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (HFWallpaper *)v5;
}

- (id)wallpaperForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[HUWallpaperPickerInlineViewController namedWallpapers](self, "namedWallpapers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    -[HUWallpaperPickerInlineViewController customWallpaper](self, "customWallpaper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUWallpaperPickerInlineViewController namedWallpapers](self, "namedWallpapers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)thumbnailWallpaperForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[HUWallpaperPickerInlineViewController namedWallpaperThumbnails](self, "namedWallpaperThumbnails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v9 = 0;
  }
  else
  {
    -[HUWallpaperPickerInlineViewController namedWallpaperThumbnails](self, "namedWallpaperThumbnails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)updateScrolling
{
  id v3;

  -[HUWallpaperPickerInlineViewController collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEnabled:", -[HUWallpaperPickerInlineViewController numberOfWallpapers](self, "numberOfWallpapers") > -[HUWallpaperPickerInlineViewController numberOfWallpapersFittingInWidth](self, "numberOfWallpapersFittingInWidth"));

}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)namedWallpapers
{
  return self->_namedWallpapers;
}

- (NSArray)namedWallpaperThumbnails
{
  return self->_namedWallpaperThumbnails;
}

- (double)preferedHeight
{
  return self->_preferedHeight;
}

- (UIImage)originalCustomImage
{
  return self->_originalCustomImage;
}

- (void)setOriginalCustomImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalCustomImage, a3);
}

- (HUWallpaperPickerInlineViewControllerDelegate)delegate
{
  return (HUWallpaperPickerInlineViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (NSMutableDictionary)thumbnailCache
{
  return self->_thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCache, a3);
}

- (UIImagePickerController)imagePicker
{
  return self->_imagePicker;
}

- (void)setImagePicker:(id)a3
{
  objc_storeStrong((id *)&self->_imagePicker, a3);
}

- (HUWallpaperPhotoCell)customWallpaperCell
{
  return self->_customWallpaperCell;
}

- (void)setCustomWallpaperCell:(id)a3
{
  objc_storeStrong((id *)&self->_customWallpaperCell, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (HFWallpaper)customWallpaper
{
  return self->_customWallpaper;
}

- (void)setCustomWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_customWallpaper, a3);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (unint64_t)numberOfWallpapersFittingInWidth
{
  return self->_numberOfWallpapersFittingInWidth;
}

- (void)setNumberOfWallpapersFittingInWidth:(unint64_t)a3
{
  self->_numberOfWallpapersFittingInWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_customWallpaper, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_customWallpaperCell, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalCustomImage, 0);
  objc_storeStrong((id *)&self->_namedWallpaperThumbnails, 0);
  objc_storeStrong((id *)&self->_namedWallpapers, 0);
}

@end
