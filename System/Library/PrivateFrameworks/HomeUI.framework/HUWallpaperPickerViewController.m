@implementation HUWallpaperPickerViewController

- (HUWallpaperPickerViewController)initWithCollectionType:(int64_t)a3 namedSectionTitle:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HUWallpaperPickerViewController *v11;
  HUWallpaperPickerViewController *v12;
  PHCachingImageManager *v13;
  PHCachingImageManager *imageManager;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUWallpaperPickerViewController;
  v11 = -[HUTableViewController initWithStyle:](&v16, sel_initWithStyle_, 1);
  v12 = v11;
  if (v11)
  {
    v11->_collectionType = a3;
    objc_storeStrong((id *)&v11->_namedSectionTitle, a4);
    v13 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E0CD1488]);
    imageManager = v12->_imageManager;
    v12->_imageManager = v13;

    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (HUWallpaperPickerViewController)initWithStyle:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCollectionType_namedSectionTitle_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUWallpaperPickerViewController.m"), 68, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUWallpaperPickerViewController initWithStyle:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUWallpaperPickerViewController;
  -[HUTableViewController viewDidLoad](&v19, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUWallpaperPickerTitle"), CFSTR("HUWallpaperPickerTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerViewController setTitle:](self, "setTitle:", v3);

  -[HUWallpaperPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeparatorStyle:", 0);

  -[HUWallpaperPickerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v8);

  -[HUWallpaperPickerViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", v10, v12);

  -[HUWallpaperPickerViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forHeaderFooterViewReuseIdentifier:", v14, v16);

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerChangeObserver:", self);

  -[HUWallpaperPickerViewController loadAssetCollections](self, "loadAssetCollections");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)contentSizeCategoryDidChange
{
  id v2;

  -[HUWallpaperPickerViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (BOOL)shouldShowPhotoLibrary
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HUWallpaperPickerViewController currentSectionIdentifiers](self, "currentSectionIdentifiers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;
  void *v7;

  -[HUWallpaperPickerViewController identifierForSection:](self, "identifierForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HUWallpaperPickerNamedSectionIdentifier")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[HUWallpaperPickerViewController assetCollections](self, "assetCollections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count");

  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  HUNamedWallpaperCollectionViewController *v13;
  int64_t v14;
  void *v15;
  double v16;
  HUNamedWallpaperCollectionViewController *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[4];
  id v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HUWallpaperPickerViewController identifierForSection:](self, "identifierForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HUWallpaperPickerNamedSectionIdentifier")))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPickerViewController namedWallpaperController](self, "namedWallpaperController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = [HUNamedWallpaperCollectionViewController alloc];
      v14 = -[HUWallpaperPickerViewController collectionType](self, "collectionType");
      -[HUWallpaperPickerViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "separatorInset");
      v17 = -[HUNamedWallpaperCollectionViewController initWithCollectionType:horizontalInset:delegate:](v13, "initWithCollectionType:horizontalInset:delegate:", v14, self, v16);
      -[HUWallpaperPickerViewController setNamedWallpaperController:](self, "setNamedWallpaperController:", v17);

    }
    -[HUWallpaperPickerViewController namedWallpaperController](self, "namedWallpaperController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setViewController:", v18);

  }
  else
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v20, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPickerViewController assetCollections](self, "assetCollections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v6, "row");

    objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPickerViewController assetCollectionsToAssetFetchResults](self, "assetCollectionsToAssetFetchResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      NSLog(CFSTR("Unable to locate fetch result for asset collection %@"), v23);
    objc_msgSend(v23, "localizedTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitleText:", v26);

    objc_msgSend(v11, "setAccessoryType:", 1);
    objc_msgSend(v11, "setImageSize:", 70.0, 70.0);
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringWithFormat:", CFSTR("%@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDescriptionText:", v29);

    v30 = objc_alloc_init(MEMORY[0x1E0CD1570]);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSortDescriptors:", v32);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v23, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(v11, "imageSize");
      v35 = v34;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "scale");
      v38 = v35 * v37;
      objc_msgSend(v11, "imageSize");
      v40 = v39;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "scale");
      v43 = v40 * v42;

      -[HUWallpaperPickerViewController imageManager](self, "imageManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v48[3] = &unk_1E6F524D8;
      v49 = v11;
      objc_msgSend(v44, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v45, 1, 0, v48, v38, v43);

      v46 = v49;
    }
    else
    {
      HUImageNamed(CFSTR("emptyPhotoAlbum"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v46);
    }

  }
  return v11;
}

