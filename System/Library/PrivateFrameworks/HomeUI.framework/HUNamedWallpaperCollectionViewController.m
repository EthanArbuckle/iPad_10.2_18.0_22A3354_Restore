@implementation HUNamedWallpaperCollectionViewController

- (HUNamedWallpaperCollectionViewController)initWithCollectionType:(int64_t)a3 horizontalInset:(double)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  HUNamedWallpaperCollectionViewController *v16;
  HUNamedWallpaperCollectionViewController *v17;
  void *v18;
  uint64_t v19;
  NSArray *wallpapers;
  void *v21;
  uint64_t v22;
  NSArray *wallpaperThumbnails;
  uint64_t v24;
  NSMutableDictionary *wallpaperThumbnailCache;
  uint64_t v26;
  NSMutableDictionary *wallpaperImageCache;
  objc_super v29;

  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v9, "setScrollDirection:", 1);
  objc_msgSend(v9, "setMinimumLineSpacing:", 8.0);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v12 / v14;

  objc_msgSend(v9, "setItemSize:", ceil(v15 * 200.0));
  v29.receiver = self;
  v29.super_class = (Class)HUNamedWallpaperCollectionViewController;
  v16 = -[HUNamedWallpaperCollectionViewController initWithCollectionViewLayout:](&v29, sel_initWithCollectionViewLayout_, v9);
  v17 = v16;
  if (v16)
  {
    v16->_collectionType = a3;
    objc_storeWeak((id *)&v16->_delegate, v8);
    v17->_edgeInsets.top = 0.0;
    v17->_edgeInsets.left = a4;
    v17->_edgeInsets.bottom = 0.0;
    v17->_edgeInsets.right = a4;
    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allNamedWallpapersForWallpaperCollectionType:", a3);
    v19 = objc_claimAutoreleasedReturnValue();
    wallpapers = v17->_wallpapers;
    v17->_wallpapers = (NSArray *)v19;

    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allNamedWallpaperThumbnailsForWallpaperCollectionType:", a3);
    v22 = objc_claimAutoreleasedReturnValue();
    wallpaperThumbnails = v17->_wallpaperThumbnails;
    v17->_wallpaperThumbnails = (NSArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    wallpaperThumbnailCache = v17->_wallpaperThumbnailCache;
    v17->_wallpaperThumbnailCache = (NSMutableDictionary *)v24;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    wallpaperImageCache = v17->_wallpaperImageCache;
    v17->_wallpaperImageCache = (NSMutableDictionary *)v26;

    -[HUNamedWallpaperCollectionViewController setPreferredContentSize:](v17, "setPreferredContentSize:", 0.0, 232.0);
  }

  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUNamedWallpaperCollectionViewController;
  -[HUNamedWallpaperCollectionViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[HUNamedWallpaperCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNamedWallpaperCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[HUNamedWallpaperCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 0);

  -[HUNamedWallpaperCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlwaysBounceVertical:", 0);

  -[HUNamedWallpaperCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInset:", 16.0, 16.0, 16.0, 16.0);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUNamedWallpaperCollectionViewController wallpaperThumbnails](self, "wallpaperThumbnails", a3, a4);
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
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  -[HUNamedWallpaperCollectionViewController wallpaperThumbnails](self, "wallpaperThumbnails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNamedWallpaperCollectionViewController wallpaperThumbnailCache](self, "wallpaperThumbnailCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wallpaperImageForWallpaper:variant:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUNamedWallpaperCollectionViewController wallpaperThumbnailCache](self, "wallpaperThumbnailCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v15);

  }
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v17, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setImage:", v12);
  objc_msgSend(v18, "setContentMode:", 2 * (objc_msgSend(v9, "type") != 2));

  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  -[HUNamedWallpaperCollectionViewController wallpapers](self, "wallpapers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HUNamedWallpaperCollectionViewController wallpaperImageCache](self, "wallpaperImageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wallpaperImageForWallpaper:variant:", v14, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUNamedWallpaperCollectionViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namedWallpaperController:didChooseWallpaper:image:", self, v14, v11);

}

- (HUNamedWallpaperCollectionViewControllerDelegate)delegate
{
  return (HUNamedWallpaperCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)wallpapers
{
  return self->_wallpapers;
}

- (void)setWallpapers:(id)a3
{
  objc_storeStrong((id *)&self->_wallpapers, a3);
}

- (NSMutableDictionary)wallpaperImageCache
{
  return self->_wallpaperImageCache;
}

- (void)setWallpaperImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperImageCache, a3);
}

- (NSArray)wallpaperThumbnails
{
  return self->_wallpaperThumbnails;
}

- (void)setWallpaperThumbnails:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperThumbnails, a3);
}

- (NSMutableDictionary)wallpaperThumbnailCache
{
  return self->_wallpaperThumbnailCache;
}

- (void)setWallpaperThumbnailCache:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperThumbnailCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperThumbnailCache, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnails, 0);
  objc_storeStrong((id *)&self->_wallpaperImageCache, 0);
  objc_storeStrong((id *)&self->_wallpapers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
