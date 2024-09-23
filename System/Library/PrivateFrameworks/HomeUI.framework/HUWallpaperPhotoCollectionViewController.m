@implementation HUWallpaperPhotoCollectionViewController

- (HUWallpaperPhotoCollectionViewController)initWithTitle:(id)a3 fetchResult:(id)a4 assetCollectionSubtype:(int64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  HUWallpaperPhotoCollectionFlowLayout *v13;
  HUWallpaperPhotoCollectionFooterView *v14;
  HUWallpaperPhotoCollectionFooterView *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HUWallpaperPhotoCollectionViewController *v25;
  HUWallpaperPhotoCollectionViewController *v26;
  PHCachingImageManager *v27;
  PHCachingImageManager *imageManager;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[HUWallpaperPhotoCollectionFlowLayout initWithAssetCollectionSubtype:]([HUWallpaperPhotoCollectionFlowLayout alloc], "initWithAssetCollectionSubtype:", a5);
  if ((unint64_t)objc_msgSend(v11, "count") >= 0x33)
  {
    v14 = [HUWallpaperPhotoCollectionFooterView alloc];
    v15 = -[HUWallpaperPhotoCollectionFooterView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v16 = objc_msgSend(v11, "count");
    HULocalizedStringWithFormat(CFSTR("HUWallpaperPhotoCollectionViewControllerFooterFormat"), CFSTR("%lu"), v17, v18, v19, v20, v21, v22, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionFooterView label](v15, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v23);

    -[HUWallpaperPhotoCollectionFooterView systemLayoutSizeFittingSize:](v15, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    -[UICollectionViewFlowLayout setFooterReferenceSize:](v13, "setFooterReferenceSize:");

  }
  v30.receiver = self;
  v30.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  v25 = -[HUWallpaperPhotoCollectionViewController initWithCollectionViewLayout:](&v30, sel_initWithCollectionViewLayout_, v13);
  v26 = v25;
  if (v25)
  {
    objc_storeWeak((id *)&v25->_flowLayout, v13);
    v27 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E0CD1488]);
    imageManager = v26->_imageManager;
    v26->_imageManager = v27;

    objc_storeStrong((id *)&v26->_assetsFetchResult, a4);
    objc_storeWeak((id *)&v26->_delegate, v12);
    v26->_initialScrollToBottom = 1;
    v26->_assetCollectionSubtype = a5;
    -[HUWallpaperPhotoCollectionViewController setTitle:](v26, "setTitle:", v10);
  }

  return v26;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  -[HUWallpaperPhotoCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  -[HUWallpaperPhotoCollectionViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v6);

  -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = *MEMORY[0x1E0CEB3B0];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v8, v9, v11);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlwaysBounceVertical:", 1);

  v15 = -[HUWallpaperPhotoCollectionViewController assetCollectionSubtype](self, "assetCollectionSubtype");
  -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = 8.0;
  if (v15 != 201)
    v18 = 0.0;
  objc_msgSend(v16, "setContentInset:", 8.0, v18, 8.0, v18);

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerChangeObserver:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  -[HUWallpaperPhotoCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[HUWallpaperPhotoCollectionViewController imageDownloadFuture](self, "imageDownloadFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  -[HUWallpaperPhotoCollectionViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  if (-[HUWallpaperPhotoCollectionViewController initialScrollToBottom](self, "initialScrollToBottom"))
  {
    v3 = (void *)MEMORY[0x1E0CB36B0];
    -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForItem:inSection:", objc_msgSend(v4, "numberOfItemsInSection:", 0) - 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 4, 0);

    -[HUWallpaperPhotoCollectionViewController setInitialScrollToBottom:](self, "setInitialScrollToBottom:", 0);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUWallpaperPhotoCollectionViewController assetsFetchResult](self, "assetsFetchResult", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v33[4];
  id v34;
  void *v35;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUWallpaperPhotoCollectionViewController assetsFetchResult](self, "assetsFetchResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "item");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAssetIdentifier:", v14);

  -[HUWallpaperPhotoCollectionViewController flowLayout](self, "flowLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemSize");
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v17 * v19;
  -[HUWallpaperPhotoCollectionViewController flowLayout](self, "flowLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "itemSize");
  v23 = v22;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  v26 = v23 * v25;

  -[HUWallpaperPhotoCollectionViewController imageManager](self, "imageManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __82__HUWallpaperPhotoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v33[3] = &unk_1E6F5F928;
  v28 = v10;
  v34 = v28;
  v35 = v13;
  v29 = v13;
  objc_msgSend(v27, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v29, 0, 0, v33, v20, v26);

  v30 = v35;
  v31 = v28;

  return v31;
}

void __82__HUWallpaperPhotoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v6);

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v8 = a4;
  v9 = *MEMORY[0x1E0CEB3B0];
  v10 = a5;
  v11 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    NSLog(CFSTR("Asked for a view for an unexpected kind: %@"), v8);
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUWallpaperPhotoCollectionViewController assetsFetchResult](self, "assetsFetchResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  HULocalizedStringWithFormat(CFSTR("HUWallpaperPhotoCollectionCount"), CFSTR("%ld"), v17, v18, v19, v20, v21, v22, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "setAllowsSelection:", 0);
  objc_opt_class();
  -[HUWallpaperPhotoCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  -[HUWallpaperPhotoCollectionViewController assetsFetchResult](self, "assetsFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  -[HUWallpaperPhotoCollectionViewController imageFutureForAsset:cloudAllowed:](self, "imageFutureForAsset:cloudAllowed:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reschedule:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v34[3] = &unk_1E6F5F950;
  objc_copyWeak(&v37, location);
  v18 = v11;
  v35 = v18;
  v19 = v13;
  v36 = v19;
  objc_msgSend(v16, "recover:", v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPhotoCollectionViewController setImageDownloadFuture:](self, "setImageDownloadFuture:", v20);

  -[HUWallpaperPhotoCollectionViewController imageDownloadFuture](self, "imageDownloadFuture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_59;
  v31[3] = &unk_1E6F5F978;
  v22 = v6;
  v32 = v22;
  v23 = v18;
  v33 = v23;
  v24 = (id)objc_msgSend(v21, "addCompletionBlock:", v31);

  -[HUWallpaperPhotoCollectionViewController imageDownloadFuture](self, "imageDownloadFuture");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v28[3] = &unk_1E6F5F9A0;
  objc_copyWeak(&v30, location);
  v26 = v19;
  v29 = v26;
  v27 = (id)objc_msgSend(v25, "addSuccessBlock:", v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v37);
  objc_destroyWeak(location);

}

id __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBusy:", 1);
    objc_msgSend(WeakRetained, "imageFutureForAsset:cloudAllowed:", *(_QWORD *)(a1 + 40), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reschedule:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "Failed to load image for asset %@ with error %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_59(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowsSelection:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setBusy:", 0);
}

void __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_alloc(MEMORY[0x1E0D319F0]);
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithType:assetIdentifier:cropInfo:", 1, v7, 0);

  objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processOriginalImageFromWallpaper:originalImage:", v8, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoCollectionController:didChooseWallpaper:image:", WeakRetained, v8, v11);

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HUWallpaperPhotoCollectionViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HUWallpaperPhotoCollectionViewController_photoLibraryDidChange___block_invoke;
  v6[3] = &unk_1E6F4C638;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__HUWallpaperPhotoCollectionViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "assetsFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeDetailsForFetchResult:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v7)
  {
    objc_msgSend(v7, "fetchResultAfterChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAssetsFetchResult:", v5);

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v4 = v7;
  }

}

- (id)imageFutureForAsset:(id)a3 cloudAllowed:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CD15A8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setDeliveryMode:", 1);
  objc_msgSend(v8, "setNetworkAccessAllowed:", v4);
  v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HUWallpaperPhotoCollectionViewController imageManager](self, "imageManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__HUWallpaperPhotoCollectionViewController_imageFutureForAsset_cloudAllowed___block_invoke;
  v13[3] = &unk_1E6F524D8;
  v11 = v9;
  v14 = v11;
  objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v8, v13, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

  return v11;
}

void __77__HUWallpaperPhotoCollectionViewController_imageFutureForAsset_cloudAllowed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v9, "code"), v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v12);
  }

}

- (HUWallpaperPhotoCollectionViewControllerDelegate)delegate
{
  return (HUWallpaperPhotoCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

- (HUWallpaperPhotoCollectionFlowLayout)flowLayout
{
  return (HUWallpaperPhotoCollectionFlowLayout *)objc_loadWeakRetained((id *)&self->_flowLayout);
}

- (void)setFlowLayout:(id)a3
{
  objc_storeWeak((id *)&self->_flowLayout, a3);
}

- (PHCachingImageManager)imageManager
{
  return self->_imageManager;
}

- (void)setImageManager:(id)a3
{
  objc_storeStrong((id *)&self->_imageManager, a3);
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_assetsFetchResult, a3);
}

- (NAFuture)imageDownloadFuture
{
  return self->_imageDownloadFuture;
}

- (void)setImageDownloadFuture:(id)a3
{
  objc_storeStrong((id *)&self->_imageDownloadFuture, a3);
}

- (BOOL)initialScrollToBottom
{
  return self->_initialScrollToBottom;
}

- (void)setInitialScrollToBottom:(BOOL)a3
{
  self->_initialScrollToBottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloadFuture, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_destroyWeak((id *)&self->_flowLayout);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
