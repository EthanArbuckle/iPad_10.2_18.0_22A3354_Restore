@implementation MFPhotoPickerController

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MFPhotoPickerController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, block);
  return (id)log_log_9;
}

void __30__MFPhotoPickerController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;

}

- (MFPhotoPickerController)initWithPhotoPickerProgressManager:(id)a3
{
  id v5;
  id v6;
  MFPhotoPickerController *v7;
  uint64_t v8;
  NSMutableSet *selectedAssetIdentifiers;
  objc_super v11;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v6, "setMinimumLineSpacing:", 1.0);
  objc_msgSend(v6, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v6, "setSectionInsetReference:", 1);
  v11.receiver = self;
  v11.super_class = (Class)MFPhotoPickerController;
  v7 = -[MFPhotoPickerController initWithCollectionViewLayout:](&v11, sel_initWithCollectionViewLayout_, v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    selectedAssetIdentifiers = v7->_selectedAssetIdentifiers;
    v7->_selectedAssetIdentifiers = (NSMutableSet *)v8;

    objc_storeStrong((id *)&v7->_progressManager, a3);
  }

  return v7;
}

- (PHFetchResult)photosFetchResult
{
  PHFetchResult *photosFetchResult;
  void *v4;
  void *v5;
  void *v6;
  PHFetchResult *v7;
  PHFetchResult *v8;

  photosFetchResult = self->_photosFetchResult;
  if (!photosFetchResult)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 209, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setFetchLimit:", 96);
    objc_msgSend(v6, "setReverseSortOrder:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v6);
    v7 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v8 = self->_photosFetchResult;
    self->_photosFetchResult = v7;

    photosFetchResult = self->_photosFetchResult;
  }
  return photosFetchResult;
}

- (PHCachingImageManager)imageManager
{
  PHCachingImageManager *imageManager;
  PHCachingImageManager *v4;
  PHCachingImageManager *v5;

  imageManager = self->_imageManager;
  if (!imageManager)
  {
    v4 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E0CD1488]);
    v5 = self->_imageManager;
    self->_imageManager = v4;

    imageManager = self->_imageManager;
  }
  return imageManager;
}

- (NSSet)selectedAssetIdentifiers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_selectedAssetIdentifiers, "copy");
}