void __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E6F4C638;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUWallpaperPhotoCollectionViewController *v14;
  void *v15;
  HUWallpaperPhotoCollectionViewController *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)+[HUWallpaperPickerViewController superclass](HUWallpaperPickerViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v18.receiver = self;
    v18.super_class = (Class)HUWallpaperPickerViewController;
    -[HUWallpaperPickerViewController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, v7, v8);
  }
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);
  -[HUWallpaperPickerViewController identifierForSection:](self, "identifierForSection:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("HUWallpaperPickerPhotosSectionIdentifier")))
  {
    -[HUWallpaperPickerViewController assetCollections](self, "assetCollections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUWallpaperPickerViewController assetCollectionsToAssetFetchResults](self, "assetCollectionsToAssetFetchResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [HUWallpaperPhotoCollectionViewController alloc];
      objc_msgSend(v11, "localizedTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HUWallpaperPhotoCollectionViewController initWithTitle:fetchResult:assetCollectionSubtype:delegate:](v14, "initWithTitle:fetchResult:assetCollectionSubtype:delegate:", v15, v13, objc_msgSend(v11, "assetCollectionSubtype"), self);

      -[HUWallpaperPickerViewController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pushViewController:animated:", v16, 1);

    }
    else
    {
      NSLog(CFSTR("Unable to locate fetch result for asset collection %@"), v11);
    }

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CEA718];
  v7 = a3;
  objc_msgSend(v6, "groupedHeaderConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerViewController identifierForSection:](self, "identifierForSection:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("HUWallpaperPickerNamedSectionIdentifier")))
  {
    -[HUWallpaperPickerViewController namedSectionTitle](self, "namedSectionTitle");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("HUWallpaperPickerPhotosSectionIdentifier")))
    {
      v11 = v8;
      v8 = 0;
      goto LABEL_7;
    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUWallpaperPickerPhotosSection"), CFSTR("HUWallpaperPickerPhotosSection"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(v8, "setText:", v10);
LABEL_7:

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableHeaderFooterViewWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setContentConfiguration:", v8);
  return v14;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke;
  v6[3] = &unk_1E6F4C638;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke_2;
  v8[3] = &unk_1E6F52500;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v7 = v2;
  v11 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 100);

  }
}

void __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "assetCollectionsToAssetFetchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForFetchResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "fetchResultAfterChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetCollectionsToAssetFetchResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v15);

    objc_msgSend(*(id *)(a1 + 40), "currentSectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", CFSTR("HUWallpaperPickerPhotosSectionIdentifier"));

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      NSLog(CFSTR("Received photo change event but have no photo section!"));
    v13 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (void)namedWallpaperController:(id)a3 didChooseWallpaper:(id)a4 image:(id)a5
{
  id v7;
  id v8;
  HUWallpaperEditingViewController *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:]([HUWallpaperEditingViewController alloc], "initWithWallpaper:image:delegate:", v8, v7, self);

  -[HUWallpaperEditingViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 0);
  -[HUWallpaperPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)photoCollectionController:(id)a3 didChooseWallpaper:(id)a4 image:(id)a5
{
  id v7;
  id v8;
  HUWallpaperEditingViewController *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:]([HUWallpaperEditingViewController alloc], "initWithWallpaper:image:delegate:", v8, v7, self);

  -[HUWallpaperEditingViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 0);
  -[HUWallpaperPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[HUWallpaperPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[HUWallpaperPickerViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wallpaperPickerDidFinish:wallpaper:image:", self, v8, v7);

}

- (void)wallpaperEditingDidCancel:(id)a3
{
  -[HUWallpaperPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)currentSectionIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("HUWallpaperPickerNamedSectionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperPickerViewController assetCollections](self, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    objc_msgSend(v3, "addObject:", CFSTR("HUWallpaperPickerPhotosSectionIdentifier"));
  return v3;
}

- (id)identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HUWallpaperPickerViewController currentSectionIdentifiers](self, "currentSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%ld), but only have (%ld) sections"), a3, objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)loadAssetCollections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  -[HUWallpaperPickerViewController assetCollectionsToAssetFetchResults](self, "assetCollectionsToAssetFetchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    NSLog(CFSTR("Asset collections already loaded!"));
    goto LABEL_5;
  }
  -[HUWallpaperPickerViewController assetCollections](self, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __55__HUWallpaperPickerViewController_loadAssetCollections__block_invoke;
  v22 = &unk_1E6F52528;
  v23 = v6;
  v24 = v5;
  v7 = v5;
  v8 = v6;
  v9 = (void (**)(void *, void *))_Block_copy(&v19);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 209, 0, v19, v20, v21, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v10);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 203, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v11);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 210, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v12);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 201, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v13);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 207, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v14);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 211, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v15);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v16);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v17);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 101, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v18);

  -[HUWallpaperPickerViewController setAssetCollectionsToAssetFetchResults:](self, "setAssetCollectionsToAssetFetchResults:", v7);
  -[HUWallpaperPickerViewController setAssetCollections:](self, "setAssetCollections:", v8);

}

void __55__HUWallpaperPickerViewController_loadAssetCollections__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = objc_alloc_init(MEMORY[0x1E0CD1570]);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSortDescriptors:", v10);

        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v7);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v4);
  }

}

- (HUWallpaperPickerViewControllerDelegate)delegate
{
  return (HUWallpaperPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(int64_t)a3
{
  self->_collectionType = a3;
}

- (HUNamedWallpaperCollectionViewController)namedWallpaperController
{
  return self->_namedWallpaperController;
}

- (void)setNamedWallpaperController:(id)a3
{
  objc_storeStrong((id *)&self->_namedWallpaperController, a3);
}

- (NSString)namedSectionTitle
{
  return self->_namedSectionTitle;
}

- (void)setNamedSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (PHCachingImageManager)imageManager
{
  return self->_imageManager;
}

- (void)setImageManager:(id)a3
{
  objc_storeStrong((id *)&self->_imageManager, a3);
}

- (NSMutableDictionary)assetCollectionsToAssetFetchResults
{
  return self->_assetCollectionsToAssetFetchResults;
}

- (void)setAssetCollectionsToAssetFetchResults:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionsToAssetFetchResults, a3);
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (void)setAssetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_assetCollectionsToAssetFetchResults, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_namedSectionTitle, 0);
  objc_storeStrong((id *)&self->_namedWallpaperController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