- (void)setPickerDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  char v7;
  char v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_pickerDelegate, obj);
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v8;
    v5 = obj;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFPhotoPickerController;
  -[MFPhotoPickerController loadView](&v16, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPhotoPickerController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[MFPhotoPickerController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsMultipleSelection:", 1);

  -[MFPhotoPickerController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInsetsLayoutMarginsFromSafeArea:", 1);

  -[MFPhotoPickerController collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPhotoPickerController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setHeaderReferenceSize:", v9, 44.0);

  -[MFPhotoPickerController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  +[MFPhotoPickerCell reusableIdentifier](MFPhotoPickerCell, "reusableIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  -[MFPhotoPickerController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  +[MFPhotoPickerSectionHeaderView reusableIdentifier](MFPhotoPickerSectionHeaderView, "reusableIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v14, *MEMORY[0x1E0DC48A8], v15);

  self->_availableWidth = 0.0;
}

- (void)viewDidLoad
{
  MFComposeActionCardTitleView *v3;
  MFComposeActionCardTitleView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFPhotoPickerController;
  -[MFPhotoPickerController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = [MFComposeActionCardTitleView alloc];
  v4 = -[MFComposeActionCardTitleView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PHOTO_PICKER_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeActionCardTitleView titleLabel](v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[MFComposeActionCardTitleView closeButton](v4, "closeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forEvents:", self, sel_close_, 64);

  -[MFPhotoPickerController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleView:", v4);

  -[MFPhotoPickerController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setAutoScrollEdgeTransitionDistance:", 8.0);

  -[MFPhotoPickerController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  -[MFPhotoPickerController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setManualScrollEdgeAppearanceEnabled:", 1);

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
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MFPhotoPickerController;
  -[MFPhotoPickerController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  -[MFPhotoPickerController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[MFPhotoPickerController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v9 = v5 - (v7 + v8);

  -[MFPhotoPickerController availableWidth](self, "availableWidth");
  if (v10 != v9)
  {
    -[MFPhotoPickerController setAvailableWidth:](self, "setAvailableWidth:", v9);
    -[MFPhotoPickerController availableWidth](self, "availableWidth");
    *(float *)&v11 = v11 / 80.0;
    v12 = vcvtms_s32_f32(*(float *)&v11);
    -[MFPhotoPickerController availableWidth](self, "availableWidth");
    v14 = (double)(uint64_t)((v13 - (double)v12 + -1.0) / (double)v12);
    -[MFPhotoPickerController collectionViewLayout](self, "collectionViewLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItemSize:", v14, v14);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;

    -[MFPhotoPickerController setThumbnailSize:](self, "setThumbnailSize:", v18 * v14, v18 * v14);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[MFPhotoPickerController photosFetchResult](self, "photosFetchResult", a3, a4);
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  +[MFPhotoPickerCell reusableIdentifier](MFPhotoPickerCell, "reusableIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFPhotoPickerController photosFetchResult](self, "photosFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "mf_localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRepresentedAssetIdentifier:", v12);
  if ((objc_msgSend(v11, "mediaSubtypes") & 8) != 0)
    v13 = 2;
  else
    v13 = objc_msgSend(v11, "mediaType") == 2;
  objc_msgSend(v9, "setMediaType:", v13);
  -[MFPhotoPickerController selectedAssetIdentifiers](self, "selectedAssetIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v12);

  objc_msgSend(v9, "setSelected:", v15);
  if ((_DWORD)v15)
  {
    -[MFPhotoPickerController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathsForSelectedItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v7);

    if ((v18 & 1) == 0)
    {
      -[MFPhotoPickerController collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);

    }
  }
  -[MFPhotoPickerController imageManager](self, "imageManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPhotoPickerController thumbnailSize](self, "thumbnailSize");
  v22 = v21;
  v24 = v23;
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __65__MFPhotoPickerController_collectionView_cellForItemAtIndexPath___block_invoke;
  v36 = &unk_1E5A69920;
  v25 = v12;
  v37 = v25;
  v26 = v9;
  v38 = v26;
  objc_msgSend(v20, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 1, 0, &v33, v22, v24);

  -[MFPhotoPickerController progressManager](self, "progressManager", v33, v34, v35, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "progressForIndexPath:", v7);
  v29 = v28;

  if (v29 > 0.0)
    objc_msgSend(v26, "setProgress:", v29);
  v30 = v38;
  v31 = v26;

  return v31;
}

void __65__MFPhotoPickerController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "representedAssetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v4);

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 40), "setThumbnailImage:", v5);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  MFPhotoPickerController *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  -[MFPhotoPickerController photosFetchResult](self, "photosFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFPhotoPickerController _visibleCellForIndexPath:collectionView:](self, "_visibleCellForIndexPath:collectionView:", v6, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFPhotoPickerController log](MFPhotoPickerController, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v22, "mf_localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v9;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ selected", buf, 0xCu);

  }
  -[MFPhotoPickerController pickerDelegate](self, "pickerDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPhotoPickerController progressManager](self, "progressManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v31[3] = &unk_1E5A69970;
  v32 = v10;
  v33 = v6;
  v34 = v22;
  v35 = v21;
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  v24[3] = &unk_1E5A699C0;
  v12 = v32;
  v25 = v12;
  v13 = v33;
  v26 = v13;
  v27 = self;
  v14 = v34;
  v28 = v14;
  v15 = v35;
  v29 = v15;
  v16 = v20;
  v30 = v16;
  v17 = +[MFMediaExporter exportAsset:progressHandler:completion:](MFMediaExporter, "exportAsset:progressHandler:completion:", v14, v31, v24);
  +[MFPhotoPickerController log](MFPhotoPickerController, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "mf_localIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v19;
    v38 = 1026;
    v39 = v17;
    _os_log_impl(&dword_1AB96A000, v18, OS_LOG_TYPE_DEFAULT, "Asset %{public}@, PHImageRequestID %{public}d", buf, 0x12u);

  }
  objc_msgSend(v12, "setImageRequestID:forIndexPath:", v17, v13);

}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke(id *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v8[3] = &unk_1E5A69948;
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  v12 = a1[7];
  v14 = a3;
  v6 = v5;
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v8[0], 3221225472, __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_2, &unk_1E5A69948);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performBlock:", v8);

}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "requestExistsForIndexPath:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "mf_localIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "representedAssetIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "isEqualToString:", v3);

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setProgress:forIndexPath:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 72));
      v5 = *(_QWORD *)(a1 + 64);
      if (v5)
        objc_msgSend(*(id *)(a1 + 32), "setExportSession:forIndexPath:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 56), "setProgress:", *(double *)(a1 + 72));
    }
  }
}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cancelEverythingAtIndexPath:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "mf_localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSelectedAssetIdentifier:", v5);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
    v10[3] = &unk_1E5A69998;
    v11 = *(id *)(a1 + 64);
    v6 = *(id *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v12 = v6;
    v13 = v7;
    v14 = v8;
    v15 = v3;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performBlock:", v10);

  }
}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setProgress:", 1.0);
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "mf_localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPicker:didSelectAssetWithIdentifier:mediaInfo:", v3);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MFPhotoPickerController progressManager](self, "progressManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelEverythingAtIndexPath:", v7);

  -[MFPhotoPickerController _visibleCellForIndexPath:collectionView:](self, "_visibleCellForIndexPath:collectionView:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetProgress");
  -[MFPhotoPickerController photosFetchResult](self, "photosFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "mf_localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPhotoPickerController removeSelectedAssetIdentifier:](self, "removeSelectedAssetIdentifier:", v12);

  +[MFPhotoPickerController log](MFPhotoPickerController, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "mf_localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v14;
    _os_log_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ de-selected", (uint8_t *)&v17, 0xCu);

  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    -[MFPhotoPickerController pickerDelegate](self, "pickerDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mf_localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "photoPicker:didDeselectAssetWithIdentifier:", self, v16);

  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  +[MFPhotoPickerSectionHeaderView reusableIdentifier](MFPhotoPickerSectionHeaderView, "reusableIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", *MEMORY[0x1E0DC48A8], v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAllPhotosTarget:action:", self, sel_showSystemImagePicker_);
  return v10;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  id v5;

  -[MFPhotoPickerController systemImagePicker](self, "systemImagePicker", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    -[MFPhotoPickerController pickerDelegate](self, "pickerDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoPickerDidCancelSystemImagePicker:", self);

  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MFPhotoPickerController systemImagePicker](self, "systemImagePicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  +[MFPhotoPickerController log](MFPhotoPickerController, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "System Image Picker, Asset %{public}@ selected", (uint8_t *)&v12, 0xCu);
  }

  -[MFPhotoPickerController pickerDelegate](self, "pickerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoPicker:didSelectAssetWithIdentifier:mediaInfo:", self, v8, v5);

}

- (void)close:(id)a3
{
  id v4;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[MFPhotoPickerController pickerDelegate](self, "pickerDelegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoPickerDidCancel:", self);

  }
}

- (void)showSystemImagePicker:(id)a3
{
  UIImagePickerController *v5;
  UIImagePickerController *systemImagePicker;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MFPhotoPickerController *v14;
  id v15;

  v15 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3880], "mf_systemImagePickerWithSourceType:", 0);
    v5 = (UIImagePickerController *)objc_claimAutoreleasedReturnValue();
    systemImagePicker = self->_systemImagePicker;
    self->_systemImagePicker = v5;

    -[MFPhotoPickerController pickerDelegate](self, "pickerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImagePickerController setDelegate:](self->_systemImagePicker, "setDelegate:", self);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_9;
    objc_msgSend(v7, "presentingViewControllerForPhotoPicker:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    -[MFPhotoPickerController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MFPhotoPickerController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MFPhotoPickerController presentationController](self, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[UIImagePickerController presentationController](self->_systemImagePicker, "presentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v12);

    if (v8)
    {
      v14 = (MFPhotoPickerController *)v8;
      -[MFPhotoPickerController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
LABEL_9:
      v14 = self;
    }
    -[MFPhotoPickerController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", self->_systemImagePicker, 1, 0);

  }
  else
  {
    -[MFPhotoPickerController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v15, 0);
  }

}

- (void)addSelectedAssetIdentifier:(id)a3
{
  -[NSMutableSet addObject:](self->_selectedAssetIdentifiers, "addObject:", a3);
}

- (void)addSelectedAssetIdentifiers:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_selectedAssetIdentifiers, "addObjectsFromArray:", a3);
}

- (void)removeSelectedAssetIdentifier:(id)a3
{
  -[NSMutableSet removeObject:](self->_selectedAssetIdentifiers, "removeObject:", a3);
}

- (void)removeAllSelectedAssetIdentifiers
{
  -[NSMutableSet removeAllObjects](self->_selectedAssetIdentifiers, "removeAllObjects");
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "verticalSizeClass");
  result = 300.0;
  if (v3 == 1)
    return 160.0;
  return result;
}

- (BOOL)_isPresentingInASheet
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[MFPhotoPickerController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_visibleCellForIndexPath:(id)a3 collectionView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "visibleCells", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "indexPathForCell:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "item");
        LODWORD(v13) = v13 == objc_msgSend(v5, "item");

        if ((_DWORD)v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (MFPhotoPickerControllerDelegate)pickerDelegate
{
  return (MFPhotoPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_pickerDelegate);
}

- (void)setPhotosFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_photosFetchResult, a3);
}

- (void)setImageManager:(id)a3
{
  objc_storeStrong((id *)&self->_imageManager, a3);
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

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (UIImagePickerController)systemImagePicker
{
  return self->_systemImagePicker;
}

- (void)setSystemImagePicker:(id)a3
{
  objc_storeStrong((id *)&self->_systemImagePicker, a3);
}

- (MFPhotoPickerProgressManager)progressManager
{
  return self->_progressManager;
}

- (void)setProgressManager:(id)a3
{
  objc_storeStrong((id *)&self->_progressManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->_systemImagePicker, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_photosFetchResult, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
}

@end
